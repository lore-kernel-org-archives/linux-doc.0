Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CA8C2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 01:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23496135C
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 01:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhFRBPT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 21:15:19 -0400
Received: from [43.250.32.171] ([43.250.32.171]:27724 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231310AbhFRBPT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Jun 2021 21:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=To:From:Date; bh=gj5jVqjYKk+WkhVEuA0kO6TnHAwo1Zp9AqiLQ
        KfPBd8=; b=R+iebqqpfj+LEc4po6AbTBlzf3N65K4CcNQ6Dca/bHZ2zYvw8I5hZ
        DuXjusCP8mlZ435W+VJXOEz76/yy0jGtJLpDBoXCr9g9j9qt9GN42v5I+U+SBiY5
        QA632dfLy0CWpnVAYB7HkjQA1Jm/n7s38QtwCQoqrDbw7/t42+ctjE=
Received: from [0.0.0.0] (unknown [113.251.12.91])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAnwzYj88tgm4QWAA--.59722S3;
        Fri, 18 Jun 2021 09:13:07 +0800 (CST)
Subject: Re: [PATCH] docs: add traditional Chinese translation for kernel
 Documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210607132414.44601-1-src.res@email.cn>
 <87y2b8ti0i.fsf@meer.lwn.net>
From:   Hu Haowen <src.res@email.cn>
Message-ID: <feaf9034-1503-187b-76e9-9874b1ee1531@email.cn>
Date:   Fri, 18 Jun 2021 09:13:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2b8ti0i.fsf@meer.lwn.net>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: LCKnCgAnwzYj88tgm4QWAA--.59722S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4UtFyDGF18ur4UGryUKFg_yoW8AF4fpa
        98GFnaka17Aw13Cr1xWF17uF48JF93Ca1UJw1jgwnYyrn8t3s3tF1rtryq9FyruFW8XFW0
        vw12kr1rCayYy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgCb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWUuVWrJwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbI
        xvr21l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE
        7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
        8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
        CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
        1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
        vfC2KfnxnUUI43ZEXa7IUUOzVUUUUUU==
X-Originating-IP: [113.251.12.91]
X-CM-SenderInfo: hvufh21hv6vzxdlohubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


ÔÚ 2021/6/18 ÉÏÎç3:20, Jonathan Corbet Ð´µÀ:
> Hu Haowen <src.res@email.cn> writes:
>
>> Add traditional Chinese translation (zh_TW) for the Linux Kernel
>> documentation with a series of translated files.
>>
>> Signed-off-by: Hu Haowen <src.res@email.cn>
> A couple more questions...
>
> This is a fair amount of material.  Do you intend to maintain it going
> forward?  Kernel documentation can change rapidly, so that's a fair
> amount of work...


You are right. Since I have an amount of spare time, I'm able to spend
efforts on the maintaining job.


> [...]
>
>> diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
>> new file mode 100644
>> index 000000000000..a1bd9bf9dc32
>> --- /dev/null
>> +++ b/Documentation/translations/zh_TW/IRQ.txt
>> @@ -0,0 +1,41 @@
>> +Chinese translated version of Documentation/core-api/irq/index.rst
>> +
>> +If you have any comment or update to the content, please contact the
>> +original document maintainer directly.  However, if you have a problem
>> +communicating in English you can also ask the Chinese maintainer for
>> +help.  Contact the Chinese maintainer if this translation is outdated
>> +or if there is a problem with the translation.
>> +
>> +Maintainer: Eric W. Biederman <ebiederman@xmission.com>
>> +Traditional Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
> Do I understand this to mean that this translation is not your work?  If
> so, then this should come in as a separate patch from the person who did
> the work or, at a bare minimum, this patch should include their signoff.


My mistake, there was supposed to be my information at that position.
Going to send patch v2 to solve it.


Thx,
Hu Haowen


> Thanks,
>
> jon

