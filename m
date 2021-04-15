Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC02C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 02:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DCA6611B0
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 02:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhDOC3s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 22:29:48 -0400
Received: from m32-153.88.com ([43.250.32.153]:49704 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229481AbhDOC3s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Apr 2021 22:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=7Oisvm9Fjzv7BBR0o4Cvrz0X7hR3HmbFcdYyr
        oCLuWM=; b=C5xcdBS/MPBh5C115QyfDIUBxVvwdHx9mplRfX2ErXfKT3Z7GorZf
        OpK7DAeQdGKmsQvK0N9VLaH/8uyQTjiJiaQFYXYHfKaN98wT2EqRRJoKjGXivVWt
        Ykk3gNEIPrSIAWEVq4E4TupnySkTZbuVUfb09Q/D0H85STc7pCE9Ek=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX4iL5pHdgIIhwAA--.2363S2;
        Thu, 15 Apr 2021 10:29:15 +0800 (CST)
Date:   Thu, 15 Apr 2021 10:29:13 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Subject: Re: [PATCH v4 00/11] docs/zh_CN: add core api and openrisc
 translation
Message-ID: <20210415022913.GA19308@bobwxc.top>
References: <20210415013124.2256416-1-siyanteng@loongson.cn>
 <CAEensMysF7Cmq6Tzcu8n1Xw2ctdpaEpGhZ8jyvY4sEZtyToAPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEensMysF7Cmq6Tzcu8n1Xw2ctdpaEpGhZ8jyvY4sEZtyToAPw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBX4iL5pHdgIIhwAA--.2363S2
X-Coremail-Antispam: 1UD129KBjvdXoWrWr4kWryxGF1rCw4DArWUurg_yoWxWrgEga
        1vvryvkr47KanrCa12kr4vy3ZI9wsa9ry5AryUXws7Xws3JFWDJFZ5tr93Zry0yFy8JF13
        uF4UXr48Zr1UZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbo8YjsxI4VW3JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
        CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
        xhVjvjDU0xZFpf9x07Un189UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 09:58:11AM +0800, yanteng si wrote:
> Hi all,
> 
> I did a lot of tests with my mailbox last night and couldn't find the
> reason. Now that I've found it, patch 7 and patch 11 names are
> repeated; I should split into two series to send; and finally, I'm

Emmm, that's interesting, so it is a bug of git format-patch?
The created patches should have a number prefix, thus seems impossible
to mix them up.

Actually you could add two mail header "In-Reply-To:" and "References:"
by hand, then patch 11 will appeared in same thread.


Thanks,
Wu X.C.

> really sorry for wasting mailing list resources to test. T_T
> 
> Thanks,
> 
> Yanteng
> 

