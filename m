Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE52C3252
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180867; cv=none; b=n8ADKigfDJjG4JfNwrHftfPs7oRhQUe/mLVh+UPHSpjGADTtPzUxzYLwSL/8ZRQO0iyqvCPHpask4EbAdhBuHOdKguuVLIERH4LsfVtRnNj1gLVhSRQRK2VLCB1G9fJNT3VfAZ0DQt7vUCCoOTpzBvJKkeQrca5mmcxnAoQcENM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180867; c=relaxed/simple;
	bh=Ms51wSRYcNMLU08U6XlitTxavoeEVdn7PylZ66BFoeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJec6uK3tv+wmZJptum5C75i/lggbHO+JMkpkJoor6sI6NKCB3GZySzSIJaDKghVnYkCvnbehVaQz5qbHii097nKXEQjmXszqCzOK8o6WaG7TNi8m2dMsieFNWpxmICO2CoMd51PhdBYP8tYu0Vdp9/a/p3Ao/M5Si2CeJquQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZbybHZHV; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZbybHZHV"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so1358948a12.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766180864; x=1766785664; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms51wSRYcNMLU08U6XlitTxavoeEVdn7PylZ66BFoeI=;
        b=ZbybHZHVykrdpRAlGtriqn3wHVaP0BEV7RckU3M5QqDWGgWfvo2hRQBbphxvS2BNwA
         pLQzrwBPxR7Cax+FXCV/hUhwNkt3G3JC3gTCeB1WvXqlvvEj6IxAfy7hZHBa67+7q+ex
         HG4cCHZjp16WhljmP/3OuO0e6kNRarA12msX2ZrhpVhXUX3ANQUCUvxEhe8SS9He9o8q
         obqn5RvnxYUC+q75XIHGpumO6is2s9sPQnNCDIuDgJzOS5D8YafOkIAZN+vy+ar77UPH
         uIx2RfkQsx8sZvum/zbXR4najDOHCyezCoClEbFYMDFluQRWWOUCT29Tg9IAouUwjXo5
         DjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180864; x=1766785664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ms51wSRYcNMLU08U6XlitTxavoeEVdn7PylZ66BFoeI=;
        b=Pid2OCq8MnMAXtWtB/NXQeqR8jwW5LEAsQELIpx/X+6WxZl60Jx+Z058zmrTMHn6d+
         mHFwTXJcy2CFzb0JHG+NKhxqKjwdlvElB7hTplAfvVUsMfmz/EZu8vQ5VsyhNVxa/dai
         va7InNYdzTUjQhaSDmtbZDDZt6FzYB/uuW4pCtyFLgfSVg41jlZVdy6AgmC2qkFqvS3u
         vlbV/m0+eHPysyHE3UaJlRmqj8Ss8RvR2DcNGv7lOrkD/N2DEi/TkMlYzSRcWolyXIt/
         WYonrfzJifxMEghJlBn2zPHPfU6RIho3Lvhuje3DA94i8PmmzDlZ1X4a7AP3EY7JQjgp
         /5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXIMHPmQfDZedSdW4PN1yKBLu7kk3m4tfTVssHyFotR65vb3Dg6plZ49KrK91tl3/UdruTOb6crLA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcxbt6LwQuViCx2EkcVRitAb+Tz9zjyMDEpAvvcAo3Rki7oTFK
	1IAQ0z3SYnF2vCT1DzP55nec0iyVRQa5YYs9IlZw24yumIT/gNXTwkzoN6ok6xCFoMNWBuG5khr
	ooKu/5xos303hat4RCs/KYvoN0NXzBkDRs7wnnYjW
X-Gm-Gg: AY/fxX5lRNV2mh15pgGxKtuTo+xfLU4fpCKK6jXpKjst1fjdui9k8fx+KV6TzE3Twsa
	qcbtOnc+ZOkWwZxfZHwIuSY/YZOrCL5lQPgK0g5d9/sBJnsVm7AjGLJW/nY6Eg3eQbKiPHtwci7
	6NX7pVUuxGDyYwyg+eeNE9EfGut4t7mIzloTjLE4VpmAjmrk1Pv6BNLd+PG9OHiogkcVJ8NPnOR
	K0J0Sbv/7VXt4NkLN0GN6bUzFupwP7l8BgkN372QmRg7FGQ53bgfKx683ugqSCs78fzo9RDqdQ4
	U8zWAgjdRYKAwis7C9me4TzPydM=
X-Google-Smtp-Source: AGHT+IFIxJn1IGPy0nHsxYCQasesjc20OB/If1nT0iJGZS/3DeBiPOVvBE4Lni1iekMVipiY5AEcIb2ButU5L5/gdvQ=
X-Received: by 2002:a05:7022:5f0b:b0:11b:9d52:9102 with SMTP id
 a92af1059eb24-121721aaff1mr2914480c88.6.1766180863274; Fri, 19 Dec 2025
 13:47:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-8-elver@google.com>
 <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org> <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
 <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
In-Reply-To: <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 22:47:06 +0100
X-Gm-Features: AQt7F2oOvMMB1QIst16kG-Ehhh_fmZRMYn3rIRXwuCNiu1TQ-QKGkuW-c2bqFwM
Message-ID: <CANpmjNPp6Gkz3rdaD0V7EkPrm60sA5tPpw+m8Xg3u8MTXuc2mg@mail.gmail.com>
Subject: Re: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context analysis
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
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

On Fri, 19 Dec 2025 at 22:28, Bart Van Assche <bart.vanassche@gmail.com> wrote:
>
> On 12/19/25 2:16 PM, Marco Elver wrote:
> > It's basically an escape hatch to defer to dynamic analysis where the
> > limits of the static analysis are reached.
>
> That's not how lockdep_assert_held() is used in the kernel.

Because there had not been any static analysis like this, and dynamic
analysis is the only reasonable option.

> This macro
> is more often than not used to document assumptions that can be verified
> at compile time.

In that case the lockdep_assert can be dropped.

> This patch seems like a step in the wrong direction to me because it
> *suppresses* compile time analysis compile-time analysis is useful. I
> think that this patch either should be dropped or that the __assume()
> annotations should be changed into __must_hold() annotations.

If we drop this patch, e.g. the "sched: Enable context analysis for
core.c and fair.c" will no longer compile.

It's a trade-off: more false positives vs. more complete analysis. For
an analysis to be useful, these trade-offs make or break the analysis
depending on the system they are applied to.

In the kernel, our experience with developer tooling has been that any
efforts to reduce false positives will help a tool succeed at scale.
Later you can claw back some completeness, but focusing on
completeness first will kill the tool if false positives cannot
reasonably be dealt with.

From the user space world we know that "assert lock held" [1] as this
kind of escape hatch is valuable to deal with cases the static
analysis just can't deal with. Sure, here we can make our own rules,
but I'd argue we're in a worse position than most user space code, in
that kernel code is significantly more complex (which is the reason I
spent over half a year banging my head to make Clang's analysis
significantly more capable).

[1] https://github.com/abseil/abseil-cpp/blob/a8960c053bf4adadac097c1101d0028742d8042f/absl/synchronization/mutex.h#L210
(ASSERT_EXCLUSIVE_LOCK() == __assume_ctx_lock())
