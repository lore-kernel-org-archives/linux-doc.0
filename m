Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC621C9FD
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 11:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766920118; cv=none; b=CkKEEysqFt+/ZtfsQXpVSMI3hnHpOu1DKyxvqd9qjNUEmdigPP1yKflOtxyGjdDHtur9wsqqaL6jFd4MaHy96eKReW0k5Q5AA0cfqAa8XcwhBztzpL0PPOJfby5aJUxn9jd7x5ztFx7WXj0sIaCVxXvTHYN2KU4GYs5hBsngE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766920118; c=relaxed/simple;
	bh=cCQoEbKZDZp33qWLvX+R0p2njry76uwFo/l/d3KlSYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5exBIFQQF7ycXsPSn6vgpSPjB2fcaz86LZ4JkU2dLNdABDF5ufGe3mgau8JfR5D5FqjYw+V97ZIO9i3+m7iPXvGxYK+/YthMCZ+iL98oavOrnAOjlSPA0D7jxKGoFJEQYdetKN7q4bTIwLRB8fO504XBkVkVwCMMVL9LJe1oMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICWJ71YC; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICWJ71YC"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbc544b09so6466831f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766920115; x=1767524915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iS67A7Cp6V5lbhV6Bn0t65WNn8jnTNgCmtEe8liMl8c=;
        b=ICWJ71YCOAO1LYjS9TZzyusBwKJ2OYU9ZkcYD11Z66X00CdVvzc3I148eB0xZHB90P
         neqDVoscRN6hkCMvKVgjsXaFuB/yenpTnYrWUbPV6EKAdCqR55SJxGRAe6QEaj1wA7f0
         rsGnpM2ESVJZ2+OvypB1YHJP7oTJnKus+NG4Ql0AnM1avxaUPIUKoJW8wEtVyKGU6xk8
         mhzXNHw+0B/A5k8ngBVnJRiNtKrwmzLdDKNlpaIDMz0GWp1HU/zBF05M69sFvU9v5cr8
         hEWZe4cLxfvuyUwa57mrmTVV+wTeAOsyDZ8BCsAtBX45DjKPbHvAnIH2r6le/wtbJ0Ab
         0PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766920115; x=1767524915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS67A7Cp6V5lbhV6Bn0t65WNn8jnTNgCmtEe8liMl8c=;
        b=efX22bGus5Fl4uxSkC9olh6XxkOuB13IdYJvOYDFEW50BA3ClE7ZVqbTdmb+mNfmC5
         2a2AgB9HU+tutW72WslwvWcteDCPMX2iBGfuGSEtx3UTNgHU216nqThRypEIORHGWWb5
         r1b8k6+Lkljq8BVcrxN/Xiy8GBQCtDXLSMlWCoP7b54YK+SbfZDRq3uQ5mgHQ8LXdz2A
         S4vjcdYNZzqNHTj19yVN3yXUgRCtM0IuNGN3fPphM2HKBUuPDoseBIhxafQaSDWoQ5ny
         AYXxzOuE1wRQZRSgHeYBgrDCr9f6TRlR6LJC6aRujDLSg9rCN03QeRKeSMCbPmFjzrDF
         8aUg==
X-Forwarded-Encrypted: i=1; AJvYcCWXiD9fJhfY5SK6pqjfTemGAaXXUfFV+wa5M+tb8C15l1OlXdN3AJdqeuQt9iiNNhoAOX/+TDc0pws=@vger.kernel.org
X-Gm-Message-State: AOJu0YznoXxIN21zYyaL/1cn2FClHIiEtsS95vzb/2GOhg1B4JjaFInW
	I7m8aV8SfvGQyQLZVWbtkMODV/R2nFYJ4Cu3boztYkAbDDfUnZoK4YTtYogFq5zNu58=
X-Gm-Gg: AY/fxX7uwHnNbYV1avsjNFN28jCoIcHMgYTu50pWh8V4p+GGfwkFpR41iLKkwgF4pS9
	6N8e/DsJY0VSADFhHiqc3qPPjOw8ae5KwDJBBe4Nv5N4r6LnzT2w5FNCNsSMRxaoMssZBrTAagj
	OqHWk9dwq5Y1A1fqQRxPPba3AbRFM0pUYI6bhMHRT1WEBtcLug0riUqJxvjcPUDKB1tWwUbwFCR
	0KWKpZIDcuPqu9Uk1wUM/l1jsRUXRR/2ANAns6h+3qmYBQhL18ZwgPDUob4T3vGK6zUnNe2GRnp
	cKGPfTZ29VhTvFa2E0SqqNaHNEX+FMeLqJmFRreKVAXCiQd4Gt3J3WNiz38iuJ6AU/gKeFRHUBe
	yKJ3zLsgqStI1+DWP90+ceAbfGLUKlGetPBKLsT6yR00ss25WDeWZ16WhK2i9RDbvawdqnediub
	X4iuJ4N2+KI4M=
X-Google-Smtp-Source: AGHT+IFAcWvnuk72nyqLYFm+8mmOQRraM80a0h3u8p+M7GNwhLiD0iYqbsghrz5iKsELi7rOPWbPOw==
X-Received: by 2002:a05:6000:610:b0:431:3a5:d9b2 with SMTP id ffacd0b85a97d-4324e4fd961mr39179406f8f.39.1766920115131;
        Sun, 28 Dec 2025 03:08:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm56594647f8f.42.2025.12.28.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 03:08:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 79020423BCD3; Sun, 28 Dec 2025 18:08:28 +0700 (WIB)
Date: Sun, 28 Dec 2025 18:08:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: PCI: Fix typos in msi-howto.rst
Message-ID: <aVEPqn7votUNbrXL@archie.me>
References: <1766713528-173281-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FjI6l/WwqEYPyDvt"
Content-Disposition: inline
In-Reply-To: <1766713528-173281-1-git-send-email-shawn.lin@rock-chips.com>


--FjI6l/WwqEYPyDvt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 09:45:28AM +0800, Shawn Lin wrote:
> diff --git a/Documentation/PCI/msi-howto.rst b/Documentation/PCI/msi-howt=
o.rst
> index 0692c9a..667ebe2 100644
> --- a/Documentation/PCI/msi-howto.rst
> +++ b/Documentation/PCI/msi-howto.rst
> @@ -98,7 +98,7 @@ function::
> =20
>  which allocates up to max_vecs interrupt vectors for a PCI device.  It
>  returns the number of vectors allocated or a negative error.  If the dev=
ice
> -has a requirements for a minimum number of vectors the driver can pass a
> +has a requirement for a minimum number of vectors the driver can pass a
>  min_vecs argument set to this limit, and the PCI core will return -ENOSPC
>  if it can't meet the minimum number of vectors.
> =20
> @@ -127,7 +127,7 @@ not be able to allocate as many vectors for MSI as it=
 could for MSI-X.  On
>  some platforms, MSI interrupts must all be targeted at the same set of C=
PUs
>  whereas MSI-X interrupts can all be targeted at different CPUs.
> =20
> -If a device supports neither MSI-X or MSI it will fall back to a single
> +If a device supports neither MSI-X nor MSI it will fall back to a single
>  legacy IRQ vector.
> =20
>  The typical usage of MSI or MSI-X interrupts is to allocate as many vect=
ors
> @@ -203,7 +203,7 @@ How to tell whether MSI/MSI-X is enabled on a device
>  ----------------------------------------------------
> =20
>  Using 'lspci -v' (as root) may show some devices with "MSI", "Message
> -Signalled Interrupts" or "MSI-X" capabilities.  Each of these capabiliti=
es
> +Signaled Interrupts" or "MSI-X" capabilities.  Each of these capabilities
>  has an 'Enable' flag which is followed with either "+" (enabled)
>  or "-" (disabled).
> =20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--FjI6l/WwqEYPyDvt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVEPpAAKCRD2uYlJVVFO
o8lxAPwOS2gp+wMNFQsULo4GT2mhXQu2EEUIBZQ7xt1v6f2uhwEA32tjq4P8Umk9
Bbnv9R0cS3jGwDpxhm+zF3mOlMPvcAU=
=DW07
-----END PGP SIGNATURE-----

--FjI6l/WwqEYPyDvt--
