Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3AEB7E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 21:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932069AbeCEVu3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 16:50:29 -0500
Received: from mga01.intel.com ([192.55.52.88]:5741 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752162AbeCEVu2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Mar 2018 16:50:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2018 13:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,428,1515484800"; 
   d="scan'208";a="180115895"
Received: from ray.jf.intel.com (HELO [10.7.201.16]) ([10.7.201.16])
  by orsmga004.jf.intel.com with ESMTP; 05 Mar 2018 13:50:27 -0800
Subject: Re: [PATCH v12 10/11] sparc64: Add support for ADI (Application Data
 Integrity)
To:     Khalid Aziz <khalid.aziz@oracle.com>, davem@davemloft.net,
        akpm@linux-foundation.org
References: <cover.1519227112.git.khalid.aziz@oracle.com>
 <d8602e35e65c8bf6df1a85166bf181536a6f3664.1519227112.git.khalid.aziz@oracle.com>
 <08ef65c1-16b3-44e7-5cc3-7b6bde7bd5a4@linux.intel.com>
 <b241c894-7751-bd01-2658-4cb6b89f7454@oracle.com>
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
Message-ID: <6d57c534-5696-e7a2-4b97-5521afcd072a@linux.intel.com>
Date:   Mon, 5 Mar 2018 13:50:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <b241c894-7751-bd01-2658-4cb6b89f7454@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/05/2018 01:37 PM, Khalid Aziz wrote:
>> How big can this storage get, btw?  Superficially it seems like it might
>> be able to be gigantic for a large, sparse VMA.
>>
> Tags are stored only for the pages being swapped out, not for the pages
> in entire vma. Each tag storage page can hold tags for 128 pages (each
> page has 128 4-bit tags, hence 64 bytes are needed to store tags for an
> entire page allowing each page to store tags for 128 pages). Sparse VMA
> does not cause any problems since holes do not have corresponding pages
> that will be swapped out. Tag storage pages are freed once all the pages
> they store tags for have been swapped back in, except for a small number
> of pages (maximum of 8) marked for emergency tag storage.

With a linear scan holding a process-wide spinlock?  If you have a fast
swap device, does this become the bottleneck when swapping ADI-tagged
memory?

FWIW, this tag storage is complex and subtle enough code that it
deserves to be in its own well-documented patch, not buried in a
thousand-line patch.

> +tag_storage_desc_t *find_tag_store(struct mm_struct *mm,
> +				   struct vm_area_struct *vma,
> +				   unsigned long addr)
> +{
> +	tag_storage_desc_t *tag_desc = NULL;
> +	unsigned long i, max_desc, flags;
> +
> +	/* Check if this vma already has tag storage descriptor
> +	 * allocated for it.
> +	 */
> +	max_desc = PAGE_SIZE/sizeof(tag_storage_desc_t);
> +	if (mm->context.tag_store) {
> +		tag_desc = mm->context.tag_store;
> +		spin_lock_irqsave(&mm->context.tag_lock, flags);
> +		for (i = 0; i < max_desc; i++) {
> +			if ((addr >= tag_desc->start) &&
> +			    ((addr + PAGE_SIZE - 1) <= tag_desc->end))
> +				break;
> +			tag_desc++;
> +		}
> +		spin_unlock_irqrestore(&mm->context.tag_lock, flags);

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
