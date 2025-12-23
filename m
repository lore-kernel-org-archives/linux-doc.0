Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260072D0C7E
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766459370; cv=none; b=mzjmjgeYsYsYeuxrBSqiT+aw3XitOD9OqpcgJchx6jmiHS92STnqvUdm9eYXkaU029B4PQ+zEeIH/7gVLaDCrMcqGZdfIVM+gkOlTosWXS1KfzijjYfCAtTFw2sD0m4CISmiCLoEYT3Y/6Wy8W8pC1ON307/EFo+GzjnnLNIGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766459370; c=relaxed/simple;
	bh=z25X9RJAJcXbGtqIqD5CkXNEq9zX0WGe0qUFOZB7mfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzFIFChkPgd3SrrxnbpjU7dkmcemVyoyE3m4uHNNhUyfRmUbE8LCrM0iSqj5Dvbvg+hefw5j6QFySDpHMptV7ToJL0Hwy4wraWM5oFL+sbdU/Q/A/J9LSfgOIj833w1Z0Va8+rMhMiwT96215AWIGJ14kNT3y/A+swepQIQUVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpI6Q3pn; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpI6Q3pn"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-78ab039ddb4so43789677b3.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 19:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766459368; x=1767064168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z25X9RJAJcXbGtqIqD5CkXNEq9zX0WGe0qUFOZB7mfs=;
        b=KpI6Q3pncToGQoyFhPBBkzSkRblsEtwWPaMKILI+vhkzUrGuZ2X/yrQPaZiPqx9KhZ
         hrSLNx/E6xpoGgGw8ju4YJ8haTKX5euAmUjoMTbjCkh7WlMtblKXD8Ebsb7eApxQvBjD
         oXxLEVsRg2OIYXa7T1e6d3Kgni/4LxNijInaiQ+//aMeGsit9b1CLCy6UElgutOX7Usq
         wzSsIGKtcSme0p12i9wtA0qU0aSCJPTm7+/4UWslrl5zOV3PqVRHMmT49wllefa+VH3s
         LDRCemRoAgmCpPFhTNTP8i6ZOdto5EIuMRMx3nG67AsR4R7XHg/nmYRmnw/vgQc3yFpv
         n7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766459368; x=1767064168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z25X9RJAJcXbGtqIqD5CkXNEq9zX0WGe0qUFOZB7mfs=;
        b=px2QomQK8aRqP6uyupVTC8+g5PRQF4E3ml2J07BZoF4RMLUNvlelmlz15K3B+HbUFD
         ck/s0BoDomd/4WA7UPfA7wCH2LFg2IBo8Sw9KfkcOdSnTquMDbe0DtasmPP1Pz68q9CE
         YjblvOr9UPiRlaPP46xNC9D//56/lyniOOwbfgYYQNAQYJA89cUee2dI4lSzlovhw522
         qKatfYNttBSGzpp4vXGfLWysId4xn2t4dQQDnpK75I7u/LSYT5RcYTWgxNmdmCi05OrM
         8LW4Du4Pz+uODoiFmE5qj4hWkCPcVdevjJarMhi1Kntl3yKZP/L4+KIAcwcYZ7etcAR2
         8TGA==
X-Gm-Message-State: AOJu0YyrimsP+XLStADpYizg2B2b2ibJ6cailF2Zyn3zCjKi6CGuWdoR
	eo3TU8qF2LC3GyiA6CBX+QQViMOM1cS6gE1Y6Azi9+WAmdEVxyJG875U
X-Gm-Gg: AY/fxX7p9r9NHStJ/678G47N7bLYlew+hX1va2X4pVLisUFo9xKnkLOmR34LMq0hMgB
	npusUrr0XKYMSPm/kRwEx+xUhFeNJZF5nKFOgifnA4kBHeklBAdfdsZIzcvMnnK46TOVg2V4M2f
	9he9wtPI9m5maKu6Ulyq9Yu9xk+J0gUfm54kTA3aU7r3LECNa5VL7B4wccZ2Q5jzH2M2zy79JBO
	iU21fdZ2YRyhGUEaaAYOM2yNIP4fvnap9RNQ4IqLhrkdnC4P82Um3MyadSBCU19aVHHjKEsxejh
	+IMFFOnE0bnSCHWeE8o1/jON+qS5k8a92VysZJ+yWKAcnVza7MuAxTrTiTHQ8BKJKZwS0XHQUiV
	/LrLhl6HNeT/v37N/wJyQsRN1Hm/VFzOZOIiIcZqWJLj6RwQEmw+DcHDVzzawIdg3ny9cviisoF
	ZkEz2jegNNY8k=
X-Google-Smtp-Source: AGHT+IHUIUNlXPNJRTAngOEC8ma0w9tcXlKNR/2WPNbxbqc4s+u8xvSoFCu9SCTeGCec7VsCe/0nFg==
X-Received: by 2002:a05:690c:4483:b0:78f:b044:edbb with SMTP id 00721157ae682-78fb3f28c9cmr113429327b3.22.1766459368064;
        Mon, 22 Dec 2025 19:09:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4377c99sm50053177b3.3.2025.12.22.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:09:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4DCD9420B572; Tue, 23 Dec 2025 10:09:23 +0700 (WIB)
Date: Tue, 23 Dec 2025 10:09:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kernel-hacking: Remove :c:func:
 annotations
Message-ID: <aUoH4_rcdNr_YV7h@archie.me>
References: <20251222232506.2615-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRrZtquQWCYHAFwT"
Content-Disposition: inline
In-Reply-To: <20251222232506.2615-2-thorsten.blum@linux.dev>


--nRrZtquQWCYHAFwT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 12:25:04AM +0100, Thorsten Blum wrote:
> Remove the useless :c:func: annotations.

The patch LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--nRrZtquQWCYHAFwT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUoH3gAKCRD2uYlJVVFO
o2GZAP9pgNX4TxrJ1Yu0ylpBfyZv2C/IOXQjG27AF4jfyZFcyAEA/WdgXG7wts0k
IbSThRZVRryQnnneRbtIN23s68dLBAo=
=GgDP
-----END PGP SIGNATURE-----

--nRrZtquQWCYHAFwT--
