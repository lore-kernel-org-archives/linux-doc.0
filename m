Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35124ECAAD3
	for <linux-doc@archiver.kernel.org>; Mon,  5 Sep 2022 11:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiIEL65 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Sep 2022 07:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiIEL64 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Sep 2022 07:58:56 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE085474FF
        for <linux-doc@vger.kernel.org>; Mon,  5 Sep 2022 04:58:54 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxnmt45BVjgMMRAA--.59573S3;
        Mon, 05 Sep 2022 19:58:49 +0800 (CST)
Message-ID: <6603f2f1-bc30-989e-b0f1-f78e77181b94@loongson.cn>
Date:   Mon, 5 Sep 2022 19:58:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 2/5] docs/zh_CN: add dt changesets translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
References: <cover.1662022757.git.siyanteng@loongson.cn>
 <967ae2411a8ed7a5b130dd81cb8abe31a1356c74.1662022757.git.siyanteng@loongson.cn>
 <CAJy-AmmHfrb9mgVrbrbf9vmVdYrW1HLv362xk3M_3v8yXGPtfg@mail.gmail.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <CAJy-AmmHfrb9mgVrbrbf9vmVdYrW1HLv362xk3M_3v8yXGPtfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxnmt45BVjgMMRAA--.59573S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1UZrWxJr4fJFWDuw43trb_yoW5tryfpF
        92ka93Ka1Svr47Ww47KF17Gr1ayF1xCw4jkr9Fyw4Sgr1kJ3yxZr4Ut34qgryfWrn7AFyj
        gF4Fkry8ZFW0yrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU8qNt7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/9/2 14:56, Alex Shi 写道:
> On Thu, Sep 1, 2022 at 7:16 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>> Translate .../devicetree/changesets.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../zh_CN/devicetree/changesets.rst           | 37 +++++++++++++++++++
>>   .../translations/zh_CN/devicetree/index.rst   |  3 +-
>>   2 files changed, 39 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/devicetree/changesets.rst
>>
>> diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst b/Documentation/translations/zh_CN/devicetree/changesets.rst
>> new file mode 100644
>> index 000000000000..88b2075f1ea0
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
>> @@ -0,0 +1,37 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/Devicetree/changesets.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +
>> +============
>> +设备树变更集
>> +============
>> +
>> +设备树变更集是一种方法，它允许人们以这样一种方式在实时树中应用变化，即要么应用全部的
>> +变化，要么不应用。如果在应用变更集的过程中发生错误，那么树将被回滚到之前的状态。一个
>> +变更集也可以在应用后被删除。
> ‘应用’ translation is correct, but maynot fit into Chinese habits, maybe
> 使用/实现 is better?
OK, use 使用。
>
>> +
>> +当一个变更集被应用时，所有的改变在发出OF_RECONFIG通知器之前被一次性应用到树上。这是
>> +为了让接收者在收到通知时看到一个完整的、一致的树的状态。
>> +
>> +一个变化集的顺序如下。
>> +
>> +1. of_changeset_init() - 初始化一个变更集。
>> +
>> +2. 一些DT树变化的调用，of_changeset_attach_node(), of_changeset_detach_node(),
>> +   of_changeset_add_property(), of_changeset_remove_property,
>> +   of_changeset_update_property()来准备一组变更。此时不会对活动树做任何变更。所有
>> +   的变更操作都记录在of_changeset的 `entries` 列表中。
>> +
>> +3. of_changeset_apply() - 将变更应用到树上。要么整个变更集被应用，要么如果有错误，
>> +   树会被恢复到之前的状态。核心通过锁确保正确的顺序。如果需要的话，可以使用一个解锁的
>> +   __of_changeset_apply版本。
>> +
>> +如果一个成功应用的变更集需要被删除，可以用of_changeset_revert()来完成。
>> diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
>> index 3fc355fe0037..e9aff2ccc579 100644
>> --- a/Documentation/translations/zh_CN/devicetree/index.rst
>> +++ b/Documentation/translations/zh_CN/devicetree/index.rst
>> @@ -34,9 +34,10 @@ Devicetree Overlays
>>   .. toctree::
>>      :maxdepth: 1
>>
>> +   changesets
>> +
>>   Todolist:
>>
>> -*   changesets
>>   *   dynamic-resolution-notes
>>   *   overlay-notes
>>
>> --
>> 2.31.1
>>

