Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CCCC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 19:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243127AbhLFTTm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 14:19:42 -0500
Received: from ms.lwn.net ([45.79.88.28]:53604 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347593AbhLFTTm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 14:19:42 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4BC144E5;
        Mon,  6 Dec 2021 19:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4BC144E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638818173; bh=1ybrVb0xY+4oOzNJlgH/oFzMd4u/ogcO4TWqwqKmS0Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bmiqgTpRKYBncOMUqHILK7w6Yyt/oM+oJxKBCVVZloNGiRrgf7qq6R+nhDKDXGa+E
         JX4ey9wLGnGKrfTcXCCT777+Jb5yKofi27vxFjVwsdxl9bSptfYdojxeqChpNLdxlg
         amvkzdXqyuRs5Ctu1nDSoApTLVjZSWqJCRThq+ciPi615u8xVNRJfCInpn5IdoquG1
         ZSKxvdTxIcOfhPO3Mk3nQPA+TpCbqn1jncB+gnoUab1cnG3sHfXVoQOGkct+b/c71s
         G/bHz8n6b42iV92s8evPHKW1TiKIZqfxgNm05U5mPCcQSDuwsjIRJWhnFKw+9wWklL
         jZCtE8+RYVcPQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: Re: [PATCH v2 0/3] docs/zh_CN: add scheduler arch and bwc translation
In-Reply-To: <cover.1638154485.git.siyanteng@loongson.cn>
References: <cover.1638154485.git.siyanteng@loongson.cn>
Date:   Mon, 06 Dec 2021 12:16:12 -0700
Message-ID: <87v9011r43.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v2:
>
> * Pick Reviewed-by tag. (Patch 2/3 and 3/3)
> * Modified some words under Alex's advices.
>
> v1:
>
> * Translate .../scheduler/sched-arch.rst and sched-bwc.rst into Chinese.
> * When I translated sched-bwc, I fixed some errata along the way.
> * fix a build warning in sched-bwc,I put them inside a patch or even in
>   a series, so if I should split them, please let me know.
>
> Yanteng Si (3):
>   docs/zh_CN: add scheduler sched-arch translation
>   docs/zh_CN: add scheduler sched-bwc translation
>   docs/scheduler: fix typo and warning in sched-bwc
>
>  Documentation/scheduler/sched-bwc.rst         |   5 +-
>  .../translations/zh_CN/scheduler/index.rst    |   3 +-
>  .../zh_CN/scheduler/sched-arch.rst            |  78 +++++++
>  .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
>  4 files changed, 288 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bwc.rst

Set applied, thanks.

jon
