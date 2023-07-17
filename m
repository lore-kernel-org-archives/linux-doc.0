Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DA0EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jul 2023 07:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjGQHSW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jul 2023 03:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjGQHSV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jul 2023 03:18:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA0910DC;
        Mon, 17 Jul 2023 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=5zOIbClyPBB0g7E/9Ep3mHfrOqRhJR73izfRITA70uE=; b=mpmZf3KPi6MsLLgZcZcLTwbrrs
        MqtUkuYOZhfzyGE/5zsZL3UJUvj+SXuhkh2RYtjD/GAzR9aGesSSFQ+jjcwtBPMmmj1hpHGgTbqX4
        XnZerhlDYS4J9J/JH5zdRLyyHigZ2gcB1iDtR7HC7h+IpUo/RMAXMVbI9W4DT7E09N/mupY5mBMMt
        mRmS8yZz3/BhEoySq/0Rou01GxT+0epBDj287CHz+EUOfViIO5oVaRt6Y54hj/1wSg0fhja4HObzG
        bUNB3XnMkCaGXaw6vXEG56kkwnG7+wZ4GfslTbs1FpexkpXl7y0p1M9/Sp/rwcVHdr677jMQG4ITz
        95oDYbIw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qLIUR-003I0I-2f;
        Mon, 17 Jul 2023 07:17:52 +0000
Message-ID: <168c502c-6c82-8825-67cc-aa30af0c7c30@infradead.org>
Date:   Mon, 17 Jul 2023 00:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] docs: move loongarch under arch
Content-Language: en-US
To:     Costa Shulyupin <costa.shul@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:LOONGARCH" <loongarch@lists.linux.dev>
References: <20230717070643.313689-1-costa.shul@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230717070643.313689-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 7/17/23 00:06, Costa Shulyupin wrote:
> and fix all in-tree references.
> 
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
> 
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/arch/index.rst                                  | 2 +-
>  Documentation/{ => arch}/loongarch/booting.rst                | 0
>  Documentation/{ => arch}/loongarch/features.rst               | 0
>  Documentation/{ => arch}/loongarch/index.rst                  | 0
>  Documentation/{ => arch}/loongarch/introduction.rst           | 0
>  Documentation/{ => arch}/loongarch/irq-chip-model.rst         | 0
>  Documentation/translations/zh_CN/arch/index.rst               | 2 +-
>  .../translations/zh_CN/{ => arch}/loongarch/booting.rst       | 4 ++--
>  .../translations/zh_CN/{ => arch}/loongarch/features.rst      | 4 ++--
>  .../translations/zh_CN/{ => arch}/loongarch/index.rst         | 4 ++--
>  .../translations/zh_CN/{ => arch}/loongarch/introduction.rst  | 4 ++--
>  .../zh_CN/{ => arch}/loongarch/irq-chip-model.rst             | 4 ++--
>  12 files changed, 12 insertions(+), 12 deletions(-)
>  rename Documentation/{ => arch}/loongarch/booting.rst (100%)
>  rename Documentation/{ => arch}/loongarch/features.rst (100%)
>  rename Documentation/{ => arch}/loongarch/index.rst (100%)
>  rename Documentation/{ => arch}/loongarch/introduction.rst (100%)
>  rename Documentation/{ => arch}/loongarch/irq-chip-model.rst (100%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/booting.rst (94%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/features.rst (61%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/index.rst (78%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/introduction.rst (99%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/irq-chip-model.rst (98%)
> 

> diff --git a/Documentation/loongarch/booting.rst b/Documentation/arch/loongarch/booting.rst
> similarity index 100%
> rename from Documentation/loongarch/booting.rst
> rename to Documentation/arch/loongarch/booting.rst
> diff --git a/Documentation/loongarch/features.rst b/Documentation/arch/loongarch/features.rst
> similarity index 100%
> rename from Documentation/loongarch/features.rst
> rename to Documentation/arch/loongarch/features.rst
> diff --git a/Documentation/loongarch/index.rst b/Documentation/arch/loongarch/index.rst
> similarity index 100%
> rename from Documentation/loongarch/index.rst
> rename to Documentation/arch/loongarch/index.rst
> diff --git a/Documentation/loongarch/introduction.rst b/Documentation/arch/loongarch/introduction.rst
> similarity index 100%
> rename from Documentation/loongarch/introduction.rst
> rename to Documentation/arch/loongarch/introduction.rst
> diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
> similarity index 100%
> rename from Documentation/loongarch/irq-chip-model.rst
> rename to Documentation/arch/loongarch/irq-chip-model.rst


-- 
~Randy
