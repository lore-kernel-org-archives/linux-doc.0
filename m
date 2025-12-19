Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF91363C4B
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163003; cv=none; b=d1RucXpl5zQ8kFJSN2q/hzpSiyRN36NzYeD4ZzIqtf8EHFuWC0EHPCCf7sTxbWeP01XOLiYEHdpMsxwEvcZiBOCBHbbpkZhq4OOvYt861PnDktkuiA8GuvMYuwugzhWJ/5SYiy4WgpqGzSL6B++coGv7w0gVwj0qrYyYlG7vHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163003; c=relaxed/simple;
	bh=ru9IJQE9+ww/dM/p7QsMOU8/dAarNmlOzOiHd02gp1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAH0rPf+XZjQY/5pneHwfY5Qz4IP1nUI/lZsugO1dzS4NiE5GlKYjYoExpsChIedbK/snztcCNxE7Bo4W7bolXk/CLQFqCLjkBiFre9iy9sMPIMa3olE3cVOfqWquSiaaeakW0PL2D0M3OAl+WYUpM3zo2WJG+EUypuA9hH8zlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nriwUDaa; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nriwUDaa"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ae24015dc0so2823112eec.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766163000; x=1766767800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abKin0XLy7cbeuJKUPVafCEbiJ8dnNbPxx208D/l2TI=;
        b=nriwUDaaQz9b6Qj/H/K5fDRGGMCX3Zh6NWk5nnqf81qFMPei9tO5tA9bggJ4V2YVKt
         VhFYykZc/Iv1mEYnUW0x6XopgaaA2FkY2cpK0/EvcJl8iEVsyav1EceJ8ROBUKOGW9+b
         3ak5b6EIiz0lQJhjYB3wO0NlOOO1JSgM4CXIpMfaca4XNcC+tfEJU5XNG6N3WzSt3ZRX
         IQH1BDh5Ih759Xwhf+zTxI+fMkFE8sKPvzkYNoEY50d5x3LtQI+gDNaUHYYFCxma+9IU
         2P6F02HojeLp7KKLAPOLTL6JIXn6dPC+ILmS/e3DCnqhsRK4VMvgjGLVjr7M8Y8dyKcm
         Z3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766163000; x=1766767800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abKin0XLy7cbeuJKUPVafCEbiJ8dnNbPxx208D/l2TI=;
        b=LstXLHDNuN5d+jhGyq9gV4LfXLYDRpKs76E1S4a03YWs7Oxzt32fdqdP7ZC+e4Nh1H
         DBXyS7hYKjjNXMMdR/FmEidpBMsk2exc/pPdIcxjzKmjklUzN0gCFgbEHQ8Q2du4vSrP
         c/UvcFWA7cWMsFHkICXWrKs0bBjkxZJDLoWb2C4K0I8YA+ERJMuBlu3kd0vtCCZTbrCC
         oe0XAr7tXdjFUI/g1T4NkbLBkvDIoeAEl3SbDFtddpDILC4Xcw3cqT1qrup/3BvS4o0d
         g+T5o2IyCe/y5zR4+Tm4QqHrIU50+UIzavZFO+HVpAU18mhMNXMYeRRtKTY/V1NMN17B
         V9xw==
X-Forwarded-Encrypted: i=1; AJvYcCUjOiJoyI1Q1GqbDppLerKlcpLO7rFBlM7E+c24GI0AFv9nxG2zZcN0Bjlfid1TEiPbjgbnxrDazZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGGNYqK3wYj2pfQ5YYLZBEpIDrk1nldE54tBkfCwh9ye3xuiP
	A9WqY81QE9L8yks9inzpIKwkox5PajTvuMzYcafbsdMuTL5r3Z16Ak6F
X-Gm-Gg: AY/fxX4W3N2BocE+m//L9tav0oAOykuFLaXSBxnGcaiJgxhkn+xldO564c1YykEJVCb
	hxinL5eWjZA7ld+WTAUzgMP2ateg2p5uLveT/fcL/rb5r2ESgWyE86xHo3ZRCd7vl9IPCjNOdVV
	W/vKyu1/bPRDqpZimGydrnagRCyPKFSZD5BxEnbb1Rr2w7Upa61qeDNJ3cJgcJXeDppOjNwOjKy
	kCqSFz+TS0W1TQf7VmT43T1wYnbWt1w8HPGHIV+hZYHsPk9MGnia/cV6zvFE8YUl+u1awIr5uQf
	ZsbIYSOHHG8UEizzICsu+MujggB3/bJl3jlun8qFFuG9kFwiQfz5GwgdJC6stK/FIEFWU84HqKH
	2vHMGF3rET8KkATczpf98fvNsm9OojCYa3wDQ7I4DYVKwpmakr9ouamJdojeqkmbDvhqXCDSS3L
	k6UKg815515zhuF1QfY9JM9RWN
X-Google-Smtp-Source: AGHT+IHnkxb1HJgurtut7Ez1hF4iCE8k7yTVxjrhryrJzgeEvqIZ5Ob6FGIW0tLLqiXi6EpbmNEJQQ==
X-Received: by 2002:a05:7301:719e:b0:2af:f2c2:3bdb with SMTP id 5a478bee46e88-2b04cafa74cmr5767856eec.2.1766163000133;
        Fri, 19 Dec 2025 08:50:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm6729545eec.4.2025.12.19.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:49:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:49:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add mps mp5926 driver bindings
Message-ID: <dc0f3e63-89a8-4f66-a6d7-d51043bd11d3@roeck-us.net>
References: <20251219055413.1661-1-Yuxi.Wang@monolithicpower.com>
 <20251219055413.1661-2-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219055413.1661-2-Yuxi.Wang@monolithicpower.com>

On Fri, Dec 19, 2025 at 01:54:12PM +0800, Yuxi Wang wrote:
> Add a device tree bindings for mp5926 device.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Applied.

Thnaks,
Guenter
