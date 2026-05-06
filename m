Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660E135A397
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778103221; cv=none; b=f3oOr77bvQGkivZWBE5NBxE9PZlKU+eamklPa4kvXzB1IExWGAtTR7tbyzBaPWN7KCb8Ga+ypvjRXQCnvycpnAT9neIE8uuaodc3VKciGiCzyfFjfZ0+kQCRFeNNcBzQlhPTIgTvlTCyRe2q5EnMOCy3c0Jua4Wnv4gxPTGER3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778103221; c=relaxed/simple;
	bh=dMbIrheGNaYAV85OtW9Wo1+9kXfiK3PIpOkc3nPKbjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRVBuKVp0nab4BaW4BmGd1e+OEV/IbSd5M9p+ZXe5e7ayPskP6G2TVepOYzoD55ea2rh7xAVWDyTMLLiGFQ6cV0sLLfnldEqijSvAFQ2sJs2+eReJkHZ4vmJdyoo9HnbOUJMaoud+O0t61Obl62Z0zAYVRVGm3S0XO+Yw9xHGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDWPJr1T; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDWPJr1T"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso1203695e9.1
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778103219; x=1778708019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=speIVgikBPZKEXmmEFMgnIv3hnOiW/sq98R/NbvvuMM=;
        b=GDWPJr1TG8/NeMbiWsifSzeZ8k0Q18NgWGOggCXeH6XoATbs76diwaw6k0iRxlApAx
         r+8ZOLNoDlZRYSa8nsEHFmJDC6C7e4d2/+Q8V4ZBQIKTfQqhHOuUD7oMCbrvHRQLVF9M
         6hrBlEavA3Gqx2uKYhTkCUksIWO+eNZZunn6urTIZs/o58qJtdn1YBSMHqxA6/b4Itds
         X1yozmmMKjOle2cxxu0t1tvWmVJgdvTM+s7cRAjG2p9i+JL4i7JGYzkH0ED2rFiqGncD
         zflf8N/AqVcUmGwxfRHko1T4DaGai3CPxmyTG0AezeUJIRfOQOKDIdc/Y9g5MynPYINn
         LRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778103219; x=1778708019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=speIVgikBPZKEXmmEFMgnIv3hnOiW/sq98R/NbvvuMM=;
        b=j8ssoxDEz5NTG/a9diCp+uRWrOxv9G+mbbRNer3n6yPeXSt5WJEu3X8wzhXVXrZ26y
         rCUyCE9Uf+t93sJWjd77sVUppx+6kO3IkckGGpZrmwkraucK7TPzIDli5iYyON16oYMj
         VVb6hPrki/lQxeTEUm7oAUpmMAiIlgHlmzcQPOd3k7t3oUdUtEV1Wx8OY3h3LJw/J7OE
         iNyWhAuZy2OeUT/exeEGIA3UWJATxrhdvmJn/v01nEQGqnDYNVeOWyJLz6sgWQzve3Bg
         robNGQMe/ZrcmiEbtmo9GOvk/sAhzuTmoFckGLBwdhaZSs/hvAm/GjdEVd6q7CpW3F4g
         XgGg==
X-Forwarded-Encrypted: i=1; AFNElJ+Fc/yWPGEemEufWntj+FPZpkVScjVScumTLpGDuF+IPTi/W8NVXIpMJqiBqNPxTtiZUpC1oi2kRBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwepANyLer7avEH8Y0nxFMyP8gZsKHxJgBPusl8QCgZdIi+Wl7t
	G6vHKLFaSdDYAeMCOZyUs42ZPpkSq5vzdSAg6wmf1h1/kGfpqMT5f3rY
X-Gm-Gg: AeBDietsDtr6aE8rsbM/GXN+v76fb8V+XoMDjPngUoomjaErCTulZ35qI3Ky6pBhAhs
	ko1DAIG94Ewb79Qwfb7Brl6EZMjs5RcF6BVP+8jaGX/0XrpCGbJvMLF3wyZ5fJIozS1xJKyfXXz
	Yex1u3VKzhZmu5kWerSZKdlaQqD6CtJ5yHkdKcJX1URFb39Y7YuESorlZ6opvJbubR3c4IK4fvc
	Q/des9vx33uYNIT/RxB+AMzz8C5JosCiqlySFiSeyNLnjE8w5bCtgRQofrSeCfzkRC/tNKhyRjJ
	aHXQSWy+vvPEJKD6OA7nb6oKJEOVITq9yTFlvNehyHKUYN8DQCaexAPgBuGHeQmJAklEP4i/8ZQ
	a3ElocM+Uu5PMKUkVuoAM6sDoU6C5MUIAUTO4WK7Bwjx69E0G/Tgu/vRfu3x0iMuyWBQLeCQroD
	OLOwOi+V10/uW+n6Mj7JtjqJe0vkUftopLa39Jo8+wfiNYrA==
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr95182205e9.10.1778103218791;
        Wed, 06 May 2026 14:33:38 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b213asm25243965e9.2.2026.05.06.14.33.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 14:33:38 -0700 (PDT)
Date: Wed, 6 May 2026 23:33:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260506233332.664f220c.michal.pecio@gmail.com>
In-Reply-To: <2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  7 May 2026 05:40:34 +0900, Jihong Min wrote:
> AMD PROM21 xHCI controllers expose an 8-bit temperature value

I think this commit message and certainly the Kconfig help text should
include full name of the chip and perhaps its official marketing names
too, so that people better understand what hardware is supported.

So: "AMD Promontory 21 chipset" and "AM5 6xx/8xx series chipsets", or
whatever they are called by AMD and motherboard vendors.

> through a vendor-specific index/data register pair in the xHCI PCI
> MMIO BAR region. Add an auxiliary hwmon driver for AMD 1022:43fd
> controllers and bind it to the xhci_pci.hwmon auxiliary device
> created by xhci-pci.
>=20
> The read path verifies the parent PCI function and uses the
> initialized xHCI HCD MMIO mapping. The vendor index register is at
> byte offset 0x3000 from the xHCI MMIO BAR base and the vendor data
> register is at byte offset 0x3008. The driver writes register selector
> 0x0001e520 to the index register, reads the raw temperature value from
> the low 8 bits of the data register, and restores the previous index
> before returning. Expose temp1_input and an xHCI label through hwmon.
>=20
> Register the hwmon device under the parent PCI function so userspace
> reports it as a PCI adapter, while the auxiliary driver still owns the
> hwmon lifetime and unregisters it from the auxiliary remove path.
>=20
> No public AMD reference is available for this value.

Is there any documentation of the index/data registers themselves?

Any potential danger that something else (FW? SMM?) uses them too?

> The conversion formula is derived from observed temperature readings:
>=20
>   temp[C] =3D raw * 0.9066 - 78.624

Could make sense to describe methodology, particularly in case some
people would come and question the formula.

How was actual chip temperature measured?
Was the output compared with any other (Windows?) utilities?

People will be comparing these results and possibly trying to draw
some conclusions, like OMG Linux runs this chip 8=C2=B0C hotter, should
I demand a full refund of my free Ubuntu download????!!!?

> The temperature register did not return a valid value while the xHCI
> PCI function was suspended in testing. Keep the existing behavior by
> default and allow temperature reads to wake the xHCI PCI device. Add an
> allow_pm_switch module parameter so users can disable that behavior;
> when disabled, reads do not wake the device and return -EAGAIN if it is
> suspended.

Is such behavior useful?

Maybe the driver could just disable runtime PM while it's loaded.

>=20
> Document the supported device, register access, conversion formula,
> module parameter, sysfs attributes, and sysfs lookup method.
>=20
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
