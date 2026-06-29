Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF8388E45
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 19:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760057; cv=pass; b=kd5Da9eEUEjVg6VxSw4j/4KsjloYao76PeYhh1OoIX3+tMIRnhIsPKo55gXbr3hxCHffAhi9/3/x5grnSTE4obdW2Yoa+wSmJg3GOyj1g3BsBwUq7fesM1FEbEQM33hVkJI3PWcig3jcLWdlGNusqTqfBAjX3KLSuqq7YoT3v94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760057; c=relaxed/simple;
	bh=+Z2OEmnJdgjqS1g3yj57KCVy6mHfzWTsN+WLdqFjrxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUp9G+VBNbFN0TuKVtHq7svRmTjlGohUccR+/k6dqQEnOfpPAK1ZwQbJM+N0JkKDTQfdaYgh66N7SBUK2LNhtlA4D6EqOfg8bsWxxexyRZSUbuTqb51i1oOpxfwX+uG6ch2h/Wk7Us2J557Fzx3vloE1rAeMByT3PggB7j/EMX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3m+w0MW; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3m+w0MW"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b011ae0b4so14176921fa.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 12:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782760054; cv=none;
        d=google.com; s=arc-20260327;
        b=SMOeLMXVHlzcPxm76JTrha8pgdGHUAa8qrf2QEuGe0ElecBowyMB8nOEe0Ij9K+X6p
         4KBhBF3UIh9miLqnuLnjkXxfQ4On82y+e4zDKCFN1rtUKnqFGvxxiA641XMjPQTkVbii
         OY0xqhxHC1ZaP4M2lJpezbNVzd48+0nA0cPXt6zZ6spqk2Sts8lNM2HU/W5gEZkfGQ89
         3MA/1wH/TM1ivVKHsHsrRFAnfVx4mzQ9yUoWjSkLm7QSrVuX5MZt0sw280q6Z42t3Ef8
         vLefH8DLmMtg+N7UyYOoj9Xo5Y+zhmcwldBLpoT+mPNeZB1fkl7P5ofngzHg7EMEVQ93
         5T0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Z2OEmnJdgjqS1g3yj57KCVy6mHfzWTsN+WLdqFjrxY=;
        fh=FrVKc3lYl+1s1kOu8zh2BCZg3w5b25uT5ciLtTve0MA=;
        b=BNyhtKDmvRZfDTjmUyeHaU+lk3YpZ2jdWv3R+fsQlW0ws4+1CvrN9PtI7/M0KpcMyg
         KNOH1PMLLHKnhgmKCVSICQWSwg9/14pjJ5lAxhAz+abaHQwj+qnPRNPO055blgQOfTfF
         nT0FnGluV+K5sErPKZT2OyL1d4lB0y+63GSUbjWsdNuMAzF+BSz1M+vHVf8C31ao5JS1
         LbANVLhKTworYD4TeLBkR8Ep/2ei+CcZtUD5uD2WMMQB4QPTV2hsXzPx7lWhw7MFQpKz
         8pn+KnBO1M6b7C/ToNy3YeoHRYBrV77jUs76hP8MLMrym/e41vzo9/Ifdo4HyioKc1OI
         5Chw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760054; x=1783364854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z2OEmnJdgjqS1g3yj57KCVy6mHfzWTsN+WLdqFjrxY=;
        b=Q3m+w0MWqSARc7l05a9STTULeSH4k1Xw1lNOw9sZ0oxr/YasLAwl26qBjYsrRX0bpA
         OtpHXE3zppcuFQotUbLaeC62HhhqwGYlrbYHUNLWXLKG9ZpnSJRWtTe8aqMJVZkQL91r
         fwh7q0tN8jKWtnEk3P1r0snyB0JVWw7MLAP3pf1c5zV3HfOAKGt+jiqiqH+5jPZVmA0F
         XkQJTVxiMgW1zHLWHD8oMmjVC3QCBmVkMhClXnmZjLp8tuKS354xcGOibg0wxsKVmsUO
         hTonyu9cS40fj2c23Km/dlLGI2BBA2Xqw/0EXgC70uwkp61jwd+4MZignHhborJip0g3
         M9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760054; x=1783364854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Z2OEmnJdgjqS1g3yj57KCVy6mHfzWTsN+WLdqFjrxY=;
        b=gHlJi3X/p8Oes5/BqZbPJmd2Y16JuVFTPmD4nk9EFBr2Qdy8lPh2BvA0ZL2x4In4Hh
         JHjsw0NA0lMm6u7EI9TjnUQa6N5b+FLhPSCcOrzlKCqEpLovIhZgwtpYFimCZTG96+xh
         Scrx0zIB//d8CdqzLIwu0+Z3Os0WLDFyJbBcFVj2gq3134eVzs7MnEE8QWP+w2OuDFKK
         Q+UqGdByqw6fDI/NiqnDJ9bvwHkvaOba+vco94LwJHbwfqqKsxJ32n5pIkv1jrYfY3NK
         njVdnwxNurYf0ONIN3ceBhNvZ48zpA1JQpyxmtO+vFMcdgpufHqSpVNpOs2wx8fRbjZ0
         vl9w==
X-Forwarded-Encrypted: i=1; AHgh+RqSpOtqzzAXK5AKq+1l/MGfJjKHzrvbuHAU0g1rAPTRBDF3mh1/XiUthRMr3zDPQY0ycHaVKZNpGoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXGstLhBxfppfw+d6ntRNL9byPXc4/6fAx2BRrJF50XBn8Y/1
	UapAuNkDygWCUXBCP5Kx+OscI14v7TeHpIRsNwVarkI4WtlTp1RE16MA1kGwPEot8/SfsSTov8Z
	MulB8SFeaccFxdzhEj/pZxfLtOUyjpx0=
X-Gm-Gg: AfdE7clGREH/eisodQXUo4q/g0eL/Sr3CODaXyutOaE8kEWQ9XDnw5/eAfEKwwlXYKk
	Av5cn94L9tyBXpYeEv2SSd17/YTNSoYH6jEyUj2dq9s74V5ode6xo2w7awKYUlvyaQ03oSTDGOQ
	Tt70XQBiy4g0Lu7HPJdGhZC7zvgtaGo2+/QvovwoOUQFuU5Dr3d/3Lj3G3KJIS3psVgQGWVcgQk
	AHPMmjpDyoiBIun0rdCqfwHiBbu7HzMAuVJS2nQDWSNmoxQ0rff6YB3CkMGx0cav0Cb2rW9woaC
	qeijwgksGNzy7yw/ckA0NDlwOx2EnIb0axNoSthfPw==
X-Received: by 2002:a05:651c:2223:b0:394:184:f7a7 with SMTP id
 38308e7fff4ca-39b1da8f5f6mr1003691fa.6.1782760053776; Mon, 29 Jun 2026
 12:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629083542.10041-1-lucaslnobrega38@gmail.com> <7f960dca-2de2-4831-8690-a40fdec848dd@arm.com>
In-Reply-To: <7f960dca-2de2-4831-8690-a40fdec848dd@arm.com>
From: Lucas Lima <lucaslnobrega38@gmail.com>
Date: Mon, 29 Jun 2026 16:07:21 -0300
X-Gm-Features: AVVi8Cf5-wN9nhSYqnSyz5AgBk1jFBqAT648csCtFWb1IIWF-rBqtEJoG7PzYJo
Message-ID: <CAMVixxXdTHKVS+oOd6f6qjOWA9-fg329=58e6fXqAO8_hJ9mUw@mail.gmail.com>
Subject: Re: [PATCH] sched/topology: Allow EAS without schedutil for
 artificial Energy Models
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, vincent.guittot@linaro.org, 
	mingo@redhat.com, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 29 de jun. de 2026 =C3=A0s 11:05, Lukasz Luba
<lukasz.luba@arm.com> escreveu:
>
>
>
> On 6/29/26 09:35, Lucas de Lima N=C3=B3brega wrote:
> > EAS currently refuses to enable energy-aware scheduling on a root
> > domain unless schedutil is the active CPUFreq governor for all of its
> > CPUs (cpufreq_ready_for_eas()). This requirement exists to protect the
> > accuracy of the energy estimate: EAS predicts the OPP a CPU will run
> > at from its utilization, which is only meaningful if the active
> > governor actually requests OPPs that way, and schedutil is the only
> > one that does.
> >
> > That requirement does not apply to artificial Energy Models
> > (EM_PERF_DOMAIN_ARTIFICIAL). An artificial EM is built from a
> > get_cost() callback instead of real power numbers, and only encodes a
> > cost ranking between CPUs (e.g. P-cores cost more than E-cores at a
> > given utilization). It never claims to predict real energy use at any
> > specific OPP, so there is no per-OPP accuracy for the governor
> > requirement to protect, regardless of which governor is in control or
> > whether it tracks utilization at all.
> >
> > intel_pstate registers exactly this kind of artificial EM for hybrid
> > (P/E-core) systems without SMT, regardless of whether it operates in
> > active or passive mode. In active mode it never uses schedutil, since
> > HWP picks frequency autonomously, so on these systems EAS never
>
> When frequency is picked autonomously then EAS and energy estimations
> don't make sense IMHO.
>
> Do you have any data from experiments how it runs?
>
> Regards,
> Lukasz

Through my testings, HWP does seem follow an strictly non decreasing
duty-cycle to freq curve, with or without frequency clamping and turbo
boost activated. For me, that feels enough to justify the use of the
simplified energy model already implemented.
