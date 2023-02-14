Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3D8C05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Feb 2023 18:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbjBNSZ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 13:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbjBNSZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 13:25:24 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B9B2C64C
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=gzzXbdggheTnLCKsJsmCQJS2IgjRxdOEnL8dW3ox2HQ=; b=W7/moOgIaZI/diy4ihMh/tDRfX
        4PSFKi+CMV2aZ7B/xCMWR+sE3e7fvtt1SSxuxfd5fWWRKcNwk24vFd8kOm46+8C1UguO5JxjEPejD
        wa1DzY3pqgg6B5g5P99RseOa/XGYauT2pkSodTYsM2i3EQaN2G3vE//GIAym+9XQQvP7q8cWK4eDG
        +8wgl4yWiUKoOFBBlkmf7J9SXrqdCjnIDuTnyhYLoc/hTqrbwOaWPgwa/+Nv0eIGcA1rKzr68y/A1
        LAgpK9oBhSE03O2aCQKI/bG+E+QpCMHBakd+4zP5Ip9Pq6WMKT4Wk5bGoY+y/XZ4R9m7WLDDLFBCB
        qTxGhjKw==;
Received: from [2601:1c2:980:9ec0::df2f]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pRzzQ-003ASb-Q5; Tue, 14 Feb 2023 18:25:16 +0000
Message-ID: <8469fe5b-a8dc-98a8-05fb-8645c8a43c47@infradead.org>
Date:   Tue, 14 Feb 2023 10:25:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
References: <87bkmas5vc.fsf@meer.lwn.net>
 <c75c8304-88ce-cb7a-3800-fa3ce83a3421@infradead.org>
 <87lelar3yb.fsf@meer.lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87lelar3yb.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

On 2/6/23 11:25, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Nit: it says that it's for kernel 6.2.0-rc2-6.2.0-rc2+.
>> Is that expected?
> 
> Um ... no.  That won't be the result of my current changes, but I'll
> look into it.
> 
>> Another question: if I'm deep into the menu tree, is there a way
>> (link) to get back to the top level?  Other than editing the URL, that
>> is.
> 
> Click on "The Linux Kernel" at the top of the sidebar.

Ah. That works. :)

Is there a reason that the main index's "sections" (single underline)
don't show up in the sidebar index?  Is that on purpose?
Or just a relic of them being "sections"?

(Why are they sections? Why is the main document's title a chapter
instead of being the Document title?)

I would like to be able to see visually when the sidebar index goes from
one "section" to another one, e.g., from "Internal API manuals"
to "Development tools and processes". I think that there might be a
small blank (like 1/2 line space) between these sections now, but
that is easy to overlook.

Thanks for listening.
-- 
~Randy
