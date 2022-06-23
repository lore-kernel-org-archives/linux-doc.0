Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4609CC43334
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 16:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbiFWQKf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbiFWQKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 12:10:34 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC5517E1F
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=HTYgi26PffXDRUMii3aBaVyp8xTS9NusL81S8
        AEr9/c=; b=F01xTwYxPAjJm0Rqatf3krEBoKaiJahRfjRASew2h39+dCczg0iEC
        +mS4ZX9mSI2ay0Y8kNF1RuCPd3xrQo0rl+4cavQauMgHyYxMcIaBeOlaKlVe2jCa
        f58VlDuOwIscir2AzypQp5dAiTXbNLMt+kutM7vxNP9283YbSOQDHg=
Received: from bobwxc.mipc (unknown [120.242.71.141])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA33xNukLRivfYZAA--.8916S2;
        Fri, 24 Jun 2022 00:10:24 +0800 (CST)
Date:   Fri, 24 Jun 2022 00:10:22 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 8/9] docs/zh_CN: core-api: Update the translation of
 workqueue.rst to 5.19-rc3
Message-ID: <YrM/N6VR6OO8tNHD@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <d045cb5623b5ae703c2296d3caa05017d5d225bd.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d045cb5623b5ae703c2296d3caa05017d5d225bd.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: GiKnCgA33xNukLRivfYZAA--.8916S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw1DAFyDJF47ury5CFg_yoW3AFX_Za
        97XFW0yr4UXF93tayrGF18Jry8uF4Fkw109Fn8t39xG34DWw1kG3yDXF90vF4UXan8urW3
        uFZruw1Svr9xJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb5kYjsxI4VW7JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r1l42xK82IYc2
        Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZE
        Xa7sRNPfH7UUUUU==
X-Originating-IP: [120.242.71.141]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:19:42PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit f9eaaa82b474
> ("workqueue: doc: Call out the non-reentrance conditions")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/workqueue.rst | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
> index e372fa5cf101..f6567cf9d3fb 100644
> --- a/Documentation/translations/zh_CN/core-api/workqueue.rst
> +++ b/Documentation/translations/zh_CN/core-api/workqueue.rst

