Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D26C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 02:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16C0A64F80
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 02:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCQCuR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 22:50:17 -0400
Received: from [43.250.32.171] ([43.250.32.171]:9101 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229469AbhCQCtu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Mar 2021 22:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=sXRb65mqfRE3cjReNNW1d9IHpH3H66v0h2rX5
        n+qkrc=; b=L/5wnpm0xsuOsYBTlml3oT/hfzmW+evor8OBFG7UVlQ4Qax6SbjiL
        E5LxVzE5zR5yaCGfaZkxsoZqnI9ExZXBNXMaTgxUv8TtbtUyk6iGNxQUoQTK/Qeb
        vFL9hzP2q9jqUSP0fYveewatLBwaZPZ71ndOz4cI7ySeHJGXuX/3v4=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtBIblFg6lQnAA--.27077S2;
        Wed, 17 Mar 2021 10:49:46 +0800 (CST)
Date:   Wed, 17 Mar 2021 10:49:44 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
Message-ID: <20210317024944.GA20193@mipc>
References: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
 <3311b919-2f86-af05-97fc-ce1d4db277f9@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3311b919-2f86-af05-97fc-ce1d4db277f9@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtBIblFg6lQnAA--.27077S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU597k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02
        Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
        GrUvcSsGvfC2KfnxnUUI43ZEXa7xRRuyIUUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 17, 2021 at 10:29:21AM +0800, Alex Shi wrote:
> LGTM.
> 
Thanks!
Is this could be regarded as a review-by?

Wu X.C.
> 
> 在 2021/3/16 下午11:40, Wu XiangCheng 写道:
> > Add translation zh_CN/admin-guide/bug-bisect.rst, and link it to
> > zh_CN/admin-guide/index.rst while clean its todo entry.
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/admin-guide/bug-bisect.rst          | 81 +++++++++++++++++++
> >  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
> >  2 files changed, 82 insertions(+), 1 deletion(-)
[...]

