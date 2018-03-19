Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1ED587D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 04:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755239AbeCSE0V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 00:26:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46684 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754923AbeCSE0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 00:26:16 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2J4ORlX055234
        for <linux-doc@vger.kernel.org>; Mon, 19 Mar 2018 00:26:16 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2gsxgg3q5u-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 19 Mar 2018 00:26:15 -0400
Received: from localhost
        by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Mon, 19 Mar 2018 04:26:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 19 Mar 2018 04:26:05 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2J4Q4lr49676476;
        Mon, 19 Mar 2018 04:26:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6C5365203F;
        Mon, 19 Mar 2018 03:17:30 +0000 (GMT)
Received: from [9.124.31.209] (unknown [9.124.31.209])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6BC3152041;
        Mon, 19 Mar 2018 03:17:24 +0000 (GMT)
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
 <20180314165943.GA5948@redhat.com>
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Date:   Mon, 19 Mar 2018 09:58:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180314165943.GA5948@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031904-0012-0000-0000-000005C0A229
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031904-0013-0000-0000-0000193CB7BE
Message-Id: <9cb068f7-0996-6e24-a95b-771006559318@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-19_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803190055
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Oleg,

On 03/14/2018 10:29 PM, Oleg Nesterov wrote:
> On 03/13, Ravi Bangoria wrote:
>> +static bool sdt_valid_vma(struct trace_uprobe *tu, struct vm_area_struct *vma)
>> +{
>> +	unsigned long vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
>> +
>> +	return tu->ref_ctr_offset &&
>> +		vma->vm_file &&
>> +		file_inode(vma->vm_file) == tu->inode &&
>> +		vma->vm_flags & VM_WRITE &&
>> +		vma->vm_start <= vaddr &&
>> +		vma->vm_end > vaddr;
>> +}
> Perhaps in this case a simple
>
> 		ref_ctr_offset < vma->vm_end - vma->vm_start
>
> check without vma_offset_to_vaddr() makes more sense, but I won't insist.
>

I still don't get this. This seems a comparison between file offset and size
of the vma. Shouldn't we need to consider pg_off here?

Thanks,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
