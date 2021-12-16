Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B2DC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 22:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbhLPWq3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 17:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhLPWq2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 17:46:28 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37A1C06173E
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 14:46:28 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D8490740;
        Thu, 16 Dec 2021 22:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D8490740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639694788; bh=QvO9A4/HhlGDUlyaGhPdhtor04O1Li1inc5AWdzVgzw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Xx6G2YBH8igaDHV6BdUFR574Q9C8vLDvrAWQfEf+ycpiw7Ny9AIl2qkHYLTtupI9m
         N49kpLzjKAZ/GKX/mV/3HvoYbYJHTTdp4ZfDyEw/UfFxYHo9ekggqXI61if7mZE3lj
         7vPzpAxu12lOGizOumfJ0J3/cUCA9XuAR4YwWhuFAX7EitbLu3jV3jkowjemKgSR6m
         hUE6s6IEi+GTVCegdrI/FiND0qsVA0NLV0iZPrGwEmaCuIdvnvnC/yG7wAUZDqSB7I
         eKYNjYT74pNYw4jdAFWWc/Jq94r0kIyyhkXd9bhZ/JrBkmQjQ6NpRO9OeNNm2VzZ9D
         g5FuGQwPWHhog==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add cputopology Chinese translation
In-Reply-To: <20211216023407.10976-1-tangyizhou@huawei.com>
References: <20211216023407.10976-1-tangyizhou@huawei.com>
Date:   Thu, 16 Dec 2021 15:46:27 -0700
Message-ID: <877dc4dv7g.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate admin-guide/cputopology.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
> v2:
> Adjust table format.
>
>  .../zh_CN/admin-guide/cputopology.rst         | 96 +++++++++++++++++++
>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>  2 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/cputopology.rst

Applied, thanks.

jon
