Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 46D607E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 13:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753066AbeCPNsV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 09:48:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42032 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751405AbeCPNsV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 09:48:21 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2GDmKgF042289
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 09:48:20 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2grdubkt0h-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 09:48:19 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Fri, 16 Mar 2018 13:47:31 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 16 Mar 2018 13:47:23 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2GDlNgI46661686;
        Fri, 16 Mar 2018 13:47:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8E9F4A404D;
        Fri, 16 Mar 2018 13:40:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9AF4FA405B;
        Fri, 16 Mar 2018 13:39:56 +0000 (GMT)
Received: from [9.79.219.128] (unknown [9.79.219.128])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 16 Mar 2018 13:39:56 +0000 (GMT)
Subject: Re: [PATCH 6/8] trace_uprobe/sdt: Fix multiple update of same
 reference counter
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     mhiramat@kernel.org, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com,
        gregkh@linuxfoundation.org, huawei.libin@huawei.com,
        hughd@google.com, jack@suse.cz, jglisse@redhat.com,
        jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
 <20180315144959.GB19643@redhat.com>
 <c93216a4-a4e1-dd8f-00be-17254e308cd1@linux.vnet.ibm.com>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Fri, 16 Mar 2018 19:19:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <c93216a4-a4e1-dd8f-00be-17254e308cd1@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031613-0008-0000-0000-000004DEF76B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031613-0009-0000-0000-00001E72061F
Message-Id: <20efff94-de74-dcbe-68e4-a72476fab209@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-16_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803160168
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 03/16/2018 05:42 PM, Ravi Bangoria wrote:
>
> On 03/15/2018 08:19 PM, Oleg Nesterov wrote:
>> On 03/13, Ravi Bangoria wrote:
>>> For tiny binaries/libraries, different mmap regions points to the
>>> same file portion. In such cases, we may increment reference counter
>>> multiple times.
>> Yes,
>>
>>> But while de-registration, reference counter will get
>>> decremented only by once
>> could you explain why this happens? sdt_increment_ref_ctr() and
>> sdt_decrement_ref_ctr() look symmetrical, _decrement_ should see
>> the same mappings?
> Sorry, I thought this happens only for tiny binaries. But that is not the case.
> This happens for binary / library of any length.
>
> Also, it's not a problem with sdt_increment_ref_ctr() / sdt_increment_ref_ctr().
> The problem happens with trace_uprobe_mmap_callback().
>
> To illustrate in detail, I'm adding a pr_info() in trace_uprobe_mmap_callback():
>
>                 vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
> +             pr_info("0x%lx-0x%lx : 0x%lx\n", vma->vm_start, vma->vm_end, vaddr);
>                 sdt_update_ref_ctr(vma->vm_mm, vaddr, 1);
>
>
> Ok now, libpython has SDT markers with reference counter:
>
>     # readelf -n /usr/lib64/libpython2.7.so.1.0 | grep -A2 Provider
>         Provider: python
>         Name: function__entry
>         ... Semaphore: 0x00000000002899d8
>
> Probing on that marker:
>
>     # cd /sys/kernel/debug/tracing/
>     # echo "p:sdt_python/function__entry /usr/lib64/libpython2.7.so.1.0:0x16a4d4(0x2799d8)" > uprobe_events
>     # echo 1 > events/sdt_python/function__entry/enable
>
> When I run python:
>
>     # strace -o out python
>       mmap(NULL, 2738968, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fff92460000
>       mmap(0x7fff926a0000, 327680, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x230000) = 0x7fff926a0000
>       mprotect(0x7fff926a0000, 65536, PROT_READ) = 0
>
> The first mmap() maps the whole library into one region. Second mmap()
> and third mprotect() split out the whole region into smaller vmas and sets
> appropriate protection flags.
>
> Now, in this case, trace_uprobe_mmap_callback() updates reference counter
> twice -- by second mmap() call and by third mprotect() call -- because both
> regions contain reference counter offset. This I can verify in dmesg:
>
>     # dmesg | tail
>       trace_kprobe: 0x7fff926a0000-0x7fff926f0000 : 0x7fff926e99d8
>       trace_kprobe: 0x7fff926b0000-0x7fff926f0000 : 0x7fff926e99d8
>
> Final vmas of libpython:
>
>     # cat /proc/`pgrep python`/maps | grep libpython
>       7fff92460000-7fff926a0000 r-xp 00000000 08:05 403934  /usr/lib64/libpython2.7.so.1.0
>       7fff926a0000-7fff926b0000 r--p 00230000 08:05 403934  /usr/lib64/libpython2.7.so.1.0
>       7fff926b0000-7fff926f0000 rw-p 00240000 08:05 403934  /usr/lib64/libpython2.7.so.1.0
>
>
> I see similar problem with normal binary as well. I'm using Brendan Gregg's
> example[1]:
>
>     # readelf -n /tmp/tick | grep -A2 Provider
>         Provider: tick
>         Name: loop2
>         ... Semaphore: 0x000000001005003c
>
> Probing that marker:
>
>     # echo "p:sdt_tick/loop2 /tmp/tick:0x6e4(0x10036)" > uprobe_events
>     # echo 1 > events/sdt_tick/loop2/enable
>
> Now when I run the binary
>
>     # /tmp/tick
>
> load_elf_binary() internally calls mmap() and I see trace_uprobe_mmap_callback()
> updating reference counter twice:
>
>     # dmesg | tail
>       trace_kprobe: 0x10010000-0x10030000 : 0x10020036
>       trace_kprobe: 0x10020000-0x10030000 : 0x10020036
>
> proc/<pid>/maps of the tick:
>
>     # cat /proc/`pgrep tick`/maps
>       10000000-10010000 r-xp 00000000 08:05 1335712  /tmp/tick
>       10010000-10020000 r--p 00000000 08:05 1335712  /tmp/tick
>       10020000-10030000 rw-p 00010000 08:05 1335712  /tmp/tick
>
> [1] https://github.com/iovisor/bcc/issues/327#issuecomment-200576506

Also, while de-registration, we look for all existing mms using
uprobe_build_mmap_info() and decrement the counter in each
of the mm. i.e. we decrement the counter only once.

-Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
