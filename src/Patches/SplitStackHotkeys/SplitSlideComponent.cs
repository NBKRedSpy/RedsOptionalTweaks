using MGSC;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;

namespace RedsOptionalTweaks.Patches.SplitStackHotkeys
{
    /// <summary>
    /// Component that adds hotkey functionality to the ContextMenuSplitStacksButton slider.
    /// </summary>
    internal class SplitSlideComponent : UpdateComponent<ContextMenuSplitStacksButton>
    {


        private float _leftRepeatTimer = -1f;
        private float _rightRepeatTimer = -1f;

        public override void Update()
        {
            try
            {
                if (HandleArrowKeys()) return;

                // Remaining logic only reacts to fresh key downs
                if (!Input.anyKeyDown) return;

                int amount = Plugin.Config.AmountPresets.FirstOrDefault(x => Input.GetKeyDown(x.Key)).Amount;

                if (amount == 0) return;

                //Somewhat oddly, the right side is the side to keep in the current slot.
                Component._slider.value = ((float)Component._item.StackCount - amount) / Component._item.StackCount;
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError($"Exception in SplitSlideComponent.Update: {ex}");
            }
        }

        /// <summary>
        /// Responsible for detecting the arrow keys and handling their repeat behavior.
        /// </summary>
        /// <returns></returns>
        private bool HandleArrowKeys()
        {

            bool handled = false;

            KeyCode minusKey = Plugin.Config.ReduceAmountKey;
            KeyCode plusKey = Plugin.Config.IncreaseAmountKey;

            // Immediate press handling for arrows
            if (Input.GetKeyDown(minusKey))
            {
                ChangeAmount(false);
                _leftRepeatTimer = Plugin.Config.RepeatDelaySeconds;
                handled = true;
            }
            if (Input.GetKeyDown(plusKey))
            {
                ChangeAmount(true);
                _rightRepeatTimer = Plugin.Config.RepeatDelaySeconds;
                handled = true;
            }

            // Hold-to-repeat handling for arrows
            if (Input.GetKey(minusKey))
            {
                if (_leftRepeatTimer >= 0f)
                {
                    _leftRepeatTimer -= Time.unscaledDeltaTime;
                    if (_leftRepeatTimer <= 0f)
                    {
                        ChangeAmount(false);
                        _leftRepeatTimer = Plugin.Config.RepeatDelaySeconds;
                        handled = true;
                    }
                }
            }
            else
            {
                _leftRepeatTimer = -1f;
            }

            if (Input.GetKey(plusKey))
            {
                if (_rightRepeatTimer >= 0f)
                {
                    _rightRepeatTimer -= Time.unscaledDeltaTime;
                    if (_rightRepeatTimer <= 0f)
                    {
                        ChangeAmount(true);
                        _rightRepeatTimer = Plugin.Config.RepeatDelaySeconds;
                        handled = true;
                    }
                }
            }
            else
            {
                _rightRepeatTimer = -1f;
            }

            return handled;
        }


        /// <summary>
        /// Changes the slider amount by one step.
        /// </summary>
        /// <param name="increase">If true, increases the amount.  Otherwise decreases</param>
        private void ChangeAmount(bool increase)
        {
            SliderWrapper sliderWrapper = Component._sliderWrapper;

            //COPY WARNING: MGSC.SliderWrapper.ProcessInput() This is *similar* to the logic used in that method. (more below)
            //  Current location: area: Line 107 -> "if (axis.x < 0f)"

            //Slightly different as this code uses the _slider's current value instead.
            //  I'm not entirely sure why the game does it this way, but I think the area is for 
            //  joystick/controller input.

            sliderWrapper._currentValue = Mathf.Clamp(
                Component._slider.value + (increase ? sliderWrapper._sliderStep : -sliderWrapper._sliderStep), 
                sliderWrapper._slider.minValue, sliderWrapper._slider.maxValue);
            Component._slider.value = sliderWrapper._currentValue;

            SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.ButtonClick);
        }   

        public static SplitSlideComponent AddTo(ContextMenuSplitStacksButton target)
        {
            var component = target.gameObject.AddComponent<SplitSlideComponent>();
            component.Component = target;
            return component;
        }
    }
}
