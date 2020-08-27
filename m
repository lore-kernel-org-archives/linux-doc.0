Return-Path: <SRS0=ZISZ=CF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D15C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Aug 2020 14:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E6B122B4B
	for <linux-doc@archiver.kernel.org>; Thu, 27 Aug 2020 14:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PlPLu7/l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgH0O6b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Aug 2020 10:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgH0O6U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Aug 2020 10:58:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8F0C061264
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2020 07:58:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w186so3550680pgb.8
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2020 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SiJ+1XSkn95Z3h2igWcx0+w/QsGPUMBGo7zqp/bTv2w=;
        b=PlPLu7/lcUvQI9cN0uGnTKiyxN+c+Z5fPkRlrbf6sgJdVzbGBftd/B9XCzERWP286Y
         4q0aAVvERyCnDcIaSdMiBN9WrYoiHcxk1dHkGyzBEZkvC3ceSZvActjRcjUI94PJihk9
         spRcxOcEPu8OA5OJJ0OxuqQ3+cj+kUKdlVLr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SiJ+1XSkn95Z3h2igWcx0+w/QsGPUMBGo7zqp/bTv2w=;
        b=bMCn6UUCzTUO+ATgftdQbPwnNZYGVSUjEv5ga1N7dVBK0QpBQMNmMwHyfuSIwV9JF2
         LdyI0i2TfGla62y7ywBFP6xKh+ocBbuTinrE5v8CrAmTaNnevY8PMkqgZqMdVyT1iGd2
         oFs3K3TliP9bWHmYGFdIO3yX/2qfGEoK3KrnIcVPPuP+N6GeTbtOxg9h2iXFgUDbPSew
         TezO5oGSyc/BSwZv7NVJFl0dOc9YUQx0ZENkkAOluafUQ3giL0diNTAtmrnEGYUs8eTp
         8jT60YrUP5QGORaeO6d1fA8hJrVD8u5jLx2pGOsHd+r1D9O0dP6BhjRVFKdh+WEGRSpp
         A34w==
X-Gm-Message-State: AOAM530qu8b86N9A+k2vusl9tv2ZcicAM1Z8Egn05aE27SUuCU2tlHff
        SqD2VxRJMg6RNAe+owP8X/F5PM+XarEvZQ==
X-Google-Smtp-Source: ABdhPJzgptkkPSU6YX1J+orIwCKtScJOjd1LN/Tqz8ICkjngQ+Kj6C3XLm2jrBRVfpsWlr/IjkXYrA==
X-Received: by 2002:a63:5624:: with SMTP id k36mr14676688pgb.444.1598540300247;
        Thu, 27 Aug 2020 07:58:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n1sm3067247pfu.154.2020.08.27.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:58:19 -0700 (PDT)
Date:   Thu, 27 Aug 2020 07:58:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] deprecated.rst: Remove now removed uninitialized_var
Message-ID: <202008270755.5B91A3D@keescook>
References: <5e10c1645dd8f735215cf54a74db0f8dd3f6cbd5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e10c1645dd8f735215cf54a74db0f8dd3f6cbd5.camel@perches.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 26, 2020 at 08:12:01PM -0700, Joe Perches wrote:
> It's now gone from the kernel so remove it from the deprecated API text.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Oh! Right, thank you. I forgot to rewrite this. I'd like to keep the
details about why "tricking the compiler to be quiet" should not be
done. One of my fears about removing uninitialized_var() is that folks
may start adding open-coded versions to silence warnings. I'd like to
keep a section in deprecated.rst that describes the problem and why
those kinds of work-arounds should not be used.

-- 
Kees Cook
