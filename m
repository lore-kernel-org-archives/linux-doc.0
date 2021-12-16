Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2661BC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 22:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhLPW6e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 17:58:34 -0500
Received: from ms.lwn.net ([45.79.88.28]:50982 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231903AbhLPW6e (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Dec 2021 17:58:34 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2B17E77F;
        Thu, 16 Dec 2021 22:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2B17E77F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639695514; bh=ZeiEX1NFZe9J4lBl+Qci/8ietDI37Khr+ZQRPQWRtW0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=T3yGrIJWFq3EttHOJFr3g8gWGplWeeT1QnIfgRFrEgk0MB1HRYPipyL/gQNvSbOwB
         +fc8cux12Jkn2hCH8XhMR5d9ABUo81xzowShYy8pfaliPN5JluMYoCkEw1/TEr89s3
         79gVn3mJ9K0YwZQhyL7ANkdd//GkJtQ1+GfpryCR0ofr72zrZUlIa+UAiRfiINkssk
         Iw8QYbLOE6HTVWpDkIgxksOiI9ox2WgjOMFgERLMxldzsS58gd/uUi0PKKKqwK+2kW
         8BGbw/dN3PAyKmnREMliM7CJWe8FccvfHH9+lSLsSvZ2PZrLGijomXf3QOkmj3rFOu
         H6kRjl/r9EYIQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v4 1/1] docs/zh_CN: Add sched-capacity Chinese translation
In-Reply-To: <20211213095945.17011-2-tangyizhou@huawei.com>
References: <20211213095945.17011-1-tangyizhou@huawei.com>
 <20211213095945.17011-2-tangyizhou@huawei.com>
Date:   Thu, 16 Dec 2021 15:58:33 -0700
Message-ID: <87pmpwcg2u.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-capacity.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>  .../translations/zh_CN/scheduler/index.rst    |   2 +-
>  .../zh_CN/scheduler/sched-capacity.rst        | 390 ++++++++++++++++++
>  2 files changed, 391 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-capacity.rst

Applied, thanks.

jon
