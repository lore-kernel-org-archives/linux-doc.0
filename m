Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C16C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 19:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91FE323B5D
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 19:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbhANTTE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbhANTTE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 14:19:04 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A11DC061575
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 11:18:18 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id n142so9411049qkn.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 11:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=C4cTRyNK/dC7x750o61uCU/kZvdErxEIbD//IbSoOqo=;
        b=IVs5API2ULJAzAHUSiRisWWxGFJGCovscCYfVU18XbamY7/WEof8Gym2BlSktJDXBo
         AoCoxz2E3yLrkkdsNWUFxDbxQqY4B+CwmC4cfYwn409aRYG7qB1b5Y6WhgV7StJCej62
         vfcM/W63g0sDQPGmSKZJ8JsXuiaegR5ZWDedA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=C4cTRyNK/dC7x750o61uCU/kZvdErxEIbD//IbSoOqo=;
        b=nXOlJiLJSEyXMfjN9PBnZrFNShBAkSIhrPN3hEbCZ0o8hEkTcU36UxzMmsnXwG9J2I
         0S90ANiDAtsA6NOOVIYDwx8K/jFK6pr0ArW9RfqXDOjglt60rJ6anKxD+dAT3sVV8SqF
         WATaUcOPLzlwlRHBN+P4t9xNjt8UPsa11QlLHvjGKOkm0S4igw2cdfRrb/jl8cFj/mNN
         ipm5Rj+BkrlOT774SCBzVnt5JkVkTgi9mynu934aeTLvipU4LJWxBMan6ChMR+EKFknp
         xrc969n6Hi9cuzd6V7d4y7UeO+RGd3eGCg9LdzRqKXWMNX5+nvgufHsiiV1bA3O2dk4A
         thMg==
X-Gm-Message-State: AOAM532DXgBLO2dBiFvEruOVqWD1qk4idWTrTtkTu2l/JaGdEEf7JSx3
        TRrwD5Hy7e6719VGLUj+djkk8w==
X-Google-Smtp-Source: ABdhPJzmWOLSsFawh/iOlWprvRJZzLbN1iFPlFN/u1i8PPWL6QuikgUEMHCOEwWCGA62v07RPcSLwA==
X-Received: by 2002:a37:e504:: with SMTP id e4mr8561054qkg.191.1610651897173;
        Thu, 14 Jan 2021 11:18:17 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id m190sm3530840qkb.42.2021.01.14.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:18:16 -0800 (PST)
Date:   Thu, 14 Jan 2021 14:18:14 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 (RFC)] docs: discourage users from using
 bugzilla.kernel.org
Message-ID: <20210114191814.g3se2svqxtod25xi@chatter.i7.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210110121033.130504-1-linux@leemhuis.info>
 <20210111194822.4kvl2tx24anyu23k@chatter.i7.local>
 <fba45829-cac3-9f53-c753-0b08d813aa83@leemhuis.info>
 <877doht7bd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877doht7bd.fsf@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 13, 2021 at 01:17:10PM +0200, Jani Nikula wrote:
> >> Well, that said, a lot of stuff sent to the _proper_ mailing lists also never
> >> receives a response
> >
> > Good point.
> 
> There's a school of thought that this is actually a feature. If there's
> no attention, the reports on the list will just fade away and be
> forgotten. Whereas in bugzilla, someone needs to actively resolve even
> the ignored and forgotten bugs. (Or it needs to be automated.)

FWIW, it's easy for me to script this, if there is consensus that a bug that
hasn't seen any activity for longer than N months should be auto-closed with
some apologetic comment like:

    This bug has aged out and will be auto-closed. Sorry that it didn't work out.

    If this issue is still present in recent kernel releases, you may need to
    reach out directly to subsystem maintainers in order to get their attention
    regarding this problem.

    Please do not re-open this bug without the above step, as it will simply
    get auto-closed again in the future.

> Attending to a bug database of thousands of open bugs takes a huge
> amount of effort, and if the bugs aren't being fixed, a lot of that
> effort is just wasted. If a bug doesn't get fixed now (or soon-ish),
> what are the chances it'll get fixed months or years down the line?

Well, it's *possible* that someone comes across that bug during their research
and adds enough additional information to get it fixed. However, this is
extremely unlikely and it's better to just open a new bug anyway.

> Just musing, has anyone else seen a shift in bug reports from "I'm part
> of the community, and I want to help improve this stuff" towards "I'm a
> customer and I demand support"? I don't think the kernel community can
> really cater to the latter very well, and would be better directed at
> distro bug trackers.

I haven't seen any specific change like that. One good thing about bugzilla is
that people who do file bugs have already overcome significant barriers to
sign up and navigate the quaint, decades-old bugzilla interface -- so their
bug reports tend to be generally well-written.

-K
