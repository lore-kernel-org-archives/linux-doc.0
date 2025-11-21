Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E041231C9F
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746334; cv=none; b=YqJ+laX6Y4w0j5yhdjjDPEMWTKX0kRzZNHpZGMZcZoJ7fbP1qXNM74dqKAhbH+UzOQhi70ivyol/uva3t7sxZ93wzwwcF2HcsU4oMokcReuh6FXSmu560uioVyb8DUK0EdCV29Z7qNZ9WSWjKZOgmH7EuydpV5JmJ6B4GMWWMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746334; c=relaxed/simple;
	bh=kth0y7HTa9SOKIU9g0nLJ1NK5z0zg64snesxFb7xaaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0OUwJRYMHl+OdcUtVo71ZuwgOYJd7/8U9rdgVfshUgy3ODIqsmoyOI8JUv5Pe1TvOuJin24Ki9zI3dUAVfLoKeGrOVK+uWWxYJ6gHdtsw87mB9Fo06CUx0EZdlXXxyaAW+xF0K20oUYxb/bNpfEUg979x69TbDjAgN0cEYX2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v8zLkXCM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v8zLkXCM"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5958187fa55so1830996e87.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763746331; x=1764351131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kth0y7HTa9SOKIU9g0nLJ1NK5z0zg64snesxFb7xaaU=;
        b=v8zLkXCMMFZcibfoyLGEaykfU0GqSzBf/fH8MzvfOx4UpRlJtaZZ45ZSTu/2lasd7n
         Yne74jDpttIVknxLguSWthBre3JFNRoUK6tMT52M4fex+CxTb3TJMvO/r3DEniCL/ams
         hWBWsa9zEW6h7qQTmeV2WkJ8h//2KVzAthUREbfx+4kMnbk7SpuxDC7mef08sDvfNe0j
         fBtzNGSoCwcTDlvI9c2t1E9MQRm0/sOTCfFt1i4KajiA3M3nZcmRY9C/AAsVVczz29UZ
         DbR+PPOK80PG0Ht+PzGhNT326rqyxKZrjGXIuy2Bk694a1fcGEl9BpXm1KN1WQL6X4yG
         o8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763746331; x=1764351131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kth0y7HTa9SOKIU9g0nLJ1NK5z0zg64snesxFb7xaaU=;
        b=wAlRyaHf/YKwyVOvIQH3XVg26avTyZz3kW5bbXXxu0So9ShXs2cjqTp5xstskyCNiJ
         v80M9Vn0f/ZjLvsrRKziVG6d/zX0pQ7NRbGUyArRA9ao+I/a1FPEF253EF6w7XddAm4N
         0y3anKrK/Q0+iWvHjw2XwfrtEMBbmnpbckXO4SDwZEhRhdJCYhJNWh+GkzdbmfJJfw+R
         TDzUsZBrztUkmbZfPUBmAa02MqK51cboIe05HIX2Dl89BpAw5k1KtZTT75Ob3UmHNvGJ
         yLBtDD+WDOTikq5g40NDSJs9gr4U+ZrHrlfg6YevQ7/gMHCRXCUHbZrtdarkvWJkDW0J
         NUSw==
X-Forwarded-Encrypted: i=1; AJvYcCVXE6u8aZdkAD5QqrWkxmaxozTt2nFK6Nr/cRnL4x+0eci0eOdIG2CeGMj6vaHAyQmtM9/pfj/1YBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlGbithzxEdTRyk1ZVV4r8msxKbPmjbaPDFT6+Bu+GYJQFVsVg
	GEbsLHbWAmmOLag4qZfNk+tXPaSJVqwJoJRDDVP5aZ1t60mIq9q+3NmwPA8BdEastr1m34x/AlJ
	RJTkXVzIEgptMaHXTN9rR5clxnTF9q1xL8c2+0SEEuA==
X-Gm-Gg: ASbGncsIusKbFAKd8iPPSNIS05Q4fo3Dw1Br5Z2+0ebrEQ4fBfAc7nkRkoqWnWVw8M8
	Hm2wc7+dNTnoLI2mmVE2t82/f1lqP2G+M33AUmADAjy5keczYySU/rC4kD98oS7cdx1U8T0erQC
	CgisS2XcjbFNzDlLlvf1lupObMggSbNMsnbxlZaIQJEU5IpLgiLIgYwoC0leqKlNkha2AkoFvur
	lsj33ACLGyQxEBF3BjJMNfAlGb2G/dnU+ISNPv/PASo+3qmJdgl+sllayiClNM5JQyB3345zDjp
	0ZjQDnxBvhUlLFmeGycK2llR5WI=
X-Google-Smtp-Source: AGHT+IFrdM3hZhHWz0WyuYbt+MGt6Thaf3kFt5DbPs90YPkIC9rrtnEFnyWeJ+DyEDb8IAb42i1R+G+ZOCDA0C98CKc=
X-Received: by 2002:ac2:4e0a:0:b0:595:8258:ccc7 with SMTP id
 2adb3069b0e04-596a3e9eb1bmr1000163e87.1.1763746330475; Fri, 21 Nov 2025
 09:32:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
 <20251106-qcom-qce-cmd-descr-v8-1-ecddca23ca26@linaro.org>
 <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
 <CAMRc=MdC7haZ9fkCNGKoGb-8R5iB0P2UA5+Fap8Svjq-WdE-=w@mail.gmail.com>
 <m4puer7jzmicbjrz54yx3fsrlakz7nwkuhbyfedqwco2udcivp@ctlklvrk3ixg>
 <CAMRc=MfkVoRGFLSp6gy0aWe_3iA2G5v0U7yvgwLp5JFjmqkzsw@mail.gmail.com>
 <66nhvrt4krn7lvmsrqoc5quygh7ckc36fax3fgol2feymqfbdp@lqlfye47cs2p>
 <CAMRc=McYTdgoAR8AOz-n5JEroyndML1ZQvW=oxiheye3WQmvRw@mail.gmail.com> <whxi2ikode53vrxqpanryw74zd7oovfielgdvhpkka5zy76g75@dxreidnb77y5>
In-Reply-To: <whxi2ikode53vrxqpanryw74zd7oovfielgdvhpkka5zy76g75@dxreidnb77y5>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Nov 2025 18:31:59 +0100
X-Gm-Features: AWmQ_bnls5aC2uYMxiloODvlLPPtaHGzyORZnXBgt1VZ07gmTcD09CgNCNE_vtQ
Message-ID: <CAMRc=MfqYiuLaz_28nE+5QSdiG-MyTk885HSO4OYz8Wf4myfJQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dmaengine: Add DMA_PREP_LOCK/DMA_PREP_UNLOCK flags
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 5:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> >
> > The flag has to be passed to the BAM driver at the time of calling of
> > dmaengine_prep_slave_sg() and attrs seems to be the only way with the
> > current interface. Off the top of my head: we could extend struct
> > scatterlist to allow passing some arbitrary driver data but that
> > doesn't sound like a good approach.
>
> Can we use DMA metadata in order to pass the lock / unlock flags
> instead? I might be missing something, but the LOCK / UNLOCK ops defined
> in this patchset seem to be too usecase-specific. Using metadata seems
> to allow for this kind of driver-specific sidechannel.
>

I'll look into it, thanks.

Bart
