Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CF2BDC2F
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099582; cv=none; b=l6eMJySTJKV6YK8WqZWdXIeiLrHDXrsSfJZUX/gcSXOPpaLP0ve5D/c/RHDV3lQsBb93ju64zefKQ++b9tZf05huCC+oT/Wamq1zzaZcPpiUGe2xFPAVAChF+z0C345Utwryoo4m6BtnU5FE4O4FTYE9Txp1mM2IKi5k5eUQBtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099582; c=relaxed/simple;
	bh=kmlEfEMENf5B5OQEKeJVfJ9bqjpmPI836N1QuotGv50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxpYBc3uA31AM2pK/QjCgidn3seKetGSxmRLdRq9XSza9HNJ1N1oGfBAZ5RD9LBo/gCba7D8ZGgQnIwYrn85bGXxabm2frDnjhv3mWpvtSj7hQ/09F6jMzh+cd38HPPg6pE5HoQP/FRqNInjvORfrDMYf4ws3NtSAPn9bC+58ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dqm9N3E4; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dqm9N3E4"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51bfad59921so5380981cf.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783099581; x=1783704381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zrRsjM5o4NMj7VanY+1CWD4IDpNUJIwLPKO0n4Piuc0=;
        b=dqm9N3E4DlwHUPJIvQZa6PcCZqi/kq0K+SjZLm1Bs7LU4fJLaNMIj4f6CMvIoJ3NK3
         JleBZMwifBL2UvwTrgAmKxYiV2nR2Ii07Fsuut/Way8fCAu4+QUsJH5I1vONBoqehMuo
         S7LoL8mjYEbvqtz/IrquqcPPYFdCkopHI/e5DTxQkUO6GwHcH7jBh2jQ095FfaDQQspA
         xpiWMwKJRgAHjxoxbPWCdR9WhdzNakiADBUDEE5qaUjII6lZcCKcVwhCrPNaezIy+3S5
         Mqq55qQ33GpzrvPRy5VCPTRZcLnJ6vzyj3E2QNnga8mxFajXSM2JwxBttQVyBY630JLF
         TZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783099581; x=1783704381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrRsjM5o4NMj7VanY+1CWD4IDpNUJIwLPKO0n4Piuc0=;
        b=e4ipbBNl/xcTj5Pc4arhscEBdhhsdEwglTR5yZ7h47cOnUOKKnqzZ/C1RSoblkFZyh
         rwf7JmTUTJMaR695XIbJNihWaazE4bRTI+4Ugoz8nvm3eqMYU8rs3o9IVQQ45rtdM6qn
         utzsVVHEFT1oM+Lcz1fBqvbPjF4zkU3j579JEtPKUoLaD5CEBG+G8Q/QSIajOMraibCr
         RfEOVs3X82pyyD+Ci8rKBtutLro2ecSpSsEM3A1D5iO5HsJ0lEGC1fOSX+vzpaWk1R+r
         KclVsWO4KQeJRKPjFZVTqGLT6eUGIJvhfLAKBTSdYDRzoQYeBWfsiw0eo94eaxSg19AW
         dXmw==
X-Forwarded-Encrypted: i=1; AFNElJ/BLK3/AFLcJN6Wcm2b+GaX61jM9ovbVxE0+MSdtnS+C0auRX90RNHqK83oqFErfdNkSWTW48Pz55E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDdGqJOOA7m+y1XfEuMy9M/Sdxw/SCj16QLNPm7zRyunYeSxTd
	WRtIVU1p+ojbpM4d3IFgL+pAotoJb5FpzRi3y0bE5rIOg1UniTQTFyH8A/CgSWV4DZY=
X-Gm-Gg: AfdE7ckK6zDhwDqh2iX2JpM7l0/tWg1/xa18jZUXEiGB++Ts4bmwIMmdTdsBTpP/EcP
	c56t8+m8kDNsmPXX116bvGIIwzILNmN7RvvCGB7dZwnwdsoPP99ZkfjIHS0fOOMgyQM1RhC/qN6
	nhZyU4Iu+a3/8WqE7ftOCGVVxPvTUkyg/DxK/cqMBcnIz0tKHJBuyjz3z+mHfo+PXWQYXlMvWWd
	oYKTC7xMcAjGDWbugua2s5wuoYb30nLy+v3ZHWGgvpBSy0rKNBS+EjWPEQhqwMiGj/0Mq/Cn0b8
	fDpUkkCjbn6BeJU256Ihf2unIqod9bPoOyEJ5VeaVUbKRnkaWb3Q65GaWTNvAJIbTq8RGnRxwFB
	ysuKohWGhDlVKZ2aMz6hueihes1milNvLu2aZmaBdwrK3Mq08sOb06DXtCBh2gJpsaA8kbEqw2e
	rOLfcEvw==
X-Received: by 2002:a05:622a:408d:b0:51a:8c9c:7f3b with SMTP id d75a77b69052e-51c4c32b7cdmr6511121cf.62.1783099580664;
        Fri, 03 Jul 2026 10:26:20 -0700 (PDT)
Received: from fedora ([2607:fb91:1408:4b9b:69b2:bc92:5299:1677])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d688sm21828511cf.17.2026.07.03.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:26:20 -0700 (PDT)
Date: Fri, 3 Jul 2026 13:26:17 -0400
From: Gregory Price <gourry@gourry.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, corbet@lwn.net, skhan@linuxfoundation.org,
	peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, mhiramat@kernel.org,
	marc.herbert@linux.intel.com, joel.granados@kernel.org,
	lirongqing@baidu.com, kees@kernel.org, nathan@kernel.org,
	linusw@kernel.org, arnd@arndb.de, deller@gmx.de,
	jpoimboe@kernel.org, ruanjinjie@huawei.com,
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, ojeda@kernel.org
Subject: Re: [PATCH 2/2] kernel/entry: add kernel.syscall_user_dispatch sysctl
Message-ID: <akfwuanT7Ot3KD6R@fedora>
References: <20260627205551.769684-1-gourry@gourry.net>
 <20260627205551.769684-2-gourry@gourry.net>
 <877bncm5y7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bncm5y7.ffs@fw13>

> > +	/* Arming can be denied at runtime via sysctl, disarming is allowed */
> > +	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
> > +		return -EPERM;
> 
> That might be similar to other sysctls, but if an application had it
> enabled prior to the sysctl=off toggle, then that application will
> suddenly fail in operation if it requires to move the dispatch window.
>

If the admin is turning it off globally, is that not exactly what the
admin wants?  The alternative is a hard disable that will simply result
in undefined behavior (windows syscall ABI being interpreted at a linux
syscall) instead of failing gracefully on the re-arm.

This seemed like the better option.

~Gregory
