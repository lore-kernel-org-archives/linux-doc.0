Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB4D331EB1
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781027650; cv=pass; b=oGVrkPnWRTnjNFNdd7ZY6QiXM2jRzO1dxA9MFCZjM9oy4XvBbCOSnU2vjqTa88oGOCw8wmtjcycIE8cWYky9sjeFnXIRCUpi1Zc/ubjM33tGRAvjqlaLpkLJbAgJ83yLthL/G9GYMVxFYB2BQAYQMQe/kupLu3Rd32i/jEYKLQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781027650; c=relaxed/simple;
	bh=Hq4A7JGxJMTkiPV3o4Xs1UnKUenCIEORnYI3PIpLLJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYhP171aeWmv0Rpmq623EBBvKkWx2q3L9KAZYQJ98j8/Fx93vpGRosuZaUfO0niFKdA/wb40/jINu3dEBC4ZTsQ49VhYieigxam17gCNdbF+iPY5+rIpMwdKbpCbrz/2iutn7dMq5DyptzhQvUVOJrAjkKWjjTjhG5bERvZC0Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iZfBKXHF; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iZfBKXHF"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso47185a12.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 10:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781027648; cv=none;
        d=google.com; s=arc-20240605;
        b=EjkYuwl2YPUqiXCCJq5DK5bgJe81/DIUYk7rdnTb2+fZH3OIB34hmn57lEFIK5ZXvj
         3ltdHweoptvdNyPaXs9DH61zZb/hHxL8+po7AAbg+Or0aFWnqOwM1/p+8PEPXrjdbP17
         qioj8wglphafdmFmnJIY66biA0bR+1dHl7RITYLgL/koIX/3BXcgEkvS2a0gmg1kKlUn
         OMF0AkHu2TsuvOoOBvelkLi6yytdPWOBSVzyAjbRQucnsSn3POXNUZ0apckNu0N5nmfa
         6br0M1emMNZ2NPFfhGjeC6pkDei19v6EOnwQ7Anv8uISCf7kwIfGIQGL1zZb1EdEe+hU
         344Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iPo/rNEwfs0tGz+mQjgisI/ZCW4vs/mt/EjG+vliJIU=;
        fh=07w84MMdk3kBt9Kp0S0T62K0i1Xc99yxf/Hug6QzZFs=;
        b=SUzUj4CQkySEpU7J1LADzWUXVGi/JrlLrSvN2bzGmHGdWrRIUPKxHl9LUWo3EBioez
         w3CYZ4z1PoYv3RzP58z6B2tXFyAuzHnLOFrVC6rlVvInIkzaN+j5JxaIJFQx0mfoCFk8
         49iepmFQmWvzsN45EK1BQMnCVqGVy6c/YrGfBTYzUj0kErfPLhPYNbvgPBxOUvHSO2xL
         a4mJD9fUyxEaI6NT9FoxNScTG31OXw6aJ02gH1BE95jDm6w3KUEc0G9s0YYPLRa6gU8h
         uuLNDhlKhVSA0SBiH63nxeAoUxpxKicu21R6biuChV003SioOryJQExnh576fgePXiCs
         9pLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781027648; x=1781632448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPo/rNEwfs0tGz+mQjgisI/ZCW4vs/mt/EjG+vliJIU=;
        b=iZfBKXHFAby34uHGpYi2VbZP+Pazod5Qc+pxnkwolhQruv5pTqedVLudlVv+YX3wSY
         Uvs1bWsokvHd9EcxespPGitXQUjQ02oG0JGpJMnsFiMTnvIw0gyWIUX/SB6RMjsEv+2r
         rhxt01z2rd5I/RDkyxkfpr3Oe8Hodptu2WuaiHnsd3DEDQ/nKhUoOSbttVz68dwtuT/j
         b+0OdPmoDhTN+E9jd6VE4rPpwar+vQttOWkEP8TTSpQQLlYx1hjyQJ7qHhos34m8vrKX
         mnbEnNErlEybTK8zbZ55NtPOVouI00Ayg/Ef+ogwn4FfwQIx5o5Ut5OR/Z/VmEkyhfB4
         7qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781027648; x=1781632448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iPo/rNEwfs0tGz+mQjgisI/ZCW4vs/mt/EjG+vliJIU=;
        b=UAkD/XLkCWKmD4hIucMsEvJbYtFpHnitt252sinGu/73DZOObFl55FOFyHRN0y7jDh
         AD7RZds6niQHTaFP5VOwumRSYZae1mSIcFnr6TOirSHZVVdtVIzSL2fiM/CbfyKUL6vj
         vWeWBvw5aqT90355WpVkbC8BnE0Zbef9kx2dEiDuMfdr98nosCMikQoqMayJctz5+9jj
         38MfV82Cibbht5wwZRN2t466OO+M9iOmtyGzFEke91XEkQw/6/0KS1bJ/5oK0Ak9a9xz
         Q4zbwco2dIeaf4sf4PNtGmJ5GFWRKE/i9CnAonqK0aeIWnQ61ESfOoI2NB+96kazbdrj
         hdTw==
X-Forwarded-Encrypted: i=1; AFNElJ8u0hs0qHOSs4MlSHJvNN0eGGcRYcdYnqFKV/0/aydkZt+CIG3I0UBL1yqGqoAbA0UHpSrXnYZ77C0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zN9eWQ5R6nwSc/SUpLbl5kdPD8yW/x29GCTXYNC0krmjuT5U
	jMGjX4LoekUVFqTKfU3wovJol0hpvSUSzohCYgI8UwKcVUFN3WZYrZGpSeukece4QM0vPZ29Hho
	BzBuI2FOfREZbmOOvrJy7waBxEcStEJPbwCy5jvDO
X-Gm-Gg: Acq92OHfwsAY2j50PMjpOT2uieDALbJsvtvqojcteLB3IvHfuMKat/dI40JObDt3k+x
	h0HUYLOLtPuAGnKlouN1+L13i/BBFFg750Orco+LMwL0FJGob1ogEcAF1rbnZ7wwhId+a61FCbu
	NJJ6mlQ2SjMrJgl8kx9v9WOk/mODRH4OUq3t4X3JvOgInChVdf8c4KsxKAzImq7Y/3FzYJ0kRI0
	9cDt71TZglqkuA1JIRFNwrPKgMh9YD9mb/4q7OASkgBgrfoWTYOCmI52Ok4lESf+9CLN2rigKjv
	vkN2ZmruGK2q4YdYxqwDWGTQNLHnDoDOLQMthlVcNw2hJANv
X-Received: by 2002:a05:6402:708:b0:68f:d45f:e497 with SMTP id
 4fb4d7f45d1cf-68ff191f2f4mr222363a12.14.1781027647308; Tue, 09 Jun 2026
 10:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528095235.2491226-1-me@linux.beauty> <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
 <CAG48ez38OEE8ZPLyU6nr9=cYx-hMsdoh5WRrv-GMZGMDKyyOTA@mail.gmail.com> <lhubjdk1c1m.fsf@oldenburg.str.redhat.com>
In-Reply-To: <lhubjdk1c1m.fsf@oldenburg.str.redhat.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 9 Jun 2026 19:53:30 +0200
X-Gm-Features: AVVi8CdbotQb6TdiuBRRRFJLKPXdrZXdsDiaDY2tYNXV6Fkhva6G6BZKR3tezyY
Message-ID: <CAG48ez0FCqMaEgosy4K59pKan6Wn5RMbJeOuNWAc_m_56nDVYg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/13] exec: add spawn templates for repeated
 executable startup
To: Florian Weimer <fweimer@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, Christian Brauner <brauner@kernel.org>, Li Chen <me@linux.beauty>, 
	Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:08=E2=80=AFAM Florian Weimer <fweimer@redhat.com> =
wrote:
>
> * Jann Horn:
>
> >> Per the above, the primary win would stem from *NOT* messing with mm.
> >
> > As you write below, I think we have that with CLONE_MM? The C function
> > vfork() is kind of a terrible API because of its returns-twice
> > behavior, but I think if process cloning with CLONE_VM|CLONE_VFORK was
> > wrapped by libc in a way similar to clone() (with the child executing
> > a separate handler function), or if it was used in the implementation
> > of some higher-level process-spawning API, it would be a perfectly
> > fine API?
>
> No, there is still a problem with SIGTSTP handling because we cannot
> atomically unmask the signal during execve.  We need to unblock SIGTSTP
> before execve in the new process, but this means that it can get
> suspended by SIGTSTP.  Consequently, the execve never happens and the
> original process is stuck in vfork:
>
>   posix_spawn: parent can get stuck in uninterruptible sleep if child
>   receives SIGTSTP early enough
>   <https://inbox.sourceware.org/libc-help/2921668c-773e-465d-9480-0abb6f9=
79bf9@www.fastmail.com/>
>
> More on the low-level side, it's difficult to make sure that execve gets
> a consistent snapshot of the environ vector.  Both vfork and execve need
> to be async-signal-safe.  Any locking or memory allocation (except for
> the stack =E2=80=A6) persists in the original process after vfork returns=
.  The

I think that's not entirely accurate; if you call set_robust_list() on
a futex list, then call execve(), the futexes should be released once
the process switches to a new MM, in
begin_new_exec -> exec_mmap -> exec_mm_release -> futex_exec_release
-> futex_cleanup -> exit_robust_list.

So in theory you could use clone() with CLONE_VM and without
CLONE_VFORK, and let the parent either wait for a futex that is
released on exec, or somehow asynchronously check later whether the
futex is still held... probably not the nicest building block but
maybe workable? Though I guess it would fit more nicely if there was a
"munmap() this range on exec" API...

> environ vector can be large, so making a copy on the stack is not ideal.
> It's even harder for getenv/setenv/unsetenv implementations that use
> locking instead of software transactional memory.

Makes sense, that kind of sounds like a pain inherent in being able to
execute from signal handler context...
