Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532A8C4743E
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 401AF6140F
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhFDRGy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 13:06:54 -0400
Received: from ms.lwn.net ([45.79.88.28]:32944 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230435AbhFDRGx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jun 2021 13:06:53 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1D1C84A6;
        Fri,  4 Jun 2021 17:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1D1C84A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622826307; bh=Cr1hHsX0Y/ZT+MqFsEEt+xfMtINC+gnyFNuOLyWJlWU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HdW4Ht99Q7DRzv6pGIA7QFN2lQVdNX4lodqc5oVm8XE6t7gus4CYmRVaJeGEIBySS
         D0vBztSvnlcf+ngKxs61BaAas2YC3QcAC1alF++NTgQFCSsyZ4tmRJ7UlE9a6ecKnJ
         Ii8qekOPzrf5FJXgONEwUlm8lfwsy3et2a+NOwebDhK2Dl3Ag4wdKgYd/JHRMzTQ0E
         j5Hk2mtZDDEs9lwOjySyuJ+TNhtzKMFT4OFTUp82u5frkh1mpOccPk48mvbm617wSR
         jNey8xZ9uQ6ePPKLRczpEeBwxj4dYfEaLpyxK6AP5t5bw3NQTui5F3UczCtwOJPelj
         PDGLAYAddLB4g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN: add core api cachetlb translation
In-Reply-To: <20210604090655.1971227-1-siyanteng@loongson.cn>
References: <20210604090655.1971227-1-siyanteng@loongson.cn>
Date:   Fri, 04 Jun 2021 11:05:06 -0600
Message-ID: <874ked1ry5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Translate Documentation/core-api/cachetlb.rst into Chinese.
>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> v3:
>
> * Pick Xiangcheng's reviewed-by tag.
>
> * fix some indent.
>
> * remove Alex's proofread sign.
>
> https://lore.kernel.org/linux-doc/CAEensMzJK313Fx5p9n1KipiBQgmFbsy6iYAjPt=
=3D_rgKysenh+w@mail.gmail.com/T/#t
>
> v2:
>
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofread) sign.
>     If you don't want me to do this, please let me know.
>
> * Modified some words under Xiangcheng's and Alex's advices.
>  .../translations/zh_CN/core-api/cachetlb.rst  | 336 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   7 +-
>  2 files changed, 342 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/cachetlb.rst

Applied, thanks.

jon
