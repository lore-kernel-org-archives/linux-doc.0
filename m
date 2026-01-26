Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4E30EF85
	for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471248; cv=pass; b=mgQ9PdVSYR1FFk9cCR3u87viWTklBUIPEs5VgAHi+tAlBM0H9b3z/IyTUALf8NkS839s5i5pZYPW++dTAZMCF7RMzvWMu/G9tNY6L0Ka4cgPm2lkBYikI/L7gG9qKreMkWtziBrKrVd8yCFVCu+fWDikOUVn/dmmUZjux+99tUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471248; c=relaxed/simple;
	bh=fG2Ruh+rMXy8HECrlWrSGEzE9JMwnw/wcqEcRF2te3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwiCOQPgrGdkyWmzc6HTfE4klzQV4OoEFpFruAGE5JdtMb/e1o49e/SR9NaYma3Sz9z8Q6sYq+AmPhCWzGark6M1QmHFRsDljWc/xyyR55UTemPRwzNggnoyXafhQS5ZJQstaUMIAzO0rXWrl4bM2UpC1J7IHM+zQSoiewLEM+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPyFHk96; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPyFHk96"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12460a7caa2so7228640c88.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 15:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769471245; cv=none;
        d=google.com; s=arc-20240605;
        b=loC5/vWV2yluXaZpwy8V5iARGQdmzi+cYr/hCxKZdpQr5Crsn+OlzBxzt4DG1Qze4j
         Kxmja1ZCwLtnVxgXOJtGURsdBVXYmKR06zWvd9lj0B5Z4TYpmsq4DSIrlGcms89uTi14
         iIZFQqiV2aPQIjWPfYtq5U7XuD1m5ffWKgaktrdnl4R4WyK/G6OJ8d/cru0eej6fIXUS
         rOH+G60DJU2ulyBtTJ2rH8740gb3CvML0NDIpzaD28ZTPl97myCwivEf5wGCSf9OvfW0
         E1wpnEct52UWiyngu4mR4ctf+MPQmtOgExkyyLcgBtTT5jO0eijJSTPtD7HydM/Ko7S5
         l/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        fh=Y/usLPjqbip/bceAG5GeGhSPXtoxE4RdctNMsqlnGLw=;
        b=HVnt+ihIgxtOJ+3yW4BWmnR1fvPh2kizYU7lSzrLqC4mVHJU4wQrwI5mlxPnEeIxns
         m7jccTJND6iNNbdayNly3UIkVRGgok0aqUU+sTG9YV0+zNrG00G0JKS0tw2BWdiBAPWZ
         wpcxFlCOXxok39xL0RlyakZosUmBySuWzzcRE1Mi0Pit/uLFXPW1TwT7/sn1xjj28/2i
         6mX84SltpukAEZu9JGgqgY7ScGTKYUU/hQ3UmV9SzMx+r9eFIFn23AkVLfmKh4s+Niem
         iCTNv/r8+IQxn1gcYGIt/LL+f4IXik8c08abv6Gtdn/Tm1JmCjmQpD0KSeAxOPKws/M6
         tiBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769471245; x=1770076045; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        b=QPyFHk96UvMrpMwkoIa7K76IVIsyFEnfZylNFV5QMW6rzMt1q1yhPRJPbtVPkVYr37
         QQih6C5oGngtDrT2O6TJ/NmalrhezMNkb25dAEFdF2KrioK3GhDmedvDZGFMwEh3ihqY
         JVQlTZ1GsSZw62zjipX4WnEYc1xlFLHZ/rBXw+v03T9uvrvWmt9jJfxjhDBTrivMhecH
         xY5XiTzs4FuuW3ITTswqPixr9Dy8rk2WBhWOlxNNBc7UF3/u5o1AfjHwCch4TOYbauT2
         KWPjRIH+OaDaBKqKOStCJSGsldadRt4KZBNG7dUZlgqW5w7DYgS30qdNee0ahFDUD1nl
         VIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769471245; x=1770076045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        b=JiPwxQZS4+SK2DSQbSll7hSaVAlO376vxou/79qy/BLnkbYkU/CCcgsv5SaGSEGxpU
         X+wzw7DNMylRmZDKNlFlEUjxjm0MSuuvkSQ9Lt63iDzFM+w+K2ejavF7r5p1kzW4pAxl
         t+Ys+L0+MzEW58tZXwpYVOU22n0TuI6mPO082rWk2Fh0HvzZBwqFSoRXhclbtJ0Zv7S4
         pCNTwo2YeZ5eL1qtO+WvB3KeI2F1VGGPtbUjvTcAzAIMA+OuAa4PU1/Ksi1ThYecqe5L
         Xu0HSQMdUNjdco60KXmlRvQPPM6+OMUclOBhvrcOUVRVjvA+VCrLAsJNicuVMFq/iHnn
         8scw==
X-Forwarded-Encrypted: i=1; AJvYcCUmbDd+37JJ0Ao4ZSa8MErr3SH+NAWKBf0KLNPeol+EPDdgcJz2wWh1nVpuCSK6B+A8kVYgl8MwmSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBfH3gE0WQAHPUoGFNmhGlep8URo0f3dQ+Cl/ERKE2A0D9MPj
	GDRCxrZLGe8KfC++b7VUEy5gtmeL/YTXO7QPGu/MG/J58LUzVm6R/hAdbk60ClH2nXiPbDhZaKG
	00D8dgeNf/+9B46efgAoHwSnnC6zP4xn84OAtKijA
X-Gm-Gg: AZuq6aLjcO50nKt0bzsRjFjOkW3MlMlAJ5xnGOnvKVXBFyx0W7cgnhFnS/eqeG4Y+Aj
	BA7w41aZGt3acSSwWe2RFoylGY8g5cpoofrWRl0AxgvBC9CmjgHXrWeunPUq2as0JuoIWAxyTYu
	zcVujN/4+Uw0c3rkWWvTx+AU4YFgFA/N3zR8wK7Lw1ckE95NNY5V1tgdCzEHiYeC3V43xlg1bPm
	8XKG4TI6WfsBUL7c0hvCwMKch62nprk/gY2gpOI0tt9VV32G0053Nv/lGtkgUqNR4ihm9LZi+c2
	E22WJQELxhXCwCZqMmFaaCinaOo26lWsprH+sQ==
X-Received: by 2002:a05:7022:eb46:20b0:124:9e46:82fb with SMTP id
 a92af1059eb24-1249e468815mr157327c88.38.1769471245289; Mon, 26 Jan 2026
 15:47:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-16-elver@google.com>
 <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org> <aXez9fSxdfu5-Boo@elver.google.com>
 <8c1bbab4-4615-4518-b773-a006d1402b8b@acm.org> <20260126213556.GQ171111@noisy.programming.kicks-ass.net>
In-Reply-To: <20260126213556.GQ171111@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 00:46:49 +0100
X-Gm-Features: AZwV_QgcknJe0PlLV-z7bksgFQT7uSnaZ1B5QvyI9tPRocr5FzcCAIEUg9yCt-Y
Message-ID: <CANpmjNPs9CtY1w1-MqL1-CnHVFLxXoA2rbd6d2w4wfxT8AP0ew@mail.gmail.com>
Subject: Re: [PATCH v5 15/36] srcu: Support Clang's context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 22:36, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jan 26, 2026 at 10:54:56AM -0800, Bart Van Assche wrote:
>
> > Has it ever been considered to add support in the clang compiler for a
> > variant of __must_hold() that expresses that one of two capabilities
> > must be held by the caller? I think that would remove the need to
> > annotate SRCU update-side code with __acquire_shared(ssp) and
> > __release_shared(ssp).
>
> Right, I think I've asked for logical operators like that. Although I
> think it was in the __guarded_by() clause rather than the __must_hold().
> Both || and && would be nice to have ;-)

Some attributes take multiple arguments (__must_hold does), though
__guarded_by doesn't. Yet, && can still be had with adding it multiple
times e.g. '__guarded_by(pi_lock) __guarded_by(rq->__lock)'.

Only thing that doesn't exist is ||. I think the syntax you ask for
won't fly, but I can add it to the backlog to investigate an _any
variant of these attributes. Don't hold your breath though, given the
time it takes to land all that in a released Clang version.

> Specifically, I think I asked for something like:
>
>         cpumask_t       cpus_allowed __guarded_by(pi_lock && rq->__lock)
>                                      __guarded_shared_by(pi_lock || rq->__lock);
>
>
> I think Marco's suggestion was to use 'fake' locks to mimic those
> semantics.
