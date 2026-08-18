Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB1383C86
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096233; cv=none; b=hlkdI3R4NbjLAkcmk0xOPvPKYtSC8r28mjIO5Zzzbz7G4G+wMz7yiv17uCJv18kDe0OTimKO17vqSnWvWfQcJxDuKVbX0SuNmvs5Y5FppbDCe/Pj26dU6SYpXFLAZUtPnOfBQf2qtOUrLISkwfD2EgJCH4RDdSuUvlOEFXnDyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096233; c=relaxed/simple;
	bh=zO5mT6oWpqELdaeWSbBSQLyWiB2W8y/nhFWMCKOQKHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYjCfSbl1vMFFoaI0JvaoUBAUdi46gTaKR0a7mwWzSLiUGZJDvuznibtxf8811S35b8GiRoZVV4HL10orxxaP2BsJckg0OaF/IfivunYglqZl9n28Vu3QkyP3hCzJpMYxx1uIpB4CxZfJZYDoaSn1K7DmCGrEcU27udjkSAV6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcM2pwmc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcM2pwmc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e7109321dso327155a91.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096232; x=1787701032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=spsLyqllbdv8uoHDIT8SHj6pVVShs8FwTfZLnA7RIu8=;
        b=TcM2pwmcrxOn/kVAafraZhHLAiM3wJR9QthSqMhHTB5xikRxzJYkIeHCGlr93aZ/om
         bqunCi/QtUnkxJDGkS9vCGCZdrjiOTrY12XW1T+fi9zwbnQ7Sm58uT/JOkl8Nfi7ok/I
         e5iAsm3YJrPoZtYk1cAwpEkg1zGvcR9w5Q9pbZDD5TbqG6iiYvVh0lArqi/AFGrvIZNF
         zEeoO9XCDkUWy6ZWIDPsn4XS6RHRXE2ZZbuE5JOoZwHM/l/fRNYyuJjHl/z8qpgshaLp
         yZ4MLN0cmwcUMg/TmQZb9bjIA2gg8V3rcEpK40GWRBTSPDUjuBaCEQor747KleMfy+d/
         zPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096232; x=1787701032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spsLyqllbdv8uoHDIT8SHj6pVVShs8FwTfZLnA7RIu8=;
        b=Hmlh+EdzjZ8wi84NE99skkdxrhh5hX0lxnR7vdR+i5ZKj4CsebAJvJxUtEKeAOnJFy
         HFg1NPcoXZTjrpX1UEmznMPMKJzXYIxdhGOfThfIyT3E7LmuFu9aPc+jgg7dqybwSugC
         Umr4YfIFyqyUMLNli7S+HmMFgOuHsgCVK4vp24cdeo+VhVclCF7Iaml8yM7XKBmF4Sms
         5/i/31dyKiUW2sn+zmF92VQ5KxgY2HYNs3voU2bhDDsfREqV3nvqCTwuAGPAFQbH2toy
         fZslGtY/wUhYmFOCQR3cmj+egloeysQERWdHbMNKf+qYIoJFWvliZqNsdHuHE/CvY489
         R6zw==
X-Forwarded-Encrypted: i=1; AHgh+RrcrlHmpmVEcMiz33Q2Fmzkj68bDiBzMo41ewjfrwIfCRh0kp4lYS2m412FcbdFvjoaXyOvB+cUIq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaBrnWnT3tcHXdYibh/21ExHPzbBYp3hjZ2+oOH1MjBIXCDKB
	mwzT7O9CQOsfpf4FmJUI/Q4iuF9Sy0KE4dxOofNPHVgdDYYfBFF9vfkw
X-Gm-Gg: AR+sD10wNSTYqw2kE32x2Fep7TVz1SZ9U6B+yIrNR9N+52xZiWaLdd7n1+kUN8nqtz4
	UexymNonh0WP1qtUU3f82f55X12YOYx51fJTM6v8IHotnj6p39JP/wexKzjb5sdv+BIG+xkUdKP
	DwubfV8ACxfH12MOQWq7pY1vKFU7RYVTMCbRrOo62iCuYgid2ZuYbluGHS14kAa5GGDXM4EEsVo
	PF2YSkLyc1xJUG0hkpU8Sr5tJ8CMr1b2eWM9VHo+S0YXh9MekIMA6QJ27WoQm31FbwXZu0AnxnR
	hK4/uuzJz2mIyLXA7txOWfFJM0RLjlf6D0xNvu4TT7+MRjQOsNF7fEgMB0dTt2YLQEzOQIAwA/G
	ef56g5bVBV+s44FIew8qfTHH/t1fh61u3gi2QX35s9NPFs1pTpwjKrr4itshZsz6lOaTQbQ/iNn
	AT+63ltZ/H8SjJpG70bv8ZnFnl1cXVGolqPFZ+v7wy3X2Bix7/PUJvmgbQFwXNnCfM8PST9Jmdw
	3RMBJjpUajD
X-Received: by 2002:a17:90b:4ac5:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3958125aff5mr697147a91.4.1787096231751;
        Tue, 18 Aug 2026 16:37:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77bfcsm541284eec.9.2026.08.18.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:37:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:37:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
Message-ID: <01704145-51aa-4d4b-81ec-990bc0da31bd@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-2-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:43PM +0300, Stoyan Bogdanov wrote:
> Rework existing implementation to allow adding support for new
> devices to the existing driver. chip_id is used to identify the
> current device and differentiate logic where needed.
> 
> Changes include:
>  - Add an enum listing supported chips
>  - Add a structure to hold per-device m, b, R coefficients
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Queued for 7.4.

Thanks,
Guenter
