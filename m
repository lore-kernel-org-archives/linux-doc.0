Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4359DC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 06:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E06EC64F69
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 06:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhCSGmE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Mar 2021 02:42:04 -0400
Received: from [43.250.32.171] ([43.250.32.171]:48435 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234123AbhCSGlg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Mar 2021 02:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=KCSj+H3OXjaB88koat4RBAeVX1qNb8wBity9I
        uzCGjU=; b=Mo5iO7498jy7cgD9ONal86caq9gJBy8MebaYrmKJWrJmO+Uy6PgEB
        z3gggGn43ArK3oj+/difd0pcS5UZgEj+K8x2+whQlk6jyWN3kED6cUDviU/fF/4m
        oEYCZXeCSujTs+CejRK59sTZrecdvXGlHWXaPUxJty5Hqcpj69iaPQ=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdCaR1Rg2e4qAA--.35662S2;
        Fri, 19 Mar 2021 14:41:32 +0800 (CST)
Date:   Fri, 19 Mar 2021 14:41:30 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/6] docs/zh_CN: Add zh_CN/admin-guide/init.rst
Message-ID: <20210319064130.GA22188@mipc>
References: <cover.1616050069.git.bobwxc@email.cn>
 <cd2fd8d0ea2ad50afc6bd2abe15eba73b6c7940c.1616050069.git.bobwxc@email.cn>
 <1edb67b2-0d34-817f-4c43-c09967614ef2@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1edb67b2-0d34-817f-4c43-c09967614ef2@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdCaR1Rg2e4qAA--.35662S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFy5Ww45Aw4ktrykGr4fAFb_yoWxZFg_uw
        s2vrZ2kF4UJ3WkGa48GryUAryxCF4rKayjyF98tws8Xay5Gw4DXr1DWa4kJay5Grs09rW7
        C34kZryfCr17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r47MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x07U7UUUUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 19, 2021 at 01:36:16PM +0800, Alex Shi wrote:
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> 
Thanks for your review!

Regards,
WU X.C.
> 
> 在 2021/3/18 下午3:20, Wu XiangCheng 写道:
> > Add translation zh_CN/admin-guide/init.rst, and link it to
> > zh_CN/admin-guide/index.rst while clean its todo entry.
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
> >  .../translations/zh_CN/admin-guide/init.rst   | 54 +++++++++++++++++++
> >  2 files changed, 55 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/init.rst
> > 

