Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 74D8D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Nov 2019 23:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfKOXSZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Nov 2019 18:18:25 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40710 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfKOXSZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Nov 2019 18:18:25 -0500
Received: by mail-pl1-f194.google.com with SMTP id e3so5691683plt.7
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2019 15:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RsYCJx3mo6o+dlAUH6eKBNdl3JUc2iayWONqTUcDO64=;
        b=JPT6SPexOBg2zFlKDEjAWjjBdnhMhvYrQnaZbO/rpZNa8P2VcwgywY7bjezboB9KRH
         gEHsWFzjCcXZs26hAPAD2+Bqf7ATJOmtEXDKfhwv4zHOZ0yG0nlU/cykSBp9/azAJKaG
         4nNq0EfBnzC39eqzA5tvTPD7omSyTIBv1rhYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RsYCJx3mo6o+dlAUH6eKBNdl3JUc2iayWONqTUcDO64=;
        b=GVSbk4IGADCXNGP7khlKWajoyMXk/g2DtWOMDCLIJZ+/AuoG8AgzysKxRoC5WlenBy
         mLfc0Nj4vcDR0lfuyRTnUr0jEK0yQ10BaUQx3kwQifAmGTbVbWW9LJOUj8YLTdBJ6H4L
         9WLuvaNuWSqDXQvjwhtT64349Z9UdNicum0fQX1yHMFrtfwROMn8DR8vosQNu4+8sm61
         u3S0Re9L1fOiapdC8X2dVo0AQNZOXP1VJfovVRKLRW/vYV/IgWtsyoy/Vsm95v/TjZtX
         iOhFNsSG4LqPh/5lr2t0D4jvOYfFzWau4ptJeUZshLB/w4XQDxmcgSuGjePlk6+mat8y
         SkbA==
X-Gm-Message-State: APjAAAUG9Q0aIN6qUN1V7JitXxGpHbY+rDf7G1Q+YsKRDETv6soWnuLy
        GXee1pVTRS7hy0BqjZFRYjwQQva5QUY=
X-Google-Smtp-Source: APXvYqxKbqJ014bs4u2udExJX6JJuG35wv+WUTRA+F1NszeB0QMz4Hat/YAuO76snRTQWLPYJ+x/IQ==
X-Received: by 2002:a17:90a:2942:: with SMTP id x2mr23128339pjf.119.1573859904941;
        Fri, 15 Nov 2019 15:18:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z4sm11360460pfn.80.2019.11.15.15.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:18:23 -0800 (PST)
Date:   Fri, 15 Nov 2019 15:18:22 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Document how to get links with git am
Message-ID: <201911151516.94D79DFB70@keescook>
References: <20191115133021.13165-1-linus.walleij@linaro.org>
 <20191115130017.46d77037@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115130017.46d77037@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 15, 2019 at 01:00:17PM -0700, Jonathan Corbet wrote:
> On Fri, 15 Nov 2019 14:30:21 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > This adds Kees' clever apply hook to the kernel documentation so
> > it can be easily references when needed.
> > 
> > Cc: Kees Cook <keescook@chromium.org>
> > Link: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-July/006608.html
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Seems generally useful.  I have a couple of overall questions...
> 
>  - Might this be better placed in the maintainer manual?  It is more
>    likely to be relevant to that audience, methinks.

Seems reasonable.

>  - I wonder if the hook script should just go under tools/ somewhere for
>    people to grab.

Do we have anywhere to put these kinds of things, or do we need create
something new?

-- 
Kees Cook
