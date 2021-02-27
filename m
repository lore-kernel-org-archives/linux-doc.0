Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9A3C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 15:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9B0364E7A
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 15:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhB0P0o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Feb 2021 10:26:44 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:60859 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230041AbhB0P0m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Feb 2021 10:26:42 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R921e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPjaDHF_1614439539;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPjaDHF_1614439539)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 27 Feb 2021 23:25:40 +0800
Subject: Re: [PATCH v1 0/9] docs/zh_CN: Improve language in zh_CN/process/
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1614162064.git.bobwxc@email.cn>
 <770b71b2-e32b-c640-755a-3efb1e957823@linux.alibaba.com>
 <20210227062814.GB3863@mipc>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <e35a3fda-86b1-d9d3-17b2-3338c50e5061@linux.alibaba.com>
Date:   Sat, 27 Feb 2021 23:25:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210227062814.GB3863@mipc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/2/27 下午2:28, Wu X.C. 写道:
>> still feel the older is better. '工作区‘ means working zone, which's not it
>> original doc.
>>
> Or use 您发布的补丁系列几乎肯定不会是工作[时]版本控制系统中的一系列更改 ?
> need to translate the 'revision control system'

Thanks for your working!

the patchset is different when it in 'working'.
so maybe change to ...几乎肯定不会是开发过程中版本控制系统里的一系列更改


>>>

>>> 45.
>>> -上面提到的标签用于描述各种开发人员如何与这个补丁的开发相关联。
>>> +上面提到的标签（tag）用于描述各种开发人员如何与这个补丁的开发相关联。
>>>     Add (tag)
>>>
>>> 46.
>>>  - Signed-off-by: this is a developer's certification that he or she has
>>>    the right to submit the patch for inclusion into the kernel.  It is an
>>>    agreement to the Developer's Certificate of Origin, the full text of
>>>    which can be found in :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
>>>    Code without a proper signoff cannot be merged into the mainline.
>>> - - Signed-off-by: 这是一个开发人员的证明，他或她有权提交补丁以包含到内核中。
>>> -   这是开发来源认证协议，其全文可在
>>> + - Signed-off-by: 这用来证明开发人员有权提交补丁以包含到内核中。
>>> +   也表明同意开发者来源证书，其全文见
>> ?? what's meaning of above line?
>>
> Emmm?
> You mean '+ -' or '- -' ? The second dashs are original paragraph mark.
> Or the 'Developer's Certificate of Origin' ? See 
>     Documentation/translations/zh_CN/process/submitting-patches.rst
> Or any other question?

still think the older is better, since signed-off-by: is a certification.
a noun, you tranlation change it to a verb. so change to the following?

这是一个开发人员的证明，证明他或她有权提交补丁以包含到内核中。下面是最初的开发者许可协议，见，。。。

Thanks
Alex
