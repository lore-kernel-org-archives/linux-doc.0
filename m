Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8921DC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53F076109F
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243559AbhDMFRd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:17:33 -0400
Received: from m32-153.88.com ([43.250.32.153]:30760 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230173AbhDMFRc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 01:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Gf+Q1j0wVhJQfcNu7BpHRFvLQYkaJr84AyJHe
        s0AmI8=; b=IPItA6gkmq5W59gfJCzBj18zm5xIdQ8K44uRCckk0+7RP4/qmZ83u
        1ITX6QDUNuod3LwROqzD2Xik9nr+RE06QSWXEoV2X1R/NqBBtu3F832+zod9KS2c
        7NzDIPpm5hL/oDqhs8CJbvvDfP1ANgcem/LvzSPiWqkTvGbKffyvW0=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA3wyNTKXVgrARtAA--.59385S2;
        Tue, 13 Apr 2021 13:17:09 +0800 (CST)
Date:   Tue, 13 Apr 2021 13:17:07 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 5/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/contributing.rst
Message-ID: <20210413051707.GA19405@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
 <09477ecd-4964-01a1-b521-308aaa1ceda0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09477ecd-4964-01a1-b521-308aaa1ceda0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgA3wyNTKXVgrARtAA--.59385S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWfGF1UZFyxJryDCF1kGrg_yoW3Gwb_JF
        40qr43Wa1vyrWkAr4S9FW5JrWxGr48WFWFyw18Zw4Fqa95tan5Gw1xZr98GFWfJ3y7tFyj
        9rsxXw4Yk3ZFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8WwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUO6pPUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 01:10:56PM +0800, Alex Shi wrote:
> 
> 
> On 2021/4/7 下午3:51, Wu XiangCheng wrote:
> > +C代码编译器发出的警告常常会被视为误报，从而导致旨在让编译器闭嘴的补丁。文档
> > +构建中的警告几乎总是指向真正的问题；要消除这些警告，需要理解问题并从源头上
> > +解决问题。因此，修复文档警告的补丁不应在标题中直接写“修复警告”；它们应该指明
> 
> Since all the patches are write in English, we'd better to keep
> 'fix a warning' in English, or give a extra comment here.

Use “fix a warning(修复警告)”

Thanks!

> 
> Thanks!
>  
> > +真正修复的问题。

