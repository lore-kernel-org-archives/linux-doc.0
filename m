Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62562C63797
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ECCB6127C
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhGVJ3g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:29:36 -0400
Received: from m32-153.88.com ([43.250.32.153]:49783 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231387AbhGVJ3f (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Jul 2021 05:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=To:From:Date; bh=4t1jEto3NTI4lB3Hlg4PXZ2RAVq7Neb+5f8AR
        zkryx4=; b=K5jsdxKr7qCBYuLximRSJTQDKd0jGHLASLRRWdjd3Y0H6t3KyDejq
        mwGAluSoGET1exy+yqyDovLhYB4/Uj5CeEiajSW/6CAREjEYRW6YUirU4WGQtB0m
        YlB1Df7NJzCk25CSN/WzMPooZLZPI9hdnN5H1MpSMSlAFn/jhEfxnE=
Received: from [0.0.0.0] (unknown [180.120.41.43])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnp6f9Q_lgpsIAAA--.2707S3;
        Thu, 22 Jul 2021 18:10:07 +0800 (CST)
Subject: Re: [PATCH v4 1/2] docs: add traditional Chinese translation for
 kernel Documentation
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        panyunwang849@gmail.com
References: <20210721142537.29409-1-src.res@email.cn>
From:   Hu Haowen <src.res@email.cn>
Message-ID: <c41d175c-c665-dcf0-431d-cb186103b6b6@email.cn>
Date:   Thu, 22 Jul 2021 18:10:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721142537.29409-1-src.res@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: GiKnCgAnp6f9Q_lgpsIAAA--.2707S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5N7k0a2IF6FyUM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI
        0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCF04k20xvE
        74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUjkucDUUUU
X-Originating-IP: [180.120.41.43]
X-CM-SenderInfo: hvufh21hv6vzxdlohubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/7/21 下午10:25, Hu Haowen 写道:

> Add traditional Chinese translation (zh_TW) for the Linux Kernel
> documentation with a series of translated files.
>
> Signed-off-by: Hu Haowen <src.res@email.cn>

Mr. Pan, please take a review for this work during your spare time if
possible.

Thx,
Hu Haowen


