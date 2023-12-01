Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wdTt5Z+S"
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB593170B
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 07:02:13 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso10346a12.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701442932; x=1702047732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvS5+725FOUXFMMq/VbInwmdI+QK4gqPGaiLWv9jUGk=;
        b=wdTt5Z+StlXLahEal5Vxmp7I96R8Auxn3A7YhAZ0hwSg+cbCsNGFSuuFIsVphWDBgw
         u2Qogkr4kMiYHGEyMbey3LJQ0/ilU4IHC2KJFAhy2zZQRAxrWS9XYFRZYbdbcw9uHqH8
         hAyT9jztAzKs2Du4gD8fSlbEMPF+sOcfmoVudFBN1QvVBAL4KEnpBNoDYwiEavEIbJOd
         cJE9FQ1svVQ8V4tWsq4CyjFm/bBfamy2+5J2MABWS7ZPJse6GksVqWi1HKYHwVICPrdX
         +rwalLs486PbmhZXyiU3cjXOOXde7X7JY6z4Bp5Flw2/ZD08gkem95x2BSKzy5zH80Be
         9SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701442932; x=1702047732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvS5+725FOUXFMMq/VbInwmdI+QK4gqPGaiLWv9jUGk=;
        b=RDFNn0ytLTsWzTYygcOv9bFXE/9tg4IARmrpqO51B+2DEYQb66SpjODVoticzz/myM
         UR8Mr4FE8T1XxkvGpKi4gV9b4+5EvuBQuhkddYoDa3/4spd5tKXQ0bWwGa0l6dsk4EBs
         +ge988tZX80OFLr9lI/X1nWNCacJVhYg8m5A5q6+DlcE8f944abx1vsZYtLvQ7d6QvdE
         r+dR4alrgD4L8PAeH/+17ewy7B80BsU+VHwaEiycEmtR51rPS3yLw452OtxCJmqBalYf
         Tdsv1mQ+955rY3M/qbu4CDbjYs96x799pisybT1lL/FjKzgBaFY8fGr46yJuEa3EbtFk
         G4hg==
X-Gm-Message-State: AOJu0Yye+YRJxGtuEpy5+n0lAzpFpYemE2BnlVgFWc6nM4KuMc7njOZV
	VxL2J9avfm2JUm5eHuGZsV6A91WIy4BsxHKBonx+ZQ==
X-Google-Smtp-Source: AGHT+IEcpNgo7dBSakfutUBem768TAYVjsANcalSOjsejY24k/zMbSFp2qc2sPu4f40T4H7h6sqxFTAIE14G44xsqyo=
X-Received: by 2002:a50:9514:0:b0:544:e2b8:ba6a with SMTP id
 u20-20020a509514000000b00544e2b8ba6amr94399eda.3.1701442931362; Fri, 01 Dec
 2023 07:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130204817.2031407-1-jannh@google.com> <06c05c8b-9a3b-4c04-b898-0f82e98da70f@redhat.com>
In-Reply-To: <06c05c8b-9a3b-4c04-b898-0f82e98da70f@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 1 Dec 2023 16:01:33 +0100
Message-ID: <CAG48ez1a=VuEWwPTjcXFAwCyt9bRH-WzAfw0uP-qVu83kdxkZw@mail.gmail.com>
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 1:33=E2=80=AFAM Waiman Long <longman@redhat.com> wro=
te:
> On 11/30/23 15:48, Jann Horn wrote:
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
> Spinlocks are fair. So doing a lock/unlock sequence will make sure that
> all the previously waiting waiters are done with the lock. Para-virtual
> spinlocks, however, can be a bit unfair so doing a lock/unlock sequence
> may not be enough to guarantee there is no waiter. The same is true for
> mutex. Adding a spin_is_locked() or mutex_is_locked() check can make
> sure that all the waiters are gone.

I think this pattern anyway only works when you're only trying to wait
for the current holder of the lock, not tasks that are queued up on
the lock as waiters - so a task initially holds a stable reference to
some object, then acquires the object's lock, then drops the original
reference, and then later drops the lock.
You can see an example of such mutex usage (which is explicitly legal
with userspace POSIX mutexes, but is forbidden with kernel mutexes) at
the bottom of the POSIX manpage for pthread_mutex_destroy() at
<https://pubs.opengroup.org/onlinepubs/007904875/functions/pthread_mutex_de=
stroy.html>,
in the section "Destroying Mutexes".

(I think trying to wait for pending waiters before destroying a mutex
wouldn't make sense because if there can still be pending waiters,
there can almost always also be tasks that are about to _become_
pending waiters but that haven't called mutex_lock() yet.)
