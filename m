Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD0BC47095
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 07:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E834B6135D
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 07:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbhFIHto (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 03:49:44 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39436 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbhFIHto (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 03:49:44 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BC73B1FD3C;
        Wed,  9 Jun 2021 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623224868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c9hsyRBYM4/TU8eycn2t9pZlFG6OjaXYgibXO5zHeBQ=;
        b=F4+Wu/rbeO9YKSnnNNtwwgKeb6uMe9SIHmNgpej4HiGcEemmzXiN6sIPtGZw6p0CHkir+E
        Nk6KcjKeK/vG+taq+dFmMqxvbfllb27PIQOforoQQrpimpW3uMB09IEs3hIoHgQOYEdnsm
        pmHQymUUuOsgn+YYKFGwtam715Lgnd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623224868;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c9hsyRBYM4/TU8eycn2t9pZlFG6OjaXYgibXO5zHeBQ=;
        b=wzrpszX+oDLbcQHfh7oNANQFh9q3CRxoZz2OZ5xeFt0xvlQxFb6l4tVab31TUDCEpyCKdP
        e1N3G2os2AkcYlCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 43643118DD;
        Wed,  9 Jun 2021 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623224868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c9hsyRBYM4/TU8eycn2t9pZlFG6OjaXYgibXO5zHeBQ=;
        b=F4+Wu/rbeO9YKSnnNNtwwgKeb6uMe9SIHmNgpej4HiGcEemmzXiN6sIPtGZw6p0CHkir+E
        Nk6KcjKeK/vG+taq+dFmMqxvbfllb27PIQOforoQQrpimpW3uMB09IEs3hIoHgQOYEdnsm
        pmHQymUUuOsgn+YYKFGwtam715Lgnd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623224868;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c9hsyRBYM4/TU8eycn2t9pZlFG6OjaXYgibXO5zHeBQ=;
        b=wzrpszX+oDLbcQHfh7oNANQFh9q3CRxoZz2OZ5xeFt0xvlQxFb6l4tVab31TUDCEpyCKdP
        e1N3G2os2AkcYlCQ==
Received: from director1.suse.de ([192.168.254.71])
        by imap3-int with ESMTPSA
        id N+SADCNywGACQQAALh3uQQ
        (envelope-from <osalvador@suse.de>); Wed, 09 Jun 2021 07:47:47 +0000
Date:   Wed, 9 Jun 2021 09:47:45 +0200
From:   Oscar Salvador <osalvador@suse.de>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] memory-hotplug.rst: remove locking details from
 admin-guide
Message-ID: <YMByIWZ9CleWrVbw@localhost.localdomain>
References: <20210608133855.20397-1-david@redhat.com>
 <20210608133855.20397-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608133855.20397-2-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 08, 2021 at 03:38:54PM +0200, David Hildenbrand wrote:
> We have the same content at Documentation/core-api/memory-hotplug.rst
> and it doesn't fit into the admin-guide. The documentation was
> accidentially duplicated when merging.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Muchun Song <songmuchun@bytedance.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

-- 
Oscar Salvador
SUSE L3
