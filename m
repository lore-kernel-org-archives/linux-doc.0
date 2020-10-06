Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3245CC4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 01:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0FB62084C
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 01:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgJFBsS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 21:48:18 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50884 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725896AbgJFBsS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Oct 2020 21:48:18 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E1AFD23746D1A48192D7;
        Tue,  6 Oct 2020 09:48:14 +0800 (CST)
Received: from [10.174.176.61] (10.174.176.61) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 6 Oct 2020 09:48:07 +0800
Subject: Re: [PATCH v12 0/9] support reserving crashkernel above 4G on arm64
 kdump
To:     Bhupesh Sharma <bhsharma@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20200907134745.25732-1-chenzhou10@huawei.com>
 <e9b1b5db-a848-468e-6baf-2f7b4d658805@oracle.com>
 <20201005170937.GA14576@gaia>
 <CACi5LpMWUmP1df8fB8psJY_cNGHF9MNn+TNK4B4edaRHvOXxGQ@mail.gmail.com>
CC:     John Donnelly <john.p.donnelly@oracle.com>,
        Will Deacon <will@kernel.org>,
        James Morse <james.morse@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, RuiRui Yang <dyoung@redhat.com>,
        Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Prabhakar Kushwaha <prabhakar.pkin@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, <nsaenzjulienne@suse.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kexec mailing list <kexec@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        <guohanjun@huawei.com>, <xiexiuqi@huawei.com>,
        <huawei.libin@huawei.com>, <wangkefeng.wang@huawei.com>
From:   chenzhou <chenzhou10@huawei.com>
Message-ID: <8a050973-2eb6-61ed-9172-dd4fd0909f65@huawei.com>
Date:   Tue, 6 Oct 2020 09:48:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CACi5LpMWUmP1df8fB8psJY_cNGHF9MNn+TNK4B4edaRHvOXxGQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.61]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Bhupesh,


On 2020/10/6 1:42, Bhupesh Sharma wrote:
> Hi Catalin, Chen,
>
> On Mon, Oct 5, 2020 at 10:39 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>> On Sat, Sep 12, 2020 at 06:44:29AM -0500, John Donnelly wrote:
>>> On 9/7/20 8:47 AM, Chen Zhou wrote:
>>>> Chen Zhou (9):
>>>>    x86: kdump: move CRASH_ALIGN to 2M
>>>>    x86: kdump: make the lower bound of crash kernel reservation
>>>>      consistent
>>>>    x86: kdump: use macro CRASH_ADDR_LOW_MAX in functions
>>>>      reserve_crashkernel[_low]()
>>>>    x86: kdump: move reserve_crashkernel[_low]() into crash_core.c
>>>>    arm64: kdump: introduce some macroes for crash kernel reservation
>>>>    arm64: kdump: reimplement crashkernel=X
>>>>    kdump: add threshold for the required memory
>>>>    arm64: kdump: add memory for devices by DT property
>>>>      linux,usable-memory-range
>>>>    kdump: update Documentation about crashkernel
>> [...]
>>> I did a brief unit-test on 5.9-rc4.
>>>
>>> Please add:
>>>
>>> Tested-by:  John Donnelly <John.p.donnelly@oracle.com>
>> Thanks for testing.
>>
>>> This activity is over a year old. It needs accepted.
>> It's getting there, hopefully in 5.11. There are some minor tweaks to
>> address.
> I think my earlier email with the test results on this series bounced
> off the mailing list server (for some weird reason), but I still see
> several issues with this patchset. I will add specific issues in the
> review comments for each patch again, but overall, with a crashkernel
> size of say 786M, I see the following issue:
>
> # cat /proc/cmdline
> BOOT_IMAGE=(hd7,gpt2)/vmlinuz-5.9.0-rc7+ root=<..snip..>
> rd.lvm.lv=<..snip..> crashkernel=786M
>
> I see two regions of size 786M and 256M reserved in low and high
> regions respectively, So we reserve a total of 1042M of memory, which
> is an incorrect behaviour:
>
> # dmesg | grep -i crash
> [    0.000000] Reserving 256MB of low memory at 2816MB for crashkernel
> (System low RAM: 768MB)
> [    0.000000] Reserving 786MB of memory at 654158MB for crashkernel
> (System RAM: 130816MB)
> [    0.000000] Kernel command line:
> BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.9.0-rc7+
> root=/dev/mapper/rhel_ampere--hr330a--03-root ro
> rd.lvm.lv=rhel_ampere-hr330a-03/root
> rd.lvm.lv=rhel_ampere-hr330a-03/swap crashkernel=786M cma=1024M
>
> # cat /proc/iomem | grep -i crash
>   b0000000-bfffffff : Crash kernel (low)
>   bfcbe00000-bffcffffff : Crash kernel
>
> IMO, we should test this feature more before including this in 5.11
Thanks for you test. This behavior is what we what. What is the correct behavior you think?

Besides, this feature is been tested by John and PK, and i test for various parameters.
We may miss something, any comments are welcome.

Thanks,
Chen Zhou
>
> Thanks,
> Bhupesh
>
> .
>

