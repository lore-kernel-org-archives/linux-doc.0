Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C0328B73
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254167; cv=none; b=dwkSniiHe8wDJyTOXgFd/bI2rLRO8JRen8z3I2VTX/DsbJBlDAlGcvFYwilrxri1ub6Ig9pQfLaHcCv9xzMv6BCveufGbbXa7Lbyv/j9mSHZHmSBwMY6BfcLJKaaN0VtxOYYJwP5+pJaCK3tJqDAoWqWL5aoq3Gbx1zp75nhosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254167; c=relaxed/simple;
	bh=y/w70PmgkgiljvltcnTxMbOWap97glwa/EjzZTFKfmA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NVwHwbIBmBy4lgdlEu4t4KTLz+eT9Qg4YNXY/YwdwnM6H1AVf/bxX6sZ2BzinjcWgcPpbbHdu5HRHm0ji6JE/R52/tHrkV0uw7ztR6ywJzfzm5sasvZ9xD1fWk5RxdhBrrQpaVDyieCyRpuOX681ELFEfkPWzQTBvY5nxrdcwII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnrYKOwx; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnrYKOwx"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc59a785697so856523a12.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764254164; x=1764858964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WbONDNfo5P6URvv49uARRyWcfYc6EtU0aSI8NWvYcqA=;
        b=BnrYKOwx0zYlqh1aUcqOKFf3LapSU4LUju4z5lsrtF1tXuEidIJNxPWZSzt2LLmoAD
         Ql6bjzGGpQmvqvN1b1qFO+4QLXe828k8BqSQFhhFkoafZwXmH7YFQS8W6/h6BgXEQZnv
         ziA2mS4hjlZXQOHElXX6/SRj+L0rJpLUnJnKnY/+QNF3WN2Uiw4yhLIssXOlVum0uN0p
         UZEAdknLIrJgXttY8ZE5/9gqIiHdb9BIH7PVRy/0rBnWeg4OxNb3tCixV2SxPi7updHJ
         3TEUGVA6PwXEDLf21OKXXcnN1ziKALhNV+9lVk1ktsHgL/Pmx/WJtsOPqO2vvOCEw45t
         VbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254164; x=1764858964;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbONDNfo5P6URvv49uARRyWcfYc6EtU0aSI8NWvYcqA=;
        b=cVpgCadiUXGMrHZZi4oXtYE7KuauKxmPZrSbZ6y7OXasu0QEn8otG5v+si7FcWRFoK
         wG30aqO4QnVPHP58ByxoO6bBel6osFuQ6a+lFxkNuYdSWzfvvaYwq634fMe17ADx87sM
         dAaEJKaXqmElvu9LSRXxAxzgbyg/H0TnAefCweQ0EVE45BGs8a8XlDbjJI7IY9zxCYBg
         HKOO35AyITk5K3oVM6aUD3ofTXF7KfeUBOPRhyXrXQPyrpl8Rlgu3QiVnWfd7hHmf2BB
         ksPpNXoiVVpomONeU2q5gFdXdQ50W3E5uKa+3yMrkNJJeil76SwXJAmg8vjbFy+5iNXB
         rXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJqqTXE+t8W8gjjWPFgOOTCvgHM1qbpXdIlZz9j+OmaKt6y0oD0SprNo/vaaFNX9fAo5HtbvyZy3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZfqOHAXDRc8Ym2ckJuAyWooqUVPImr9uKHSYC913ndxQpJ7I
	rcMaGO/9BvJU0oadjz41FPIIMPLIsrGnuLvJDrKU5/Jp1/2fvKftpK5m
X-Gm-Gg: ASbGncvJcEYNnDhXWZmoVZN4gKTmhZp3fqnJVBHB0io6DEqzwnl+B3uEhyhaJlfpMBL
	A7GNYfM/g0pS9yA70ZbdMLKoAZsu3w/8fJvnKE7F41xosH/5RbjcWlG32rni6M81UFuC2LpyCN2
	px+ZPkwOjYbhJybMGwh3MFxMULXFj36oNS2nbEZ4sdUscjKCL86bO751d7NRq679auiq2LnMJZn
	LhvhblhiElibUCnKmO8N+vHyg2d74B8r/VLdtmWSLMJimgQ+mzYDWq8e7J8ar/UZ8DPBxnlMnFM
	MFnzkQ35vnMva+yT0rnnOrd2/DZTgGP1Zyqn7NbrHaX6n2C5u00bxMhKg3qutOmTjn26g+k/4c8
	Y6eRvh269nuSjdXQw8qhfY/lbTM3v20r3QzeSpOPoCOuheioCRnqqQ2sBzhCG+EKq6XfPNAfFi9
	xbaoFAjOB6zn+cGFHpw4JPj9sXQRHg3Wy7Qjd/eNPWOfdFYXqh/3r4s2Vdhw17fTZ7KBR0oo9IB
	XIYxzP5ag==
X-Google-Smtp-Source: AGHT+IGDH89O43VYWGivoRzsH/VMsd+fKZHuO3oJN/28fn5VsdLF5lsOBh224MfCX+i8kiHkoomAAw==
X-Received: by 2002:a05:7301:b0d:b0:2a4:4bb4:4712 with SMTP id 5a478bee46e88-2a7192e5b06mr13076983eec.39.1764254163482;
        Thu, 27 Nov 2025 06:36:03 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee7076sm7209397c88.4.2025.11.27.06.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 06:36:02 -0800 (PST)
Date: Thu, 27 Nov 2025 06:36:02 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
CC: Len Brown <lenb@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/3=5D_acpi=3A_platform=5Fpr?=
 =?US-ASCII?Q?ofile_-_Add_max-power_profile_option?=
User-Agent: Thunderbird for Android
In-Reply-To: <bf61e05b-74ac-28de-d8ea-4a909d6e5fb8@linux.intel.com>
References: <20251113212639.459896-1-derekjohn.clark@gmail.com> <20251113212639.459896-2-derekjohn.clark@gmail.com> <7050cadc-9cb7-4f9b-8393-247bddb56965@gmx.de> <CFD27662-0044-4AF3-8E66-65229324CECF@gmail.com> <e801bef5-158e-4422-9c23-93dc2210f734@gmx.de> <bf61e05b-74ac-28de-d8ea-4a909d6e5fb8@linux.intel.com>
Message-ID: <278FC60D-C084-44B9-A0DB-23FAC930458B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 27, 2025 4:11:36 AM PST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@=
linux=2Eintel=2Ecom> wrote:
>On Mon, 17 Nov 2025, Armin Wolf wrote:
>
>> Am 16=2E11=2E25 um 20:01 schrieb Derek J=2E Clark:
>>=20
>> > On November 16, 2025 8:13:17 AM PST, Armin Wolf <W_Armin@gmx=2Ede> wr=
ote:
>> > > Am 13=2E11=2E25 um 22:26 schrieb Derek J=2E Clark:
>> > >=20
>> > > > Some devices, namely Lenovo Legion devices, have an "extreme" mod=
e where
>> > > > power draw is at the maximum limit of the cooling hardware=2E Add=
 a new
>> > > > "max-power" platform profile to properly reflect this operating m=
ode=2E
>> > > >=20
>> > > > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel=2Eorg>
>> > > > Acked-by: Rafael J=2E Wysocki (Intel) <rafael@kernel=2Eorg>
>> > > > Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > > > ---
>> > > >    Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
>> > > >    drivers/acpi/platform_profile=2Ec                        | 1 +
>> > > >    include/linux/platform_profile=2Eh                       | 1 +
>> > > >    3 files changed, 4 insertions(+)
>> > > >=20
>> > > > diff --git a/Documentation/ABI/testing/sysfs-class-platform-profi=
le
>> > > > b/Documentation/ABI/testing/sysfs-class-platform-profile
>> > > > index dc72adfb830a=2E=2Efcab26894ec3 100644
>> > > > --- a/Documentation/ABI/testing/sysfs-class-platform-profile
>> > > > +++ b/Documentation/ABI/testing/sysfs-class-platform-profile
>> > > > @@ -23,6 +23,8 @@ Description:	This file contains a space-separat=
ed
>> > > > list of profiles supported
>> > > >    					power consumption with a
>> > > > slight bias
>> > > >    					towards performance
>> > > >    		performance		High performance operation
>> > > > +		max-power		Higher performance operation that may
>> > > > exceed
>> > > > +					internal battery draw limits when on
>> > > > AC power
>> > > I am not sure if it is a good idea to allow platform_profile_cycle(=
) to
>> > > cycle into this
>> > > new max-power profile=2E The system could encounter a brownout if i=
t is
>> > > currently operating
>> > > on battery power when selecting max-power=2E
>> > >=20
>> > > Maybe we should prevent platform_profile_cylce() from selecting max=
-power?
>> > At least for Lenovo devices unplugging AC will automatically throttle=
 the
>> > ppt values to roughly equivalent to performance=2E It will look at a =
different
>> > WMI data block for the values when switched, so there's no risk for c=
ycling
>> > in this case=2E This seems like smart hardware design, but we've cert=
ainly
>> > seen bad hardware design so the concern is warranted=2E Perhaps it is=
 worth
>> > visiting if another vendor implements it differently? That being said=
, what
>> > you're describing would match up with how the physical profile select=
ion
>> > button works, so it would align with consumer expectation=2E I have n=
o strong
>> > feelings either way, but I'm a little concerned about meeting the mer=
ge
>> > window as this series fixes a pretty disruptive bug affecting 6=2E17 =
users=2E
>> >=20
>> > Regards,
>> > - Derek
>> >=20
>> If the physical platform selection button does not automatically select=
 the
>> max-power profile under Windows, then we should copy this behavior i th=
ink=2E
>> The changes necessary for that are fairly small, basically you only hav=
e to
>> extend the handling of PLATFORM_PROFILE_CUSTOM inside platform_profile_=
cycle()
>> to also include the max-power profile=2E So i would prefer if we modify
>> platform_profile_cycle() now has doing this later might be seen as a
>> regression=2E
>
>Derek,
>
>Any comments on this?
>
>I'd very much prefer to take this series in this cycle but this comment=
=20
>seems unresolved and has userspace visible impact so may bind us=20
>irrevocably to certain behavior=2E
>
>--
> i=2E

Ilpo,

If I'm being totally honest I forgot about this request=2E I can knock thi=
s out pretty quickly and send v4 today=2E

Thanks,
Derek
>>=20
>> Thanks,
>> Armin Wolf
>>=20
>> > > Other than that:
>> > > Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> > >=20
>> > > >    		custom			Driver defined custom profile
>> > > >    		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > >    diff --git a/drivers/acpi/platform_profile=2Ec
>> > > > b/drivers/acpi/platform_profile=2Ec
>> > > > index b43f4459a4f6=2E=2Eaa1dce05121b 100644
>> > > > --- a/drivers/acpi/platform_profile=2Ec
>> > > > +++ b/drivers/acpi/platform_profile=2Ec
>> > > > @@ -37,6 +37,7 @@ static const char * const profile_names[] =3D {
>> > > >    	[PLATFORM_PROFILE_BALANCED] =3D "balanced",
>> > > >    	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] =3D
>> > > > "balanced-performance",
>> > > >    	[PLATFORM_PROFILE_PERFORMANCE] =3D "performance",
>> > > > +	[PLATFORM_PROFILE_MAX_POWER] =3D "max-power",
>> > > >    	[PLATFORM_PROFILE_CUSTOM] =3D "custom",
>> > > >    };
>> > > >    static_assert(ARRAY_SIZE(profile_names) =3D=3D PLATFORM_PROFIL=
E_LAST);
>> > > > diff --git a/include/linux/platform_profile=2Eh
>> > > > b/include/linux/platform_profile=2Eh
>> > > > index a299225ab92e=2E=2E855b28340e95 100644
>> > > > --- a/include/linux/platform_profile=2Eh
>> > > > +++ b/include/linux/platform_profile=2Eh
>> > > > @@ -24,6 +24,7 @@ enum platform_profile_option {
>> > > >    	PLATFORM_PROFILE_BALANCED,
>> > > >    	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
>> > > >    	PLATFORM_PROFILE_PERFORMANCE,
>> > > > +	PLATFORM_PROFILE_MAX_POWER,
>> > > >    	PLATFORM_PROFILE_CUSTOM,
>> > > >    	PLATFORM_PROFILE_LAST, /*must always be last */
>> > > >    };
>> >=20
>>=20

