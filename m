Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3B30DEB9
	for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765536550; cv=none; b=PeWRBynYRr9mefizgwR48tUcOocBpBt5UZwNXICZwZ3ykN4TC61hgbjPiXnlhnrXMnYuAkw7oONF8AmIWc7iL9ueBUQnHWQS0gQCF1FLvdEF2Kz5wJH0m4Ynd829N6Jaqyt6HoTsm239r3g11p/4wRL3f368N7xBl9n7zLq/SoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765536550; c=relaxed/simple;
	bh=av9hKN2hbVjrZk+A7S1PV353SLAqNrjc7QnZ5XIVFLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cf9d6QjchQ/EwTf4FT4C9JDHpS2sMXRTyH0uyMqEnfMSTm55dpgT87EeVo3/pVmXXqTlPHCvIN1qu1okPcGBcjwjskgrjEZmapcp9NaDlLtwagITuH60im/ppHj6SRqBPqWVcWPPQufN8NpPqKJyMI7ZLLmNjiabR0VU0BI6pso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=thRUkRx0; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="thRUkRx0"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso1033860a12.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 02:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765536548; x=1766141348; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SA48npp6esm0XDSNny8uE3VVilMK0KzCGLSxi6mYbKY=;
        b=thRUkRx0uXjqWLwLYTxYGwAZyyoDS3T9uB/c4Lz5Qa3InFtQsgHEoLl52TEwSpTLlP
         uRjzZVhgD0M/asCP3+KcbDWNG7KdhW3NC+KLHM+GW6wJnhpqVD4ggvKDkNMZXnjTX/HR
         os9eyPjV4jWYDL5KB6YOGe614ciEIhrjEeI2xIpR4UihZuhvrYTjS8Wwu9mb8AFZXQ9v
         t5GJNx8PYH4Dr6v9xIYzLZLYtzEJLpMdKOpeFbVQc7NzAQ1ep/a3bmczB3HrJqFBuA9r
         Wz6B8HSizDzGuTzA56W8X40Zdw5ntj/g0B6LheZVQMfcAQVXjB3X3WrxRApQQrYax4Yn
         FJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765536548; x=1766141348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA48npp6esm0XDSNny8uE3VVilMK0KzCGLSxi6mYbKY=;
        b=YdhEkhrXslZK7kyu3f1G+HkEeTBBrn0iArH+9GAA9T8+XrrwOSDGAmIzHRGWy4nUHI
         Aq0WARyIvY6x7lHaW2WO9mR420vFSVCiU1ojM6CRZfSr9ubOuk60Bbh5A0ugVMm/9bLn
         n4ZDK1b+NF0HwAyQCljDXxO9ITir8/NIuJ2yx5FKsmyPeHdbRhawHwdYEG4ivVLjYpeN
         OTF0ND+4Rdng/wqEF/uA0SAzM5pCvfgLrb+pEOpLNZoeQQoki+MYtmcNFgkk4u+mCkZv
         FOy7WnoHba2+HfCdc+pNWnGy55r3mdA+aAe8I9hJmLPaLw5Bt6+jwaHMd9f+dja8Aqo0
         REJw==
X-Forwarded-Encrypted: i=1; AJvYcCX4XrLLT/qAIkmz/HH/zdKVZHfdbBIs943H+vJfM56QdplPUzftbfc2l+bUvx9ZrsI29yzNdbrrt9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+sLVmwTcesXRx7OV4QcP1qvn90hNzqEVqBZ/F+pPDkYYSFDg
	PFD2DNNTxX3z3moO2DjHd1bl2OwDGV8vRtHcWjgcrc8pDebobA7h/f111qM1cgPK7vpkBqPRqWi
	cCu09Wzh/jr3/YE5JhPuuXOMCOGas2kdpA2PTMolb
X-Gm-Gg: AY/fxX7pSrOM2x2r9A1wXKffg09kGfwUrkZup0Z4B0QlXeEBPmmdLUMwRSlAXi51RIJ
	+xwzQgWt7/VdEvyq71qHQxSp97+z7MNmtR52wjeARr8dvpb3i1QjqQPgedxx/91txLGSyxdT6EN
	9nJVIxMy8mEpvcLuXdBAwCSnrmN5Buk7u3HWRSKNmZlMyEFzJGPBIUIHWDNsfaJFPjw92E4AENp
	fc2tb1YIByvNNVkTT9xS1/WZJ58pwcNkw1K8Z1QcIdRPeKs48KEOtOFKkq2QPCiXJORicJ54PGi
	rHnhF0qCrZqbTQLnJ3NMIHPdOco=
X-Google-Smtp-Source: AGHT+IEmwt/cYGSRMcLEQwRoz4IOBPZmG6ZdFUXvSQgttHHtD3I/ZoiZY45lTyY+63ShMc7m2jk9oXMIHs1yDaFc4yU=
X-Received: by 2002:a05:7301:6781:b0:2ac:2e93:29bf with SMTP id
 5a478bee46e88-2ac300f946dmr1219192eec.22.1765536547134; Fri, 12 Dec 2025
 02:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251120151033.3840508-8-elver@google.com> <20251211114302.GC3911114@noisy.programming.kicks-ass.net>
 <CANpmjNObaGarY1_niCkgEXMNm2bLAVwKwQsLVYekE=Ce6y3ehQ@mail.gmail.com> <20251212095943.GM3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251212095943.GM3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 12 Dec 2025 11:48:29 +0100
X-Gm-Features: AQt7F2qCLUKQusRsTOkfVyHaXl__KgFtQ_SoVZmDpwKuRXcKmzXhASdee3aZVrU
Message-ID: <CANpmjNMY55ytuWPh15O-tTe5zEQx3AN6LqrvB9NJ6dm6BsPnsA@mail.gmail.com>
Subject: Re: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Dec 2025 at 10:59, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Dec 11, 2025 at 02:24:57PM +0100, Marco Elver wrote:
>
> > > It is *NOT* (as the clang naming suggests) an assertion of holding the
> > > lock (which is requires_ctx), but rather an annotation that forces the
> > > ctx to be considered held.
> >
> > Noted. I'll add some appropriate wording above the
> > __assumes_ctx_guard() attribute, so this is not lost in the commit
> > logs.
>
> On IRC you stated:
>
> <melver> peterz: 'assume' just forces the compiler to think something is
>   held, whether or not it is then becomes the programmer's problem. we
>   need it in 2 places at least: for the runtime assertions (to help
>   patterns beyond the compiler's static reasoning abilities), and for
>   initialization (so we can access guarded variables right after
>   initialization; nobody should hold the lock yet)
>
> I'm really not much a fan of that init hack either ;-)
>
> Once we get the scope crap working sanely, I would much rather we move
> to something like:
>
>         scoped_guard (spinlock_init, &foo->lock) {
>                 // init foo fields
>         }
>
> or perhaps:
>
>         guard(mutex_init)(&bar->lock);
>         // init until end of current scope
>
> Where this latter form is very similar to the current semantics where
> mutex_init() will implicitly 'leak' the holding of the lock. But the
> former gives more control where we need it.

I like it. It would also more clearly denote where initialization
start+ends if not confined to a dedicated function.
