Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD87BC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:25:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 974B8613BC
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240567AbhD1U00 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 16:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhD1U0Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:26:25 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98C8C06138C
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:25:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x20so71003252lfu.6
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24dqn/+FEtUll0rSYOdRnvFq6DTtKXVWdo2aK61CiNw=;
        b=dRDRaAX9ayALovqfgdL291l0lKLnc5uDr0fCOZ4yRUgugmE5ggRX0Wv8tfjce1adSn
         IyhtE55ZvnES7iabYqiKOupAbZzDmu5pHHIDFouMFkZ4cwHG1LUrLKne5no1F6ew8n3w
         mZ5NxKOhAsoeJPOQcsoN1olaEIQ5JCs3rZkFWAEHjCYT017Ox8VuCnlp0yQEdE6j8cWt
         9AhI9K8VgO67u5s7bf/Y0+qdwr/o6i/+ICgsJU7AUFmo0okdlQmxEc6a6q3VQStI3gsI
         mNlPs61YWci3Bpd0MNUyeFYZLv14/jWleoekAnomnmMJ+d706RjUukVJzfLeBi+P6wHl
         42yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24dqn/+FEtUll0rSYOdRnvFq6DTtKXVWdo2aK61CiNw=;
        b=M77+w3/LTQE/UajVXlPO+Yjf4j3CF7DCYO/if4ufsphFIi4vWwWsbkPuZJdaDTRkqJ
         yNoFjA5xuYg3DIkB4GrDOnGJF0bnI62REfo+pCF3TQeJkifPfo58W4Uf4579Cimg+6vd
         4qal79KK7uOQq0SmSptSLqhmFFHUxaV8HQFveXtlsQOwUj7YXjYRzeeaenDN8u38X9sN
         jnpC4oE0HGuJ60pKFvFPt/jx2gfIpAF18JHdUPhxJIt6keG77/rcc91F5P1hO4XZPhHs
         klSuavrfsaFUPxw25NHlyqpazx9ec1RKbd1/enZeNWiTRj5U5MIKPkgUiwANHN/6gcSq
         vjDg==
X-Gm-Message-State: AOAM533LsGCCmoMzAxHjzwQwdJoaU/yM0UEBVgEUBzkc+Cq2xud5TAkR
        lN7F8gFN1OC+jg+450ZDaMs2bPHM1bSkPGE7NUqlKQ==
X-Google-Smtp-Source: ABdhPJyLKfJiWtybsYLfzFW3x4KBfvZ1SNTdYHGgqEIxXyky1SVISrVnvlf8ahz8T3/oFlzGumQIh1DxPIl79sIZXaU=
X-Received: by 2002:a19:ac09:: with SMTP id g9mr22162307lfc.547.1619641536929;
 Wed, 28 Apr 2021 13:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
In-Reply-To: <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Apr 2021 13:25:25 -0700
Message-ID: <CAKwvOdmxYoNu1uD9DnSB_hLvnHM5W5rJf_KLOLkwgxAVQjz3pQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     mceier+kernel@gmail.com
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 28, 2021 at 11:34 AM Mariusz Ceier <mceier+kernel@gmail.com> wrote:
>
> Maybe it would also be worthwhile to make the requirement that the
> kernel must be buildable with free software (not just open source
> software) explicit ?

The kernel is already buildable by LLVM (and clang); in fact Android,
CrOS, and Google's production servers already do so.
https://clangbuiltlinux.github.io/
-- 
Thanks,
~Nick Desaulniers
