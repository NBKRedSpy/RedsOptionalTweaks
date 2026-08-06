using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RedsOptionalTweaks.Utils
{
    /// <summary>
    /// Convention based attribute to indicate code is a copy from the game's code.
    /// Used for automated game change conflict detection.
    /// </summary>
    /// <remarks>Included in class to reduce dependencies</remarks>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true)]
    public class CopyWarning : Attribute
    {

        public Type Type { get; set; }

        public string MethodName { get; set; }

        public CopyWarning(Type type, string methodName) 
        {
            Type = type;
            MethodName = methodName;
        }
    }
}
