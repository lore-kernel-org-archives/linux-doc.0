Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349F39BFF4
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532938; cv=none; b=gmhyWZcuhJs178aI0G4NyxAF7CZn+wud5hAM+0JrDls4em+6qoUadsdRjMdLoobiBHUsCrBtfxZEVXcWdC3/kmPSIb/fLMaRaKA7iaSrfIQpDAN8Li+g2/e3/JGRTCnx6qnHfQ0t8gie1dUzZ4af9myRGgV7M49WnGxbBc2i7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532938; c=relaxed/simple;
	bh=Pok9W6X3Zc/MuL7+b8uED/KhTYRgDOun4KGjxb/HTcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWzcAFJT6ulTIwyn/t7J1/UNCKb6FKHt/HiX8mWFi7GliRqVeexGi0TCjO2P7DqQfrQVv/wJcLASFaKuHLGpBMYTmEoAGqpbohHIsGnTmvBmw2wRjhhW6bj+rAUTBCEiU5qPr5xZm7PEdr7ZNs0RAL7QfA4RvHjeISQAKxEyfBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M30uKbCd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M30uKbCd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso2824955e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777532935; x=1778137735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWpH92KUAcbsepvSBP+mLdcVlQgYvqjOnjU2XOM+oHE=;
        b=M30uKbCdS9HFi+NL1nb6RZcT5Xa/PaT2Fod3yECGK7r++ZC9WchKtLTfYpSHFV/9Fr
         KtySMF85mLl60NCKUDbKjGxnkkz2wSHMNaiFv/itFSdupAYQOthnFQsfiqFuDB9OWsiy
         /AR6smokP1h1bLUMnmoLppENyI4LGp21IL+M203VEc822iumRi5tXaNKgaehwKmf1aIB
         O7acBtExA43lW+I+iLDGZ3lYanCrvNv/+Z7N9MWd5Qp7oi4fRJ99RPbajXaySSXI4LBf
         v+e3DOPzN+2jUt9Uer5jRlkrxgl8rVdLBRhNLViQueKZMWby8rBrS3tZQogtONd3hgrx
         9/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777532935; x=1778137735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWpH92KUAcbsepvSBP+mLdcVlQgYvqjOnjU2XOM+oHE=;
        b=CUnLsZ5XvL2z7oLY6b89EDJ17QF+iHb7t3tz6qj0LwRzlYazJQwbBtBdAoIEe4hhxL
         athhS7/0Dqh9q6K6gymVtsJaLzSjZQnf3xaoQXUXu0sQCzxCpnXe8hOIyeFegepE8dZ/
         M6XcanM2XWzMds0Blxmk8FlnUpYCyIVVwY8ktdcrGajtJPuavDmircrWX8ZQMAsXlC5K
         Xqm8jSQoieK6sgvJMYbF1gBsWiFiF9JUZ+2uaGhuuf8r/nG4I449Gc5FKmzqlg3l3Rm/
         5W+FG+4Kugl0rqjKPQW16nQTA8vaHaQL8vPkmPGRMp17PqAoodU0FZ7Ni717WkT0HiXK
         wyYg==
X-Forwarded-Encrypted: i=1; AFNElJ/+I1UQce/WTFeNGGXC3HivJGsg0X5yagbvH/g3yCsa1TwZooXyRcukFzgAvi691eTjbquYfAGe9qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzERF/aD3DFRK/Oaqad4QC7UOiMHs2Nb/SARgRjK6Bcf18+oRQF
	DqtZXeH3LQvXujS88vNXVB8HkMu6dCoM6Ne99qMMDWvw7Mup4G8V0O2I
X-Gm-Gg: AeBDietOPC+44MzSnVFlRG0hwbu1ZCwGWuXB6QBCBIKMFs063Q1YNw8IsfvEQqC0OeN
	3KyQU+D9mCN5LkcImNmz9pxTmxRgV8a2VSR0fZCvrdf1osKghIRANB+qc86+bLoY4IMdsQQMPhz
	5T2aoW56rJ6IOKSj9m2Ok3PS7lScnrXle2CIghIjypYoyeVNhGfRrM9owrFWoouxldisohx6ezv
	Cyt9wAQDILPF/I4mlun7MHg9PrScXQGp7HPGX9LqRwCo5OmfP700dfdYWOnmQLzSIO/JvlJnuTN
	FuScKc3XJHsIgQF/MohsV2mARTTg31HPomUntQDbfMxMKgEd9YfpG9bFeNnoT7VEEHThvob30pa
	ElmUUI+SclgaLpF2NfxRLzhx/Sk0TAY2UfMrfIQeTQSXSNPYHsT2CwbpZroepx9AaFMkGc+zW0n
	pZxw42agFeSVQmPeEuuQh0sfStm63oAg==
X-Received: by 2002:a05:600c:8904:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48a8451d001mr20389305e9.14.1777532934948;
        Thu, 30 Apr 2026 00:08:54 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm73693235e9.2.2026.04.30.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:08:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 727344207D3E; Thu, 30 Apr 2026 14:08:48 +0700 (WIB)
Date: Thu, 30 Apr 2026 14:08:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Aaron Tomlin <atomlin@atomlin.com>, corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: tglx@kernel.org, akpm@linux-foundation.org, bp@alien8.de,
	rdunlap@infradead.org, dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	paulmck@kernel.org, lirongqing@baidu.com, bhelgaas@google.com,
	bigeasy@linutronix.de, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: kernel-parameters: document scope of
 irqaffinity= parameter
Message-ID: <afMAAL4lB72HiSQI@archie.me>
References: <20260421150911.42404-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I19gIvng0L6t/iXm"
Content-Disposition: inline
In-Reply-To: <20260421150911.42404-1-atomlin@atomlin.com>


--I19gIvng0L6t/iXm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 11:09:11AM -0400, Aaron Tomlin wrote:
> -  This can be verified via the debugfs interface
> -  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
> +  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
> +  enabled, this can be verified via the debugfs interface (e.g.,
> +  /sys/kernel/debug/irq/irqs/48). The dstate field will include
>    IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
> +  A managed IRQ will also include IRQD_AFFINITY_MANAGED. For example:

Use double-colon syntax (i.e. ``For example::``) for literal code block
below.

> +
> +    # cat /sys/kernel/debug/irq/irqs/87

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--I19gIvng0L6t/iXm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCafL/+wAKCRD2uYlJVVFO
owHHAP46KxHIJQY3/vsgQ7V0xoEqEyuRCeGzVKuwpfg6BYKK0AD7B2aBA4OrNcw8
1EqYxsMXr22YaS28LlxuYryiaMP68Aw=
=84UZ
-----END PGP SIGNATURE-----

--I19gIvng0L6t/iXm--
