Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B38B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Sep 2019 21:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388050AbfIFVdv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Sep 2019 17:33:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53707 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfIFVdv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Sep 2019 17:33:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id q19so7869885wmc.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2019 14:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kragniz.eu; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8lEHoZAxZRxpTMRYBgPVsjVs/tSBcLbaOLSEdPXXZZc=;
        b=JS1TGHU5NCROSoRlcU+zIbbKnd6aj8LivEAdS2CcVkX0z1qQVenhkOeRmkvYTN6Guw
         rJ6hvVPBAuVge5tk/EsMUzgG74J2krUU/QOyTIY3V2AI+9To9NVX2sjcz3Wwk04pJS7j
         a9n9fg/8vOvU+Kc6nqnzKHh93EYlccRCPvl2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8lEHoZAxZRxpTMRYBgPVsjVs/tSBcLbaOLSEdPXXZZc=;
        b=C8Ts6Wo1edS8/UmZCISarNt/lrr02jJndaWAAP7yEa50X+HCkhlqHapWqh03ghwCGf
         UpsYqF7ZOh/AZLCzb+EdbHQx/2rcQCgj0Mw2WsoKcLvBdvTVrocTKsQVxllfvq02qiWI
         TDW0ojweBjM0il3nfb1kHGRx4FVvB8vxRzqutPszQIHgIJj9rfn7RmdWT+dgUaIpJFZb
         loFOuE/CEkmTD+XURHeCgNKwbAEFafL7A8IjD9gjPYPXtiY5ZPZenDcFox+QU7YMRL9l
         0kQSNhs2RyZmcJe2D0BBLO/Mwac+LP9pL+gPP22oe3bySZURbh2PwEBEzZx4BO6RhKWZ
         ODlA==
X-Gm-Message-State: APjAAAVm8Cn7sVrRAgr8YfbHhfG7HlpAbuCKFin7dSSiJ0s3Z3v7BUvj
        2ujBZK/sLBlxf5SccE932UA9gWbiMz9GWA==
X-Google-Smtp-Source: APXvYqwtwcDoMFYDRFk3ANIzceYfQKr1FNj3yo8H7jd6Uy/Qvcr77d1HfLaTahHYQ1RunFQCZxvVtQ==
X-Received: by 2002:a1c:a8cb:: with SMTP id r194mr8842529wme.156.1567805629375;
        Fri, 06 Sep 2019 14:33:49 -0700 (PDT)
Received: from gmail.com ([2.31.167.169])
        by smtp.gmail.com with ESMTPSA id 189sm9895231wmz.19.2019.09.06.14.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 14:33:48 -0700 (PDT)
Date:   Fri, 6 Sep 2019 22:37:29 +0100
From:   Louis Taylor <louis@kragniz.eu>
To:     Joe Perches <joe@perches.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: printk-formats: Stop encouraging use of
 unnecessary %h[xudi] and %hh[xudi]
Message-ID: <20190906213729.GA18504@gmail.com>
References: <a68114afb134b8633905f5a25ae7c4e6799ce8f1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a68114afb134b8633905f5a25ae7c4e6799ce8f1.camel@perches.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 06, 2019 at 02:11:51PM -0700, Joe Perches wrote:
> Standard integer promotion is already done and %hx and %hhx is useless
> so do not encourage the use of %hh[xudi] or %h[xudi].
> 
> As Linus said in:
> Link: https://lore.kernel.org/lkml/CAHk-=wgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4TC=20e0Q@mail.gmail.com/
> 
> It's a pointless warning, making for more complex code, and
> making people remember esoteric printf format details that have no
> reason for existing.
> 
> The "h" and "hh" things should never be used. The only reason for them
> being used if if you have an "int", but you want to print it out as a
> "char" (and honestly, that is a really bad reason, you'd be better off
> just using a proper cast to make the code more obvious).
> 
> So if what you have a "char" (or unsigned char) you should always just
> print it out as an "int", knowing that the compiler already did the
> proper type conversion.

Yeah, makes sense. Sorry for adding these in the first place.

Reviewed-by: Louis Taylor <louis@kragniz.eu>
