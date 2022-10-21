Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5957AC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 01:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiJUBTG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 21:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiJUBTB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 21:19:01 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D3B952347A0
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 18:18:53 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Bx3Nh881FjwkUBAA--.5921S3;
        Fri, 21 Oct 2022 09:18:52 +0800 (CST)
Received: from [192.168.100.112] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+J481FjvlQCAA--.9758S3;
        Fri, 21 Oct 2022 09:18:49 +0800 (CST)
Message-ID: <fe933ee9-54a7-55d2-d0bb-2aad08ded905@loongson.cn>
Date:   Fri, 21 Oct 2022 09:18:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH V2 0/3] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 2)
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
 <8fb7cb49-2a4f-649a-d344-143a15b23a72@loongson.cn>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <8fb7cb49-2a4f-649a-d344-143a15b23a72@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+J481FjvlQCAA--.9758S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCFW3Ww48AF4fAw4DGFWrAFb_yoW5Gw4fpF
        4fKF1fJFnrCr1fCws7Wr4UJFyUJFWxW3yqg3W7Jwn3KFs8tF9Yqr4v9ryY9FyUXr4vgF1I
        vr45Kr98ua4jvrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
        0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Yanteng:

在 2022/10/20 17:28, Yanteng Si 写道:
> 
> On 10/19/22 17:32, Binbin Zhou wrote:
>> Hi all:
>>
>> As a continuation of the previous patchset
>> (https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/),
>> this patchset contains the Chinese translations of the remaining three 
>> files.
>>
>> As follows:
>>
>> this_cpu_ops.rst
>> timekeeping.rst
>> errseq.rst
>>
>> So far, the docs for section "Data structures and low-level utilities" of
>> the core-api has been translated completely.
>>
>> Thanks.
>>
>> Changes since V1:
>> - Take Xiangcheng's advices, thanks.
>>
>> Details:
>> https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
>> https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/
>>
>> Binbin Zhou (3):
>>    docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
>>    docs/zh_CN: core-api: Add timekeeping Chinese translation
>>    docs/zh_CN: core-api: Add errseq Chinese translation
> 
> Hi Binbin,
> 
> 
> When I apply your patch set, git says:
> 
> 
> git am 
> ./v2_20221019_zhoubinbin_docs_zh_cn_core_api_add_some_translations_for_the_data_structures_section_par.mbx
> Applying: docs/zh_CN: core-api: Add timekeeping Chinese translation
> error: patch failed: Documentation/translations/zh_CN/core-api/index.rst:49
> error: Documentation/translations/zh_CN/core-api/index.rst: patch does 
> not apply
> Patch failed at 0001 docs/zh_CN: core-api: Add timekeeping Chinese 
> translation
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".


Sorry, the patch delivery was incomplete due to some reasons with my 
email. I will check and resend this series of patches.

Thanks.

Binbin

> 
> 
> Thanks,
> 
> Yanteng
> 
>>
>>   .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
>>   .../translations/zh_CN/core-api/index.rst     |   5 -
>>   .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>>   .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
>>   4 files changed, 607 insertions(+), 5 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
>>   create mode 100644 
>> Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
>>   create mode 100644 
>> Documentation/translations/zh_CN/core-api/timekeeping.rst
>>

