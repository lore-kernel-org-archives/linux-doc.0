Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92E2B9B7
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729153; cv=none; b=MMWNWqi4VZsday0fUroxst530jkDcDKMy67kvgG5FKAZwlTjWzrVpxAfYpN3lc2a50xlcatMRP8KCri97FPD5OA7bHJzQ1B4OcpOfBCH1clqMl6jT2IoLpSPJH3MzJOVPLQGuDSApNixLRNZQq3lFv2BvEoMX054FKxOwY0hHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729153; c=relaxed/simple;
	bh=Bh+vbRWEtCHPr3v/TxYVyQlY9eCw+4jKdzJK15venuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReRq4I3fqZ5+dxVXDbbeQ6pgfjRHw5stHVnNGJjP/s500zivrSzPa8ejB2ydwSQ0BGHr7e4pCWTj4vJfiksYfdvLFYQha9HZgBymL0mENZ4J3CBKt8F7HlXqgAVIV8tYah4Xox2eMz0Xn6+/E0cqfWDrpFYyHJkiVKm5E0KFV2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UHcfZfA4; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UHcfZfA4"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-660be63279bso4157754a12.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772729148; x=1773333948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qrp021dMmWJfdhg6nU795sTIB1YrtAZr2/z7VwA518s=;
        b=UHcfZfA47idtY+KGeSHAP72e4QLVyxdIn2t51TLjBZVku9eriLGNp6a3VWR7ZzZZam
         S4opISnSOgl2PknMwFw/CPHY8cdZVzvKuO0bh0w8bbvs8TBk8mtoaJ+oM+wIH8XGNo2B
         0dP8x1CwOUbLc5A2puV4shQmJQ/nsMNv4xbLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729148; x=1773333948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qrp021dMmWJfdhg6nU795sTIB1YrtAZr2/z7VwA518s=;
        b=reaUTVF2Xr+q4qsx1CpH+n36QSBPvFo78dHmHnBhKcuX/z8TzrD4A88XgbGy7LmGgN
         rZ+bW67ZhIua1x14LCLNV82pBEK61618pvYRalSelERjIoMY/egyKOtSDSQhjaBTK33F
         HsUMdQdL7ZuFxBlErkKdti1o5nJV+UN44UIdMqDu8xxvSsUxGMLQu/rPyUMJDj5FAG8R
         TFxoqBYiFJkyIWHHVHiVjwXeG9DAOj4lmp+UPW+2ri0Vq8d00JO2BldlZ9N5UgPzbuyp
         wMx1hv1AwFl+4LMw6Q+/IxXIaYitz++Lfk3V8hoDPHw6XiK7u7oVf0dz914VAD1dynvk
         0N4A==
X-Forwarded-Encrypted: i=1; AJvYcCUzKnkKHjMTkv7lN3pKmvwMGLhp8fnLkfRIiT+4hCG2PFlc3NnGe/8R3ttybBKEL7gzGmSnd/vogDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn24TR1ejNwPQQpJp3KriiCkDKz4DuWBB59oWCzT1QYunZNaAR
	0sm7lJUeAuqmvCZVe7kGC5042i8GgtKey9yEV+MBGz7d73I4bjfvPZHaB8R455uRSl3rcYg/XAL
	I155OX9UC
X-Gm-Gg: ATEYQzzXzlZosYkToJXmx/DvLfZawbgTtwO16DvcCq2tkSMT33uPEbbcX9O2quNPOGp
	W5w7d21DkkjeehFbT6+24pc891mXByRQgDmgWHzP+lh2GzhjWHEJS7/4ZAf4QGGrpBLyM/Wd8rs
	XAjJPtHtEUvrVXqrH+o4HxAiZWMNboKWSrpizLon8Fw13XIL3lNVIXU90C17YMG/pzN+iQrhEAG
	JU19zPL6RcyamBTOL+kQvS4+uMB3l4z8cbb5PcLCRVQjt2+nA/mXFhQqfX4qoSTenn8FyX/fReW
	weOGIzzlgJguZUXycYSwI5usOVjE4Y62uf0NvqXg7Jj8IupJETkzZ25uL4/puFjW02WhlO9kII4
	kHo5iEzwJvIkdGywVn7pln1kDHojqbiDzwxy7CtM5y9okXyjYn/rk73rw9RWukQmLf/P4FXmH1V
	hivL3Qpth2/KTIYxpeJiwPGgWf65P8xEmgLvYg/wg5YRpK18JXhYB1mzk6+WuDzg==
X-Received: by 2002:a17:907:9412:b0:b8f:dec3:6606 with SMTP id a640c23a62f3a-b9409e542f4mr193435766b.23.1772729147995;
        Thu, 05 Mar 2026 08:45:47 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9415790e49sm87786066b.23.2026.03.05.08.45.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 08:45:46 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439baf33150so3610022f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:45:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTyt7JBGtgDzEIclIcbYDrmYxFzgWsFB+Rniry60nJKIjEMtn/s8FNrV8L+e7ZPwUwM6saD3SeOjg=@vger.kernel.org
X-Received: by 2002:a5d:6745:0:b0:439:d0bd:225a with SMTP id
 ffacd0b85a97d-439d0bd2512mr4218262f8f.7.1772729146093; Thu, 05 Mar 2026
 08:45:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com> <aamJUImqf4WfTu3d@pathway.suse.cz>
In-Reply-To: <aamJUImqf4WfTu3d@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Mar 2026 08:45:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1sthV5amOahSe1Yc1tkg39JcUUcUDCCHrKtx8i0f-4g@mail.gmail.com>
X-Gm-Features: AaiRm53ZnpY7v-U0Z82fLW6LB8JMvQGKpQVQHkflePvgnIejGRkGGTdAQ9chhDk
Message-ID: <CAD=FV=U1sthV5amOahSe1Yc1tkg39JcUUcUDCCHrKtx8i0f-4g@mail.gmail.com>
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

On Thu, Mar 5, 2026 at 5:47=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -163,8 +171,13 @@ static bool is_hardlockup(unsigned int cpu)
> >  {
> >       int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> >
> > -     if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint)
> > -             return true;
> > +     if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint) {
> > +             per_cpu(hrtimer_interrupts_missed, cpu)++;
> > +             if (per_cpu(hrtimer_interrupts_missed, cpu) >=3D watchdog=
_hardlockup_miss_thresh)
>
> This would return true for every check when missed >=3D 3.
> As a result, the hardlockup would be reported every 4s.
>
> I would keep the 12s cadence and change this to:
>
>                 if (per_cpu(hrtimer_interrupts_missed, cpu) % watchdog_ha=
rdlockup_miss_thresh =3D=3D 0)

I could be confused, but I don't think this is needed because we clear
"hrtimer_interrupts_missed" to 0 any time we save the timer count.
While I believe the "%" will functionally work, it seems harder to
understand, at least to me.


> > +                     return true;
> > +
> > +             return false;
> > +     }
> >
> >       /*
> >        * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
> > --- a/kernel/watchdog_buddy.c
> > +++ b/kernel/watchdog_buddy.c
> > @@ -86,14 +87,6 @@ void watchdog_buddy_check_hardlockup(int hrtimer_int=
errupts)
> >  {
> >       unsigned int next_cpu;
> >
> > -     /*
> > -      * Test for hardlockups every 3 samples. The sample period is
> > -      *  watchdog_thresh * 2 / 5, so 3 samples gets us back to slightl=
y over
> > -      *  watchdog_thresh (over by 20%).
> > -      */
> > -     if (hrtimer_interrupts % 3 !=3D 0)
> > -             return;
>
> It would be symetric with the "% 3" above.

Here we weren't resetting the count, so the "%" _was_ important. In
the new code where we're resetting the count back to 0...

-Doug
