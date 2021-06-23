Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19F3C4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 06:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80DAE6115A
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 06:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFWGrO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 02:47:14 -0400
Received: from m32-153.88.com ([43.250.32.153]:33388 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229660AbhFWGrO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 02:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=rdN4HJ1hlOhREHsAIXECXfmBOlSZBmFRowSRR
        zuOojQ=; b=MtV/taTXXj/2YdeBTnA6MT3ltdWZG+SdlLC1NC6DAtSe5gqPghqqr
        TqgaiA98gwY+7r3l/UWpE6W83hJu954JbbrQvda+0qZrnWNIDKlCLEkNfoI5ferI
        nkz8824CuhNmTeNaZa6mBNWZ9PuhmcYUbfQLf5MQD0N1ZOXQO2CA8s=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXrfxl2NJg3dQlAA--.15163S2;
        Wed, 23 Jun 2021 14:44:54 +0800 (CST)
Date:   Wed, 23 Jun 2021 14:44:53 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add translation
 zh_CN/admin-guide/efi-stub.rst
Message-ID: <20210623064452.GB20445@bobwxc.top>
References: <cover.1624169811.git.bobwxc@email.cn>
 <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
 <CAMU9jJrd05LsTtUJ8YgSP3XNYgwPjMVxfMS+6uYZGfwCCWqqnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJrd05LsTtUJ8YgSP3XNYgwPjMVxfMS+6uYZGfwCCWqqnQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXrfxl2NJg3dQlAA--.15163S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4kZFW7tw13ZryDZFW7CFg_yoW8Xw45pa
        4qkFyfK3Z7Jry3Gr4fGF47JF43AFW8u398t3Wxtw1rAwnYyF4ktrWUKry7Wr93Wry8Aayr
        uF45KFy5Cr40vrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r47MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxU8UUUUUUUU
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 23, 2021 at 11:28:46AM +0800, teng sterling wrote:
> Wu XiangCheng <bobwxc@email.cn> 于2021年6月20日周日 下午6:41写道：
> >
> > Add a new translation
> >   Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> > and link it to zh_CN/admin-guide/index.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/admin-guide/efi-stub.rst            | 86 +++++++++++++++++++
> >  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
> >  2 files changed, 87 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> >
> > diff --git a/Documentation/translations/zh_CN/admin-guide/efi-stub.rst b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> > new file mode 100644
> > index 000000000000..b6a4cedec8eb
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> > @@ -0,0 +1,86 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/admin-guide/efi-stub.rst
> > +
> > +:译者:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +=========
> > +EFI引导桩
> > +=========
> > +
> > +在x86和ARM平台上，内核zImage/bzImage可以伪装成PE/COFF映像，从而使EFI固件加载
> > +程序加载其作为EFI可执行文件。修改bzImage头以及固件加载程序跳转特定入口点的
> how about:
> 将其作为EFI可执行文件加载？

OK, good.

Thanks,
	Wu

> 
> Thanks,
> 
> Yanteng

