using System;

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

        private void EnsureSize(int size)
        {
            if (this.storage.Length < size)
                Array.Resize(ref this.storage, Math.Max(size, this.Count * 2));
        }

        public void Add(int item)
        {
            this.EnsureSize(this.Count + 1);
            this.storage[this.Count] = item;
            this.Count++;
        }

        public bool Insert(int item, int index)
        {
            if (index < 0 || index > this.Count)
                return false;

            this.EnsureSize(this.Count + 1);

            if (this.Count > 0)
            {
                for (var i = this.Count - 1; i >= index; i--)
                    this.storage[i + 1] = this.storage[i];
            }
            this.storage[index] = item;
            this.Count++;
            return true;
        }
    }

    class MainClass
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("ahoj");
        }
    }
}