Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34EEC43334
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jul 2022 05:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiGTF4S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jul 2022 01:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGTF4O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 01:56:14 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD6E52442
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=RpHS2WwVhd2pMHvK4ey1YkDXT7j3Fp5DJI6Ib
        L1P67s=; b=idGRNSz1457phFhI9OTUQ4vAYKSgk1DEh6tXj8dMaptmfJQSQDAEB
        ybTpRpB4PQjmWNNEfdGndj6vJZkkALYBWbEzOMLQViuyR8vHScaRterWXguOkLw0
        cyqlsIV1811VX142E/mAwQ7S01/7lRkehGb0cp2I61PH6Nyt5L1MkQ=
Received: from bobwxc.mipc (unknown [120.242.68.201])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgB3chH1mNdiIZlUAA--.29425S2;
        Wed, 20 Jul 2022 13:56:06 +0800 (CST)
Date:   Wed, 20 Jul 2022 13:56:04 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] docs/zh_CN: core-api: Add circular-buffers
 Chinese translation
Message-ID: <YteY9BxRCXMwkgCg@bobwxc.mipc>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <945ab16a062dd6f832633fec0eccbde1899fa705.1658196777.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <945ab16a062dd6f832633fec0eccbde1899fa705.1658196777.git.zhoubinbin@loongson.cn>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3631; i=bobwxc@yeah.net;
 h=from:subject; bh=t70YgF1sjZ78K6v7/Dqlqyhr0XGRi4UMxSi6jCRgAXU=;
 b=owEB7QES/pANAwAKAbZbKBIigrCFAcsmYgBi15jith0bXvz8pkE20mPys0z/rG0j8RknGhgoghb+
 j9EzClWJAbMEAAEKAB0WIQRFujdTmQmloK0WXU+2WygSIoKwhQUCYteY4gAKCRC2WygSIoKwhR3rC/
 9n+rF5JNk5eOpsMk4VLpenu1sI6ALLJxULHsijCWzTU9oYSj/k+mTBLXewqnO1uyaR/8fvct0H8RLp
 buicSGQxNeIk3SSM846x6hMwPtMEXi2CVu2DAMm9Vnd3Z1Ov6FkcHzTzYZFVi2glOPLEk+8tKaXya8
 9nyMGFk5h2BFOkwCe0fKeex6psM+F9N3N2oQG4xNmS8LDjbMFIXTCIT9MbGxISH6RrXzpUHueLr62M
 64uelqntnLN1v3W5xQzulWXjRpSmNIHqBeH1NG5eynnABvxW08jWbM5Ogk5rQlFy4oDCwhqqU7Vi0r
 PuKluPptHc/tppaYmqr/hJTk2KchrN0JVvWYQmzTQwsitPcou8tm23Kkz5LSg+duYctidf5QxT/5YE
 iavC+wSQ+9Y3yaI8XSqU9X989h4DGU0ehZ0BpANegiAyd+xbm4FDGQybihpkFPOYym10kiQYjBf6Xz
 etpUFj/5rHfhlZzwXqOLRmqwl1+t+wO4WIe3rppWatvek=
X-Developer-Key: i=bobwxc@yeah.net; a=openpgp;
 fpr=2BF2A4AA2F0730C3279ED01D32684A40BCA7AEA7
X-CM-TRANSID: GiKnCgB3chH1mNdiIZlUAA--.29425S2
X-Coremail-Antispam: 1UD129KBjvdXoWrWry8ZryfGFy7CryfZFykuFg_yoWxXwb_ZF
        ykt34xCw4rA3WxGayfZFy5XryUuw4YgwnY93Z8tay5Zas5W3srX34DXFy3XFWUJFZ8ZrW7
        CasrXrWSvr17WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbn8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RRbyZUUUU
        U
X-Originating-IP: [120.242.68.201]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 09:04:16PM +0800, Binbin Zhou wrote:
> Translate core-api/circular-buffers.rst into Chinese.
> 
> Last English version used:
> 
> commit 714b6904e23e ("doc: Remove ".vnet" from paulmck email addresses").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>  .../zh_CN/core-api/circular-buffers.rst       | 209 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  2 files changed, 210 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst

