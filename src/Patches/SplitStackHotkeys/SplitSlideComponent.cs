using MGSC;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

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
            if (HandleArrowKeys()) return;

            // Remaining logic only reacts to fresh key downs
            if (!Input.anyKeyDown) return;

            int amount = Plugin.Config.AmountPresets.FirstOrDefault(x => Input.GetKeyDown(x.Key)).Amount;

            if (amount == 0) return;

            //Somewhat oddly, the right side is the side to keep in the current slot.
            Component._slider.value = ((float)Component._item.StackCount - amount) / Component._item.StackCount;
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
                StepLeft();
                _leftRepeatTimer = Plugin.Config.RepeatDelaySeconds;
                handled = true;
            }
            if (Input.GetKeyDown(plusKey))
            {
                StepRight();
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
                        StepLeft();
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
                        StepRight();
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

        private void StepLeft()
        {
            Component._slider.value -= Component._sliderWrapper.IsInteractable ? Component._sliderWrapper._sliderStep : 0f;
        }

        private void StepRight()
        {
            Component._slider.value += Component._sliderWrapper.IsInteractable ? Component._sliderWrapper._sliderStep : 0f;
        }

        public static SplitSlideComponent AddTo(ContextMenuSplitStacksButton target)
        {
            var component = target.gameObject.AddComponent<SplitSlideComponent>();
            component.Component = target;
            return component;
        }
    }
}
