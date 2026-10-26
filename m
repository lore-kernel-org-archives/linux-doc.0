Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974733;
	b=K/ejXvl2t7W+InY5N+kFw5P5Z3yoJ//0MnVd3ggDiqVGYdCKSO1qbvJy+JSfOt3gOuvz
	 q5vlvmPrvTodQcGw4dYIotBpBWAqtVSry1Ut9WEcyP3A6eQK+nlk1ce3bD0lpBy2NZvp8
	 dHCrAH31ezfG9tL809ydUAJnRGedRgta3GfG5S3FM/lJquu7M/TLM3rxMlHaIM33Jagec
	 eTeECRygo/AxBFv/bGX0mQoM3xWv0iyDDm4MnQIXgJhTJ9EYhklFHBswcRTuPwN0rUdhQ
	 BjrRRrTAvOevNs2lf6A0nrUimQpQgtbumL2LmvFTwBaCIHYrkIGFXsyaFfoN37IAyOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
	b=qxwNu9MGnpTMcYUWER+6sknf7M3pZDPB+t234mF5dsMY/IaSI2J1rqvKOmZZQAirE/O1
	 iL1vMKLEFv4GIaw5c+M1BQ2hmSjXQSyLUb7ykaFiV8LMza9jXR+OQypFSMd0CLbQNBPCG
	 go0rj71GCgfZYMxynuLHzhS5YIVAQLBn1uFt36xgpbuVmbdBeYPF/rqQmgME2AwP6FiRl
	 RGoR19ywmF0lmygejPSE/5v9oU35pEdlV1eCkAumEOEf5XF7OdozRweXKbypokfLYA4D1
	 uXzpd3MJjPJjYTi49ntXxlXE+hjvJK92VmOIsoQUvuzPE7crdHfiRxiDiTf4mVtFXJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6pWqzPj;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972D606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B972D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6pWqzPj
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1356840a91.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974732; x=1793579532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
        b=I6pWqzPjSgZLdxH34xc2dF+rZUuuIatv+YisOPFKEasZOKbUr/+KWvJu5PTfZceiS4
         P8d66oqH8rf5x3VqTv1gRyI+725YMimPt7AnUi3kr0znJFAuIqQEWKbYy/NRkjaHjxCv
         58CnUcXPwIcKrlStfd63Zeaci3ljmfoZmh4LZdhqPidscbUb/KER5RT8TCwDUAEDhe0f
         BbMXF02iL0OMyWo0iiFsC6WFfFJ2GgYUd7Y4Gi2+vlMJh7EHzvFBVvah+U1X3/PzAPLS
         4PIcfgmPbH0bpxVTAgqg3sSihMSlGMqHuVg1Txz/3MZ2q3Dff4/AnaLDtHKvyQBhwmMP
         9UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974732; x=1793579532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
        b=bKQIhj2gN7ndUO+abJYUgypAjyKG4H0020XP6rfQjusoxpPsubs02fSN46vfZ/slo0
         kLT0wJNCaQEdLIgehNzeRMn6noVGl3DgX5PJr8wBeZXShotYMuZ7ZlE+omcIq8ZmTovo
         7BZGkaI1wDv+yR8PdHNDHVda5hrJokiySYVnWrD6U9KfW+npj+rQUhKpDN3GAmIe+JcV
         GMUv1S3E54eiahfWPOL+O3XdtGZ/UUAYVTbJzJrB7/Vv+KUU05C5wBAdlbFZh9QLq9Xa
         EdjzMgCuGujLEawpij///0NrHn0hGj6Wy96c8xsAAgFeulL/1rm0ayi9fyiznvc4+8Wt
         Xr8w==
X-Forwarded-Encrypted: i=1; AKwUvBx+RfcKOZxy3xFvbGr+98LAx7YP35Iwg8HJQ66ecgS4U80vZLu4BT1Ph/l2fCpKBhfNf/dwZvQOpn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAFROJAMIMmDcGnqE6DJcVhX9ULvHhu361nB2PHIpeoDsJhxqo
	3a6j+X6/x/7asMofrYidDYZiOue/N8sZe76YMhhdriGWIaCBIq+wdbVP
X-Gm-Gg: AYBFou3rhPhCbuEB4E2pvtRVcyaSbwa+CGL9XHrKT6PB7VefKp8/b+qUgDyhuQYPxka
	oAwjIyDSq1lhwI/XFSnhE6cmWC3UCLDDs/cMyDgn30xRJvuZiIvuS9mngzFnSZl5Z/9ViR30H9W
	qbEHBYlgjtxEFF1y8kgZaL10YuDM7RbT+j89/pcu23t2toGYJljy1mnQvJo1Bx/aSe/rKLVehIU
	xvaNGfOvicjPVroV8xJDsFU86WMsV8gU0Qrqtjd2ByFSpxc1UDjs5DjYmt8lSMt6ngWXHe0HbIi
	E7/YoE4ldCUGlUMHRLzxaVyBv5UdpdG6wF1GANc41fpVHy028xKxbGCvWOpeHMcTwllL0HT5YeG
	tqngobNVB4iL29zIE+8WCUtA+YXr9TnDuL5JXTyR98J5HbShWLirUR6OfFpo3QzzKH6rinb2eea
	l0kEKMfS2XLK+ByF8qwhqHJHm7N4CbxBPcv/SjfbxyzJ/TipFD3uBECLrMzo4iOCk3vTGZOYsJD
	6v7eUzfaDLbdVFJ7ZVke9ieWc/GAQINmli5ckEciHvHLzU0dlWt0a/ulRl3sJ3F9D0gmE4=
X-Received: by 2002:a17:90b:2745:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3adeafd682bmr4403381a91.50.1792974732064;
        Sun, 25 Oct 2026 17:32:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4618312a91.2.2026.10.25.17.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:32:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:32:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add MAXIMUS IX EXTREME
Message-ID: <bd8640cb-cc7c-4e52-afe6-635c0dce0ab6@roeck-us.net>
References: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>

On Thu, Oct 15, 2026 at 06:09:31PM +0200, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> Add support for the ROG MAXIMUS IX EXTREME (Intel Z270). The board
> uses the same EC layout as the PRIME Z270-A for the chipset and
> T_Sensor temperatures, and additionally exposes the VRM temperature
> at the same register as the 300-series boards (bank 0, 0x3e), so add
> that sensor to the Intel 200-series family.
> 
> The hardware access mutex is \_SB_.PCI0.LPCB.SIO1.MUT0, as on the
> PRIME Z270-A (verified in the board's DSDT).
> 
> Readings were checked against HWiNFO 8.54 on the same machine
> (Chipset 47 C, T_Sensor 25 C, VRM 32 C).
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

> ---
> The board's EC also exposes more sensors that HWiNFO reads, but they
> need access patterns the driver does not have yet:
>  - three extension card fans (EXT_FAN1-3): write 0x0a/0x0b/0x0c to
>    bank 0 register 0x43 (selector), then read 0x57:0x58 (BE RPM);
>  - EXT_Sensor1-3 temperatures at bank 0, 0x60-0x62;
>  - Water_In/Out and Water_In2/Out2 on a second EC (firmware ID
>    "RGE2-Z270-0109") at I/O ports 0x68/0x6c, bank 1, registers
>    0x0d/0x0b/0x13/0x11 (same offsets as Water_In/Out on AMD boards).
> 
> I have a working out-of-tree driver for these and can prepare follow-up
> patches if this approach would be acceptable.

I am curions - any reason to assume that it would _not_ be acceptable ?

Thanks,
Guenter
