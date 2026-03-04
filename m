Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B53A7825
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626786; cv=none; b=qe3tKMGxSczC9PT0fVP9uOZuO5oL6D4tLeoE+0T97xEv9QR4VrdJunx+tvjjTNeNqoKb6kbeeyOyYWYJ5jxyT8D9lKa+qasK8G/xW0dC8VUZL1FN2r8H1P3Bo1haP9LIugMNHDkE7eLoQ5lELupd20RvvvLqhBtOo0yqR7UsGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626786; c=relaxed/simple;
	bh=8jaB9xhr+C3taJqbbWa5n/w0SjBdD0Ab/HQmNKTmf5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eJ0H/B6vJwSSb+/siceW9BkUQRNr6wuuVlmVlUDnI3jL9+dV7S7Vay8fpBCRVklR5JUmOFKgIbiyC0qNDgaZgbY1rawkiVv/i2Uefzd5bPECWKdq1cdVeVok3OdQNAlZ8H6Lp6f/o+Xj3QJMsWHrpXJaSy7poXsqlZ5J/pfWPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPGS7qcY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPGS7qcY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b790af67so1934082f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626782; x=1773231582; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=mPGS7qcYgizPq0GUZEFxBiiZXF7J3p+av3wLK1Y+kbcw9Zz4Hi0XPDjE3MnudZb42x
         5MYVxuHHhzpxS2V1aHm8eI+I+0Tf5qIbElxaYYqDPw6Ax73zRmJwkyr+Nysi17c3Rppk
         z3its7D8ypyaT2gg7RKuZ41epVo8umsilAbjwI+JvMbz8QZq14KK19EBTMSgtt/4ZcgC
         RYnH2xIRZK5G2+Nmim/vXEx9EZPOcuBR9n/t2usMiuG9OyopEW+fTr9+MOhZbKj7JXvF
         B6GNfEdf4hIXoIOf9zT71etn5a5IE6Km6u7TwlZNblgB6hj/NClk9fd81to/W49WEJLt
         H5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626782; x=1773231582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=b3dNm90DrSqhVCOSu9BKcvutU0CuPpsGfqrn2DdaEbnk4LZSI0pOsFuI+LUzdGT+uO
         cONdml5ImfG37KH17Du8QPjcReoKt38cuxRHYz7sVSRyVW/bx9b+yeF5wMNaFdiOGgUV
         XlJyJ/ZNTsBByJlTpYmiQw9RMrNLqNoZ6U7QdyNh8/vXs9mXNmwur8iXechNvNK4R0nR
         Pse++a+ZERH7HhwviOPtUFeX6bUisaaFyIkzM1qGYp12fnoS7VC7xGW020der+IPv++r
         nh8DNfHcPez6tUZNk9t1mUr856kzpr1P1Lk+AbKH+VRsuMvBPqjdTpbD7Ct2532JtCND
         gf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXfSvTpPRQYLH3OS0QRVfh4xIu6WyAOA26Mo21QJlEPTMaT9wtBAH3THd7Ju8FG71Utbue9qMMV2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqpndcm0HoUShitfh0ZGApo6j49oRU1iazKvlGcxY1TB9sxgel
	Ioz2lHTGd+gNdIm7M0xrDr0PQu7pz9kMxEa8qcNBWDYAQPmB4CTMdqJE
X-Gm-Gg: ATEYQzxoALRtIv7a2C/kdpYT0GLmTXYU5PcoyxnldqiKJG8W3C/pp/qQDzPdtijigeQ
	uPuqq4cnL91E+gXR6QKcEUQ4dSohvNX0rHnRLvk6tSyTq08eRoDi//nSSwyn4wnUaRcH2o42i+M
	iOkzA42C0+BVkP0+p7Mdb4VR80H+QCzjn3VV6yQqDhE//03cvNMf1tp9ERqbl4P13CdyTTOP+y4
	eP1jND/zBo6WP8Nv0jh2b8yvrcshIqs/dBO0xGY+rnogWHjvScQkP4f+7MC3u00aBBdWTGOmpus
	6G36ACqi3bL3uQPOm/PAzwNyBWHZ+8KJsqA1iWQTN6lggdMJ6CkJ2e3cG31BsqYmeic1zMVF5nu
	jnd/Y6MdPkEKq6VJGuVg+78GFNKb+xmJVRFH6326ImfdcIJgYJvlyi6eInnClh9sZm0CdXpazjD
	Gk9sf137P+AoXJ5GXIcZJnJGsrKp2AXps=
X-Received: by 2002:a05:6000:2912:b0:439:b9e8:635f with SMTP id ffacd0b85a97d-439c8a9f004mr3065699f8f.21.1772626781522;
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm27010827f8f.2.2026.03.04.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Message-ID: <f3fa4c490a61c4544fa93682f3dd18e0f98b8473.camel@gmail.com>
Subject: Re: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Nuno =?ISO-8859-1?Q?S=E1?= via B4
 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,  Jonathan Corbet	 <corbet@lwn.net>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>
Date: Wed, 04 Mar 2026 12:20:25 +0000
In-Reply-To: <202603041109.HFnPWnj8-lkp@intel.com>
References: <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>
	 <202603041109.HFnPWnj8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-04 at 12:05 +0100, kernel test robot wrote:
> Hi Nuno,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 78558965440b27814592ec82d8f3668395953b1b]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bin=
dings-hwmon-Document-the-LTC4283-Swap-Controller/20260304-010255
> base:=C2=A0=C2=A0 78558965440b27814592ec82d8f3668395953b1b
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260303-ltc4283-=
support-v6-2-efe11502fad2%40analog.com
> patch subject: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283=
 Swap Controller
> compiler: clang version 20.1.8
> (https://github.com/llvm/llvm-project=C2=A087f0227cb60147a26a1eeb4fb06e3b=
505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce:
> (https://download.01.org/0day-ci/archive/20260304/202603041109.HFnPWnj8-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202603041109.HFnPWnj8-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]
> > > Documentation/hwmon/ltc4283.rst:258: WARNING: Blank line required aft=
er table. [docutils]
> =C2=A0=C2=A0 Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: =
ERROR: Unexpected section title.
>=20
>=20
> vim +258 Documentation/hwmon/ltc4283.rst
>=20
> =C2=A0=C2=A0 256=09
> =C2=A0=C2=A0 257	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0> 258	power1_failed_fault_log		Set to 1 by a power1 fault occurring=
.

Arggh, will wait for more feedback before spinning a new version.

- Nuno S=C3=A1
