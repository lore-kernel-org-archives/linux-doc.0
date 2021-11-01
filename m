Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B577BC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 10:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FB8A60FD9
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 10:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbhKAKDu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Nov 2021 06:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbhKAKDh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 06:03:37 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884C1C0370D5
        for <linux-doc@vger.kernel.org>; Mon,  1 Nov 2021 02:28:38 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o83so24091066oif.4
        for <linux-doc@vger.kernel.org>; Mon, 01 Nov 2021 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EVpIbnfZbC4qwaypcjVJ93ziB55v/C8v/M6RDiH6UE8=;
        b=RkmC1att4x9+y3kCgW96sauarG1DfwiNQrggAg/yQLig27s9V2Qdl01MkEfKB3MIww
         dKt0ZwSyp5t5UeUWKQcAKbISbQaiFZlz4BlwzZRqHICSq5yJdzTgpzYbW9MvTZJGyEcn
         QszrWDRutKEw+yQNi9hl0tYqaG8mmekqCpdSokMn8sZrL+oCs4LD3LSv3kDZZO1wsqFx
         /d+nF+prI2JV1K8MQ8HPHrVv41CNTSlGmFDonSCGw0L1/7C1LOffGhqyEdykj4+/9NcK
         sLga4s0zmU5aYY9l68sYRkmuKu/v1zluiwJAbOdY04L9uSzYJTXA9sHntCxTJJo4b68w
         TdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EVpIbnfZbC4qwaypcjVJ93ziB55v/C8v/M6RDiH6UE8=;
        b=ZORRgnWgLQEdOIAeSinbd8TtnVNyDFeGR/RNYfzeEVX4BGdCd4eHtwtmk+o1vxCnQt
         /61MJJjpqU7B8mEpfMxp8PVc0iDjYG7CEcJome/pJCg7CxQV2qt8svXl1/QTypULpqUX
         n5VpXRy/uyyjZ3RjRnEw2P3Ket09iO7sTVcM5+iXBpQinia5fAAuN+feqimA2oZ965m0
         SFsGDfFIxjcTmXaHqQp2HjS4k7q/H640Mb47WYbe/IM6O+NUfJb3Ke+075hMdHl2GOKd
         5yricmOltgEBjxyqf8+Od3hXG4un1Fu6uu5KmpBVbFvT7EsRTjmJhx+4xIj6XZHyUM/3
         8Nsg==
X-Gm-Message-State: AOAM533KlitwNePhxweQgV/eYZlWPKTMpfOSVP2aEFcrJPFx7eSBiuRJ
        gImzkzlYi3igA11iOaRhkQicRivoEPibdCPiO+U=
X-Google-Smtp-Source: ABdhPJyFFy/wqeuMxdU3HWqQGim586jS4c1p2ccQiLe8q+yfAitGVaJc6Ozx00evZHMHKo2bqKRUwCi05oTsWTu5O/k=
X-Received: by 2002:a05:6808:1809:: with SMTP id bh9mr3649157oib.37.1635758917999;
 Mon, 01 Nov 2021 02:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634358018.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1634358018.git.siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 1 Nov 2021 17:28:25 +0800
Message-ID: <CAEensMzpsCBB41+ueHsOVV_qbi6jrBpJ7N0bh04u8W8BFnASFg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs/zh_CN: add core-api assoc_array and xarray translation
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B410=E6=9C=8816=E6=
=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8812:25=E5=86=99=E9=81=93=EF=BC=9A
>
> v2:
>
> * Modified some words under Alex's advices
> * pick Alex's Reviewed-by tag.
>
> v1:
>
> Translate .../core-api/assoc_array.rst and ../core-api/xarray.rst into Ch=
inese.
>
> Yanteng Si (2):
>   docs/zh_CN: add core-api assoc_array translation
>   docs/zh_CN: add core-api xarray translation

Ping

Best regards,
Yanteng
