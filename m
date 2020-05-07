Return-Path: <SRS0=NPh6=6V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DFDC38A2A
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 19:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5147F208E4
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 19:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oe0PU5NZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGTpo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 May 2020 15:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726326AbgEGTpn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 May 2020 15:45:43 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859C6C05BD09
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 12:45:43 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b8so2362581plm.11
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IbfxBGzYrCHzzfTqHU4rAuwYtieZW8IZ52DJWF9xsUo=;
        b=Oe0PU5NZ2azBtHLJKpX3ha1q5sVBZ4ZHO+l13jT6Erh0ACOWTwKch462jXBcFXyD24
         s/knbIwKHieGmlCElrOSj0hDSdIyuGY9V7VyJlbqfYR/GtTzoLQNjVaFkcRQYiSY3Hh+
         93C47ECe6RAr7s+FMJPAHvDax6a3hMvgtnLag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IbfxBGzYrCHzzfTqHU4rAuwYtieZW8IZ52DJWF9xsUo=;
        b=kSiUDnWCjEX8rE6p9XqgY4fO4m/NmTOKOjbp8Tkc5qCY+D3Be1rGWmaHi/zgW0WFFr
         Q4jPuvrFPcZ7DdywnAFwYLoxBhngo635c+pMWqjz1X6krwUJWq0cXxoQanTj7hzHfLXe
         Dz4FRhC4HseyE7PZxl5tFxPqoATD98IhljJnV48mHb8u+6VnLymjqOudw+/YChxsk/gJ
         4NWnjTRhVz/VVis1pKr/OAKo19l8Os+aXhBrdiLH9qhbmAhTaqfC9XSAS+ns6gfQT10k
         EDM/HD3LW7p8kCXQAvx/LmnQZzewHxyVGJXvlaTE8UktkvDGYz3czlcj6y2Tl2hVXchl
         xuNQ==
X-Gm-Message-State: AGi0PuZU9ZD49VbSFGtyJ1nG84PCYISYiKO16qyHaPwCARmnc/JjF05f
        A7jm3veKAt/mp9NQQZqL7gpAQA==
X-Google-Smtp-Source: APiQypLBhRh1xD+zBIxgBZHXiwlmz2uQ7tdEn6c4Ababtg8mWoyu4ca2B3WYR9T4i3qlo9eH8sYYZw==
X-Received: by 2002:a17:902:eed1:: with SMTP id h17mr14686969plb.312.1588880743038;
        Thu, 07 May 2020 12:45:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l30sm536526pje.34.2020.05.07.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:45:42 -0700 (PDT)
Date:   Thu, 7 May 2020 12:45:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 00/11] pstore: mtd: support crash log to block and mtd
 device
Message-ID: <202005071244.AAD82F41F@keescook>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 25, 2020 at 04:54:55PM +0800, WeiXiong Liao wrote:
> [PATCH v3]:
> 1. patch 1~10: a lot of improvements according to Kees Cook <keescook@chromium.org>
>                including rename module, typo, reorder, rewrite document, bugs
> 			   and so on.
> 2. patch 11: rename funtions of pstore/blk and update document.

This is looking good. I'm going to update it for the recent max_reason
series, and make some tweaks here and there and send out a v4 tomorrow
to see what you think. Thanks for your patience!

-- 
Kees Cook
