Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 44A0F7E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 21:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753058AbeCEV0s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 16:26:48 -0500
Received: from mga05.intel.com ([192.55.52.43]:49214 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752040AbeCEV0r (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Mar 2018 16:26:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2018 13:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,428,1515484800"; 
   d="scan'208";a="180108912"
Received: from ray.jf.intel.com (HELO [10.7.201.16]) ([10.7.201.16])
  by orsmga004.jf.intel.com with ESMTP; 05 Mar 2018 13:26:46 -0800
Subject: Re: [PATCH v12 10/11] sparc64: Add support for ADI (Application Data
 Integrity)
To:     Khalid Aziz <khalid.aziz@oracle.com>, davem@davemloft.net,
        akpm@linux-foundation.org
References: <cover.1519227112.git.khalid.aziz@oracle.com>
 <d8602e35e65c8bf6df1a85166bf181536a6f3664.1519227112.git.khalid.aziz@oracle.com>
 <a59ece97-ba1f-dfb1-bfc8-b44ffd8edbca@linux.intel.com>
 <84931753-9a84-8624-adb8-95bd05d87d56@oracle.com>
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
From:   Dave Hansen <dave.hansen@linux.intel.com>
Message-ID: <098cda37-0e3c-de44-5995-9e5f74b301c6@linux.intel.com>
Date:   Mon, 5 Mar 2018 13:26:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <84931753-9a84-8624-adb8-95bd05d87d56@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/05/2018 01:14 PM, Khalid Aziz wrote:
> On 03/05/2018 12:22 PM, Dave Hansen wrote:
>> On 02/21/2018 09:15 AM, Khalid Aziz wrote:
>>> +#define arch_validate_prot(prot, addr) sparc_validate_prot(prot, addr)
>>> +static inline int sparc_validate_prot(unsigned long prot, unsigned
>>> long addr)
>>> +{
>>> +    if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM |
>>> PROT_ADI))
>>> +        return 0;
>>> +    if (prot & PROT_ADI) {
>>> +        if (!adi_capable())
>>> +            return 0;
>>> +
>>> +        if (addr) {
>>> +            struct vm_area_struct *vma;
>>> +
>>> +            vma = find_vma(current->mm, addr);
>>> +            if (vma) {
>>> +                /* ADI can not be enabled on PFN
>>> +                 * mapped pages
>>> +                 */
>>> +                if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
>>> +                    return 0;
>>
>> You don't hold mmap_sem here.  How can this work?
>>
> Are you suggesting that vma returned by find_vma() could be split or
> merged underneath me if I do not hold mmap_sem and thus make the flag
> check invalid? If so, that is a good point.

Um, yes.  You can't walk the vma tree without holding mmap_sem.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
