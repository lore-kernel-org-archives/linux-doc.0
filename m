Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D54C7DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 08:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752029AbeEGIWE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 04:22:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50950 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752057AbeEGIVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 04:21:36 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w478ItaO039583
        for <linux-doc@vger.kernel.org>; Mon, 7 May 2018 04:21:36 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htcc8wng1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 04:21:35 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.ibm.com>;
        Mon, 7 May 2018 09:21:33 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 7 May 2018 09:21:26 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w478LQbS65994880;
        Mon, 7 May 2018 08:21:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 55347AE051;
        Mon,  7 May 2018 09:10:56 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C8EF0AE057;
        Mon,  7 May 2018 09:10:51 +0100 (BST)
Received: from [9.124.31.85] (unknown [9.124.31.85])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  7 May 2018 09:10:51 +0100 (BST)
Subject: Re: [PATCH v3 6/9] trace_uprobe: Support SDT markers having reference
 count (semaphore)
From:   Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>, oleg@redhat.com
Cc:     Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, rostedt@goodmis.org, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com, jolsa@redhat.com,
        kan.liang@intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com, tglx@linutronix.de,
        yao.jin@linux.intel.com, fengguang.wu@intel.com, jglisse@redhat.com
References: <20180417043244.7501-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180417043244.7501-7-ravi.bangoria@linux.vnet.ibm.com>
 <20180504134816.8633a157dd036489d9b0f1db@kernel.org>
 <206e4a16-ae21-7da3-f752-853dc2f51947@linux.ibm.com>
Date:   Mon, 7 May 2018 13:51:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <206e4a16-ae21-7da3-f752-853dc2f51947@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18050708-0044-0000-0000-0000054FD511
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050708-0045-0000-0000-000028910D76
Message-Id: <f3d066d2-a85a-bd21-d4f9-fc27e59135df@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-07_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805070086
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Masami,

On 05/04/2018 07:51 PM, Ravi Bangoria wrote:
>
>>> +}
>>> +
>>> +static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
>>> +{
>>> +	struct uprobe_map_info *info;
>>> +
>>> +	uprobe_down_write_dup_mmap();
>>> +	info = uprobe_build_map_info(tu->inode->i_mapping,
>>> +				tu->ref_ctr_offset, false);
>>> +	if (IS_ERR(info))
>>> +		goto out;
>>> +
>>> +	while (info) {
>>> +		down_write(&info->mm->mmap_sem);
>>> +
>>> +		if (sdt_find_vma(tu, info->mm, info->vaddr))
>>> +			sdt_update_ref_ctr(info->mm, info->vaddr, 1);
>> Don't you have to handle the error to map pages here?
> Correct.. I think, I've to feedback error code to probe_event_{enable|disable}
> and handler failure there.

I looked at this. Actually, It looks difficult to feedback errors to
probe_event_{enable|disable}, esp. in the mmap() case.

Is it fine if we just warn sdt_update_ref_ctr() failures in dmesg? I'm
doing this in [PATCH 7]. (Though, it makes more sense to do that in
[PATCH 6], will change it in next version).

Any better ideas?

BTW, same issue exists for normal uprobe. If uprobe_mmap() fails,
there is no feedback to trace_uprobe and no warnigns in dmesg as
well !! There was a patch by Naveen to warn such failures in dmesg
but that didn't go in: https://lkml.org/lkml/2017/9/22/155

Also, I'll add a check in sdt_update_ref_ctr() to make sure reference
counter never goes to negative incase increment fails but decrement
succeeds. OTOH, if increment succeeds but decrement fails, the
counter remains >0 but there is no harm as such, except we will
execute some unnecessary code.

Thanks,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
