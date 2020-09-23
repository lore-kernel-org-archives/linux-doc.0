Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3DFC4727F
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 20:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23525206B2
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 20:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kkJi2xE9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgIWU6g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 16:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIWU6g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 16:58:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350EBC0613CE
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 13:58:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f18so401300pfa.10
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HTWiHb6gAj8Z8llT/G3EhR3u0c6leg5SleJXuet+BB8=;
        b=kkJi2xE9F6GNVPSdOt/CDrDavOwemWgU8pgHsYleCWQ9ay7rAZwnIjKoU2qKUlVpgz
         eFdUMRympKM8I0L49ut8Q/ioCijl1kSTPIz+hRTFEjtUtdo1ctsv5rwKE++2QBRgTHYW
         CvK2KaUAe1N5R6jzztmvnt7PLRCfqDX6fRFus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HTWiHb6gAj8Z8llT/G3EhR3u0c6leg5SleJXuet+BB8=;
        b=IpSgAvOpWi+AmBV6Q0oHVkdFB9kFphSgv67b8LpfG633IEYcWte84fox5GZRghG3gx
         at2RzWcznOD9BxUyJM+MrHMWeERCkDRyE9wx1eQRU1bKi4CJHAP++8RgxA705v5GYUw1
         OOTRW26w9Mop8JbK0rbBsUYbxcKUZMUTIOVYvXRYLjOlF+vs/K77Jqyi5Fg7meStwJ0F
         iEEHYFK7ofNsj9vfSmuCB5lqVQewX22qMtbrrHEfMtrD6gQRd/MRGfmmqs3a6sb5iRON
         7tpRBKiAgaqp6ePbrKHptvF4v9EkI2As2ASubEeL1wqmxlRiylPkMwjegfcfyUVL2TYb
         gfug==
X-Gm-Message-State: AOAM531OWu3ilTJkOLZIafI8xq24zKiBYD0XDwcAnREq0AajIdkvCaox
        7Fp+fXrIjydOKKycAj9N2IYFPO2oqRvyrwfU
X-Google-Smtp-Source: ABdhPJyhYRkdhdAP+zcAthdKp5UM/HYFmn/Q1GmM+HLMtobEh6R/yGHM3nomGFFs2mIjEEFjiu+sRw==
X-Received: by 2002:a63:d242:: with SMTP id t2mr1339749pgi.47.1600894715692;
        Wed, 23 Sep 2020 13:58:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i2sm532018pfq.89.2020.09.23.13.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:58:34 -0700 (PDT)
Date:   Wed, 23 Sep 2020 13:58:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] counters: Introduce counter and counter_atomic
Message-ID: <202009231354.3456CB141@keescook>
References: <cover.1600816121.git.skhan@linuxfoundation.org>
 <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
 <202009231152.5023C4656F@keescook>
 <599e3faa-4228-f867-46f1-66566297256b@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <599e3faa-4228-f867-46f1-66566297256b@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 23, 2020 at 02:48:22PM -0600, Shuah Khan wrote:
> On 9/23/20 1:04 PM, Kees Cook wrote:
> > On Tue, Sep 22, 2020 at 07:43:30PM -0600, Shuah Khan wrote:
> > I would really like these APIs to be _impossible_ to use for object
> > lifetime management. To that end, I would like to have all of the
> > *_return() functions removed. It should be strictly init, inc, dec,
> > read.
> > 
> 
> Yes. I am with you on making this API as small as possible so it won't
> be used for lifetime mgmt. That means no support for:
> 
> *_test, add_negative etc.
> 
> I started out with just init, inc, dec, read. As I started looking
> for candidates that can be converted to counters, I found inc_return()
> usages. I think we need inc_return() for sure. I haven't come across
> atomic_dec_return() yet.

What are the inc_return() cases? If they're not "safe" to use inc() and
then read(), then those likely need a closer look at what they're doing.

> > > +There are a number of atomic_t usages in the kernel where atomic_t api
> > > +is used strictly for counting and not for managing object lifetime. In
> > > +some cases, atomic_t might not even be needed.
> > 
> > Why even force the distinction? I think all the counters should be
> > atomic and then there is no chance they will get accidentally used in
> > places where someone *thinks* it's safe to use a non-atomic. So,
> > "_atomic" can be removed from the name and the non-atomic implementation
> > can get removed. Anyone already using non-atomic counters is just using
> > "int" and "long" anyway. Let's please only create APIs that are always
> > safe to use, and provide some benefit over a native time.
> > 
> 
> I am with Greg on this. I think we will find several atomic_t usages
> that don't need atomicity.

If you want to distinguish from atomic and create a wrapping "int", how
about making "counter" be the atomic and name the other "counter_unsafe"
(or "counter_best_effort", "counter_simple", ...) etc?

> > > +	end_val = counter_long_dec_return(&acnt);
> > > +	pr_info("Test read decrement and return: %ld to %ld - %s\n",
> > > +		start_val, end_val,
> > > +		((start_val-1 == end_val) ? "PASS" : "FAIL"));
> > 
> > I also see a lot of copy/paste patterns here. These should all use a
> > common helper.
> 
> I knew you would ask for helpers. :)

Heh. inlines for everyone! ;)

> Yeah will do.

Awesome!

-- 
Kees Cook
