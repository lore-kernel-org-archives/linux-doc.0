Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEC7C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A640F60F23
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237458AbhG2Ne5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbhG2Ne4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 09:34:56 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0CFC061765
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:34:53 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id m13so7151539iol.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WhpkGy/a62mH4a8ZThSfgrtz5MUjokdneX42Qy08UL0=;
        b=lj/bMuknurhXr7yywBTuPD/ZII5enx58Oc1Fhp6TmAKivKh4uMCATegp1jCUUb6EPG
         7wO9n61loGr2H5b3eOxY+RL8PRBUNCAOWQCTVWAh4dobqQgiizfRPdmx4t+dBnX8Pz9u
         kGXrJq8u+lhzTQEPbz0XUbD4vd5vrWPiz8YxO9s0PKs0gNUBFVlsCkfPGRdLsLhS9q/2
         FgWEazTevKQzu5tO1Eyeba4d0brB0eG5DNncW3KdLlHldTuluHRB8DN8/CKAyBrIY3X+
         rTOFKNsUWrqtzn3xKAExCL+P4MUItQm4h4KBwhyvPJVTvAZLXO1JritJFP4+ZqgdI1ni
         rYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WhpkGy/a62mH4a8ZThSfgrtz5MUjokdneX42Qy08UL0=;
        b=TgCD87KTI6ZOUaaR9jaRUfQCSzuxh4hjzDBlTsc1Fe2p6d9KHUaCeoZnaR1RYIx+UT
         Ko4JJS52/F1BYsxbreKulhqT7HEvY4ywVmXZwWRNSroGsVcmVszScFZYzwcDc6Baq00K
         /toAdpgpHX7Qm65fSGqE11HP/DHqcaiUjBYLjoJeFL31NsTPDQEAcpLny3unN2jREi+X
         rOF1gWXknQexZq82hpQZBqoI/DcmXODeTZEQbecTVIL0a7eGWm34o3eM235o8+vNHfZ0
         NNstxx8+VU9s40f4oVGnluZFpvIdLSV4XCfiRZb693T9vbSqWWKErpp5A2DsNv7UTDyS
         wrjA==
X-Gm-Message-State: AOAM532WH9gKdXW7J57BRRxgIsKZW6uudtAfUUNt4irzD9jv4Gjh1D0k
        Q0pXgeP6gG3gUrhA+VcTBQ1XfWjPfliMsWOF9t8=
X-Google-Smtp-Source: ABdhPJyFN9r7hA1dZUSglro998Z7j6x+kBAy1trJnpQb++nGaJIO5zmwx+btmuT/CfvaTtnF5PXAamcakFg2iMVOQNc=
X-Received: by 2002:a5d:9e4f:: with SMTP id i15mr4220572ioi.58.1627565693105;
 Thu, 29 Jul 2021 06:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <c3fed7c5819f63ae1cb685d05992f2b36f4de055.1627007853.git.siyanteng@loongson.cn>
In-Reply-To: <c3fed7c5819f63ae1cb685d05992f2b36f4de055.1627007853.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 29 Jul 2021 21:34:16 +0800
Message-ID: <CAJy-AmmVFxcDQPSfd1ZhR5GTC8ESRixWABrk4E5E8Ay-owWwuw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] docs/zh_CN: add virt acrn index translation
To:     Yanteng Si <siyanteng@loongson.cn>, wanpengli@tencent.com
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 23, 2021 at 10:45 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translate Documentation/virt/acrn/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/virt/acrn/index.rst    | 27 +++++++++++++++++++
>  .../translations/zh_CN/virt/index.rst         |  2 +-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/virt/acrn/index.rst
>
> diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Docum=
entation/translations/zh_CN/virt/acrn/index.rst
> new file mode 100644
> index 000000000000..909e58a045a5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
> @@ -0,0 +1,27 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/virt/acrn/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +
> +.. _cn_virt_acrn_index:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +ACRN=E7=AE=A1=E7=90=86=E5=B9=B3=E5=8F=B0

CC, Wanpeng,
Any comments for the translation of 'Hypervisor'?

Thanks
Alex
