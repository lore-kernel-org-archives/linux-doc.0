Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B9C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 11:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFC2361249
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 11:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhDMLUA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 07:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237455AbhDMLT4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 07:19:56 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E612EC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 04:19:34 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso5112508oto.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qrHN9bDiB3urHGMyv9EW2Gwtr8iC5SrSKh2ZyOmD3lA=;
        b=QXRxiWB8riLt1YslfIn4Hav8heuxPFc/V0ITxpEWmK86dwrg5T1Aaf3uOsqsQAOl58
         5st2yCgiUvc1g/o0w1gL1YC0ybLM+GIlETZvhg1N36MK01RKzxoVfMxXmgWBTvI0BSPz
         ceTpgub8R0rFqBOr67MfAbt7fj2mhELFTI1Fodz8zIRYf9Xkcwnjl1hidBbSCCF+tR0X
         dTCBlpfYQEA3ZirrtZmWZi6bahoPnGMybo9ohcDRTHcZ2OsKpxWF63oLpeOGEMHL6NF5
         wzD1k4Lm6qVxxjgBLk32tGfKdmWoLClW5O5FcQUkDuY0H5CUM9tHCzT1U1kzIkLNTHFd
         JhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qrHN9bDiB3urHGMyv9EW2Gwtr8iC5SrSKh2ZyOmD3lA=;
        b=pZRGfs/52ILnjooYxB2RZgV3nje/ddPEf+Der/9rSwDACnCGAm4Kvs7kDNUFfHznPv
         r7x5G16X0XB5rr2oCYMUJ/YLYS8YGOzUL/Tko5ekASh/3snL5Yz+QK8sWRRBpokY7BoL
         hVgZx6m2p3B+FwQMKi12ic+XXgqfw0BU4HUbI9IjTzdW0thl7P4AJ1b4KQihK6fjhR4L
         X4+5dwXb7m3t64aOtI5va13C5ANHzoyNE2cBx2L+gu9na3yMcJTyGC2k2WOTsHX/8LmD
         YvVvp8c+FK1DoIIP9k00UKX4ACzVOU8FCCxDNN4DsRMXC+LQi5kwBRiHXP1cIIV71Clf
         AJ5w==
X-Gm-Message-State: AOAM531BW362FeA/HyKkE/9gpiOtXsQ128XRQ+pnEkEsTqu+nVf2zZUl
        X91IfT2rGCkeqTgfkyfWAMtrVgJOwPmIFUZfIBc=
X-Google-Smtp-Source: ABdhPJyMnD6fMgA8gpmtuTKtIraf5daNHpaAs+cyxrixhocQ3ueBtgcwoxgQNKUL6fiJV96uQVF01rfmqYLxwfzCxJg=
X-Received: by 2002:a9d:24c7:: with SMTP id z65mr28826970ota.243.1618312774410;
 Tue, 13 Apr 2021 04:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-4-siyanteng@loongson.cn> <01468459-2057-c361-6afc-c0d12efd40c2@gmail.com>
In-Reply-To: <01468459-2057-c361-6afc-c0d12efd40c2@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 13 Apr 2021 19:19:24 +0800
Message-ID: <CAEensMzquBZg9zq50MV8YkyfARaeu_AwsKk_4=2CG3oYZbUB6g@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] docs/zh_CN: add core-api/irq/irq-domain.rst translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

OK! :-)


Thanks
Yan teng

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=9C=8813=E6=97=A5=E5=
=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=881:23=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/4/9 =E4=B8=8B=E5=8D=885:10, Yanteng Si wrote:
> > +=E6=A0=91=E7=8A=B6=E6=98=A0=E5=B0=84
> > +----------
>
> Ops, please keep the signs number equal to the title char, like
> here the '-' should be 8 for 4 Chinese chars, since a Chinese char
> takes 2 times width as English char.
>
> And check for all similar signs in your patches.
>
> Thanks
> Alex
> > +
