Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77116ECAAD3
	for <linux-doc@archiver.kernel.org>; Mon,  5 Sep 2022 12:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbiIEMF5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Sep 2022 08:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiIEMF4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Sep 2022 08:05:56 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B19B5926B
        for <linux-doc@vger.kernel.org>; Mon,  5 Sep 2022 05:05:54 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXWsc5hVjicQRAA--.11815S3;
        Mon, 05 Sep 2022 20:05:49 +0800 (CST)
Message-ID: <3beb1f97-0b56-5e96-83aa-4edb17a72c5e@loongson.cn>
Date:   Mon, 5 Sep 2022 20:05:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 4/5] docs/zh_CN: add dt overlay-notes translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
References: <cover.1662022757.git.siyanteng@loongson.cn>
 <34d7438419975866785d4a4f4a2e348073e95673.1662022757.git.siyanteng@loongson.cn>
 <CAJy-AmkiSzd+7L=7ftusv_yAn_-mf49Mr3DFnnU8tN6YGeuV5A@mail.gmail.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <CAJy-AmkiSzd+7L=7ftusv_yAn_-mf49Mr3DFnnU8tN6YGeuV5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxXWsc5hVjicQRAA--.11815S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4Uur4rGr45GF45ur1kGrg_yoW3CFWUpr
        y3ua93WF17Ar1UGr1UtF48Xr13AF18ta1UKF1Ut3W8XryvyryrAr1Utas5Gr97Xry8Aryj
        kF4jkF97Ar10yrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU87ku7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/9/2 16:23, Alex Shi 写道:
> On Thu, Sep 1, 2022 at 7:16 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>> Translate .../devicetree/overlay-notes.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/devicetree/index.rst   |   5 +-
>>   .../zh_CN/devicetree/overlay-notes.rst        | 140 ++++++++++++++++++
>>   2 files changed, 141 insertions(+), 4 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/devicetree/overlay-notes.rst
>>
>> diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
>> index be5b974c6e68..9d95d2629b38 100644
>> --- a/Documentation/translations/zh_CN/devicetree/index.rst
>> +++ b/Documentation/translations/zh_CN/devicetree/index.rst
>> @@ -36,10 +36,7 @@ Devicetree Overlays
>>
>>      changesets
>>      dynamic-resolution-notes
>> -
>> -Todolist:
>> -
>> -*   overlay-notes
>> +   overlay-notes
>>
>>   Devicetree Bindings
>>   ===================
>> diff --git a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
>> new file mode 100644
>> index 000000000000..572ddaf729a8
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
>> @@ -0,0 +1,140 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/Devicetree/overlay-notes.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +==============
>> +设备树覆盖说明
>> +==============
>> +
>> +本文档描述了drivers/of/overlay.c中的内核内设备树覆盖功能的实现，是
>> +Documentation/devicetree/dynamic-resolution-notes.rst[1]的配套文档。
>> +
>> +覆盖如何工作
>> +------------
>> +
>> +设备树的覆盖目的是修改内核的实时树，并让修改影响内核的状态，以反映变化的方式。
> xxx 目的是 xxx 方式？

设备树覆盖的目的是修改内核的实时树，并使修改以反映变化的方式影响内核的状态。

Thanks,
Yanteng

>
>> +由于内核主要处理的是设备，任何新的设备节点如果导致一个活动的设备，就应该创建它，
>> +而如果设备节点被禁用或被全部删除，受影响的设备应该被取消注册。
>> +
>> +让我们举个例子，我们有一个foo板，它的基本树形图如下::
>> +
>> +    ---- foo.dts ---------------------------------------------------------------
>> +       /* FOO平台 */
>> +       /dts-v1/;
>> +       / {
>> +               compatible = "corp,foo";
>> +
>> +               /* 共享的资源 */
>> +               res: res {
>> +               };
>> +
>> +               /* 芯片上的外围设备 */
>> +               ocp: ocp {
>> +                       /* 总是被实例化的外围设备 */
>> +                       peripheral1 { ... };
>> +               };
>> +       };
>> +    ---- foo.dts ---------------------------------------------------------------
>> +
>> +覆盖bar.dts,
>> +::
>> +
>> +    ---- bar.dts - 按标签覆盖目标位置 ----------------------------
>> +       /dts-v1/;
>> +       /插件/;
>> +       &ocp {
>> +               /* bar外围 */
>> +               bar {
>> +                       compatible = "corp,bar";
>> +                       ... /* 各种属性和子节点 */
>> +               };
>> +       };
>> +    ---- bar.dts ---------------------------------------------------------------
>> +
>> +当加载（并按照[1]中描述的方式解决）时，应该产生foo+bar.dts::
>> +
>> +    ---- foo+bar.dts -----------------------------------------------------------
>> +       /* FOO平台 + bar外围 */
>> +       / {
>> +               compatible = "corp,foo";
>> +
>> +               /* 共享资源 */
>> +               res: res {
>> +               };
>> +
>> +               /* 芯片上的外围设备 */
>> +               ocp: ocp {
>> +                       /* 总是被实例化的外围设备 */
>> +                       peripheral1 { ... };
>> +
>> +                       /* bar外围 */
>> +                       bar {
>> +                               compatible = "corp,bar";
>> +                               ... /* 各种属性和子节点 */
>> +                       };
>> +               };
>> +       };
>> +    ---- foo+bar.dts -----------------------------------------------------------
>> +
>> +作为覆盖的结果，已经创建了一个新的设备节点（bar），因此将注册一个bar平台设备，
>> +如果加载了匹配的设备驱动程序，将按预期创建设备。
>> +
>> +如果基础DT不是用-@选项编译的，那么“&ocp”标签将不能用于将覆盖节点解析到基础
>> +DT中的适当位置。在这种情况下，可以提供目标路径。通过标签的目标位置的语法是比
>> +较好的，因为不管标签在DT中出现在哪里，覆盖都可以被应用到任何包含标签的基础DT上。
>> +
>> +上面的bar.dts例子被修改为使用目标路径语法，即为::
>> +
>> +    ---- bar.dts - 通过明确的路径覆盖目标位置 --------------------
>> +       /dts-v1/;
>> +       /插件/;
>> +       &{/ocp} {
>> +               /* bar外围 */
>> +               bar {
>> +                       compatible = "corp,bar";
>> +                       ... /* 各种外围设备和子节点 */
>> +               }
>> +       };
>> +    ---- bar.dts ---------------------------------------------------------------
>> +
>> +
>> +内核中关于覆盖的API
>> +-------------------
>> +
>> +该API相当容易使用。
>> +
>> +1) 调用of_overlay_fdt_apply()来创建和应用一个覆盖的变更集。返回值是一个
>> +   错误或一个识别这个覆盖的cookie。
>> +
>> +2) 调用of_overlay_remove()来删除和清理先前通过调用of_overlay_fdt_apply()
>> +   而创建的覆盖变更集。不允许删除一个被另一个覆盖的覆盖变化集。
> 变化集 ==> 变更集？ although, still hard to understand in Chinese for the sentense.
>
>> +
>> +最后，如果你需要一次性删除所有的覆盖，只需调用of_overlay_remove_all()，
>> +它将以正确的顺序删除每一个覆盖。
> 覆盖 ==> 覆盖层 ？
>
>> +
>> +你可以选择注册在覆盖操作中被调用的通知器。详见
>> +of_overlay_notifier_register/unregister和enum of_overlay_notify_action。
>> +
>> +OF_OVERLAY_PRE_APPLY、OF_OVERLAY_POST_APPLY或OF_OVERLAY_PRE_REMOVE
>> +的通知器回调可以存储指向覆盖层中的设备树节点或其内容的指针，但这些指针不能持
>> +续到OF_OVERLAY_POST_REMOVE的通知器回调。在OF_OVERLAY_POST_REMOVE通
> 指针持续 => 指针存活？
>
> Thanks
> Alex
>
>> +知器被调用后，包含覆盖层的内存将被kfree()ed。请注意，即使OF_OVERLAY_POST_REMOVE
>> +的通知器返回错误，内存也会被kfree()ed。
>> +
>> +drivers/of/dynamic.c中的变更集通知器是第二种类型的通知器，可以通过应用或移除
>> +覆盖层来触发。这些通知器不允许在覆盖层或其内容中存储指向设备树节点的指针。当包含
>> +覆盖层的内存因移除覆盖层而被释放时，覆盖层代码并不能防止这类指针仍然有效。
>> +
>> +任何其他保留指向覆盖层节点或数据的指针的代码都被认为是一个错误，因为在移除覆盖层
>> +后，该指针将指向已释放的内存。
>> +
>> +覆盖层的用户必须特别注意系统上发生的整体操作，以确保其他内核代码不保留任何指向覆
>> +盖层节点或数据的指针。任何无意中使用这种指针的例子是，如果一个驱动或子系统模块在
>> +应用了覆盖后被加载，并且该驱动或子系统扫描了整个设备树或其大部分，包括覆盖节点。
>> --
>> 2.31.1
>>

