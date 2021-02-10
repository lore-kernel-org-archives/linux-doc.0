Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAFAC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 07:37:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FA5964E42
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 07:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbhBJHhH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Feb 2021 02:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbhBJHhG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 02:37:06 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8A0C06174A
        for <linux-doc@vger.kernel.org>; Tue,  9 Feb 2021 23:28:45 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o21so650920pgn.12
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 23:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5uqtGf5CCqy66/JjwaIuuUnPenLKUmHn5v6liPl8U3g=;
        b=Qkt4U5mpREt4/WZJTjiQFW+2vn5MKF7s1E6bJTJLuXsADw65wjgDysxGSxREoTMcas
         w0Kw4wTSDps0LopEj8djJQsWdEnuEWW2+eNgYXTtp0RTidhgDNEL3Z9UF2hV5+9gvpTu
         leWZBk/+HtcSdCl5o6/aDwjURnvpL+OJS9DqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5uqtGf5CCqy66/JjwaIuuUnPenLKUmHn5v6liPl8U3g=;
        b=GqRrchHXNYknxW99JlNSSvD7yMAEpjc+hV2GppMO0Kwjbphegk/H4j1c2joqND3B1D
         yXIQUuDm9EHtd2mQ7TJ7XR89/dfQyslqmtkGW14ezDvQj5jPtYe1Ams043LCQTJzT+PZ
         Mx9srNSgFJqRWaDxB7MtldPIUR7fwUWbGgHtxTGwVZRZLc6XJ8ONz4IiE1MV/XftZF49
         PnIIPbTZVZDJWCujbggBJcxYmWnNjNkt8Sc1c9C8+pspcBtD/0zzW1q6Mn1z28DFTaoX
         RW/MAksqxbQpTfjjUHBerWQmDjNkku5+iDT6RpznVQyZcYLkgiOJ/GUns+wGKWqZ6h3p
         Gfwg==
X-Gm-Message-State: AOAM531O9UuPKZcXRyqYwz4nSDtyGCCh1AqoWA3W4aLJuxhsZz/kfhjy
        TyQCDYVIdkB2/w2bAi+eCwKZsw==
X-Google-Smtp-Source: ABdhPJwV5eOKpy0E4aeHsXAYkWpYTLdMRepjLDNbeaJUcG0z8uQOVAuVAyv61R807CcUJlcgBUctHg==
X-Received: by 2002:a62:1b93:0:b029:1cb:4985:623b with SMTP id b141-20020a621b930000b02901cb4985623bmr1754994pfb.59.1612942125460;
        Tue, 09 Feb 2021 23:28:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s10sm1166996pfd.101.2021.02.09.23.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:28:44 -0800 (PST)
Date:   Tue, 9 Feb 2021 23:28:43 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <helgaas@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        bhelgaas@google.com, robh+dt@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        kishon@ti.com, lorenzo.pieralisi@arm.com, hongxing.zhu@nxp.com,
        l.stach@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, m-karicheri2@ti.com, songxiaowei@hisilicon.com,
        wangbinghui@hisilicon.com, amurray@thegoodpenguin.co.uk,
        sathyanarayanan.kuppuswamy@linux.intel.com, hkallweit1@gmail.com,
        rafael.j.wysocki@intel.com, rdunlap@infradead.org,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Documentation: Replace lkml.org links with lore
Message-ID: <202102092327.F6D8335A7@keescook>
References: <20200627103050.71712-1-grandmaster@al2klimov.de>
 <20200630180917.GA3455699@bjorn-Precision-5520>
 <20200630140417.3a2dba67@lwn.net>
 <77cdb7f32cfb087955bfc3600b86c40bed5d4104.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77cdb7f32cfb087955bfc3600b86c40bed5d4104.camel@perches.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 10, 2021 at 12:41:44PM -0800, Joe Perches wrote:
> Replace the lkml.org links with lore to better use a single source
> that's more likely to stay available long-term.

What's the best way to teach checkpatch about this? I couldn't find the
right place to do it. (And more generally, can it also suggest https
over http?)

-- 
Kees Cook
