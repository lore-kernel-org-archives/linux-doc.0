Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B46C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Dec 2021 19:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350069AbhLWTmZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Dec 2021 14:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244856AbhLWTmZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Dec 2021 14:42:25 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D2FC061401
        for <linux-doc@vger.kernel.org>; Thu, 23 Dec 2021 11:42:24 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A55496A2;
        Thu, 23 Dec 2021 19:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A55496A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1640288544; bh=YD7qSo08nyAcKTNgc/SyAkwnbgbuaJDohjdemLgjHN0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TnMc8qLFP6k+FfD4PtgzgDjDO2iKPJoCXCPltZwIhfBt7wIpmVmH96LIdAh85IIir
         0QXevHcLyuzLyN08e1HOJZa6Vfr0EEYxlY98JWz4IeiBBMKD6Sw6qd0Qg6pwraSNrM
         sMNcwBn4E9fW44zcoVrivcTIcBITAA3mXbLbiZeZvo+WmE5N0r9exKMF7YW5MuG1Rl
         7pr/mBz3cO6bhFz3tChRDzqEDHb40ll6oakGnj2Whp1XpQJu71lVC2OAQ2dIV9rLxx
         IWChnNL+dn3SmEMmo7Njda/6/ClmBYzszL5XLSSV/EsW5f6YPW0MKoifR+kxtC+RQN
         JIX9Zb0IJXFAA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add sched-domains translation
In-Reply-To: <20211222141131.10134-1-tangyizhou@huawei.com>
References: <20211222141131.10134-1-tangyizhou@huawei.com>
Date:   Thu, 23 Dec 2021 12:42:24 -0700
Message-ID: <87czlnf6qn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-domains.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
> v2:
> 1. Add Yangteng as proofreader.
> 2. Take Yangteng's advice.
>
>  .../translations/zh_CN/scheduler/index.rst    |  2 +-
>  .../zh_CN/scheduler/sched-domains.rst         | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-domains.rst

Applied, thanks.

jon
