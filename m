Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E70C43334
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:09:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiFWNJC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiFWNJB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:09:01 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EAC32D1E7
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:08:58 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axz+bnZbRiLKhWAA--.382S3;
        Thu, 23 Jun 2022 21:08:56 +0800 (CST)
Message-ID: <5b4f17f7-7260-63ff-bda7-a8ec2166ef31@loongson.cn>
Date:   Thu, 23 Jun 2022 21:08:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] docs/zh_CN: core-api: Update the translation of
 cachetlb.rst to 5.19-rc3
To:     Wu XiangCheng <bobwxc@email.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, chenhuacai@loongson.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <d1fe8dfa3cfc3fe38c7caf8b5cf3b3482b5bddf8.1655863769.git.zhoubinbin@loongson.cn>
 <YrMIuE3jmYE9aDLI@bobwxc.mipc>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <YrMIuE3jmYE9aDLI@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axz+bnZbRiLKhWAA--.382S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw4Duw18Zry5Aw4fGF17Wrg_yoW3KFX_Za
        n7tFW0ka1UZr1xt3WrGr18JF4UuF409w1Fgr1Dt3y5Aa4qgw4DW34DXr95ZFW3Aan8uFZx
        CFZrZr4S9rnxGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbskFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
        IFyTuYvjfUnpnQUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/22 20:19, Wu XiangCheng 写道:
> On Wed, Jun 22, 2022 at 06:18:47PM +0800, Binbin Zhou wrote:
>> Synchronous translation from upstream commit 08b0b0059bf1
>> ("mm: Add flush_dcache_folio()")
>>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

>
>> ---
>>   Documentation/translations/zh_CN/core-api/cachetlb.rst | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
>> index 6fee45fe5e80..b4a76ec75daa 100644
>> --- a/Documentation/translations/zh_CN/core-api/cachetlb.rst
>> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst

