Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12B8C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jul 2022 05:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiGTF6J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jul 2022 01:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbiGTF6I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 01:58:08 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2F3564C3
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 22:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=qvulscY7zsRZNpljrW08i/W99dxMy1VvcBLwW
        eK6bOk=; b=E/hekW8YR5L0iqVoXni5FEHz9AzTSq8oIGTE15RtKpmgRKKIiMC6q
        U3ubKyTEKryA+ZgDSU3J3QjqiV8F0uPm42uRvJgNcjvynCpp4V4yZL0eL2RRqmTE
        TCzsF/agIEG1JsWcND2PUHRURTc6dlkPlUgk/YJ5eT0ZOwU007bxCw=
Received: from bobwxc.mipc (unknown [120.242.68.201])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnzxNhmddixZlUAA--.13573S2;
        Wed, 20 Jul 2022 13:57:55 +0800 (CST)
Date:   Wed, 20 Jul 2022 13:57:51 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] docs/zh_CN: core-api: Add generic-radix-tree
 Chinese translation
Message-ID: <YteZX8ZI6LnPEprk@bobwxc.mipc>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114; i=bobwxc@yeah.net;
 h=from:subject; bh=GLsnfcVfZpI+ANExUCuUTtzBHs2PWG3CB5Fl9p8eeH0=;
 b=owEB7QES/pANAwAKAbZbKBIigrCFAcsmYgBi15k5W4GKylS4ZMy51nUz2IMsHxE2isDBIxhvmYqD
 VEqMeAKJAbMEAAEKAB0WIQRFujdTmQmloK0WXU+2WygSIoKwhQUCYteZOQAKCRC2WygSIoKwhYcdDA
 DJaOJSJSoiZC9EA4bjIZ15LGNVjGMJL5YmUM1D1xVpcCQVV/MbWOZhbaN4OpWP4mcRQtP7ai4I0QQO
 yBgM44f73CA9biA7Lb3yJfKAXeTYHMrCUrU1CZrgMnmvLgwWNW00YEUmDcr9tBGosYghudxXT7u5IY
 6oH4aVJpa7H4QuY1sGvOHhzF8UCnOG5djMAIiSv3LW2AhyW34caCglsxGLDVNNeWfzbeNzxBKBTydt
 fc87LOh5EMY1GEGxJKR5Uux0gn/yY8AiQ2+eVlkr0lbHDcrx261+f6mkdlofbcvLer00nyEarKRq+J
 SHjUC+mr3bd0bvGU+kZlBlg82LAa+rE6LSbKNUlrTN1pKEUj3u7nMz02+NOL1W6lsUdQ62mXy87LFf
 NWVbXqXyFDKZgrfqR6eRoGvVmli8wtFGfe9Hs1+Q9ujTPZWoVJJDbkdqaZOg4no6GFGQWABwLjToD2
 y+4/YFTdmqn2IEZ1KFC3lRqULKpc4UtKnSgVifoLOryd8=
X-Developer-Key: i=bobwxc@yeah.net; a=openpgp;
 fpr=2BF2A4AA2F0730C3279ED01D32684A40BCA7AEA7
X-CM-TRANSID: GiKnCgAnzxNhmddixZlUAA--.13573S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU537k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x0zR_Oz3UUUUU=
X-Originating-IP: [120.242.68.201]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 09:04:17PM +0800, Binbin Zhou wrote:
> Translate core-api/generic-radix-tree.rst into Chinese.
> 
> Last English version used:
> 
> commit ba20ba2e3743 ("generic radix trees").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>  .../zh_CN/core-api/generic-radix-tree.rst     | 23 +++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |  2 +-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst

