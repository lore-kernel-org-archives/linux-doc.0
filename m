Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 438F57D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 21:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbeKUHyo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 02:54:44 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:47010 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbeKUHyo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Nov 2018 02:54:44 -0500
Received: from 79.184.254.110.ipv4.supernova.orange.pl (79.184.254.110) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.157)
 id af5c2d50a2b0076e; Tue, 20 Nov 2018 22:23:32 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@linuxdriverproject.org,
        linux-fsdevel@vger.kernel.org, linux-pm@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        kexec-ml <kexec@lists.infradead.org>, pv-drivers@vmware.com,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v1 7/8] PM / Hibernate: use pfn_to_online_page()
Date:   Tue, 20 Nov 2018 22:23:35 +0100
Message-ID: <1709060.evyxFHMqmg@aspire.rjw.lan>
In-Reply-To: <20181119101616.8901-8-david@redhat.com>
References: <20181119101616.8901-1-david@redhat.com> <20181119101616.8901-8-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday, November 19, 2018 11:16:15 AM CET David Hildenbrand wrote:
> Let's use pfn_to_online_page() instead of pfn_to_page() when checking
> for saveable pages to not save/restore offline memory sections.
> 
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Len Brown <len.brown@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  kernel/power/snapshot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index 640b2034edd6..87e6dd57819f 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -1215,8 +1215,8 @@ static struct page *saveable_highmem_page(struct zone *zone, unsigned long pfn)
>  	if (!pfn_valid(pfn))
>  		return NULL;
>  
> -	page = pfn_to_page(pfn);
> -	if (page_zone(page) != zone)
> +	page = pfn_to_online_page(pfn);
> +	if (!page || page_zone(page) != zone)
>  		return NULL;
>  
>  	BUG_ON(!PageHighMem(page));
> @@ -1277,8 +1277,8 @@ static struct page *saveable_page(struct zone *zone, unsigned long pfn)
>  	if (!pfn_valid(pfn))
>  		return NULL;
>  
> -	page = pfn_to_page(pfn);
> -	if (page_zone(page) != zone)
> +	page = pfn_to_online_page(pfn);
> +	if (!page || page_zone(page) != zone)
>  		return NULL;
>  
>  	BUG_ON(PageHighMem(page));
> 


