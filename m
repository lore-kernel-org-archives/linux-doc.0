Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCD2C4727E
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 22:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70CA02137B
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 22:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Byzv6AeJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgIWWEj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 18:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgIWWEj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 18:04:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01236C0613D3
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 15:04:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s14so3285568pju.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o9zyxJb3YAqYxD1pt0TnRsOIR+iOLMDxBoDjlPXG+lE=;
        b=Byzv6AeJPfWA1igFDVfL8iEu4mRKJcmvC9DNWAMz6u4bvDVSiJo/AdAx5oxtQW44HT
         c9sYlu3kj68qG6+f1C/XmgqWC9fNoUFrUG1+4FuGCuWZn76aElV9QGR5LFtDK7LG1n4s
         S0KKHrLxO7Y4txLKfM52cWRbylh7Cbk6FwTSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o9zyxJb3YAqYxD1pt0TnRsOIR+iOLMDxBoDjlPXG+lE=;
        b=hFda44XqxM2gosWu+xqGbsosWphU81bURMJKOIHtHkvC03bdWd301oVeNAlQKWuNYR
         SQW9Cqub8OS9aloQXJm9iZZo2cYaAG3dF8s4bT2/rUBtau7igL4ZISSvaLtDnbsxNCXw
         YxSnYAlyW7tqhjCIV6FCLFIx1J01msp1fWdXxs3tNiRQJcRE0WjD18CpKlD4Czpn5BY6
         WpLYfraXcuBY+GGhlRcmLTGw3XY4aFJAZiCUK7+npgZzXJ8NHZ9hdaGnZE0j38DkEV2d
         RVo3vU28mSug6l1Yd3nOi14QRXnWkSu6OtFeV5ZG+bEJrEnTAvL8poJMu6Nu0Dn9MpnR
         92Zg==
X-Gm-Message-State: AOAM5308SzfBMei7QX4R09k67HQZeKBppOsNnbDA1uPjwKXoXdP5M9cW
        E3eYq3As8wV0+YtXimj8AtU1hw==
X-Google-Smtp-Source: ABdhPJxfhOdxjV/6Dv+xPgSHuo5M+UnACdfByFM+NtUkkbbsIYC5l0mxh2c8MQYNBvEbH6aCb813+g==
X-Received: by 2002:a17:902:d896:b029:d2:288e:bafc with SMTP id b22-20020a170902d896b02900d2288ebafcmr1697969plz.43.1600898678436;
        Wed, 23 Sep 2020 15:04:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b203sm558484pfb.205.2020.09.23.15.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 15:04:37 -0700 (PDT)
Date:   Wed, 23 Sep 2020 15:04:35 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] counters: Introduce counter and counter_atomic
Message-ID: <202009231502.20F24788E@keescook>
References: <cover.1600816121.git.skhan@linuxfoundation.org>
 <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
 <202009231152.5023C4656F@keescook>
 <599e3faa-4228-f867-46f1-66566297256b@linuxfoundation.org>
 <202009231354.3456CB141@keescook>
 <4ec035ae-efbf-d4b9-cf11-d6e3819a7edc@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ec035ae-efbf-d4b9-cf11-d6e3819a7edc@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 23, 2020 at 03:19:08PM -0600, Shuah Khan wrote:
> On 9/23/20 2:58 PM, Kees Cook wrote:
> > On Wed, Sep 23, 2020 at 02:48:22PM -0600, Shuah Khan wrote:
> > > On 9/23/20 1:04 PM, Kees Cook wrote:
> > > > On Tue, Sep 22, 2020 at 07:43:30PM -0600, Shuah Khan wrote:
> > > > I would really like these APIs to be _impossible_ to use for object
> > > > lifetime management. To that end, I would like to have all of the
> > > > *_return() functions removed. It should be strictly init, inc, dec,
> > > > read.
> > > > 
> > > 
> > > Yes. I am with you on making this API as small as possible so it won't
> > > be used for lifetime mgmt. That means no support for:
> > > 
> > > *_test, add_negative etc.
> > > 
> > > I started out with just init, inc, dec, read. As I started looking
> > > for candidates that can be converted to counters, I found inc_return()
> > > usages. I think we need inc_return() for sure. I haven't come across
> > > atomic_dec_return() yet.
> > 
> > What are the inc_return() cases? If they're not "safe" to use inc() and
> > then read(), then those likely need a closer look at what they're doing.
> > 
> 
> 3 in this series I sent. I would say I barely scratched the surface
> when it comes to finding candidates for converting.
> 
> drivers/android/binder.c
> drivers/acpi/acpi_extlog.c
> drivers/acpi/apei/ghes.c
> 
> These uses look reasonable to me. Having this inc_return() will save
> making _inc() followed by _read()

I'd like to make sure it's clear that it should not be treated as atomic
(even if it is), so a separate _read(), I think, makes that clear. And
hopefully it'll keep people from ever trying to sneak a _dec_return()
in. :)

> I will change counter to counter_simple and add a warning that this
> should only be used when atomic isn't needed. I can outline some
> tips for choosing the right one.

Okay.

-- 
Kees Cook
