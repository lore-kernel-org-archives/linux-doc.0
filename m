Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41AEC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5F561A10
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:52:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhCYSwY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 14:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhCYSwU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 14:52:20 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B20C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 11:52:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D4849381;
        Thu, 25 Mar 2021 18:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D4849381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616698340; bh=GDjvigqgzxoEBqkT112E6uNUf6mhhLQTXscDeRJWi/s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kTEdby815it5GCeJ3p7HzMFL7WXHLiBfeRhp+9irMu8kDJWv31H7hBdP28I3UkaNP
         Fv2jRcmm9UPgHL0YYixMUVnABRPfVZnSrIqgAFvcwZJwap6z76enTYxnVBHVjcywDj
         b71P8VBaF1K0uNEindh57ema6b5YfVMrmEzE7WEPyIqcN45NMcbudt4KJe1C7WDbgn
         /SpxA0wLUthaCi0uPUK+/zISykMxspeBw9xmkRiGUqzbySo8qHRor85xTl9hRkiLcT
         Zs0vAlTDH0aJRz/AfrxJE+S3R0nyBr10o/xS8gtm3aKucSQAObxVbc7ZW4GTDO20SI
         4XoXVeYqEuoig==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
In-Reply-To: <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
Date:   Thu, 25 Mar 2021 12:52:19 -0600
Message-ID: <87pmznyskc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <alex.shi@linux.alibaba.com> writes:

> Cc Wu Xiangcheng,
>
> Hi Yanteng,
>
> Thanks for your work! believe we active translators could review
> for each other. :)

I'd very much like to second that.  Alex has been doing a great job of
reviewing these patches, but I think he deserves some help.

Thanks,

jon
