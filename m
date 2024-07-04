Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B51AC440
	for <linux-doc@vger.kernel.org>; Thu,  4 Jul 2024 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093505; cv=none; b=QmrAy7lQ+NZoeMqd/AmlV2kLxh82lod8yJYTDNJ/dMzk1B8WeQv+NsMub3NTw/YQe/wWFQvMid3CRDv/1uElvDjsfyXs5WE2qVRXILpzn0C3lwqaSn/cUthoEVv4H/+u1E5AxH/Co1GlYHMJrgmILm0tiH4dkJeUqnIBMYUs8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093505; c=relaxed/simple;
	bh=syJgtzBT4NnxlMW/QH3WyVHYbCuJ+4asbQq4i1orE3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMKcJZKVMlflWbmngFSKXZynC8JZF9viWU8PwqJ0ig6bbZBBKT+G7bbgkLAFtWhF86yscwNWN6Cj4UUiPYZq5WwAI0nJV4wwYyoATIUg+9Dc/U0cNss2St+Han254nMl2NwV2KcW6r+WeH3oAUIXqyPK3zZBP0uvTqTqqDehAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZbzeD3O5; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZbzeD3O5"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso6224301fa.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jul 2024 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720093501; x=1720698301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv7PszY4Q4IaOG1+zreXlUg+dSyiqu4ksayxnh/EYqY=;
        b=ZbzeD3O5wZIMtx5Gl04t26DTSpNUIve5WaMC7tddyLaL6zaKZZmlmJikAOfDMrNNgw
         4yR2KFHaSimLGbkkOm1jCZsNM/D6r6NClkT4Q3bztOb93codyvaswA0KS8sPrleqgt4b
         I9J8iGewfqBoNWAmr19siOaYR6vB3uZUuFpMwU1G31LPPOo7nR1rR4Y0JoUOCJ+uRu0E
         tKU0vcuPzc6ebczH0dL0LZy/QDhIbnu88xFcylMGky9ZjWP8MQygFofGXifam24YtEiu
         v6+Juox3DAfbyh/8wEwp6IzGbL8gcvVVlEo+aPjNAM5etYkJT5Vm9stoQAnIrQu8WK3L
         WoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093501; x=1720698301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv7PszY4Q4IaOG1+zreXlUg+dSyiqu4ksayxnh/EYqY=;
        b=owZAUh4UhaC8dXP1ZnEWfdVBAIqETLHgPELB8TH/riXlv4MJMR8KuBnd3onwQihMeF
         2IFxk7pdYem9ydCwHnZga+PsPkXRzhOKsxm+/nRF67tTKFpYhumlB7POD3DMHrpr02lp
         8flYIaMeZEntM2pDQYMJb932F5b9n7tnGvh90KikrbxAjlmVfvMgsaQ/GnMBOk9bOnqu
         XVGKWf6b3otgTotVHb+1vPiDjtmCJF+4PS0Px5q953SjXtfbtbj2xtd0aBWEzZyLXd1v
         iB6IHp2h/i93iGQKd/YOkNY+ZYlW8JoZkSBYNNWyYtWC64dLu1mZYsaem/fPvLK52ape
         D27w==
X-Forwarded-Encrypted: i=1; AJvYcCWSXXaSmsGKfnUCBiew6cnNKlWJZSSR5ecdj78378H0cstGeS0/91HUkXpUQUgwMIB1TrrHZSsmHhHPx9kiCDWJRN0Y56eskrLo
X-Gm-Message-State: AOJu0YyxJWENdf6XezJ8iaTND4eemZlPZloybyef4ZEI9iAUX5bH0yhe
	hOoB6vrbfWCB835bFnvYiG552WGQ5ZrPNMf4zegQutRg3nlm/C5WGQXDs4WYjHY=
X-Google-Smtp-Source: AGHT+IHdbKZbpmxkTmeDNMfWZoElJCNRAAmEQv55NQl91of41tHtJX2DDGCgU6XdhgxuOrlXLDfp8g==
X-Received: by 2002:a2e:a267:0:b0:2ee:8ce9:3075 with SMTP id 38308e7fff4ca-2ee8ee0fb57mr7323281fa.49.1720093500706;
        Thu, 04 Jul 2024 04:45:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1598d35sm120559865ad.285.2024.07.04.04.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:45:00 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:44:49 +0200
From: Petr Mladek <pmladek@suse.com>
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-serial@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Dhruva Gole <d-gole@ti.com>, Sebastian Reichel <sre@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation: kernel-parameters: Add DEVNAME:0.0
 format for serial ports
Message-ID: <ZoaLMQlilpeSlB3S@pathway.suse.cz>
References: <20240703100615.118762-1-tony.lindgren@linux.intel.com>
 <20240703100615.118762-4-tony.lindgren@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703100615.118762-4-tony.lindgren@linux.intel.com>

On Wed 2024-07-03 13:06:10, Tony Lindgren wrote:
> From: Tony Lindgren <tony@atomide.com>
> 
> Document the console option for DEVNAME:0.0 style addressing for serial
> ports.
> 
> Suggested-by: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
