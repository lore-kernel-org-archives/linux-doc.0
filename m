Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2656BC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 05:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D820B619A3
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 05:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhCWFUt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 01:20:49 -0400
Received: from [43.250.32.171] ([43.250.32.171]:40827 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229548AbhCWFUq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Mar 2021 01:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=dkInjdJmlsQtnVwxSDh3IObIQQyb1I3U43xkv
        HoTefY=; b=PS9BTu8HOVzvVQKcW2/duS8PYmPI4yUxhO7KpO65FAYAAOqieyxRF
        udpYy9cNaMoDI0dTZmZpaAQBPq49ZRRCFlPNrwi0cShI/0EGcoQxaPjDrgJhpCMN
        fSEaXQxghP45VWwAP1I1EsR+N82IbXKTd+hXGdeWwCtWrN2o5yQjt8=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtClellgnI81AA--.52393S2;
        Tue, 23 Mar 2021 13:20:39 +0800 (CST)
Date:   Tue, 23 Mar 2021 13:20:37 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Add translations in zh_CN/kernel-hacking/
Message-ID: <20210323052036.GA12187@mipc>
References: <20210322143743.GA7820@mipc>
 <3301bb31-f8de-1e3c-aaa0-b3d4411eb17c@linux.alibaba.com>
 <20210323050221.GA11893@mipc>
 <b7fd15be-c1de-3ea2-6bf7-012efa1a3062@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7fd15be-c1de-3ea2-6bf7-012efa1a3062@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtClellgnI81AA--.52393S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFy5AFyxWFy8tr1DAFWDurg_yoWftFc_uF
        n7AF18CrW5C3yxW3Z5Jry7trs2kr4rWF4Ut3Z5JanFgasIqF4rXrsYqayfZF1xGay5ZrnI
        k3Wa9w17J3srujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbY8YjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8WwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
        yTuYvjxUjGQ6DUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 23, 2021 at 01:13:15PM +0800, Alex Shi wrote:
> 
> 
> 在 2021/3/23 下午1:02, Wu X.C. 写道:
> >> hacking often translates as 骇客 in computer industry.
> >>
> > Yeah, generally
> > 
> >       黑客 -- Hacker
> >       骇客 -- Cracker
> > 
> > But you know 骇/黑 always give a bad meaning, not suitable for here.
> > "Hacking" is also different with "Programming".
> 
> Uh, in my mind, and usually their meaning depends on context, most
> of time they are neutral, not negative. 
> 
> alos a brand new word just increases the confusing.
> 
OK, using 骇客
I've also considered whether to use 探究
> 
> >>> +
> >>> +用户上下文是指当您从系统调用或其他trap进入时：就像用户空间一样，您可以被更
> >> trap often translates as 陷阱。
> >>
> > Is 陷阱 suitable for computer science?
> 
> Yes, I didn't see any other translation for the word. :)
>
OK

Thanks!
> 
> Thanks
> Alex
> 
> > I don't know how to translate this word.

