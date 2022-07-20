Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6F9C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jul 2022 05:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiGTFzy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jul 2022 01:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGTFzx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 01:55:53 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CAD13F29
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=C9YcESTR/j+mV5ubB2Ub8zANoMwYvtuHeT98i
        h7hDEU=; b=ZrlkIdV3zsLRWtJ3n84ZF3/pG3JfT0vyYj9Zx7Dqa4SGyDQ/4cxSA
        XXq+Q5oXbFfPHCyhzVCvzNzU64SRUG0fv1z+n6kkTrzCnYeT2xsfLfZLmTOsqAdl
        pnmEGfW8dfxLPcU5gkqYLjaAu4J6RWzyUZSgpMATXtmZcBcwz40xNE=
Received: from bobwxc.mipc (unknown [120.242.68.201])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHghHamNdi8phUAA--.33340S2;
        Wed, 20 Jul 2022 13:55:40 +0800 (CST)
Date:   Wed, 20 Jul 2022 13:55:38 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] docs/zh_CN: core-api: Add idr Chinese translation
Message-ID: <YteY2oXWkhTdFnvM@bobwxc.mipc>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <d98c444489ba3402f83a12524d83926048d559d2.1658196777.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d98c444489ba3402f83a12524d83926048d559d2.1658196777.git.zhoubinbin@loongson.cn>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5131; i=bobwxc@yeah.net;
 h=from:subject; bh=1My4HKpmeeTZKHAGj/swzgz7SUyb81QHNSLXg6Oq7rE=;
 b=owEB7QES/pANAwAKAbZbKBIigrCFAcsmYgBi15hoWLBS7odkuiJxYPok85eC5hzfUVbBgsIPIcsG
 zKz6fPuJAbMEAAEKAB0WIQRFujdTmQmloK0WXU+2WygSIoKwhQUCYteYaAAKCRC2WygSIoKwhe60DA
 CMNs6I4z8FXUKbJltHaq0GVoPZx+w0YWH3njTfp2W85UmVL9+QNWAkFQK4YxCnUJI0eFwre9VCL4NC
 soksTsrc/DzYo/OXAf6IS8fuRVNDsoP+X3z9AwsF/AlQpUsFSd+zh3aFkG1ZvKM9X89P2Xp5DAQCyt
 0YZ8LaJG/HcdsbR1vKjfraeE5Rii1/lIDD39sAwm9VhFSxxUUZLdhOIhJ9Lo8OTtrjWlHKvfn/TFYK
 1wXCCI7rnRfp3xA55hzeMpmLHe6lfzgbefoqhkgodnEeBSh1Z3+zC5u9lAntqoWZVBjCXa4uU3sKH7
 x20o3aEBkm5CYLsMwQkGVe1zMv+f/nadceO1OB5/D84OAtAPmDwpBPmOWe8icyW5LMVN0aOYubXVA8
 BqMdSR9pWQ36O0lwne34PkBvwi5xJfBbGnQVjbIqV85/ezy3IPtvmN0FqEPvS/0SzAWNB9DLTqmVQS
 nrPs0bWfa1cGDp3Iac3qBt3D1JCYRj9gaXowXpW0+v2SY=
X-Developer-Key: i=bobwxc@yeah.net; a=openpgp;
 fpr=2BF2A4AA2F0730C3279ED01D32684A40BCA7AEA7
X-CM-TRANSID: GiKnCgCHghHamNdi8phUAA--.33340S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCrWDCr1xWF1ftFy7WF4DArb_yoWxGrX_Z3
        WvqFW0kr47Z3WxGayrXw1UJFyI9a1Y9w1F9Fn8t34jqa4DWrZ7W34DX3s3ZF47Ja9xZrW3
        CF9rWw4Svr17WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb0AYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU
        =
X-Originating-IP: [120.242.68.201]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 09:04:15PM +0800, Binbin Zhou wrote:
> Translate core-api/idr.rst into Chinese.
> 
> Last English version used:
> 
> commit ec8213f89005 ("Core-api: Documentation: Replace deprecated
> :c:func: Usage").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>  .../translations/zh_CN/core-api/idr.rst       | 77 +++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |  2 +-
>  2 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst

