Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E85C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 19:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243243AbhLFTSM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 14:18:12 -0500
Received: from ms.lwn.net ([45.79.88.28]:53602 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243127AbhLFTSM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 14:18:12 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EAE47385;
        Mon,  6 Dec 2021 19:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EAE47385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638818083; bh=5NvfQdzj6+NYFrrmiTVdBMZj+vj/+ScASKHPDyc3qng=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YckatOmsyU90Q0stPouaKbHg7E8NOKkO+BEV7+RADCLOfXPlrOJJ2NMoAPBmU5kfv
         c0Wpq55JtwGj8svkyTCzMXdqfZKlYCCkhVwR65bfoLY3evgdm4aBT0eBm0qKUuVwmW
         QsWPBp5kh1XM1Oij1BAcOJD7fLlleW8g1S6Lgwo1NQVp2QIa2JoJntndVZuH7NwmvL
         URkwZWBb2aHtK69RKkzlT2zzuxRIuqQa8yJjlih2hadvM1OHGCpigGDMaAlD4z849k
         /fWD0frOAN4kwc507TrvbaOCH6QDbaEXTVFDkw++P0y0vZN2qc0OgkTlkN2x2RUWAz
         GGYlbDgB7VcVA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        tangyizhou@huawei.com
Subject: Re: [PATCH v7 0/2] docs/zh_CN: add scheduler completion translation
In-Reply-To: <cover.1638777809.git.siyanteng@loongson.cn>
References: <cover.1638777809.git.siyanteng@loongson.cn>
Date:   Mon, 06 Dec 2021 12:14:42 -0700
Message-ID: <87zgpd1r6l.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v7:
>
> * Move Yizhou's Acked-by tag in index.rst to completion.rst.
>
> v6:
>
> * Pick Yizhou's Acked-by tag,
> * Fix a build warning.
>
> v5:
>
> * Modified some words under Yizhou advices.
>
> v4:
>
> * remove unused label.
> * Modified some words under Yizhou advices.
>
> v3:
>
> * Pick Reviewed-by tag.
>
> v2:
>
> * Modified some words under Alex's advices.
>
> v1:
>
> * Translate .../scheduler/completion.rst and index.rst into Chinese.
>
> Yanteng Si (2):
>   docs/zh_CN: add scheduler index translation
>   docs/zh_CN: add completion translation
>
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../zh_CN/scheduler/completion.rst            | 256 ++++++++++++++++++
>  .../translations/zh_CN/scheduler/index.rst    |  43 +++
>  3 files changed, 300 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/completion.rst
>  create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

Applied, thanks.

jon
