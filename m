Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869F2DF126
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792264584; cv=pass; b=FEtaFmvYO0EC6VXtVA1700p5zTbm+GRG/wc2aGprV4kEdLA/zJ1Oqidp1p9ap/p9BtsvCbox6ulWhxzPyEgohilHcQPcOSph1TLJ+YUTAB2HQTZaTxKqP+DUcJ+WmwRK4HDSrta3/u7Fw85k75/7O1Fb8K5SwnuvKk98ht3ImXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792264584; c=relaxed/simple;
	bh=Z4OyXcJagBnFQn/ViOZVUwTX8x9tggUpZX39gqflrPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghkOwsPbU4MoygOnEuSFb62tk0RAxhjWttATQh5Sufpp9SRhND/IBtz98E1ScbxDFcoeGtnB2ieCoollkEtOfPUktsFASiiG5Xs6VHFFjaPZbXKfMtFMzRUncNJMtvlio9dhdjsojngMjQWn2ELWiU0VTQEWslO7R6aWJvHS2qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABzC3x+e; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABzC3x+e"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6deb848ddd7so669639eaf.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 12:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792264582; cv=none;
        d=google.com; s=arc-20260327;
        b=LOG4qSc6gJEcndSedDyEOie3QMgSHh7fg4s48r+3T//WuCdb9TWLgnqNN7or+uenRF
         eNmt1K7fzZ1QLH1hjahP2GCiJkGQ9acmN4+9DytwP2ILShRIIZhixz9DkoBD5Co7pLs0
         GmRUcmHh+qrEWWh1ONVugcw6ivgWluF4DZp2lanxrRdR+dK8Jkzj/hhS+xCGW0R3pLo5
         d2CT+bv83GFTZ54CNEvl1rGjy3zAIhcPTnAO/ArTLwTwBpWvJyoh4s5oz1p8U83Otw5J
         4lxnUxbKktOwxNlgwLezQ3TjORFjNZ4ZtpsI/oa/92SZFFqrE8l91u6i5c4669ZFOyTe
         ulbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3kpX1qw8aI9g0XRNJfIyX0LLMiylk567EvCY0vBBCeU=;
        fh=/Ngd8dHOhtGuoKIuokY6HT7jwv3HHRCiNqycen2pc+o=;
        b=Ypo/T/1TG+vb0Ga+kVDrx3Ipu4gcduIcvT38QCVOLnioWkNqODSPDt6hhMmYqctlAk
         90MQug0bzjr3FVBBhgVqFixsZ2NjJ8bEoVgALE2idIakmLyB0e6OkzoSyWvSJuy2jBQG
         /tVWYvKQnEsOM6uzF8OCxcZh5bRBRjLHtR8zezYJqyzy6bQevPQrH4DSfoklP/p31qhb
         XrhxbBscIPcd8um00DF+ytfNYhDxCVn0nP+1M8Y7pCQ01VY1XPkSmjN1U/eb6A2JUfUe
         83j1XawaFiHAs2cnI0tQJO81mFBKpubgd7oUVTN5FpwVoiS5U/SkHNK5X7sc9bf7pJZp
         xjBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792264582; x=1792869382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3kpX1qw8aI9g0XRNJfIyX0LLMiylk567EvCY0vBBCeU=;
        b=ABzC3x+eqbR9370JWhcy+T35IkvABJwTI4joPbmTSu7XFYvG5o/9IkZlIZwYpDD9Ei
         U1/HbNyEDc1xvAbClcNOLOU/m0sTG01fPTXr+Bo+az0/sWMECqQvYcINioieCFNpZM1E
         2P1TppDcHBLVUdPfOweBsEf6mW/hwx44wXFZxy9lFMvxAvKTkQkXeww057yXhK2ETdd+
         X/GCmboLnIaA/YXk/9kY9b/WvLyphOOkKrOSry/MtWCxDojcJ+5NxYDcb4QZRpBUofxt
         IklrOF/FWd71zmPkP79swdjfepFXjAlsOKExtFYs2/f/1GuWf2wguRJXuJS2jUVMUSNv
         /cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792264582; x=1792869382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kpX1qw8aI9g0XRNJfIyX0LLMiylk567EvCY0vBBCeU=;
        b=PjCOzSqU2BsSbmtfkiosCNF5QdJYH3uCs6gI7+bQCfgepD+BmngXbXnBjv0gWeQOpo
         nGG7Xnv9azMXFVSBPWhY0vhwPITZWKEyx1Zr9DhQwuhe0iWFThj0FktOZL2xQjfPjXk8
         YLzjDchEJHhIyRzs2ICiM8IJAiSzB4GfodVti90ogvn1hCo5x9/zReQ925nF09p1OBdE
         oHuHlHxrM4o93W9Tq2whJMR9OQBIbq4IJZXptjZjy7EmI/3lHKK0mfO0k0C7qK8SrnvT
         d4csS/rUbnDTceAQyHgnGVcAH1w9FPwY0hv6Hl9htWoxDfSqwsbkNGzWf5tkbT2LMGEv
         VQHg==
X-Forwarded-Encrypted: i=1; AKwUvBzz/aQ4qFRpt4c5C2U2NNKVClvoqViBFTSNz6ySZDzC26lgdnMyOFI+uXvVXd6EQzwL3pBVaN/C2zE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDIO1KScw6wySkI8fwbdwqHeXsH+3lZHxW/opx7VvhVPZ/90wN
	9iErlOO9ovOPHCCrVyGxC64DNcIZUQ15srdJdQtO8mN0856icKb6wjLt1eiBK0hqttBJJdqotHC
	eABDwAz1JZPRI+Smd82U6lLhms2DQThiAP4PDoXg=
X-Gm-Gg: AYBFou38kQQPLrRIfCijipz7eL94KthadCeSquo9nLaF1J3Ihc3rXhoBDCQnP7tfbkA
	t5bmQwFycUEIzPHg7hmESth895sIR7f3ytskRfePXs1Atn1JIDGzDZWm90a3bCkjY0ha5NFGyMO
	ygZAojypkKhjgJMkEVYdLWKMl+8NjnrUzBjdNvaS/DfIVhrlALWF0iNvppHs2BmoSamyo8lwk7d
	eRkYI21Etxq2NRB85rJYz1+cOB5m6ijPATQ7J3OIKaD4cnrx++6PWrhCMenEcxXq02UschGTdwx
	J4y6vr6qXJufOb1j1QfrS8QpxABnr2fQ56LT0COygLp0+Oje/Kqz8yU=
X-Received: by 2002:a05:6820:208d:b0:702:96cf:69ae with SMTP id
 006d021491bc7-70357f996a6mr2222268eaf.73.1792264581908; Sat, 17 Oct 2026
 12:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260807055952.GIanV0WDlB9-eP9VdV@fat_crate.local> <CAG4KcRJcpLREkbmOEEw7nGD+_PNOd+fWHkODqfWo1M8hmxA_Bg@mail.gmail.com>
 <20261017042204.GAatL37AhysV7BZBod@fat_crate.local>
In-Reply-To: <20261017042204.GAatL37AhysV7BZBod@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sat, 17 Oct 2026 20:16:09 +0100
X-Gm-Features: AclHuK9ltyMIoKi-tNdGjK3uKrWCnIWl5RP71EvNz5XG4osLNZC_K9K1LqvUxuM
Message-ID: <CAG4KcR+9mHBBOpAw=_kN5Smd+KNCA=5-Fd5nkFgVRi5XC7Yf-A@mail.gmail.com>
Subject: Re: [PATCH v23 0/2] ACPI: Add support for ACPI RAS2 feature table
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 5:22=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Sun, Aug 09, 2026 at 05:21:35PM +0100, Shiju Jose wrote:
> > > +static int ras2_update_patrol_scrub_params_cache(struct ras2_mem_ctx=
 *ras2_ctx)
> > > +{
> > [ ... ]
> > > + if  (ioread32(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING) {
> > > + ras2_ctx->od_scrub =3D true;
> > > + ras2_ctx->base =3D ioread64(&ps_sm->params.actl_addr_range[0]);
> > > + ras2_ctx->size =3D ioread64(&ps_sm->params.actl_addr_range[1]);
> > > + } else {
> > > + ras2_ctx->od_scrub =3D false;
> > > + }
> > > +
> > > + return 0;
> > > +}
> > Does this logic misidentify a pre-existing background scrub as a demand
> > scrub?
> > If the platform firmware has background scrubbing enabled prior to driv=
er
> > initialization,
>
> First of all, when and how can that even happen?
>
> How can it happen that the platform has enabled background scrubbing befo=
re
> the driver loads?
Firmware can start the background scrubbing before the driver loads.

>
> And if that behind the driver enabling is legitimate, the driver should l=
oad
> and ask the hw what scrubbing is currently enabled and mirror that in its
> internal structures tracking those settings, right?
Yes .This is done in the ras2_mem_drv_probe() by calling
ret =3D ras2_update_patrol_scrub_params_cache(ras2_ctx);

>
> I haven't looked in detail yet so perhaps you're doing it already. I need=
 to
> clean up that code first, though, because it is very hard to read.
>
> > ioread32() will read RAS2_PS_FLAG_SCRUB_RUNNING. Because
> > the driver's internal bg_scrub state is initialized to false, this assu=
mes
> > the active scrub is a demand scrub and sets od_scrub =3D true.
> > Would this prevent the user from controlling hardware memory scrubbing =
via
> > sysfs, since writing to enable_background might return -EBUSY and
> > writing to enable_demand might return -EOPNOTSUPP?
> >
> > Shiju:  This is not a valid comment.
> > Please find a description from the spec.ACPI spec 6.5 RAS2
> > Table 5.87: Parameter Block Structure for PATROL_SCRUB:
> > Flags (OUTPUT) : The platform returns this value in response to
> > GET_PATROL_PARAMETERS:
> > Bit [0]: Will be set if memory scrubber is already running for address
> > range specified in =E2=80=9CActual Address
>
> Which memory scrubber? The background one?
Hi Boris,

demand scrubbing. Please see the reply below for more details.

>
> > Range=E2=80=9D.Bits [31:1]: Reserved, must be zero.
> >
> >  ioread32(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING
> >  ACPI spec 6.5 RAS2 Table 5.87: Parameter Block Structure for PATROL_SC=
RUB
> >   Field: Flags (OUTPUT): bit[0] - returns status for demand scrub only,
>
> You lost me here. Where is that stated in that table 5.87?
>
> Confused just like the AI :)
Please see three fields in the ACPI spec 6.5 RAS2 "Table 5.87:
Parameter Block Structure for PATROL_SCRUB"

"Requested Range(INPUT)"  & "Actual Address Range (OUT-PUT)"  -
(Description) "If OSPM requests default scrubbing through Bit 0 of
the Configure patrol scrubbing (background scrubbing) field, then
"this field must be ignored" by the platform".

Note: This states that both "address range" fields are valid for
demand scrubbing only.

Flags (OUTPUT) - (Description)The platform returns this value in
response to GET_PATROL_PARAMETERS:
Bit [0]: Will be set if memory scrubber is already running for address
range specified in =E2=80=9CActual Address
Range=E2=80=9D.
Note:  This states that  Bit [0]: of the "Flags" field is valid for
demand scrubbing only.

Thanks,
Shiju
>
> The rest later.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
