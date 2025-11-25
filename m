Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E432E6AA
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764096261; cv=none; b=iEk3HhScHqERxVrBm/6J/o8ZLFWoAi50XxFicim7I1rf8yAWmbjs8VHY9Tel1ZbkOORvVHKaOBx7g9W3q0ANIN4sfzOA6Y4OkkbyftnTMCTkPrYdZLcCZ33oCdpjmjy/kNQlept9asCWisO8gmvkjtdJlwKJ/HrVrr39W5d0ROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764096261; c=relaxed/simple;
	bh=h41rvwq00iAAMBX9jSxM9Flk4uh7o21WQ52nLsax6Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACTOCQj8PCc0nisGLH3iOqkjzV328KezaUE11sehXY2DscAxqiqaGpWQK362GX064rBT81XyCDw9/uYT0Io14H1jz3t3ERTGb7cRZ7/MlI4mPNNUkeHhka2Q4rNCJnbpqNPJG6d4A4qIbNu3SEIzGCA3Kwq3i0bLriHZH9uB/Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6kmdJly; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6kmdJly"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78a712cfbc0so56163877b3.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 10:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764096259; x=1764701059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuCC5DFWaWyOL4X15A+FY0iDuG43APf6t+DuwQP4zFQ=;
        b=V6kmdJlyF1SaFhR0v7TrmHDbXrpefM/gZiMsrzP/yECoIBMzZuEjPUh9eOcVdxqDHg
         aCUG2Be1O1+boMdaY9eMjRGVxfx2Dl5FUSZwSRBGvQ4Q3so4tahKJOqUrwNWPNly2mXo
         eQa7Ynxi5Ewi5lxrq9DKRg/YxSJWRV9no0me3ookLfmGACZ6bsNZAHV8hNnFyPkYv+dv
         HH0TU2kq5qGem5/+jiKFfZIYnHe+pVPUVPIOSwDod6jpcKP3WnltSmAf9f+5jTwjVuwQ
         niQ7DkXdDq/F/N5kQUbtW13DTQfD5T8mTj0Ndsq37vn2lcnSUU08/8luX8mtpuw2KlSF
         Wa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764096259; x=1764701059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EuCC5DFWaWyOL4X15A+FY0iDuG43APf6t+DuwQP4zFQ=;
        b=CCvpPj0thvaHA+hBtYuZ1CQdp1GJww+/nF/ZVMjUbf9i1Sx7HMmZL4kvMfZudzI/xb
         jdllQ2PO2K+eXJRwyuJkaBD1oovdiOB5cOMFNQxEWDmP5muUibNbx/cnSYLTdrSJmaDd
         3pXKRNn++L50PYXlnuTt4woanrV55ZfJiuCuqDRyVPFpgiYf6/hJBqVT6KqUofMMIqlT
         Uk0xkNYciZuzTaAFmbfNvU5cMzSnLSMnygW2WXM9R+a3q4VlfuVVRS2yV1JHzA8BGirW
         xKMcesSc6ZnRaDo3cNIa1ndIism5UlA29Zkv0smySIgYZFacrJz4IosBGqEdEmX/xTds
         X+rg==
X-Forwarded-Encrypted: i=1; AJvYcCWaObDVbi28XpXzHyYQPO2TeZAMxJuPAYz641mG6zyb9IM2zdj9/7rQ6N7MU2D2xEbeBDvNy/9RsgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmT2GMn7u84j5j31DYiP4ITa5BSBwFT1wgWgNwvXvfsi+zs6N
	MmLs0ID6CrcTShUO8eflra0plxa3tL5l/v5V3/PVszXCWTseNwDrPm03
X-Gm-Gg: ASbGncse4ET0lrrOkmHGOa1jGfeM9knugGxILXarYFbJXBj/AMKfZKfHfS3WiLq8yLv
	G+c0/Y9HHLrvG+WnyGWdz1GGHVmWbcM5kvJJmDROzw0PFG+VNhd7NSaaapAo3ozlcudlgd0FjTo
	Awz14vHSCAF1jUYuNby3eKi5lS+UpZ7HQ3peikTry/YX+K/UrqNeLPQC5a2WJrpd9gzzXbGlBs4
	x/dmVAexlgP47Bn+Faky7naETGqGb07TR300qWDutf7h2GhDW5n/oYCCQWMHWxyJW9uyT6c3Rkf
	N4+HOnv+9JtBbGs8w2R2TXzZgnpHYgqoh1orHXCxHtLF8oR6N39GGknRDOmXrbGoBvqbSPT5A/0
	2Ol1QMdSaieXPYmHS3AKIA/rwAuz0fDah4A78pfQFwubU04uNHqOMVzVF+1jSvN3W/Wbw1+YkuT
	8deZ56oWe6UPJ5hL/P3MK18g==
X-Google-Smtp-Source: AGHT+IGL0IWhgJSuT0/x34hD1ZnZBCQoO9+9MuB14e3zIBSvN6lwZFY8kFf7BpE4AVJ8D7mB99nxjA==
X-Received: by 2002:a05:690c:4a11:b0:786:59d3:49c8 with SMTP id 00721157ae682-78a8b54d8b4mr132611937b3.49.1764096258560;
        Tue, 25 Nov 2025 10:44:18 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:13::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a7992511esm58735867b3.35.2025.11.25.10.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:44:18 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] mm/mm_init: Introduce a boot parameter for check_pages
Date: Tue, 25 Nov 2025 10:44:15 -0800
Message-ID: <20251125184416.1493908-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aSWDkuJEdk9cdVCK@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Nov 2025 12:23:14 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> On Mon, Nov 24, 2025 at 02:54:06PM -0800, Joshua Hahn wrote:
> > Use-after-free and double-free bugs can be very difficult to track down.
> > The kernel is good at tracking these and preventing bad pages from being
> > used/created through simple checks gated behind "check_pages_enabled".
> > 
> > Currently, the only ways to enable this flag is by building with
> > CONFIG_DEBUG_VM, or as a side effect of other checks such as
> > init_on_{alloc, free}, page_poisoning, or debug_pagealloc among others.
> > These solutions are powerful, but may often be too coarse in balancing
> > the performance vs. safety that a user may want, particularly in
> > latency-sensitive production environments.
> > 
> > Introduce a new boot parameter "check_pages", which enables page checking
> > with no other side effects. It takes kstrbool-able inputs as an argument
> > (i.e. 0/1, true/false, on/off, ...). This patch is backwards-compatible;
> > setting CONFIG_DEBUG_VM still enables page checking.
> > 
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

...

Hello Mike, thank you for your review!

> > +static bool _check_pages_enabled_early __initdata;
> 
> No need in the leading underscore.

Gotcha, no preference here on my end at all, so I'm happy to drop the leading
underscore. I was just modeling the variable after _init_on_alloc_enabled_early
and _init_on_free_enabled_early, but it seems like those are the only ones
that do have this leading underscore anyways.

> > +
> > +static int __init early_check_pages(char *buf)
> > +{
> > +	return kstrtobool(buf, &_check_pages_enabled_early);
> > +}
> > +early_param("check_pages", early_check_pages);
> > +
> >  /*
> >   * Enable static keys related to various memory debugging and hardening options.
> >   * Some override others, and depend on early params that are evaluated in the
> > @@ -2591,7 +2599,8 @@ static void __init mem_debugging_and_hardening_init(void)
> >  	 * of struct pages being allocated or freed. With CONFIG_DEBUG_VM it's
> >  	 * enabled already.
> >  	 */
> > -	if (!IS_ENABLED(CONFIG_DEBUG_VM) && want_check_pages)
> > +	if (!IS_ENABLED(CONFIG_DEBUG_VM) && (_check_pages_enabled_early ||
> > +					     want_check_pages))
> 
> You can initialize want_check_pages to check_pages_enabled_early, would be
> clearer IMO.

Yup, totally makes sense as well. I'll include this change in v3.
Thank you for all your feedback, I hope you have a great day!

Joshua
