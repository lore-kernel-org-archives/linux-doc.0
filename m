Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206A53128BF
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459209; cv=none; b=ecb5BkTnuhL9qVEjs39jbc/M4xYEI3pbK0UXf68CrpmkkxezE6jsBUx9RUMAIfMGI/jXHn7m7P39AZGlf6mtN4mH1hTfSQi4Uu0uGxgGJZcjsxxqjemFjIX+LQPi0d6vv+FZXTURJoUOsrqxOHsbO5cLg1V3sncElgllM1s615U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459209; c=relaxed/simple;
	bh=xRpDisg42q3mlm2OwRhnv/Ng4aisbLnak6Lk2WbPerY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prSx9U3MAuE1Q8drn+nzHwdzSNH/gdwfO61EsDsW04uo5m3lWcysX6fDn+WRm6sFSnXIF84Xi42lp6Su5INJ0Ub+Uo/OEfXDVaubs7cdusyd1JUe2VGHWKNAWa2kypwVyRwnwBe87NX8Tt4YIHWU3xOv/b88sdUEJfZPFsCx0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HflTkvn8; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HflTkvn8"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78c5b5c1eccso1098587b3.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 05:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765459207; x=1766064007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aINMqpJxr1DSJJ7CC9TS1ttoat4qqoJbgL8dBerwdo8=;
        b=HflTkvn8hEQ5fY2RqhhszTXvTmLEvYgLZxCMcnDSLfuaLZuIErpFKXRxgf+UuHaC0O
         ZWeKNTs7qu+FT9MSt5UmeiYJQKzWSBhC49Im5iu+3YkzkxQJhXdRdqpSfKuiJ0WxI64c
         kPOlp4Q3bHCs0CYCUUh/Qt6ROZppFoOT9wu966KN8irGVJ58lhvNKcFIWsNtE19V++73
         OzRACFkmqDfIBaa2T9UEy6OzZdNiqJoxxuSB3FFZjmsiv7nibC0FHtgSTm4nffmNRTv/
         M/Dgzvj4OkQWQV3C3r/DSGsRc6QP/dXuVQAJsTnrvMWXM2YYqklOjG4eMkTYB2TDgvWU
         Ghlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459207; x=1766064007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aINMqpJxr1DSJJ7CC9TS1ttoat4qqoJbgL8dBerwdo8=;
        b=G+RiJ4hqsW5xFZfrcJSZSuF5gwucu5yDw5Cb3Cb3PbzdkA5TwgQEHFT5kuvKVJcKkK
         L0Ykt7wDQGeVpxJ8ZQYAoYT5XPJ+HuwKWF27+hCLEAlnMScJOEic61VeT4psf0e9szUL
         gNiKCvD4aw7ezhnQAf1z8+/Xl+pqlxiAopf997zKE7TpPdZjoaRr+Vtb+qARoy3WUlKE
         6+Xx7EghDFLcw/Dc+/JWbahC9wpGvDDZjZ6Y/5BlWtfNNcQ52+sYvKdAJf0YbF8IxKNq
         krqJy1/Hiwc8S7OKH9fZiByHFjM5fxR2V86n0k9VY4V1Tb+YIaREBK43/tgyc6RElTv2
         50MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlZFEanYmKQKpdLvu+Sf5YxI4+a7BU3+neL1nkFqtHoGpxJfkLWrZoumxbCR/E2WemznH4U5MVjVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyet4gsu2HdZEc6N+F7vQelLX5aICUDM3nHUdwaamtqACIBTglN
	Ob3blPuh6b6bdxYe31lDSoFgppZcW8iSzGTU4VL+x3ueH0OPyLQGzmR+VYzXbQE13o89IPR2dAU
	bKIwGS/McmtqvOewtFXN1TZJ7ikTOUqtYBsKKQLBP
X-Gm-Gg: AY/fxX6Wuqve7KV6f6ym9o8q03bgEuz3mF6HtbFzGNVl46NaNeeX5/bVj5MsyIJxO7y
	r6BsZ95/2Qw/oTmcOA+hcikv/UxyqizMllI8u8zp0ohoFT3dMyszYASUQXaEoI4dkLkdysdpHHj
	6QDeggCoiyKDcr0D8oc1gjKuR7J+aBlxoBy+uvW/kJZbNZIr+r7JAoEkM9rdH7RGboo/6ENB2tU
	2PXcyj5sW0mcllC/4xRtL29z1WOXnfTYo3WQNoUHKHwRjnsTYL0v3KhxnJ0tB8isSgTYcNSJCgj
	KnzmWVaO61qw+BKlAa6BNcicL+f2GuQAgw4=
X-Google-Smtp-Source: AGHT+IGU9q+gRj8IYb1h4AykO50aa48oSg8Xgu9uuuuWfwfeI68H5yAO2hlPZXd3hwVQKsk/WdTiuzJsjMsANS/WvBA=
X-Received: by 2002:a05:690c:14:b0:78c:3835:496a with SMTP id
 00721157ae682-78d6dfa0ba0mr18429857b3.24.1765459206488; Thu, 11 Dec 2025
 05:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251211121659.GH3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251211121659.GH3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Dec 2025 14:19:28 +0100
X-Gm-Features: AQt7F2pfFUoFUVEdkJ6Nswms767xMhA__DttYAE1PqX0AgFhiN8dcasmhdnfxEw
Message-ID: <CANpmjNOmAYFj518rH0FdPp=cqK8EeKEgh1ok_zFUwHU5Fu92=w@mail.gmail.com>
Subject: Re: [PATCH v4 06/35] cleanup: Basic compatibility with context analysis
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

On Thu, 11 Dec 2025 at 13:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 20, 2025 at 04:09:31PM +0100, Marco Elver wrote:
> > Introduce basic compatibility with cleanup.h infrastructure: introduce
> > DECLARE_LOCK_GUARD_*_ATTRS() helpers to add attributes to constructors
> > and destructors respectively.
> >
> > Note: Due to the scoped cleanup helpers used for lock guards wrapping
> > acquire and release around their own constructors/destructors that store
> > pointers to the passed locks in a separate struct, we currently cannot
> > accurately annotate *destructors* which lock was released. While it's
> > possible to annotate the constructor to say which lock was acquired,
> > that alone would result in false positives claiming the lock was not
> > released on function return.
> >
> > Instead, to avoid false positives, we can claim that the constructor
> > "assumes" that the taken lock is held via __assumes_ctx_guard().


> Moo, so the alias analysis didn't help here?

Unfortunately no, because intra-procedural alias analysis for these
kinds of diagnostics is infeasible. The compiler can only safely
perform alias analysis for local variables that do not escape the
function. The layers of wrapping here make this a bit tricky.

The compiler (unlike before) is now able to deal with things like:
{
    spinlock_t *lock_scope __attribute__((cleanup(spin_unlock))) = &lock;
    spin_lock(&lock);  // lock through &lock
    ... critical section ...
}  // unlock through lock_scope (alias -> &lock)

> What is the scope of this __assumes_ctx stuff? The way it is used in the
> lock initializes seems to suggest it escapes scope. But then something
> like:

It escapes scope.

>         scoped_guard (mutex, &foo) {
>                 ...
>         }
>         // context analysis would still assume foo held
>
> is somewhat sub-optimal, no?

Correct. We're trading false negatives over false positives at this
point, just to get things to compile cleanly.

> > Better support for Linux's scoped guard design could be added in
> > future if deemed critical.
>
> I would think so, per the above I don't think this is 'right'.

It's not sound, but we'll avoid false positives for the time being.
Maybe we can wrangle the jigsaw of macros to let it correctly acquire
and then release (via a 2nd cleanup function), it might be as simple
as marking the 'constructor' with the right __acquires(..), and then
have a 2nd __attribute__((cleanup)) variable that just does a no-op
release via __release(..) so we get the already supported pattern
above.
