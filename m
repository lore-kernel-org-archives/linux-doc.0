Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E1577DE74
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 14:21:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751262AbeEDOVz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 May 2018 10:21:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38068 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751240AbeEDOVz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 May 2018 10:21:55 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w44EFxOr109740
        for <linux-doc@vger.kernel.org>; Fri, 4 May 2018 10:21:54 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hrrgct508-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 04 May 2018 10:21:54 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.ibm.com>;
        Fri, 4 May 2018 15:21:51 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 4 May 2018 15:21:44 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w44ELhHL5439756;
        Fri, 4 May 2018 14:21:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C099F42049;
        Fri,  4 May 2018 15:12:52 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 71F6B4204B;
        Fri,  4 May 2018 15:12:43 +0100 (BST)
Received: from [9.124.212.91] (unknown [9.124.212.91])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  4 May 2018 15:12:43 +0100 (BST)
From:   Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v3 6/9] trace_uprobe: Support SDT markers having reference
 count (semaphore)
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, oleg@redhat.com,
        peterz@infradead.org, srikar@linux.vnet.ibm.com,
        rostedt@goodmis.org, acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, jolsa@redhat.com, kan.liang@intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, milian.wolff@kdab.com, mingo@redhat.com,
        namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        pc@us.ibm.com, tglx@linutronix.de, yao.jin@linux.intel.com,
        fengguang.wu@intel.com, jglisse@redhat.com
References: <20180417043244.7501-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180417043244.7501-7-ravi.bangoria@linux.vnet.ibm.com>
 <20180504134816.8633a157dd036489d9b0f1db@kernel.org>
Date:   Fri, 4 May 2018 19:51:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504134816.8633a157dd036489d9b0f1db@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18050414-0008-0000-0000-000004F30556
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050414-0009-0000-0000-00001E8732E2
Message-Id: <206e4a16-ae21-7da3-f752-853dc2f51947@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-04_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805040132
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Masami,

On 05/04/2018 10:18 AM, Masami Hiramatsu wrote:
>> +void uprobe_down_write_dup_mmap(void)
>> +{
>> +	percpu_down_write(&dup_mmap_sem);
>> +}
>> +
>> +void uprobe_up_write_dup_mmap(void)
>> +{
>> +	percpu_up_write(&dup_mmap_sem);
>> +}
>> +
> I'm not sure why these hunks are not done in previous patch.
> If you separate "uprobe_map_info" export patch, this also
> should be separated. (Or both merged into this patch)

Sure, I'll add separate patch for dup_mmap_sem.

>> +/*
>> + * Reference counter gate the invocation of probe. If present,
>> + * by default reference counter is 0. One needs to increment
>> + * it before tracing the probe and decrement it when done.
>> + */
>> +static int
>> +sdt_update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
>> +{
>> +	void *kaddr;
>> +	struct page *page;
>> +	struct vm_area_struct *vma;
>> +	int ret = 0;
>> +	unsigned short *ptr;
>> +
>> +	if (vaddr == 0)
>> +		return -EINVAL;
>> +
>> +	ret = get_user_pages_remote(NULL, mm, vaddr, 1,
>> +		FOLL_FORCE | FOLL_WRITE, &page, &vma, NULL);
>> +	if (ret <= 0)
>> +		return ret;
> Hmm, get_user_pages_remote() said
>
> ===
> If nr_pages is 0 or negative, returns 0. If no pages were pinned, returns -errno.
> ===
>
> And you've passed 1 for nr_pages, so it must be 1 or -errno.
>
>> +
>> +	kaddr = kmap_atomic(page);
>> +	ptr = kaddr + (vaddr & ~PAGE_MASK);
>> +	*ptr += d;
>> +	kunmap_atomic(kaddr);
>> +
>> +	put_page(page);
>> +	return 0;
> And obviously 0 means "success" for sdt_update_ref_ctr().
> I think if get_user_pages_remote returns 0, this should
> return -EBUSY (*) or something else.
>
> * It seems that if faultin_page() in __get_user_pages()
> returns -EBUSY, get_user_pages_remote() can return 0.

Ah good catch :). Will change it.

>> +}
>> +
>> +static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
>> +{
>> +	struct uprobe_map_info *info;
>> +
>> +	uprobe_down_write_dup_mmap();
>> +	info = uprobe_build_map_info(tu->inode->i_mapping,
>> +				tu->ref_ctr_offset, false);
>> +	if (IS_ERR(info))
>> +		goto out;
>> +
>> +	while (info) {
>> +		down_write(&info->mm->mmap_sem);
>> +
>> +		if (sdt_find_vma(tu, info->mm, info->vaddr))
>> +			sdt_update_ref_ctr(info->mm, info->vaddr, 1);
> Don't you have to handle the error to map pages here?

Correct.. I think, I've to feedback error code to probe_event_{enable|disable}
and handler failure there.

Thanks for the review,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
