Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1234BC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 10:19:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8958610CC
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 10:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349075AbhICKUR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Sep 2021 06:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349082AbhICKUR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 06:20:17 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF71C061575
        for <linux-doc@vger.kernel.org>; Fri,  3 Sep 2021 03:19:17 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id w19so6308476oik.10
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZA7mWnZ6i+ZjFHyrHNwkPmLsigaNkSDOwQ5theQczKY=;
        b=UI8hfhbnPyhWr9Im4wRrTDQGtrYI0rtoCsd4e1jjP8OICOQHjMaWJ8rb5m0Q5fbee9
         oNTJxAPJcygh74FHtNYPsr1YHSPCrWqQm3g6rI//xDU6zJEuv6l6jPbSOm4BpGWEtDX3
         xcXdaeNbujnQ2SxW3IDx2I7uFLRH1vc5tbHps5+7FXptavURVLlaC6WwzHyvjDwHycZH
         LnSyCx3WylzuDuKifvyH0a1wQkhfOSJDrUJCvh4gWY0YDio5jqkkLVNYXGno0NGmkftn
         /7Tul6eng0X4oL7j7KJtI8hwxPg/JhSNCWItxkHnyporSWN55fqmBBuL40nCpkoqh1yi
         p4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZA7mWnZ6i+ZjFHyrHNwkPmLsigaNkSDOwQ5theQczKY=;
        b=ufddy+ebUCH2AbqhWgV5IwnH5uKbLZcK1wuC3s37ZiLOm/2CRMHj03gbhHO4rX/1XQ
         9sT4Ad91P5oOj6ylbfmCQov46N/6guevKwC/VeJ+o/IXG4bF7hX0F59+N8m6Ztu2rWeN
         66l1m6580sgzxNwOWZ2ObMOTUe8NNK4krMCUOpPWdlAxGqSbmTUZ1uoEyUlDrE6Fpfi3
         WyA0WcU+WqQu4xCjNeEB47NcbkE5pUx1d4dMkNQu5beGyOiMdJ9r6nmrBcyk7ixyrVC/
         12SlQDh3Ux9tc1CVAhLKl7VexlYZJio8REgyjjco+u92Hj3zV8EIyP+K/mDWEENFLMFV
         dYwA==
X-Gm-Message-State: AOAM530yJw2qeH0bm5+UE0uR7dI5aAkHDqu5h49/cJLDUemwDEBKBWoR
        SxmSiRFzmDQJ3wvZ8jLakf3MdkqWgUS3cYiO3JY=
X-Google-Smtp-Source: ABdhPJxLnTL2wIJBO5/oMra4dsCpCTaCrHzqoJX6IS9qxDZiGLQQ+6czIAkYoZTH/88xvdA+ztOBpgCg7GcXc7AGpf0=
X-Received: by 2002:a05:6808:356:: with SMTP id j22mr2168140oie.130.1630664356040;
 Fri, 03 Sep 2021 03:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630375073.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1630375073.git.siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 3 Sep 2021 18:19:06 +0800
Message-ID: <CAEensMwkZF9m-xpNMV8VTi00nETWU3iAsfhjry=WaVpByY1EhQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] docs/zh_CN: add core-api Memory management translation
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

Yanteng Si <siyanteng@loongson.cn> =E4=BA=8E2021=E5=B9=B48=E6=9C=8831=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=8810:04=E5=86=99=E9=81=93=EF=BC=9A
>
> v4:
>
> * pick Alex's Reviewed-by tag.
> * Modified some words under Alex's advices.
>
> v3:
>
> * Modified some words under Jiaxun's advices.[PATCH 5/6]
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
Hi all:

Sorry, it seems that this set failed to send Linux-doc, I don't know
why.  I will send it again tomorrow .T_T

Thanks,

Yanteng
