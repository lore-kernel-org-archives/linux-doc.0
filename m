Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F712C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 07:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240500AbhK2HiB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Nov 2021 02:38:01 -0500
Received: from verein.lst.de ([213.95.11.211]:52770 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232319AbhK2HgB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Nov 2021 02:36:01 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id EB50468C4E; Mon, 29 Nov 2021 08:32:35 +0100 (CET)
Date:   Mon, 29 Nov 2021 08:32:35 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 09/10] device-dax: set mapping prior to
 vmf_insert_pfn{,_pmd,pud}()
Message-ID: <20211129073235.GA23843@lst.de>
References: <20211124191005.20783-1-joao.m.martins@oracle.com> <20211124191005.20783-10-joao.m.martins@oracle.com> <0439eb48-1688-a4f4-5feb-8eb2680d652f@oracle.com> <96b53b3c-5c18-5f93-c595-a7d509d58f92@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96b53b3c-5c18-5f93-c595-a7d509d58f92@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 26, 2021 at 06:39:39PM +0000, Joao Martins wrote:
> @@ -230,23 +235,18 @@ static vm_fault_t dev_dax_huge_fault(struct vm_fault *vmf,
>  	id = dax_read_lock();
>  	switch (pe_size) {
>  	case PE_SIZE_PTE:
> -		fault_size = PAGE_SIZE;
>  		rc = __dev_dax_pte_fault(dev_dax, vmf, &pfn);
>  		break;
>  	case PE_SIZE_PMD:
> -		fault_size = PMD_SIZE;
>  		rc = __dev_dax_pmd_fault(dev_dax, vmf, &pfn);
>  		break;
>  	case PE_SIZE_PUD:
> -		fault_size = PUD_SIZE;
>  		rc = __dev_dax_pud_fault(dev_dax, vmf, &pfn);
>  		break;
>  	default:
>  		rc = VM_FAULT_SIGBUS;
>  	}
> 
>  	dax_read_unlock(id);

I wonder if if would make sense to move dax_read_lock / dax_read_unlock
іnto the individul helpers as well now.  That way you could directly
return from the switch.  Aso it seems like pfn is only an input
parameter now and doesn't need to be passed by reference.
