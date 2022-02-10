Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A44C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Feb 2022 17:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245269AbiBJRnX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Feb 2022 12:43:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245285AbiBJRnU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Feb 2022 12:43:20 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1917325ED
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 09:43:21 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso9276456pjt.4
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JWTciHa8tMED3FXA+Ogdt6wVZFyYQZwP+ShqeFRit+I=;
        b=Ck3LZGNu0+N7P6xsV9DDei7cJLvODVs1BnOzvk0bszpoiLl6jJyJGZ2+30GWFFu9jz
         5/O7MdvbVHxjTB0K8wZMEsvKndsWprLvwjfAeMdDhiGY/8VADLXqmH/vR5HlpstEvzMm
         4oRjk2qpDWkgSUR+DXT4SyThiJjLHLqZFdUqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JWTciHa8tMED3FXA+Ogdt6wVZFyYQZwP+ShqeFRit+I=;
        b=3YSV2HK1ewyIaaECAuryF9GFh+dXryMtSm+sUhWngQzfM/eo3RSd/3nGUhaR19zID4
         J/o05hxiA2RQlvK5ZKOBjLotbmi0SzBEKLeEX3twVaRZw3gajs0+wKFfK9tsHEE/7AbP
         ulvT5A+GqUVgA9tPPlyBt6uNBi7OrVaawmnMfsb537bu9ymw0eiZz1BApGcBJbyEcIK1
         zcaYOmczro/S4mM/Sqt28jA8aoWusG7d+BeZ6/ssd8zWyGw1VVbAVx4lldpxSkWXI+a3
         ZAZkeAplr07rPchfqKiud8hncSaICZSawEmRa4DbEJosL8jJaikSC2F2vuHeIIhknD3I
         sFTA==
X-Gm-Message-State: AOAM533e1WtohvqJxWLNn0v6UumJLc7CCAE5oXQZtjoeZwAfFf24Mm3O
        l0ThyR8/Ucmxirg2lwvEf+Whsg==
X-Google-Smtp-Source: ABdhPJwfu2aJvaqWXY1aRdvOiBamWd2wXwn64hpgV8EqWsUme9kFg4luF0ZxCPobzkh3kcfPGwXuPw==
X-Received: by 2002:a17:90b:4c52:: with SMTP id np18mr3975968pjb.49.1644515000573;
        Thu, 10 Feb 2022 09:43:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q16sm24645520pfu.194.2022.02.10.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 09:43:20 -0800 (PST)
Date:   Thu, 10 Feb 2022 09:43:19 -0800
From:   Kees Cook <keescook@chromium.org>
To:     frowand.list@gmail.com
Cc:     Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Rae Moar <rmoar@google.com>, Tim.Bird@sony.com,
        Brendan Higgins <brendanhiggins@google.com>, rmr167@gmail.com,
        guillaume.tucker@collabora.com, dlatypov@google.com,
        kernelci@groups.io, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Documentation: dev-tools: fix KTAP specification
 build warnings
Message-ID: <202202100943.3E8C5B4B@keescook>
References: <20220210023519.3221051-1-frowand.list@gmail.com>
 <20220210023519.3221051-3-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210023519.3221051-3-frowand.list@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 09, 2022 at 08:35:19PM -0600, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Convert "Major differences between TAP and KTAP" from a bullet list
> to a table.  The bullet list was being formatted as a single
> paragraph.
> 
> Add missing required argument in code-block directives.
> 
> ---
> 
> Table conversion suggested by Shuah.
> 
> Patch 2/2 not previously reviewed, so Reviewed-by tags not provided.
> 
> Changes since version 3
>   - Add this commit (patch 2/2) to the series
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
