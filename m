Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3E4C54EAA
	for <linux-doc@archiver.kernel.org>; Thu, 26 Jan 2023 19:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjAZTgU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Jan 2023 14:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjAZTgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 14:36:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0613D5C0DE;
        Thu, 26 Jan 2023 11:36:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93318617D1;
        Thu, 26 Jan 2023 19:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACFBC433D2;
        Thu, 26 Jan 2023 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674761777;
        bh=72HEEnOH20yJvoB1+XWBLjr3pyJltAWyEBlDLtKqyq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CAcjO1/aPjl7TnLPQGqYMkjsORV+g0Tt1xAqkPwB5UsZjZU+yIGxho+iHjteAenNh
         pEOIB9MvUwQIsIq8SPIrJEdkK5ri3DeRkLPs9ilzzobtzo1meN+s30IJK+GmUilivu
         skIeTUSuujTq9gIj473MiKLLD+d2Z/VBwiLGhcspyEbOuVqZk5j0DDv2yDvM2LTocm
         17/uM+0N94Y2xOCPq4EkdeDtbUL/DyRcQjUEaZi9DZ1nqIV3iu7ENQwlvEq8cAXC91
         +pbGowV4a7X3F0eR/GeTmyr+PYX4ndDixL3Fc8PN87+1Fb3qI3iZG4NtieskagVGBv
         90HSblswJCBVQ==
Date:   Thu, 26 Jan 2023 21:36:01 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 1/1] docs/mm: Physical Memory: add structure,
 introduction and nodes description
Message-ID: <Y9LWIQtPQ5yLIwu9@kernel.org>
References: <20230125192841.25342-1-rppt@kernel.org>
 <20230125192841.25342-2-rppt@kernel.org>
 <87r0vh9n17.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0vh9n17.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 26, 2023 at 11:19:16AM -0700, Jonathan Corbet wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> 
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > Add structure, introduction and Nodes section to Physical Memory
> > chapter.
> >
> > As the new documentation references core-api/dma-api and mm/page_reclaim,
> > add page labels to those documents.
> >
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Reviewed-by: Lorenzo Stoakes <lstoakes@gmail.com>
> > Acked-by: Michal Hocko <mhocko@suse.com>
> > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> 
> I've gone ahead and applied this, but I do have one little gripe...
> 
> Something like:
> 
> > +Reclaim control
> > +~~~~~~~~~~~~~~~
> > +
> > +See also :ref:`Page Reclaim <page_reclaim>`.
> 
> Can also just be "See also Documentation/mm/page_reclaim.rst".  The
> right things will happen in the HTML output, readers of the plain-text
> will know immediately where to go, and we don't have to add the label
> clutter.
> 
> </gripe> :)

Do you want v6? ;-)
 
> Thanks,
> 
> jon

-- 
Sincerely yours,
Mike.
