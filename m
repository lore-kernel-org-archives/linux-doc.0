Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B937700C
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349374; cv=none; b=lzQvooJXmAosuorQ5f6Xf2yZS/3sC35agl62ZOb5w5bMzipd8VSZDIQTglGQi1N+HtlWdZvo+IU5s4FxbeBeXoa5aJ5k/PZEtuL1yzeAAaI554Cbkoq7afwHMcu43fqiTL7Q4weB6ne6bYXhenEF19LMg09hdb9DJLkBFhztCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349374; c=relaxed/simple;
	bh=kOWDX98oHGYzMomiYhuSPXUXPxvsNhRqML+V1MRveAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4i4Tqx/aWgiS7UY67uDfY6GKYXJmeJqQDfuYMfXWSITabYaaIn8hkkOR7GlIl5oO9q886hpGnQ5Ioh+iEwpEIkbbHALPjUUtQ3Rp4D8N4mYg0TVi0vuf84c/LpurmoifoRyZDXUbLGZOHVgsP44mULz/Ctj28e1gzTYTOXE+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E4v/i9sh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E4v/i9sh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b940a00415cso185320666b.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773349369; x=1773954169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CZGih78gOo1vdXmTA78mOlvTQXwFMTivSF45rX9X7Q=;
        b=E4v/i9shHg66NGR0QifD1K2IAPlilXWfYkNTUDwmsYwrYCWky0unnCzw2EmP0h/0lG
         Iw15g3m8h7StQykcEh4N3HWfNPVnkMs1Zqk2bBzqR9mkxE2ti+PvsY2DyquQTWCkEVeo
         Hrz4ss+NV+SOhvjpNZ96vwXfpn4B/HWHVEyeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773349369; x=1773954169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CZGih78gOo1vdXmTA78mOlvTQXwFMTivSF45rX9X7Q=;
        b=wP5n2MY02591/DZ0+0TzThsqbgYHv2ZwVL+Vg+6dPLdPIVGyw5OYc2vKULeGweF+OU
         PXKRlhJy4FTIG/n58AR9HfvbOZXlB9qUIbjkDOqbuFF2CdUhvw5H8ZN8ygHio/4uBf4s
         h0/RjkvdGs/qO1OKkmnU1CVt1ZYNDFhtO4Z1NvQ34jJNK3n/dwPExkkn3yqPddRtC5xB
         C9sBC9DQGbns2P7mfFllzAP0CVG0IE8WaQ4g6LqmYCHX+2U0nc+n+RQtNEsbj0oPbtvt
         mcbHpPXdUX4kh0JZIkgfBuWNPVLfR/M0P0mtVh82Qm69AzDh1fCr541DVZLabPbhW+/F
         2DYw==
X-Forwarded-Encrypted: i=1; AJvYcCVHxrpDDCXxidNzjKPxtDGTPJU9X8IFatyQ6m/3n510qu864T9usgUZfQ21weOZlYYjfLIuqeykPrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdhr6ivx3I6ww1qnWb+Xk4HXNptBxcZGONI5qrcHcqs4LFtKvU
	WkF3+KBahjQZ0Sdn0qYNFmTTaugb/7pyZJfi3IbUXnuwWmaaPyaFBsPVC9mXXGwFLdDDT02HUeX
	RBPQ=
X-Gm-Gg: ATEYQzzpTHVwjtxJVGchAY33fy8Rr+tCW7SHgvj8L2FVKPN8+6wVi//DSXb9pCrHkQf
	5doU+DMfsqldsvgVpWZW2YsGTyDNJpJwtwJlTHegUOT7oUNYU1ntj/a7yxqj+o7UbTlUoKQbxel
	jU2sHbvjMidZm+3RAhE7A8k5QWtbe8XLK4/zkw7ZGCUrOzdYtBtZUQ11duv20vfeKXrRmtHcyzl
	OJi/9FNYKPhVaSWOD/RpNmcl/Zh2abFByDzqhB2Mf06cc2oLZ87VShm+OMswFDwTtDpx1RWas4q
	RC8yNRk3ysUw0wfDU+YnluVlEMj+sH9FDP1f1W9byNQazubzcavwMElNZAHJ1UexW7I4gS8ttbO
	S9knFyNKpmEqcCR1xWXj/omzFS7G3JqdgLX6OmYQIJNbxBHtl/ocYEeYDHiCtSQtPzs7dVTaxjo
	dEZGuYRO+Y83qgpBDGanaZrj8xbhaqhiAgoaJ7ulnmo9OHx8FhYozoov1SIJGdFg==
X-Received: by 2002:a17:906:f92:b0:b96:ed21:f46f with SMTP id a640c23a62f3a-b9765052cddmr38942066b.14.1773349369242;
        Thu, 12 Mar 2026 14:02:49 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e184793sm162666266b.46.2026.03.12.14.02.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 14:02:47 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b940a00415cso185310166b.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 14:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX39NuT9G/gbqD/n5EsXnQq7yWE3bM2u7WXsIQ20aY7uLxHOPKg7PUGoa5Kd2GewoQ4lsAp2oR65Xo=@vger.kernel.org
X-Received: by 2002:a17:906:4792:b0:b94:1224:c627 with SMTP id
 a640c23a62f3a-b976508754fmr49681366b.27.1773349365996; Thu, 12 Mar 2026
 14:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com>
 <aamJUImqf4WfTu3d@pathway.suse.cz> <CAD=FV=U1sthV5amOahSe1Yc1tkg39JcUUcUDCCHrKtx8i0f-4g@mail.gmail.com>
 <abF3BijtTWibBsoG@pathway.suse.cz>
In-Reply-To: <abF3BijtTWibBsoG@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Mar 2026 14:02:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoUtpwFd5XR+4dKqbPH_vCNz0ydefaR8vQMQu4_w6HNA@mail.gmail.com>
X-Gm-Features: AaiRm51x7fB76NcGzg2Hg2siNh9RmrPqHPWNjlJZN5f-4ghyNUpd-izue7TXihc
Message-ID: <CAD=FV=XoUtpwFd5XR+4dKqbPH_vCNz0ydefaR8vQMQu4_w6HNA@mail.gmail.com>
Subject: Re: [PATCH 3/4] watchdog/hardlockup: improve buddy system detection timeliness
To: Petr Mladek <pmladek@suse.com>
Cc: mrungta@google.com, Jonathan Corbet <corbet@lwn.net>, 
	Jinchao Wang <wangjinchao600@gmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>, 
	Li Huafei <lihuafei1@huawei.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 11, 2026 at 7:07=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2026-03-05 08:45:35, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Mar 5, 2026 at 5:47=E2=80=AFAM Petr Mladek <pmladek@suse.com> w=
rote:
> > >
> > > > --- a/kernel/watchdog.c
> > > > +++ b/kernel/watchdog.c
> > > > @@ -163,8 +171,13 @@ static bool is_hardlockup(unsigned int cpu)
> > > >  {
> > > >       int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > > >
> > > > -     if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint)
> > > > -             return true;
> > > > +     if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint) {
> > > > +             per_cpu(hrtimer_interrupts_missed, cpu)++;
> > > > +             if (per_cpu(hrtimer_interrupts_missed, cpu) >=3D watc=
hdog_hardlockup_miss_thresh)
> > >
> > > This would return true for every check when missed >=3D 3.
> > > As a result, the hardlockup would be reported every 4s.
> > >
> > > I would keep the 12s cadence and change this to:
> > >
> > >                 if (per_cpu(hrtimer_interrupts_missed, cpu) % watchdo=
g_hardlockup_miss_thresh =3D=3D 0)
> >
> > I could be confused, but I don't think this is needed because we clear
> > "hrtimer_interrupts_missed" to 0 any time we save the timer count.
> > While I believe the "%" will functionally work, it seems harder to
> > understand, at least to me.
>
> My understanding is that we save the number of interrupts
> and reset missed counter only when:
>
>    + the number of interrupts is different (timer on the watched CPU fire=
d)
>    + the watchdog was touched (hiding delay)
>
> =3D> it is just incremented when the timer was not called
>    (hardlockup scenario).
>
> In particular, it is _not_ reset when we report the hardlockup.
>
> Or do I miss anything.

Ah, I wasn't thinking about the "non-panic" case. You are correct, we
need the "%" syntax in order to handle that case.

-Doug
