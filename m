Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6B4C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 08:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B3AA64F2B
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 08:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCQIpX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 04:45:23 -0400
Received: from m32-153.88.com ([43.250.32.153]:64383 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229505AbhCQIpU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Mar 2021 04:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=0pY40MTBe8RYcz4skgu317roYX0EzL29bB5Pq
        wQHnM0=; b=XOrNMOaazBMBJmSlMvRKFLSu+ReS0RL2aOdthinkLPRdv0/Lr1PGF
        yzug70tfNsCub2coOuGeAx+4XAAMRyrv6EctD1IZ53hJ9QbREpztiyfXxVuLj93L
        jFmEmy5nWKar9CkEldWXsSMJ2FYIImH6v5FKSX6yfzKnw8Hb4s/k24=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHEySZwVFg0QoyAA--.57852S2;
        Wed, 17 Mar 2021 16:45:15 +0800 (CST)
Date:   Wed, 17 Mar 2021 16:45:13 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Add translations in zh_CN/admin-guide/
Message-ID: <20210317084513.GB3057@mipc>
References: <cover.1615950640.git.bobwxc@email.cn>
 <6bac3797-5773-a714-2514-465428465827@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bac3797-5773-a714-2514-465428465827@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCHEySZwVFg0QoyAA--.57852S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7ur15XrWxZFWrGr1xKrg_yoW8KFW3pa
        yvkFyFg3Z7AFnxG397Wr47Ga12yF48Zws8G34fXw18Kwn5AF4Dtr1jgr42g398ur1rta4f
        ArWYqF98CryjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8ZwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUjbo7tUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 17, 2021 at 03:26:46PM +0800, Alex Shi wrote:
> Good work, xiangcheng,
> 
> Just why your patchset dispersed in different series?
> Could you put them together by 'git send-email' or
> by other email clients? That could help a lot for
> patchset pickup.
>
Ahh, yes. Sorry for that. The 'In-Reply-To' head is corrcet but
'Reference' head got in to mess. 
I tried to give a reference to the previous version, but seems 
not good even worse. Won't do that any more.
Maybe a new version tomorrow or late more beautiful and bring 
another translation.

Thanks
Wu X.C.
> 
> 
> 在 2021/3/17 下午12:32, Wu XiangCheng 写道:
> > Hi all,
> > 
> > This set of patches aims to add some translations in zh_CN/admin-guide/ .
> > 
> > - V1
> >   - Re-manage the patch thread 
> >   - Add zh_CN/admin-guide/security-bugs.rst
> >   - Modify one word in [Patch 3/4] under Alex Shi's suggestion
> >   - Pick Alex Shi's Reviewed-by tag for [Patch 1~2/4]
> > 
> > - V0
> >   - Add zh_CN/admin-guide/reporting-issues.rst
> >     <https://lore.kernel.org/linux-doc/20210315110119.GA9524@mipc/>
> >   - Add zh_CN/admin-guide/bug-bisect.rst
> >     <https://lore.kernel.org/linux-doc/b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn/>
> >   - Add zh_CN/admin-guide/bug-hunting.rst
> >     <https://lore.kernel.org/linux-doc/20210315110119.GA9524@mipc/>
> > 
> > Thanks!
> > 
> > Wu XiangCheng (4):
> >   docs/zh_CN: Add zh_CN/admin-guide/reporting-issues
> >   docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
> >   docs/zh_CN: Add zh_CN/admin-guide/bug-hunting.rst
> >   docs/zh_CN: Add zh_CN/admin-guide/security-bugs.rst
> > 
> >  .../zh_CN/admin-guide/bug-bisect.rst          |   81 ++
> >  .../zh_CN/admin-guide/bug-hunting.rst         |  340 +++++
> >  .../translations/zh_CN/admin-guide/index.rst  |   11 +-
> >  .../zh_CN/admin-guide/reporting-issues.rst    | 1269 +++++++++++++++++
> >  .../zh_CN/admin-guide/security-bugs.rst       |   74 +
> >  5 files changed, 1772 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst
> > 

