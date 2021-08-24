Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7479C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 08:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF67261265
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 08:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhHXIke (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 04:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbhHXIkd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 04:40:33 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD442C061757
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 01:39:49 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id a21so25337687ioq.6
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fIaJkxrINABCGe/Iug5/poGhfIdeb8mZr2zVkeuZiyk=;
        b=kHTTXTXksWgsHJPnpVB59oOfzUtmQA8RIlmIUrXtIrzHAq1ndsCWtHdoAHjx99VDlV
         CbSgcrdKjFaVlKmnDvSdDGu/FlJ6ksMJhaYMoeyEw4JrohYPmBFZnm81tVnOW+Fgcwcv
         S0kLABy3eOsJWaUARW0JnOceTpR54yXgasDHyMJTYSlsoDapzS2Q2iOlDikOBkHft90u
         B1+KEKx2JPBAzaL/Zg4HH1/99MwHX29L77Qj76dDJCkp2XCCLzO37qhfZu6KWKXZ7bkD
         w1BSIiwJ2TL04lavumlWwmuzqVbQSXVnZb6trWN554SKo5GCr955sqjvEb/0ur55OfXJ
         i3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fIaJkxrINABCGe/Iug5/poGhfIdeb8mZr2zVkeuZiyk=;
        b=dk7GSo2JJAVe5d/359qpVYbndhDzEnzaDktnVTjYmQH3EMxrUzXkl5zHlOoWRUi5Qa
         OrFWAnjWU8Be4RqPoA3N6i80E7GJ/3iVfwRKo4saJBZYiJZo/oKJ4FZdjdZ/fDbg9zb3
         W1DzRsC4FlnFzYwPhOpe84/W4bE/k6d225lgHA3fxOHa4VTcjeP/jUkOayb546E43yfx
         2N+kjFPTxUCHLbqbPHokdJpva4AJxPEmfWI1mx9DKwRagRNl4NQ1RvBMMKkQ4heeLL1X
         jN29HDqBqUS0xP5Zwx3r7fEOH/i7i1U4Xzrw8qeIHYHiN1yKvcoyw5YcVXQdiBy+Vz8I
         O8KQ==
X-Gm-Message-State: AOAM531rr65GPBT/4M0OEw7DgGWWd0P/pKPI676zKtRUijW99j+slzot
        nv6te7VdMcQbgOWh8KhMAp87PD39tRcqN5xt6J0=
X-Google-Smtp-Source: ABdhPJzucpIA4Fwut467/LXAspudVZ8iqE7gqE0fBPnjBL84g3BcFW5q7NxJf3qkh9ZOushbOJ12bbeYs9Zkd1quzhI=
X-Received: by 2002:a5d:8b04:: with SMTP id k4mr21979876ion.58.1629794389243;
 Tue, 24 Aug 2021 01:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210821081800.2205103-1-siyanteng@loongson.cn>
In-Reply-To: <20210821081800.2205103-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 24 Aug 2021 16:39:12 +0800
Message-ID: <CAJy-AmnoWbX_PPo=NS69+muohgdgUSL1t5GAE2j5iYPEu=vZRw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Modify the translator tag and fix the wrong word
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 21, 2021 at 4:18 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Fix a wrong word;
>
> Fix old Original tag;
>
> Remove unnecessary blank lines;
>
> Modify the translator tag to be consistent with the current.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

Thanks
