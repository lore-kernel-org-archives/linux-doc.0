Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC296C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 15:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237555AbiCHPDz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbiCHPDz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 10:03:55 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229912612D
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 07:02:58 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id i1so14214618ila.7
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 07:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hyx8NpDBiyLK7NUoCtm00QatpGeMbqxU5MY8nDVUM1s=;
        b=j9g5kttPzwv7kMGlXwT5m9gvIs43OPjX30e1wjFiRoJrr3IfvnPK8giWMFAJ1XX6Vu
         1eC9gruVEcDyRQlgR7zt/nSqUftGSwCWmtfydUaw54lPNWUeOJBT+LRxkhRfbBlOrDwM
         pcs+liMN/ecFxOugTWnlodpNUdQKRGshSGuIbKB3KKetAuMTvzBCZeEKoflN1iasfLGF
         g/pwjVTOl02Za66R0ozDHAdD57OdA+dyUYCj2zKCd1wsLRYEiIqMUQds3CCgjiuMj2Vh
         Ygh7BgrpAgt3E2XfLPvw1QCmH32GAjagYYdlNqRjETq0kF+wKNQeWMy/R26NUTh471zU
         WqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hyx8NpDBiyLK7NUoCtm00QatpGeMbqxU5MY8nDVUM1s=;
        b=DIouO83VjnrTe5xyyYLBic9ci3v1XAtLVIPECzGJmlxAMaOC2ID2Vrc0eJ7szxKkL6
         wy+UPDk8m0PqPxwZRPUK4WS/jGE9AiFuDi6FspN/bF6tslSS0s5+/iif+zhSE58ypTBc
         kmtRJwrAIdLf1o6sl9bLE2Q3lPRmrHs9gDvO2oJfYdGGx48066db4fD/yZNZj7n8tRJw
         wdAaQWqyqaWKaho4TLBFfQY5Sv7IOQWyXN7Fckm7MsBI9ppHYnwqDb4SWWStBTLTK7ix
         xSS7QR44WnErBk28xuKNyUWUkfxR3D1z9T1qUhR+kUz4C83iiZ6KefPza5t0ig6u/rcy
         YtwA==
X-Gm-Message-State: AOAM532qudR1c5FH2VQMq9ce4El+j7XmHZu8dUrGryBOikGgIwGM12yr
        f8ZN0oW1EVxaIO23/R4EXksuy2HbfncAidgo2lsJJfRruQH7nw==
X-Google-Smtp-Source: ABdhPJxwJrKrbfJJNMAfRWd3TVWxDE81PaKF898jgvEt5tMRgxx1coXVMyUb6tSiEEUtzQGpwnv+Ig/bMAwqs1193x8=
X-Received: by 2002:a05:6e02:1543:b0:2be:d7b4:49b3 with SMTP id
 j3-20020a056e02154300b002bed7b449b3mr17037547ilu.97.1646751777369; Tue, 08
 Mar 2022 07:02:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646496448.git.siyanteng@loongson.cn> <3a8d4ab693c930db9e9e3d727c33f67dae7e9427.1646496448.git.siyanteng@loongson.cn>
In-Reply-To: <3a8d4ab693c930db9e9e3d727c33f67dae7e9427.1646496448.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 8 Mar 2022 23:02:20 +0800
Message-ID: <CAJy-Am=tsmt3sArLr-aeKzzxeFRvH6yTDpsD-Fc=_mW-V=Ekpg@mail.gmail.com>
Subject: Re: [PATCH 04/12] docs/zh_CN: add vm mmu_notifier translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 6, 2022 at 12:24 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Translate .../vm/mmu_notifier.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>
