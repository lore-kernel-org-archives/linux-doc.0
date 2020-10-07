Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C587FC41604
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 20:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 569932083B
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 20:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nEyvZX+2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbgJGUbA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 16:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727776AbgJGUa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 16:30:57 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743D2C061755
        for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2020 13:30:57 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c6so1597283plr.9
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2020 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pd+/ZpbnBV5l9qExxGdnTHpTNEUm5cV1GzwUJ6tqh44=;
        b=nEyvZX+2vjJOueDyZuWbV5vWft8TAIWEiARMuJgcgQhpHDYfg/KPbHubPg2PDWezaZ
         CKhFhBlogdbkd18w3DAOu7i+iectLFDenZL7hG/CtyzfjFRAwIPw+/2LGozuMjeuSxnF
         ASu4OJZ8TJPnCw3XwDkRKi+7pFaKpqChLq86E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pd+/ZpbnBV5l9qExxGdnTHpTNEUm5cV1GzwUJ6tqh44=;
        b=fQC61Nzue7MSzhS+6r/lmtnU6jLmUkblcMBWMD98ybpFgnNEGnEbgx3ecNHxqTymPi
         qKuNau4FJU41OhXRbBe4tB+fS75E2htl/8BBJ0FdCx13/w60G88/PbhyC+A+ZBjPHHbv
         9OZYTXuHvbkcmS74Td73q3bq5PLBFzVENmDhTzB/7AC2HNGz/XzyZUZtBBSni3HPhx8V
         chExfWAIIUE/6VNrBQnDbDPYZH5y/ayEzOSSnZTn284mrdNNDHSTW0CPQeFLf0lxMl9X
         zXeiVYLwBZMy3FUFiLDL09xf0c0IzkqXwTPHKVi2/IOJ9vNo0+kZaikn6LM0OHi/QZg8
         UgRg==
X-Gm-Message-State: AOAM531MXhkRZiReaEEnuqCAs6J3k5fpPPTJe7LgmpLeUh/WojbB8ZXX
        5t93TVJ8Frl44JQedNDeqWlxRA==
X-Google-Smtp-Source: ABdhPJxvzB5CQqKYSVpxXRdbhDUgduIv9j3T0qsKxz8w/h/kbw9HaWwcBy6dbTfM/ADqztFMkbJNtg==
X-Received: by 2002:a17:902:a5c6:b029:d3:8dc1:5240 with SMTP id t6-20020a170902a5c6b02900d38dc15240mr4478706plq.16.1602102656996;
        Wed, 07 Oct 2020 13:30:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j8sm4324781pfr.121.2020.10.07.13.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 13:30:55 -0700 (PDT)
Date:   Wed, 7 Oct 2020 13:30:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] counters: Introduce counter_atomic* counters
Message-ID: <202010071329.90E96DC2@keescook>
References: <cover.1602011710.git.skhan@linuxfoundation.org>
 <cbace4e3f504359bd017a7fc2aab62178a1550ed.1602011710.git.skhan@linuxfoundation.org>
 <202010071056.E4804235E@keescook>
 <f0939f9d-d60f-7a97-31bd-e527c79ce284@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0939f9d-d60f-7a97-31bd-e527c79ce284@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 07, 2020 at 01:26:53PM -0600, Shuah Khan wrote:
> On 10/7/20 12:11 PM, Kees Cook wrote:
> > My instinct is to say leave it "int" and adjust documentation, which is
> > the least disruptive, but I am enticed by the desire to make sure a
> > counter doesn't "misbehave" and go negative when the usage wants it
> > always positive.
> > 
> 
> I would recommend leaving it as "int". Changing the API to unsigned has
> other ramifications and cascading changes.
> 
> My quick search shows me there are 612 atomic_inc_return usages and
> 14 out of them are forcing the return type from int to u32.
> 
> For atomic_read the numbers are 51 out of 5833 forcing u32. We have
> couple of options:
> 
> 1. Update the documentation since we have more cases where
>    int is just fine.
> 2. Add counter_atomic32_inc_return_u32() variant to cover these few
>    cases that are forcing the return.
> 
> I recommend going with option 1 with Documentation update and add
> option 2 when we convert one of these 60+.

Agreed: 1 seems best, and then later 2 if it feels justified. :)

-- 
Kees Cook
