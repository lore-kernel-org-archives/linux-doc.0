Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ABE347E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 08:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752320AbeDJIT3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 04:19:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34570 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752134AbeDJIT2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 04:19:28 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3A8Iv0S045242
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 04:19:28 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2h8rac3qgr-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 04:19:27 -0400
Received: from localhost
        by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Tue, 10 Apr 2018 09:19:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 10 Apr 2018 09:19:18 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3A8JIjk6291930;
        Tue, 10 Apr 2018 08:19:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1998F4203F;
        Tue, 10 Apr 2018 09:11:02 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 882D342045;
        Tue, 10 Apr 2018 09:10:57 +0100 (BST)
Received: from [9.124.31.106] (unknown [9.124.31.106])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 10 Apr 2018 09:10:57 +0100 (BST)
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 7/9] trace_uprobe/sdt: Fix multiple update of same
 reference counter
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     mhiramat@kernel.org, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, rostedt@goodmis.org, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com, jolsa@redhat.com,
        kan.liang@intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com, tglx@linutronix.de,
        yao.jin@linux.intel.com, fengguang.wu@intel.com,
        jglisse@redhat.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
References: <20180404083110.18647-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180404083110.18647-8-ravi.bangoria@linux.vnet.ibm.com>
 <20180409132928.GA25722@redhat.com>
Date:   Tue, 10 Apr 2018 13:49:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180409132928.GA25722@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18041008-0012-0000-0000-000005C9051B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041008-0013-0000-0000-000019452F19
Message-Id: <84c1e60f-8aad-a0ce-59af-4fcb3f77df94@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-10_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804100084
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Oleg,

On 04/09/2018 06:59 PM, Oleg Nesterov wrote:
> On 04/04, Ravi Bangoria wrote:
>> +static void sdt_add_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
>> +{
>> +	struct mmu_notifier *mn;
>> +	struct sdt_mm_list *sml = kzalloc(sizeof(*sml), GFP_KERNEL);
>> +
>> +	if (!sml)
>> +		return;
>> +	sml->mm = mm;
>> +	list_add(&(sml->list), &(tu->sml.list));
>> +
>> +	/* Register mmu_notifier for this mm. */
>> +	mn = kzalloc(sizeof(*mn), GFP_KERNEL);
>> +	if (!mn)
>> +		return;
>> +
>> +	mn->ops = &sdt_mmu_notifier_ops;
>> +	__mmu_notifier_register(mn, mm);
>> +}
> and what if __mmu_notifier_register() fails simply because signal_pending() == T?
> see mm_take_all_locks().
>
> at first glance this all look suspicious and sub-optimal,

Yes. I should have added checks for failure cases.
Will fix them in v3.

Thanks for the review,
Ravi

>  but let me repeat that
> I didn't read this version yet.
>
> Oleg.
>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
