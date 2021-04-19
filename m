Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F7BC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 14:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66F68611CE
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 14:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239837AbhDSOeb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 10:34:31 -0400
Received: from m32-153.88.com ([43.250.32.153]:32480 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232302AbhDSOea (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Apr 2021 10:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=RE/Mcg2eEwFamrAjsbrQ8SW4dl1EtKqvhGDsb
        Fbh+a8=; b=HVpWlKMWqxmrirWUMwQHPv5NjHDNtG1/An34/9hY9VrtaNh5tml0X
        ljpoqz4LsfkMYjqiKrK/lYKja+Nb8FOjvi9tKPqHaRuuaAv3yH833bb2hvvbcCqQ
        z5TUWWLnWsp3URkBKfwQtuJvyan8Jg8J2V5N/Cf5NWQUM/VRPhSq/s=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA3wyPOlH1g8L15AA--.25201S2;
        Mon, 19 Apr 2021 22:33:51 +0800 (CST)
Date:   Mon, 19 Apr 2021 22:33:48 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Message-ID: <20210419143347.GA24340@bobwxc.top>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
 <20210419133526.GB2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210419133526.GB2531743@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgA3wyPOlH1g8L15AA--.25201S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrKF1UWF47ZrW3Gw4DArb_yoW8JFWxpF
        WDKryxJr40y3y7J3Z7Za18ur4UJa1fGrWUGwn5tryrAFZ8t3Za9r4jga1a9F9F9w4q934j
        qFy2vrZIkay5ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6ry5MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUTIztUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 02:35:26PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 19, 2021 at 09:10:55PM +0800, Yanteng Si wrote:
> > This patch translates Documentation/core-api/kernel-api.rst into Chinese.
> 
> I don't speak one word of Chinese, but this can't be right?
> 
> > +列表管理函数
> > +============
> > +
> > +Todolist:
> > +
> > +   :internal:
> 
> The corresponding section in English is:
> 
> List Management Functions
> =========================
> 
> .. kernel-doc:: include/linux/list.h
>    :internal:
> 
> and surely you need a '.. kernel-doc' to have the ':internal:' make sense?

Yes, Matthew is right. 
You need to call kernel-doc to generate related docs.

> 
> Then, I wonder how useful it is to bring kernel-doc written in English
> into a Chinese document?  Wouldn't we be better off admitting that we
> don't provide Chinese documentation for kernel APIs and referring to
> the English documents?
> 
> (I would love nothing more than to provide Chinese documentation for
> kernel APIs, but we don't have any kind of system for providing that
> today)

Emm, I think, for the completeness of translation, it is worth.

But I want to know if the extra call to kernel-doc will significant
increase docs build time? If yes, I support add links to En rather than
simply put ..kernel-doc.

Thanks,
Wu.

