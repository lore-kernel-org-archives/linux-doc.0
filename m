Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE073381AF
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 00:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296680; cv=none; b=HopjDEETzIDO8ubKNcS3zwa51DBVXQK90P2GDqq8vKeHb8gdlgLatngM1SNzSbRmUd0n1+cQCpeyRsRfJ3szNVjPP//n96I61wayIIRJ9uzKW1NQjAh8dj7OeC6Crf8/i9cv6voS+W6HlTPCLa+uftRfLC8U2tQUvYQr2PGXdjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296680; c=relaxed/simple;
	bh=yfTSu8+gH4QzAO5EIC38xnmI95Wnv76CmSY1gwlC9S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8e29xO0knNIrSC/IN50h0zzAzvvuQEaDww59es1S6INihINNQdyaXqOxGbeqxmYCc9BaX1ZvGrdp+TFvYHky2Qh2W73ATYFWV9udPOTs5a3YuFsETx1z+02ix4dpDn9P+4t0mzpH9V73VPchY3LZMdJ4b23rWFopCffzCS09vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JO+Qaj4Q; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JO+Qaj4Q"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c1372f84dso16094281cf.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 17:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783296679; x=1783901479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+Jm2MQGmTWwLVJv3OnmJgLaTBTj4ql9huNo+65GfSU=;
        b=JO+Qaj4QXEZEOUxY+rtI1kyKwcvkfwRJw3UPOy3gvEi82jUHmWLJJcHIIpHg3mThJf
         MGU5g/MhUz0SGDOOg2/nX4SojDRtjef0L37jjZhlrASOU1Qky8eCvlboqQAX23bSnEHU
         B5UC/TFdV6AVRA47fB3oQ8FrrTsEvNTtu/1hbZGMEnyK/jCAVjxVb7cjUtNCpcEWz9J0
         CWpbMV5XhqsSFu1RCbMX9zu/31ZpN7HkkKgWudvhLOn4ToSEOpPsuISAK9OFoMtI8sJo
         FOtsuDoFEFW60jda5EHgjYCr5BVwpSduwmgl7Z/C5Z0BFzxfuNLwqVj/9mO12IYP0EA5
         HanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296679; x=1783901479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+Jm2MQGmTWwLVJv3OnmJgLaTBTj4ql9huNo+65GfSU=;
        b=PKpJr2VBouePv9+r3EWwDn6+dIOP7YRoLiLQm9VRVCnX0k600m2SzDMnfStFnWhl5l
         c02I7rkn7gGeQRmHbKbnJSjYCBm45lJsHRxRcC9bh3oM9YW+sUbScTvgdmRE9wXXGuFI
         weSxV1Dz7eh1V6OOCkWHss+djiD6x5Wb/C8VZx/EslcQWBCImQd+2VO8iYTdyBqnU93G
         GSWeOjOE8DuL0rfUSc6vSlC4Ympzwt9I+hDTrgRvk6KXA5+E+GrmcAReNsGJ3SruSjNB
         1QDHlvnyIuUoBhmRTwHNUCTE1b3DHTfybfSRH/HhxjY9mELaOyWu4fy+PIQJPLBzYgDK
         5yIw==
X-Forwarded-Encrypted: i=1; AHgh+RpaN7i7nSkZZofN82ywQYUdQ9XLfbzArinlTXiW+eto2Eo8ULUkWUiQyeZUZFF5jfGIsZI36ZLyJ8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5rcFEakK1FcW7e0TqMQIOY5sFKqRGY21ANGT6H6/GIC3ppSJ
	pTREg88uGJCkI3IA7BeXQbUaDXY0h4vhG/eF+K7le+itmTE7DqCA9rWce3txaWzEiPU=
X-Gm-Gg: AfdE7cnuBQurvibQuNJzvgIfA5SeXLo4x0eddzY9CcbsFN5VZwr+QypYoVpGw0aVE+7
	BJDyKkAIDqcF6vt2gtvZhPie6o2r8jaVCTK6tz8AXR4jDAk0EHizsym+YSvwElfDqF7qCUvFAYl
	np03r5yCYz/Qt3lcZLaOmhPuu3wI2iLAv32MES7GX0HhxKrUSK8zmV0b/Z0rpMpc2iccNKXbzxu
	aLgzjxQdWMHV5LR68ql5TjC4BxKHxnSu3y0/mfwi7yMhnOHlErJC0SoD1SmT8Msj0nS2ToDlCtZ
	aWgGA7H6NdpLD0tNPKaERCw9BwGIfQP+v4FcjeJckobaK/8x/U5jJ4jv/j0chdcIIrFSYDXNVIH
	U16NVE0FNod0fkt1E4t5veHJpQkZV+BVQX9n1T88tWArRQjz+x6g6ICHRYUucKtNm+QLFF+khmD
	8k1ec=
X-Received: by 2002:a05:622a:2617:b0:51c:1daf:1978 with SMTP id d75a77b69052e-51c4c3846f5mr124774241cf.54.1783296678602;
        Sun, 05 Jul 2026 17:11:18 -0700 (PDT)
Received: from fedora ([172.56.218.236])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2ac6esm74527361cf.19.2026.07.05.17.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 17:11:17 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:11:14 -0400
From: Gregory Price <gourry@gourry.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, tglx@kernel.org, peterz@infradead.org,
	luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, lance.yang@linux.dev,
	marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
	joel.granados@kernel.org, lirongqing@baidu.com, nathan@kernel.org,
	xur@google.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
Message-ID: <akryoj42VnTnHrbW@fedora>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
 <akklLLPZ1fbcZRML@casper.infradead.org>
 <50697183-B97D-48A9-B0C4-A288B88324DC@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50697183-B97D-48A9-B0C4-A288B88324DC@infradead.org>

On Sun, Jul 05, 2026 at 02:49:56PM -0700, Randy Dunlap wrote:
> On July 4, 2026 8:22:20 AM PDT, Matthew Wilcox <willy@infradead.org> wrote:
> >On Fri, Jul 03, 2026 at 09:58:58PM -0400, Gregory Price wrote:
> >> +config SYSCALL_USER_DISPATCH
> >> +	bool "Syscall User Dispatch"
> >> +	depends on GENERIC_ENTRY
> >> +	default y
> >> +	help
> >> +	  Syscall User Dispatch lets a thread have its own system calls outside
> >> +          an allowed IP address range to be intercepted and redirected to a
> >> +          userspace signal handler.
> >
> >I was very confused when I read this.  IP expands to Internet Protocol
> >long before it gets to Instruction Pointer in my brain.
> >
> 
> Ditto
>

ack.
