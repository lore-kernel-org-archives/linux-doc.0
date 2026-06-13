Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65761A9F8C
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 00:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781309816; cv=none; b=ffW6PDFMUONFy6GcLg9JNIZfbyjQ3VSiOQ3bpxqmZBUqrpuM0j4PnLGlyeOnf9AKjsPu9LmgypZF1mUjM66WllDJTgarlq0xM0ClZFcgkO6XPN+/ixKSQ+j2RI0LNhLyR7zv+66wg7AvfBDYydfILyqYvRQLfskBzGFox8mqiS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781309816; c=relaxed/simple;
	bh=RBSN0UlsBfrCs3ZKta21X4Qy6ml77QBdos/zlQ3V+Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZAgY977OV4oPE8gpV7YBzlZMvQqVSriI9B2hZaODE+6NPZHT/ejxv2+UZDuT6mn0i9Ci21TnK4V4I7i7iqZrfNVLctaZa/ODRqpnQLSHA8LkRZre2aTI8r3dVL4Z+IA9l/Fe73dCye1WL+wgNypBA7Ev7xgYxIy6o4lrKGdCNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PF7e5rND; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PF7e5rND"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1380104f31eso3248c88.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781309815; x=1781914615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=;
        b=PF7e5rND9Y8uEDk9zB5Z8l6Fk8A0Ne/PrczwYRF149k7wbK3jG64t/4xQQAxb+5pJ8
         IC6yX7lJzZ6HUl5n2m1misAaWzWLaCz+AD0IYrOIlmybv/gWmTGQXJUA/9ou3GJxb9xx
         s+1RXSqsp/3LMRemKPZo3p7hE/qHfCXHu2ykhSoTri+Atc/msBqqnNfxcGIm9TDL6cEB
         nyfiWT5eME0FXMGlZNO9KFf5UuvSzW2Y5rECGrkURbK5EgYtezs/a4F0AEmvUForamm2
         dKKiu9BH5x/dl3mnYRhn6CjTOYb99hP/Tew0doKNSKjJc6UwlU7y2yOSqDlGdmQMp/Um
         Yiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781309815; x=1781914615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=;
        b=NN9qQ6nSpgKRktpv3+FqqNLjIKKhmKfyxZPgoRx0LBovy96cUNL1MHX6Xpwwbc9dUS
         qPmyDlgtrdtJI78hHvAdiMwAxDhhuMor95zVvNYI7Dht/MYm/JLa3FkgQ/vXgaJRtjJS
         3UbGJeKnzbFagEXiDeMdevhXEnxKDIY3guZ4/87MzSoOxcAiok64zY/7P8ZO6Vf4Ay/4
         qrzLLuazyjsnC6L8JWftC5aVOA+bW5G/6GuKbBBCy6dVBx/X2Cdfyr5d8uED5OlTKQCs
         137GSTmEEUdsO1qAFbMkao8S08DklqgkBGZkV0BmM9Oq/g/BFmD/Vy1Vtv0zkut1T6mV
         2Nkg==
X-Forwarded-Encrypted: i=1; AFNElJ/r4G3i5qMOQ3q/oWwh1L7Z3yKOT7EzbEGrMc3wOCsuZgdwNEgrDxF+bI1LbLCgdQ5AG4Q/vsFfOiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+S2+7qFgoZINgvNDWfFgKW2UuZ8eCbHrxe6ip7BrbC/FSjNZ
	6Stac5f/6sGilKXiCHccGYj8ciD/668ObcQYKnfT6UFIqCriuQ3wcylGzR9LLuWIhA==
X-Gm-Gg: Acq92OHwJU9kRQt53oj5jzxVZiilFiE0xbPWoEdn8veZx10xyKqgur6I/99jnzLa5X9
	XEce5EjYrH7MWiFxv3QYW9hy7L64Fbedrr5dj7NMwSfCWvDse9CM80xcfgtq9WOEkqPXVQdWak7
	78h8K+P44k/VEb2yv48UQplrzzJvH6wumKI9fFlU4dRJLOHnFFVYDsNkLsaTHhQq4wAV2APcF24
	H/Z9kU1EV/vIidUrjuOhiUMAh+L0ySxe+HF5P1mNh926f5HjoW7cfXYQS4ZVPIp6Lod9U0r+si3
	dMHPOWue48yJDqP5HVawjIRNXfkeRLal8nTsMAatFwIytfm/JLEeXa60f6gEz65VBdnpieyP9fo
	7QM03btJ0niRcGVMHcd60rzLgwj3UJ+Y3B61c77f7KG5vvCTMwAnc5ck7mI0hqQbN9mLyVYHKQZ
	UTYH6MHrmiUAGIbHemqdGrofGmn9tCZtOWKhKePqkD30nc9fRKrXg01GWSIA2GvFap8wVsLKa0M
	Ns=
X-Received: by 2002:a05:7022:f8c:b0:138:888:32db with SMTP id a92af1059eb24-138fe5a1d90mr28525c88.27.1781309813946;
        Fri, 12 Jun 2026 17:16:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:e362:1a25:b90f:e3ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea43b80sm5190375eec.21.2026.06.12.17.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:16:53 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:16:47 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Dev Jain <dev.jain@arm.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
	will@kernel.org, catalin.marinas@arm.com
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <aiyhb2XwMMJE3st7@google.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>

On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.
> 
> Now, when a memory object will be freed, it will retain the random tag it
> had at allocation time. This compromises on catching UAF bugs, till the
> time the object is not reallocated, at which point it will have a new
> random tag.
> 
> Hence, not catching "use-after-free-before-reallocation" and not catching
> "double-free" will be the compromise for reduced KASAN overhead.
> 
> This is an RFC because we are not clear about the performance benefit.
> 
> Android folks, please help with testing!
> 
> ---
> Applies on Linus master (9716c086c8e8).
> 
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
> 
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0

I tested out this series on one of our devices that has MTE support,
and didn't see any functional issues.

One thing I did notice though, and it's independent of this patch, is
that the vmalloc_oob is failing, but that happens even if these patches
aren't present.

Thanks,
Isaac
