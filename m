Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8CBC4361B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 22:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B6A0233FB
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 22:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbgLPWoC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Dec 2020 17:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730261AbgLPWoC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 17:44:02 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CD7C06179C
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 14:43:47 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id j18so10472907qvu.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 14:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=5iM9RJ4gwzTpmbLcd51z1X3g7wJ89aAed3SuXrQHFdI=;
        b=YEWJiipQzfczpt0uf8rh+HGs4uB5q6A8TXYglmXoICT58L8YuE6qb/Y29P25i0SDqb
         1EU7VcicQjAx5Y5VV7ate1oq9loGsjPS/V06qPsTksNWEPc3Xz5+Gn0hFC7LxHJeQhtl
         0q7ySo/gZA9o3Vu9kE5MydwnOxj3DLDKHnPEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=5iM9RJ4gwzTpmbLcd51z1X3g7wJ89aAed3SuXrQHFdI=;
        b=kKoBdl2rBxtsAqQgCd97AqATBYU+/orrOStImz+5a3vn+W7uaAEI/fQJZVUtAMjysh
         lgguCdLTdJKxzgRe/FYnM8D59tkZsy88lR9Nfa4GvK+PRdH5n/QwX/s13AKjj8S6BwlT
         DDGtjeziDuEyg2F5A/zs9EbJ5zRH05CeWvh1NiOZ/gWgJ8HyVYzEAF2tQGFLdyzik1I0
         kpW9fhXf0iwCTsDU+edcI2U4Xr0mctIosHuIdko3eolfhRLoEENlM4gAn8JYgqjh7gen
         NlSYzh5Szd6O5uDukAIa0FoamgANPf/BqqwymO1UYXkOnnJfxnu+EkijHplStMa3dGhc
         Iz0w==
X-Gm-Message-State: AOAM532uBCs5lcXoEo5auFF3ul/aDbm8OwzKAl2RZR1u6nln02q++dKM
        x39hpnTYhbDfS6DW2akEn5cTaA==
X-Google-Smtp-Source: ABdhPJxQ2kYr4tKDDJO0pm1aI53/JOnfuITEiUOY9Dlc/CzQHnvzOpdbjl3pjietai78XRI/xzdQ7A==
X-Received: by 2002:a0c:f2cd:: with SMTP id c13mr45723245qvm.11.1608158626641;
        Wed, 16 Dec 2020 14:43:46 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id r25sm1858939qtu.88.2020.12.16.14.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:43:46 -0800 (PST)
Date:   Wed, 16 Dec 2020 17:43:44 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Oliver Graute <oliver.graute@gmail.com>, corbet@lwn.net,
        miguel.ojeda.sandonis@gmail.com, grandmaster@al2klimov.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: PGP pathfinder service is no longer maintained
Message-ID: <20201216224344.h3r7wbo7fgatupm5@chatter.i7.local>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
        Oliver Graute <oliver.graute@gmail.com>, corbet@lwn.net,
        miguel.ojeda.sandonis@gmail.com, grandmaster@al2klimov.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201216220110.GA12262@ripley>
 <20201216222018.GA15600@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216222018.GA15600@casper.infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 16, 2020 at 10:20:18PM +0000, Matthew Wilcox wrote:
> > Unfortunately the site https://pgp.cs.uu.nl/ is not maintained 
> > anymore
> > and the "Finding paths to Linus" link in the Kernel Maintainer PGP guide
> > is dead. Is there any alternative sites to find a way through the web of
> > trust?
> 
> Several.  Konstantin has a local one: https://github.com/mricon/wotmate

This is how we generate these:
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/tree/graphs

> and if you want a web service, I like this one:
> https://the.earth.li/~noodles/pathfind.html

FYI, it says "The pathfinder is currently out of action due to queries 
taking far too long to respond. It may return in the future when I find 
enough time to optimize it." :)

-K
