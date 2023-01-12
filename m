Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E9C54EBD
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 12:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjALMhd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 07:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjALMhc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 07:37:32 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 621326444
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 04:37:30 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.33])
        by gateway (Coremail) with SMTP id _____8AxX+sI_79jGTsBAA--.3727S3;
        Thu, 12 Jan 2023 20:37:28 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.112.33])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxTuQG_79j_moYAA--.9197S3;
        Thu, 12 Jan 2023 20:37:27 +0800 (CST)
Message-ID: <9326f1c8-a334-ed4a-0d06-846b75dc1f5c@loongson.cn>
Date:   Thu, 12 Jan 2023 20:37:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs/zh_CN: Add a glossary of Chinese translation terms
To:     Yizhou Tang <tangyeechou@gmail.com>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        me@lirui.org, siyanteng01@gmail.com
References: <20230111083423.513461-1-siyanteng@loongson.cn>
 <CAOB9oOY=_1X6ztx+TALbqUZvsHqujiK7QCpq9hTQSNXnWY2tRw@mail.gmail.com>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CAOB9oOY=_1X6ztx+TALbqUZvsHqujiK7QCpq9hTQSNXnWY2tRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxTuQG_79j_moYAA--.9197S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
        ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
        BjDU0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
        xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
        j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
        67AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
        jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
        AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAqzxv262kKe7AKxVWUXVWUAwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 1/11/23 16:58, Yizhou Tang 写道:
> Yanteng Si <siyanteng@loongson.cn> 于2023年1月11日周三 16:34写道：
>
>> +* PELT: 实体负载跟踪机制（Per-Entity Load Tracking）
> 实体负载跟踪
Ok!
>
> IMHO, how about the following:
> fork - 创建?
> sched domain - 调度域
> NUMA - 非统一内存访问
> HugePage - 巨页  (however, Alibaba Cloud Linux translate this word into ‘大页’)
> OPP - 操作性能值

Great!  I will add them to v2.


Thanks,

Yanteng

>
> Tang

