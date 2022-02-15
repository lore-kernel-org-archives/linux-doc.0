Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D488AC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 23:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbiBOX3t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 18:29:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiBOX3s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 18:29:48 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6B2F94E9
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 15:29:38 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D4E0335F;
        Tue, 15 Feb 2022 23:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D4E0335F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1644967777; bh=HfPmrRHbCzAR+ecyBVM6oqtsCFsetn3UDiCnMNNFpis=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FrgiKFldx9tZD63cOGJqZeBC+f+N1Wk77d85QWVtytQuEqQEZp9tox1h7W3Z7rw0B
         ofzLFlmOdcSu9QscGi0sMH50Wp3h0Z0Hp1K6VNUyf1Ct7tQxAqnN6pNkYV8QB4oTxo
         cnV5a9WmokHu8crXCEsSy17G/8i0oJ/HLwHbjNh+GF03XpXLhiLpyetfnmUJgEkrX7
         S/mq73rGMzpwZuHcS1K2JHPPMcOP5qM6P/eghRXtlSESujZHjUnbJGj/zNwmpOagLl
         dtnVTuCxgUnEDIXCcmStAQxMbETwc3x2Klnc1t/iAi128ag58ytZzE5b90OUcMu/1V
         xS5ag5Tb+OIVg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add sched-energy Chinese translation
In-Reply-To: <20220208020105.14117-1-tangyizhou@huawei.com>
References: <20220208020105.14117-1-tangyizhou@huawei.com>
Date:   Tue, 15 Feb 2022 16:29:37 -0700
Message-ID: <878rub7lpa.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-energy.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
> v2:
> Take yanteng's advice.
>
>  .../translations/zh_CN/scheduler/index.rst    |   4 +-
>  .../zh_CN/scheduler/sched-energy.rst          | 351 ++++++++++++++++++
>  2 files changed, 353 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-energy.rst

Applied, thanks.

jon
