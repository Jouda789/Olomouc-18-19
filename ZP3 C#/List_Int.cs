using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Array;
using System.Threading.Tasks;

namespace ConsoleApp6
{
    public class ListInt
    {
        private int[] storage;
        public int Count { get; private set; }
        private const int MinCapacity = 10;

        public int this[int index]
        {
            get => this.storage[index];
            set => this.storage[index] = value;

        }

        public ListInt(int capacity = MinCapacity)
        {
            this.Count = 0;
            this.storage = new int[Math.Max(capacity, MinCapacity)];
        }

        private void EnsureSize(int size){
       if (this.storage.Length < size)
       Array.Resize(ref this.storage, Math.Max(size, this.Count * 2));
        }

       //public void Add(int item)
       
        public bool Insert(int item, int index)
        {
            if (index < 0 || index > this.Count)
                return false;

            this.EnsureSize(this.Count + 1);
            if (this.Count > 0)
            {
              //  for (var i)
            }
            return true;
        }
    }
}