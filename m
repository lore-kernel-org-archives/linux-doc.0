Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 10CCA7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 07:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387617AbeKFQxZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 11:53:25 -0500
Received: from merlin.infradead.org ([205.233.59.134]:53080 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387457AbeKFQxZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 11:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5ZgUrZ1l3+vHSBFxC7gpFL7jnXgahPv4xPdZTh+i1uw=; b=Oux0PF4a/Q5B+L4JQRVzqh4D3m
        owR+oGuY450WT1TSzwdCESB+uWuYZU4EB1Alnlt2kPsK6cagA0hymcK+b7Bs/eeE7NvO7yIDk2tFV
        kA9tQNg+iUG24avTkyzZVfwNH27Z25agRYYOppMyaSqaLPf0aAEyBFe0QssyEODrlEcKu1Xrws9i0
        nPNvlXOsJJBNtIt5GPhhzaG1vLp65NWdvwib+ABn0RcTNsfMVC18ud93h6z1mYGiDe29EnyEKg2LY
        C+IS4Jagua+Ke+bQ5rpQVFlOXoJsoj7U3micPcT7Yob5YIQSn4yoCltJgtty77o4J5hT9qSmSJq8v
        S8lTuF5g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gJvnm-00045a-Px; Tue, 06 Nov 2018 07:29:30 +0000
Subject: Re: [PATCH] docs/admin-guide/mm/concepts.rst: grammar fixups
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
References: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
 <20181105211240.GA3074@bombadil.infradead.org>
 <20181106063511.GC4499@rapoport-lnx>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <19eb9ca8-d285-3ea9-faa5-f996a462f138@infradead.org>
Date:   Mon, 5 Nov 2018 23:29:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106063511.GC4499@rapoport-lnx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/5/18 10:35 PM, Mike Rapoport wrote:
> On Mon, Nov 05, 2018 at 01:12:40PM -0800, Matthew Wilcox wrote:
>> On Mon, Nov 05, 2018 at 09:58:15PM +0200, Mike Rapoport wrote:
>>> @@ -21,10 +21,10 @@ Virtual Memory Primer
>>>  The physical memory in a computer system is a limited resource and
>>>  even for systems that support memory hotplug there is a hard limit on
>>>  the amount of memory that can be installed. The physical memory is not
>>> -necessary contiguous, it might be accessible as a set of distinct
>>> +necessary contiguous; it might be accessible as a set of distinct
>>
>> necessarily
>>
>>>  address ranges. Besides, different CPU architectures, and even
>>> -different implementations of the same architecture have different view
>>> -how these address ranges defined.
>>> +different implementations of the same architecture have different views
>>> +of how these address ranges defined.
>>
>> "are defined"?
>>
>>>  Each physical memory page can be mapped as one or more virtual
>>>  pages. These mappings are described by page tables that allow
>>> -translation from virtual address used by programs to real address in
>>> -the physical memory. The page tables organized hierarchically.
>>> +translation from a virtual address used by programs to the real
>>> +address in the physical memory. The page tables are organized
>>> +hierarchically.
>>
>> I don't like the term "real address".  Can we say "physical address in memory" here, or "address of physical memory" or something?
>  
> I didn't really like it as well, but I couldn't think of any better
> adjective to emphasize that address in the physical memory is "the real
> thing".
> 
> Maybe the best would be to drop "real" and make it 
> 
> "translation from a virtual address used by programs to the 
> address in the physical memory"

physical memory address ?


-- 
~Randy
