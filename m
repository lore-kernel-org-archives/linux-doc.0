Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54D8F7E6AD
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 15:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751751AbeCNPVN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 11:21:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49594 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751543AbeCNPVB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 11:21:01 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2EFG9Hk124555
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 11:21:01 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gq0sfqpam-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 11:21:00 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Wed, 14 Mar 2018 15:20:57 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 14 Mar 2018 15:20:48 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2EFKlFA55771354;
        Wed, 14 Mar 2018 15:20:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C78995204C;
        Wed, 14 Mar 2018 14:12:17 +0000 (GMT)
Received: from [9.77.194.179] (unknown [9.77.194.179])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 856D252043;
        Wed, 14 Mar 2018 14:12:05 +0000 (GMT)
Subject: Re: [PATCH 8/8] trace_uprobe/sdt: Document about reference counter
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
 <20180313125603.19819-9-ravi.bangoria@linux.vnet.ibm.com>
 <20180314225021.64109239de8b14b0aec1e1c5@kernel.org>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Wed, 14 Mar 2018 20:52:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180314225021.64109239de8b14b0aec1e1c5@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031415-0020-0000-0000-000004046E9A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031415-0021-0000-0000-000042987334
Message-Id: <ec9c4ef7-0117-7c7c-64bc-f6bf4261721d@linux.vnet.ibm.com>
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



On 03/14/2018 07:20 PM, Masami Hiramatsu wrote:
> On Tue, 13 Mar 2018 18:26:03 +0530
> Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
>
>> No functionality changes.
> Please consider to describe what is this change and why, here.

Will add in next version.

>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
>> ---
>>  Documentation/trace/uprobetracer.txt | 16 +++++++++++++---
>>  kernel/trace/trace.c                 |  2 +-
>>  2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/trace/uprobetracer.txt b/Documentation/trace/uprobetracer.txt
>> index bf526a7c..8fb13b0 100644
>> --- a/Documentation/trace/uprobetracer.txt
>> +++ b/Documentation/trace/uprobetracer.txt
>> @@ -19,15 +19,25 @@ user to calculate the offset of the probepoint in the object.
>>  
>>  Synopsis of uprobe_tracer
>>  -------------------------
>> -  p[:[GRP/]EVENT] PATH:OFFSET [FETCHARGS] : Set a uprobe
>> -  r[:[GRP/]EVENT] PATH:OFFSET [FETCHARGS] : Set a return uprobe (uretprobe)
>> -  -:[GRP/]EVENT                           : Clear uprobe or uretprobe event
>> +  p[:[GRP/]EVENT] PATH:OFFSET[(REF_CTR_OFFSET)] [FETCHARGS]
>> +  r[:[GRP/]EVENT] PATH:OFFSET[(REF_CTR_OFFSET)] [FETCHARGS]
> Ah, OK in this context, [] means optional syntax :)

Correct.

Thanks,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
