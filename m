Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFBCC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 351B461164
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhINU6k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:58:40 -0400
Received: from ms.lwn.net ([45.79.88.28]:40692 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233101AbhINU6j (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 16:58:39 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C6C2D2CA;
        Tue, 14 Sep 2021 20:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C6C2D2CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1631653041; bh=sc4WoCmhols40bh6s3g0JTljTe4smchEVbUonbHheRQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JP2OyQwuIf/07ftBUDBZq4qlUAPW9X94wDMiM283T9sFBC+dBmnqkVyj+Nx1VLWBz
         DfYRxpNtA0tM9eiAeKDuan7+UhRaCLdmZ2U4QFDAts1m6fo0imBRBV0tCTF4YrNqpZ
         vBIdQZcGgfCYO0nNhj4sEGECi1gGzJSPWJHiCBuoHXg8CznWeU6P3Z8J1ksXDqkxo2
         GykyP4FJHWIo1zRcJFDZrF3OgiN/QODPHt6DRN0PhZiS1JonqHPFrDWzTiJi+Oli+G
         pHJVLYRskf+PO91RrJDdcSHIpm3FMpezGcC7iXHKeeKOgM/CoEBK/ctgLTSYnkXdsw
         JAXBeAXzmmOdg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v5 0/6] docs/zh_CN: add core-api Memory management
 translation
In-Reply-To: <cover.1630747462.git.siyanteng@loongson.cn>
References: <cover.1630747462.git.siyanteng@loongson.cn>
Date:   Tue, 14 Sep 2021 14:57:21 -0600
Message-ID: <87zgsedgem.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v5:
>
> * resent to linux-doc list.
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
>
>  .../zh_CN/core-api/boot-time-mm.rst           |  49 ++++
>  .../translations/zh_CN/core-api/genalloc.rst  | 109 +++++++++
>  .../zh_CN/core-api/gfp_mask-from-fs-io.rst    |  66 +++++
>  .../translations/zh_CN/core-api/index.rst     |  14 +-
>  .../zh_CN/core-api/memory-allocation.rst      | 138 +++++++++++
>  .../translations/zh_CN/core-api/mm-api.rst    | 110 +++++++++
>  .../core-api/unaligned-memory-access.rst      | 229 ++++++++++++++++++
>  7 files changed, 710 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-m=
m.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/genalloc.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-fr=
om-fs-io.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/memory-allo=
cation.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/unaligned-m=
emory-access.rst

This set adds a new warning:

  Documentation/translations/zh_CN/core-api/mm-api.rst:35: WARNING: duplica=
te label mm-api-gfp-flags, other instance in /stuff/k/git/kernel/Documentat=
ion/core-api/mm-api.rst

Please fix this and resubmit (and please always test the docs build
before submitting patches!)

Thanks,

jon
