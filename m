Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0030CB40
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210610; cv=none; b=OCMAIGaCNv3rsBFhW50XniQ50O0mTzI1ArmllU8HS3uo1IXOgqAraPoCuE1OUVk8vsWDAhPV7yvPK/uHU4l/zmqKcoriK4j4tlUMGimYH2FTkUKfu9ioAIo6mf0qwfd5SSzCRWH1/lWhontUeeO3GX19sS+SMJ6Gr3BwgyXaDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210610; c=relaxed/simple;
	bh=XhR1h2E8azi9+Iqslf03I/SakVc5s2CaBmw/N8HkwwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAarjinWOh2yIM8G40nOa3lyc6RQLorDfTkXakS3I8YL4XYivDAUKZa8TPFccuS+E5t876LGdQThQsuTjHjWnhot5f3nT3w3oqPwVos+KBiAcqE6IqPwdRjIGA5iJEaClgVeiBG5c3KCGXvxNrp0EmFLZhaxmc+luyBefuQK2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AClcN8KD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AClcN8KD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso4275479a12.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758210605; x=1758815405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpKO6CsQCuex3g+QZ22KGPC+ZgcKRmVKS1THDCqCkXc=;
        b=AClcN8KDRTnjZri2G/hiw6s4u9/IiU1/499CfOAdO7Pk91fWkkiOgw5E14Zftl5iRa
         d3zNu4iE/k0xZ46G7BEmUrexCFTBFiMvmyywDaNrTq/VoQc/zFr+bjJLcVKZ1+rlUC11
         iFggz2pTOULHCiJwzqt4bKFwb0E3M02lsP6bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210605; x=1758815405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpKO6CsQCuex3g+QZ22KGPC+ZgcKRmVKS1THDCqCkXc=;
        b=oNtCSU4v+hR0aiWGM2j44+gM2zIfyPAkZplht5uWc5cRhtz+6YqBh89ZgRSPbripFm
         zKtozJBOcS9LilvSE29nsI9GF8Jt4kpy4wsEMZbGzsURqwaVkXEGgwEYzQLJckp+1k5v
         IL2WXi51yq5zteBQov/RLzenw/D8UYLbyJPvgDbhflrUMY6ePBboWQj4s0uXL/9wl37i
         H80NYVECnfZFPx4JgbFTSoG56f4+DJqz43AeTxq2DE+y4e9E9oBXCY7sGoa0sa0DH4z9
         +ifxux4zeJAXruWwdZ+cJTTh12l1Rp52XQxjT/sKr7zPZZbvPO9pEGUn8IXRYIAtebDm
         mTWA==
X-Forwarded-Encrypted: i=1; AJvYcCXnJzVgi8UZygm6JMWdfp6EPl3VUWOBe1uyiEh1sE47ogrf5C0Iu+VkIn0tYgGDPpU6uz/P6o/TvzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFpiLXFr3klClHCd7muS7KLMl1nDE19jm45QICJOn0n3fmiaJJ
	X5e+ZqNjGyBFmNYyCuWYFsNk6kF7eWLJSmcm7IwIbQ11+xvHujCZ1tEk//ibdhe4YyMwpNLetfl
	8DLCT
X-Gm-Gg: ASbGncsAKf0PkpEJd5tuJEMwADmvXPstuhTlWYftJOkHAbwH7+YJXUHha00GLUYNHN1
	aHC/BqjUm0IeXSKMRj0PYrkF3pZvfQADFNfAYw1AlTpXvx6zzktPL5do7nIHezVDOnybHTi6vNE
	Az2044M+KLAdr56uQyeQtA4F2yuzL98vHoRz1xX+VQSmJ6nN0wFtB6T7+4u7KAcSka1MSo1Lpz5
	791AizwqRLJBZmHlmCjRaOG5PVNMK/PEML5AtQ5/BrbY6C19JZvBh/oX2S/DAVQe8pcnRRfK61r
	HGtUNTaTvTUvylXUT8AId2bGwIUvIhuoMUZuwa5IRF7sraFOXoyYCIFeP3bcYA7+pFdPQBb2AiS
	+ehbR4UT8/aUNRyY9S/m1aQvvZknx+nGopYNt5RQR+EKEzP/q7PhYk9PU1f8GRJjgOujOjebfC9
	L0CWLO8kAt0MMVmRg=
X-Google-Smtp-Source: AGHT+IG5v0id0DvMggOnZg68fqmGtbQRBqDBuaTsDrW3iUl2JHafqzNsgIiM3IqkqKNhZLpxkt9B0Q==
X-Received: by 2002:a05:6402:20cd:b0:62f:a06a:5359 with SMTP id 4fb4d7f45d1cf-62fbe458ab3mr124991a12.11.1758210605168;
        Thu, 18 Sep 2025 08:50:05 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa52827bfsm1684542a12.0.2025.09.18.08.50.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:50:03 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07e3a77b72so319421966b.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 08:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF2uS+oI42SPqvIZHQXwEtiWGuCxgDCnnorX4Ah+OFwKSGA0vv9H/KeawGbW0yvWSy8Je0lEGmcEo=@vger.kernel.org
X-Received: by 2002:a17:907:9612:b0:b10:ecc6:5d8d with SMTP id
 a640c23a62f3a-b1fac9c9b84mr417765966b.26.1758210601571; Thu, 18 Sep 2025
 08:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Sep 2025 08:49:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
X-Gm-Features: AS18NWBk4u9ObN57KesSGhJyt-aPlWZgKdxYhvzpAyoaxlNUF53WHe4dSKjzUBg
Message-ID: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
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
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 07:05, Marco Elver <elver@google.com> wrote:
>
> Capability analysis is a C language extension, which enables statically
> checking that user-definable "capabilities" are acquired and released where
> required. An obvious application is lock-safety checking for the kernel's
> various synchronization primitives (each of which represents a "capability"),
> and checking that locking rules are not violated.
>
> Clang originally called the feature "Thread Safety Analysis" [1],

So this looks really interesting, but I absolutely *hate* the new
"capability" name.

We have existing and traditional - and very very different - meaning
of "capabilities" in the kernel, and having this thing called
"capability" is just wrong. Particularly as it then talks about
"acquiring capabilities" - which is *EXACTLY* what our lon-existing
capabilities are all about, but are something entirely and totally
different.

So please - call it something else. Even if clang then calls it
'capability analysis", within the context of a kernel, please ignore
that, and call it something that makes more sense (I don't think
"capabilities" make sense even in the context of clang, but hey,
that's _their_ choice - but we should not then take that bad choice
and run with it).

Sparse called it "context analysis", and while the "analysis" part is
debatable - sparse never did much anything clever enough to merit
calling it analysis - at least the "context" part of the name is I
think somewhat sane.

Because it's about making decisions based on the context the code runs in.

But I'm certainly not married to the "context" name either. I'd still
claim it makes more sense than "capability", but the real problem with
"capability" isn't that it doesn't make sense, it's that we already
*HAVE* that as a concept, and old and traditional use is important.

But we do use the word "context" in this context quite widely even
outside of the sparse usage, ie that's what we say when we talk about
things like locking and RCU (ie we talk about running in "process
context", or about "interrupt context" etc). That's obviously where
the sparse naming comes from - it's not like sparse made that up.

So I'm really happy to see compilers start exposing these kinds of
interfaces, and the patches look sane apart from the absolutely
horrible and unacceptable name. Really - there is no way in hell we
can call this "capability" in a kernel context.

I'd suggest just doing a search-and-replace of 's/capability/context/'
and it would already make things a ton better. But maybe there are
better names for this still?

I mean, even apart from the fact that we have an existing meaning for
"capability", just look at the documentation patch, and read the first
sentence:

  Capability analysis is a C language extension, which enables statically
  checking that user-definable "capabilities" are acquired and released where
  required.

and just from a plain English language standpoint, the word
"capability" makes zero sense. I think you even realized that, in that
you put that word in quotes, because it's _so_ nonsensical.

And if not "context", maybe some other word? But really, absolutely
*not* "capability". Because that's just crazy talk.

Please? Because other than this naming issue, I think this really is a
good idea.

           Linus
