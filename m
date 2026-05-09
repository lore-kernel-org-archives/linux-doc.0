Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9292580D7
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341223; cv=none; b=fM9LQiUSUr2nZykSQZAbsgEv7sAKNTWQsVqVtJrDIhyK3GgUaJm1ymfV21C8mhzEGuqE16ZQ8//yROhg57qwNtj4apfYtbfBcCbhVNUtjVqgmqqDAEgI/P0sk9AufNBbLmZ1EgIZARv2meYwRZoy9H90tlSCvy3S2Xu5EHw6jwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341223; c=relaxed/simple;
	bh=90ABeSQWds/sn2w99N2BJPg8+8uGqH/ToAzyW/wK/8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yf0qOxenNZN/cyliYCIC14HmZZx8mBjsZym3rlupw7CdR+Tx5TL/qzhwO3fVzVzClu2QxP0pVHqmFDkNziEl/gFC6xpbynAPfAeCrs2qIzQHjS76Epc6RinDFEgQQYmkCmgKsR0lmG6qEqWrjqh/od5xdlboc/mvIpa+LrOhpqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK4LbZuT; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK4LbZuT"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-132d1b2519eso6670c88.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341221; x=1778946021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIunFsTg35qiBdjtt8jGYanfPNrLdcpPoJiWvKofhfQ=;
        b=RK4LbZuTX8yjgCbR71Wkmypz/DH4oSMxN7dmayOVLp928o5DxIAlrOmuDqv/eLEb7x
         dqbFpxzcRa4Q1jeZ7uXqqgPyGbtWWKH+ZQ27IiUtRnVf4DKiH6kfYzEjW50oplKoB1AY
         bBzMrUWuiog0YdrYJ+YuGJ+svSyNzkczqjkLVDm2S8GV8QIV662rnc0WQKPQX55fkrDH
         g0yMSyQn5YhGMnZPVD0+6Yd9LVpsD8dFHCloOMBFRzflGNrmJbAqdW0b5uD5mduMNI/H
         T4MLuxUlAAia9wciifDp3VAtqrVmMbeo0YNPVKdOYSsmbcUvFb4kYQZcZ6bNazhJnciQ
         72Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341221; x=1778946021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wIunFsTg35qiBdjtt8jGYanfPNrLdcpPoJiWvKofhfQ=;
        b=j9RGwbr8uZT4rzfnqfp4g81VWjbKb1LzmC5t6ENViLN1O2tHdZcPrzd/591nHmnxka
         fI2t8h8EvZNRv7yWRNRxm1JeOEmQJYi2oq3HzxHfjVK8lFloHvsORuT6xx2q4haptuu4
         v9NsYtmjEq8ON55ZwjfihNFC2VEyxCQYFlqEP8mBlvotKiqjCPWfgfhTFFuwOjZUNek2
         EBG9Ut7i5n4qFhbeAqrIfaGK++4ECVDFhA4663uOGcjuKGbu4hWgho/qg9EkHkx0az+8
         ugvYJM1zmkJgydu5ZNrl3f3lCNL6BFXPrMrDKv5VlK/qLBX1B6VRt8QTk7xg/azyeE+6
         D31w==
X-Forwarded-Encrypted: i=1; AFNElJ84VNQ+R49kSCeyOpcgBmXSmSSiw4ijuytuwzIcjmCLjZNUvhNdv6tReuPUhCbQB7R4NluTnwWZkYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlSUndNzTbEbv30wXhdWhm0KPVBwDKCjS8Iw4OL5oPUt7QC1/
	M/K0vlaHXn3rYkNnWI0lifr7YOWNxZ37lEnpxUHAei3MMDFpM+Qpv23r
X-Gm-Gg: Acq92OHWRlBGjuHU9ebjIiwkfGqfRWoB7qPZyBruBn7rUCoeQfJgyhR4sPL+U5lVb/x
	VpKxn9ceCBXHVs97NWLssVgaOdhtFjS1LE9y5dYLDHK2S3mWoY4OxX0ruLe/mPu+4Q+V8lr0t0Z
	fPcMCtz7pqB7zkPiqkAQ1CXIoxG10MnOPB4uLGlGRiWp2utf9bJNXcWBsV2DSfxRX35y/nZ6H3N
	BKpuBOpOlYBZJ7yd5eYfZOHHbm6lP5BFb3t1L6NkVdfkMtBcU8lX6iVrjUu1OuU+1Uq6OTVEW9T
	sPtWeBJzmhOD1VSO/PQptFAwMZ0VmtA5//CyNKb4/3SitvEtB5Ye6fMV398TrgrrnO2nULuxKMw
	EtKj2Qr2E6y0DsTZyCkKfa4Lnw3D4Kc4m+Dov4c2ffr5rj6KAda7myCXQnL3IyjW8bC03Nz//wC
	5mIw3YAZfVVxdbWaEV5jcs6vS5Lp3PGsK+cy8UteO+7ZXVvjw=
X-Received: by 2002:a05:7022:e1e:b0:12d:de3f:d849 with SMTP id a92af1059eb24-1319cf5bd08mr10389339c88.44.1778341220922;
        Sat, 09 May 2026 08:40:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278758e0csm7279364c88.12.2026.05.09.08.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:40:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:40:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 2/3] Documentation/hwmon: add Delta E50SN12051
 documentation
Message-ID: <2c1cf69f-2732-4ce5-8626-09dd380227e8@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-2-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-2-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:29PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Document the hardware monitoring support for the Delta E50SN12051
> device.
> 
> The documentation describes the supported sensors exposed via the
> hwmon subsystem, including voltage, current, and temperature measurements.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter
