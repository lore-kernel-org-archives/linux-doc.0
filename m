Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45820C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Nov 2022 01:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiKYBlL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Nov 2022 20:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiKYBlL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Nov 2022 20:41:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8831A1
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 17:41:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D553F62283
        for <linux-doc@vger.kernel.org>; Fri, 25 Nov 2022 01:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AE1C43470
        for <linux-doc@vger.kernel.org>; Fri, 25 Nov 2022 01:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669340465;
        bh=Y3BHuC/gbFrlwqqRocEoyTJHEdrLgDfaWv7cGqRXibA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kgn7RiqA0HAdbX+Js/oee5EudXsHbvhMyICPboFz14PGyuY4nZtGrDIEIWoDzbKcn
         zZ1grrHhfPW4x26F+VmPblbs5Qox2H7RrO2tzuW0RbjtjSiQlzRvh6jyeRyEgM+KYf
         77/me/hUXNv6sbcU8JbPuCD7m6nzCBp9SJ1tHDAQz+Tm6vdI/Zo2IvOgTi32yrJ7QG
         f+QZ9FWeWLgDHPsorMEsnvPP3pftuOxLWjWfkrOIqVNv0gaY/yGMrgwT/K2r97UhJQ
         jYi7g/G+4r5LbBYw4LrQWwVG4o2w9Yv5Vv2b3127VfxC6E0JmtC22FXKTeG23A2TQV
         PPqcf0/8h1peQ==
Received: by mail-ej1-f43.google.com with SMTP id kt23so7267756ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 17:41:05 -0800 (PST)
X-Gm-Message-State: ANoB5pkp+zNrPTw2O3MUc6X+c9/LtndKB+JGniFFv2RYsc9c3OPCim9L
        ziMA5tkEp/pG2o+ZdAL1UI5iYncgqkhRaeZcsuo=
X-Google-Smtp-Source: AA0mqf6pp4RtiVd1wxN3Spsj315yGYT2Ld7iTuXwOKiCAo8yDYdoMSQoNyzyt1gyODyBzbSiqFY1Z5h7ZiD8ljKcQoo=
X-Received: by 2002:a17:907:2143:b0:7ae:27ed:e90e with SMTP id
 rk3-20020a170907214300b007ae27ede90emr29440485ejb.224.1669340463433; Thu, 24
 Nov 2022 17:41:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669291172.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1669291172.git.siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Fri, 25 Nov 2022 09:40:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ufJgL=cK1b5UAxtb5DDw0at5pNpttV6nGrLu_7k5FDA@mail.gmail.com>
Message-ID: <CAAhV-H5ufJgL=cK1b5UAxtb5DDw0at5pNpttV6nGrLu_7k5FDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs/LoongArch: Add English and Chinese versions
 of boot image header
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        kernel@xen0n.name, wu.xiangcheng@linux.dev,
        jiaxun.yang@flygoat.com, liuyun@loongson.cn,
        linux-doc@vger.kernel.org, loongarch@lists.linux.dev,
        siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Yanteng,

I hope you can add a description about boot parameters (a0=efi_boot
a1=cmdline a2=systemtable), and then rename the file to booting.rst.

Huacai

On Thu, Nov 24, 2022 at 8:11 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> v2:
> * Fix magic start address.
> * res14 -> res4.
>
> v1:
> * Add boot image header.
> * Translate boot-image-header into Chinese.
>
> Yanteng Si (2):
>   docs/LoongArch: Add boot image header
>   docs/zh_CN: Add boot-image-header Chinese translation
>
>  Documentation/loongarch/boot-image-header.rst | 76 ++++++++++++++++++
>  Documentation/loongarch/index.rst             |  1 +
>  .../zh_CN/loongarch/boot-image-header.rst     | 77 +++++++++++++++++++
>  .../translations/zh_CN/loongarch/index.rst    |  1 +
>  4 files changed, 155 insertions(+)
>  create mode 100644 Documentation/loongarch/boot-image-header.rst
>  create mode 100644 Documentation/translations/zh_CN/loongarch/boot-image-header.rst
>
> --
> 2.31.1
>
>
