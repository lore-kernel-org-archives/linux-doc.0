Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D15481241
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651023; cv=none; b=fxK/cEfr/B67+XlkwehwCBk/NH50nymz1nd7p1Adb76yKfISnZS4/3BhPJgGkM1wblE0C9T8gwgw1fczqr3BO2EUloLxsm355lzihZcowglzYPZAabDzpF69z3eQFBvloutx/7fSVZoIKSFgBuyYRg8zetPsyFxIadAMYK+YZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651023; c=relaxed/simple;
	bh=nSrppG0HhIb928FytLkYzWOHCjzEbhWcYm4ddDusj5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxphaQ7vfBwKO3bD/yZ2sY9Cv5PjVMI3jgjZ+ujrBezh555kVWnyu7tyc4x1LuxJyR141lXrSoHQGdd/bzpcG6gmq08lGfE5tt08FtVL2szferWHfMJ6QJdObRwz6DyQrqD8ZWKmX+dZDGmxxUphTH9AyeEPi3dYEHO17lCgL9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLEN1u0b; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLEN1u0b"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1448606eec.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 16:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781651017; x=1782255817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctDH/lOWFWawjFNw8mIGTDxbZtFXpqbsfI2AQd9+/O4=;
        b=jLEN1u0bIdcw1PfV8TAThCFfLSRrAF/ILQX1AgLUSiQS0HnzDHI1x1lIhSGaHo0IdO
         kVhXw3XpJjqSKOxP7i7eo7WliMtzdALwe5shWufFlegKjX06CJREXkUcwCCddNoXT9s4
         0NvGVcghn5Ky+i33iTq29HOpvr9M6r1E2YJ3wHqdI3x/Ro2ThRbRSAcm1WIa1PBbfFA5
         giwBEXceHv1lnTWpLq10B6a3/EGY1uvkmmemoQm9RFkHUahanA1Wcx63HqBDoM+GQgfd
         ieB97XRFKU6l+qOftJub/KoOWD5VulrmWSJsnIFXdxj33rs4MZexrhahJr9dqUvVI0sU
         +wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651017; x=1782255817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctDH/lOWFWawjFNw8mIGTDxbZtFXpqbsfI2AQd9+/O4=;
        b=JgGI7PKdOAHXDSzC6Jdh+FBjYiyhEXrcYpDWFtBxPm3gn0+pFA7EBVjH5TAWJ8grqQ
         19v/TOWSa5sCH4i+x5VKhVsNSOwLw2zI6AxCPVz137bUoP6E9RRekMp4zkJZ87VMnL7c
         DUeXmmJt78zQcmPkw6VSXIRxGTHjYC4Pb78vz0PaLNc2sAMPwbZlwnkvbVm2x+I9v0lB
         THszvNY/B3C2SNytqs45FEcb2HFkLLDd18sOgtre2rX8PR4bQ8Qm11TwbevY498JPLug
         AdIpvEtg13W/eeFJTY7IL6SWKkviXcrOfESBJavpRjZaH+YAN4B4X1PLgFxEskoE+fb7
         nlXg==
X-Forwarded-Encrypted: i=1; AFNElJ8WbZ7TVuv9fHeNOM/ykswTI4e6VO4wzV7pdsE4e/XOusOya/yFHAMfeqBfDVmDNwAcYC88gMc5CWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxzFigR5WDBFijNQkBiSFPBIToWpfzDfckHeStsU5fjqGXx97
	SlesnYHDYDZqUc9aKmkqqdhQWj7BjME0nu8o/rVLod/urmpfTutR+1dr
X-Gm-Gg: AfdE7cmaWzhsjhqeSB44R33nY4mpyvwHraoiHJfrSEz4W/ehAyRKQcU1sdz5TjJYaoH
	DfykDvTAzQZXTfdHs663B6JDR54JLRCJJ7jCB8a9Ocw0RFIFel0I6rooIgupk6xD3Dnsivwv51g
	VscQFXJyze0U1Z2t0Gwxu26j1hZB9eu16LrXFNabnPVNvppRdRZBBjy71pChWQEgWiitOLcuHhX
	u5y3M9Bph3HTCu3pEe0kCXM5UqgOAQmetR0/lVMbxPgYXex3VUEi8gKTXV0RCGdpwUrCEQp+xDH
	aG0A2mAiAjEXEejQWLfT78WUIF1xXT8ocbH46SO0/SfN/6bij3a8o1tgF7FtQjCVtyDzJPqx5LQ
	sNQw86qWTckOsdu4EycJkEgLudbCoKYnn2H8EPwjGueSOWQKJYmDUC1vBPC7b9gP4kQ64fZX/gs
	4bpD8rw4ym7mgpustP9U7wBewQhGlwz+HiAig0
X-Received: by 2002:a05:7301:1298:b0:30b:ab02:9e52 with SMTP id 5a478bee46e88-30bca0f5296mr697286eec.30.1781651016780;
        Tue, 16 Jun 2026 16:03:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2754105eec.22.2026.06.16.16.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 16:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ximing Zhang <xzhangjr@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: coretemp: Fix documentation wording
Message-ID: <c8a53a27-7da7-4524-a77f-a6be6323ea59@roeck-us.net>
References: <20260616121549.29484-1-xzhangjr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616121549.29484-1-xzhangjr@gmail.com>

On Tue, Jun 16, 2026 at 04:15:49PM +0400, Ximing Zhang wrote:
> Fix two minor wording issues in the coretemp documentation.
> 
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
> ---

Applied to hwmon-next.

Thanks,
Guenter
