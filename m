Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B972EC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 21:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236702AbhLJVd7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 16:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344408AbhLJVd7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 16:33:59 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D204BC0617A1
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 13:30:23 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7B9C560C;
        Fri, 10 Dec 2021 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B9C560C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639171823; bh=3WOd+9U3nEUFgs8Y8tTEuh1KhCFo/Azo3Uo2lvmhnHk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jtBSEEtQJBpZEDYP1n8oeNX9yDnKFXaJVdiCo9qMiN4NAam4hd9BAc4EY9RnXM2l8
         TvQ+T9JhKb1vmx3p5zc3UtDuiwRA37tbjN+zZc9eaXD6eJkxvSZ3jroj3/aRcIIfnH
         U5msjdE8POQQy5Wws3Zen0FUblC7Miv+p6GVY2JiiIVaBXgbrKUVSeEd1uL79UiT+A
         6wrD7WXxP6oh6eyWHU2fQGJvzcww1wwuWcuc1cTNeAiGQPqhf1OF1SODoCsrFAGuMS
         Hz3cJ3BL+drR3rvy21WAWIKaD5+YZMAmiTKFxzEX3olfAvDF8SUn9l3F0GV5wmdiV/
         LfVNa4ZPOi2KA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        alexs@kernel.org, seakeel@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com
Subject: Re: [PATCH -next v2] doc/zh-CN: Update cpu-freq/core.rst to make it
 more readable
In-Reply-To: <0ec7c579-1495-d102-ff5f-07ba089ca47e@huawei.com>
References: <20211202130240.27942-1-tangyizhou@huawei.com>
 <0ec7c579-1495-d102-ff5f-07ba089ca47e@huawei.com>
Date:   Fri, 10 Dec 2021 14:30:22 -0700
Message-ID: <87a6h8qhap.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> On 2021/12/2 21:02, Tang Yizhou wrote:
>> These Chinese translations are easier to understand.
>> 
>> Also update the first memeber of struct cpufreq_freqs.
>> 
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> Acked-by: Yanteng Si <siyanteng@loongson.cn>
>> Reviewed-by: Alex Shi <alexs@kernel.org>
>> ---
>> v2:
>> 1. Take Yangteng's advice.
>> 2. Add proofreader.
>> 3. Add Acked-by and Reviewed-by tag.

> Hi, jon! Could you please apply this patch? Thanks.

Done.

Please note, though, that four days is to soon to start nagging
maintainers to apply patches.

Thanks,

jon
