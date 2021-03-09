Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58747C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A3B65275
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhCIAR1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 19:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhCIARV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 19:17:21 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64189C06174A
        for <linux-doc@vger.kernel.org>; Mon,  8 Mar 2021 16:17:21 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1A06731A;
        Tue,  9 Mar 2021 00:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A06731A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615249041; bh=WkRxCuEINe7NA/cr6xwMXAMZfhLRZWAro7L9WXdLA50=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cU4uXp76JLzE/dAPTsVPp00hLuJyWQ4N2rVmsDztOZ24aso4yXihlyxS4y3B6fDtf
         3zeMLhzm52BBjE2hFPCxImQtPGSti3yk9iEgrB4p03Hg5nYesCE3HyLWKSPZV+75/a
         QgU6Jm9VZpf/FUL9nvmgzflOCc5M4hX2kNxovT3EAVH+39vFFb8r4TQBr9RRas54Rd
         N92tTtqg4rycX08FMd4tVUODi4u5uyzvf9wASaMOAdbJ0hmUsUFL96jnDlGFQ0mwIB
         V2LIYh6cl7BAw5XqJfOYOFZZ5uwZpcHL0ZkxoZkKdC5TZdHZHd6caGjuZA1cRy5rzK
         BHvpGR/tcA9cQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v4 0/4] docs/zh_CN:add riscv translation
In-Reply-To: <20210228191054.6048-1-siyanteng@loongson.cn>
References: <20210228191054.6048-1-siyanteng@loongson.cn>
Date:   Mon, 08 Mar 2021 17:17:20 -0700
Message-ID: <874khl5gfj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This series of patches translates all documents in the Doc/riscv director=
y.
>
> v1->v2:
>
> Modify the cover letter: remove some content from the tail;
>
> v2->v3
>
> remove features.rst
> todos ----> =E5=BE=85=E5=8A=9E=E4=BA=8B=E9=A1=B9
>
> v3->v4
>
> Fixed some sick sentences.
>
> Yanteng Si(4):
> docs/zh_CN:add riscv boot-image-header.rst translation
> docs/zh_CN: add riscv patch-acceptance.rst translation
> docs/zh_CN: add riscv pmu.rst translation
> docs/zh_CN: add riscv index.rst translation
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> dcumentation/translations/zh_CN/riscv/boot-image-header.rst |  67
> ++++++++++++++++++++++++++++++++++++++++
>  Documentation/translations/zh_CN/riscv/index.rst             |  29
> ++++++++++++++++++
>  Documentation/translations/zh_CN/riscv/patch-acceptance.rst  |  32
> ++++++++++++++++++++
>  Documentation/translations/zh_CN/riscv/pmu.rst               | 233
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 361 insertions(+)

Set applied, thanks.

jon
