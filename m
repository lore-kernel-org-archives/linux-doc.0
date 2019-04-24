Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D255F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Apr 2019 10:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfDXKuB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Apr 2019 06:50:01 -0400
Received: from foss.arm.com ([217.140.101.70]:41472 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbfDXKuB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Apr 2019 06:50:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFA83A78;
        Wed, 24 Apr 2019 03:50:00 -0700 (PDT)
Received: from [10.163.1.68] (unknown [10.163.1.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 179573F5AF;
        Wed, 24 Apr 2019 03:49:58 -0700 (PDT)
Subject: Re: [PATCH] docs/vm: add documentation of memory models
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
References: <1556101715-31966-1-git-send-email-rppt@linux.ibm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <bbde10af-0e9f-08be-30d6-1513c50e0d17@arm.com>
Date:   Wed, 24 Apr 2019 16:20:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1556101715-31966-1-git-send-email-rppt@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 04/24/2019 03:58 PM, Mike Rapoport wrote:
> +To use vmemmap, an architecture has to reserve a range of virtual
> +addresses that will map the physical pages containing the memory
> +map. and make sure that `vmemmap` points to that range. In addition,
> +the architecture should implement :c:func:`vmemmap_populate` method
> +that will allocate the physical memory and create page tables for the
> +virtual memory map. If an architecture does not have any special
> +requirements for the vmemmap mappings, it can use default
> +:c:func:`vmemmap_populate_basepages` provided by the generic memory
> +management.

Just to complete it, could you also include struct vmem_altmap and how it
can contribute towards the physical backing for vmemmap virtual mapping.
Otherwise the write up looks complete.
