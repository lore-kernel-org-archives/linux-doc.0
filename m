Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA95C43334
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 08:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbiFOIOM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 04:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243874AbiFOINg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 04:13:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7674B17048
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 01:13:35 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz02klKli6FpDAA--.6363S3;
        Wed, 15 Jun 2022 16:13:25 +0800 (CST)
Message-ID: <acc1ed51-22d6-b8d9-00e7-d1677a9e1bff@loongson.cn>
Date:   Wed, 15 Jun 2022 16:13:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] docs/zh_CN: Update the translation of page_owner
 to 5.19-rc1
To:     bobwxc_MI <bobwxc@yeah.net>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, bobwxc@email.cn
References: <cover.1655094814.git.siyanteng@loongson.cn>
 <4407c99c5c7dc85e70a10ea8817fea2b5e6bc9dc.1655094814.git.siyanteng@loongson.cn>
 <Yqc3HMCfwDlYabZI@bobwxc.mipc>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <Yqc3HMCfwDlYabZI@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz02klKli6FpDAA--.6363S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw15GFWxtr13uFWxZr4rAFb_yoWrtr17pa
        4jgFy7J3WIy3Z8ZFy7K3yv9r13Cw4fWw4UKw18KayDZF1DJFZaqrWqkayqgr18KFyUJFWf
        JFWjyrZrArnYvrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhdbbUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/13 21:20, bobwxc_MI 写道:
> From: "Wu X.C." <bobwxc@yeah.net>
>
> Hi Yanteng,
>
> On Mon, Jun 13, 2022 at 01:03:41PM +0800, Yanteng Si wrote:
>> update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
>> literal block in STANDARD FORMAT SPECIFIERS")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/vm/page_owner.rst      | 72 +++++++++++++++++--
>>   1 file changed, 65 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
>> index 9e951fabba9d..0086e6763e77 100644
>> --- a/Documentation/translations/zh_CN/vm/page_owner.rst
>> +++ b/Documentation/translations/zh_CN/vm/page_owner.rst
>> @@ -96,21 +96,79 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
>>      默认情况下， ``page_owner_sort`` 是根据buf的时间来排序的。如果你想
>>      按buf的页数排序，请使用-m参数。详细的参数是:
>>   
>> -   基本函数:
>> +   基本函数::
>>   
>> -	Sort:
>> +	排序:
>>   		-a		按内存分配时间排序
>>   		-m		按总内存排序
>>   		-p		按pid排序。
>>   		-P		按tgid排序。
>> +		-n      按任务命令名称排序。
> here, see:
> http://fars.ee/1p4P.png
OK, It looks like my editor is automatically converting tabs to spaces.
>
>>   		-r		按内存释放时间排序。
>>   		-s		按堆栈跟踪排序。
>>   		-t		按时间排序（默认）。
>> +       --sort <order> 指定排序顺序。排序的语法是[+|-]key[,[+|-]key[,...]]。从
>> +       **标准格式指定器**那一节选择一个键。"+"是可选的，因为默认的方向是数字或
>> +       词法的增加。允许混合使用缩写和完整格式的键。
>> +
>> +        例子:
>> +				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
>> +				./page_owner_sort <input> <output> --sort=at
>> +
>> +    其它函数::
>> +
>> +	剔除:
>> +		--cull <rules>
>> +		        指定剔除规则。剔除的语法是key[,key[,...]]。从**标准格式指定器**
>> +				部分选择一个多字母键。
>> +		<rules>是一个以逗号分隔的列表形式的单一参数，它提供了一种指定单个剔除规则的
>> +		方法。 识别的关键字在下面的**标准格式指定器**部分有描述。<规则>可以通过键的
>> +		序列k1,k2,...来指定，在下面的标准排序键部分有描述。允许混合使用简写和完整形
>> +		式的键。
>> +
>> +		Examples:
>> +				./page_owner_sort <input> <output> --cull=stacktrace
>> +				./page_owner_sort <input> <output> --cull=st,pid,name
>> +				./page_owner_sort <input> <output> --cull=n,f
>> +
>> +	过滤:
>> +		-f		过滤掉内存已被释放的块的信息。
>>   
>> -   其它函数:
>> +	选择:
>> +		--pid <pidlist>		按pid选择。这将选择进程ID号出现在<pidlist>中的块。
>> +		--tgid <tgidlist>	按tgid选择。这将选择其线程组ID号出现在<tgidlist>
>> +		                    中的块。
>> +		--name <cmdlist>	按任务命令名称选择。这将选择其任务命令名称出现在
>> +		                    <cmdlist>中的区块。
>>   
>> -	Cull:
>> -		-c		通过比较堆栈跟踪而不是总块来进行剔除。
>> +		<pidlist>, <tgidlist>, <cmdlist>是以逗号分隔的列表形式的单个参数，
>> +		它提供了一种指定单个选择规则的方法。
>>   
>> -	Filter:
>> -		-f		过滤掉内存已被释放的块的信息。
>> +
>> +		例子:
>> +				./page_owner_sort <input> <output> --pid=1
>> +				./page_owner_sort <input> <output> --tgid=1,2,3
>> +				./page_owner_sort <input> <output> --name name1,name2
>> +
>> +标准格式指定器
>> +==============
>> +::
>> +
>> +  --sort的选项:
>> +
>> +	键		键长		描述
>> +	p		pid		进程ID
>> +	tg		tgid		线程组ID
>> +	n		name		任务命令名称
>> +	st		stacktrace	页面分配的堆栈跟踪
>> +	T		txt		块的全文
>> +	ft		free_ts		页面发布时的时间戳
>> +	at		alloc_ts	页面被分配时的时间戳
>> +	ator		allocator	页面的内存分配器
>> +
>> +  --curl的选项:
>> +
>> +	键		键长		描述
>> +	p		pid		进程ID
>> +	tg		tgid		线程组ID
>> +	n		name		任务命令名称
> Seen in v1, but missed here
>
> 	f		free		whether the page has been released or not
> 	st		stacktrace	stack trace of the page allocation
> 	ator		allocator	memory allocator for pages

sorry, I lost them by mistake.


Thanks,

Yanteng

>
>> -- 
>> 2.27.0
> Thanks,
> 	Wu
>

