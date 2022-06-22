Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE67C43334
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 10:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241979AbiFVKTF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbiFVKS6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 06:18:58 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 27AAD3AA6D
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 03:18:51 -0700 (PDT)
Received: from [10.161.0.133] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz02E7LJiRRFUAA--.28631S3;
        Wed, 22 Jun 2022 18:18:45 +0800 (CST)
From:   zhoubinbin <zhoubinbin@loongson.cn>
Subject: Re: [PATCH 7/9] docs/zh_CN: core-api: Update the translation of
 printk-format.rst to 5.19-rc2
To:     Jonathan Corbet <corbet@lwn.net>, Wu XiangCheng <bobwxc@email.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, chenhuacai@loongson.cn,
        linux-doc@vger.kernel.org
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
 <ebfda3a43afbfb5dd0186a6e68e080dd933a4883.1655258291.git.zhoubinbin@loongson.cn>
 <Yqu+x95ngy68Vu0p@bobwxc.mipc> <87pmj7qtr4.fsf@meer.lwn.net>
Message-ID: <8eaec666-be39-68f6-82bd-cd1cde0058dc@loongson.cn>
Date:   Wed, 22 Jun 2022 18:18:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87pmj7qtr4.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxz02E7LJiRRFUAA--.28631S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWDZr43KrWDtF4rGr47twb_yoWxuFgE9w
        42v3WxC348JFyFya15KFs3Z392gayxWw4Y9345Kw4fAa95Jws7WFWDGr93J3W8tFWYqr98
        Cr4qvF45GrW29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbsxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/17 下午9:55, Jonathan Corbet 写道:
> Wu XiangCheng<bobwxc@email.cn>  writes:
>
>> On Wed, Jun 15, 2022 at 05:24:30PM +0800, Binbin Zhou wrote:
>>> Synchronous translation from the following commits(Latest in front):
>>>
>>> [1]: commit 2fbf5241a561("vsprintf: add new `%pA` format specifier")
>> ^ this commit is from rust-next and not appeared in master or
>> jc/docs-next yet, so please drop it.
> An alternative is to take the changes relative to that commit (only) and
> send a patch for inclusion in the Rust tree.

Hi, Jon:

Sorry for my late reply, I will reorganize this part into a patch and 
submit it to thr Rust tree.

Thanks  for your comments.

Binbin


> Thanks,
>
> jon

