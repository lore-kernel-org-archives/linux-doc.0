Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xlU0MnRR"
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846AE10DF
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 07:58:43 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so12814a12.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701446322; x=1702051122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5r69d7flVI5ckkQOOgWcECH4o4ZC5eGRq35Be8p9mMM=;
        b=xlU0MnRRG5PmaJL1C914UZo1HGfMiW5MQQqmvWrn/S2crvb/6XpLnWZ5mM+zevQmiw
         RR3NNOX6shMLnSRyx+cI6bGMuXXisiA2vMxxxFjc9DGB6m/qnWhTGMltznU4eK8uiszw
         074JI/GQ1+xWE4ZZE94k2DG8GfAmruPEkoSTLdvZDvL5LL3QRYYBkleDRt7N5v5RovuV
         /Ts25bMugBqj+KmhvL5sh6ZH5pdzTEcINOsoKLfHBHZuhCYiaOTzokMjlEP8Rf6bR6N1
         HAuCjnd96S3eBPonfJLQc5mJjlttBKn2ivkN8pgQsnN2sdBU25JrarU7Aw4kSlzXiqr8
         Tv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701446322; x=1702051122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5r69d7flVI5ckkQOOgWcECH4o4ZC5eGRq35Be8p9mMM=;
        b=Q/0ap4JwexD734wxqsFXgG2VmLAS3sy+9zdQxhRZQ5+CUcdjMgzqIuMC6jj/Q36WyJ
         3q5bQa7yVQWqKjZleo1UlLIqMLahLjBW3rjej70S5Cp6EF/lil+zjhi6uUosYwxqoytj
         76N9sE5w0OusDZ/WL8F3nX5h9wCvER6JsLryttbBU8KL2lZkXuYixd8YKm6kzvPR2uS0
         XNHOfZrnS6Z8ai3Z1e8M+b/rQHNzdmwWMT4VNJEHvT3g2zkKtV1Wl27CSPT8tUg9nmQ3
         lXu7in/lUQBUVG813ivHer0FA/Z1hZnBtJTzl22019qOG+nObdaAkLBJglmLh3SsLuZY
         ba7Q==
X-Gm-Message-State: AOJu0Yyt2uwmm9eeaIove6ustu5V1dyNVTvHDT+Y4IxmvwX8NJ8xexUX
	X2dvItlY7gHp526IVIhvREs7IXnpvrs+iNVMrDR8Cg==
X-Google-Smtp-Source: AGHT+IErdOk/QPmVt7v/u4AAj1bjWAZ/H5XkqJx3BSLyfjpo5aJ3cR04l78MS2Tzt65zXVO16nU9HGOny3ocRwcuaeM=
X-Received: by 2002:a50:9514:0:b0:544:e2b8:ba6a with SMTP id
 u20-20020a509514000000b00544e2b8ba6amr104854eda.3.1701446321806; Fri, 01 Dec
 2023 07:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130204817.2031407-1-jannh@google.com> <20231201091007.GG3818@noisy.programming.kicks-ass.net>
In-Reply-To: <20231201091007.GG3818@noisy.programming.kicks-ass.net>
From: Jann Horn <jannh@google.com>
Date: Fri, 1 Dec 2023 16:58:04 +0100
Message-ID: <CAG48ez3oqU+P7NJ3Lj1qVKuqgDDdNqsaXdQVR5KaRx5J+BJGJg@mail.gmail.com>
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:10=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> On Thu, Nov 30, 2023 at 09:48:17PM +0100, Jann Horn wrote:
> > I have seen several cases of attempts to use mutex_unlock() to release =
an
> > object such that the object can then be freed by another task.
> > My understanding is that this is not safe because mutex_unlock(), in th=
e
> > MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
> > structure after having marked it as unlocked; so mutex_unlock() require=
s
> > its caller to ensure that the mutex stays alive until mutex_unlock()
> > returns.
> >
> > If MUTEX_FLAG_WAITERS is set and there are real waiters, those waiters
> > have to keep the mutex alive, I think; but we could have a spurious
> > MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
> > between the points where __mutex_unlock_slowpath() did the cmpxchg
> > reading the flags and where it acquired the wait_lock.
> >
> > (With spinlocks, that kind of code pattern is allowed and, from what I
> > remember, used in several places in the kernel.)
> >
> > If my understanding of this is correct, we should probably document thi=
s -
> > I think such a semantic difference between mutexes and spinlocks is fai=
rly
> > unintuitive.
>
> IIRC this is true of all sleeping locks, and I think completion was the
> explcicit exception here, but it's been a while.

In addition to completions, I think this also applies to up()? But I
don't know if that's intentionally supported or just an implementation
detail.

Is there some central place where this should be documented instead of
Documentation/locking/mutex-design.rst as a more general kernel
locking design thing? Maybe Documentation/locking/locktypes.rst?

I think it should also be documented on top of the relevant locking
function(s) though, since I don't think everyone who uses locking
functions necessarily reads the separate documentation files first.
Mutexes kind of stand out as the most common locking type, but I guess
to be consistent, we'd have to put the same comment on functions like
up_read() and up_write()? And maybe drop the "Mutexes are different
from spinlocks in this aspect" part?

(Sidenote: Someone pointed out to me that an additional source of
confusion could be that userspace POSIX mutexes support this usage
pattern.)

> > index 78540cd7f54b..087716bfa7b2 100644
> > --- a/Documentation/locking/mutex-design.rst
> > +++ b/Documentation/locking/mutex-design.rst
> > @@ -101,6 +101,12 @@ features that make lock debugging easier and faste=
r:
> >      - Detects multi-task circular deadlocks and prints out all affecte=
d
> >        locks and tasks (and only those tasks).
> >
> > +Releasing a mutex is not an atomic operation: Once a mutex release ope=
ration
>
> Well, it very much is an atomic store-release. That is, I object to your
> confusing use of atomic here :-)

I'd say it involves an atomic store-release, but the whole operation
is not atomic. :P

But yeah, I see how this is confusing wording, and I'm not
particularly attached to my specific choice of words.
