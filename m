Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B079C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 15:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0889B64EC4
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 15:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBZPjv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 10:39:51 -0500
Received: from out01.mta.xmission.com ([166.70.13.231]:59482 "EHLO
        out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhBZPju (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 10:39:50 -0500
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1lFfCV-000SD1-1a; Fri, 26 Feb 2021 08:38:43 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=fess.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1lFfCU-000gGq-17; Fri, 26 Feb 2021 08:38:42 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     chenzhou <chenzhou10@huawei.com>
Cc:     Baoquan He <bhe@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>, <mingo@redhat.com>,
        <tglx@linutronix.de>, <rppt@kernel.org>, <dyoung@redhat.com>,
        <will@kernel.org>, <nsaenzjulienne@suse.de>, <corbet@lwn.net>,
        <John.P.donnelly@oracle.com>, <prabhakar.pkin@gmail.com>,
        <horms@verge.net.au>, <robh+dt@kernel.org>, <arnd@arndb.de>,
        <james.morse@arm.com>, <xiexiuqi@huawei.com>,
        <guohanjun@huawei.com>, <huawei.libin@huawei.com>,
        <wangkefeng.wang@huawei.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20210130071025.65258-1-chenzhou10@huawei.com>
        <20210130071025.65258-2-chenzhou10@huawei.com>
        <20210224141939.GA28965@arm.com>
        <20210225072426.GH3553@MiWiFi-R3L-srv>
        <121fa1e6-f1a3-d47f-bb1d-baaacf96fddc@huawei.com>
Date:   Fri, 26 Feb 2021 09:38:37 -0600
In-Reply-To: <121fa1e6-f1a3-d47f-bb1d-baaacf96fddc@huawei.com> (chenzhou's
        message of "Fri, 26 Feb 2021 14:45:25 +0800")
Message-ID: <m14khykfeq.fsf@fess.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1lFfCU-000gGq-17;;;mid=<m14khykfeq.fsf@fess.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX19FonAfyXHc11Z6qU3W8XfsdQm1v4+5X8w=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH v14 01/11] x86: kdump: replace the hard-coded alignment with macro CRASH_ALIGN
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

chenzhou <chenzhou10@huawei.com> writes:

> On 2021/2/25 15:25, Baoquan He wrote:
>> On 02/24/21 at 02:19pm, Catalin Marinas wrote:
>>> On Sat, Jan 30, 2021 at 03:10:15PM +0800, Chen Zhou wrote:
>>>> Move CRASH_ALIGN to header asm/kexec.h for later use. Besides, the
>>>> alignment of crash kernel regions in x86 is 16M(CRASH_ALIGN), but
>>>> function reserve_crashkernel() also used 1M alignment. So just
>>>> replace hard-coded alignment 1M with macro CRASH_ALIGN.
>>> [...]
>>>> @@ -510,7 +507,7 @@ static void __init reserve_crashkernel(void)
>>>>  	} else {
>>>>  		unsigned long long start;
>>>>  
>>>> -		start = memblock_phys_alloc_range(crash_size, SZ_1M, crash_base,
>>>> +		start = memblock_phys_alloc_range(crash_size, CRASH_ALIGN, crash_base,
>>>>  						  crash_base + crash_size);
>>>>  		if (start != crash_base) {
>>>>  			pr_info("crashkernel reservation failed - memory is in use.\n");
>>> There is a small functional change here for x86. Prior to this patch,
>>> crash_base passed by the user on the command line is allowed to be 1MB
>>> aligned. With this patch, such reservation will fail.
>>>
>>> Is the current behaviour a bug in the current x86 code or it does allow
>>> 1MB-aligned reservations?
>> Hmm, you are right. Here we should keep 1MB alignment as is because
>> users specify the address and size, their intention should be respected.
>> The 1MB alignment for fixed memory region reservation was introduced in
>> below commit, but it doesn't tell what is Eric's request at that time, I
>> guess it meant respecting users' specifying.


> I think we could make the alignment unified. Why is the alignment system reserved and
> user specified different? Besides, there is no document about the 1MB alignment.
> How about adding the alignment size(16MB) in doc  if user specified
> start address as arm64 does.

Looking at what the code is doing.  Attempting to reserve a crash region
at the location the user specified.  Adding unnecessary alignment
constraints is totally broken. 

I am not even certain enforcing a 1MB alignment makes sense.  I suspect
it was added so that we don't accidentally reserve low memory on x86.
Frankly I am not even certain that makes sense.

Now in practice there might be an argument for 2MB alignment that goes
with huge page sizes on x86.  But until someone finds that there are
actual problems with 1MB alignment I would not touch it.

The proper response to something that isn't documented and confusing is
not to arbitrarily change it and risk breaking users.  Especially in
this case where it is clear that adding additional alignment is total
nonsense.  The proper response to something that isn't clear and
documented is to dig in and document it, or to leave it alone and let it
be the next persons problem.

In this case there is no reason for changing this bit of code.
All CRASH_ALIGN is about is a default alignment when none is specified.
It is not a functional requirement but just something so that things
come out nicely.


Eric
