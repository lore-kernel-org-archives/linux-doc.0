Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101972066DE
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777822; cv=none; b=jGJ2HY7KmNNupksb41bCL9+e7aQsNPuY8CYMH/i64tYVYWzrvCY1cV/O/Eo8cBxE/Lynl9lOdSawHTaAGO+9uAb0AKlSqHipvn8BW4wWQutqm0ZJnTQEc12Ce3h6sKVfEolBkZwkdDqUnqjlPz4hbKCSc3GO8LkDn7hHxkaGX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777822; c=relaxed/simple;
	bh=2rlUu0OfWYLMMk5E5C0WMmAOCUWyzBpXvXXud0P7wiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxzQprdz3iR5s6JdWJSFZpr9N3Gpxx/scbbXagtVnArly+Ga/4zsXhs9QkoDz0XEaqz/RYn9tTyUw/zdV3ikV7CzislRusLoAfd5/z+X+5b3KPbODc8yat87TpgEkXypChakrbGIGXT45VJqahPKl7tZvmvZve3v+y5V/dmPIwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TyXdcU7z; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TyXdcU7z"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so14800786d6.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752777820; x=1753382620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ThZUcaE7cELL9+x2yCkYIW367w/7LCL9CkjEF+QZYI=;
        b=TyXdcU7zYFJAm/3n2zsY+VXRijAem4V+I90jbJP3fkFmW2GHgpDDTbpQY7Q4f8Q2/P
         n7TNaBqkt6nFBVxV65Fvu8TnDqsLBJOLdaSKxij7Ejt3XHlp0ESUZ4+9PbcusBc/I2sw
         UoQsNk9j/s9vEspIWmtzUiR+8vB2X81fWi1RVp4f2QuXF7t6ypLiogEKpwYxrcgEegjX
         ojm/OyZt3O5JiUyaFHjzweakq8q1aMi6ukU1cSfnbP136NN0wUs8Mh2cYCnQrSpDxPPA
         cV+5r2OLEHKmufU7jFlMHtzWRJHd7vp6NxhMxPBFWQLLVFSxGXPZYZrSyASv+bflQKMG
         K+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777820; x=1753382620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ThZUcaE7cELL9+x2yCkYIW367w/7LCL9CkjEF+QZYI=;
        b=mv/bp/0c4gZL7CEayRdtWf/oBmbWV7L1ykWVHxzS3l8FvK997A+I5ai3lQMf9UmZXY
         2VGYPIzL8CW6Fkfh617T5IHU9Ywd9UBpvnRrW41kvUmr/pIGxjVhtKTiFut4DPDny16b
         bLl2E7v6eMtNQRCLeHV66pNi+QfpwDRsTgOclWQDA3dZq9bHHCymvT3rGlEkStJD/6le
         J8VRwzF9x4STXJV+Qjqx1ea4zhcdDwxv79Gb5BDyv4q3f6+Mgs/82+oCTQ6sOj/qL5bK
         7FIMgWKcw50uj8riLPhFeFvvBODu/UVnvBF2NPs9b0SkWA4AV7YPD9y0od8tZhSzUevR
         e4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXMYhWhE1x5iHl4xDjVdcphhLmpvqCUGnKH5zlyF8ZGzMB667KeYY7X2irOFnHdeeDmRb2Dn7uhBKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2aj5IQvk/DVZnz06PCZQqPT88R+phdKp8tHwvJCzYLcYLsR4C
	llGJU8MzDwBK1e5WcXgPWStU0qh8mQZmX50Ix2eynIAv2OPGu/DvHpt9gRRKL8v+awghLBBdCDA
	cd7mdkJs2LALoScqP4fwMLJc3HbRnhefH2YJYJKDg
X-Gm-Gg: ASbGnctb753xVm8GByDosNv5aFVolgNF0F8N1xNXSWY5nm6qZXCX3+LVQpLqZvs6hwN
	AFxWxGQ7e/MR4mMJfuaMTBMH9d+DaGGZJxlTrKW9jkBScAlAgHlPHlatIzCVXilCgeWwXXdPsiz
	rBz9X7Wp+ojCJXqclQtKYBDQxET9ygnG39MkVoK7BnijF/rd/h8Sn511d8YnsyPUrNVHkTt8pDE
	egeTHc1fjP04IQzO56HpagSH4fp23JeW7spYPi8aQ==
X-Google-Smtp-Source: AGHT+IErgUnPZNW5DTf24XUOU8ykTnxXG/uEOChv5A5KapAzEGlZz/dsjZwvHFyRV1DWdqxFwCi/2pfA+fFoM90vKmk=
X-Received: by 2002:a05:6214:5985:b0:702:d837:617e with SMTP id
 6a1803df08f44-704f6ac8088mr104372466d6.4.1752777819793; Thu, 17 Jul 2025
 11:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com> <202507151942.94dhYylY-lkp@intel.com>
In-Reply-To: <202507151942.94dhYylY-lkp@intel.com>
From: Jonathan Denose <jdenose@google.com>
Date: Thu, 17 Jul 2025 13:43:28 -0500
X-Gm-Features: Ac12FXy84paDZryxjZlQufmfIxp0QfVSXImTWCfW80dfNjKxtiRYlI8eV8MMgtk
Message-ID: <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
To: kernel test robot <lkp@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, oe-kbuild-all@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:36=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/HI=
D-add-haptics-page-defines/20250714-231444
> base:   86731a2a651e58953fc949573895f2fa6d456841
> patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v1-11=
-71c7c05748c9%40google.com
> patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch suppo=
rt
> config: hexagon-randconfig-r112-20250715 (https://download.01.org/0day-ci=
/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151942=
.94dhYylY-lkp@intel.com/reproduce)

I'm having trouble reproducing this build error. I tried following the
steps in the linked reproduce file, but when running:
COMPILER_INSTALL_PATH=3D$HOME/0day ~/lkp-tests/kbuild/make.cross C=3D1
CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited
-fmax-warnings=3Dunlimited' O=3Dbuild_dir ARCH=3Dhexagon olddefconfig

I get the errors:
0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown C compil=
er
scripts/Kconfig.include:45: Sorry, this C compiler is not supported.

It looks to me like the hexagon-linux-gcc compiler is correctly
installed at $HOME/0day so I'm not sure what to do from here. Can
someone please assist me with this?

--
Jonathan
