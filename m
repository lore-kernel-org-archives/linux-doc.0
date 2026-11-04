Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782459;
	b=cVmfKqsuVUp3WnGy8ILpOqshWJbnAklN6zqeqxxKboB0G6T+70ozHcTmTFg/NWfav7r7
	 kzv9psEeM4fHNKis9SeFSDWi0Ck+7lhHGD/PCBpVblT4Cd1Sg+FdAmij5rBXpIOOXiReF
	 qCGDH0h0gZwdoeoYk7vFjWPXePurdQh69s+/J6GM7QMK/UzSadOa6ukb2jseEaIdtIa8A
	 XeBJ/ZNraYkHEwiBtZzwzXBmLCJ9CkMS8Q9G38gMvFUfkhmxh/YRZ5Lp0yjatfX6sX7HD
	 e1sxODOuxUrumkIIzTwizHWgJL4RO39et3Mml3k3modrr7MzV/0glkfeimz9xQTLCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
	b=f02zS/NQNEmcViWD1cG6P4WQu5z0UEZfxLs8aC2pu+JA5esG6gwVG2ls+yXXuI9rA9+z
	 00qJp7Bw/ezaNFVnw/UOvWEWkBcb/Q9X1T1H+PbZqKuTJEeJV8K5c/EMqMzPlkWfauhnS
	 6Yt0/16vZVZSJe75rRw1tVSIUMWkWqMEb4hEaEcTEjsWAlSF7MpLdsl5PXpqGKGYpsBcO
	 5YE8s/pIUBnZHsn5QULGzcAKn5Qc+tmTvC+xApEHVEJZsVkI1kMFU50axgzmCAfT8090Z
	 W/5aEZWvnOsVP7n0XblxKBEadLYJku9wzHLZm5IdJIgmDD39pXg1l7dwr4EPfFavChQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxZ0G9Ms;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240BD606A33F
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 08:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 240BD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxZ0G9Ms
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d63f60bcso6641907b3.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782458; x=1794387258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
        b=hxZ0G9Ms2bXEh5gQJZdNqjnx2lpt6R1XWLc8qWOrdhhjkK+LOEjyXqIOolu6ay0jTq
         GyZrycPkfvSjp3XlXU2LmYduWVgjHEwJfeVAPEtyyGOB6mgJ8UakSs7StUoej6/oZ+6L
         tGV6+SkSg5NZOvGBXbC5dZQ39prmruKSPmBQX0INnv0KscvaGOSDkkaYre2oZZ+MZ2Is
         ywu1wQqVelzsnzzG3ZrnvNx59HwAHvMlSvpIniWRyNP/y42RtWYToDxN3KHfao8vzzC9
         kSX/XpkllP4D7BRvdqFTAqnwzVBatbteWhKGYI2d/7Kyxx9irXthmzRlMFDpycX9jehZ
         xw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782458; x=1794387258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=995SOgcWBB026Ztcaii7kwHRKn59ipdNGgwbnoFQZH0=;
        b=Eg825/A9pFEPZn58FenI96weXAg7i5tE7Cb7VKn631xUUqrRv2GYxw2EpySOoxkjNR
         P0XPz25FdCG3UBf6zPFX0/FKD2ym/EKysIGtRHr6Tx+X/Dp6dgnhhS+i+Jz/GkdlSNgX
         mX67wFLNnmsFPqsxKtvPxL5RwUpEEByHfzammhUNRAcpcxDY9EVos1JLoMXagp9VXq6b
         Tyb04ZVfrKQQqFUzcEz7W4bLJvtjrv7VJq2zLXrbW7cSwGRR+3/hQT/GwZYOjYCR4OH5
         Uu2WISoG3jgSZTRj/7KX2LlQQTKO2LaiUDYtd8waQ4WXlHii0fndOqheehzHwMyZgmaN
         EaFQ==
X-Forwarded-Encrypted: i=1; AKwUvByUQ8ggHjWpAMP6nvd1zEXlAdhYPA8uICWq00bfRE3IpbUKWfWuxGIdQ+gPlhTBjEoYs99CW1F21No=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Rf9DMD5tiSAVTDMHILvqD3wcIEZ8S69NaE4BEF64aMiHcFrM
	fx/ssv6gonGn39pbvrjql5ifwuh6MxFpERr0V9oTaGCN223bgcSv+piBd5bhgQqW
X-Gm-Gg: AYBFou3NFJx9fsm0ZsOT/MgjPXse48Ff3veu2cjIhbP7KYxTpdcAeZ9acHB1v6y0GBy
	NX15G1tCJln+B7QRh+aPsw9mhVfo1Dq4l7LQ6AzoQ3yR0ymmvHE8swQVwp3ZIfV0lttG8Kv5VD9
	IxU5SzbAgAY+tR6xiHKB3mDoHSf8sqQ/lQpNVcx2SHCWWWhKlC/fGXOw6z/EdpKH1TjDO2BhjZC
	uJ96RY8sGE9HBeTLMJ1RJAYK9rgkzFHLIQN52ZggYIBeR+okULWODMQ/1gtuKu89rOtRCghbIIj
	RLEKVxmD+ycdLxGLgRhfxnHL6NH9VmpshyJ78yO6B1QbY0i2xqaMDf8kiV8EMuY0umAJuzgA5Ko
	BkoSHRhbpT3ItKrLkiJIHXIXqMkJlH820apn9h3FpiEcn4SfrK27nHv3R4FOXXWhwLTaa+b7QTP
	Xy3T1ZsNvF0gkmfWYXTob+MtPQbEsv6XeZu9lsaMUCNAcmxh2WDSVegJLnieRGtwDUfhBzUQMoJ
	QCcaaZuGyVsfgEKrH5e877c6IzhIHkSxzPu1VQuYhmBdIhdMkmfOT16j2ge2axsGHkkxZw5zus+
	R+K/rbDo1NFI8hPIptEuAPL3eLLQaRs4H1etAlO1x0WKkv79nSKFIk7SZtkthPSmDZgay+YOhKD
	M8sGeyw7yCrgUrFuKz7PP6IhX
X-Received: by 2002:a05:690c:dc8:b0:8a8:7fda:15ee with SMTP id 00721157ae682-8b2b676a6e5mr116717537b3.50.1793782458184;
        Wed, 04 Nov 2026 00:54:18 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c3174sm14420647b3.12.2026.11.04.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:54:16 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Wed, 4 Nov 2026 05:54:07 -0300
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 01/10] iio: frequency: ad9910: powerdown fix
Message-ID: <ynwpqktxxbunqm3ee3q7iogrjynlz3egrwryfb33vsp7x6wcqr@uhfsxwrpsyhu>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-1-0e9224ddf7b7@analog.com>
 <20261104002042.10064e8b@jic23-hlaptop>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104002042.10064e8b@jic23-hlaptop>

On 04/11/26 00:20, Jonathan Cameron wrote:
> On Tue, 03 Nov 2026 11:52:57 -0300
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Enable the software powerdown on all the applicable CFR1 register bits at
> > once with an IO update.
> > 
> > It turns out that DIGITAL and REFCLK_INPUT powerdown do need an IO update
> > when enabling the powerdown, but that is not the case when powering it up
> > again. It is an asymmetric behavior, which was observed while profiling
> > power consumption in the lab.
> 
> Just to be absolutely sure I understand this right... The bug today
> wastes power but otherwise doesn't break using the device?

Correct! 

> 
> I'm just trying to judge urgency of applying this. Is it fine
> to go with the changes that follow later in the series or do
> I need to rush it in, potentially delaying the rest.

I'd say that there is no rush.

-- 
Kind regards,

Rodrigo Alencar
