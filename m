Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C8BC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 19:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiFXTQX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 15:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiFXTQV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 15:16:21 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2B882396
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 12:16:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8BAF52A0;
        Fri, 24 Jun 2022 19:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8BAF52A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1656098180; bh=kdmpVSCgOuGAl4dB0jFzHKeSD7TAIKikxSCbG84hEMs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RQ7zOpMBrFCKnAc3rgIM/JoL9I3s2if8UmEoVjuu/K9c1a3tln128SGlwG0p0zaHI
         kWXTkFZ2Co38ATf+2m6mOBOVaK29b1DthcPwQM1536pd9tPOhgRvmC0gv2lFYSVFTu
         KBia8UmoIzjqUGxdiZMMYaZxeo1x/ANg3yanw26GfU4NAUfbj2B2Zkv+/Bre611nbf
         BNTQLfTVNZOZlmwC+U8+CkRLY7gZxfNwWkvhqCoCOdtQCBN8pDgvRKEgoE2Tgn/wqZ
         DqMn6PemDfFjwlLDp0CFXEJrLAYc1K0ok9Eu6z/KDQUnK0ZS44g1lBwRu+LV6ViRSm
         uK3GvMtoOCyiQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     chenhuacai@loongson.cn, bobwxc@email.cn, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V2 0/9] docs/zh_CN: core-api: Update the partial
 translation to 5.19-rc3
In-Reply-To: <cover.1655863769.git.zhoubinbin@loongson.cn>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
Date:   Fri, 24 Jun 2022 13:16:20 -0600
Message-ID: <87o7yh50u3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> writes:

> In this series of patches, I updated the translated file contents in the core-api
> directory to 5.19-rc3.
>
> The next step, I plan to translate the untranslated documents in the core-api
> directory. For details, please see TODOLIST in the core-api/index.rst file.
>
> Changes since V1:
> - Update the code base to 5.19-rc3
>
> - According to the suggestions of Xiangcheng and Yanteng, the translations of
>   corresponding documents are updated to make them more readable.
>   
>   The modified documents are as follows:
>     cpu_hotplug.rst
>     irq/irq-domain.rst
>     printk-format.rst
>
>   If you like, please review the mailing list for details.
>
> In addition, for the translation of the Rust part in "printk-format.rst", I will
> reorganize it into a patch to the Rust tree.
>
> Binbin Zhou (9):
>   docs/zh_CN: core-api: Update the translation of cachetlb.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of cpu_hotplug.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of irq/irq-domain.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of kernel-api.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of mm-api.rst to 5.19-rc3
>   docs/zh_CN: core-api: Update the translation of printk-basics.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of printk-format.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of workqueue.rst to
>     5.19-rc3
>   docs/zh_CN: core-api: Update the translation of xarray.rst to 5.19-rc3
>
>  .../translations/zh_CN/core-api/cachetlb.rst  |   6 +
>  .../zh_CN/core-api/cpu_hotplug.rst            | 435 +++++++++++++++---
>  .../zh_CN/core-api/irq/irq-domain.rst         |  22 +-
>  .../zh_CN/core-api/kernel-api.rst             |   3 +
>  .../translations/zh_CN/core-api/mm-api.rst    |  23 +-
>  .../zh_CN/core-api/printk-basics.rst          |   3 +-
>  .../zh_CN/core-api/printk-formats.rst         |   3 +-
>  .../translations/zh_CN/core-api/workqueue.rst |  21 +-
>  .../translations/zh_CN/core-api/xarray.rst    |   4 +-
>  9 files changed, 449 insertions(+), 71 deletions(-)

Series applied, thanks.

jon
