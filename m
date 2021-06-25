Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E56AC2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 17:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BA1360FD8
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 17:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhFYRUP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 13:20:15 -0400
Received: from m32-153.88.com ([43.250.32.153]:53551 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229630AbhFYRUP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Jun 2021 13:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=gAQcYyYOZgA8snHnTQ9W804vBE1CSX6RvN2TW
        zUm50c=; b=VG6aM9kgK6LSFTxXwMHG1WxBSWBJYBHLfginN7HcWsRjbos5nl5T5
        suX5fPXI2aD2aeLm88emP6poRRbtpqqyuvLONA6scR5Wsx061HguNtrpr5wiKqg1
        H54l2vgnqAP4ZYpJr7Ey6P3ajiQpWC0Iag7Go1yA/Yywfu0jcj09UI=
Received: from bobwxc.top (unknown [112.96.165.31])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDHnfy9D9ZgnV0rAA--.26199S2;
        Sat, 26 Jun 2021 01:17:51 +0800 (CST)
Date:   Sat, 26 Jun 2021 01:17:48 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        SeongJae Park <sj38.park@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] docs: pdfdocs: Improve alignment of CJK ascii-art
Message-ID: <20210625171748.GA27602@bobwxc.top>
References: <386938dc-6290-239c-4b4f-c6153f3d98c5@gmail.com>
 <20210625065524.GA11219@bobwxc.top>
 <20210625095059.7f97fd62@coco.lan>
 <ae0a7623-7ec4-937b-4b93-8435f2e94eb9@gmail.com>
 <20210625122423.4435c5e9@coco.lan>
 <b6ea891e-b6f3-318a-1b40-268f436c6860@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b6ea891e-b6f3-318a-1b40-268f436c6860@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDHnfy9D9ZgnV0rAA--.26199S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gr1xJrWkZF4kZFy8JryxXwb_yoW8Jr45pF
        4kXa47Jan5Kw1vyrZF9w4Ig34Syr4fJryUJ3W5JryFyFy5WF12vryxXa1akFZrWr1kCa4j
        9FyDXF4ku3y5CaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgYb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8MxAIw28Icx
        kI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZF
        pf9x07UTxRDUUUUU=
X-Originating-IP: [112.96.165.31]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 25, 2021 at 08:32:47PM +0900, Akira Yokosawa wrote:
> On Fri, 25 Jun 2021 12:24:23 +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 25 Jun 2021 18:22:26 +0900
> > Akira Yokosawa <akiyks@gmail.com> escreveu:
> > 
> >> On Fri, 25 Jun 2021 09:50:59 +0200, Mauro Carvalho Chehab wrote:
> [...]
> >>
> >> One minor problem might be that the Sarasa font needs manual
> >> download (and install).

It is officially releasing on Github:
<https://github.com/be5invis/Sarasa-Gothic>
Under OFL-1.1 License and provide both ttf and ttc format.
Then install 'sarasa-mono-sc-regular.ttf/c' in the compressed pack.

Above could be a part of tip message.

Thanks,
	Wu
> >>
> >>         Thanks, Akira
> > 
> > If this is not yet packaged as part of texlive packages
> > on distros, this won't be a minor issue, as we'll need
> > to find procedures and test it for all distros supported
> > by the script.
> 
> Existence of "Sarasa Mono SC" can be checked by the command:
> 
>     fc-list | grep "Sarasa Mono SC," | grep "style=Regular" | wc -l
> 
> If the result is *not* "0", you have the font somewhere in your
> fontconfig path.
> 
> I think this is portable across distros.
> Wouldn't this suffice for sphinx-pre-install?
> 
>         Thanks, Akira
> > 
> > Thanks,
> > Mauro
> > 

