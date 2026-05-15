Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50023E6DD6
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830318; cv=pass; b=HTvJ/R7R4n4HLjwtPNGLcac66mnzwZEHs3jY2r8MHiKJUHkvmIcHrAs3InuYLk31zYYlJx+efBfmQiq/JQDFMSPszX7kZBjM2nX+u/pET45+7FYBTl6P8jQSlY/WkhdHvxSqwZnmZyvaqYxa8AbzbHnmULzZO2DiTCFVM2RuVro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830318; c=relaxed/simple;
	bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktxSotFwuS7c1ELImzvcQWW3YlT9O7HNyEnIt9HOSIbwR+cIeMxAJuYakUIVceqqp4z2nHs4ogkJe1D0uw4jRDIfUK7b0V9tjlLB8J2PyHJxxwxqthy8sTEvzYJal0YQg07/mJ5XOtOXblUdMGM73IlD9zmlW9wpPCF/AOfaHAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXoYYfV0; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXoYYfV0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bcceb394417so760757366b.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830315; cv=none;
        d=google.com; s=arc-20240605;
        b=lLDUuIcdSDM0WE2UdR7emMnrX8ADIQSEAVOL2CTc9X9K1ga3KX5/sltu0ZN9onRGgD
         ycIb5sH/wABfzxhJRAODXP4hkqbqe06gTlqGUijQ6ttF2apnDJ295bg9rAHcbt94oSvy
         8mDqWmvkVBSdCm9dnSvNEmeFwzh2csjHDvgtxNxNTO/R1cDUOjuvnoZOe6IgRvDyYwJP
         VmC+NSgvuxfSyrhfhTd0k82iEAQGBhd+ttu+R7PlvSkgnnr3y1YzC3FF4RRjgHx332aZ
         ABEXfPwO+dsIzcIZ54qNeFfFDAOyxNDdfzCi2HRLP/jMmpbS+r17iRDZ1GyndAI23mIl
         8+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
        fh=hwlkJ/+Eec+P/zrBpP6HrD03QF1MbbpL9tpjn1vNfXM=;
        b=bJVTDOK3xIJkw+l1wBqDL8FCBkR86JWoEfnGafOoYVKhdDcWeHOiD424v0WGsmeDkT
         eN5KHA353sm0+hqa1idZdFgRtk0+CIPA4Lmk6NrRo7nErUNmQYpKZ65mBMR3BVdFOlAY
         WEn3CaLjVpQkqTqBc3s/ra109rP9XuyuGMyM/Rn6NEFXqEroEqJGzU76WEfxK/qruoCK
         ovR6Qv77PuvsbW/PXkcYODtceyMgiErnLsU/84JyhDFUST6EnUVGmr9UFZ0bZt/5HqOc
         9DpuL0krDXb/GtNLC3+za9r9CIIK8Ibl5CNxmwUhTp+WkMxLYv3dmeAwteEpIFCzDqYj
         jTKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830315; x=1779435115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
        b=AXoYYfV0xdQL2EvM6lCogOlDWNQaeGF6nGq0rbBC2KD/F9/y+MTmaXgoA7LKsFuErm
         SwZz2/xIRXO9eIjHlWf89zUzVPGmkE4Hq1ADw3VdwdQiPaurNRIE0YYW0Qi8wD3wMHn2
         c2uk3rFQDKPDmEFbI/HYDC/W0nMtjsXFQLi3exTGjDV6hqgyCfcmDi9SUedm5zd2Z01T
         86zYgQkwWPuiR9zX4w50fBsVdpA44lc2j4OeDbmNOmz8LRoS7bdhjM3mFoXMC2HedO/t
         0uMk0ZJVnZZSwYP5WVmwqVoE3Wjxwzad8c2ftykQDvPkgDBNaAWaicoHDpok4ELi9JvW
         OpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830315; x=1779435115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/SsPiVJtDZ72Sr+gRIQuTO1NvYWy3UPeoA4P6g0JsU=;
        b=VxOQmV3xFSLHfmXUZSQk0aUG3dt6C12djVXmf1PePvFtrJLmu8eDrxXd4WBwT6jLYu
         Y2mRBSKvjumwx/IyUVniOe+6y4BZq5JCSoPJWddBAEf/nc8y4WJL4KeP+5bWbAnte1xB
         sfHP7tVAEM0zzg+749+GbNBiYf7xF6tb84EMIeHNVjxEpJ14gDkwFP4tHO0hK75qG2m9
         43NGuuUQNLShSJstwmuASMOFsBpkZ/HwUHxtVwT4Bk3sdluHqYTIDQwN/y4WeyhlQhCw
         Og/UPBGDKfuCndpq1ajdqJBcmtkjwHAiboXCV4KmWbdpfCeJpazLcdP8EXJFm9QnxPAu
         ZArw==
X-Forwarded-Encrypted: i=1; AFNElJ8HhbvaVX/Yl7EaX4ldDJCVKBdtLT4B+JdY2H3Os+/9mcSEcclCcXqpNv07qsi6MDMI+1JBxyfXtGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRI7orF8rx+j5BGQnpPTM2qtkL9Eomh2Qcixph76wEeYB3Otpd
	/4aDrHgkaiduLzJxirAptSvMk13YU6nG+z2tww8Kj8SjIAqrIXmBGf/rAA33VRJrWBNKu7ki20j
	E20Sd7oMS6X1Jzd0z7Qrb9yngMQPxN6Q=
X-Gm-Gg: Acq92OFIunxTQJUiJlMnI1PYOhBF5hgS3vSm/2TJmlziRtQSDnLmgtqauasQLpJO0nH
	oKYxjD4TBy/kVwrbHMZcbHVx3voR2/VnLODHeBT4OTsEGSc5/iI8z5cW8puFG0FOlVrxSNeovdR
	GGl+nBtN1hc4dqId3vun5uUkX4oHOetGWYgZ7FACVykZHeyr4T76KVOz3UPn4QjmNHX1byALz7+
	LLMaOCruVWG30oz1BXaKmQTWArGr080fPQLKF+T0tiPbmNpMrMopkcoID/BNYv3m7ZB72BcrMgv
	6lF6WAsMrQKPfYXbwKT6wUsELGQMXBhDl2so1K0AjdVYH9QtpDsYqQRzqeed+Og2xEYPz8XooLL
	SfPmKfMQ=
X-Received: by 2002:a17:907:9802:b0:bce:804f:f199 with SMTP id
 a640c23a62f3a-bd517aaf35emr124360466b.40.1778830315236; Fri, 15 May 2026
 00:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
 <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
In-Reply-To: <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 10:31:19 +0300
X-Gm-Features: AVHnY4K3RmWomzVU2dlVSzNVcpQvqzGa2-vhlNceUIfF6GpAdlsduEN_ocTMzyM
Message-ID: <CAHp75Vdng_p2w4LLLd7midQWJ1FnMLBOT7p_gfOi2evjbSEUDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:30=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wr=
ote:
> > > add kernel-doc comment to strlcat() function definitions

...

> > > +/**
> > > + * strlcat - Append a string to an existing string
> > > + *
> > > + * @dest: pointer to %NUL-terminated string to append to
> > > + * @src: pointer to %NUL-terminated string to append from
> > > + * @count: Maximum bytes available in @dest
> > > + *
> >
> > Missing "Returns ...".
>
> Documentation says "Return:" as

I mean the kernel-doc documentation. Here the section is missed and
needs to be added, indeed.

> - the section (note important colon)
> - the singular (however plural is undocumented and supported)
>
> > > + * Do not use this function. Prefer building the string with
> > > + * formatting, via scnprintf(), seq_buf, or similar.
> > > + *
> > > + */

--=20
With Best Regards,
Andy Shevchenko
