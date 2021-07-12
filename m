Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E55C07E99
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 17:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E9B4611CD
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 17:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhGLRfj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 13:35:39 -0400
Received: from ms.lwn.net ([45.79.88.28]:43190 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235709AbhGLRfi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Jul 2021 13:35:38 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3BBEB2ED;
        Mon, 12 Jul 2021 17:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3BBEB2ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1626111170; bh=MFBERqBqdGAOJDx89bsYqSx4XlYljh2u92JPpRa2/4U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FhHpUJ+O6MgJ5JtvB0LC5EIGHNjRLQXvKSci8q0Qyqu7CwwNRL+pmTnHW/r+Rcp2O
         KW2uyp2gLH9tg9eV4Waka/CT/YbbPBh3D/8NBZUjT8y2kmyiuoD5rQY1e6QwQ3bRK+
         Ao9Ls/NQmacUqLVRJ5XS0+IySB2puYFpWNJ7h+HoVUg/g64NfJe8rlQbYl7zeKF675
         iw3aEQEDt2mDway8C0czanU/cfAg4qP2T9wCuRkQew78AtnBgcYqm1b+4umHjpRXnv
         zKeMydfe9H+I4h/+qPrIhb+9nQVXDgXTRi2/AIGJpyykLKlR33k3CD0D3SRcQr7KyR
         Vumhm71b/BmtA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v6 0/2] docs/core-api: add memory_hotplug and protection
 keys
In-Reply-To: <cover.1625797729.git.siyanteng@loongson.cn>
References: <cover.1625797729.git.siyanteng@loongson.cn>
Date:   Mon, 12 Jul 2021 11:32:49 -0600
Message-ID: <87eec3phdq.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v6:
>
> * Is anyone else reviewing this set? :-)
>
> v5:
>
> * pick Alex's Reviewed-by tag.
>
> v4:
>
> * pick Xiangcheng's Reviewed-by tag.
>
> v3:
>
> PATCH 2/2:
> * Modified some words under Xiangcheng's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> v2:
>
> PATCH 1/2:
> * Modified some words under Xiangcheng's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> Yanteng Si (2):
>   docs/zh_CN: add core api memory_hotplug translation
>   docs/zh_CN: add core api protection keys translation
>
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/memory-hotplug.rst         | 126 ++++++++++++++++++
>  .../zh_CN/core-api/protection-keys.rst        |  99 ++++++++++++++
>  3 files changed, 226 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/memory-hotp=
lug.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/protection-=
keys.rst

Set applied, thanks.

jon
