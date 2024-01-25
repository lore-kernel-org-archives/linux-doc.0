Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8BD131E45
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706206456; cv=none; b=F9DI2gkXUqLB6av9yjzppc6+S6jRzrnBcJaNQBNEX8DU1WuNKYMZ8au1tyx3hnqhpic3neowhltn4DSrr3n2RwlbGL2iWu5CaIbRCiGn7tiNlW+hrPmQCL30y21gbSRX5/AYo8l2eF4IEw3xp7Tvb2fVWA+hCddjg8leJSn5Azo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706206456; c=relaxed/simple;
	bh=PD5+cj8+PCKS1QSIr/M8Q9HOOZCnInEzMApcR6didaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msLbl+TXpZgpsMYjmKdv1177TTbY9xRzlu/ioHCqUC63dP8nypKZZZULDqD7HOZPPmhbwxUID48hTQkf+ZZX7Uv//eZz0N5iGQGW062kQyUB5Fy4VSohf8x60rTJLN5oY/0JLBIULSmZ3ouE2eJZxXxhojKAYTXCguX8ex1MZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=RyDhSrMv; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="RyDhSrMv"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2e633c5365so190983566b.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 10:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706206452; x=1706811252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bn65lRsPHUwSHjihHIHrD2SbxgPSKLlAgwIWNGW/AYU=;
        b=RyDhSrMv+6yg5/bI9iNRqi+Vc2Db2PW+EPGkSgqALnefKLZzaDpAPhm+feyXVuTiwq
         9xjvJT+3sA3bjlcy0DHsTp8JW8B09r5q2/tDItnh7e8KHaOLSsFVdOkY39CtNH1s+89Y
         BdEhkj6byxgg534M/3+L6h08zoh+t3aSmdsTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206452; x=1706811252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bn65lRsPHUwSHjihHIHrD2SbxgPSKLlAgwIWNGW/AYU=;
        b=mxZbigJ228N5m5ezeFMqejfZjYbI0CM5dr8xwGoPDVAsE7xQelTUL4pSSL5eBdLTLe
         PcTd1Bza292K9ZweivFQMN4dpx+JS2I6bgp1IjV0xqmNJK6ysSNcBP3YG6Rchp4Ct6Eu
         tQTbJ4WtX5H6nz1t1wPaKqd6SWLyuiQQB5fPtZRZk7mAa/gkSOBU32umaHqR0XzPx1Uv
         /RDP1hAS+h0GKRsjSkfszPjX3y+l2Rwm3fdJBrcsWU2N8FU6HeV5MQxu/RQ7fvRXjaK/
         eC61/Oj/9EAdtUdbCeCsl4tYcd7cZU7Z2BoSuH+4tZ6lE5/vvAFugJTGR1BqqUPKtHnT
         JhqQ==
X-Gm-Message-State: AOJu0YxsDEyLkJpM8aU9P00BFtTwA2MbQrB4iTgpFUYgwPe/8zOIQFJC
	l9gZBZr8QQefU1I7uRniz8NZmeMY9/qiyRJBko1+KC+h5EkP/RqI0Epf6YXdfC0=
X-Google-Smtp-Source: AGHT+IGDPJFXBsmRgx+FddyHhH5BBAeJMfI+p5NZWXiwxg4w3hyGnwVxYOFQEjGMdgxTi+vOG+ecUA==
X-Received: by 2002:a17:906:5655:b0:a31:1d58:262c with SMTP id v21-20020a170906565500b00a311d58262cmr1812927ejr.5.1706206452701;
        Thu, 25 Jan 2024 10:14:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ty15-20020a170907c70f00b00a317f2388cfsm839137ejc.195.2024.01.25.10.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:14:12 -0800 (PST)
Date: Thu, 25 Jan 2024 19:14:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] kernel-doc: Do not pre-process comments
Message-ID: <ZbKk8v7MHGoYFRuu@phenom.ffwll.local>
References: <20240122093152.22536-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122093152.22536-1-anna-maria@linutronix.de>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Mon, Jan 22, 2024 at 10:31:50AM +0100, Anna-Maria Behnsen wrote:
> Hi,
> 
> this is a repost of the RFC queue
> https://lkml.kernel.org/r/20240116151456.48238-1-anna-maria@linutronix.de
> 
> Jonathan Corbet is fine with this change and mentioned in an answer the
> following:
> 
>   "The kernel-doc change should really go together with the DRM change.
>   I'm happy to carry both with an ack from DRMland or have the kernel-doc
>   patch go through the DRM tree, whichever is easiest."

Agree, that sounds like the simplest merge plan and I don't think we have
anything in-flight for vram helpers that would cause conflicts. For
merging the drm patch through Jon's -doc tree:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> But back to the patchset: Commit 654784284430 ("kernel-doc: bugfix -
> multi-line macros") introduces pre-processing of backslashes at the end of
> a line to not break multi-line macros. This pre-processing is done
> independently if it is inside code or inside a comment.
> 
> This illustation of a hierarchy as a code block inside a kernel-doc comment
> has a backslash at the end of the line:
> 
> ---8<---
> /**
>  * DOC: hierarchy
>  *
>  *                    Top Level
>  *                /               \
>  *         Child A                 Child B
>  */
> ---8<---
> 
> It will be displayed as:
> 
> ---8<---
> 	     Top Level
> 	 /                *        Child A                 Child B
> ---8<---
> 
> 
> As I asked for a solution on the linux-doc mailing list, I got some
> suggestions with workarounds and also got the suggestion by Matthew Wilcox
> to adapt the backslash preprocessing in kernel-doc script. I tested it and
> fixed then the newly produced warnings which are covered in the first
> patch. The processing of the documentation seems to work - but please don't
> rely on my tests as I'm not a perl neither a kernel-doc expert.
> 
> Thanks,
> 
> 	Anna-Maria
> 
> 
> 
> Anna-Maria Behnsen (2):
>   drm/vram-helper: Fix 'multi-line' kernel-doc comments
>   scripts/kernel-doc: Do not process backslash lines in comments
> 
>  drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
>  include/drm/drm_gem_vram_helper.h     | 16 +++++-----
>  scripts/kernel-doc                    |  2 +-
>  3 files changed, 29 insertions(+), 33 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
