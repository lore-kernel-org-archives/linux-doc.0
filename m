Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F22EB7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 09:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753391AbeCPJT7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 05:19:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47296 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751816AbeCPJT5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 05:19:57 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2G9JreC097840
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 05:19:57 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gr7y4f463-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 05:19:56 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Fri, 16 Mar 2018 09:19:44 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 16 Mar 2018 09:19:35 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2G9JZI344695602;
        Fri, 16 Mar 2018 09:19:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD998A404D;
        Fri, 16 Mar 2018 09:12:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2D4F8A4040;
        Fri, 16 Mar 2018 09:12:14 +0000 (GMT)
Received: from [9.79.219.128] (unknown [9.79.219.128])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 16 Mar 2018 09:12:13 +0000 (GMT)
Subject: Re: [PATCH 5/8] trace_uprobe: Support SDT markers having reference
 count (semaphore)
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
 <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
 <20180315142120.GA19218@redhat.com>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Fri, 16 Mar 2018 14:51:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180315142120.GA19218@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031609-0020-0000-0000-00000405DCA6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031609-0021-0000-0000-00004299E842
Message-Id: <56ae982d-2fbf-09c4-989b-57bce5a1cb04@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-16_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803160114
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 03/15/2018 07:51 PM, Oleg Nesterov wrote:
> On 03/13, Ravi Bangoria wrote:
>> @@ -1053,6 +1056,9 @@ int uprobe_mmap(struct vm_area_struct *vma)
>>  	struct uprobe *uprobe, *u;
>>  	struct inode *inode;
>>
>> +	if (uprobe_mmap_callback)
>> +		uprobe_mmap_callback(vma);
>> +
>>  	if (no_uprobe_events() || !valid_vma(vma, true))
>>  		return 0;
> probe_event_enable() does
>
> 	uprobe_register();
> 	/* WINDOW */
> 	sdt_increment_ref_ctr();
>
> what if uprobe_mmap() is called in between? The counter(s) in this vma
> will be incremented twice, no?

I guess, it's a valid issue with PATCH 5 but should be taken care by PATCH 6.

>
>> +static struct vm_area_struct *
>> +sdt_find_vma(struct mm_struct *mm, struct trace_uprobe *tu)
>> +{
>> +	struct vm_area_struct *tmp;
>> +
>> +	for (tmp = mm->mmap; tmp != NULL; tmp = tmp->vm_next)
>> +		if (sdt_valid_vma(tu, tmp))
>> +			return tmp;
>> +
>> +	return NULL;
> I can't understand the logic... Lets ignore sdt_valid_vma() for now.
> The caller has uprobe_map_info, why it can't simply do
> vma = find_vma(uprobe_map_info->vaddr)? and then check sdt_valid_vma().

Yes. that should work. Will change it.

Thanks for the review,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
