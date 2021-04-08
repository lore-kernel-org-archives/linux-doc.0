Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09443C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 17:40:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A51CB610FA
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 17:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhDHRka (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 13:40:30 -0400
Received: from ms.lwn.net ([45.79.88.28]:57060 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231716AbhDHRk3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Apr 2021 13:40:29 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9133952B9;
        Thu,  8 Apr 2021 17:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9133952B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617903617; bh=4AKnhmfrmhI6EaJeGMNFlETgEnuOzeQIdfJtwSqfYhc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NzCTnWblz0m8oJhpbJQmjqXbEatvnu3ROtYt/DwWRRd03nHaQM0/672wtpTiJ4HAg
         FBrHq5QROb5QfXSoKZERrDq4CsG2hNLNQWaF2RAbrXlKH6nYOApQB1Z7Agfi92+ifI
         TglTCXSCLTXvwTzBGFT/FXbgRNhx4zSaWBiS1uOMc29eDWCZDWEEYXFUS/wdBcXw56
         WoX37TXerftzdHDeV2D7kOKZjEnBHzBG4WT5009R5/+hbjhusvQ4xULAKbZH76sMZ+
         UcQgI8zfDpcf6kkQQ8Ex0bauHm2HLIKHQCPAkrQg4DB7GcBsGZgC5MKnc//pmeDeEU
         omgZcKO6yJjdw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v4 0/8] docs/zh_CN: add cpu-freq translation
In-Reply-To: <20210406070239.19910-1-siyanteng@loongson.cn>
References: <20210406070239.19910-1-siyanteng@loongson.cn>
Date:   Thu, 08 Apr 2021 11:40:17 -0600
Message-ID: <875z0wzncu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This series of patches:
>  translates Documention/cpu-freq/* into Chinese.
>  add .../zh_CN/mips to zh_CN index
>  add .../zh_CN/iio to zh_CN index
>  add .../zh_CN/riscv to zh_CN index

I've applied the set, thanks.

jon
