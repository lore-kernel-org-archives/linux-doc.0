Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069F316192
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 17:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018390; cv=pass; b=cDFNzw+18I2dPFOxpHtLAcvKaHNs1m500YmlXGEpN/MBFmTurZW14LICBSFR8JVjI8h/Yw3RsURlzfU7Ah3fbLDc+GxGv4sy9DEHTXzgCr5wzrImu33b28yqYbAWRvQ/ztVVRjzhZ3KKbuY5kNkUyoqRtKE+6yxkaX+skqO8Ghg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018390; c=relaxed/simple;
	bh=5wJnFw3PWGsP/L9WwaFzD4wkm2L2MyUZx6M0XU5KnCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCegVG39BxFzOZ1xKvkOWjrvm6vJO26Esp4g4z0WalT4s8dMrfZkdsGsbN5+MShmFZtLvplQk42ACIih+kcN8hLRScVIuuFc4/Eyej7lMGhDZWowVWUTklMObZJ3HmsQOTCUPM31L0Tp2vR4xd0FihS7m3fzc10EJKSHm+Z8BF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=o2aEcdR8; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="o2aEcdR8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b6c89d302so41285e87.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 09:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769018384; cv=none;
        d=google.com; s=arc-20240605;
        b=J32FwBODypmY+NjECb0n1N1BmYxIm4cct83n76KhoMGTe+7Luu7LHIuWEugPU/E5A9
         pOpKSaVTYEurFumhTWrS1HxKHUP+56cNLHjzSC5ehm36MeNIUsJdhBkPLPkqbFl1dnnk
         S8Rtxt3NGhPK/grp2Bgfj4Tn708iCZn74piLuhPrOd6z3G3j+79kVfplwA0NWehUyTUo
         gI8OvuxuE8sRmeR1lblLXyBdyAdmSSeFDaPoVxCc+CJMoNVPWpmb4dWbJEQzrniPrhzT
         exCVXvZ0HA/WfmIgjvG12El3oLxWEp4VatFBHuOGAGu2bfnwKYkjwyay7Vr73/c/79Ok
         X+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vRpYn7EoZezAdH9Q0rbsZMXmV5i0aMEWNxHIvE4S8M=;
        fh=yESshwBS3zEHTPaBFOH5s15PEApod01uGajj+UW5CKc=;
        b=jK3e0aF6fsLc80zN5BvJpPdPg3iiMEm1GGqaNc11kzThBJV6s74n23jj/uaootsa07
         t1qvpAXR7P+rr/ejV+FiM8eTPTY4mE2CGBrsJLmG8TuyFJSSYeByotMJyD90JeQ5Y0eY
         RSKKLh2kweMkaaq02Qb8lLTwtKsXvk4OF5UKbd3S2YXCElfGHdlqJhd8NTeRzfQsEVa5
         CkC1fY0e6YYJfBRVkajzDlTuC4/j/WKt60XgHeiedFVPi/3Crwikz1jap7oIDXEU90aM
         Mo1izB9MdYxISiRMfylhTOYy3BkACmJhBGSl1xq2yHMRRSpCy1Y9srZk7jCUZ5ht7bzi
         8Q3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1769018384; x=1769623184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vRpYn7EoZezAdH9Q0rbsZMXmV5i0aMEWNxHIvE4S8M=;
        b=o2aEcdR8CzgprfIED4g0hKu8p1nFURaS2aKz9DqXjnhgAOywomyvRXLEDZBCci5QN9
         S3uFDPcXPJddnSKOO5uZzkmPxsbYmVuXF5uZ5hLtfnmsoeQTpNu4ZphpPoerXWx8+FWz
         0AY3ac7EXf8cM5RhhPAHKWM8mXfXzUdxPdRE8XE7k1PfLQq1V4RKjP1VpV5tlPwIImRU
         qk6fUDdga+scTvVKd6ry2mRBi2eBnAqdfmGZqpv1dZ19485ayEI85zKI9+fwTic4B8Zh
         ofgBlOGdIO/3B9u858jBcNoQd83x3FEF7tbYLDlYyu2BqI+VDI92Sw9irlHN174jzzeh
         SGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769018384; x=1769623184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+vRpYn7EoZezAdH9Q0rbsZMXmV5i0aMEWNxHIvE4S8M=;
        b=oT/GDmG99GA7G44s23j1xUqrbxTT2Tdid66RIBAI9tSxZhdzoglRWVv1a6WqGvze9n
         EmyZT/FqsKA5opmInL8uGETykh2iGxfcJp+cQAfZouBAVzrvtQdjRgOgTNZuUU4AAvLA
         UnOykMS9cz8vtjTcEonecsf66pnEgKrlliWHh7tx1gYIzmfQmJkDX1EeWptXe5s4eVnA
         6Ds9o0Cm5SN7THco4GLV3eOPkRAbYhkzRZndYfOtBB8rqyaQOudB4U5B+ZzkG5+FOCVs
         i4Q2S+RwUu31gwe1X7xCJ47qupARzLtbGmCgFJxvrUvGBd9B3ocSMGbwCa3Pi6T3SIDv
         UoSw==
X-Forwarded-Encrypted: i=1; AJvYcCVCTgtqWPGiB7mzVyN3H25JareJpmzk9f11lOuS04dVWpPtFKCHGISqSZsrlepc6A8VLySRAK5H33Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50hWrEoCw+jbGRIxP0JPqutv30M3V509oGbYQklqbAzLD7YFR
	u3vc07e8tx4ICR/0bj+dEngCTzdXJ5yWxKIXg+Wil7PNv/3ZnQs4XAAGEAxPVzfPFcDe8kGIkDv
	MHUsWr6QPUDg7gJWvt5dKkdH+dLlmvlIGg2UBhHLw
X-Gm-Gg: AZuq6aKjtR5PfaYNJFteBMTwFzFmCugizaPtIuafG+esvbrSBAboom2R9vDxmu6EM2u
	J0OI7Vt6QhdzZHNey6AkiV7Hp3zpWely94H4U/FdMFguhKRqQUJvBPysBvCiLwB1KPXJ82gRthA
	GRM+IBiS628JHqv3/Yt33nZdFITNU/tO4099PRHTzm1FhouxVj6C+S+QCQYyV4PlGGc9yvCRSIU
	dlhQRwiBPvL8dc+3PsjpTVZYNmpJN6sXD8N4376DBf24hEYD7DusEKyH+FMa3FfT8QM8CN2oaI6
	04s=
X-Received: by 2002:a05:6512:12c5:b0:59b:70ff:200b with SMTP id
 2adb3069b0e04-59baeef1846mr5712407e87.53.1769018383603; Wed, 21 Jan 2026
 09:59:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
 <20251211124614.161900-7-aleksandr.mikhalitsyn@canonical.com>
 <CANaxB-z8+UhZ+smuocN8h+YZY9tdKobhAu3H6fmzq+WzFmMrjg@mail.gmail.com> <2026-01-21-tame-yapping-name-paste-hnBZQp@cyphar.com>
In-Reply-To: <2026-01-21-tame-yapping-name-paste-hnBZQp@cyphar.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 21 Jan 2026 09:59:32 -0800
X-Gm-Features: AZwV_Qixaq2tKaBHL4PHonGnZsPxxYvp8csVlFiB7Zqqz-exNx5TDrfDXNalgoU
Message-ID: <CALCETrXbTjD4ChWnhH8tRZ8MSGQqfueQPwv9EvT_aQ8gnnfaEw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] seccomp: allow nested listeners
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Andrei Vagin <avagin@gmail.com>, 
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Tycho Andersen <tycho@tycho.pizza>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:43=E2=80=AFAM Aleksa Sarai <cyphar@cyphar.com> wr=
ote:
>
> On 2026-01-20, Andrei Vagin <avagin@gmail.com> wrote:
> > On Thu, Dec 11, 2025 at 4:46=E2=80=AFAM Alexander Mikhalitsyn
> > <aleksandr.mikhalitsyn@canonical.com> wrote:
> > >
> > > Now everything is ready to get rid of "only one listener per tree"
> > > limitation.
> > >
> > > Let's introduce a new uAPI flag
> > > SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS, so userspace may explicit=
ly
> > > allow nested listeners when installing a listener.
> >
> > I am not sure we really need SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS=
.
> > If nested listeners are completely functional, why would we want to
> > implicitly allow or disallow someone from using them?
>
> It can be quite easy to deadlock a process using seccomp-notify (even
> in the single-notifier case) so especially in the case of container
> managers I can see the argument for wanting this to be an opt-in thing
> once container runtimes have verified their notifier won't break
> nesting.

Is the deadlock such that a process and its manager can deadlock in a
way that's hard to kill?  Or is there some problem that could
adversely affect an outer manager?  It would be nice for these
features to be automatic instead of opt in.

(I just wasted half an hour yesterday removing use of
unshare(CLONE_FILES) from a program that didn't run under a container
manager that, for some reason, thought that was a sensitive syscall.)

--Andy

>
> > Actually, even the current behavior of SECCOMP_RET_USER_NOTIF looks a
> > bit illogical. I think the following behavior would be more expected:
> > instead of running all filters and picking the most restrictive result,
> > the kernel should execute them one by one (most recent fist). If a filt=
er
> > returns USER_NOTIF, the kernel pauses immediately to let the listener
> > handle the call. If that listener then issues "CONTINUE", the kernel
> > resumes by running the remaining older filters in the chain.
>
> I guess there is a philosophical argument that earlier filters are "more
> trusted" but the seccomp security model has always been that the
> strictest filter return wins and I don't really see a strong argument
> for deviating from that for USER_NOTIF.
>

I don't know if I agree with that philosophy.  I would think the best
philosophy is that, when filters are nested, the innermost filter +
filtered task combination acts as a unit that is filtered by the outer
filter.

Without notifiers and without filters that overwrite errno, I think
strictest-wins is a decent approximation -- the choices are kill or
allow, although one might quibble about the various forms of "kill".

With SECCOMP_RET_ERRNO, I would argue that the behavior would be
superior if we just stopped processing filters after an inner filter
returned SECCOMP_RET_ERROR.  After all, the effect is to do no syscall
at all, and having a process that didn't do a syscall get killed
because it tried a bad syscall is kind of weird.

With notifiers, this is all rather more complex.  Notifiers can
emulate syscalls, and having an outer notifier somehow process the
syscall that was replaced by an inner notifier seems rather weird.  Or
suppose that an outer filter wants to prevent some operation, but an
inner system wants to emulate it in a way that doesn't do the
offending syscall, why not allow it?

So I'd argue for considering changing the behavior for everything,
maybe optionally?  I'm not really sure where TRACE fits in.

--Andy

--=20
Andy Lutomirski
AMA Capital Management, LLC
