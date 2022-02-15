Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877B6C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 23:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239860AbiBOX0S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 18:26:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiBOX0R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 18:26:17 -0500
X-Greylist: delayed 972 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Feb 2022 15:26:06 PST
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1925FF94D4
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 15:26:06 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AD8E2385;
        Tue, 15 Feb 2022 23:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AD8E2385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1644967565; bh=qR11O5E4FTRKvqr/geBqw8ZE6xTNEIniPbfMN13O9F8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=s9MpPrwWRVis3oSqAfQTcJ6ccHbiqVzo+c075z1OUa41hrz0zOG56F5m0ch9C7Wjw
         HzvMZcO7vckoUlOI3ii5ICcnIg9enbl1ZzJm3MPPgtUgjFxCrJsh2KuhfX3aMDisaX
         9nhft+/CUyQhSkrnZ+3aNUvHea2+/gN/56IOGsyxVA8pZa0HTOUA2GfgpjHel/CLcA
         aMIL1IAR6pJ1bNJPEiPM4FLCDXdpYpaQ2jjP46TOJRSo//xux1Ok1Zs5DtH0xyLUaN
         wIWc12exqpS/i84IA0wM602rMCYNTyAVxA9ACWA+pCeeaLkIpFBHJ2DXn6c8AqNemy
         kDvEUKceJFwRQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v5] docs/zh_CN: Add energy-model Chinese translation
In-Reply-To: <20220208133716.24070-1-tangyizhou@huawei.com>
References: <20220208133716.24070-1-tangyizhou@huawei.com>
Date:   Tue, 15 Feb 2022 16:26:05 -0700
Message-ID: <87czjn7lv6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate power/energy-model.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
> v5:
> Make some small changes.
>
> v4:
> Take Alex's advice on terms.
>
> v3:
> Don't include English kernel doc.
>
> v2:
> Translate the comments in the example program.
>
>  .../translations/zh_CN/power/energy-model.rst | 190 ++++++++++++++++++
>  .../translations/zh_CN/power/index.rst        |   2 +-
>  2 files changed, 191 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/power/energy-model.rst

Applied, thanks.

jon
