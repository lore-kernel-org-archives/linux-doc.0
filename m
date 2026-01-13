Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370472627
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 00:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262483; cv=none; b=e3t56a+hO7aYsJq7ck6XDcbYpNiWPrzmRSo34HhP/pAHLtXbZKUswXX6SvDHlrNsv9c6R91IXVMZ8vWNfzu0uZZKHvL/48Q8SX5RlV1h2nJJJo8IqXOP6XLMoW17Y9rR3SgiamkNB0kSVftR338EfQyk/yIo3vw1+JcoUdSRGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262483; c=relaxed/simple;
	bh=ljubIT2IkWwAV5PEltj2zpXHUvbHQeZCEk9idJaQXVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YN19q0glQ0B+sH3LyN0d7d61VaELJMSTf5uxFqGGT+St7NW95Pq8yLrPcNIi5jmC9YQVkjHHm4n/C1BkhaeaajoJ0fAp3/1cWCEVE3/pN2nLkifbeMTeg+ImR0UZf1bpgCCTSlJUSGDku53X9+vnxh/zoVzbeSQYTJ0pJXLmrrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl5hRC7P; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl5hRC7P"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2ae287a8444so2719521eec.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262480; x=1768867280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbMElHy7hB/VQu8Z2iOab/fhBVVxmnUGu6DCKdYqD2g=;
        b=Pl5hRC7PVQaoGMqkpguSrtu8RQkhwpetgfu3sp5ooc1Qvp/PQPwYSfGcgea93NfYpa
         wsmA21ikKEJOGcr7mGPmKh782nYXSALNFsJyHsY/QX7JQ/fNo14GBZ7Wa4W9BxkUFzIf
         CBQYjUJYYWWUyUxcWwUissAX2MWTOo8MDNQW8jkQJEtArTkq20PqzYopaxgITMQQ796I
         uYS5Ta2W6zVCcEi/lMDNNVsd+DowobzxWVOs2vfd2nWcKyzSlFzplMbWd1n7uQR9JUvZ
         Laholw9x5/Gl/DKkZ14MgrioEzxw9ttbaoKtg0e8D9HDtPFNT2nFkBKu5cv6M4CEyehg
         J3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262481; x=1768867281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YbMElHy7hB/VQu8Z2iOab/fhBVVxmnUGu6DCKdYqD2g=;
        b=IqEmmkI/TDV3BhyS6v7ZkFF0V8oBlfVD71ooGJj20/x71gfXpnAWf3AF8KBLUzMYhV
         Be0H0Bmhro6kjQ5DXl8ZTe5Hi6vgLAdtBN7nWpyoJNSLFhGH33M8qTVoIhsbgCdwnGvI
         q1iEhqiOaMtbyeWBTB8elRRQaGTlGYwm4y8Hj3ocDx7Rxrsn2Bz0uKhWNfTHhIhANaPw
         dmOUW44nh8p4u51glw58cVImqDYiqr6UriC1/iBTJHZBa1Z077X5i3gex1iJuAa9OCcp
         fI3zes5UC816Z/gk9S2KqYTnzIQBUPxwjsrYJ/ZeFWs6/9jP9/ZNgQzUiCqOLdIcOefX
         3tQA==
X-Forwarded-Encrypted: i=1; AJvYcCUHxaFkJejZts/Blng3BZCn45U83vW3x4WgJsevxPiPa+E4Oca+036Mz8XM8Qg30K/MLam3WKX/has=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5D9w/pyEKeZBX8xdsQVMpWLpnoQ9/BAUfi6J1UV8CWjGfruV9
	ZhmZhncRnS6s3WC9DRY6sZIbOH4WyiYyJFT5T/WYQkUUIRgOtZhdCHRS
X-Gm-Gg: AY/fxX6kL1EJZuj/ZgiruSmzUJOWGK7PehS4r4gc3g3ynqt5bu/IuCiFhzyypwnFiMS
	2OCQxLeQyMRhn0bjxbr7cuJ8pKRMNU2O1Y2iMyuo5ptpmuSPd1u+0uA4duuMDKIhauMOHArSxQG
	SYY97lOCgiqOkqo5o+eAVpgxRvg402U7N1CLlrhWguoG8DbcIP29iVhHUd94UqrQCJ/r74+Z4YL
	/FBdVZib3239qeHqGRXYOaJV5LXEl/XzwILbZksNKNKgGcLiDEFm04PTRPaely9/kVOODb6kYlM
	fbIaKc+CH1O6PQuLigs+aPTBqiiVys4rRNq7dqG+zgmBhS1sxYVNou2nJvo8PoPjuBHv0kDO3+i
	b4aosjwy2rNq68rOFe5bGPe0fL89lIY0pkIh7AAWl5ELRnEIhG7iOCzgnZGDS05KNGhYAoBaYKI
	os+Sn2/2UHQMgF80Wqo22FbKK4
X-Google-Smtp-Source: AGHT+IEktrbnpg5k/hQ/FM7X4gvEV6eHIctAQ/ELVaDdLGEhx2/yHf8MZ+Ac7V4M7GShQRqDtBHM6Q==
X-Received: by 2002:a05:7300:b58a:b0:2a6:9fb5:f78c with SMTP id 5a478bee46e88-2b44f313ed9mr1202384eec.4.1768262480330;
        Mon, 12 Jan 2026 16:01:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm17154773eec.6.2026.01.12.16.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:01:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:01:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: hwmon: coretemp: Update supported
 CPUs and TjMax values
Message-ID: <afac8d11-c70e-4479-9e04-2d502251ff15@roeck-us.net>
References: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
 <20260106155426.547872-2-laveeshb@laveeshbansal.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106155426.547872-2-laveeshb@laveeshbansal.com>

On Tue, Jan 06, 2026 at 03:54:25PM +0000, Laveesh Bansal wrote:
> Update the coretemp documentation to reflect current driver capabilities:
> 
> - Extend the supported CPU model list to include Atom processors from
>   Bonnell through Jasper Lake, maintaining the original format with
>   model numbers and adding X86_FEATURE_DTHERM as the actual detection
>   mechanism. Added models: 0x37 (Bay Trail), 0x4a (Merrifield),
>   0x4c (Cherry Trail), 0x5a (Moorefield), 0x5c (Apollo Lake),
>   0x7a (Gemini Lake), 0x96 (Elkhart Lake), 0x9c (Jasper Lake)
> 
> - Update the description to note that per-package temperature sensing
>   is available on Sandy Bridge and all newer processors
> 
> - Clarify that TjMax is read from MSR_IA32_TEMPERATURE_TARGET on modern
>   CPUs (Nehalem and newer)
> 
> - Add TjMax values for newer Atom processor families to Appendix A:
>   - 22nm Silvermont/Bay Trail: E38xx at 110C, Z37xx at 90C
>   - 22nm Silvermont/Moorefield: Z35xx at 90C
>   - 14nm Airmont/Cherry Trail: Z8xxx at 90C
>   - 14nm Goldmont/Apollo Lake: 105C
>   - 14nm Goldmont Plus/Gemini Lake: 105C
>   - 10nm Tremont/Elkhart Lake: 105C
>   - 10nm Tremont/Jasper Lake: 105C
> 
> TjMax values obtained from Intel ARK and official datasheets:
> - E3845: https://www.intel.com/content/www/us/en/products/sku/78475/intel-atom-processor-e3845-2m-cache-1-91-ghz/specifications.html
> - Z3600/Z3700: https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf
> 
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>

Applied.

Thanks,
Guenter
