Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B31B77E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 21:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753174AbeCEVVb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 16:21:31 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:55422 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753055AbeCEVVa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 16:21:30 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w25LJLJc109195;
        Mon, 5 Mar 2018 21:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2017-10-26;
 bh=MolPSDfS403T0RrSU7LEx6mK0RI1L49XN8lxBKQouNo=;
 b=qC8N4zr1dmApVroXRZh9QigZ087PH9krTky0TJgPg1xevbtxRtJV+SWhYX9aFSVUQWxR
 4LEdlAoCSZ359oQaclNl8v5JmOBvCncINajG7SEGu3IBZtOFWBAofBxu38OI3b8qVR7N
 AQ5MlphP6OS7Yl+h7Xrm8CLlS7g3QOZY/vy1fHhn79gNzfu5uFvzXan4yxZmpYKzKMbD
 xe+sHHIuGQ0Dx8o2ciFaWbw4CeFwteshJpBDuEmfco9XLzWIB/h+YOHiS/rRBEi6kXyU
 CKAV7RTjLOnaoAGMoJfhqXa+9AzxOgTKGTbk+/Jhb3IHcU8wf0V3a+EI1S2JDq1nMqGk Sg== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
        by aserp2120.oracle.com with ESMTP id 2ghdq4804b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 05 Mar 2018 21:19:56 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w25LEsqe002533
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Mar 2018 21:14:55 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w25LEr40025999;
        Mon, 5 Mar 2018 21:14:53 GMT
Received: from [10.154.165.190] (/10.154.165.190)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 05 Mar 2018 13:14:52 -0800
Subject: Re: [PATCH v12 10/11] sparc64: Add support for ADI (Application Data
 Integrity)
To:     Dave Hansen <dave.hansen@linux.intel.com>, davem@davemloft.net,
        akpm@linux-foundation.org
Cc:     corbet@lwn.net, bob.picco@oracle.com, steven.sistare@oracle.com,
        pasha.tatashin@oracle.com, mike.kravetz@oracle.com,
        rob.gardner@oracle.com, mingo@kernel.org, nitin.m.gupta@oracle.com,
        anthony.yznaga@oracle.com, kirill.shutemov@linux.intel.com,
        tom.hromatka@oracle.com, allen.pais@oracle.com,
        tklauser@distanz.ch, shannon.nelson@oracle.com,
        vijay.ac.kumar@oracle.com, mhocko@suse.com, jack@suse.cz,
        punit.agrawal@arm.com, hughd@google.com, thomas.tai@oracle.com,
        ross.zwisler@linux.intel.com, dave.jiang@intel.com,
        willy@infradead.org, minchan@kernel.org,
        imbrenda@linux.vnet.ibm.com, aarcange@redhat.com,
        kstewart@linuxfoundation.org, pombredanne@nexb.com,
        tglx@linutronix.de, gregkh@linuxfoundation.org,
        nagarathnam.muthusamy@oracle.com, linux@roeck-us.net,
        jane.chu@oracle.com, dan.j.williams@intel.com, jglisse@redhat.com,
        ktkhai@virtuozzo.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, Khalid Aziz <khalid@gonehiking.org>
References: <cover.1519227112.git.khalid.aziz@oracle.com>
 <d8602e35e65c8bf6df1a85166bf181536a6f3664.1519227112.git.khalid.aziz@oracle.com>
 <a59ece97-ba1f-dfb1-bfc8-b44ffd8edbca@linux.intel.com>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <84931753-9a84-8624-adb8-95bd05d87d56@oracle.com>
Date:   Mon, 5 Mar 2018 14:14:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <a59ece97-ba1f-dfb1-bfc8-b44ffd8edbca@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8823 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=973
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803050243
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/05/2018 12:22 PM, Dave Hansen wrote:
> On 02/21/2018 09:15 AM, Khalid Aziz wrote:
>> +#define arch_validate_prot(prot, addr) sparc_validate_prot(prot, addr)
>> +static inline int sparc_validate_prot(unsigned long prot, unsigned long addr)
>> +{
>> +	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI))
>> +		return 0;
>> +	if (prot & PROT_ADI) {
>> +		if (!adi_capable())
>> +			return 0;
>> +
>> +		if (addr) {
>> +			struct vm_area_struct *vma;
>> +
>> +			vma = find_vma(current->mm, addr);
>> +			if (vma) {
>> +				/* ADI can not be enabled on PFN
>> +				 * mapped pages
>> +				 */
>> +				if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
>> +					return 0;
> 
> You don't hold mmap_sem here.  How can this work?
>

Are you suggesting that vma returned by find_vma() could be split or 
merged underneath me if I do not hold mmap_sem and thus make the flag 
check invalid? If so, that is a good point.

Thanks,
Khalid
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
