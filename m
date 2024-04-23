Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7013CA8A;
	Tue, 23 Apr 2024 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713894218; cv=none; b=averEAQGzgCpzu1vxnSHj/9cqLPtUQsUXjAHgdb55vk0OTUwUIxUvQN5OTx6Qiedi+Gwz7xk+KAI9IB56Ni12JO9HbPeRfdeEYbowBGdvKNru1OVFoFrJmX4LbapR4oZeK9luEZq0iEXKgk7sx2pvIrof0H1rPulufvrIrxQFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713894218; c=relaxed/simple;
	bh=obP4SHgTd6qHA5VLsgw9J61AXXKZ9tt8WZ5YkgveSNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNGpoisO5duB9nTuuSJz1qWreuZxSbhMv7mfHtUx++7MuaeapHFD8Gmiv9xj5ralQz6Gfu3AJcH2JHe/e7CFJ2SYdGj7rvNhWVbrPpCvYDP48SAPusfcpvYbIvxSzImkpjWfD4yZNVx1tRnwdV7fY1xMDeC1Y5p+64HSnbyz6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmpBnoe6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmpBnoe6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-346359c8785so4886386f8f.0;
        Tue, 23 Apr 2024 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713894215; x=1714499015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvb1vi4MFCayo9L1pNhOnraYfrdeLerBM7wkAW1E4hM=;
        b=BmpBnoe6emTK39sGPhVHVa7EhjUpCrn7wBZfhw2v3tXPl0UCoO25w6067he0u/TMXy
         lWas721XoPWO/NG64n1mRP+GtmiKLM/KmzhwpA0p5PYLLLO2vF7yznzAnCIXeRm12OY0
         roAYZx3YSIuVflZO2VFdxJvXH57jPz2c37eKotk/5JSQ5Ixyr19FF0ZMHXyp7zRwloWb
         o+8YOB0MZVPlm2wP0T+0oYbg0hhRGQY6wZ3pv0QHCZtw3NUuXbmVj3pC4Yu/4gem6w8T
         d9VcHLOvO1fyUu0/KCqvEM3mUwUsSSmYAmQshDmFSkrTMjDIYC72YTDXF2Fm+gZ55Ezn
         Bjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713894215; x=1714499015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fvb1vi4MFCayo9L1pNhOnraYfrdeLerBM7wkAW1E4hM=;
        b=criPtMMUDDPC7Hq76YYBg+E22qHp+CzUcc0ZDyuhJs5r5QqjGmyZ3dqDrDEyHj9kgU
         pUndkT3QsGt1EKYxju2ixXS5UNFYQfn/j5ka/9F9p/2BrxHNbzCq9496H3ccYNeCP7iJ
         DM4HZsLVs+64+aJIPFuVi4cAkbVsWCpnLJ4aLwpeYr5+d3nX4OhLpFpV3kZpZ3zGkjqf
         kk4qNUjnILoatHix6OMPKiSyAvrnVwSR7sGm0K0kZjld5pJd7VNuf4k2C6msxoc0MPp7
         uBnEs3fjKnjYSOAcbrcchzD/uXnl6sVxJ6XHpbFX6/APAP3B7aGtzJZ+oNKuzLYc1CQS
         r+GA==
X-Forwarded-Encrypted: i=1; AJvYcCXHxOGHmw+7kfzfYwM6XVGyzYZ/mc1TnRPy6vu7xRCT51Dc6jQvJChR78Q3EU9pSuwKE6XYlCcx1SW9D8BJ77rHsK3Q6UL4i70ruaf5Ht1OPep001IYizYrKztxmFBi+o30WI5gZHiC
X-Gm-Message-State: AOJu0Yz/ovxMPXVAPvt6IC5meT114krwIEKcIe9x+0FxCnWi3ACg499c
	Y0rtSBPN0pS+iLcF9Tl3Frz2mL2hBC1++ShI2mmpicNaM/Ei3mdGKJA3dXtFhUZIu9ojIHuAggz
	2UmCo3NrsAlIe8LA5wm6j6HNoTpw=
X-Google-Smtp-Source: AGHT+IFEvqSu/RTLqD0lu3rECewKObZGjr4kQFG2ub8v9v9bZi5qL9vy+yi3PZhvF6iKZTvGNwmCRJpjIEwfiBeDZRk=
X-Received: by 2002:adf:f350:0:b0:345:c359:d34a with SMTP id
 e16-20020adff350000000b00345c359d34amr7541863wrp.59.1713894214548; Tue, 23
 Apr 2024 10:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFkJGRc824vYEufG=6ZVPAW2iVpd0NDThJadZVrUk_ZND_qJag@mail.gmail.com>
 <Zh6Xbqijp8rRGo1H@archbtw> <CAFkJGRe+UpNPSnSL623o6G+NCkK_uGPx-NCNLQx0vSGpMo98eg@mail.gmail.com>
 <CAPzh0z8RySn429XYQHoP_c9UA+pb6SLHGhH40vQDhc3P2xiysQ@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw> <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw> <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
In-Reply-To: <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
From: Josh Marshall <joshua.r.marshall.1991@gmail.com>
Date: Tue, 23 Apr 2024 13:43:23 -0400
Message-ID: <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
Subject: Re: Feedback on my development setup
To: "Bilbao, Carlos" <carlos.bilbao@amd.com>
Cc: ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, pranjal.singh4370@gmail.com, 
	"bilbao@vt.edu" <bilbao@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Carlos,

My intention right now is still to gather feedback on the draft!
Everything, including if it should be sliced and diced into other
places, is up for consideration.  The final intent is a patch into the
central doc tree and not remote documentation.  I'll wait longer to
gather more input before replying to particular points.

On Tue, Apr 23, 2024 at 12:40=E2=80=AFPM Bilbao, Carlos <carlos.bilbao@amd.=
com> wrote:
>
> Hello Josh,
>
> On 4/23/2024 10:34 AM, Josh Marshall wrote:
> > I have a draft document which I would like broader review on, which
> > currently lives here:
> > https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspace=
.
> > This document is to ease the setup of Kernel Development.  I intend to
> > send this in as a patch to the mainline doc tree once it gets by a
> > suitable number of reviewers.
>
> It's great that you're interested in improving the documentation. I've CC=
ed
> linux-doc list for visibility.
>
> However, please note that we already have existing documentation, and it
> might be better to extend what's already there rather than creating
> something entirely new. You can refer to:
>
> https://www.kernel.org/doc/html/latest/process/development-process.html
>
> If you still feel the need to start a new document and host it remotely, =
I
> suggest updating:
>
> https://www.kernel.org/doc/html/v6.1/process/kernel-docs.html
>
> If I may offer a suggestion, focusing on documenting the challenges you'v=
e
> encountered with KVM, etc., could be more valuable that trying to cover
> everything.
>
> >
> > On Fri, Apr 19, 2024 at 12:15=E2=80=AFPM ngn <ngn@ngn.tf> wrote:
> >>
> >> On Thu, Apr 18, 2024 at 05:40:20PM -0400, Josh Marshall wrote:
> >>> Looks like breakpoints aren't working?  https://paste.debian.net/1314=
501/
> >>>
> >>
> >> This maybe caused by Kernel Address Space Randomization (KASLR), try
> >> disabling it by adding nokaslr option to the boot options.
>
> Thanks,
> Carlos
