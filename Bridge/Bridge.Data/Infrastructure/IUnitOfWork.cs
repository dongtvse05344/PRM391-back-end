﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Bridge.Data.Infrastructure
{
    public interface IUnitOfWork
    {
        void Commit();
    }
}
