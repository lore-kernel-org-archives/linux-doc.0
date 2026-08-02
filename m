Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340922DF719
	for <linux-doc@vger.kernel.org>; Sun,  2 Aug 2026 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661450; cv=none; b=Hc2NVUbwzaMUFtt5OV3iqvyaVkSKQmuwnab+oWjEpbSAY86inH4iRnBxr3LxNfuACR184+kYpdPQs95lZlwkLb29Lc0zMgpTiwSVKfO4EasIEjtXxmBwp7kTWF1rXmCVbI+vX7iV9mDnrmq4rEN8LazvrgRqAGJkMehT1AgGkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661450; c=relaxed/simple;
	bh=XoqwTzBTDw0ldPHh8ANmlH4Zu4YUOeLFd2ixic5ddNw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoeM7km5hVl+5stFzSCVUrcfpUIvAyPKu33gAtshP9TZQOldrAA0/CYILsxAbLpmN9NtW4Y7q33tFFGtMh5tr1W9GdsQU7TC7Jdv+O0DJcYZiBP1UsIRKtJBVlg7/gzrZf2ydBW+12H7yKuoruoWQHNFpaA5QkcuZr9S7oXFfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lStp2W/D; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lStp2W/D"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2748815f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Aug 2026 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785661445; x=1786266245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLNngFHUaW4FMnMMnOZ4ee/Vyns/yW+WufUQsHnkGgI=;
        b=lStp2W/DxU44DcfIaqwGkszwmLSUYfjd6d1nZmvUTu9qDyc5YrR55OQM/qelXZAiym
         snP1KDyR3CBcf24WNAKvGZU1+MjMF3uBoB2FVnEvyUkqPHEjWJbAAIeID/xVf7aGK8wS
         wBdaquxyj7LsasO2ziK0lxo/ovcnWfdfMHIu6/EOO8nSIOsrnKssImg03jLud3y4Jiw/
         bBoJKnnLCjFv+L0Suv+JTAYZL+ZHgK9T68mJwoDM0nGH+tNou6recLCy3sSEx1+h48OF
         JGhaTu2cM2w21wvhrAkoZc4/YW4x/zzn3zSG68evkH9DkYmOoJ8ZDZZwHwBtZnJQP6gU
         XEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785661445; x=1786266245;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLNngFHUaW4FMnMMnOZ4ee/Vyns/yW+WufUQsHnkGgI=;
        b=Pb7qp7a27RA6SM7iVpJN514rAFi4Q2gMSGvvPB/iaQL1NmWkTudOt15zqSzsvLOe4w
         VBk1+oy+582+NbUgPFSNvSgaLANBDUWqHLP2V5jJl2ZTs6Hu43NzeVH3HxjXHP+UD1te
         3eiD58SKEQSqxVfDkHoJqxJZlIU0iTwgDjm6TOW53Lejm0cmnJbIC2H2/UvtcOLx8I68
         4F1iaY52wMCb3bROv6OIP4AMz9WuoCZiHSgVJaQOv7/EOZU7W3n7muxvGoFRSWiDkihx
         VU7VpBW6adHrLfkWcNoZffFpp/N17xJc2RwTPifoZgV8c+P2z12gLWytczClTnUGfymN
         xG5A==
X-Forwarded-Encrypted: i=1; AHgh+RpYHW/Qmo98qln8E6q2whPAsShnGwiteCxWgJEBtBSHq3exl7K864DGjP5h5pH9vznbmstykAXdCdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Vuj4Ej1crkeC1mvDCu/Oys5xfZIJ+ROTDlTxI0nFip081iu1
	cpPqd5yYrnIZSMEhesIbY84IEyhfAJFo/pMURS3NI1OYd7nUoyW7INT4
X-Gm-Gg: AR+sD12ieb2riWDEMu4L6YxcJU8YMbXZY3QpamDmMqac74NqGcDnFgSFTH4S/B51aJr
	ClTcvjMQcqOyRsWpjXmUZJmZLHPsf8Tiz8rT0k8+ei7226jM5CNH07eNUDvI4PQ9/gNSmewE5WX
	YC8bhU708OrZknLm1eI3YEpD4f2tjWu3LDTTSP98sxliHSGGPVg7DQgIAsAt7qVaPpFDRBn46hV
	928Qs85/n9rUctvQd0qoxDjDksrV2RKLVMNE7bQBYOgMj6elX3yzPJ1UmpPGNzcPK9dR3D1s8Xx
	6MfzdlgNoWVi5hVc2PyR8kctHM4MRfvk02UMAAtF/kzbG0rtYSe5Dqmo9Guq7raVZdAt8doookj
	dPGBoi2BR6qGtWhfGeYI93G45sKzrSXMew3C/0jxzO9Q0qMbZ0lxZURESBwYnCx/UGIhpWD5tAr
	mnQEURmnt3XUn1EMAwjJcTWBnt/qiJ6zT1ghyNMuVUDn/Qn3IuxFIRILcpzHckiIXMeumDKuleO
	KMNq1Tzr+e8Wi1ChocMelEtpg==
X-Received: by 2002:a05:6000:2dc5:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-47fd72a9061mr14609516f8f.8.1785661445068;
        Sun, 02 Aug 2026 02:04:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm22160461f8f.21.2026.08.02.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 02:04:04 -0700 (PDT)
Date: Sun, 2 Aug 2026 10:04:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v10 11/17] iio: frequency: ad9910: add basic parallel
 port support
Message-ID: <20260802100400.588fa107@pumpkin>
In-Reply-To: <20260802015607.7d7d4dd8@jic23-huawei>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
	<20260729-ad9910-iio-driver-v10-11-aa1f6167729e@analog.com>
	<20260802015607.7d7d4dd8@jic23-huawei>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 Aug 2026 01:56:07 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Wed, 29 Jul 2026 09:25:38 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add parallel port support with amplitude, phase and frequency channels.
> > Those will be buffered capable channels, but only basic control of offset
> > and scale are implemented at this point. There are separate amplitude
> > and phase control for polar destination, which will provide different scan
> > types. Enabling and disabling of parallel mode will be implemented with
> > buffer setup ops or with update_scan_mode() once IIO backend integration
> > is in place.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>  
> Hmm. Curious... clang --version gives 22.1.8 on x86_64.
> 
> make LLVM=1 LOCALVERSION= -j12 W=1 C=1
>   DESCEND objtool
> Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>   CC [M]  drivers/iio/frequency/ad9910.o
> In file included from drivers/iio/frequency/ad9910.c:10:
> In file included from ./include/linux/clk.h:13:
> In file included from ./include/linux/kernel.h:26:
> In file included from ./include/linux/math.h:6:
> ./arch/x86/include/asm/div64.h:113:8: error: invalid operand for instruction
>   113 |                 asm ("addq %[add], %[lo]; adcq $0, %[hi]" :
>       |                      ^
> <inline asm>:1:7: note: instantiated into assembly here
>     1 |         addq $2147483648, %rax; adcq $0, %rdx
>       |              ^~~~~~~~~~~~
> 1 error generated.
> make[5]: *** [scripts/Makefile.build:289: drivers/iio/frequency/ad9910.o] Error 1
> make[4]: *** [scripts/Makefile.build:549: drivers/iio/frequency] Error 2
> make[3]: *** [scripts/Makefile.build:549: drivers/iio] Error 2
> make[2]: *** [scripts/Makefile.build:549: drivers] Error 2
> make[1]: *** [/home/jic23/src/kernel/iio/Makefile:2184: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> 
> > ---
> >  drivers/iio/frequency/ad9910.c | 154 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> > 
> > diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> > index b41b011af281..aaeff2e7640e 100644
> > --- a/drivers/iio/frequency/ad9910.c
> > +++ b/drivers/iio/frequency/ad9910.c  
> 
> 
> >  static int ad9910_read_raw(struct iio_dev *indio_dev,
> > @@ -691,6 +753,48 @@ static int ad9910_read_raw(struct iio_dev *indio_dev,
> >  			*val = 0;
> >  			*val2 = tmp64 >> 14;
> >  			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_PHASE:
> > +			*val = 0;
> > +			*val2 = AD9910_PI_NANORAD >> 15;
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> > +			tmp32 = FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> > +					  st->reg[AD9910_REG_CFR2].val32);
> > +			tmp64 = (u64)st->data.sysclk_freq_hz << tmp32;
> > +			tmp64 = ad9910_rational_scale(tmp64, NANO, BIT_ULL(32));  
> 
> Process of elimination points me to this line which is a slim wrapper.
> 
> static inline u64 ad9910_rational_scale(u64 input, u64 scale, u64 reference)
> {
> 	return mul_u64_add_u64_div_u64(input, scale, reference >> 1, reference);
> }
> 
> David, any thoughts?

Lots of instructions only support sign extending 32bit immediates.
The asm constraint for the ADCQ needs to be "erm" not "irm".
I bet that is true elsewhere as well.

See source/arch/x86/include/asm/div64.h line 114

I'm actually surprised you see it with clang - it usually prefers the "m"
constraint.

I'll try to find a source tree that is clean enough to generate a patch.

	David


> 
> For now I'm backing out the series.
> 
> > +			*val = div_s64_rem(tmp64, NANO, val2);
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:
> > +			tmp64 = (u64)st->data.output_current_uA *
> > +				AD9910_NANO_MILLIAMP_PER_MICROAMP;
> > +			*val = 0;
> > +			*val2 = tmp64 >> 8;
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE:
> > +			*val = 0;
> > +			*val2 = AD9910_PI_NANORAD >> 7;
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		default:
> > +			return -EINVAL;
> > +		}  

