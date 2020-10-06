Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356ECC4363A
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 01:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9029207F7
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 01:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgJFBas (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 21:30:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14744 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725872AbgJFBas (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Oct 2020 21:30:48 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2BAC246219A57EC69507;
        Tue,  6 Oct 2020 09:30:45 +0800 (CST)
Received: from [10.174.176.61] (10.174.176.61) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 6 Oct 2020 09:30:39 +0800
Subject: Re: [PATCH v12 6/9] arm64: kdump: reimplement crashkernel=X
To:     Catalin Marinas <catalin.marinas@arm.com>
References: <20200907134745.25732-1-chenzhou10@huawei.com>
 <20200907134745.25732-7-chenzhou10@huawei.com> <20201005171608.GC14576@gaia>
CC:     <will@kernel.org>, <james.morse@arm.com>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <dyoung@redhat.com>, <bhe@redhat.com>,
        <corbet@lwn.net>, <John.P.donnelly@oracle.com>,
        <prabhakar.pkin@gmail.com>, <bhsharma@redhat.com>,
        <horms@verge.net.au>, <robh+dt@kernel.org>, <arnd@arndb.de>,
        <nsaenzjulienne@suse.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <guohanjun@huawei.com>,
        <xiexiuqi@huawei.com>, <huawei.libin@huawei.com>,
        <wangkefeng.wang@huawei.com>
From:   chenzhou <chenzhou10@huawei.com>
Message-ID: <65ce0086-b041-8ae4-60df-e29bd2bd985b@huawei.com>
Date:   Tue, 6 Oct 2020 09:30:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201005171608.GC14576@gaia>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.61]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2020/10/6 1:16, Catalin Marinas wrote:
> On Mon, Sep 07, 2020 at 09:47:42PM +0800, Chen Zhou wrote:
>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>> index 53acbeca4f57..1b24072f2bae 100644
>> --- a/arch/arm64/kernel/setup.c
>> +++ b/arch/arm64/kernel/setup.c
>> @@ -238,7 +238,18 @@ static void __init request_standard_resources(void)
>>  		    kernel_data.end <= res->end)
>>  			request_resource(res, &kernel_data);
>>  #ifdef CONFIG_KEXEC_CORE
>> -		/* Userspace will find "Crash kernel" region in /proc/iomem. */
>> +		/*
>> +		 * Userspace will find "Crash kernel" or "Crash kernel (low)"
>> +		 * region in /proc/iomem.
>> +		 * In order to distinct from the high region and make no effect
>> +		 * to the use of existing kexec-tools, rename the low region as
>> +		 * "Crash kernel (low)".
>> +		 */
>> +		if (crashk_low_res.end && crashk_low_res.start >= res->start &&
>> +				crashk_low_res.end <= res->end) {
>> +			crashk_low_res.name = "Crash kernel (low)";
>> +			request_resource(res, &crashk_low_res);
>> +		}
> With the changes in this series (including the above), how do the
> current kexec-tools behave? Do they pick just the high region and the
> loaded kernel will subsequently fail to boot?
Yes，just pick the high region and will boot fail if low memory is needed.

Thanks,
Chen Zhou
>

