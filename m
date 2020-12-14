Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320D8C2BBCA
	for <linux-doc@archiver.kernel.org>; Mon, 14 Dec 2020 14:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F10572251F
	for <linux-doc@archiver.kernel.org>; Mon, 14 Dec 2020 14:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440160AbgLNOXP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Dec 2020 09:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20540 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2440154AbgLNOXG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Dec 2020 09:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607955700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uU+yqo3wknHZeTv4aPn0OoA1AQ4Jcrayd5ahcgSPHMs=;
        b=OH5jgKJ/BBDmFaBfWrkBPQlD9mmLCEKUHcwvxZTvZrVte5ztEjb0jtHeXqgt+gnMp4gsWR
        c5Fy9Gr+yOCfbfN05v5OAMCLDAGVqTAy/8yW66QNlWxHGPSt1/Hxy7Eg5jciYxZuvqK6Fm
        XZdNm5bNT9GeZEOe8MnubJ+3zNlikEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-bGxr5615MoeqRRjCl0rFOA-1; Mon, 14 Dec 2020 09:21:36 -0500
X-MC-Unique: bGxr5615MoeqRRjCl0rFOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6198D100B717;
        Mon, 14 Dec 2020 14:21:27 +0000 (UTC)
Received: from [10.36.114.184] (ovpn-114-184.ams2.redhat.com [10.36.114.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D197018F0A;
        Mon, 14 Dec 2020 14:21:22 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Pavel Tatashin <pasha.tatashin@soleen.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20201211235005.GE5487@ziepe.ca>
 <2D10D596-3159-483C-81B4-CD187806ED46@redhat.com>
 <20201214133603.GF5487@ziepe.ca>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <69beec6b-8518-aa47-5a08-fd5f85cf9430@redhat.com>
Date:   Mon, 14 Dec 2020 15:21:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214133603.GF5487@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14.12.20 14:36, Jason Gunthorpe wrote:
> On Sat, Dec 12, 2020 at 08:29:11AM +0100, David Hildenbrand wrote:
> 
>>> Racing with another GUP in another thread is also not reasonable, so
>>> failing to isolate can't be a failure
>>
>> Having VMs with multiple vfio containers is certainly realistic, and
>> optimizing in user space to do vfio mappings concurrently doesn‘t
>> sound too crazy to me. But I haven‘t checked if vfio common code
>> already handles such concurrency.
> 
> There is a lot more out there than vfio.. RDMA already does concurrent
> pin_user_pages in real apps

I actually misread your comment. I think we both agree that temporary
isolation failures must not lead to a failure.

-- 
Thanks,

David / dhildenb

