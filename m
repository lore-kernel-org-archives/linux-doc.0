Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C61C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 22:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhK2WGF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:06:05 -0500
Received: from ms.lwn.net ([45.79.88.28]:53556 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231414AbhK2WEE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Nov 2021 17:04:04 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 95C2E221;
        Mon, 29 Nov 2021 22:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 95C2E221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638223246; bh=dlA7vZKEPgfeAV3GNggyfwAGtJlK8d1BqLrj3SB9fdc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=V1N9zONLBpLwcpJG8w3Da/cmMBD0oTuMje836iCA8AxM2fzggsSYhrKB6cACeFoDH
         lql2R3zpTaCSjjyMea9dOPYrossQJV6EENtvSAcyy4xgt+HQwMjtp3m589dunTknFt
         l64MD3hHNkvfV2VhCk7044qB3bl5nj7HaMcQGy+WrN3FAG0J0EXy76cSBBxZ7y2V1T
         LBc1Lj+9lcPezGsMZVH4mJCVoo3TG1+67nPENYRMxgNSyooqyYjbkCii4RcNXhXkmF
         2B6zpU2H+6TmC+BnQiqZ6AjvD6rCI2Wj7qwmBT+3yTgk5sF7cJi2wShZHTKWZaSK1c
         gG/mrFo6NXBFQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn
Subject: Re: [PATCH v2 1/2] docs/zh_CN: add pciebus-howto translation
In-Reply-To: <bd22bd2c4c1a9d869dbd69148a7b94b2e33f8e5c.1636683482.git.siyanteng@loongson.cn>
References: <cover.1636683482.git.siyanteng@loongson.cn>
 <bd22bd2c4c1a9d869dbd69148a7b94b2e33f8e5c.1636683482.git.siyanteng@loongson.cn>
Date:   Mon, 29 Nov 2021 15:00:46 -0700
Message-ID: <87bl22sju9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> Translate .../PCI/pciebus-howto.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Set applied, thanks.

jon
