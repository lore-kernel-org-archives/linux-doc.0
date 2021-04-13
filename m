Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ED7C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF11A613AF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242392AbhDMFIq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:08:46 -0400
Received: from [43.250.32.171] ([43.250.32.171]:46647 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S240996AbhDMFIo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 01:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=XktHRbo6x2dtD0zgsP5zVmO9tEYrHDH+WQd8A
        KaA9H4=; b=cZaXZ88Zkct4UCO39+jiHWqxS0LtaGrWKctSj2//rRhIll8cvQV5a
        vau1wWUbFQl/u8LnrLQBHPqCvFRvIVbSkEFhjx0U+O8SJcR+Yy9I3yhQBe0QsbqG
        UYO9e7VvLJgffCjedudvXf3CMyBdJqwX5iIx6dof2yj0/LikPxd5mY=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36c9CJ3VgIWlaAA--.6614S2;
        Tue, 13 Apr 2021 13:08:20 +0800 (CST)
Date:   Tue, 13 Apr 2021 13:08:18 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/sphinx.rst
Message-ID: <20210413050818.GA19165@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <7c0d782b2d3e2f8e04fbe2393b00b99f2eead304.1617699755.git.bobwxc@email.cn>
 <9b354b27-4ff0-fc16-7566-a7da690d4e34@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b354b27-4ff0-fc16-7566-a7da690d4e34@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36c9CJ3VgIWlaAA--.6614S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5v7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4
        AK67AK6r4rMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E
        4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxUUmiiDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 12:42:38PM +0800, Alex Shi wrote:
> 
> 
> On 2021/4/7 下午3:50, Wu XiangCheng wrote:
> > +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +.. _sphinxdoc_zh:
> > +
> > +简介
> > +============
> 
> all the '=' or '-' or '~' sign number are equal to the title
> chars in original doc. we'd better keep this rule. btw, the
> Chinese chars take 2 English char width that's need 2 signs.

OK

> 
> Thanks
> Alex 

