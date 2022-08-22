Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F28C28D13
	for <linux-doc@archiver.kernel.org>; Mon, 22 Aug 2022 20:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiHVUJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Aug 2022 16:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiHVUJT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 16:09:19 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9C652456
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 13:09:18 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id q2so13256620edb.6
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YrWKYX54XcRB+7IefpmY6sNaaz9UJEYvmrEmm7qSZ0w=;
        b=YZscAe3hvQ0GokHKrJV2pgBBBdaOb19jklY1so7x0tSJ3zokBPhqGM4y0pGoaxaOuj
         3dDRW4fLhxoFrKpfS1D/GZ26cm0qgE75QCuCSNxci8zCKLUmRutksku1sYJGYnLZX4fh
         yjpr0K1vrN6Yer42eYdbtS7qCmk0UB/Zw0XQDaRsQ2i4xkFA9SOVZNZn06PVqj30Yvnl
         dDqfIazJVFqjPjfi8EffFFrV8cBnbThGdolRAZaOfUV8zPsIEhRy143aOqj3nodEixdQ
         aGs336eeTsPKaVrdF09pk4sY7MtHPfT0pJW1inoesuoKBUitXXH+kWQlnWzbiAfwWsr8
         D0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YrWKYX54XcRB+7IefpmY6sNaaz9UJEYvmrEmm7qSZ0w=;
        b=0hFVPOC/QN8h9Hs/aVlcR9tTFPheF/PawGFluQlkmEklGfxkp7YD7kMMOuFAfmGqcF
         Ki2fhYg2RxsZznK1dg+b+4zfHIN1wM7Z2LIrzBhYUkBktfgLjY34jbqFasBizj0ltGc/
         VqdTYQ7EVuJoFlQCsCzXL6d84V7BdMaebpLm3Ns98n0OHYB0tBVtV5s2j2fa+2LVNMIz
         V6oKDCN8S2q4YDHyojNCiAX38be8oY0MxC5sLh5TU3DOaXS33F0GF9qJkyM0RWVbGTeF
         CkyYvRidlFX0tn9h4GDL5ILq2bu89uqLGqBpfsR/aWa96yfqR8xmSDC9u5E8lBxMmGfP
         eEOw==
X-Gm-Message-State: ACgBeo0hreoqXFMYHV0sd3Id71nd8dVrEY5/DQpocJmEV5wuriOwxBPT
        M1Em8xsp5wmQZ3719wed7Nc4p4ADZj72tm0zJAmSwA==
X-Google-Smtp-Source: AA6agR4s5hz9NH5pqWr3RTrYVcWyakcoE03sHmsj+SPDDimTow1sGJFpuYGQx6+0ltAYD4Y6ruT0BCn4teZ0Z6tMAiM=
X-Received: by 2002:a05:6402:22b8:b0:445:fb3f:dc3d with SMTP id
 cx24-20020a05640222b800b00445fb3fdc3dmr678328edb.378.1661198956693; Mon, 22
 Aug 2022 13:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220819053234.241501-1-tales.aparecida@gmail.com> <20220819053234.241501-8-tales.aparecida@gmail.com>
In-Reply-To: <20220819053234.241501-8-tales.aparecida@gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 22 Aug 2022 13:09:05 -0700
Message-ID: <CAGS_qxoVuRPF39kcVBWGuhnmaixfLAkPN6HaDRyuXmDHqmWPXg@mail.gmail.com>
Subject: Re: [PATCH 7/8] lib: overflow: update reference to kunit-tool
To:     Tales Aparecida <tales.aparecida@gmail.com>
Cc:     Sadiya Kazi <sadiyakazi@google.com>, keescook@chromium.org,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        davidgow@google.com, corbet@lwn.net, brendan.higgins@linux.dev,
        Trevor Woerner <twoerner@gmail.com>, siqueirajordao@riseup.net,
        mwen@igalia.com, andrealmeid@riseup.net, mairacanal@riseup.net,
        Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 18, 2022 at 10:33 PM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Replace URL with an updated path to the full Documentation page
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>  lib/overflow_kunit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index 7e3e43679b73..78075106c0df 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Test cases for arithmetic overflow checks. See:
> - * https://www.kernel.org/doc/html/latest/dev-tools/kunit/kunit-tool.html#configuring-building-and-running-tests
> + * "Running tests with kunit_tool" at Documentation/dev-tools/kunit/start.rst

Oh, I thought I had sent a patch out for this.
The rewritten version of the patch is
https://www.kernel.org/doc/html/latest/dev-tools/kunit/run_wrapper.html
That's what I was intending to rewrite this line to point to.

But if people like a Documentation/ path to start.rst instead, that also works.

Daniel
