Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAC2FD7B9
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655286; cv=none; b=miAyB8VhqVNxUOpgx2oHhI3EBG85pasqP3JNzdsinei2UnTEnlqHBV+0MWygg8rErYfo+WghP1MkqoGI999ymY4F8/8es+OTqxAUT+2fcOhaXKffaRlBlx+0OGYri9+19hJXFjt3oc+gYWAF5Am2PmQ3I2l/5mXidVFTaveMiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655286; c=relaxed/simple;
	bh=Kf9FJRjfjFqAZf7UV37J+n5tjiHT302WbXkcbM62LUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2Oi3+CtgtWF1zGfJFqgdIUkFgTsNtUjxY0Q9FKinxn/yaZuDe7Q1vQMWbTt81qrOOheQpj9O8w1nZRZYW+tzoy7m0yGrA5o5Lpr98u5sQfSYekdiiekB1NLt9d7wr1pY5owgN7IN2XdELxxa5iog0zoOgPfppnuxNRuSW1tSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XyKW12LV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XyKW12LV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2980d9b7df5so60370925ad.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 22:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764655281; x=1765260081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzFHU2d9WoKIzPeiqYnvkYluXgvH/rLzeOI58rkPN0s=;
        b=XyKW12LVsz1zp2lYY54VTdXv2K6S1UxMv2f9ydFz5q4ew0YWdKdPIbAa4qKKIzHTYv
         y/AN1wSzHkwm0e5HhWw5mvEcI9UKnUqjoz8ImIk+EH+rNclvG4m7wBTdYw4/mrroxKen
         oQoEWicpLWn4cdAiXp3grwS7sKu/adx0rqtrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764655281; x=1765260081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzFHU2d9WoKIzPeiqYnvkYluXgvH/rLzeOI58rkPN0s=;
        b=JOXlkiZC5P+dHyv+t/HbmaYGKOdl45zUeTj7NVZ+SPK6K9KNr/mNitDow/RXwKWqtW
         TleXavMfaWHQ2vivF7Dv2Cy7wjcPKAAVxOEFMt54l9GLldGf2259+2DDKBW3X4zVdkXP
         janxcL9xUS++D8U8+SqcdvCuMKFckN/f5oXOWitmf9+T/QJb3mMi4TBMwnNKPXQL0BUO
         RxDVOv3fV08B2E7P5dtrznAUPTX/X6CX5+kGK43G6hh9feRAs2VW45rG7dwYKeFWcf4Z
         jRTiiH9nat+A0FHQkvIXkT4wkiv8rRQoYKvlk17OamFQRTdotjHsbZfKDIjwmzHdky/a
         GCiA==
X-Forwarded-Encrypted: i=1; AJvYcCWiyPuF7+HebZzCtvcSvpjJLiINUj1VLLdQ4H5nkzHzMMM/HrZhh+hd6z4yXT1ul8LM4CxS87Ossr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkB/3nwDAbOEWR7ByHZqNz/LUN52/EDSYXWiaLe2ivzUGDBQA
	qt9o3igxOhTc1Me00TbVVpV0CO1C8MQebr6fI5RDWcmTmeR/B9Lwg6H3UniMDUwBww==
X-Gm-Gg: ASbGncvj9+4NZvULxGf0mr4JBxLSLc9mKaYzeI0owN0BSBn9w8E/lvZDb5EiUB37viO
	d/ZWYtM0hC/BCTMm7QgksJzFdepFDHRUWkaksWVAUpYNuWKPhy/ppEt46yD85iUvKlrPswHR0aM
	v5qqQU/3HcVET456/kNOItbwT2rAtknisQfUHdzMrpnRU0Od+Makce2g3bK3QNmTrGwUhJWj2gt
	uRHOBCd2t9MT6i6r7SqmBHlt0kpzOdUJFr7Zpe3qyH5k23X7T2iiXwXPueEU1KqHZ7Gitna3CcD
	fbCPSClyph3SorvXwUM6UuhNtkkXAdpAo+vyS+yuDen1Ge1/uM2NEYaqfrF2hAzs7ZFtlpvcBOt
	rDhYOzlvuZT2kU/jxVaE1bf7szuoJ9tqhG1hgD+0HpDRLCQulDHc4Y73vOI1c4q1Wv6X4v+JvwP
	oKlr3pjwye0y0Je78R6LWXeW4G+yHW0g2OTcfhcSblFY0=
X-Google-Smtp-Source: AGHT+IE1e6K2gqxN6YkHd/0TpzefMKewjaf1+qKg4peN7RtiQv14ln99cou33aicCLTmafc1RWN4dQ==
X-Received: by 2002:a17:903:8cc:b0:269:ed31:6c50 with SMTP id d9443c01a7336-29b6be8b68emr443452375ad.10.1764655280899;
        Mon, 01 Dec 2025 22:01:20 -0800 (PST)
Received: from google.com ([2a00:79e0:201d:8:2a01:6685:27bd:b4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb275a3sm141699605ad.66.2025.12.01.22.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:01:20 -0800 (PST)
Date: Tue, 2 Dec 2025 14:01:17 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Aaron Thompson <dev@aaront.org>
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH 2/2] debugfs: Remove broken no-mount mode
Message-ID: <20251202060117.GA2268011@google.com>
References: <20251120102222.18371-1-dev@null.aaront.org>
 <20251120102222.18371-3-dev@null.aaront.org>
 <8c2a2753-145e-4de5-84fe-9a900af6a2ee@sirena.org.uk>
 <0101019adbfd6b56-c13ab9c4-a0dd-483c-a6fd-a6ea0d110604-000000@us-west-2.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101019adbfd6b56-c13ab9c4-a0dd-483c-a6fd-a6ea0d110604-000000@us-west-2.amazonses.com>

On Mon, Dec 01, 2025 at 10:16:49PM +0000, Aaron Thompson wrote:
> On 12/1/25 09:15, Mark Brown wrote:
> > On Thu, Nov 20, 2025 at 10:26:33AM +0000, Aaron Thompson wrote:
> > 
> > > debugfs access modes were added in Linux 5.10 (Dec 2020) [1], but the
> > > no-mount mode has behaved effectively the same as the off mode since
> > > Linux 5.12 (Apr 2021) [2]. The only difference is the specific error
> > > code returned by the debugfs_create_* functions, which is -ENOENT in
> > > no-mount mode and -EPERM in off mode.
> > 
> > I'm seeing regressions in -next in a lot of testing stuff which bisect
> > to this patch.  I've got a test that looks at the deferred probe list to
> > see if it's empty, and the mm split_huge_page_test which uses a debugfs
> > file called split_huge_pages.  Neither of these mount debugfs for
> > themselves, they just assume it'll be there - it looks like that's not
> > happening any more but I didn't investigate properly.
> > 
> > I don't immediately see what's getting confused, DEBUG_FS_ALLOW_ALL is
> > the default and not overridden by anything in any defconfig so
> > debugfs_enabled still ought to be being set, but I didn't actually try
> > to debug this yet.
> > 
> > Sample bisect:
> > 
> > git bisect start
> > # status: waiting for both good and bad commits
> > ...
> > # bad: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode
> > git bisect bad f278809475f6835b56de78b28dc2cc0c7e2c20a4
> > # first bad commit: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode
> 
> I am terribly sorry, this was a sloppy mistake on my part. The IS_ENABLED()
> check is missing the CONFIG_ prefix. The fix patch is attached.

I see it wasn't my local stuff acting up.

> Greg, should I send a v2 of the patch series, or a separate patch with just
> the fix? Or something else? Again, sorry for the trouble.
> 
> -- Aaron

> commit 92dcc0b68643955317fa4174442a6376df5a8c97
> Author: Aaron Thompson <dev@aaront.org>
> Date:   Mon Dec 1 22:15:24 2025 +0000
> 
>     debugfs: Fix IS_ENABLED check
> 
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index 930d66911fcd..4b263c328ed2 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -35,7 +35,7 @@
>  static struct vfsmount *debugfs_mount;
>  static int debugfs_mount_count;
>  static bool debugfs_registered;
> -static bool debugfs_enabled __ro_after_init = IS_ENABLED(DEBUG_FS_ALLOW_ALL);
> +static bool debugfs_enabled __ro_after_init = IS_ENABLED(CONFIG_DEBUG_FS_ALLOW_ALL);
>  
>  /*
>   * Don't allow access attributes to be changed whilst the kernel is locked down

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
