Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B432824F
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403072; cv=none; b=HSLprN29prAQCaAC2gvJHU1Ekd9e9+ytYK9uJudpomgwvrXU6uvCvKUR0ja5JULfBidZNTjzt5qpNmohs7ALvym8By+2qtgKkrOjY/c4Dx4wm7A26sFG+M8cIdvrLygNjxuezw97OVVKcq11X88GDqG4EmaoSpBDyfGFhBIhl64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403072; c=relaxed/simple;
	bh=d/HC52CeU5NBJ76yAQ2cLC78OiXrMD3IoC7o+lo4+Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tys3oPm1ZZZuHHiCuCUUfwrDm2xDZYALKXMjOze7S3XWewYMDGviFIQPLnxOj55U61zfPC1TQeyouO8zkhucUZhHdD3TE9MhPMtsVcl3XpThkdQiBjc5CZP3FezWmsUbrfx+1IHes6jjOZ9A+Ht6OVvLtWDfvDeYduUOC2b2BO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+OWNnW9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+OWNnW9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso2005385e9.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 13:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765403069; x=1766007869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wal2enxY4moWZCAf4g26lvQIKnCzny5AtoBmuUAlL6E=;
        b=E+OWNnW9E+Me9H+MkPgMwZaZyEJHWzxjGDNsXwyBp6/w5w40ncu08qqlSDZHZSpsWs
         PMVk3sCaLwH7o3kgfUAJ5clSHKkjC4hZg1OL5ejVU3u8GRKng7l/8W0Dbdc2aHjXPxa2
         oijug8WrHMhnuRXR9sUgW7CQC+Tx+qpZlM0ABUaz5XPnK0FJ/Ch06oq9LCLLuD7KUo0Z
         nd5EB8FLoaZ4ljElsfT29GQF6G35ITW0bzZI0sdArq5ur5VHZTzYRaOp5+nt+qhCJrL5
         CdRcEOWQLhG01IEev9XKvNppN7ntwwpyZCGqSar5OE0xu9v8EtFcyMu2magGCBKjGFa3
         epDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765403069; x=1766007869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wal2enxY4moWZCAf4g26lvQIKnCzny5AtoBmuUAlL6E=;
        b=pyXhNNdqnC5qdrG7bmnFiEMuJ+x2Jz+dBgwshit/AONy6AOD8fhgwPh6s57yXrmqQd
         +dWvqE4jdnvg1gSIgPjtPy3b3iZOJRzTUeOIyv/agOsQDl49i8dYFWgFfscs47x+Vhfg
         tRd9B1jxMReklI/9oHWIZxBAX4C1hNvrQ4u4Y4V/liDZ4wO5cLYMtu7xvYdEqzbQW7Pm
         bwkiJQll1Zs5YoEd+WRwy0kC+mlUe/vDHLFG19DGg5qtNNV0XY5QJuqqdg247oSs4MJc
         5TDWzDl+VLf/9sVpdQlqNkXkBF6H0ZzwYDRl3IjAehCwZAZ7cqBLcekecbMGIKlUwTGt
         VFuw==
X-Forwarded-Encrypted: i=1; AJvYcCWZS7SI0h+QjaQqqwKKfxLrPQSLAj8nIHlyLtpU4hWO3mW71CemK6NuO1IMton7T+hCY2NM89kLQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytWM6fmP6yga/kUgOArlgoXlts2VL9HSFedO2KIm7sDxw2TODz
	9WfM0LJwIPG8dyLkc/3iJlFVQJbfQCzdF4X5LKihgFWkl0t75lteash5DIcgG9s2
X-Gm-Gg: AY/fxX5ESp7VQhlZ4GkWTnxciCbgqzIR6CZIjIFYDpzbQmV1uzpw8n+ie2Qhei+2BOA
	bYAVbUTm0/UUg0nZzYfXEC+gFqPByOG5aU0jWNnHeQ4gSlJr4MfdOCjdz9cmSzg3NMrdGYMD/aC
	DIng1jGItmvDCoyOy9ecGGP83eCXHxT3HUpKXfdUKqnVx1GL6BZoSt8Ekp7ogQ2NO2TEULZk8Xg
	QQQIDgR5BeLCn0LbttsmZ2q/3Ldgs1UfamvYFN3yEAZSirTZUnbGbyTb3Hqr5SgnsK4k3hWMcA4
	QVALIQjLbnscuEeQ/bZI78AExA+aY/+Nzvb2azg7mOk/LJq9snGNmeX1ah/7jX41Zrm5t8JklCq
	OxSf2nIsPB0QaiDEygizbmloUc3R8x6IXSnEghSrCymF4UremEMH6h1M1zKeQPA09ReU3WNIyUD
	l5Yehhox2zREH2zAcZG57JPFpHK2zbi/SgT4TKcZxurH1sv61rjPmGDA==
X-Google-Smtp-Source: AGHT+IGKOyUSuHZubxgOrr5LFCQa+eHSu9NDBphfSYSTLin7Raqk84h/gD6t9Iw24mD+KXt1In9blg==
X-Received: by 2002:a05:6000:400d:b0:42f:9f18:8f40 with SMTP id ffacd0b85a97d-42fa3b17789mr4674090f8f.42.1765403069044;
        Wed, 10 Dec 2025 13:44:29 -0800 (PST)
Received: from antoni-VivoBook-ASUSLaptop-X512FAY-K512FA ([37.163.92.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70973sm1338592f8f.18.2025.12.10.13.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 13:44:28 -0800 (PST)
Date: Wed, 10 Dec 2025 22:44:13 +0100
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) add support for SHT85
Message-ID: <20251210214413.pyzke7etf7xfjf5t@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
References: <20251209175848.5739-1-apokusinski01@gmail.com>
 <2683b84f-d7d1-4445-b5d3-bed393de34a0@roeck-us.net>
 <d11e3cf6-3095-46df-a4f2-442d209675b1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11e3cf6-3095-46df-a4f2-442d209675b1@roeck-us.net>


Hello Guenter,
Thanks for the quick review

On Tue, Dec 09, 2025 at 07:09:55PM -0800, Guenter Roeck wrote:
> On 12/9/25 13:19, Guenter Roeck wrote:
> > On 12/9/25 09:58, Antoni Pokusinski wrote:
> > > SHT85 is a temperature and humidity sensor with an interface very
> > > similar to SHT3x. However, it does not feature alerts (and therefore
> > > limits).
> > > 
> > 
> > The datasheet does suggest that the chip supports both temperature and
> > humidity tracking alert status, which only makes sense if the chip
> > supports alert limits. It does not support an alert _pin_, but that
> > doesn't mean that it does not support limits. I'll want to see definite
> > confirmation that the chip does not support the limit commands.
> > 
> 
> Looking closer into the SHT85 datasheet, the sensor chip is actually a SHT35.
> Given that, disabling limit attributes and alarms is neither necessary
> nor acceptable. It isn't even necessary to add "sht85" to the device ID
> table; sht3x works just fine. I don't mind if it is added, but it does
> not need a new chip ID (at least until/unless interrupt support is added
> to the driver).
> 
> Thanks,
> Guenter
> 
I've just tested the SHT85 sensor with the non-modified sht3x driver and
the limits and alerts work fine indeed. I was a bit confused by the SHT85
datasheet which does not explicitly mention the limit commands, that's
why I excluded them in the patch, sorry for the confusion.

I guess I could simply add {"sht85", sht3x} entry to the i2c_device_id[],
this would also indicate clearly that sht85 is supported by this driver.

Kind regards,
Antoni

