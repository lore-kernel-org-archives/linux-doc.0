Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3C8C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 17:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244034AbiFIRKJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 13:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbiFIRJy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 13:09:54 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439C813F90B
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=rJrKvd+tu7TXSX4a4nplhhoVfxvXMgTPJMmsC
        qgteiA=; b=jVo2aFcU+od+TD+uIU6bSACcFfQyr8sh+S78c+HsA7OFyvlWu3oYu
        e9vSUWvRu2NSGxoigDFa+ju5El1tAiBZlg188Vg1SgHUFhzTezIj1TY8q4FpPce9
        609C990Fnp4KZdNlqZqKTMOiLmZaXUOv9gf6ctqDETOP5He/JY2wgg=
Received: from bobwxc.mipc (unknown [120.242.70.248])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHn_5TKaJi9B4UAA--.61417S2;
        Fri, 10 Jun 2022 01:09:40 +0800 (CST)
Date:   Fri, 10 Jun 2022 01:09:38 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn,
        Jiajian Ye <yejiajian2018@email.szu.edu.cn>,
        Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
Subject: Re: [PATCH 2/3] docs/zh_CN: Update the translation of page_owner to
 5.19-rc1
Message-ID: <YqIpUnAF/Am3zufX@bobwxc.mipc>
References: <cover.1654780922.git.siyanteng@loongson.cn>
 <f4343c39432ca3566fed2ba29c86261e452c92ec.1654780922.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4343c39432ca3566fed2ba29c86261e452c92ec.1654780922.git.siyanteng@loongson.cn>
X-CM-TRANSID: GiKnCgCHn_5TKaJi9B4UAA--.61417S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw17CFW7ArWkJw1kJry8AFb_yoWrCr1rp3
        sIgryUJ3WIy3W3ZFyYkw4v9r1UGw4fWw4UKr18WayDXwn8JFZaqryqkayqqw4Ut3W8JayS
        qrWjkrWIyFyqvrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCj
        c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
        CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
        MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
        4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
        vfC2KfnxnUUI43ZEXa7xRRJPEDUUUUU==
X-Originating-IP: [120.242.70.248]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+Cc: Yixuan Cao <caoyixuan2019@email.szu.edu.cn>,
     Jiajian Ye <yejiajian2018@email.szu.edu.cn>


On Thu, Jun 09, 2022 at 09:27:19PM +0800, Yanteng Si wrote:
> update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
> literal block in STANDARD FORMAT SPECIFIERS")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/vm/page_owner.rst      | 70 +++++++++++++++++--
>  1 file changed, 64 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
> index 9e951fabba9d..9f88c9c999bc 100644
> --- a/Documentation/translations/zh_CN/vm/page_owner.rst
> +++ b/Documentation/translations/zh_CN/vm/page_owner.rst
> @@ -96,21 +96,79 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
>     默认情况下， ``page_owner_sort`` 是根据buf的时间来排序的。如果你想
>     按buf的页数排序，请使用-m参数。详细的参数是:
>  
> -   基本函数:
> +   基本函数::
>  
> -	Sort:
> +	排序:
>  		-a		按内存分配时间排序
>  		-m		按总内存排序
>  		-p		按pid排序。
>  		-P		按tgid排序。
> +		-n      按任务命令名称排序。

Tab or spaces?

>  		-r		按内存释放时间排序。
>  		-s		按堆栈跟踪排序。
>  		-t		按时间排序（默认）。


Missing:

                --sort <order>  Specify sorting order.  Sorting syntax is [+|-]key[,[+|-]key[,...]].
                                Choose a key from the **STANDARD FORMAT SPECIFIERS** section. The "+" is
                                optional since default direction is increasing numerical or lexicographic
                                order. Mixed use of abbreviated and complete-form of keys is allowed.


>  
> -   其它函数:
> +        例子:
> +				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
> +				./page_owner_sort <input> <output> --sort=at
>  
> -	Cull:
> -		-c		通过比较堆栈跟踪而不是总块来进行剔除。
> +    其它函数::
>  
> -	Filter:
> +	剔除:
> +		--cull <rules>
> +		        指定剔除规则。剔除的语法是key[,key[,...]]。从**标准格式指定器**
> +				部分选择一个多字母键。
> +		<rules>是一个以逗号分隔的列表形式的单一参数，它提供了一种指定单个剔除规则的
> +		方法。 识别的关键字在下面的**标准格式指定器**部分有描述。<规则>可以通过键的
> +		序列k1,k2,...来指定，在下面的标准排序键部分有描述。允许混合使用简写和完整形
> +		式的键。
> +
> +		Examples:
> +				./page_owner_sort <input> <output> --cull=stacktrace
> +				./page_owner_sort <input> <output> --cull=st,pid,name
> +				./page_owner_sort <input> <output> --cull=n,f
> +
> +	过滤:
>  		-f		过滤掉内存已被释放的块的信息。
> +
> +	选择:
> +		--pid <pidlist>		按pid选择。这将选择进程ID号出现在<pidlist>中的块。
> +		--tgid <tgidlist>	按tgid选择。这将选择其线程组ID号出现在<tgidlist>
> +		                    中的块。
> +		--name <cmdlist>	按任务命令名称选择。这将选择其任务命令名称出现在
> +		                    <cmdlist>中的区块。
> +
> +		<pidlist>, <tgidlist>, <cmdlist>是以逗号分隔的列表形式的单个参数，
> +		它提供了一种指定单个选择规则的方法。
> +
> +
> +		例子:
> +				./page_owner_sort <input> <output> --pid=1
> +				./page_owner_sort <input> <output> --tgid=1,2,3
> +				./page_owner_sort <input> <output> --name name1,name2
> +
> +标准格式指定器
> +==============
> +::
> +
> +  --sort的选项:
> +
> +	键		键长		描述
> +	p		pid		进程ID
> +	tg		tgid		线程组ID
> +	n		name		任务命令名称
> +	st		stacktrace	页面分配的堆栈跟踪
> +	T		txt		块的全文
> +	ft		free_ts		页面发布时的时间戳
> +	at		alloc_ts	页面被分配时的时间戳
> +	ator		allocator	页面的内存分配器
> +
> +  --curl的选项:
> +
> +	键		键长		描述
> +	p		pid		进程ID
> +	tg		tgid		线程组ID
> +	n		name		任务命令名称
> +	f		free		该页是否已经发布
> +	st		stacktrace	页面分配的堆栈跟踪
> +	ator		allocator	页面的内存分配器
> -- 
> 2.27.0

