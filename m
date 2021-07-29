Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B849CC4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 11:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CCB660F0F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 11:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234737AbhG2Lzt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 07:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbhG2Lzt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 07:55:49 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76396C061765
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 04:55:46 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id o20so8045061oiw.12
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 04:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1749qhts6QF6TFELqiM6jWaV5SIvu4EGenP5Ct49080=;
        b=GR3JBWMb14u4qjdNbdTaS3KrxjTNS6zI1wYxXg7mvf1YMmo1WNWEv7GRTIeSZrPb2M
         HBtLoBN6QYDY/xrJNrhxBncT90/InYsnBZ92MATqNeLRM2hTx0i3bUGjgnTZXLunm0x/
         xe3PNyDrGCfaMwxTkancSkyzbGMHwmNPsM27av2IC5d+/8R8nKHwPw+FYTTScyRaVxBg
         FHjuAMihnuc5mKIgkjQd5O2fFBiVmU376EFO/SjTGDicWpIN5fo8ZoSRPlxn6hbzRDxk
         qHc2FIOxEoM74p4rrPD2A7GfgYcSSZftfGKvrECcBxMhQpLXBZg2apQFR/1YkUp8ovYS
         fsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1749qhts6QF6TFELqiM6jWaV5SIvu4EGenP5Ct49080=;
        b=Cra6v53TXvnFowm9gDzlXFb1Y+Ogjccnm5rzAGQxHp8NaVmtmzqWVhpNgKfPXzuhll
         iKyQ6o0BQXfX5dictgHFTiIRIZF7O4nLF40rvxYWFdO6jZLsa51m1NNcjuN/ibgTV14V
         MECZFDoBnHAlBBLkYbbafbIgnK+d7HwR9DkKqbgAEHnNqAbboH+BPJ4JRmvkZNg0Ne5I
         EFveMBnwXe47ySyfgJpZShEvgnhAOUtQSq9YxqnB+ldGYeOBU/ne0/q+Ca7welBQQZwt
         a8xqO+USw5pY0VdRfBOTWhu9RNcomXsdeXuHQCKdX6PQCtvrTqID1z54oxk+BaYJZgS8
         /KXw==
X-Gm-Message-State: AOAM531rfYGmYRndVj6N7oIhD05bLe3pTmxMMS/2YwzdIqtxXmMVPV7k
        9hLDC0EalU/qbtyxU72hYwdjtCJ2CiXngMe872c=
X-Google-Smtp-Source: ABdhPJyNu6aF/7KAP0hb8rpQnw71ruUUNzm35RSBISxxo5QFuCTNk/gX0zGnX1rgn79/WIfFHCtD3rxz9JGSFlk6Lvc=
X-Received: by 2002:aca:1215:: with SMTP id 21mr9599773ois.37.1627559745898;
 Thu, 29 Jul 2021 04:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624525360.git.siyanteng@loongson.cn> <2d78245c7ae3972435913691d1a1bc9c2e7332d6.1624525360.git.siyanteng@loongson.cn>
 <CADQR0QhLDQoN440rsdvxVqDfaw38WgzpN-d5PD8y-ospfjPo5g@mail.gmail.com>
In-Reply-To: <CADQR0QhLDQoN440rsdvxVqDfaw38WgzpN-d5PD8y-ospfjPo5g@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 29 Jul 2021 19:55:37 +0800
Message-ID: <CAEensMxcMs1DNG_+uxajPHbrBv0beSJrPSpjRwnC4Xt1nf1t-Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] docs/zh_CN: add infiniband index translation
To:     Puyu Wang <realpuyuwang@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Puyu Wang <realpuyuwang@gmail.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=8827=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8811:56=E5=86=99=E9=81=93=EF=BC=9A
>
> Dear Yanteng,
>
> I think in most cases there is no need to translate "Infiniband" into
> =E6=97=A0=E9=99=90=E5=B8=A6=E5=AE=BD (It is not the official Chinese name=
). You can use Infiniband
> directly in the Chinese context since it is actually commonly used.
Ok,I will. thank you your review!

Thanks,

Yanteng
