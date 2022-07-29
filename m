Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9008C00144
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jul 2022 06:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbiG2Gnr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jul 2022 02:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbiG2Gnq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jul 2022 02:43:46 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DD5980488
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 23:43:45 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9CUgeNiflFBAA--.28016S3;
        Fri, 29 Jul 2022 14:43:33 +0800 (CST)
Message-ID: <b5b7b215-5603-611e-78be-5fca79b3300f@loongson.cn>
Date:   Fri, 29 Jul 2022 14:43:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/8] Docs/zh_CN: Update some translation to 5.19-rc8
To:     Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658983157.git.siyanteng@loongson.cn>
 <87pmhpb608.fsf@meer.lwn.net>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <87pmhpb608.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj9CUgeNiflFBAA--.28016S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJrykAw47XF4fWrWxAFWfuFg_yoW8AF48pF
        ZxKFyIk3WrtFy5Zr40krW8XFs5ZFs7J3y5Aw17twnYvr4vqr18tF17Jry7K3yIqrWIvFya
        yw4rAFZru3WUur7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-J5rUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/28 23:40, Jonathan Corbet 写道:
> Yanteng Si <siyanteng@loongson.cn> writes:
>
>> v2:
>> *Take Alex's advice and modify "狗粮测试" to "自我测试" .
>>
>> v1:
>> * Update the following Chinese documents to 5.19-rc8:
>>
>> iio
>> dev-tools
>> mm/damon
>> PCI
>> scheduler
>>
>> Yanteng Si (8):
>>    Docs/zh_CN: Update the translation of iio_configfs to 5.19-rc8
>>    Docs/zh_CN: Update the translation of kasan to 5.19-rc8
>>    Docs/zh_CN: Update the translation of sparse to 5.19-rc8
>>    Docs/zh_CN: Update the translation of testing-overview to 5.19-rc8
>>    Docs/zh_CN: Update the translation of usage to 5.19-rc8
>>    Docs/zh_CN: Update the translation of pci-iov-howto to 5.19-rc8
>>    Docs/zh_CN: Update the translation of pci to 5.19-rc8
>>    Docs/zh_CN: Update the translation of sched-stats to 5.19-rc8
>>
>>   .../translations/zh_CN/PCI/pci-iov-howto.rst  |   7 +-
>>   Documentation/translations/zh_CN/PCI/pci.rst  |   6 +-
>>   .../zh_CN/admin-guide/mm/damon/usage.rst      |   2 +
>>   .../translations/zh_CN/dev-tools/kasan.rst    | 117 ++++++++++++------
>>   .../translations/zh_CN/dev-tools/sparse.rst   |   2 +
>>   .../zh_CN/dev-tools/testing-overview.rst      |  25 ++++
>>   .../translations/zh_CN/iio/iio_configfs.rst   |  12 +-
>>   .../zh_CN/scheduler/sched-stats.rst           |   8 +-
>>   8 files changed, 123 insertions(+), 56 deletions(-)
> So these patches create a number of checkpatch warnings:
>
>    ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit c1d82dbcb0a6 ("docs: iio: fix example formatting")'
>
> I've gone ahead and applied them anyway, but that might be a good thing
> to watch out for in the future.

Sorry, I will keep this in mind.


Thanks

Yanteng


