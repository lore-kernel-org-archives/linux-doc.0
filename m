Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7DCC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD9466128A
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbhEQSbO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 14:31:14 -0400
Received: from ms.lwn.net ([45.79.88.28]:51614 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235149AbhEQSbN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 14:31:13 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 060B62E7;
        Mon, 17 May 2021 18:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 060B62E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621276197; bh=hDwnKtsI+M1oGXVTawINyzReFOjEbGL833CkXYSk6iQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kuDb/GPoTkBjiiR63BeAQQ+X7BvKTk2ZBPPTB5Qrmo4l/m8lN21y+GxfKGIMLwE4c
         xncv/3auo17jxYIjHoO3nKuU8bMv+GAsmief/ZvlzSfh+bTA+WUsRRA54ZdrZUoYhS
         X+vPPYKHAEjV/fMkGS7uoAWtRpm68O+Bk0toyVVm1Wp0y2YGY3U2z7hLu97Ij/sKv0
         dzIe9bSwF2T7rYQ09aJ38vBdETIJzllscKxubOqSvdrZY2AVnqFTtSdkJcvOhtFya1
         fbXfbhUjqLU0IMENF2wgpIe/TP8pK+LeSw5pR9466qKtUk6U097MNe+0phz5KsQW4L
         Z3WLCXWyvIu2w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH v7 0/3] docs/zh_CN add three core api docs
In-Reply-To: <cover.1621239725.git.siyanteng@loongson.cn>
References: <cover.1621239725.git.siyanteng@loongson.cn>
Date:   Mon, 17 May 2021 12:29:56 -0600
Message-ID: <87eee52oyj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v6 -> v7:
>
> * Translate sentences introduced by fixing build warnings.
> * Pick Jiaxun's review-by tag for [patch 2-3/3]
>
> https://lore.kernel.org/linux-doc/cover.1621062577.git.siyanteng@loongson.cn/T/#t

Applied, thanks.

jon
