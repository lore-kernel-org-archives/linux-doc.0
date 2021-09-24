Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB651C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 24 Sep 2021 21:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6F5961076
	for <linux-doc@archiver.kernel.org>; Fri, 24 Sep 2021 21:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343550AbhIXVru (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Sep 2021 17:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244770AbhIXVrt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Sep 2021 17:47:49 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10943C06161E
        for <linux-doc@vger.kernel.org>; Fri, 24 Sep 2021 14:46:16 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x8so4582350plv.8
        for <linux-doc@vger.kernel.org>; Fri, 24 Sep 2021 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pj9R2irEWaO0s1+n+LsLmweXYY63Hpa6KiQfqiA0N2E=;
        b=blNaN+UKBFauXCPwp7waJ+lVReCH+8D1Vxvu6ZpDLEYwbmXskSTlyi7u2crkunxzrv
         z60arbLXR5+C2OqJZxp9PgeOC+Ad1F+woM2GVGRzUeSXWM08Ev0qwLafjJSk2szllV1S
         ZAXAwx332SBfogEuG6yPs92Yj665v9+S27ifg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pj9R2irEWaO0s1+n+LsLmweXYY63Hpa6KiQfqiA0N2E=;
        b=b9FCWZZvYUCtYZV2Vnz4IQH3GcuSZMliHzRSKpLoN5aMRsYITljybTusmLuEAyyDN3
         Uuc+Arck+sycYPeIAuo1XRjB+p532lBREq1HzrCWmZCzNorvNyNzB+5vWDzH/kXl6ae4
         95R+9UG+LRt5Ae87VbzVwWtwyCwc6F87YpyPBlgmYSSofC3672uucHU0/WjGcgqoCbl3
         1Z/VaxA6ofGT+5YjStUVWsJzhXiUI7/2vGqjhW/yfhF0CHhurKkhFVlX/0AtVNqpu+5N
         s8rFZQ5hIQXAU6IR6zp+syMwY1F0lnNjQHXA0hjrn5dAWbWhc7Zu3Co3LN7gNM+7irAO
         Bfmg==
X-Gm-Message-State: AOAM531KSlWIxfUXlfAaPRvWKXy6+TSCQA9DZIc2sUhilHGTvjd8S0bT
        xX82wdbrCS9yg5P/rTwmoNtdPQ==
X-Google-Smtp-Source: ABdhPJyTj6m731cSp4Hd3lineRhJPbqmoPR3Z1ORTW1YqObWYHJWp28Pw5w+g61tc1vDtrl4YN13rQ==
X-Received: by 2002:a17:90a:ee82:: with SMTP id i2mr4752094pjz.166.1632519975624;
        Fri, 24 Sep 2021 14:46:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o15sm10414469pfg.14.2021.09.24.14.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 14:46:15 -0700 (PDT)
Date:   Fri, 24 Sep 2021 14:46:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] docs: Explain the desired position of function attributes
Message-ID: <202109241441.20B7EE4B@keescook>
References: <20210924202302.2335542-1-keescook@chromium.org>
 <053717cf-e1b3-15a4-97e6-e72848f6d7bd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053717cf-e1b3-15a4-97e6-e72848f6d7bd@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 24, 2021 at 01:27:20PM -0700, Randy Dunlap wrote:
> On 9/24/21 1:23 PM, Kees Cook wrote:
> > +The preferred order of elements for a function prototype is:
> > +
> > +- attributes on the preceding lines
> > +
> 
> I thought that idea was already nacked: (it's more of a BSD thing AFAIK)
> (and I would NAK it if I could :)
> 
> """
> > Attributes should be on their own line, they can be quite lengthy.
> 
> No, no no. They really shouldn't.
> ""
> 
> from: https://lore.kernel.org/mm-commits/CAHk-=wjS-Jg7sGMwUPpDsjv392nDOOs0CtUtVkp=S6Q7JzFJRw@mail.gmail.com/

Right -- and then Joe and Rasmus had some convincing counter-arguments,
IMO. So, given the outlined Docs patch, I'd like to see what folks can
propose in the form of alternative patches for this topic.

I genuinely don't care. I just want to have something I can follow for the
refactoring of the allocator attributes. :) The trouble I had with Linus's
suggestion is that some attributes don't work[1] at the end for function
definitions, so I'm left unable to follow his recommendations too.

-Kees

[1] https://lore.kernel.org/mm-commits/202109211630.2D00627@keescook/

-- 
Kees Cook
