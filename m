Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF67C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 00:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiCCAFW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Mar 2022 19:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiCCAFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Mar 2022 19:05:21 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3388D49FAB
        for <linux-doc@vger.kernel.org>; Wed,  2 Mar 2022 16:04:33 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id v22so4560422ljh.7
        for <linux-doc@vger.kernel.org>; Wed, 02 Mar 2022 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npju3rHc3mRSfcSts2+QJjEKDIhH7Izt6iSeFW3/QF8=;
        b=EGUemDJqLPj5B1hkkSx83siUMy1VVgYpLmLW+ISOhNuoXtHKsSw2hUGh04Nr1SSJBa
         r1zlSLuTwOVX4majvP3P2eRAehp5T6N3EhkQMRRzPZTVKm7dG9AMpyQkHmmlptVAkH1M
         9qJqcvZhIGwX2krc9gtYqqgwwQlmQpMuIj2tBVKllvQa6ewTZR3bIzSlOMcvz81A9HgK
         U6a1Rlq0X8a/j+BcebndmqCX94BKI7/Pk6tA767h9fKeB1KajrFXzeZtGEtmtGtKzQ82
         MRbBDpAmm2KjoZQU/U/PLkzR0auLS/dAQCdKPVFuvLwFIJNhxluwc4Nr3f7cAO8VDXZ4
         jz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npju3rHc3mRSfcSts2+QJjEKDIhH7Izt6iSeFW3/QF8=;
        b=ysAijNLg8lJgzBlcLrrwqtGo5acGQ0wMaiSONXNUB7BxIC8431AQuP+ONNXaji/SZD
         VGaE9fUlVsH1CrddewoOrLTrWROGHKD8ESQGzM97r4o5MScN3QuphyuxEyAycxDt1a1A
         vU+pF5jI+atO42jT3c39y5jMI/101m8g/ph3bzosfTUG6tZa2OkjXyCkdqrljgvaC6z3
         TKKlkix11uo29mRCildi7WPfU6tdT1QM7wHvzmvffjz8iPK5L0N6Yh/vf6LhqvT6r0d+
         rUsQl/aY4RnhdFyk6z2Zg4qfaaeaI3qKgDO8Y106uRurIZ2mYi7x5TiqVYX0A5PRmT75
         vJyg==
X-Gm-Message-State: AOAM530KR8xceKpJ1lgm1FjZ68tfONgtqZ4nZ2o+GFmCmJwnMqPPTNzD
        0DEmOjd1hYCe4bn0JNuRyRZZz4iY26dEWzq1qqYwnCiXBMCq4Q==
X-Google-Smtp-Source: ABdhPJwNGg4cChj44h6sHunDdkaG9C78703PQ9UZNkp6xZHGYO9BRG6dBg6H3kef6ltm6p6P5d5rhHI0dHWUyV3MtyU=
X-Received: by 2002:ac2:46ef:0:b0:443:3c30:a372 with SMTP id
 q15-20020ac246ef000000b004433c30a372mr19890713lfo.626.1646261686698; Wed, 02
 Mar 2022 14:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
 <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
In-Reply-To: <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Mar 2022 14:54:35 -0800
Message-ID: <CAKwvOdn04aoWO_384k5HQodwA1-DCFwU50iRXQXh_BQk5pyz7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To:     sedat.dilek@gmail.com
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 2, 2022 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Mar 2, 2022 at 10:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > As we change the C language standard for the kernel from gnu89 to
> > gnu11, it makes sense to also update the version for user space
> > compilation.
> >
>
> Overdue.
>
> Can you point me to a lore link where I can easily fetch the full 3/3
> v3 patchset?

Hey Sedat!

$ b4 am https://lore.kernel.org/lkml/20220301145233.3689119-1-arnd@kernel.org/
-o - | git am -3

https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

>
> I would like to give this a try on x86-64 with my latest kernel-config
> (based on the latest kernel-config v5.17-rc5 from Debian/unstable).
>
> What Linux source base do I need?
> Is Linux v5.17-rc6 good enough (patchset applicable) for testing?

I suspect so.
-- 
Thanks,
~Nick Desaulniers
