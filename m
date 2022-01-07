Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9F9C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jan 2022 03:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345632AbiAGDQ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jan 2022 22:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237236AbiAGDQ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 22:16:27 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102A1C061245
        for <linux-doc@vger.kernel.org>; Thu,  6 Jan 2022 19:16:27 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v6so8437434wra.8
        for <linux-doc@vger.kernel.org>; Thu, 06 Jan 2022 19:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rucUgP1ZzNHZnIzLA1GO2HfNDsLV6pgtDw4xX5L1MQ8=;
        b=dQTGhoNDCcOtWLs8ukieFXRfB0dw4+duJPuRNxUgHdPncbFKqWuU4nniizU5Em1Rfl
         7OykqMbcFDvyQMLgMiu6M5OVDWAqukK7VrTMzQ8GNFPi78Ea1vbebisPwp0bSLalfCjV
         aetQ14+bYqEenoRADfNFW2XzVazr+jJ0y3PzdxroIgD1RHhAynNMycYPZDvUXWyGrfkv
         qXsoUnb5XLVFiFMj+9y/s2HwcnY0UQ4t/l/kbVNpdyil1jl1b9MOU5Z4kcmhtXiyV125
         70RFRb5pZS7IK1nrd4nFHgNHydd1DlON7x/lgtw4UDRWEu8/4tcYYsUTBe8agzMbr3Jt
         Y28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rucUgP1ZzNHZnIzLA1GO2HfNDsLV6pgtDw4xX5L1MQ8=;
        b=SdwgJZpLGKKTK/WndiKCYAIXiIaXfnqvlLg1hqAb8umE1WYvuq3rooZmUyPq1GIodw
         mbDVHXoWmQiMq7PKDpllP9UP87PzBKT2bMEYcJx49MvAxzjXsWx/BC8gD0MxawrREPEr
         5EiUMDTjoWtKxB1DYhuFONv3qJ9ROqU6Xqq1WimWqaET3jx3stwGmcnRN1+rHUmht2Is
         aJb/+AOmk+uSEJRYVcW8jF/+nikYINlXcu/1kptKJoMLR6CD3cVngofq6eqxEPWqqpQY
         2ECoGg3Tv2RpzYYNZLEoBjBbeokxM7B4C/SwloeLEgcPboEdKWGlTmUfANfCnTkRAyJ5
         u4dQ==
X-Gm-Message-State: AOAM5320/mU0ZX+8gHpI5n9gbU9KRbwxZCc3g5s+Drnni+AslawAzOzN
        pXa5TS7WeMtF36BarSQedgqlpzQDbB5RuxmWuozLFQ==
X-Google-Smtp-Source: ABdhPJyf4/lk2avk9iVWfOVrbgmsYp9DW5gsZfj7t1J5+wjxfWSIPc7uGQRRtDtDw/i8ac558OkYLUy/nyZeysC+xUY=
X-Received: by 2002:adf:eb89:: with SMTP id t9mr38017010wrn.177.1641525385578;
 Thu, 06 Jan 2022 19:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20220107030553.398321-1-qhjin.dev@gmail.com>
In-Reply-To: <20220107030553.398321-1-qhjin.dev@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Fri, 7 Jan 2022 11:16:14 +0800
Message-ID: <CABVgOS=EqdAt-cukRv+AUixpF=mAkdwWUSk92AV7zO4vGn93MQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Fix typo
To:     Qinghua Jin <qhjin.dev@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 7, 2022 at 11:07 AM Qinghua Jin <qhjin.dev@gmail.com> wrote:
>
> Fix a typo: actualy -> actual
>
> Signed-off-by: Qinghua Jin <qhjin.dev@gmail.com>
> ---
>  Documentation/dev-tools/kunit/usage.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index 63f1bb89ebf5..b9940758787c 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -615,7 +615,7 @@ kunit_tool) only fully supports running tests inside of UML and QEMU; however,
>  this is only due to our own time limitations as humans working on KUnit. It is
>  entirely possible to support other emulators and even actual hardware, but for
>  now QEMU and UML is what is fully supported within the KUnit Wrapper. Again, to
> -be clear, this is just the Wrapper. The actualy KUnit tests and the KUnit
> +be clear, this is just the Wrapper. The actual KUnit tests and the KUnit
>  library they are written in is fully architecture agnostic and can be used in
>  virtually any setup, you just won't have the benefit of typing a single command
>  out of the box and having everything magically work perfectly.
> --
> 2.30.2

Hi Qinghua,

Thanks a lot for your patch.

This particular typo is already fixed in the docs tree, as part of the
larger restructuring of the documentation in:
https://lore.kernel.org/all/20211217044911.798817-6-sharinder@google.com/

(Indeed, this whole section was replaced.)

Thanks a lot anyway!

Cheers,
-- David
