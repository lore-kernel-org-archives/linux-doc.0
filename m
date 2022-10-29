Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0938DC38A02
	for <linux-doc@archiver.kernel.org>; Sat, 29 Oct 2022 09:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJ2JO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Oct 2022 05:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJ2JO5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Oct 2022 05:14:57 -0400
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3463C2EF4C
        for <linux-doc@vger.kernel.org>; Sat, 29 Oct 2022 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
        t=1667034890; bh=eI8IpBS6LrseP7BBua7RiBE8WSQM8q98o5QeMtv4iEA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=R7KotmcH0huu0we2hsHBPkB1LUC/Tk1o7QJ4mE3dr3R65JFjJ2Wd7XFv9Lr/1w6Rv
         BmiUDuji1zFBO74QQ1ELN0Yg1EgnE4kPLMBZzNlER0IbXBBVhEqGyrWE22+iOYoEbQ
         Qm99BVbTDuvrB5G6W4BnKQm+GgjZz+5siHJwh+rM=
Received: from [192.168.9.172] (unknown [101.88.133.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CFE5A600CE;
        Sat, 29 Oct 2022 17:14:49 +0800 (CST)
Message-ID: <1f353678-3398-e30b-1c87-6edb278f74db@xen0n.name>
Date:   Sat, 29 Oct 2022 17:14:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101
 Thunderbird/108.0a1
Subject: Re: [PATCH 0/2] LoongArch syscall ABI documentation
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>, loongarch@lists.linux.dev
References: <20221018100457.3440691-1-kernel@xen0n.name>
 <874jvn6be7.fsf@meer.lwn.net>
Content-Language: en-US
From:   WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <874jvn6be7.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/29/22 02:39, Jonathan Corbet wrote:
> WANG Xuerui <kernel@xen0n.name> writes:
>
>> From: WANG Xuerui <git@xen0n.name>
>>
>> Hi,
>>
>> Due to popular demand [1] (even Loongson employees can get lost), the
>> current LoongArch syscall ABI is now documented. A Simplified Chinese
>> translation is included too.
>>
>> [1]: https://github.com/loongson/LoongArch-Documentation/issues/66
>>
>> WANG Xuerui (2):
>>    Documentation: LoongArch: Document the syscall ABI
>>    docs/zh_CN: LoongArch: Translate the syscall ABI doc
>>
>>   Documentation/loongarch/index.rst             |  1 +
>>   Documentation/loongarch/syscall-abi.rst       | 36 ++++++++++++++++++
>>   .../translations/zh_CN/loongarch/index.rst    |  1 +
>>   .../zh_CN/loongarch/syscall-abi.rst           | 37 +++++++++++++++++++
>>   4 files changed, 75 insertions(+)
>>   create mode 100644 Documentation/loongarch/syscall-abi.rst
>>   create mode 100644 Documentation/translations/zh_CN/loongarch/syscall-abi.rst
> Would you like me to take these through the docs tree?
That's fine by me, thanks. I'll send a v2 in the weekend (likely 
tomorrow) for the people who have commented to give their R-b's.
>
> Thanks,
>
> jon

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

