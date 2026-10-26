Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993879;
	b=axyZTRGJByxtjBv9xjvprIcfM3Gn7v2gaHveaWo6fAA8hMVs1SHNqhSHZ5Ho6pXcJgaN
	 xV3plLyUa1V7nKG81PaNI46pWi5+4KuXtVKKijAhulJWuJ6z64XT8NcOzJLUC9UKue9fJ
	 Pr9jL2DeUOeBbk3vtSmcvoLYM/FVPzEkqhLTuxdygYW8EPx55ch+qC348hEaDeREgqP/k
	 Tz7FWLN6nldLMqE0G7U4duUaJIIUkXG4K+orqSwQ6FykNxugrJu12eFQkjv4G4ZijFXnW
	 kAXOXwS3SEPIQGhxrPdEyUjWYGCe4s/1Qdc7myz0MmZkGhAXVN4ehVIVP+kzXDgBebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pIYmeiFuvjcdTNw5HWM6jYGl5dGLFIjavdG7cGYxLu4=;
	b=tsmsFUIkH1l90gw+K67EFE7yYbLq17gVTpOhwifDxK34F9nODDFf60xIn/BR4BlJGlbp
	 m63LGygZRrF3k7OY2I12L1U94VMj/NU+06qyZ4Ls9JrbW+OOzF/sRtNCTFH3cI6GLhbvj
	 kaiTja8/JilCvPrhxCqor/W6AdCwnV9KsiwzT3j13BMa2Hd6X7YpYGP7wWJ1pwhLY+zhv
	 TKPtU36GKMDwafD0f8HPTa7P/hIc/ZG64t263BnWotVfpytLhKH0IrB5HkLFkZFmBbHW0
	 awVQUdygRTH3KF4gRDhTval8BWPdlJB2s3Ztcq8xFrjcnjekVp4d4xCpdBRrj8aLJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L1RY5X3O;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28667606A322
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 05:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28667606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L1RY5X3O
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20292005e9.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993876; x=1793598676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIYmeiFuvjcdTNw5HWM6jYGl5dGLFIjavdG7cGYxLu4=;
        b=L1RY5X3OEu/ECGw/km+1vHQJOw9GyiOk+368VjlgLjqvCd1Uul1o9+T3KpR39CUcz6
         eOzyv7yDZgnAahPejnM5CMs4NVVzgfJ4rhKYuQEImNVXDT3heDdWoslgf2QJKrQ6y/hd
         ndugS/lJQGhKDKPa5SqfrEeDnU1HBSinY6JPN0CNkcMnvNRRPJPmTPXE1wfDbLzyORkC
         Hn2ZCPPegcME0t9bfWOQw9qIxBjK23WJ3mcCxpfxL6QgTFd9vBQRrHaY4B5666Yrmd6L
         iYwJGA8nY5WqJhGvV/jOxvpKSZKL36PJsSyjv7Zh8C8DWdwpHwRmghWi9clC3GCSvweC
         zT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993876; x=1793598676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIYmeiFuvjcdTNw5HWM6jYGl5dGLFIjavdG7cGYxLu4=;
        b=AUY07+j2owTIMMoBpKB0kcioW1DvSbePHTVPWB72+XSb2CyBd8XKYO0tCKURaaZHr+
         wZUhZHCj0J49yGgjOinoOh1189Tto/Ut+yLTpH5fhg+Ngdt2ALrH7oN3wBSoGija7ugH
         xgqfmX9apSGBsMFrMoDJy4ix/xL+PtBWAcnz83B0o9R8VCXozxzLR3frzV/cva7ciKkf
         f2gBKCDPHkGJ5ZhbRvhegu1cFJXsYQfb21uJvJB4nZxO7ctiBXb8pAFSDhL1jE53Z1vC
         kd8cKD+C4uozEu0O0ERXR31nz7WUR1r8swR4SK9TQ7duSNq+WbX3Vj1lMrKhBklQz1Tv
         TuXA==
X-Forwarded-Encrypted: i=1; AKwUvBx30PixyLF3JXNO6pCwE6RvEblb5pOl7q7O/qCFKNGvweTnCMd4Mt0SRLOAmfRHv98HUw7bD7AYwRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV1JxZH3osIbDygeZ6dkA1hIvX82qla7q5jejp/ftTyauTCh6w
	eIKl1vmHQnU+gYhK2uZCFfmYbMswgIkCDANIiVla2RZlAGnS4frWqYZF
X-Gm-Gg: AYBFou02zyOsPeNqWRHEY0fsFQUXlG6D6fPa5GA120YDPQmCvJSx5I5K+RC/J/dUEWd
	CBGpc4AfIBd2x3/6XRaJpZaNQBpMO60nbuwPw9oHwzoVoKGPN6dSc+J0087vsKticShc3jYGWDn
	GCZq4YV/Ws7vpGIAVpeqIzOOcn4L1+8aEvuPhGAtACx13CmdIW292Fi7/5rjWOc3I31F7I3Z7kb
	Ab3dLwPD7yzpzCeoHqnhP0uF52yNO09P9juxVlws+DncVMFBTRibG3b+Yr+JhInPIoawSlmOTqL
	8ha590MjEZ50V8chFThcZHu68vBT80lnKhknlGoI7xpxHhM6hG8b+R12ZGGN5yPkyua+279w0+V
	ufWMBu5j1meO/xinLfbEvADZSWQPI3K3xl3fQ79HjOPb+GEeuTbYydgllD0RNVsT0Mvci+K0EJw
	DmhC6HkyibUOQbS9MWSc4FNsJqSB5r5mMLSTYOSNsjJp+Afye3Br4YIBqeoN2nJOtFn+Btz31go
	SXnrhZ6ysobFh6JGV+daSb3YSpM73cEKuV0oZhwPmsAUocQk8lVqlTyVgVBuC7shwtOaeziYmLm
	nTBaxO5IeIm4aX6LLuXFI1H6j/sPhiKiCg==
X-Received: by 2002:a05:600d:82e5:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a35aae3e29mr133995505e9.0.1792993876421;
        Sun, 25 Oct 2026 22:51:16 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.250.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm13877419f8f.34.2026.10.25.22.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:51:15 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: iio: add documentation for ti-ads1015 driver
Date: Mon, 26 Oct 2026 07:51:11 +0200
Message-ID: <20261026055111.4572-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021202210.7d70429b@jic23-hlaptop>
References: <20261021202210.7d70429b@jic23-hlaptop>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:22 PM, Jonathan Cameron wrote:=0D
>On Wed, 21 Oct 2026 09:33:50 +0300=0D
>Flaviu Nistor <flaviu.nistor@gmail.com> wrote:=0D
>=0D
>> Add documentation for the ADS1015 ADC IIO driver, which describes channe=
ls,=0D
>> IIO attributes, threshold events and ABI usage examples.=0D
>> =0D
>Hi Flaviu=0D
>This is missing the 'why'?=0D
>=0D
=0D
Hello Jonathan,=0D
=0D
the "why" seems to be a misunderstanding on my side. I had the impression t=
hat is it a=0D
good practice (even expected) that each driver also has a documentation (as=
 I see a much=0D
higher driver doc coverage in hwmon subsystem for example). When I have sen=
d a patch for=0D
this driver adding label support I observed that it has no documentation.=0D
Now is clear that this is no the case (at least for IIO subsystem), so plea=
se ignore=0D
this patch. Sorry for the noise.=0D
=0D
Best regards,=0D
Flaviu=0D
=0D
>We don't tend to add per driver documentation unless there are some=0D
>oddities or unique aspects that aren't described by more generic=0D
>documentation.  The actual features are all discoverable so documenting=0D
>those rarely makes sense.=0D
>=0D
>If you have a reason that it makes sense to document this specific=0D
>driver then state that clearly in this patch description.=0D
>=0D
>Thanks,=0D
>Jonathan=0D
>=0D
>=0D
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>=0D
