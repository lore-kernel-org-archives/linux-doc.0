Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A71F37D4
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395463; cv=none; b=rnOUQSjCBUgyFcvMKuekgRtpzXTYevb7rhb/ljwKnRTeplUMRruz8kX4drzi0wWX8WU8BOR2irrZgV9TJqFB0jMtKFAAAWugEyt/MpheZpU8rNvfkR6WJvc/sG2Q8pD3/D4x9VhhvBxIQmw1xcr+R1mlJEyWZv98LrUuNHP9EQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395463; c=relaxed/simple;
	bh=bAyLP6n1PUSnQP/5Sor/5DmDifmF7sxR57YXwCBKk8A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kq6tK2OqJWRm5FyzS1YwjeUDHPd0uhZ3Jq8QWCKBmAgT2ysocaYfUYaPp7uyDCuof+lz/YYvpzr6QCHgjMU3Jlhw22lGYiisD/Ar3V+eSfTYRvMkPQ01OolxU0WzHBaq0l20oLBlRZu23Xq0FzIgauD9Xdums1k0STLL6k96g9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPRRKjgN; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPRRKjgN"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8b2627269d5so409918385a.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 01:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766395459; x=1767000259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OvmZHUHsU4s7pfLTXA++XjM3WOwGAV+1VFEV7wMCCv8=;
        b=LPRRKjgNhaTitcxJy+stnIJf8tDwhJhz7lljQYnZ6dy71OVmG6MeEGyb73SRL+Iwe4
         E5reR1RLOGk1yx842mX+R0Fs0OXxquWaNUadBDf5WGiqnM6QzcJXOYo/SdUdtf2SAERL
         5uPcDZnzOauAjKCQkjFvfzpmi90+6hpMM20BbcDfIi4Gv92+ZOTQCKE+H2lfpCI4RlnU
         gCg3Askw8TbAKimSJIbYamILj0a8GjUWoXogcZoN+CE+mRg34Ty9qrNO9umMhbEvkLwg
         SspaQCaIS0ggWNaaWc5KEIAMKVRkE/u1C8UVd/BtIX7PkM+/BGWA6ze/QqNwlnn1X294
         13Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395459; x=1767000259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvmZHUHsU4s7pfLTXA++XjM3WOwGAV+1VFEV7wMCCv8=;
        b=Q5Vbq2BNvNZ125pV/HEogfCVTfE0i0ad3edb+zd2C2S4xwPRlXlFwa1uaGTf0wCBNz
         pPMnMsvgSf2P0eqxX+EjttHTsRxxI8V6MlfHCATVgA2cYerWsHwFhFlz/m6qa6GDrMjz
         AzCmc7agaWk1FYro2gg1H4ROxKANX1tVH/dkDfMfQIXn6fo8TMPMdDxK7iaXE7KQDjGo
         LkAhp9nazvlex6C1p7z11dyq1UBviMFPj67h4wilk9F1tT7GSoWOLpMi+Ee0EUInj9fd
         k0GjpuVHyN8nC/MqymyeQPWbLreEKrEstd/kphrrQ9+iVQgG/GW4O1a0tWoqlFbiZ9aO
         Zx0w==
X-Forwarded-Encrypted: i=1; AJvYcCXgMj+0dz/gjrOyaJPfVx7wcOsbLgmw8v9XUSV3xJlQ0ddL6ZaTLnOwSxWgi2HW1gLAG8NHPnwUetA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHVqIeTJEr95M+RFDLysrxeIxKT4XMmeYgq3XiXJHBVKeqxC2
	Q6O48XFOeDK1s63RDhb4oAb69J75+KKxLWfWJYW+506vlSMwfSZXdveILetJ8Gpr
X-Gm-Gg: AY/fxX4EHyiayqnS4dI2nJioaSumUl1ygdUaXx4FjEacsIgxtVAd3LI6wOkDhebxsBV
	9xK2iFjGafsxzOLAUy/O9xFFbO00KO/ani/4G3rF+/UcsnBYpn6Uq0q14sAQblIJUoU0JKE3QmJ
	1jJWRiPiRRGx9V7VWN6UzgRBsQKkg9z0dR+9uR6SV9wT0Kj2p43mfZqinQV7rxGFw4soYfVm2qM
	ybBPlSfYfUz/FiAyAYqsXn5q9yS6dTq3hnyIrEbdBTJi7LcwwBmnhmWVXYdn/Z4O1f4geSdl5AR
	Qs1brlBnZuyLfttvxc5kStkcwCbcjHeJc41FJjF8P04hzfnpYA0Ov1KZHV8LyZr46ND54hKgTte
	QMI+tYcHhnou0drBsjq3yOJ1P9YGYNfLonzmXB7mK3/vkXDlXDcN78Fiw2g4u9JgvbZ4NkMN9bf
	B2gUOqO8GOKnZacg5V2IQgahPwVdM6VApGnrdwp/gKao/Kn1boSKsjz0MWByPVewMvY3/PnX+Vk
	zchlibRTs42Xl4=
X-Google-Smtp-Source: AGHT+IGcUkieeN5SMBrYzsLDCuuaXwX0HW9pDymSmeokduZF4f2T9HBSmI5nY2mxs5I2NKVprEKeNg==
X-Received: by 2002:a05:620a:28cb:b0:89e:d562:7b93 with SMTP id af79cd13be357-8c08fbd210bmr1650156785a.83.1766395459535;
        Mon, 22 Dec 2025 01:24:19 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975eeb4bsm798522785a.52.2025.12.22.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:24:19 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 22 Dec 2025 09:24:13 +0000
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 6/6] Documentation: ABI: testing: add support for
 ADF41513
Message-ID: <eefdt4y56c3mh653kcker2t6sfpb2wu6kcahqnkgf2mqjfotbj@owcdihpzibkb>
References: <20251219-adf41513-iio-driver-v2-0-be29a83d5793@analog.com>
 <20251219-adf41513-iio-driver-v2-6-be29a83d5793@analog.com>
 <20251221175249.11b5ff02@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221175249.11b5ff02@jic23-huawei>

On 25/12/21 05:52PM, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 12:34:53 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add ABI documentation for ADF41513 PLL sysfs interfaces
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> Do this in the patches that add the ABI, or in a patch before them.
> 
> Also try building docs.  Unless something changed recently that will
> moan about duplication.
> 
> When ABI is generalized from one driver to many we have to move
> the documentation (and make it generic) such that is is shared by
> the relevant drivers. In this case
> sysfs-bus-iio-frequency is probably the appropriate file.

that makes sense, will do. thanks.
 
> > ---
> >  .../ABI/testing/sysfs-bus-iio-frequency-adf41513   | 27 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-frequency-adf41513 b/Documentation/ABI/testing/sysfs-bus-iio-frequency-adf41513
> > new file mode 100644
> > index 000000000000..11ffd248eedb
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-frequency-adf41513
> > @@ -0,0 +1,27 @@
> > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_resolution
> > +KernelVersion:	6.20
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Stores channel Y frequency resolution/channel spacing in Hz.
> > +		The value given directly influences the choice of operation:
> > +
> > +		- integer-N: requested frequency is a multiple of the Phase Detector
> > +		frequency.
> > +		- fixed modulus: fractional-N mode with fixed modulus.
> > +		- variable modulus: dual-modulus fractional-N mode with extra variable
> > +		modulus added on top of the fixed one.
> > +
> > +		It is assumed that the algorithm that is used to compute the various
> > +		dividers, is able to generate proper values for multiples of channel
> > +		spacing.
> > +
> > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_refin_frequency
> > +KernelVersion:	6.20
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Sets channel Y REFin frequency in Hz. In some clock chained
> > +		applications, the reference frequency used by the PLL may change during
> > +		runtime. This attribute allows the user to adjust the reference
> > +		frequency accordingly.
> > +		To avoid glitches in the RF output, consider using out_altvoltageY_powerdown
> > +		to power down the PLL and its RFOut buffers during REFin changes.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c536c3afc1ae..48fa1011b797 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1606,6 +1606,7 @@ M:	Rodrigo Alencar <rodrigo.alencar@analog.com>
> >  L:	linux-iio@vger.kernel.org
> >  S:	Supported
> >  W:	https://ez.analog.com/linux-software-drivers
> > +F:	Documentation/ABI/testing/sysfs-bus-iio-frequency-adf41513
> >  F:	Documentation/devicetree/bindings/iio/frequency/adi,adf41513.yaml
> >  F:	Documentation/iio/adf41513.rst
> >  F:	drivers/iio/frequency/adf41513.c
> > 
> 
