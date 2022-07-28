Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE82C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 15:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbiG1PkL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 11:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiG1PkJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 11:40:09 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A91D40
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 08:40:08 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 409F321F;
        Thu, 28 Jul 2022 15:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 409F321F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1659022808; bh=5F8XNzfSYZtYf3DYxgpvWAW2+8mRc9jMl57P1GsP8U4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JI9P+Zs+BvFC4eiPTzSokENjWMfPYYJiB4AqRNcn5tULihZ09xzmQHy1I4xCNMLbu
         /Jcr14ke9IFIBd+RNvm3m8HQcnkkskcGkemJqG42b3NMRfmi7kt+zWuydHh8tx+lzv
         XcKaib0UEv+Taviv+iyWsv/kcZQ+3WhF2uSY+JMbl5MfFyw9TVT/GcyoiwnvRPD3C7
         jG/zu0rSYNHLNpj3fYZlrQFKaGEnnpPHgcZQCsLhVp9PKd2ABhbdVfnNmXedFvUEQW
         9Y1xRiV61ibctVUsfkT5Jh76nOkfweHxL8+mc3HzQoSfETjxdyQGvnxBj7XGXlyINY
         XI6Coq50/m/Ag==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn,
        yizhou.tang@shopee.com, wanjiabing@vivo.com, leoyang.li@nxp.com,
        src.res@email.cn
Subject: Re: [PATCH v2 0/8] Docs/zh_CN: Update some translation to 5.19-rc8
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
Date:   Thu, 28 Jul 2022 09:40:07 -0600
Message-ID: <87pmhpb608.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v2:
> *Take Alex's advice and modify "=E7=8B=97=E7=B2=AE=E6=B5=8B=E8=AF=95" to =
"=E8=87=AA=E6=88=91=E6=B5=8B=E8=AF=95" .
>
> v1:
> * Update the following Chinese documents to 5.19-rc8:
>
> iio
> dev-tools
> mm/damon
> PCI
> scheduler
>
> Yanteng Si (8):
>   Docs/zh_CN: Update the translation of iio_configfs to 5.19-rc8
>   Docs/zh_CN: Update the translation of kasan to 5.19-rc8
>   Docs/zh_CN: Update the translation of sparse to 5.19-rc8
>   Docs/zh_CN: Update the translation of testing-overview to 5.19-rc8
>   Docs/zh_CN: Update the translation of usage to 5.19-rc8
>   Docs/zh_CN: Update the translation of pci-iov-howto to 5.19-rc8
>   Docs/zh_CN: Update the translation of pci to 5.19-rc8
>   Docs/zh_CN: Update the translation of sched-stats to 5.19-rc8
>
>  .../translations/zh_CN/PCI/pci-iov-howto.rst  |   7 +-
>  Documentation/translations/zh_CN/PCI/pci.rst  |   6 +-
>  .../zh_CN/admin-guide/mm/damon/usage.rst      |   2 +
>  .../translations/zh_CN/dev-tools/kasan.rst    | 117 ++++++++++++------
>  .../translations/zh_CN/dev-tools/sparse.rst   |   2 +
>  .../zh_CN/dev-tools/testing-overview.rst      |  25 ++++
>  .../translations/zh_CN/iio/iio_configfs.rst   |  12 +-
>  .../zh_CN/scheduler/sched-stats.rst           |   8 +-
>  8 files changed, 123 insertions(+), 56 deletions(-)

So these patches create a number of checkpatch warnings:

  ERROR: Please use git commit description style 'commit <12+ chars of sha1=
> ("<title line>")' - ie: 'commit c1d82dbcb0a6 ("docs: iio: fix example for=
matting")'

I've gone ahead and applied them anyway, but that might be a good thing
to watch out for in the future.

Thanks,

jon
