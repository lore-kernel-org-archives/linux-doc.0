Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C695DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Mar 2022 17:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243258AbiCORgN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Mar 2022 13:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236650AbiCORgM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 13:36:12 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BC92F033
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 10:35:00 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dr20so41794899ejc.6
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01vubDCka59+RytoWaJjo8FyvSBZWQhJIVc+vafyJ0E=;
        b=fxRcChAFjOVezx4HjRe0TkRKHQAIxaquoe4fNRsez2/ZTv7c1Hedfsw72FAvxFxT2b
         G8Sb2r0a4mjCmehTMgpQ/PBF3fhYmsjHRGLe/D1pAWwkrV9gocgmWB54/1u0VtYQBgUW
         W/sA0shGDck8Vths0eWpWcEwySkbWiJCiFLe8TYDTgAoBoddox/XevAiaeUfYEw8SrBz
         uOXrh33AR4t5sdVQse9DRha1jcKuZIWrZWaPcF8evyb5Gfasa659KzWsbVHjVMEZz2Vi
         V8Cnsx7ywhxqOmpWczX2WdEcpn2NU3opjtfmEu2+UusCXSlRGsRMkXudbN8A9I11kaYa
         PwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01vubDCka59+RytoWaJjo8FyvSBZWQhJIVc+vafyJ0E=;
        b=SvjfbSulzBGhjO9rmGQ4VRgUinQh2sykpZndFzA+xQsA7B1Pzv5JNxF+SkJbGzNh5K
         0NRV7bWjtFUvRkMbJzRFyNzttbCP4EUpN1p9rj8ftlV/FiR4nFutoaErtzy9EOLduPsN
         A1YJTuTGgD0sYDyZvoRzLibBgy5kFWdLA2mitidcR92tSwquUy7T/pbHQypu2+Xnll/l
         b5vzYxtqRJSJO5TcRADhSCrzoDG8PN+OuTTjA/ujsoi+3ADEQFMF656TlkvhvL3uhGql
         yVX7UgKre0Sny06AAk8bz0H82BT44tmMh0kwxJdh3ZfJXsu3H0SONiA7v+f3RiHUv+8g
         fjmA==
X-Gm-Message-State: AOAM531y28ZRYhvgFE5p65zGqYFMhyxeFd7HqjlbLaaEbAvDfIJYiXfb
        4egUh3SdYXv/UvxnNuQ/8DMi9a7gNmHLB1kDp3YsUg==
X-Google-Smtp-Source: ABdhPJwlZTvVcqHl5XIEdYScyeQjLdixdoVpg6f/gEKQhUTzLUEU4xkUfpNk5HQuHkCX2rgh0KphrFfAvLY0rZjSKk0=
X-Received: by 2002:a17:906:6a24:b0:6db:ad7b:9066 with SMTP id
 qw36-20020a1709066a2400b006dbad7b9066mr17480090ejc.697.1647365698176; Tue, 15
 Mar 2022 10:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220315172221.9522-1-bgeffon@google.com> <YjDMo35Q/cvPLkxu@casper.infradead.org>
In-Reply-To: <YjDMo35Q/cvPLkxu@casper.infradead.org>
From:   Brian Geffon <bgeffon@google.com>
Date:   Tue, 15 Mar 2022 13:34:21 -0400
Message-ID: <CADyq12yK+qODV2ut1acjwkyXKDbh_YS3MHpRoJaq_g9G1HAyEw@mail.gmail.com>
Subject: Re: [PATCH] zram: Add a huge_idle writeback mode
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Minchan Kim <minchan@kernel.org>,
        Nitin Gupta <ngupta@vflare.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linnux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 15, 2022 at 1:28 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Mar 15, 2022 at 10:22:21AM -0700, Brian Geffon wrote:
> > Today it's only possible to write back as a page, idle, or huge.
> > A user might want to writeback pages which are huge and idle first
> > as these idle pages do not require decompression and make a good
> > first pass for writeback.
>
> We're moving towards having many different sizes of page in play,
> not just PMD and PTE sizes.  Is this patch actually a good idea in
> a case where we have, eg, a 32kB anonymous page on a system with 4kB
> pages?  How should zram handle this case?  What's our cut-off for
> declaring a page to be "huge"?
>

Huge isn't a great term IMO, but it is what it is. ZRAM_HUGE is used
to identify pages which are incompressible. Since zram is a block
device which presents PAGE_SIZED blocks, do these new changes which
involve many different page sizes matter as that seems orthogonal to
the block subsystem. Correct me if I'm misunderstanding.

Thanks
Brian
