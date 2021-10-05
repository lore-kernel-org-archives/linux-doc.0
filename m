Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56D8C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 17:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B74DC6120F
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 17:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbhJERGo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 13:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235716AbhJERGo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 13:06:44 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F3FC06174E
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 10:04:53 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id rm6-20020a17090b3ec600b0019ece2bdd20so110186pjb.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vSYITVv9Opuwe9M6O6zYQtoXiPoiIGHreSsa+qkzCrs=;
        b=j5cNb02j9NR1tp+RRzowbUKsKgPcgcKIIDTWz2vfRGOfA1QJluBUpfEvxY/Zw9XwQp
         rc2D7mSK+OHItxR8L4OGt2sAj7HrAGTzuJHIhl4A9X4KmXxGQd9RzHQ1wBabNFuhbGlK
         Bwdil95qqISUgEvRNrOZjtyPz/5godYZAX9+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vSYITVv9Opuwe9M6O6zYQtoXiPoiIGHreSsa+qkzCrs=;
        b=RBwhX123aSC2l1+3IAJ+XzIF2mKD3q+eEv8Doi285VGWcqMtVSI8bRHB0OAj/5nLpn
         ha7uArPk8EALVk7iniD8L6U+SdQg9ar+Sgx1aP6WT5sqy1K18FIMBig52exuF5CZeJs3
         yHrJuz3CDSclbPPWQdaCl2iFZLh06PBCkGHiRykrJ4gYSe3kitAuISYO7K3YGDijV+wu
         zCq75k9MsZN3FtXHcZGvqmxgWaUWzHYtMNS6xSBoa3JomGPpoUJXL53TAIJN5ZrxRjC4
         XHNzbn/Osu9sMNYlCAYrfhvr1fv3mNdXA/2WnQeXghQF3Wxfp4wU2PCCkOr4T+g1EzN4
         mQWA==
X-Gm-Message-State: AOAM533HAosyb6iFfLclOrEm1yPQqWVTI0Dq+1PIKM4zgIIZg891D2OI
        stb2lS2Q5Pt2dv9LdhR6DjiasHEer94OQA==
X-Google-Smtp-Source: ABdhPJwFnnlqDeCEB4r6Ta4t43jY/7gO7eXD7cWifhoILGgiHrBbAxGs/fGWxKfoL5gS5Y2mIob9rA==
X-Received: by 2002:a17:902:a385:b0:13e:99e9:17f3 with SMTP id x5-20020a170902a38500b0013e99e917f3mr6231006pla.65.1633453493002;
        Tue, 05 Oct 2021 10:04:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 17sm18260614pfh.216.2021.10.05.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 10:04:52 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:04:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v5] docs: Explain the desired position of function
 attributes
Message-ID: <202110051004.C4D9EBA0@keescook>
References: <20211005152611.4120605-1-keescook@chromium.org>
 <7f6e53d04849daabd3e85c23f9974b2eb4a20c13.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6e53d04849daabd3e85c23f9974b2eb4a20c13.camel@perches.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 05, 2021 at 08:39:14AM -0700, Joe Perches wrote:
> On Tue, 2021-10-05 at 08:26 -0700, Kees Cook wrote:
> > While discussing how to format the addition of various function
> > attributes, some "unwritten rules" of ordering surfaced[1]. Capture as
> > close as possible to Linus's preferences for future reference.
> > +For example, using this function declaration example::
> > +
> > + __init void * __must_check action(enum magic value, size_t size, u8 count,
> > +				   char *fmt, ...) __printf(4, 5) __malloc;
> 
> trivia: almost all fmt declarations should be const char *

Heh, good point!

> > +Note that for a function **definition** (i.e. the actual function body),
> > +the compiler does not allow function parameter attributes after the
> > +function parameters. In these cases, they should go after the storage
> > +class attributes (e.g. note the changed position of ``__printf(4, 5)``
> > +below, compared to the **declaration** example above)::
> > +
> > + static __always_inline __init __printf(4, 5) void * __must_check action(enum magic value,
> > +		size_t size, u8 count, char *fmt, ...) __malloc
> 
> here too, and 80 columns?

Kernel standard is now 100. *shrug*

> > + {
> > +	...
> > + }
> 
> Or just put all the attributes before the storage class... <grumble/chuckle>

I hear ya...

-- 
Kees Cook
