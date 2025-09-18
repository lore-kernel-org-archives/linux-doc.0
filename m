Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3AF2222B4
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758232393; cv=none; b=OMQLMS1+hwGQERKOzsEaDGAa1+eP/bO6a6vvqxX2cbFhIX49PzOtzH90/6E9PQVHJVjw9mpPi4kdA2xIg4kE/r0IVlxmvBJ3SbWr+FahT2ibmVHPjDF529/oycRlLCNJn4GAxc9yDMTnJW3JlnMzyEQ9udZbVc0O5x0m0kWfKMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758232393; c=relaxed/simple;
	bh=OBdCMGeWv7G/tkOmZiDbcUQKLH/CnWF06gVEbnVu89c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZLP3WzvTbxr56TiM3LxEW1l0TWvoGkS1g/IdQmVa0W9CvxVEb22g9xL8Xgl4G2IUZwq2aPbbFONaJ5W65fh2F+Hy0TeZnOOw9huzZkbGwbk/nptdwsDERExoT4ippW/YTGL62WIatyeOIerr6UMmCssf9rm6AyGIqQUySnZzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EAa0YF35; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EAa0YF35"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1797005e87.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758232389; x=1758837189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mLiszfQw8YctXWgw7Rv1CzeIAYsEhv/enJDimwborHo=;
        b=EAa0YF35X3B4dhLliCr6+gjlm1egWOy2/cSxo2UqBQym8ac0RaWsXy3prghYtXgUYs
         aYkKqOYXl6YQ2H/Xozv/dnpZap8dDSgllR2vzh3cj89DeP3xF3iwKw3I6DSmo/U0hAX2
         V3IS8s3NJ5FEJ+LkJlXVWWQTIXoxTkk6aHiBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758232389; x=1758837189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLiszfQw8YctXWgw7Rv1CzeIAYsEhv/enJDimwborHo=;
        b=L2TnODy/32Qrrz05211/+6VC0OIc0t1bAdVNRFBOgJelAkkVsPnEF2cpfHcw+naZdg
         LCosFrvThYpvnfRVlsqYHlYiXtG8T4fjuoAL9xtpTbjF9FF6Xlhyd6sKGOwOE/sIlUPS
         rLLgHO00JFHer4pmmWKo4aBYKVzbL+somt6J3f9RwhTSNXoF7RPOGoBBny8QOKFz+MGE
         1Cb8XfnziC5teEhb/H96AKdwG182i5Dd+mO3ezkN4rPcIFqvIlFaJhUJyadutcmgMhqd
         flm7WS1yr1Jzga9016oLhAdvO+3yEuZWWsv7CaVJhRTYPnv64BH6JE49pzL2T6TvkIA0
         xygA==
X-Forwarded-Encrypted: i=1; AJvYcCU34nCCCC2ljHiIjTFIXUcPb5kjPcYVpcn5ozMn8K4BO/SMorz98s9iKcFM6AWjtjyCnrkh8SfAbko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Z6kB9XO+np/5qGov1Gw+6JA5Ta/jdu4arp260WYMTqVU9jlp
	foutYghfwxarpHg8xbai4ldkK8RjLAxNJ6t2/Vk79GbamYSUEEJsfMgGQQpYT/XlYPdc94R6E/z
	wJW0oRJ0qsw==
X-Gm-Gg: ASbGncukl0UeJYB3sbUY6WhhBp0fm//tFV1PmH5s7TXjsrSV4PL20/H/cha3NhFG/GS
	Tnl3hdmg5RSo7kVd0uOtVMKpR7lgH2K0Mmnlj8sCWb1GjvnvHdCzPbgkcZafQ5QkRyeo8EwPJLQ
	PGBERht1nE+KSjs7BabSXVzOBGLsMaIsvRsDMUm2PQEGHyR3moUDMVLit33rmUEyVovYasGzSov
	OBUfHrBtveeEME38/R7CgPUVReDnpEFpEdy9oa5FRK+nsc5CefUWllFqJX//3m3ysOllHJPT1X4
	b8v7nSpB3BKMxTT2SS3rhCdeGhCGyh3+aYljpAAsL7vNE23L9TZa0BMmFPWmdnjTV7AHFJVZ8vb
	KJ4ykTwdbI3VF5WjqD5snSvDBs9RopRgdJyibYkfoxFG+tAqe8hIyAHH9P/nL+6NiyAU/AvzrsL
	Tk+/ellHherz8mi+c=
X-Google-Smtp-Source: AGHT+IE6v5jn2PsNEuKSH2dro4AnzY+at3OpRDqqjaslVgKTuYGmK5hcq//R0ycKekKGq2AQph7CZw==
X-Received: by 2002:a05:6512:6713:b0:57a:3d7e:7275 with SMTP id 2adb3069b0e04-57a3d7e762emr10267e87.36.1758232388401;
        Thu, 18 Sep 2025 14:53:08 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a65070d2sm943679e87.37.2025.09.18.14.53.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 14:53:08 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso1637450e87.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 14:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXibi0IBNBHHzhD9WrbaylHRP3khc88XqZHt+OQjW1WvcgQBhZULeIxTQ42jsUcVY5z35hvDX1vOAo=@vger.kernel.org
X-Received: by 2002:a17:906:dc89:b0:b0f:a22a:4c30 with SMTP id
 a640c23a62f3a-b24f5685fdemr62738866b.47.1758232077501; Thu, 18 Sep 2025
 14:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com>
In-Reply-To: <aMx4-B_WAtX2aiKx@elver.google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Sep 2025 14:47:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
X-Gm-Features: AS18NWBxHuMwwtU-EoNbPFA3uJ1YRJkAKqdurj12n-PWNJgH6ecKwZ8QZrX3P28
Message-ID: <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
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

On Thu, 18 Sept 2025 at 14:26, Marco Elver <elver@google.com> wrote:
>
> Fair points. "Context Analysis" makes sense, but it makes the thing
> (e.g. lock) used to establish that context a little awkward to refer to
> -- see half-baked attempt at reworking the documentation below.

Yeah, I agree that some of that reads more than a bit oddly.

I wonder if we could talk about "context analysis", but then when
discussing what is *held* for a particular context, call that a
"context token" or something like that?

But I don't mind your "Context guard" notion either. I'm not loving
it, but it's not offensive to me either.

Then the language would be feel fairly straightforward,

Eg:

> +Context analysis is a way to specify permissibility of operations to depend on
> +contexts being held (or not held).

That "contexts being held" sounds odd, but talking about "context
markers", or "context tokens" would seem natural.

An alternative would be to not talk about markers / tokens / guards at
all, but simply about a context being *active*.

IOW, instead of wording it like this:

> +The set of contexts that are actually held by a given thread at a given point
> +in program execution is a run-time concept.

that talks about "being held", you could just state it in the sense of
the "set of contexts being active", and that immediately reads fairly
naturally, doesn't it?

Because a context is a *state* you are in, it's not something you hold on to.

The tokens - or whatever - would be only some internal implementation
detail of how the compiler keeps track of which state is active, not
the conceptual idea itself.

So you name states, and you have functions to mark those context
states as being entered or exited, but you don't really even have to
talk about "holding" anything.

No?

               Linus
