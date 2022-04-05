Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B5DC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  5 Apr 2022 22:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445093AbiDEWfW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Apr 2022 18:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457740AbiDEQhE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 12:37:04 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45880CF480
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 09:35:04 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35:2589:2a93:190d:b787])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7F26930D;
        Tue,  5 Apr 2022 16:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7F26930D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1649176504; bh=ny+2CUlYmXa8pnZEkTWJT55eEzt1u6l/Pzrd8I3ssOo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=I5FG5xytlOBMvuQXel+FBzp9QXwmb5Ql2J6qARYM65UqdJWNxVnsZhIw7/EEsHGjj
         T4cn9bB6+srL0crr5hODJC47YqR+tKp/u+/AmVfGl2jjJLRr9eVNSDElaMfFhbdSfJ
         4r6PcCtyGtqskuREwSdqNMVcdl+5ZqN/xoqbpnXY9f6CWoFWD8rnTNitsLBvIzGXS8
         wD7+nQqtv/d9S/+kvor5smeIFhK9lsrfYnawmHwB5UYV7tyYm6wkMZvI/4p1eVXT9V
         5dESuXFwakY9A5gudi2+JuZfieJiK175ggD3oQ+LF9S4tdEwZeMLtzHsLVtCXNJaaK
         1s9WKImYXGIKg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-debug Chinese translation
In-Reply-To: <20220317025914.27588-1-tangyizhou@huawei.com>
References: <20220317025914.27588-1-tangyizhou@huawei.com>
Date:   Tue, 05 Apr 2022 10:35:03 -0600
Message-ID: <875ynnebew.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-debug.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  .../translations/zh_CN/scheduler/index.rst    |  1 +
>  .../zh_CN/scheduler/sched-debug.rst           | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-debug.rst

Applied, thanks.

jon
