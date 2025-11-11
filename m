Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F322CBE6
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762850559; cv=none; b=WViTH3zgPXnZfcmb76PRc35BpnFBrDwIysHc+ghUiH90Dpj6t+7Qh14Von+VM+fEEH1JUbSbC8J8GbXXuqBfRTAslua6IODUt4FWcxjC/NIOs42CD/aWvY7DMMWudXJ3+kpMUsj53P0R00bC/d4MjjBL0RDcJ43+4A7uku6LDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762850559; c=relaxed/simple;
	bh=DoQf4P7TCErbJvQszDubE/Xq8KMmLCh+Pm32TVJ7128=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KcuGgXJ4ngtn1QNsGPXKWcqY6nRCZSPfauQ/ajLJzlbh6a+ueo/1KDPbk0NQeLWgmtmZ64qpFz06kbHoaczKTCELD7RP+Y2DxxSJ9Q71ucTPuyOQQRkph5NKo7eFSPd+mfKGhlJbU2k3lQi26izVsS05QvTq25P0DUdrJ/KFx8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/3VacPm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/3VacPm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so949782f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762850555; x=1763455355; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IqtEl7gImhAOH7rT5W1m8+quQVQyDX95I8EGDON4vhU=;
        b=S/3VacPmGOJHH57oFuBsooY6kY3wUoM9s6vp05t3duNod7AqmrgNY5J3drVPtLC2js
         7kCdQo/M3ikyHTgsWYJF9+/w10CyVQ2yc1wALVJWbl9XLzfZKwYZxBAeELUzYZRl/jqt
         WCILH6M2X5yRMeCfPkjtL2VgSJpYZi8u87vRIqBu1MFB4oSVUgPm0aQkDHBX1slRIGoC
         QFyhazepvWWYStxWD96FvpsidamiJiGosK+3s559cz09f92tHPhDgnekN9xl8BXyQBKf
         HUz7bz2GiXCgO0enxHs8F77K8HqSrnwvp0ydLbwz2cCyOWJJndddBTFq8rs2hQpZNPBj
         fzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762850555; x=1763455355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqtEl7gImhAOH7rT5W1m8+quQVQyDX95I8EGDON4vhU=;
        b=whHmPAjvWPRD0zutAVMpFdPYCoBQdw6JkRq/jRjIVfou75mh4AXFEloVI+NOCvf3Fh
         3SBmF9u4sf6vTaF2JlQK9ZkpAygvM1m0w4gNX65hvFea2ZuPyOdmzfiPASZ07O7dYvtp
         srFRJwqaiXjZJxx1SXL1ip2sYgPzXFgHBe8QfbrxQB4y0gZgdAjDpn5E8VkJ5w2PMmBT
         YoxlPE9zVBzMaPR4ss9chUxntw6F8FZx9q6stK4eG5uOcuGEjzqlinD6LEBhI0OQe68M
         mELFplK6NfYbOvVTnUvFIJw7tfyBrA3R4JJNfOfxiWYFBxIiLsMa6cnqFNGDstlSEPaK
         uFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUvjKoBUtgXCRypB1rB+PuMTw2ovXTUbwMouqzc6gxLYfa0BF/wlhktXJbTNwEH3iAFvLquHuT6eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/036BUpx8Ry7KPyfd4r1vpjmzt4cAZghAY+FIoDt35i6V3Jq
	RuZy/xOisDte63Maqafe54DLdnJ+U5HDUWHTsha3ivjNjfUKtQvHfIRa
X-Gm-Gg: ASbGnctmKdd/3DkQ2sc7/Iy5TqvAOggOsC9YVcI85A2mka4DNS03sVAJkHsIiL9N0PP
	RM58hTAchRkiruywSD1uUrUXxWuYecbxQ8wQta5fA1Y2t+QBVp7qsUJJh3KcCUN3s/YI4GYka9F
	H61y+fDJS7+enXpUuN9oOonhRff1OPYWVrhzlEeJ7v7fIEyjlyyuXIfB0PuHmf0OE2BmvUSuAFz
	mMxndEKd9XP3qahf2HlbtrpQYDNit5lKcYAJM6Pk2YeTTwLur8VAKMYbWBKYfs0JHUb9USNFrjs
	+iXUU7Q+W+EPnqXKb06+DKeNu0mLCq1P//jmpLe53y0l+ZOKtcVz05caBfi2jl5YEe99B42KXi2
	Wox6cQHM71f5VW6smtD5AgJ2b+sWWnky6c3frj/Rm1JjPByuVmL6/UjjvuhgxvVlPE0soLWkk62
	xrH/2q0yaS
X-Google-Smtp-Source: AGHT+IFN9HVusrgM/m4NWqHC6TFKKDpjhBbSMDgruLy+D3S5IkLHnmy9p92HE3ryPy5u/EciFDOU6Q==
X-Received: by 2002:a05:6000:420b:b0:429:8b01:c08c with SMTP id ffacd0b85a97d-42b2dbf16d1mr10115898f8f.19.1762850555184;
        Tue, 11 Nov 2025 00:42:35 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b321a80c0sm16163322f8f.1.2025.11.11.00.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 00:42:34 -0800 (PST)
Message-ID: <a8e09403ae80060648e0d70e4aef37221bc3d138.camel@gmail.com>
Subject: Re: [PATCH 1/3] iio: frequency: adf41513: driver implementation
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron	
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko	
 <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich	
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Tue, 11 Nov 2025 08:43:11 +0000
In-Reply-To: <aRITLaJir-2IoclU@smile.fi.intel.com>
References: <20251110-adf41513-iio-driver-v1-0-2df8be0fdc6e@analog.com>
	 <20251110-adf41513-iio-driver-v1-1-2df8be0fdc6e@analog.com>
	 <aRITLaJir-2IoclU@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andy,

On Mon, 2025-11-10 at 18:30 +0200, Andy Shevchenko wrote:
> On Mon, Nov 10, 2025 at 03:44:44PM +0000, Rodrigo Alencar via B4 Relay wr=
ote:
> >=20
> > - ADF41513: 1 GHz to 26.5 GHz frequency range
> > - ADF41510: 1 GHz to 10 GHz frequency range
> > - Integer-N and fractional-N operation modes
> > - Ultra-low phase noise (-235 dBc/Hz integer-N, -231 dBc/Hz fractional-=
N)
> > - High maximum PFD frequency (250 MHz integer-N, 125 MHz fractional-N)
> > - 25-bit fixed modulus or 49-bit variable modulus fractional modes
> > - Programmable charge pump currents with 16x range
> > - Digital lock detect functionality
> > - Phase resync capability for consistent output phase
> > - Clock framework integration for system clock generation
>=20
> It is like a list from the marketing material. Please
> 1) make sure you are writing the commit message;
> 2) implement minimum basic functionality and split features to the next
> patches, 1.5kLoCs is hard to review.
>=20
> ...
>=20
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/iio/sysfs.h>
> > +#include <linux/math64.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/spi/spi.h>
>=20
> At least types.h is missing. Follow IWYU. Have you passed internal review=
? I
> believe we need to start asking Analog Devices to provide a Rb tag of kno=
wn
> developers on the submitted code to make sure it was passed the internal
> review.
>=20
> ...
>=20
> > +/* Specifications */
> > +#define ADF41513_MIN_RF_FREQ			1000000000ULL	/* 1 GHz */
> > +#define ADF41510_MAX_RF_FREQ			10000000000ULL	/* 10 GHz */
> > +#define ADF41513_MAX_RF_FREQ			26500000000ULL	/* 26.5 GHz */
>=20
> We have HZ_PER_MHZ, also you can move HZ_PER_GHZ to the units.h and use i=
t here.
>=20
> > +
> > +#define ADF41513_MIN_REF_FREQ			10000000U	/* 10 MHz */
> > +#define ADF41513_MAX_REF_FREQ			800000000U	/* 800 MHz */
> > +#define ADF41513_MAX_REF_FREQ_DOUBLER		225000000U	/* 225 MHz */
> > +
> > +#define ADF41513_MAX_PFD_FREQ_INT_N_HZ		250000000U		/* 250 MHz */
> > +#define ADF41513_MAX_PFD_FREQ_FRAC_N_HZ		125000000U		/* 125 MHz */
> > +#define ADF41513_MAX_PFD_FREQ_INT_N_UHZ		250000000000000ULL	/* 250 MHz=
 */
> > +#define ADF41513_MAX_PFD_FREQ_FRAC_N_UHZ	125000000000000ULL	/* 125 MHz=
 */
>=20
> Ditto.
>=20
> ...
>=20
> > +#define ADF41513_MIN_CP_VOLTAGE_MV		810
> > +#define ADF41513_MAX_CP_VOLTAGE_MV		12960
>=20
> _mV
>=20
> ...
>=20
> > +#define ADF41513_MAX_LD_BIAS_UA			40
> > +#define ADF41513_LD_BIAS_STEP_UA		10
>=20
> _uA
>=20
>=20
> ...
>=20
> > +#define ADF41513_MAX_MOD2			((1 << 24) - 1)	/* 2^24 - 1 */
>=20
> Why not BIT()?
>=20
> ...
>=20
> > +/* Frequency conversion constants */
> > +#define ADF41513_HZ_TO_UHZ			1000000ULL	/* Convert Hz to uHz */
>=20
> Put it to units.h.
>=20
> ...
>=20
> > +enum {
> > +	ADF41513_FREQ,
> > +	ADF41513_POWER_DOWN,
> > +	ADF41513_FREQ_RESOLUTION,
> > +	ADF41513_FREQ_REFIN
>=20
> Doesn't sound like a terminator to me, add a comma.
>=20
> > +};
> > +
> > +enum adf41513_pll_mode {
> > +	ADF41513_MODE_INTEGER_N,
> > +	ADF41513_MODE_FIXED_MODULUS,
> > +	ADF41513_MODE_VARIABLE_MODULUS,
> > +	ADF41513_MODE_INVALID
>=20
> Ditto.
>=20
> > +};
>=20
> ...
>=20
> > +struct adf41513_data {
>=20
> Run `pahole` and act accordingly.
>=20
> > +	u64 power_up_frequency;
> > +
> > +	u8 ref_div_factor;
> > +	bool ref_doubler_en;
> > +	bool ref_div2_en;
> > +
> > +	u32 charge_pump_voltage_mv;
> > +	bool phase_detector_polarity;
> > +
> > +	u8 muxout_select;
> > +	bool muxout_1v8_en;
> > +
> > +	u8 lock_detect_precision;
> > +	u8 lock_detect_count;
> > +	u8 lock_detect_bias;
> > +	bool fast_lock_en;
> > +
> > +	u16 phase_resync_clk_div[2];
> > +	bool phase_resync_en;
> > +	bool load_enable_sync;
> > +
> > +	u64 freq_resolution_uhz;
> > +};
> > +
> > +struct adf41513_pll_settings {
> > +	enum adf41513_pll_mode mode;
> > +
> > +	u64 target_frequency_uhz;
> > +	u64 actual_frequency_uhz;
> > +	u64 pfd_frequency_uhz;
> > +
> > +	/* pll parameters */
> > +	u16 int_value;
> > +	u32 frac1;
> > +	u32 frac2;
> > +	u32 mod2;
> > +
> > +	/* reference path parameters */
> > +	u8 r_counter;
> > +	u8 ref_doubler;
> > +	u8 ref_div2;
> > +	u8 prescaler;
> > +};
>=20
> ...
>=20
> > +static const u32 adf41513_cp_voltage_mv[] =3D {
> > +	810, 1620, 2430, 3240, 4050, 4860, 5670, 6480, 7290, 8100,
> > +	8910, 9720, 10530, 11340, 12150, 12960
>=20
> Make it power-of-two items per line, even with the comments to show
> the indexing, like
>=20
> 	810, 1620, 2430, 3240, 4050, 4860, 5670, 6480,	/* 0 - 7 */
>=20
> > +};
>=20
> ...
>=20
> > +static int adf41513_parse_uhz(const char *str, u64 *freq_uhz)
>=20
> My gosh, please, try to check what kernel already has. We try hard to avo=
id Yet
> Another Best Parser in the World to happen, really.
>=20

I think there's more into this. I did not went into much detail but IIUC it=
's
doing the same as (to some degree) as __iio_str_to_fixpoint() but the part =
needs
u64 for the integer part. Being this one case not sure if we should rush in=
to doing
something in IIO core. Or the whole thing might end up being done completel=
y
different.

Having said the above We should have a proper comment justifying the functi=
on.

> ...
>=20
> In any case, I stopped my review here, you have more than enough to fix.
> Please, come next time with a tag from one whose name is in the MAINTAINE=
RS.
> From now on it will be my requirement as a reviewer of IIO subsystem.


Not really sure what happened here. We are trying to make things better (as=
 more people
in ADI from different teams start contributing) and have a process where in=
ternal reviews
do happen (mostly even public in github) and once approved it can go upstre=
am. We also have
a fairly good CI in place to catch things like bindings, checkpatch, smatch=
, cocci and compiler
analyzers.

For this particular part we did had at least one round of reviewing where I=
 actually stated

"...We'll need some iterations on this one and skipped more questionable/co=
mplicated things for now.
..."

I guess Rodrigo was eager to send his first patch series but hopefully, les=
sons learned.

- Nuno S=C3=A1
