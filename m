Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3462FC433DB
	for <linux-doc@archiver.kernel.org>; Sat,  9 Jan 2021 01:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED1B823AAA
	for <linux-doc@archiver.kernel.org>; Sat,  9 Jan 2021 01:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbhAIBdG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 20:33:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:38756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbhAIBdG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Jan 2021 20:33:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDE3923AAC
        for <linux-doc@vger.kernel.org>; Sat,  9 Jan 2021 01:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610155945;
        bh=JbjNVEdyxpIbo4gn40DWm+TyyTsGobIb4viUg73SHbc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C1+DKC4yZDLs0h/duFZrtDYtSIECskedA6ThLhOFtVo6je5Xck3NzZ0tCZJEL6QPY
         Y0MUjmatbOdUWGk52Eb9hw5JULu4QnM8W4/ArLAxC6wUbo4xKQp1Up2gSQGudFjWA+
         ZwIadqcLvICSeoeqQGXoBM3E0MP/9eQA2+09YVn8VKbm5+fDkirdbj8WcpAa/axAIW
         k22lvqGQPtZU89pHpXOWWefndwLhpLC1JxvF1eRqS9OOXwu7BJB2zjvWscY9lo0qnL
         vX5ymI/WX4+x2w/21RxSgPJinaIeoKP0jOPP5GmxkOazP+dFvFAqtC4HK6GZdeCC9b
         z2tuhRxF4aw4A==
Received: by mail-il1-f174.google.com with SMTP id 14so10953453ilq.2
        for <linux-doc@vger.kernel.org>; Fri, 08 Jan 2021 17:32:25 -0800 (PST)
X-Gm-Message-State: AOAM530rL/sS6DLTvbo3f4bBTDr0WyFuXyW0GVvz37qXIK7AoXaTKgi1
        JqxtPuvIq1NB3ZiCFZ20qY4Ggh6P55XmOrOMYgU=
X-Google-Smtp-Source: ABdhPJwLTzgoHNMxUiaKIDV2dBLMHkY+hekuuoNr78KN8DmQWvGVqMl0nyOj6qo9AYgNmPlwQR1Yq+QZPtuNE39F4z0=
X-Received: by 2002:a92:870b:: with SMTP id m11mr6166783ild.134.1610155945277;
 Fri, 08 Jan 2021 17:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20210108100221.1370763-1-siyanteng@loongson.cn> <20210108100221.1370763-2-siyanteng@loongson.cn>
In-Reply-To: <20210108100221.1370763-2-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Sat, 9 Jan 2021 09:32:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6aOG5R0KqR1c3Y5+pNLzcbFEC_QuYV3zp=b+3Wt=J-hA@mail.gmail.com>
Message-ID: <CAAhV-H6aOG5R0KqR1c3Y5+pNLzcbFEC_QuYV3zp=b+3Wt=J-hA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] doc/zh_CN: add mips index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Yanteng,

It is better to exchange patch 1 and patch 2.

Huacai

On Fri, Jan 8, 2021 at 6:02 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> This patch translates Documentation/mips/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/mips/index.rst
>
> diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentat=
ion/translations/zh_CN/mips/index.rst
> new file mode 100644
> index 000000000000..2c7b836a3da5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/mips/index.rst
> @@ -0,0 +1,29 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :ref:`Documentation/mips/index.rst <index>`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_index:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +MIPS=E7=89=B9=E6=80=A7=E6=96=87=E6=A1=A3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :numbered:
> +
> +   booting
> +   ingenic-tcu
> +
> +   features
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.27.0
>
