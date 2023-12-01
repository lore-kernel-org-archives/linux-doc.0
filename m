Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k7zvQIUQ"
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9B312A
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 10:18:41 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54c77d011acso663a12.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 10:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701454720; x=1702059520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sG2qvU0QskaUquCTeF5oijEUHu0uj9CGz7uyq4JY4sk=;
        b=k7zvQIUQjgTyLEcYqwFRnGUxZHa/bg7DowIKyRfvrG0TpRk3ibV0u/G3HEn1qoeAqB
         XnZaQaCxYWCa/lcRZNdjQuw08eJbqPewDGFDBDx9lrghLNmZcApZ3N5Vv+EQqPsPiVAj
         vbt7gqWHTq3abqKSRbhaqpR2AqDkNxUnNXQxSil3wSKasCXzUeOaIpd7roog+ocQpNz+
         zM7ovAB6K4gqgsRiwittGDNJVYqfqLG9oaHbFsWxgi66tCN1E655wzZ+AA9gEG7W/a9B
         nPsqrpuv3GQuvuF5hVxfN44krwXsMuUNDiz5bWuBHvl9zjBhNlBCwiz/aAzonflwkLJn
         1m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701454720; x=1702059520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sG2qvU0QskaUquCTeF5oijEUHu0uj9CGz7uyq4JY4sk=;
        b=KWgOd3sYkeUhjeKyy+9MY2RaltLodhXFIYh1fIy+0yCfWCzORqPht+/T/TkRnQAUAc
         3yzmSWY8oFJI2rEFeme/9+xbAKRkoGEbLpUo4mNBZCxKqsSDQibOypvpdvie/DMtmujk
         Wq0P3Q/W5HYtqvqqpN2UvIboVx2eh5lynvQGtkPeQw9RhhrOsqq5rrYF0uU0HJYeAu60
         rFEfEl0IyXU+0SAYH3c58fIKEt5Y1eGW4soyZJouFLGGvoIxaBjx4xrRWgbRf/xW96ya
         ifI5EW8E5t/8cAlW6cu9y/8o/qTm+v4Oi3jTkfauTHLFcYMHOUecM8chneLHVHK+iIuK
         oJgA==
X-Gm-Message-State: AOJu0Yz1fPzol/zDzXU/XRUVF4dgVEoezelm87sOCNMUCsmrXFIGOnPX
	TLJlUoimZ10TnjR4z/Qay3DWDHf8gl+skCFG3N71BQ==
X-Google-Smtp-Source: AGHT+IF65u7rI3BqvWNhPLCqFe6obTBbRQ5ETF5EFDDXxUy02aSXHG2k1RzarlGVTbjqjtWkoVGkW3b8radjMqSANaM=
X-Received: by 2002:a50:d5d4:0:b0:54b:6b3f:4a86 with SMTP id
 g20-20020a50d5d4000000b0054b6b3f4a86mr203053edj.4.1701454720168; Fri, 01 Dec
 2023 10:18:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130204817.2031407-1-jannh@google.com> <06c05c8b-9a3b-4c04-b898-0f82e98da70f@redhat.com>
 <CAG48ez1a=VuEWwPTjcXFAwCyt9bRH-WzAfw0uP-qVu83kdxkZw@mail.gmail.com> <28b147c3d7354d1a8ff0b903da9b54f4@AcuMS.aculab.com>
In-Reply-To: <28b147c3d7354d1a8ff0b903da9b54f4@AcuMS.aculab.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 1 Dec 2023 19:18:02 +0100
Message-ID: <CAG48ez1bOwbqEbD_ycC2fyWK_tW4rqr=gogJbQOx5CECyPGZcg@mail.gmail.com>
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
To: David Laight <David.Laight@aculab.com>
Cc: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 7:12=E2=80=AFPM David Laight <David.Laight@aculab.co=
m> wrote:
> From: Jann Horn
> > Sent: 01 December 2023 15:02
> >
> > On Fri, Dec 1, 2023 at 1:33=E2=80=AFAM Waiman Long <longman@redhat.com>=
 wrote:
> > > On 11/30/23 15:48, Jann Horn wrote:
> > > > I have seen several cases of attempts to use mutex_unlock() to rele=
ase an
> > > > object such that the object can then be freed by another task.
> > > > My understanding is that this is not safe because mutex_unlock(), i=
n the
> > > > MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
> > > > structure after having marked it as unlocked; so mutex_unlock() req=
uires
> > > > its caller to ensure that the mutex stays alive until mutex_unlock(=
)
> > > > returns.
> > > >
> > > > If MUTEX_FLAG_WAITERS is set and there are real waiters, those wait=
ers
> > > > have to keep the mutex alive, I think; but we could have a spurious
> > > > MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
> > > > between the points where __mutex_unlock_slowpath() did the cmpxchg
> > > > reading the flags and where it acquired the wait_lock.
> > > >
> > > > (With spinlocks, that kind of code pattern is allowed and, from wha=
t I
> > > > remember, used in several places in the kernel.)
> > > >
> > > > If my understanding of this is correct, we should probably document=
 this -
> > > > I think such a semantic difference between mutexes and spinlocks is=
 fairly
> > > > unintuitive.
> > >
> > > Spinlocks are fair. So doing a lock/unlock sequence will make sure th=
at
> > > all the previously waiting waiters are done with the lock. Para-virtu=
al
> > > spinlocks, however, can be a bit unfair so doing a lock/unlock sequen=
ce
> > > may not be enough to guarantee there is no waiter. The same is true f=
or
> > > mutex. Adding a spin_is_locked() or mutex_is_locked() check can make
> > > sure that all the waiters are gone.
> >
> > I think this pattern anyway only works when you're only trying to wait
> > for the current holder of the lock, not tasks that are queued up on
> > the lock as waiters - so a task initially holds a stable reference to
> > some object, then acquires the object's lock, then drops the original
> > reference, and then later drops the lock.
> > You can see an example of such mutex usage (which is explicitly legal
> > with userspace POSIX mutexes, but is forbidden with kernel mutexes) at
> > the bottom of the POSIX manpage for pthread_mutex_destroy() at
> > <https://pubs.opengroup.org/onlinepubs/007904875/functions/pthread_mute=
x_destroy.html>,
> > in the section "Destroying Mutexes".
>
> I don't understand at all what any of this is about.
> You cannot de-initialise, free (etc) a mutex (or any other piece of
> memory for that matter) if another thread can have a reference to it.
> If some other code might be holding the mutex it also might be just
> about to acquire it - you always need another lock of some kind to
> ensure that doesn't happen.
>
> IIRC pretty much the only time you need to acquire the mutex in the
> free path is if locks are chained, eg:
>         lock(table)
>         entry =3D find_entry();
>         lock(entry)
>         unlock(table)
>         ...
>         unlock(entry)
>
> Then the free code has to:
>         lock(table)
>         remove_from_table(entry)
>         lock(entry)
>         unlock(entry)
>         unlock(table)
>         free(entry)

Yep, this is exactly the kind of code pattern for which I'm trying to
document that it is forbidden with mutexes (while it is allowed with
spinlocks).
