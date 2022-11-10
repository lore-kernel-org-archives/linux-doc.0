Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4059C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 10 Nov 2022 16:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKJQE0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 11:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiKJQEZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 11:04:25 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22E4175AB
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 08:04:24 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id 13so6202626ejn.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 08:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hFaoVWX3RPLpACkyedBV3PTT5TMZWxPD/ZAqJUgyn/4=;
        b=sU5cwCgeyQCJm0kHPrAsrs7Abf5eyH0+ZHOohF8AwyBR3OR5Q/Q/dIs3vmXOLPvREJ
         4UJycZDcZp2evi0vIe3xVNlCLbfVKshwTqBnn/XK/641byYkNJro75KmRnYnkdyCybQ8
         9TPHT0EqAXOxN/OoC0ONxvHuKAbLnRtWsPx6L0ro6hf78bh4kH8PKbfpa+yJOidv7UBN
         lidi3qlCaPmmgY08f7H+Ugp45YwfktAF8FJc5OheO4wuJN1B4s26RcfGk3rJHKJFbyHC
         m9KBpXPdr6UPU+exj5Of6FOmoTQ7OhAwNoDdY3gVy7r7rYuTKYdNvOkUER7i0aNIyLdN
         1/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFaoVWX3RPLpACkyedBV3PTT5TMZWxPD/ZAqJUgyn/4=;
        b=Lqw4/01uzXU+PMgXSb/kLFnZWZnrJvjNmXeFvFwldt9TSR4SCuqRbkXutHwVIzO9pe
         +M6tI5xsXWrewtCnwTGQ9PgK1SMfIK83eBQ78wOHO+XMStvEwK3/94KMcG3MHXlGAF06
         LCo9LUDKM+wMn64gi1PXXHlTdbQAPdenN7R8dmpdrF3RF0OIyu/Pw6BSPcW0/6/YUw2G
         jVE2Yye5m5qd/ZTn1/u9mG8vTBwm4Wzqe7QmSg3JYO/yhZqJZYPAN2DMZ/lnjJvhBzJi
         mmFJE+c3rMzoo4fuIofaK1HBIm4ZIKATcweyeuOjIEB8rj4kQVXAjW3cUv+4DZhnkv+9
         GwZg==
X-Gm-Message-State: ACrzQf1QD24taan+99oeeGfwHJ/F70Ldci3de9M1D+Ot2F7QtASE4QSx
        azhYSAyilrr97oErKYTViHHTcGA0Fcz5BI0iahOZqw==
X-Google-Smtp-Source: AMsMyM6LZ8JNPCa+UcFxwSnLJws0uMTCDx0ty9yOsqIGpd7DCq+IG97vb7GoLiUbIifxDJ2i0xjUniuW8Ul5KhiI+iI=
X-Received: by 2002:a17:906:3bc1:b0:78d:8cf3:6ae with SMTP id
 v1-20020a1709063bc100b0078d8cf306aemr3101932ejf.173.1668096263221; Thu, 10
 Nov 2022 08:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20221109003618.3784591-1-dlatypov@google.com> <20221109003618.3784591-2-dlatypov@google.com>
 <CAO2JNKUTiVM8YPgy0nz7W1GJtSVURhc1YkMgUWgs-rShNY0Zaw@mail.gmail.com>
In-Reply-To: <CAO2JNKUTiVM8YPgy0nz7W1GJtSVURhc1YkMgUWgs-rShNY0Zaw@mail.gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 10 Nov 2022 08:04:12 -0800
Message-ID: <CAGS_qxqPUHWyJ4nNQRdm79sMwHwysHV=99WXzMsY=g_WzSjZaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: KUnit: reword description of assertions
To:     Sadiya Kazi <sadiyakazi@google.com>
Cc:     brendanhiggins@google.com, davidgow@google.com, rmoar@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 9, 2022 at 9:07 PM Sadiya Kazi <sadiyakazi@google.com> wrote:
>
> On Wed, Nov 9, 2022 at 6:06 AM 'Daniel Latypov' via KUnit Development
> <kunit-dev@googlegroups.com> wrote:
> >
> > The existing wording implies that kunit_kmalloc_array() is "the method
> > under test". We're actually testing the sort() function in that example.
> > This is because the example was changed in commit 953574390634
> > ("Documentation: KUnit: Rework writing page to focus on writing tests"),
> > but the wording was not.
> >
> > Also add a `note` telling people they can use the KUNIT_ASSERT_EQ()
> > macros from any function. Some users might be coming from a framework
> > like gUnit where that'll compile but silently do the wrong thing.
> >
> > Signed-off-by: Daniel Latypov <dlatypov@google.com>
> > ---
>
> Thank you, Daniel. This looks fine to me except for a small typo in
> this line "to abort
> the test if we there's an allocation error". Also, I have reworded
> that paragraph a bit
> as below. Please feel free to ignore, if you do not agree:
>
> In this example, to test the ``sort()`` function, we must be able to
> allocate an array.
> If there is an allocation error, the test is terminated using the function
> ``KUNIT ASSERT NOT ERR OR NULL()``.

Thanks for catching that.

Hmm, I slightly prefer the current structure since I like having the
<thing> being described near the start of the sentence as opposed to
the very end.
I'll wait a bit before sending a v3 to give time for anyone else to
chime in, if they want.

Snipping the email to the block in question:

> > +In this example, we need to be able to allocate an array to test the ``sort()``
> > +function. So we use ``KUNIT_ASSERT_NOT_ERR_OR_NULL()`` to abort the test if
> > +we there's an allocation error.
