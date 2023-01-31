Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C763EC636CD
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 20:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjAaUeV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 15:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjAaUeU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 15:34:20 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FFA34C2A
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 12:34:18 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F300831A;
        Tue, 31 Jan 2023 20:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F300831A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675197258; bh=xB8N4GBoYNpvi40rDR+6aGwFYaCXnkzse+zntaS/qNA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kHeNWd2+65rk+D9E5aJ9fBuNpQt0ttsSvMWkK1Kl9zGaTjJSjAH8ap9CNFXbhf6kG
         Mm3Ef/y7aYyeWXuNpRT0EgBAs4zVZY0RpcIh9Y7RVL1OTBV6slv78AcKSR+V/7giqo
         2gIawLnSRMBVd1Y/czy3DS53PjvnCDJvAhN8++LTm/RDfs2Ndg6X9MqsE+vsV4wiRw
         JFKSYOwPOWnbLPXRXiBRDNwHpIK7Ak/Vov8QXc53zAayUt4FkPwLshV1OwPLFUnXYP
         rfzNU7IfeohagubRkuOZGS9hDMTXKLHzZZSDqGdoEi5hmdSX1x1Bzn7lTzcGDGWsqv
         WRhnWQv/YWCeQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Zang Leigang <zangleigang@hisilicon.com>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     rppt@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: add damon lru_sort translation
In-Reply-To: <20230130120509.12029-1-zangleigang@hisilicon.com>
References: <20230130120509.12029-1-zangleigang@hisilicon.com>
Date:   Tue, 31 Jan 2023 13:34:17 -0700
Message-ID: <87y1pi30l2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Zang Leigang <zangleigang@hisilicon.com> writes:

> Translate .../admin-guide/mm/damon/lru_sort.rst into Chinese.
>
> Signed-off-by: Zang Leigang <zangleigang@hisilicon.com>
> ---
>  .../zh_CN/admin-guide/mm/damon/index.rst      |   1 +
>  .../zh_CN/admin-guide/mm/damon/lru_sort.rst   | 263 ++++++++++++++++++
>  2 files changed, 264 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst

Applied, thanks.

jon
