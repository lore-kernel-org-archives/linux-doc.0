Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59984C43334
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 02:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiFMCd2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Jun 2022 22:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiFMCd1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Jun 2022 22:33:27 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF9553192D
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 19:33:23 -0700 (PDT)
Received: from [192.168.1.133] (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv0_roaZi7T09AA--.31236S3;
        Mon, 13 Jun 2022 10:33:17 +0800 (CST)
Subject: Re: [PATCH 2/3] docs/zh_CN: Update the translation of page_owner to
 5.19-rc1
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn,
        Jiajian Ye <yejiajian2018@email.szu.edu.cn>,
        Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
References: <cover.1654780922.git.siyanteng@loongson.cn>
 <f4343c39432ca3566fed2ba29c86261e452c92ec.1654780922.git.siyanteng@loongson.cn>
 <YqIpUnAF/Am3zufX@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
Message-ID: <9bac753a-c41a-95f7-34e4-f2aedc81f371@loongson.cn>
Date:   Mon, 13 Jun 2022 10:33:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YqIpUnAF/Am3zufX@bobwxc.mipc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv0_roaZi7T09AA--.31236S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuFy5ZrW5uw4xCw4kur4Uurg_yoWrKry7pa
        4jgFyUJ3WIy3W5Zry2k3y09r13Cw4fWw4UKw18KayDXan8JFZavryqkayqgr18Ka48Jayx
        ZFWjyrW2yr90vrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
        kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUO_MaUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/6/10 上午1:09, Wu X.C. wrote:
> +Cc: Yixuan Cao <caoyixuan2019@email.szu.edu.cn>,
>       Jiajian Ye <yejiajian2018@email.szu.edu.cn>
> 
> 
> On Thu, Jun 09, 2022 at 09:27:19PM +0800, Yanteng Si wrote:
>> update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
>> literal block in STANDARD FORMAT SPECIFIERS")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/vm/page_owner.rst      | 70 +++++++++++++++++--
>>   1 file changed, 64 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
>> index 9e951fabba9d..9f88c9c999bc 100644
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
> 
> Tab or spaces?
Tab
> 
>>   		-r		按内存释放时间排序。
>>   		-s		按堆栈跟踪排序。
>>   		-t		按时间排序（默认）。
> 
> 
> Missing:
> 
>                  --sort <order>  Specify sorting order.  Sorting syntax is [+|-]key[,[+|-]key[,...]].
>                                  Choose a key from the **STANDARD FORMAT SPECIFIERS** section. The "+" is
>                                  optional since default direction is increasing numerical or lexicographic
>                                  order. Mixed use of abbreviated and complete-form of keys is allowed.
> 
--sort <order> 指定排序顺序。排序的语法是[+|-]key[,[+|-]key[,...]]。从
**标准格式指定器**那一节选择一个键。"+"是可选的，因为默认的方向是数字或
词法的增加。允许混合使用缩写和完整格式的键。


Thanks,
Yanteng
> 
>>   
>> -   其它函数:
>> +        例子:
>> +				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
>> +				./page_owner_sort <input> <output> --sort=at
>>   
>> -	Cull:
>> -		-c		通过比较堆栈跟踪而不是总块来进行剔除。
>> +    其它函数::
>>   
>> -	Filter:
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
>>   		-f		过滤掉内存已被释放的块的信息。
>> +
>> +	选择:
>> +		--pid <pidlist>		按pid选择。这将选择进程ID号出现在<pidlist>中的块。
>> +		--tgid <tgidlist>	按tgid选择。这将选择其线程组ID号出现在<tgidlist>
>> +		                    中的块。
>> +		--name <cmdlist>	按任务命令名称选择。这将选择其任务命令名称出现在
>> +		                    <cmdlist>中的区块。
>> +
>> +		<pidlist>, <tgidlist>, <cmdlist>是以逗号分隔的列表形式的单个参数，
>> +		它提供了一种指定单个选择规则的方法。
>> +
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
>> +	f		free		该页是否已经发布
>> +	st		stacktrace	页面分配的堆栈跟踪
>> +	ator		allocator	页面的内存分配器
>> -- 
>> 2.27.0

