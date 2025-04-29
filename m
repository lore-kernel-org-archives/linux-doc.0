Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C132C1E27
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926791; cv=none; b=L4plLOI5yJgc/68jha55wwuEgFftNrEIdOEN1gpRQ52wvrIuYbAhoJe7+NmJ9mpbBs1GonV+HOxLHQPllElSB6PTCTV+1SVUKqvC06uxGCe68Dw998kvGhVbKW6j69oODTkcXaSDvgEe0I17/WL5Myw3hbPQmRhlGdtGwOlHb3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926791; c=relaxed/simple;
	bh=BwZDjGnAk1UJgl/brXYK/H4LstIXponojMQGkQ7BN0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2laAv4wxZdLHbNxXYWJBSbOZPC3cYY/uFhhB4HsWKyWTct3Hqg5fTM4rdF5FfYeuje6NKCp8Ce3bWMZE9nIQ0ohrV9sE0Q2k1PAMU7xg8kwYKOZXV055Ke3qKsOy2HKM5ogMhm5mK+tusXKTag+xgCiS2Kqj5slSytroRdE3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c2giPj6k; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c2giPj6k"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so1019258966b.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745926786; x=1746531586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
        b=c2giPj6kex5ZlKgncnCuv5Z+k9MUX5UXHI0vzCIbdLoSEVqHm0FbFmsBr6bSJDTXHy
         JDJMT30q0TQfniOtB1zmUTYJ4VpnRPxDUPG9BdUGFka9Fh1vk3mmopNlEeU+e0PDBWfw
         X6rEa5w7c9fv+9Mc0WZ+Ht5wlmPQrOsukC+ZzBnEjy5wMv3Y1IiqviFXwTqy6KOIcoJc
         rH/t+LjCJ8fp9sm2r5F1dYnLgRsopQGM6kLZCs5pdkAZgwz/2qOht1LGWlo8SLpFQYoW
         6g5DBIeOe4VbaU916SKrM1BDRS/AAkGezr5mAiZ5bVzIhCeGQP856JV2w3IXgVJ4J2mv
         iBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926786; x=1746531586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
        b=Cxnrk/SBDB/mIKIGd9pqR/nj1LWAt+Vl5dFc209/MTlU/rWMmg/iBLt/wvxcPIFH1Q
         MoUkWKUbx9c75poxEmr18pMCzpxPJmBflUrEsD7TIBAL5XH7ky9B5xA7f1TmbCaxop07
         W3MNC91qSxa5cjqcquzSuI/5c8ZUT2Dj+Cx21Z2gi5Pb5Kd3QYQOuGNuAtx5KI3pQMnL
         BmhhW74ha88ZRf/CqaMxG1pBNm/XH84LpLwmxYuUrJxil/olVM5G3bieR0fYc3iPph/N
         ferZD2nOApXUtFNCo92sFK0cfW7qcvP9BobKh8j2AvqqYBo5apyGOXL1I/0/3NPZwL14
         nTMw==
X-Forwarded-Encrypted: i=1; AJvYcCVCgG0xkC4/eaY/TRtgrNuOHdTWK868sOBds0qoi7s6X2faMYETS8kjvvSGZ2/zlHIMS5FjUqLJh3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3f3IRp1npURkE53AfA+5NvMRPATfzOSbrTKp6KiiOSA3FHI5
	AzDA8q4MU2os3bFQdNE5lPz+SqyZIvaloX8TDVdVW0rQdHpINdi/XtG33PSsj6Q=
X-Gm-Gg: ASbGnctUiITyrgBazUfmNcqqkWHvcjvUR+4fEq0sm/9U7zZ/jv8SKbOnlg1dzk5+fFS
	dUf4VCosR0PEsTnwsyRtOHQ6UDgj0iJxPAlAQVGnig9KsLzABym3SvSO5VY0kppjATlOTNeoIcB
	7dEewZ2QMbVpbspq/SjIrznLXsOGxtc+buERlcK8vECH2VB+80uD+EwCVZV7SfKTJNGHDKFWmqy
	3vYhQXQQOlkbpLVs+DPPk1q9vVeDBQGXtUDfoI+steFzMapHZrrg8+mC7RYSjNnVU0q+7cwqSmF
	AFMR5o4SOwHFtVygYJwkk5HcLk8Y+lnxZgL8WbSE
X-Google-Smtp-Source: AGHT+IEvfTQCJKCNh3qhke/KxsW/y1p2uYXP6K9g5VKxCSG1GBRIRQqV1uYXaafKpVqcupU8bMrCXw==
X-Received: by 2002:a17:907:86ac:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-ace848c2393mr1062210766b.6.1745926786169;
        Tue, 29 Apr 2025 04:39:46 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec0530c37sm169875066b.136.2025.04.29.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:39:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:39:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-ID: <aBC6f8Vmlik9ua0K@pathway.suse.cz>
References: <20250428123132.578771-1-pmladek@suse.com>
 <aA-0MuLxVTueDAhm@blossom>
 <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Mon 2025-04-28 22:38:13, Aditya Garg wrote:
> 
> 
> On 28-04-2025 10:30 pm, Alyssa Rosenzweig wrote:
> > Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > 
> > Since the other patches went thru drm-misc-next, I guess this should
> > too?
> 
> I think yes.

Yes, it would be ideal to add this to drm-misc-next as well.

Best Regards,
Petr
