Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01034369D65
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781132363; cv=pass; b=STLyONhkHlgpXw6ScE29PG67HGl5vmxhbeUjFkoDihaukfrpRJX0W3U8eg3VA/m/WxpEMCdCx64iec42u+sYIcU3owdEcHhrFNv2u+o3eW7QpjA/tgvjsZiISiNqGtNHiJeuCeryc2heEAopXR5MtLpibr0Nj+O4EN4BxVApndk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781132363; c=relaxed/simple;
	bh=oEzIwJCTEGfUPAMEdjx97uQ6KkcVMIzM//6ziaFjsoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqtJW4ZyOZ+KVtoIilTwHHbPw+FMRoS9SYdIdOlN2+80am3jZ9B5/50YdwKeqKYJShmGptY3YelfVU8Q0nXi6vYrj4j1nTnEu1uSHDEoanjAmoHRgjOnYjk2iqGlRMKVYe3QHaQBykM7xl9i/79qdlRbYHTQud0hksONBLQk07w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEn4tIWy; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEn4tIWy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so1066125266b.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 15:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781132360; cv=none;
        d=google.com; s=arc-20240605;
        b=F5lM6Xnq4MdFT/GimJAM+H3eKdnXMVxSrd7T+gazFAru2sZDbTDRfW8CgRzoDBZIFR
         U7Wq2EOa71u3yDq5Cmsj49TUyfOHyPFwPqe2Fig8xncuxjRElbhggkdk91NWiPnKDpnm
         T0HRax+f98RCUCi5uaqH2FVr/vj1wYBca3vztYlrlMBJk8GjYG/rbf7YQ8gCngUKFfGJ
         gVwdR0ubq115ieDKF263YwS3/rDL1/f0laowq0UOYGBPz9ZOvLKuDFH7TCIxEOH8ZZpG
         i2dKjLaOK6ngH+Hd0yNP3Arn+EPL6B4IcftiRX7R4c6yowdbHHWVZHfY6QxE/wMpwHcS
         DDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEzIwJCTEGfUPAMEdjx97uQ6KkcVMIzM//6ziaFjsoE=;
        fh=xhbWRKuz9mCHSTT/u8U+3tI144r5Wk+CIsaIGzrFqlo=;
        b=ajU0L+pTYQkTFd1/D/HE+mL6A3RbtNRIvAAfaJvipZC60Zh0+murgLm+0ZBGEJ5gI4
         gzDfqV21XFfFJ1VURMjI3U9MwRYmo2ddeHdXfKp8siJll+9iHALNxOC5+82Rwpjx50/r
         L9/3yMHGEEAkOiTVLr7z5DyzYe3mVwAogVu3DW6cvsllIx3snlTzeNXJFxH9XUS8/C3c
         hqugYkFmMhra8tGLAoCXeWnia72jsmbt9cM4lSXfmA1x4HIBTimZdBwlkCNOW63CkkDM
         QpUIpwa0WddfFx4Th1z2o5lIJalL+24Ht+iiel85nP/z4aCyxbGmFMsFiQCVlCaPb30L
         hiVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781132360; x=1781737160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEzIwJCTEGfUPAMEdjx97uQ6KkcVMIzM//6ziaFjsoE=;
        b=qEn4tIWyzGrvjUgvO574u6bAFB8n1Bu79d+gI2oyFcZSTG2PxL2qFkS7fainrrfrV8
         JBMIOmi08eKO7E1Aj9XPkaMb/2J2V2mSI7ole22hdtrek8TO+kg6IQXol5thJJGLcXMe
         TvO4cEC9g7XMzDu8Gbw6Hh4RTK6UDyqZgmnbe9NiDrFgl0sQHcsJgFHeiKnJjdk481Pa
         w4sUsM1k/OBPwW1b8N0SWLEtBrHQN5WlmEpsaRUJglIosxsDBsE1YWDA5Rex2p+aGKkL
         kFPkBD5MrcWH4toiaQBJb1V1kvARUTSG8MKzUg5hBPmu5IGHxgP6iZ423hIxmHohe/Ax
         vulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132360; x=1781737160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEzIwJCTEGfUPAMEdjx97uQ6KkcVMIzM//6ziaFjsoE=;
        b=oqgPIJUvMmv7wJAkSQ9yoWMqL3l/vDX8anrYGTuDhHTcseWb0fEKXvoTCuVb4WhJJy
         mU5ssY5jsiqtdNemczesgDZeTgTmCl1vMcsGAz9QuUbEVEZQPkbgvZQJrq/szu9CqFwq
         G7hSCPHUFtosLi6Oabma5ojpjHHMmJ1vx6mHV9nP9ew/Z5fOd4+g64Dy8xNE0/0OMZtH
         wBIgiY7Ede37RHVg6Tb2g35KotH/WSyGYFmbtuP4Phmp00S9rbo+RBNPpBeMz9vydjc8
         sz6iqEmC0V6PvqxDnyLt1jQY9j7FTtbHcU1w7KQYmhwQ5jYnfm4JU76u1EjN3XLhJe3t
         Ch1w==
X-Forwarded-Encrypted: i=1; AFNElJ9MAZuzwSxGWp0HHGWfYGw2YT5j26CyutaM2wkB1U5fI4Y5rRFCKeDprupf3vr5Bm+T5dykaSMJHoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2MxBcAlftRbzGa5hH6/T+ca4wreCFn3n6xGIch2y1j0MVQ1Kj
	gEARrh/SLsnSELetazekNjh5wTc+UIjaSt82IMvpES+nBBO2yrH4Dbg1lG9WWfSF16VgVLtp/VM
	YkJrSzgKMZ8/PC8wnvJdMCflQag8sJ8I=
X-Gm-Gg: Acq92OHEfEGtm9DbqOioeEmK9t20MFMCTCE5tLcX3r10OmHHXTfWbaO2AJ+CxhUnFcW
	ZVeOG/4u/+f421GgXwQK07KVzH14YA0NpCSjroj+aijuoI1ejy/4yLKlaEL3XbzcWgDxmcOFJRn
	u3opGtPTzO19u+cw3asH8VhEsWap0OoOoyFn0CDXZOk1jzs+itXJPnm4sbifJKmZyupnpqPEMh9
	NTRP1PHxj6JAs5ksY9WCre/eD/4WoUyUhp+BI8k3Ci9gfdsHDQLUjlXCpm33nAxpFsX3sCwMEkp
	H44yUSPV5IU3H8tHD3KbC3Z5ggGCdy7Poa4m0vPhw02NcZc+2A==
X-Received: by 2002:a17:906:6a1c:b0:bf1:ac1d:94b0 with SMTP id
 a640c23a62f3a-bf373eec601mr1347239866b.35.1781132359944; Wed, 10 Jun 2026
 15:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528095235.2491226-1-me@linux.beauty> <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
 <CAG48ez38OEE8ZPLyU6nr9=cYx-hMsdoh5WRrv-GMZGMDKyyOTA@mail.gmail.com>
In-Reply-To: <CAG48ez38OEE8ZPLyU6nr9=cYx-hMsdoh5WRrv-GMZGMDKyyOTA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 11 Jun 2026 00:59:08 +0200
X-Gm-Features: AVVi8CdthNiQaFys6OtVKdO_jwR53Q5mhKecw8_q9iDf4OCUN-Dc5Jgmeo3bc0c
Message-ID: <CAGudoHHq-AKfWwRXuVbmz0B3PPK=Z7gW=HeUYOe_8k4fvPJFHA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/13] exec: add spawn templates for repeated
 executable startup
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Li Chen <me@linux.beauty>, Kees Cook <kees@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:02=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Thu, May 28, 2026 at 2:55=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> > This problem is dear to my heart and I have been pondering it on and of=
f
> > for some time now. The entire fork + exec idiom is terrible and needs t=
o
> > be retired.
>
> It seems to me like vfork+exec is a decent UAPI building block, on
> which you can build nice-looking userspace APIs, though I agree that
> this is not an ideal direct interface for application code.
>
> > Additionally there is a known problem where transiently copied file
> > descriptors on fork + exec cause a headache in multithreaded programs
> > doing something like this in parallel. I only did cursory reading, it
> > seems your patchset keeps the same problem in place.
>
> I think we almost have UAPI that would let you avoid this issue?
> You can use clone() with CLONE_FILES, then unshare the FD table with
> close_range(3, UINT_MAX, CLOSE_RANGE_UNSHARE). That is not currently
> implemented to be atomic with stuff that happens on other threads, but
> if we changed that, and it doesn't provide a good way to carry some
> FDs across, but it feels to me like this could be fixed with a variant
> of close_range() that removes O_CLOEXEC FDs except ones listed in an
> array.

Suppose you want to exec a binary with the following fd set:
0 is /dev/null
1 is fd 1023 in your process
2 is fd 1023 in your process

You have tons of other fds and you don't want any of them anywhere near thi=
s.

Clean interface from my standpoint would avoid any unnecessary
overhead and would allow you to clearly specify what do you want.

In this case whatever the interface it should provide the ability to
map 1023 to 1 and 2 in the child. With the current syscall set you get
refs taken on these on clone, then you have to manually dup2 these
which is separate syscalls with extra atomics on top. A fast & elegant
solution would allow you to tell the kernel directly where to install
the 2 files.

Also note in practical terms userspace likes to closefrom/close_range
anyway to get rid of unwanted fds which happen to not have the cloexec
bit which is yet another syscall to invoke on the way to exec. A
better interface would instantly avoid the problem by not copying the
unwanted fds if not asked. For viability for use as foundation to
build posix_spawn over it such copying would have to be supported of
course.

>
> > There are numerous impactful ways to speed up execs both in terms of
> > single-threaded cost and their multicore scalability, most of which
> > would be immediately usable by all programs without an opt-in. imo thes=
e
> > needs to be exhausted before something like a "template" can be
> > considered.
>
> (I think probably a large part of this would be stuff that happens in
> userspace, like dynamic linking.)

I have not investigated userspace, even putting specific APIs aside
the kernel has *a lot* of avoidable overhead.

>
> > Per the above, the primary win would stem from *NOT* messing with mm.
>
> As you write below, I think we have that with CLONE_MM? The C function
> vfork() is kind of a terrible API because of its returns-twice
> behavior, but I think if process cloning with CLONE_VM|CLONE_VFORK was
> wrapped by libc in a way similar to clone() (with the child executing
> a separate handler function), or if it was used in the implementation
> of some higher-level process-spawning API, it would be a perfectly
> fine API?
>
> Or am I misunderstanding what you mean by "messing with mm"?
>

I was not aware of this functionality, let's assume it indeed works.
You still have the file issue described above.
