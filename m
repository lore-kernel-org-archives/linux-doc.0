Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23D4C07E9D
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 17:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbiIWRpp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbiIWRpp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 13:45:45 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1690AE094
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 10:45:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id fs14so696762pjb.5
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1W19l9DCIdh8AdoZLG059wHQSMo4HlwOoqThHwjkRJs=;
        b=kzaeMXcRHogHx1jdPsQE/dCgpx1HAIXr3A5bw1te7bpSaoDvBbBxuGfClu9wbV0UaK
         wGJrubxOcXUPT+E9xYsoWbpPOFp9Ys6tIqUVK0BMrCTbblZ470lHxUaHYRnPXVeqNG5b
         EnWjP7/VaAl2f+jvxvAzIxss42b82HI8yccu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1W19l9DCIdh8AdoZLG059wHQSMo4HlwOoqThHwjkRJs=;
        b=PCKVL7pGp+/vVLvUIkkGo/glNAQsg4juOpxvtJ+jEIxyb4TgHDxuXw66tQDtqEAjti
         BjVIgTmSSMXDIsFjDnl+grCyWx7NTBWbepbX+uKtals45I9Yuaph10AFetBnA9SgL0zh
         jCSjYeMVapznY11bw0LXYx7hpY8LSpdoGUFrpbrt1+ZxOFURqjjcgf4PXigdB/pZOdlZ
         8iIUEFwCkwk6kmwH6gmJSsY07G8PYWGASKjZqRGJg1Jb9sXfR0yDpxll7bGS/t/EvDvN
         6Dn4VjOnopePYo4E7Dkz+KWEi641jHBMP/Py5q9id2NSz55dswrkzff8uWfnRp6hhkhS
         LMiw==
X-Gm-Message-State: ACrzQf2Yr3ls102gwcivHn6bXMVBaQX/uhnURfQ3ydBAijFoamwL3Ydk
        lh7WcFzKg5gy5w4a+F/MCJ7+wnwbBQs4GQ==
X-Google-Smtp-Source: AMsMyM51KpVTj5e0/6iXhj+Ej1quD9cSKABJOyqN4n4YbwIuC8QKpUGwuIECeN0CLsBcG/05ihNS0A==
X-Received: by 2002:a17:90b:38c5:b0:202:98df:208c with SMTP id nn5-20020a17090b38c500b0020298df208cmr22271561pjb.129.1663955143751;
        Fri, 23 Sep 2022 10:45:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p18-20020a631e52000000b004393f60db36sm5940622pgm.32.2022.09.23.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 10:45:42 -0700 (PDT)
Date:   Fri, 23 Sep 2022 10:45:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 0/4] Rewrite the top-level index.rst
Message-ID: <202209230942.E199E35F@keescook>
References: <20220922204138.153146-1-corbet@lwn.net>
 <7f02143c-461f-268b-0f17-7fe20a7423d6@leemhuis.info>
 <875yhep5l1.fsf@meer.lwn.net>
 <aa35d204-3033-96f2-ed83-c5034067fe4b@leemhuis.info>
 <87r102nnef.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r102nnef.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 23, 2022 at 09:03:36AM -0600, Jonathan Corbet wrote:
> For better or for worse, our most prominent user-facing documentation is
> the man pages, which are not a part of the kernel repository.  (Hmm...it
> wouldn't hurt to add a link to them to the front page, if and when a
> site with current man pages exists again).

Oh, yes, good idea!

> I don't have that much invested in the current ordering, we can
> certainly change it - anytime we want.  Anybody else have an opinion on
> that topic?

I think you, as the recognized leader of the doc project, can
establish some guiding principles on this, providing a bit of top-down
order. e.g. adopt a specific "Linux kernel documentation project mission
statement / strategy" that takes a distinctly opinionated stand on
anything that has been debated. For example, a strawman, not meant
to block this series in any way:

	Our primary audience is kernel developers, especially new
	contributors. Our next priority is people who want to engage
	with the developer community, but may not strictly be kernel
	developers (e.g. testers, bug reporters, researchers, press,
	etc). Next is users of the kernel, especially for how to use
	various features or configurations.

	Topics are ordered from least complexity to greatest complexity,
	with ties solved alphabetically.

	Links to development conversations must use Lore URLs unless
	they are specifically not available.

	Links to external documentation is strongly encouraged. Any
	dead links will be removed if not updated within 6 months.

	The "htmldocs" build target is expected to build without
	warnings.

It could live in Documentation/doc-guide/contributing.rst, and be the
tie-break for anything that comes up. Obviously, it, too, could change.

> I guess my feelings are that (1) I've had enough promises to help with
> documentation over the years to learn not to count on such until said
> help actually materializes, and (2) demonstrating what we can do can, I
> hope, only inspire people who know more than me to show what we *really*
> can do...

Ship it! "Patches welcome", etc. :)

-- 
Kees Cook
