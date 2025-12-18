Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A322F77E
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080245; cv=none; b=g0RPGUGGSWBurFlHf4DgR6BjKGG83vZpBpEHODVt8v2SL/c62uR7fN4mbQeSZsT6iBSjrFsq2NVphFl6w1gIrcQwUHyM/2w6uqC3PFKfOXsVmdIPwHosxnIf0yukUGTIj7fR60PLfv46c+XLd/eVmQSdL6MfzJh3Rx7FvVrjODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080245; c=relaxed/simple;
	bh=aHyjjtFiuLJz+Tk2dbywtBxpbEC6rOqtXlmGXk+Pd24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awzZs1m2U+vknlsQXdF2+OKI0MUBIMNYqxy1YwWJHpVotTXPok+YYccUikySUQZIlXHB7r3wVHCSK0yB7zGgywQs6CmlLAPWoWDVUBgEZoNBFpBQ0e1Ylz7PhnPWoLvfneXCL1Vo/bhu7Tolb3nod2YuT4Jf4A1JRllFe7dwm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvcQStuc; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvcQStuc"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1006968b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766080243; x=1766685043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddQ5E5GMF6Avzka0ZvfzwUtsxi4gaOVkF7bsXtZ9eis=;
        b=fvcQStuccOhdVdPGl4IUeoCS42vQhK8EI6+3vXSAF/J7PsR5t2DjJPlctOQuENVxx+
         LTDrityWmp7H6zycxnniyDadfxbtblwHOre4kRgDZF7s3TDoMdg64OUDye0MmxdbPGmv
         GCMXpG7OJYnDIqNWbReX788RqsIsJNO178s2kyUpy07Bm42DAXNbXsJjFKre5sHQWQ6+
         GZP0sW3DbX76QnHl2oWHou56OGoKYF0aDpXdGpV4DY7fuUHQqCrAglBmmEB8mJJDCkOy
         YWacgaeVfbuBy5kiKOUSYHiXPZBl0sjxVYXTGzyopc+OaboClII3Ep0teXrhC/AOHi5Y
         V9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080243; x=1766685043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddQ5E5GMF6Avzka0ZvfzwUtsxi4gaOVkF7bsXtZ9eis=;
        b=Y1qtXTfT0PfeLxXCt0K6NJ0ep9ZccxJ+BBPHljjKF2syWTYrfFm2/7ARghtJBZFhbo
         r2g+2VI8YlBwp2UQ2fWHS7BFa37XiG/fpwW55tf9dYgxLS52AO+M3RgtSVd8pDYUBCq/
         3UUZlISR8ZOfFv/1pFXILYdB08Tn/yeDu50C2FvoqcZo5FZUL26Ew+XSYxDwqxKFXu6t
         EUo0JevyEV2R2+0KJhnnDZjFcWF0pQJxMYzVhGO1GrBhUre1gaZ77n9XdRHYct5TEDBe
         tcYO2AGecDKB6eJ6l0Qfer23PJAbcs7KjFruzo/nRMYZVo7Emi4ruGwQGKh/reSxTg1J
         hYIw==
X-Forwarded-Encrypted: i=1; AJvYcCUnlj76fRgVXKuzCgWN/RJ7KwVqi4twpSeqD+kjJgj0DzJ7J8ooazjW7ThBCo+I9DkQsrxJFyyn1kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytv/73BdxSrVsYhpYF/hTvXKkVbQrhdIHNefipHNKMytFHksFg
	qonabx3imQM+ooz7RPrgU6AhTcEldY3+c+PC25ObsLF9MbDvevcYA4xy
X-Gm-Gg: AY/fxX5vsw7u0g1mNErxOMCEG6wz5GQBCb4dM0CI417CcvpCs+eNnrNS2lDLbrxDxnO
	EjDIQ8QAidqx+S5II/yLIAkxP02f2kAQAJJRQ54Zw4m0a2JmYNESnjIXdJBNgUGNRu2abX/IgIM
	IO1DzQq+tWl+8RVmwLxbDRIfyj5pZdbpFZ7+FBpRqJX5WyfPzdjfH8hRImmnX41J+N2PW18fkRj
	OttLvCBkLpJFFWTC+GgEz4awv5tkENj/4NkByn28JyCacLeIwNLHcX50QU3/z7hKz6Qp2ICBN63
	7AP3unK89VilmmU0Fc5XaEJPtskYdOvuWc0fx+uwC8n3B6amMVpit1MEhMwWDyljm1litJZ9zQH
	YT10uVbZBbONHb6YUzec7IqUzVnhilWVbh/TIrxNSHkESjSA9WepdLJrve+M7MsUMrsUOhDX2Io
	xuGoS02cjOcH/9O0TOoJhebnaS
X-Google-Smtp-Source: AGHT+IGdqSHdO+D54IUIPzd51Uw0/tPli9hSmW7LLbejRAyhwgD9XQOCvub9597BJ18BANnaYqtQbA==
X-Received: by 2002:a05:7022:a88:b0:11b:7f9a:9f00 with SMTP id a92af1059eb24-121722ac2afmr100974c88.4.1766080243216;
        Thu, 18 Dec 2025 09:50:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fc5534sm10203427c88.9.2025.12.18.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 09:50:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 09:50:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Okan Akyuz <okan.akyuz.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (DS620) Update broken Datasheet URL in driver
 documentation
Message-ID: <de60e982-33da-4f28-9789-4b538f7d532a@roeck-us.net>
References: <20251215204423.80242-1-okan.akyuz.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215204423.80242-1-okan.akyuz.linux@gmail.com>

On Mon, Dec 15, 2025 at 08:44:22PM +0000, Okan Akyuz wrote:
> The URL for the DS620 datasheet has changed. Update it to reflect the
> current location.
> 
> Signed-off-by: Okan Akyuz <okan.akyuz.linux@gmail.com>

Applied.

Thanks,
Guenter
