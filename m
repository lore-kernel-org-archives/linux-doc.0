Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EF9C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 22:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiEIWot (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 18:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiEIWot (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 18:44:49 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D91663C4
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 15:40:51 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0590B732;
        Mon,  9 May 2022 22:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0590B732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1652136051; bh=kjPLDyi+ZBC/pvbPNlPNDIhvTkwHwsW8VtzCYWLuBHs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=a9casqrb2i/Q5QitDzrL+Y7oZLwEcJbFYpCu7oSprmAxQwTYaCwHm/+8olsp90TMt
         x4PKRnJWGg6pfQAtNy5r2k7w3WpIl3w2NdbtlOJnhVsQ5yPlyNDJ2NtddRpGeDhJ3/
         CaBMMi6EH8SAptkgdtOALoJ6W4B/zeM5+midwBXf0NB7rigZ0xeV6xaorY+AhLTFEh
         xI7QQ0ioWylAWlQo2Vv/YqRWPFt8uXCIZaNDnUBoRCZ+Qa0ljqxpRoD9rJpLhbFL0m
         PVqMmANV01BYyBl2NTlolq3mAqvKTdebicTHSyB1ty5SrM2ID5JhcbBnSKPIxpnqmj
         QgoyyBbuxb9Pg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        John Hubbard <jhubbard@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] mm,doc: Add new documentation structure
In-Reply-To: <YnmQ4yQMuv44n8aR@casper.infradead.org>
References: <20220507134947.444287-1-willy@infradead.org>
 <87sfpicr4x.fsf@meer.lwn.net> <YnmQ4yQMuv44n8aR@casper.infradead.org>
Date:   Mon, 09 May 2022 16:40:50 -0600
Message-ID: <87zgjqba8d.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> On Mon, May 09, 2022 at 03:50:22PM -0600, Jonathan Corbet wrote:
>> "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
>> 
>> > Closely following the outline of Mel Gorman's book "Understanding the
>> > Linux Virtual Memory Manager", add a new outline.  Preserve the current
>> > contents of the mm underneath the new outline so we can transition those
>> > documents to a more sensible place later.
>> >
>> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>> > Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
>> > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>> 
>> So this seems like a good start to me.
>> 
>> What's your intended path for merging this?  You didn't copy me so I'm
>> assuming you had some other way in mind.
>
> Uh, good point.  I didn't cc either you or Andrew.  I don't think it
> matters which one of you takes it.  Since you responded first, do you
> want to take it?

Will do.

Thanks,

jon
