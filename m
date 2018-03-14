Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 227097E6AD
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 15:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751348AbeCNPNO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 11:13:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48088 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751289AbeCNPNO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 11:13:14 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2EF9pmS187224
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 11:13:13 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2gq2psj6cm-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 11:13:13 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Wed, 14 Mar 2018 15:13:10 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 14 Mar 2018 15:13:03 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2EFD2G9131490;
        Wed, 14 Mar 2018 15:13:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 30FCD5204C;
        Wed, 14 Mar 2018 14:04:33 +0000 (GMT)
Received: from [9.77.194.179] (unknown [9.77.194.179])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2FF9C5203F;
        Wed, 14 Mar 2018 14:04:20 +0000 (GMT)
Subject: Re: [PATCH 6/8] trace_uprobe/sdt: Fix multiple update of same
 reference counter
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     oleg@redhat.com, peterz@infradead.org, srikar@linux.vnet.ibm.com,
        acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, gregkh@linuxfoundation.org,
        huawei.libin@huawei.com, hughd@google.com, jack@suse.cz,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
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
 <20180314231540.b98c74a153255f59f54ebc46@kernel.org>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Wed, 14 Mar 2018 20:45:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180314231540.b98c74a153255f59f54ebc46@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031415-0040-0000-0000-000004206C0F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031415-0041-0000-0000-0000262370F8
Message-Id: <1e51042b-d05b-dd55-82e6-818bb5be03d1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-14_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803140171
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 03/14/2018 07:45 PM, Masami Hiramatsu wrote:
> On Tue, 13 Mar 2018 18:26:01 +0530
> Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
>
>> For tiny binaries/libraries, different mmap regions points to the
>> same file portion. In such cases, we may increment reference counter
>> multiple times. But while de-registration, reference counter will get
>> decremented only by once leaving reference counter > 0 even if no one
>> is tracing on that marker.
>>
>> Ensure increment and decrement happens in sync by keeping list of
>> mms in trace_uprobe. Increment reference counter only if mm is not
>> present in the list and decrement only if mm is present in the list.
>>
>> Example
>>
>>   # echo "p:sdt_tick/loop2 /tmp/tick:0x6e4(0x10036)" > uprobe_events
>>
>> Before patch:
>>
>>   # perf stat -a -e sdt_tick:loop2
>>   # /tmp/tick
>>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>>    0000000: 02                                       .
>>
>>   # pkill perf
>>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>>   0000000: 01                                       .
>>
>> After patch:
>>
>>   # perf stat -a -e sdt_tick:loop2
>>   # /tmp/tick
>>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>>   0000000: 01                                       .
>>
>>   # pkill perf
>>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>>   0000000: 00                                       .
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
>> ---
>>  kernel/trace/trace_uprobe.c | 105 +++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 103 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
>> index b6c9b48..9bf3f7a 100644
>> --- a/kernel/trace/trace_uprobe.c
>> +++ b/kernel/trace/trace_uprobe.c
>> @@ -50,6 +50,11 @@ struct trace_uprobe_filter {
>>  	struct list_head	perf_events;
>>  };
>>  
>> +struct sdt_mm_list {
>> +	struct mm_struct *mm;
>> +	struct sdt_mm_list *next;
>> +};
> Oh, please use struct list_head instead of defining your own pointer-chain :(

Sure, will change it.

>> +
>>  /*
>>   * uprobe event core functions
>>   */
>> @@ -61,6 +66,8 @@ struct trace_uprobe {
>>  	char				*filename;
>>  	unsigned long			offset;
>>  	unsigned long			ref_ctr_offset;
>> +	struct sdt_mm_list		*sml;
>> +	struct rw_semaphore		sml_rw_sem;
> BTW, is there any reason to use rw_semaphore? (mutex doesn't fit?)

Hmm.. No specific reason.. will use a mutex instead.

Thanks for the review :)
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
