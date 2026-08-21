Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6074C0404
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322211; cv=none; b=oRzKmnoJh5aQgzoXdiRWaJmWZekMiItt1s9usIFDGAr3XHrxNS+o5jmVJmw6fFJaUOqFVFp8UUmB/sURXDK6xyoYy3RMkBhpXpGxnpNNQDoUkEDH6ZliTqt/JEWJFhjNGMAcCjlWOs013ZcDRSQavZNCRlLYoNLMF1BqfVGSlv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322211; c=relaxed/simple;
	bh=iJ5zjD2EWw2yDJ5z4MSpVjmW6V+stFF2dP8kSOQKY70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJY2wqXdOGyN0y0rNr8JcjMW3NzN/B5Rph9WBbFOHON8DYvRpffx+15vcCBrFGuVJlgYx9rjhrNtmjIVvigYbO6vb5iZ6CMQjUxCCFNaOPb3OrGn6DsP+pDSrpW3+d55oNKxFHPAvldIQ8CuwGe8Tv+CUZDqY8eok6p+Og6rAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yier4Xh9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yier4Xh9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceab75934dso14703305ad.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322207; x=1787927007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QEFJejdXEP132PW639xF3lV8S0Gso+8wMOBeJk4UlZM=;
        b=Yier4Xh9iCsVEqGjmTOw6EdbngSngoMSzx7lKN8F37EN659bLub3ys3S91kbPbPOiX
         Yu2g97TOmN4I9inCUBHfwYtrPJqcKFp0O8qUNg+TA62unGw9VJHUKWqZPqRdnjfbfslF
         qDSIMOBiMaWuXCSf2RIwHuBIZwmEc5Oi3RrJm+fM6yZWo/nzTjnOyuX7a5qpkxyLwx1C
         qLbtHtvsBdMkgc5kJhU7g+l+SCaMcM5wkXgX1vFhWC75NP9m8ht5oZXobfktWUfric65
         ohmKUXGBVEJ68gn0ajCYm3x1SKFs7af4juAPH+pcCcnJEtxOVmYyOVccWBqhAqhGeBD8
         0mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322207; x=1787927007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEFJejdXEP132PW639xF3lV8S0Gso+8wMOBeJk4UlZM=;
        b=BiD/qOguek3x5/CTHha56j8cfTk0HFhFlMuMCUv+giKmrzGeIxYonPxW8nBjHa/7wO
         BsZlrIgopT3QueZRyd2HU06b+AF5+9lYQ3vqdcJqZnf6zookDCAkoHCCEyOpxHGXn4TD
         psMduWDTy1+Wuz4utj1NubrHim8Hl2VeZv+pBwIkhCGvGtiDxTjd5ypbgkpR95jRaM+f
         wsnJOqCUXkcWCibvIi9xqbuAlZu6oFxPSaLUCP21/FBWO1WDOcRuW4kzNa3ezOUvBuhC
         nOotgaIkxZ6DBAb5RA8UJduuD6YfZo/PlCqk95mcQpRv48mwRHse5VksPVuLRBD3Tzv0
         VRBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro14MdFp2gM58Rez52GzsGUYvHJF1W/e6d0KHkdE1FG4UBugTYpzZaG1/KfY2aTdMmXlzSRKoahssU=@vger.kernel.org
X-Gm-Message-State: AFuF++lm6TOTdc4T2FEF+d2KSBPc2dKIjYP8evP+nR8/SU/TBjrlVWBQ
	w6lS2tqljsZa0fz2GcGjiAZXLnjGqPcPe5BTSkN6W8UHpRqaixwdhvva
X-Gm-Gg: AR+sD11xfwR0+HAF8w7CDJUJhuLfql3v2nkoSuSAw0rdnwRh+IPgEW91krY7V5nRxr3
	4br703WoDFDReGWyWNm4PLKXteSqYPzlVVaoKqHge0jpFHMWdaLhu1hBZ9SmsvQxrVbbAHGb4QZ
	J8YDTxuvDtZ7lYPRY27nzU726rzpbe6vV8ZaQ8hkSnWMtRelxmNQD9xEbXkd0bx6f0gqHZyA36A
	2KLPg9qj2+g3OOj/VATD7lyAnmemCN+KCvfUg5K/X1TKYe0gT8+L2JBEB9nxmREu7LouqPfQTvg
	SXcn3952FS54jzn0WkeVMpAJ44zUwFufFIGs58pzTKdJWiPh1XQP0z2RpfsJtNe+S2QEyotiwkl
	7vcpwCluHM+bCoA1fASS2b3nArsLg5CGGZhNeAM8+gewLMq9cFYCeJwYvQ0Tr6kP2eRWz57hVjO
	wYAOPLjyg2shqcz+JY668hFvjhxkMnaSzWAE+wNmOgb9L0UH+U34wDfn3PiEx+8He9HxD/rPhUA
	A==
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr12901407a91.14.1787322207392;
        Fri, 21 Aug 2026 07:23:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm25714380c88.15.2026.08.21.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:23:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 07:23:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (sht4x): Add support for Sensirion STS4x
 temperature sensors
Message-ID: <e081c728-92e5-493b-ac28-9473eade7e82@roeck-us.net>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-3-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821091924.18975-3-alessandro.zini@siemens.com>

On Fri, Aug 21, 2026 at 11:19:24AM +0200, Alessandro Zini wrote:
> The Sensirion STS4x series is the temperature-only variant of the
> SHT4x family. It shares the same I2C command set, conversion formulas,
> CRC checksum, and timing with the SHT4x, but only returns temperature
> data (3 bytes: 2 data bytes + 1 CRC byte).
> 
> Add support for the STS4x series by dynamically adjusting the read
> response length, suppressing humidity channel attributes when probed
> as STS4x, and omitting heater sysfs attributes.
> 
> Link: https://sensirion.com/resource/datasheet/sts4x
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Applied. I'll send patches fixing the pre-existing issues reported by
Sashiko later today.

Thanks,
Guenter
