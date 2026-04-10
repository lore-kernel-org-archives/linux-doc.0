Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028C3D9DD2
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834370; cv=none; b=efJDckOiR9r/Qxo378hdhq4ds4XqdrM+bu5Tj/+SOzdug8w8kcCx/8U8X2MxGnNrw06VP0Ddok5fyf5WtQXDoY04znFzSVJ4UQRi/PKDoQ4m5s5tZhMX5Z0k6VfF0OEcPgwCJ27jQRNc1FeM/DEm6i9QGaC4EtBMq48yL5mH13U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834370; c=relaxed/simple;
	bh=MwH/WucLijAHaNDytI577A/CNakmrl5slNZKBtFvgsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAibGWcsw4YjlFHsgwhWjx4iLiMTxoULCuI94bnZeg6pmcRI6631Rhf8ZOGqn9DgysQ27xXYxp3V7zI5ruOSlDPeKnBW/THa/okrvVuldLeFMv1KLuI01PBmyeL3C/fRHgn1zzPlQRgmDGXOcxF8X1y9W9OAl8HOTuC4BewWk0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lncuj8yo; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lncuj8yo"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d17b8fbedaso944393eec.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834368; x=1776439168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ObF2b/IFmk4GCUBZOwS78VSlp53MCRHb7XjsIFZ+w=;
        b=Lncuj8yoLuJSO15TPNcLHDWXXUzsPxbBZZ8F1zsD6ClwaW20zlxLYdZLQC7kGqLF9J
         2SCYyFwoAcBEggHMvdWsdxPyGAEn3S8oUidT8oJ7lQSCFADQ9ZhiLSC93epYm8oSySfH
         1M+6r/pDVT9JeEXgnbtQbphyXz7T/DSjPvW6kGMt4zTtpYL3i+Ga1uGKS/znI/QO9Ivf
         PTtgT2PrxzmC6gJeUqACMy+2K4+gPH07zKEmWeOvUHljd0mixlWdNVZtGbCYeJAItMlO
         UpxjLRlnCo4j95hBdA5LWMjwXE54ggQdQUNGMX+yOS1cCVn8jCV2RsE7y3kpr+VyM8YL
         gCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834368; x=1776439168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ObF2b/IFmk4GCUBZOwS78VSlp53MCRHb7XjsIFZ+w=;
        b=k0yHMZwA6Aw0GKSzW/cr5peh86pM4wD7NHCp7Pui+g2i8q3BXTMVA6LUMCap8pWQKy
         ZwN5Ku7w65/ZuhtgzXq1B3hsdNkNv1PTxST1wh7rfr2V4XijVZa9ZP+hwl7N2oZnPd2Z
         SuDodDjT2crEDL2Ppf3PJ69kikx8cK+49XG569zBPVYhRxyPVn5tmk7c2E8U8I+fSTWB
         ezIie1Kq5fK+4t/EGMN8DaIuCmRyXPYrfri+IANRCghfnkAQabf1qYgawc7jRNnrkENc
         EKdsZV8QE/7tNpgM+iAtvFiBl/QoVLwEu0O58PT64XPsRSVR8KJuOqFvxVecfdNuW1b+
         osvw==
X-Forwarded-Encrypted: i=1; AJvYcCVMIX3nGWa5x6NLl+zZlCEQjrJco88EZxTAA+unQmiR7+kUyzEtopxbqrYkqGY2Sny9M5gG8quhHkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu67n5TNB3yJdbnxa5nMEqaUaiLyA0MZusgdk8klc14rKmf1nB
	Wfg8q9Xq2ZWC9XSObV9H8W9PZCMkxOzLpT25a6+D6Ie+YnUsNcFTncnarQ3s6Q==
X-Gm-Gg: AeBDiesEodxjJzAJqMWgqFYMNhXA5O3rE4Do4vEBtokdXQrOPY6hHxIyQtTph0SDQDv
	1RR6eAXqc3ekoCzf92LSCqGpdHDhaTyIvTJW7J4Dmu7gfrDXLFcxdICNKBHafo7WfUc7PO6wnx+
	IV/00Ur9IB36+UukRHbSOQRGR3IWSCFsYM9am+tY9ytaitlV7hY9t3mMltX+fKeCK9G18C8XOlX
	5vnVnTQ4wmtZ2e/YDVKQShMmPRUU/wKd1iMaoCfJrojNJmkkE98eAIKIKkWraVUkl5lSzqp4hKZ
	uxrV1fck1/4hOY2SabGxcvr9Y8JN+XTVfJiKrU0mr4Lsdj2HaQ1yn/LySzfne5QBke7B7gFx/Kj
	UWY39lfrYxkp7/c7IJdvCSGNOjiqZUek4vJJXRXbGqcfC7IfwUSz5vJPWXQcB/oUhXl1CItrx4v
	IqgK959Yy4MZOwsMlSVUxuijbRp8duL0rw0nQQkGugUrgGjbs=
X-Received: by 2002:a05:7300:5713:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-2d4101c572cmr4053457eec.14.1775834367665;
        Fri, 10 Apr 2026 08:19:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db64c4sm4533921eec.27.2026.04.10.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:19:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:19:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: Refactored watchdog old doc
Message-ID: <fe3de980-e918-47ae-862a-969a5b117ae0@roeck-us.net>
References: <132f7e64-4fc6-4274-a04e-e53f0b957665@roeck-us.net>
 <20260410072825.19114-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410072825.19114-1-nueralspacetech@gmail.com>

On Fri, Apr 10, 2026 at 12:58:11PM +0530, Sunny Patel wrote:
> Good Point. So again revisited the watchdog core
> api and list out the deprecated one and marked
> as deprecated in doc and also mentioned it just
> for legacy driver and not for newer one.
> 
> As someof the legacy driver still have reference 
> to old api so just marked as deprecated in doc.
> 
> Also checked with other watchdog related api
> which are deprecated in driver but still present 
> in doc but didn't find any.
> 
> ---

The above would show up as commit message, there is no change log, and
this e-mail was sent as response to v1. And I can see that without even
looking at the patch itself.

That makes me wonder what Documentation/process/submitting-patches.rst
is useful for. No one seems to bother reading it. We might as well
just remove it.

Guenter
