Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E2AC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 08:34:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287E660F41
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 08:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhHKIep (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 04:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236074AbhHKIeo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 04:34:44 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6559EC061765
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 01:34:21 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so2448419oth.7
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bzh+taYnzcE6w49ZMmI023UlhKRNJVItMBz4npN/cIQ=;
        b=S6nXdSJxQNEWwWUiEQuWSpHzGzwHwt2wabyv8QGbK2rPXorucnUXVsDnqAk2t3lnVQ
         9uHXDUYfeKtgyAt61o0QQ+dyasAJXk2NZRgnu3k/VWn95LOGgu8FXocMZa8oFRTEDWus
         vWoApcx3JpaaGsbufKRQbKXT4BSCrHnonhaoQbX/p2+Ctst/wK3IBon9fpBsInNiWXCL
         rDhzaxaooLGAP949tYwp4TnHHZZwf9YcOZeGEl9Pojh8NrQa8G7J/FslHSJZw4XD/ZCF
         NZ+nTftEfbYbQB8JGCr1cawrMT144dHgD58+VSnjY31QF1j2ScKraB6D3NRYPUOl8tCx
         Gw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bzh+taYnzcE6w49ZMmI023UlhKRNJVItMBz4npN/cIQ=;
        b=fxuy3zaGpYol/uXv3IY/3s9W9z6Dj0OO/ft17Dp/iiOGiOOio3/B007ISF21c60tNv
         fbZzGtKrs+3/2E9lUKbR2olOIpVLNEr1tX7l++P/D0R/7buQ8H0xMOdNzyviq8Ick/ne
         DmqznV+HeaBvNWc5X6vAvon3I8daX91uYAF+Ec+GFJwLUGlq23zycbMofD4EdhzYc/0O
         pTAUR49uOFy1U9jOp9tCCQodEE9NnNK5a3tWLNsvu5UI+EdVnHD8RnNj0NPmJOYhwcgO
         LYHN4WQnqlR24vt+1iSIwQiKcXjCPvNXXLDvy9xEN38VhgW04OJubQiSb+CBDiWdG2fz
         CUGQ==
X-Gm-Message-State: AOAM531VLQbxi4qR9hdyAOTn5c2yHVTxdL7fMnRCghXdds+JMfJtWW7p
        68o73S+dvyrd6P/EH7lscnjp/HfY1pZoEo77pbg=
X-Google-Smtp-Source: ABdhPJxrADIOwmmSA9OuoKMN+NqGh6YW1L+s4N4iIajxgDQ8Q7137od1fXqdoT6+kwyrxu1mA5KKU0RCnMWBHM5LCY8=
X-Received: by 2002:a9d:53cd:: with SMTP id i13mr10995663oth.302.1628670860773;
 Wed, 11 Aug 2021 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625795862.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1625795862.git.siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 11 Aug 2021 16:34:11 +0800
Message-ID: <CAEensMzC6T0jrGNe8JetS_OQsHD3B=UtNMH6aPbJjYrff_AbDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] docs/zh_CN: add core-api Memory management translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> =E4=BA=8E2021=E5=B9=B47=E6=9C=889=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8810:57=E5=86=99=E9=81=93=EF=BC=9A
>
> v2:
>
> * Modified some words under Alex's advices;Many thanks to alex for his re=
view, which
>     kept him busy until the early hours of the morning.Thank you!
>
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> Yanteng Si (6):
>   docs/zh_CN: add core-api memory-allocation translation
>   docs/zh_CN: add core-api unaligned-memory-access translation
>   docs/zh_CN: add core-api mm-api translation
>   docs/zh_CN: add core-api genalloc translation
>   docs/zh_CN: add core-api boot-time-mm translation
>   docs/zh_CN: add core-api gfp_mask-from-fs-io translation

Anyone else want to review this set?   :-)

Thanks,

Yanteng
