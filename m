Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4FBC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 18:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbiGFSqP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 14:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiGFSqO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 14:46:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CBF2612D
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 11:46:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id m16so4896782edb.11
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ArQRj5zQtcHaydnmWOW5hB+rAM/OvX+j6DP4yVvvY38=;
        b=SfC0Ow+BAevij9wNFnjUlGAUPxxIuQEyx9vRw9qqiXZppQrwgiDm9b55bo37nbGfv1
         etksABI3SWnauwd6TAc1VJM0LxeH9kM6/P+tAnFUjebkUyHDlS1+ccblLwWqAHJisuFa
         Zv3+Jrqqc2yU9F+WJYGQcmwTNkUVNkf/QoHI0I2DNiJqLbmuPc/9Kvd8+Z2MyzpXBK1Y
         YULaJbBAHG2B1oiNNz/QJmBT9dFi7h07Zkv/+hqUh4XdkDXVar0mre/nbW1IpLvYiNN4
         ccTlhrEiPWDRQZ0DC/oAW6RVEPPJV+x3RZcQ8jBndwRH8burEyoKqhVuQbFLA52TWA3G
         uP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ArQRj5zQtcHaydnmWOW5hB+rAM/OvX+j6DP4yVvvY38=;
        b=GarQXZB6/Uf/qrmhJ1BWf968r0SLU5MMGWwDupkr/rCKFTi9dN7kH35Jnb9AdJ30nX
         FjUT9V9gGqRyBAppKCgJKU6Z1KoZ9cxx+cGJbjAV9n4enRcDWAkCKFTNFEwR3Blw6QD3
         208mBnofXJedJ+bb3eegeGVWyCS8md58xljNRF+3/JSzicxZN8N3Xrmdpi1tSvi4xl+a
         ZOvmvFMPusZHZaerXUucaVhLjJtsfI5vgbS4L4n4yVAd+p4UdFH8wJf0GUSQPckbSkIr
         6xec9Jy8hgJlYrhf7srvhbr1BObrpIr8f71zuqx8xlx1vRrejp8GYYiHLW2+SBffmrCD
         HNXg==
X-Gm-Message-State: AJIora8wxuffFNJNAj7xHN9FR5qnSAyAFzPtFapNpv/Q2l+RLicHGwkx
        ZdjBii6U+WshLG67kKIctDyYW3bV6qoBZJgV3MWe0w==
X-Google-Smtp-Source: AGRyM1vmlS6JeMg7FkIAaxA4ps9qsKFG6dUJPPUMkJnxDLKjk7ynSMQRPEC1KauAfgG9ktfePccDwQOt9xt4Klwfq/0=
X-Received: by 2002:a05:6402:90a:b0:439:c144:24cd with SMTP id
 g10-20020a056402090a00b00439c14424cdmr33061862edz.209.1657133171655; Wed, 06
 Jul 2022 11:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220702051205.3292468-1-davidgow@google.com>
In-Reply-To: <20220702051205.3292468-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 6 Jul 2022 14:46:00 -0400
Message-ID: <CAFd5g47AVBUV8qdWF0B_oY8EMwTE85apv3b+nSsQu=bOZV=o4g@mail.gmail.com>
Subject: Re: [PATCH] kunit: Documentation: Fix a kernel-doc reference
To:     David Gow <davidgow@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        Martin Fernandez <martin.fernandez@eclypsium.com>,
        Kees Cook <keescook@chromium.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 2, 2022 at 1:12 AM David Gow <davidgow@google.com> wrote:
>
> When building the KUnit documentation, the reference to
> kunit_test_suites in the kunit_test_init_section_suites kernel-doc
> comment gives an error:
> Documentation/dev-tools/kunit/api/test:9: ./include/kunit/test.h:323: WARNING: Inline interpreted text or phrase reference start-string without end-string.
>
> This is because the reference is mixing two function reference styles:
> adding an '&' to the front, and "()" to the end. The latter is neater,
> so get rid of the '&'.
>
> Fixes: 9bf2eed995f9 ("kunit: add support for kunit_suites that reference init code")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
