Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E03128D4
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729427; cv=none; b=mQQn9cxdbJ7By42k7bzyOoq0sKXrBuEho7M9CYqxjAklqq3JgNCPFurGklDqPQU6CzGLok7038p1/Lx1TwdKT0ty8X9nkqTmhIy5LMMcsRJ2yDB9XaJCDFMsXFbTA8iwlz14885Ro6+TB4ThIJ7pQOSM6oiYUwB2ci1csURL488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729427; c=relaxed/simple;
	bh=W0TpT8Re8zEvNdcOFlrSerjKhi4ru5BnujJu72RiUyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r65xWjgxZW/boiBa+iaR7gV+HmV14X5d0uGqB1McJuA952U+1X3rmDcCOPqPUZdFGBjO+zIqbcc9QlVRGQiF+MHA8B0HQBfT6GO0UQy5K+bASi/hUqEZ3LchmYnSrQMSk2aJm8Q9MKWs3Zy6Xw/n2pBcNEjTVEm77p/UaS3xQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7B9H7dw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7B9H7dw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f198bd8eeso3407824b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729425; x=1759334225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0NQpLAHxIcZklHB5SuD326usfKg/QXFllwVnvOnGGs=;
        b=D7B9H7dwLYDywWYpVnoKzixWI5VJvO2UIpjcFHu8Hpv1rGSx5+TmTXWHls+DtCxnsG
         Fmw4CwVQB4gEGuQaoFyvFv2Mq0OSW3OvteCafq8mYPS8y3PupOt+wBUyEtxmQ6Zaj0rE
         EqT0HzoXmcM4pweoG/IEJ3uVP8AjvtbleXGbi4orHsOwwKH50Qzw2xk/qJer/qajeYQi
         ULmhH2hkyoVS/DEYUKwtD++j6swIpUn/ZpK4Nw/wPdBerBxjs1Ul4EQf73zFVRMS9Vdg
         j2UDWm6IIArXQjs+IEPM+s9SkiGZd903DU+4sAvtqhQjg2Q44rumCl6Md6jA3MZXLRPr
         kQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729425; x=1759334225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0NQpLAHxIcZklHB5SuD326usfKg/QXFllwVnvOnGGs=;
        b=uKZ09K3NwmL9HBvmn8MQXKXNMa5bMiO9Yo99735s7OvFahRtIX5nVvUo+OnTDdCV+z
         q12obznPUGSFnZMsekVxIAEGuMjMDjjB76DndRKhe8XQBsbhiNK0nmbisQpX581Bi8Pc
         2qdQJU1HZ4NVhvkAh8MxpBSiabN5awX/DeG69VgwhiIAugQyUBbWlVI09CJRRkX3Pu2g
         afm+mN5cG+dBjTm8XuLLfoA+KOs5Dc83S4cNXa6l2YKdrAgGYnxln75OPYqDGUwm7cJN
         BtDb4GfsxxzkhZZ6/q1DyN/LKtn+wu/ZPqFwBSi3YniLazeDxulBvbpVlzkdnUdcsAVb
         o64w==
X-Forwarded-Encrypted: i=1; AJvYcCWeEvj1t2lBuUetQReOJlnpZLd1bOgTNxabi8fyFh1djwJ0J9eZ85jL0f6bT9WApcd6KPpsZXrG35g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOvXtYqXXUplMVAiAfMuraW1FtJmkv1enkTl2rw3Hgz1dJFHb
	yF+DlHCcSSM+Vo3cajbLCVNVV6G6ZfKvW+lOqlU5rjCRE7wDjYe+3fvz52RgcsXb
X-Gm-Gg: ASbGncu1BmryEwOfb2VPoDK+1X+2kBVM45fmZ4VASRwWwqxAgebH9bneg6l0q0KbATE
	8nYzLG0k1MyV5GIrSU2bh+ZdB5wS55YH5pfaljce4N7gnLkEU5tiZVmg5ge3r2XeiDTw8fNxaS3
	zYzoxvwViVHKElFCjl7V9d4xX8KnbLCjbUCAh9tXhIccz66gGt0aRT3s05inhZF3n6nZCbQ1Vme
	J8DsjrrBH/K5lW/XznYxGG7Y739h1urBejPrNEPC2OyVf4lgdTRcnuoC3pKcM0w/iqpZfKIDepz
	kRcqstdustmE/QJEDFbOmmig9ZrVpWGKppX/Go40WhfFbPNMsEHGDqVFyrAX836yyBaANauVd9x
	6SvTbrBUSzT1cNtB9QBI4X8DcCWm++3N4Vks=
X-Google-Smtp-Source: AGHT+IH2mynAyO0z3pd5SH7iz3XlqDdNIzCuXVUVABS5OUSwkQYfwep+60Yy8aTy35z0xTBi39gWAA==
X-Received: by 2002:a05:6a21:99a5:b0:2e0:9b1a:6429 with SMTP id adf61e73a8af0-2e7c508fe00mr160845637.8.1758729424848;
        Wed, 24 Sep 2025 08:57:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0fc4cfbcsm14373088b3a.61.2025.09.24.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:57:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 08:57:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Mohamad Kamal <mohamad.kamal.85@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add TUF GAMING X670E PLUS WIFI
Message-ID: <bd032e11-1da8-4555-bdd7-39ed9e818650@roeck-us.net>
References: <20250914084019.1108941-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914084019.1108941-1-eugene.shalygin@gmail.com>

On Sun, Sep 14, 2025 at 10:40:10AM +0200, Eugene Shalygin wrote:
> From: Mohamad Kamal <mohamad.kamal.85@gmail.com>
> 
> Add support for TUF GAMING X670E PLUS WIFI
> 
> Signed-off-by: Mohamad Kamal <mohamad.kamal.85@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
