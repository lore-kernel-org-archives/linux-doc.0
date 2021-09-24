Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E43BC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 24 Sep 2021 20:16:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4222E61107
	for <linux-doc@archiver.kernel.org>; Fri, 24 Sep 2021 20:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345983AbhIXURh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Sep 2021 16:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344957AbhIXURh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Sep 2021 16:17:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F9BC061613
        for <linux-doc@vger.kernel.org>; Fri, 24 Sep 2021 13:16:03 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y89so29698373ede.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Sep 2021 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dma3ODYRAwAqQNgxjoPPmrM71vwSjvGubtDE6+J/Uj4=;
        b=TCKaE7TNX17wekyhEJMq0Q25AVyKWiZRP+g/+Gp/8PWclgr/jK3NrgttQdr7wcLdXR
         Q7Vui+5HdK/XtCPVLRA1f3pBVqdfXx9tpC6sVw/nnEysSkKizl2mQK1SQUekXcJnHoZb
         iKS9R9k/fhu93FJDzD8w8K1oJinhGnJ23XrS0RrTKDPGUkbMcQkqosdn1u9ndrmaqYVX
         aY+QtdNzVtWH36uUWKCcNE6ZOBnMcRs/Ux8HSJmt9kBinzOvcfA/PBdBGjSEj4T5I68L
         agEiE1FY6qB/1zx1Jyhcyw1sMqbjO4VrSZY6VVVg4ZwmbJQMY9JC9tCVJhGtQbWB3EHK
         KETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dma3ODYRAwAqQNgxjoPPmrM71vwSjvGubtDE6+J/Uj4=;
        b=ad7hySzyYtvKvAl3VMRK/GZIW88hWi0LD+K1NKqBVyzXiwQxlum0D65DhN2e7KaWT0
         SkUU09rEgtRoVVyffYFFaXYv9kZNC96ruw4ydgOTz89hB9wfIXcqJf6APXqAsEEesRKw
         kut5qV2S5hQpWO5k/kxnaE0Z7WPBEF8qk5jDVgZ/Zb6MZmAf25GH8xO9q9uCOgb4BtuX
         yaAOVbDLrB7Npn/4LqPJ9ERioU06yOzGkMB34e2QJ9ss0jG153UCSdt4YYIW6pQcdg2b
         3aAcRrGxU/WifY5aKhi2sCLPd39xyku7jOJaI6camEQjBJ51EnuxzNDon7xdl9XJOZG3
         UIQw==
X-Gm-Message-State: AOAM532L+zYl+sXTMgys/ZIjZt1z7/zk0zlroIKEfl1vUyEYTrK5kSIV
        oLlasBAiuH/aAKi2v3pnBedIe6WENban21CUfnhj7g==
X-Google-Smtp-Source: ABdhPJy+GO7D85GdcvOuwQ7T61FovB7Jo/xuxyb7T+18+fqF4fp9j9ohG6KW8vkKyjgJq4w4BsZG3i2clMRE46OOnIA=
X-Received: by 2002:a17:906:2bc3:: with SMTP id n3mr13014432ejg.548.1632514562127;
 Fri, 24 Sep 2021 13:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210917210640.214211-1-bgeffon@google.com> <20210924161128.1508015-1-bgeffon@google.com>
 <20210924125422.358374d83cdb95db055a4467@linux-foundation.org>
In-Reply-To: <20210924125422.358374d83cdb95db055a4467@linux-foundation.org>
From:   Brian Geffon <bgeffon@google.com>
Date:   Fri, 24 Sep 2021 16:15:26 -0400
Message-ID: <CADyq12xAc4Y5P4n69oahPNs6M55cUb6=7Nku=J5iEOJVMBOPTQ@mail.gmail.com>
Subject: Re: [PATCH v5] zram: Introduce an aged idle interface
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org,
        Suleiman Souhlal <suleiman@google.com>,
        Jesse Barnes <jsbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Also this?
>
> --- a/drivers/block/zram/zram_drv.c~zram-introduce-an-aged-idle-interface-v5-fix
> +++ a/drivers/block/zram/zram_drv.c
> @@ -309,9 +309,8 @@ static void mark_idle(struct zram *zram,
>                 zram_slot_lock(zram, index);
>                 if (zram_allocated(zram, index) &&
>                                 !zram_test_flag(zram, index, ZRAM_UNDER_WB)) {
> -#ifdef CONFIG_ZRAM_MEMORY_TRACKING
> +                       if (IS_ENABLED(CONFIG_ZRAM_MEMORY_TRACKING))
>                                 is_idle = (!cutoff || ktime_after(cutoff, zram->table[index].ac_time));
> -#endif
>                         if (is_idle)
>                                 zram_set_flag(zram, index, ZRAM_IDLE);
>                 }
> _
>

Hi Andrew,
As written that patch won't compile when
CONFIG_ZRAM_MEMORY_TRACKING=n, my guess is that the compiler pass that
removes the dead branch only happens after it attempts to compile the
branch itself. So it appears that even though IS_ENABLED(..) always
evaluates to 0, the compile will fail because table[index].ac_time
does not exist. You should get an error like this:

drivers/block/zram/zram_drv.c:314:57: error: no member named 'ac_time'
in 'struct zram_table_entry'
                                                             (!cutoff
|| ktime_after(cutoff, zram->table[index].ac_time)))

Brian
