Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC13859DC
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 06:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769149638; cv=pass; b=dkm+6fPe9DE/EHhvmWd9dE3EHBww/kzNKby+fagh/IQaJF2dB5j4Mo37LG6Mn7Khg26ktcRA2jLxWZ+8ueKFQK5quILFJ4BmopCZhsHqzPCSdMhnNlVL/TmW/iK/mCA+XwJN6lCPWpCj43PfXdycfNO/Dm/tf7ewsf2ABjKhNls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769149638; c=relaxed/simple;
	bh=/g24220hfxR8g/nmEXjyW2cLh6pnmqTheHHJrLvBJaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rq3D2WBc+LJ/yqboNtlDuQevfsxVHltXM5Mqnj/UZQ7p7U3UeH3UOVWo07COynI9GM3IKCJpGpS3hxej45jnrqy20fEMngbwaqmoCYhiJlg0SdkbDYSPqV/+LzGtPsrJs0ldqCmrDkhUG5HGSGKo6lQHqv1Cd+HCn1pj+lDemjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcELQWXS; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcELQWXS"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45e934bb51dso518769b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 22:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769149627; cv=none;
        d=google.com; s=arc-20240605;
        b=fzo9JZsSIIC2VM2s4wjFikPrdNbBap59pM8RXgkKFoNOc121KsN3GJiXS5K/vBIHZZ
         lZi536up7CLq5FxycXp6Hn/cWfN0JZsn2gPk/U1JR/DtwDRFNuJDAP8nWZ+L1KHTNH+i
         pKx4PpSGCxfM2pCewAlO/+d+PW63aNx0aK6aGXcbPzUfizQ1TdiAOwrkyDX0lFAMxt09
         eA2P5qSG7gf5jQ3ENuCPTrDMpsJOWNa4el+IiUavqY8i2WZT8bxc8WKv+1AdKDim4ZNW
         AewlP3ssjFd4lmghHvejA+WcN/KUsXUzD7T6SRJD9GjyxginXZCTVvAuYsk65LlV7qPy
         h4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xLh76lI9xc8rufp/ig7bo8lHgIrl5DJsWJuCgT4OsJE=;
        fh=4gaNv5fL0SoWL8r1URusNyPIEJdr19yKH+mqYF8gcpQ=;
        b=DNwt2pnnRJ7ZiaMO2uWIQ9VyxWlKyNI+tDQf0RF1YnaapN50pDa0fNHowKm34WllRW
         V95r34k95Shk4b1/k0FuHZ5wcjasTftMq6JzEluz8yb0kfVHzGhFp00k6WtXpp8V857D
         pAGGvMJFOsL6S6rqUcPa22gzHCJ5EH4uKeo9nAS/D++ZWsi4qARXgjXwPCWaBn5wuSL+
         RczFIGwWfjaDmQ52A92xBoOHNYR2/+BnbKTg9afbptp6AYbdEwEXusnc/9aZnFl8zFin
         pu8QUi7EE0F3SXICkl0CrcFP6VnckIkSn6yla0q8VQA2C0tw8TbDeFhpE/zvwrB2D9F7
         MrPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769149627; x=1769754427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLh76lI9xc8rufp/ig7bo8lHgIrl5DJsWJuCgT4OsJE=;
        b=KcELQWXSQkotfogKWp1BAgg+T2wWaTSaTp6605PCFLmhm22e3nxcP80l7VlHVOpKcO
         zpm+9iKgkes79aG63YGWTQID55hzmrUWYv9oiTvYsPXovaBwIcBCXEsBHqIJouHv6QTy
         RM4bq9uR3EEVsvntm71ELQqOVNgZiLJ+iH9SFvV+y3K7cngnL2pewuIOv/DSzo6dTtg7
         AgvYRV802ht5yHo+v/SA1veGZM5RiHuaI+DKMh41OyZ/ktlTrOBajxKen3oHXjRMyke2
         6YIkPaRyHqNElay/hFPrKPLVOxFV+M6OZXt59SwVq3aqBfUQM0526p22YdAuOh7nVUdd
         2SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769149627; x=1769754427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLh76lI9xc8rufp/ig7bo8lHgIrl5DJsWJuCgT4OsJE=;
        b=m2jUXBECde16SxYxKCMEWy7LEthOfMjm28LrwtSIAwWF81VdMoW9UEeZ5ikCTVkNS4
         h1+nT3tqeBBDzrf4/XHnbXj5WEMdi7ilIzmEtd8YySluST2EEl1pTRmhNbugNNKG8XX3
         /VjQ3t9ftNVTuBukYtpA7wVqt4sqFK6H3A+6fUH34tid+94uDnlRAFbIbaHbz9MPrHON
         0hmfQ4nHsF/Jv1zuLfTT9uGaeRBDrvbt7h1Hb8PJQ0AjDliB/qr4aWk4k3Us2POTQzwo
         vTX+kR+M6IbDEbH4wSFt4ycnKNR0uffm26G0sPjysUYXqBHfhS/nqrmIOXxxCN2oUUQp
         7YnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyHXPyZCJH/7ByrhodfFR73dVluZc8GhUY5Ir3zevFbGlQQYfD6AeMC5//J7AKZ3oxYIrK8FuUwjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmGeXchzpYDBGhAZNk5GVXpVtFex1RuZ7lnq9zq/O0jY0dgqS
	WbY7WUaYXYqg0otnkSfftvpGhfDyuwLJT+ilm94UeEF7KA0/fffuIY0DDshcfSQDTrdReR1gQ1J
	tnEXDgeI522JB0DP78nA/co7e7EAWPNk=
X-Gm-Gg: AZuq6aJVhvhPo2XamUjVYtlwJu0JJopF/2QPy3ceXelv3ZFeHkLTqVKuo7jTT6VrQbz
	yKfdRtQH40n+JUpJ8D3rT0s5EsItEP2m8TNDq1OFL6ZhiQWFOC1HsbwQVLLgwyMD8+UUpKH+P9g
	jnpR6I09XCgM4iXnnwjfmV50wOnNLnUnh8T4upkLzJ8gDYXHkSf4XkWbX1U0GGJFyCmFEz3pG78
	sZSEc0LsXTKjbX34DStn3P/G5zqjCbDUX8O+fUK8/4Vz1ruhp3PL1TpPwipFieyeGtGgjc=
X-Received: by 2002:a05:6808:4f66:b0:45c:8a1c:8912 with SMTP id
 5614622812f47-45eb1d246bfmr1027876b6e.41.1769149626937; Thu, 22 Jan 2026
 22:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
 <20251211124614.161900-7-aleksandr.mikhalitsyn@canonical.com>
 <CANaxB-z8+UhZ+smuocN8h+YZY9tdKobhAu3H6fmzq+WzFmMrjg@mail.gmail.com>
 <2026-01-21-tame-yapping-name-paste-hnBZQp@cyphar.com> <CALCETrXbTjD4ChWnhH8tRZ8MSGQqfueQPwv9EvT_aQ8gnnfaEw@mail.gmail.com>
In-Reply-To: <CALCETrXbTjD4ChWnhH8tRZ8MSGQqfueQPwv9EvT_aQ8gnnfaEw@mail.gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Thu, 22 Jan 2026 22:26:55 -0800
X-Gm-Features: AZwV_QjolQPlnm8945yQvy89Hfv-TQEfT1zp81y68B95Qi1yXjIueT-IBgv1NeI
Message-ID: <CANaxB-yqvHx7rWK4Efq8869ai6TEd3SCLDCLrHq5rhXGPNV-1g@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] seccomp: allow nested listeners
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Tycho Andersen <tycho@tycho.pizza>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 9:59=E2=80=AFAM Andy Lutomirski <luto@amacapital.ne=
t> wrote:
>
> On Wed, Jan 21, 2026 at 7:43=E2=80=AFAM Aleksa Sarai <cyphar@cyphar.com> =
wrote:
> >
> > On 2026-01-20, Andrei Vagin <avagin@gmail.com> wrote:
> > > On Thu, Dec 11, 2025 at 4:46=E2=80=AFAM Alexander Mikhalitsyn
> > > <aleksandr.mikhalitsyn@canonical.com> wrote:
> > > >
> > > > Now everything is ready to get rid of "only one listener per tree"
> > > > limitation.
> > > >
> > > > Let's introduce a new uAPI flag
> > > > SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS, so userspace may explic=
itly
> > > > allow nested listeners when installing a listener.
> > >
> > > I am not sure we really need SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENE=
RS.
> > > If nested listeners are completely functional, why would we want to
> > > implicitly allow or disallow someone from using them?
> >
> > It can be quite easy to deadlock a process using seccomp-notify (even
> > in the single-notifier case) so especially in the case of container
> > managers I can see the argument for wanting this to be an opt-in thing
> > once container runtimes have verified their notifier won't break
> > nesting.
>
> Is the deadlock such that a process and its manager can deadlock in a
> way that's hard to kill?  Or is there some problem that could
> adversely affect an outer manager?  It would be nice for these
> features to be automatic instead of opt in.

Both a process and its manager can always be killed with SIGKILL.
I=E2=80=99m not sure I follow the specific deadlock Aleksa is referring to =
here.
In my view, an outer manager should not care about any syscalls that
processes are calling and intercepting. The outer manager must be
triggered only when a syscall is going to be executed "natively".
This kind of overlaps with the second part...

BTW: If a user wants to prevent the usage of seccomp notify, they can
always install a seccomp filter that rejects the seccomp syscall called
with SECCOMP_FILTER_FLAG_NEW_LISTENER.

>
> (I just wasted half an hour yesterday removing use of
> unshare(CLONE_FILES) from a program that didn't run under a container
> manager that, for some reason, thought that was a sensitive syscall.)
>
> --Andy
>
> >
> > > Actually, even the current behavior of SECCOMP_RET_USER_NOTIF looks a
> > > bit illogical. I think the following behavior would be more expected:
> > > instead of running all filters and picking the most restrictive resul=
t,
> > > the kernel should execute them one by one (most recent fist). If a fi=
lter
> > > returns USER_NOTIF, the kernel pauses immediately to let the listener
> > > handle the call. If that listener then issues "CONTINUE", the kernel
> > > resumes by running the remaining older filters in the chain.
> >
> > I guess there is a philosophical argument that earlier filters are "mor=
e
> > trusted" but the seccomp security model has always been that the
> > strictest filter return wins and I don't really see a strong argument
> > for deviating from that for USER_NOTIF.
> >
>
> I don't know if I agree with that philosophy.  I would think the best
> philosophy is that, when filters are nested, the innermost filter +
> filtered task combination acts as a unit that is filtered by the outer
> filter.
>
> Without notifiers and without filters that overwrite errno, I think
> strictest-wins is a decent approximation -- the choices are kill or
> allow, although one might quibble about the various forms of "kill".
>
> With SECCOMP_RET_ERRNO, I would argue that the behavior would be
> superior if we just stopped processing filters after an inner filter
> returned SECCOMP_RET_ERROR.  After all, the effect is to do no syscall
> at all, and having a process that didn't do a syscall get killed
> because it tried a bad syscall is kind of weird.
>
> With notifiers, this is all rather more complex.  Notifiers can
> emulate syscalls, and having an outer notifier somehow process the
> syscall that was replaced by an inner notifier seems rather weird.  Or
> suppose that an outer filter wants to prevent some operation, but an
> inner system wants to emulate it in a way that doesn't do the
> offending syscall, why not allow it?
>
> So I'd argue for considering changing the behavior for everything,
> maybe optionally?  I'm not really sure where TRACE fits in.
>

gVisor (a user-mode kernel similar to User-Mode Linux) is a real-world
example that is impacted by the current seccomp behavior. The gVisor
systrap platform uses seccomp to intercept guest syscalls so they can
be handled by the Sentry (the gVisor kernel). All guest syscalls are
managed by the Sentry and are never executed natively.

Thanks,
Andrei
