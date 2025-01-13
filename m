Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B46235C11;
	Mon, 13 Jan 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762348; cv=none; b=pxYk7L0YPVJwqS1aP+e26RLpA4EOXYHdZ26qdYU/ZunxNmgGD4a92brwqb4Y63hXkgMSqDTcWALS+vYrWQet9INVJhYmX+ptjl4Nbl+RgVoUlkhCX8g3MIu3sAIJVmBe+L3dwFJzV/WHucuT3KAbU/EfyRPQg5UYxWCWKhcOBkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762348; c=relaxed/simple;
	bh=pefOdtjuBewUlf1x48BRP+8ngRMMxzVKrGCyQOHzgV8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5z9aTaLKvcJX0cDfudBW8R7YWIxMWpRLKFXS4ekmpu2+sHNSesELIp9C+qgzfADMgrI03fSjsUrwIjdjHZmFUClP7Xoy1NyJ8xx8W2ifZOKD01IwDWOGZgAqQkhrd+llWvwenpPKj5oNz/St1QEd+pDIDhu05IeZ9Usr0liegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8mjGkj/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8mjGkj/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2161eb94cceso47901765ad.2;
        Mon, 13 Jan 2025 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736762346; x=1737367146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2XgwgcEm81FTA4UwtwdCcdVayE5rYoFV+/lCyIbct0=;
        b=h8mjGkj/eaJqu0PIvfeLzADCV+NLZmc9YK9LtwkAo+R09wfhRx4i00+2n50HEmTiRQ
         xOGulx93Eb+LlTD3iPVBim0AWRU16lluhTvnepnLmCDCNKvVj740fDQiNuI+bpPuA1qy
         HJQSARuCCBQgbR23aw6H2wglSkqXYjMDlVA5ZEqikqkEuRzJHiHayOCnXAwY/sOe4YGn
         YJ6dyudMgAg4K+cnSOZ05poy04hmRdY0dqNpn1XE1LF+6ymDAyvqEidi04azYl1bHrxo
         1zYdgw8jYWy/kACa2MYJ8SiVVEUwGwMKy6czu34w6Zxonfunwy1XyBk+pWUU5B0uRtX8
         B5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762346; x=1737367146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2XgwgcEm81FTA4UwtwdCcdVayE5rYoFV+/lCyIbct0=;
        b=YLPB8jgZCsn+aRnTSUtxqeWLj1AmJCOOgw3Dg9CXfnbIqdC8TaaRbvhzAKwnlbssmN
         XL23OWwOYmfvpDREvHcyN44gbfvhdusfRgsvRxIzi+cHANVaNMGZVrPD2aamLztoXdTR
         TP7REnaxJrwXSOLYdIpLiiMPOEN9VK5SQIz6qjsewY3ZEDdBNzlHtdA9d2L3zqccegXK
         eAZOATN+at5guGbY2E97McS9aAZyzmCDEtLEjpmbjqv8Jr5yqY+QysE/jW1kaB8dwSIR
         1KgMJuelTovoBZOL2Os8T361rUg2SIARSwWQylpcvxRNrNZPHaTGLpjDaRJM05tJXJb5
         BlQw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+kO4PSQe6lkT5XCBdbCB+8U9bLBMJkmMaWS2XPT4BkxqDbC8jlwnukjaMqNjfj/jPnGZAshWU5w=@vger.kernel.org, AJvYcCXIVNPSSdZqGWD2cxzre2vX7PwXOi4OTjF85d5CKSiPm5glND1fNwyx506E9vHHeiEkNYB6e8DmfQXf8ClP@vger.kernel.org
X-Gm-Message-State: AOJu0YyxijVNStQ6pF8wA9OM0G8XsMnHkaa7AT9y6C7RsWcro3BrsBrc
	DTZnN0TvlLhQvVedo/dYvfdz/0KfzeIL31d22iwByVgY7ChO5ubA
X-Gm-Gg: ASbGncuvwFpqRfF/AEjekG5JQPu6sW/d9ZVdQ5I1CQblWC4sP0gnRfyi1F9J/+DzcCS
	MxiQgID1hbxE6OGWhFssBIbSu2Cwv67mtXhjTI2OMUogzymu/NbVI27kpAnGwUMN1/YrQAwow5i
	nOTbLKxMjZmWeItsUEF5bTfjEKpvpyO979jr5mMe/Aa/e8cGKiYVpK2V2COdOPxDt5xCCMku3mi
	a5xDOZdLvYUVCJnTf3KcDW8Wu1PwZbXmhMaGp9A8g2vyWp7+LEM3/vi
X-Google-Smtp-Source: AGHT+IGMS8vDidegKAQYAYEXKNCSbPMzVmBDdv8sRLdPXpDqW6H634CWN8qDD/2MjceQhHprhPbBpQ==
X-Received: by 2002:a05:6a20:2d22:b0:1e6:8f23:ba70 with SMTP id adf61e73a8af0-1e88d0efac6mr32595168637.41.1736762345352;
        Mon, 13 Jan 2025 01:59:05 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4065c475sm5591774b3a.117.2025.01.13.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:59:04 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id F3EA14208FBF; Mon, 13 Jan 2025 16:59:00 +0700 (WIB)
Date: Mon, 13 Jan 2025 16:59:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nir Lichtman <nir@lichtman.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH v2] Documentation: Fix x86_64 UEFI outdated references to
 elilo
Message-ID: <Z4Tj5NyguaU8xoKV@archie.me>
References: <20250108113522.GA897677@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="he/EB48cMPiCLH+2"
Content-Disposition: inline
In-Reply-To: <20250108113522.GA897677@lichtman.org>


--he/EB48cMPiCLH+2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2025 at 11:35:22AM +0000, Nir Lichtman wrote:
> diff --git a/Documentation/arch/x86/x86_64/uefi.rst b/Documentation/arch/=
x86/x86_64/uefi.rst
> index fbc30c9a071d..3949d83a9915 100644
> --- a/Documentation/arch/x86/x86_64/uefi.rst
> +++ b/Documentation/arch/x86/x86_64/uefi.rst
> @@ -12,14 +12,19 @@ with EFI firmware and specifications are listed below.
> =20
>  1. UEFI specification:  http://www.uefi.org
> =20
> -2. Booting Linux kernel on UEFI x86_64 platform requires bootloader
> -   support. Elilo with x86_64 support can be used.
> +2. Booting Linux kernel on UEFI x86_64 platform can either be
> +   done using the <Documentation/admin-guide/efi-stub.rst> or using a se=
parate bootloader.
> =20
>  3. x86_64 platform with EFI/UEFI firmware.
> =20
>  Mechanics
>  ---------
> =20
> +Refer to <Documentation/admin-guide/efi-stub.rst> to learn how to use th=
e EFI stub.
> +
> +Below are general EFI setup guidelines on the x86_64 platform,
> +regardless of whether you use the EFI stub or a separate bootloader.
> +
>  - Build the kernel with the following configuration::
> =20
>  	CONFIG_FB_EFI=3Dy
> @@ -31,16 +36,27 @@ Mechanics
>  	CONFIG_EFI=3Dy
>  	CONFIG_EFIVAR_FS=3Dy or m		# optional
> =20
> -- Create a VFAT partition on the disk
> -- Copy the following to the VFAT partition:
> +- Create a VFAT partition on the disk with the EFI System flag
> +    You can do this with fdisk with the following commands:
> +
> +        1. g - initialize a GPT partition table
> +        2. n - create a new partition
> +        3. t - change the partition type to "EFI System" (number 1)
> +        4. w - write and save the changes
> +
> +    Afterwards, initialize the VFAT filesystem by running mkfs::
> +
> +        mkfs.fat /dev/<your-partition>
> +
> +- Copy the boot files to the VFAT partition:
> +    If you use the EFI stub method, the kernel acts also as an EFI execu=
table.
> +
> +    You can just copy the bzImage to the EFI/boot/bootx64.efi path on th=
e partition
> +    so that it will automatically get booted, see the <Documentation/adm=
in-guide/efi-stub.rst> page
> +    for additional instructions regarding passage of kernel parameters a=
nd initramfs.
> =20
> -	elilo bootloader with x86_64 support, elilo configuration file,
> -	kernel image built in first step and corresponding
> -	initrd. Instructions on building elilo and its dependencies
> -	can be found in the elilo sourceforge project.
> +    If you use a custom bootloader, refer to the relevant documentation =
for help on this part.
> =20
> -- Boot to EFI shell and invoke elilo choosing the kernel image built
> -  in first step.
>  - If some or all EFI runtime services don't work, you can try following
>    kernel command line parameters to turn off some or all EFI runtime
>    services.

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--he/EB48cMPiCLH+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ4Tj3QAKCRD2uYlJVVFO
o1HrAP9tDeI2qNFydIAOAb4si18nqSsFsifI9Arpm7zadqx5owD/dHwMy2be72ai
U5d+Lz1pHjQxssQPME9WkNjBZwdXCwU=
=RVaT
-----END PGP SIGNATURE-----

--he/EB48cMPiCLH+2--
