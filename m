Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34DAC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jul 2022 16:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbiGTQDs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jul 2022 12:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiGTQDs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 12:03:48 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A865467F
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=aiDkZlW/MFY03NintcXmMml9eUPIzL1Un/QPz
        ARI8KE=; b=GWs7rK0iVaDp2hj7bbqjG+o9WuiSMD7IutVxxqnrrH5rFCcfMOPXA
        m4j6XfVA4j7bSlfORlRRA0D7PswYeUKKz+/5+GFptmN4uevgR56veLzoH6D3POFM
        ADgWN7q81or9/LsK+XiaWDVPPXrmF1qRyngZfnP6XVrjuRyC5unJNY=
Received: from bobwxc.mipc (unknown [120.242.68.201])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3Z2RVJ9hifhc3AA--.1608S2;
        Thu, 21 Jul 2022 00:03:34 +0800 (CST)
Date:   Thu, 21 Jul 2022 00:03:31 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] docs/zh_CN: core-api: Add packing Chinese
 translation
Message-ID: <YteZiWDxOpNSN742@bobwxc.mipc>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <4ce40cebea8d95a8abfb0f86efb0ad4730e0cb51.1658196777.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ce40cebea8d95a8abfb0f86efb0ad4730e0cb51.1658196777.git.zhoubinbin@loongson.cn>
X-Developer-Signature: v=1; a=openpgp-sha256; l=635; i=bobwxc@yeah.net;
 h=from:subject; bh=65LHRr6fUChkyTWITMKugqopmr87nQUi/S3kkITjK8U=;
 b=owEB7QES/pANAwAKAbZbKBIigrCFAcsmYgBi15lnSwkX2yO1Jo+u4C3oILw4fwpHKJzHExJ3DfL/
 Fhfp80GJAbMEAAEKAB0WIQRFujdTmQmloK0WXU+2WygSIoKwhQUCYteZZwAKCRC2WygSIoKwhX9TDA
 DctqYHynfnHJwQI8eVFRVkUiAvFF11PdysSKaIfnbaEMvris42gYgT7p4rrggrdyG3D4De46BSWgu1
 QRu403wmK/zn0K4x6iDhsjMawM334WHWswQ8h9mjPt7YxI0zY3OZFn0XpUxP7wmNvVwt9CqpNGk0+/
 Cp0wmuhU49bNt5fkr6OZOlyejQLqmQUK42QJyldbyGMVufRAX8C5GeAPHWxTJqbbwWYaVJhIKTdArU
 1J7qdtJYg5AdsphVs7bBFWeiYNnstpjmpodccZ/QPvKWmbst+22/+tjIZvqlvPyjjnU1ibzsc1NWd/
 X2T+En0kHYyv2MdTmdXjXWx05TVCAvwKsoF5PBWPyc3BvjWnTxM3yfTU6NOcFRqPv5KYVZHAUG5skn
 mYzob4fo6dBWIf62Pwtm9r0KIYxG4hUxbISdOW31U3R/o65rs/VUalTlTBYK3EuIEc28Tgf8ihQsfP
 P2YwZKkPtHS95AsBZ6mmnSe6rR0mvMXI8Yg8XwzkY8/WU=
X-Developer-Key: i=bobwxc@yeah.net; a=openpgp;
 fpr=2BF2A4AA2F0730C3279ED01D32684A40BCA7AEA7
X-CM-TRANSID: LCKnCgC3Z2RVJ9hifhc3AA--.1608S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJw15Kw45Jr45tr4UWry7Awb_yoWxXrg_Z3
        WktrW0kw47XF1xJayrXw4DJFyxua1Ygw1FkF15t3yUX34kXrZrWa4DXr95ZF4UGFsIqrW3
        CFnrXr1Syry7WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb0xYjsxI4VW5JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4UJr1U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
        vE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
        Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
        0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
        AIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjTRRsjbUUUUU
X-Originating-IP: [120.242.68.201]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 09:04:18PM +0800, Binbin Zhou wrote:
> Translate core-api/packing.rst into Chinese.
> 
> Last English version used:
> 
> commit 1ec779b9fabc ("docs: packing: move it to core-api book
> and adjust markups").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../translations/zh_CN/core-api/packing.rst   | 159 ++++++++++++++++++
>  2 files changed, 160 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst

