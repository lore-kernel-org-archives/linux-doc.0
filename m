Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187B5C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 01:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E393F610F7
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 01:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbhEGBbw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 21:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhEGBbv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 21:31:51 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB33FC061574;
        Thu,  6 May 2021 18:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=rAm1iRpliBxibQ8h0Xt8N0Wh5webtMgmvFRNqSghInw=; b=vy2mXg5mWFCYkYZXahI1qdb2MB
        sgYXBTXHJBqF2eUH5ZyB5Xtq+UZ8zpiBpZ8qCNZXKFE8ZwnnR75fjsfvhnMr2HI/JP0kK3lH0leo0
        F39MomHSR55YlPJAmpJBBf6RqWcmX03pwytDC+YDlLbc+o9aGN9y39dSO+lCbisO7wSztLO+kLsYc
        NXl5dYHqg9IHl9V1SlqpooZ39FjUxDkw0fc6QK+fDGSUuXKme/ax6Y4dQNHug/3WjJBoNapAHmCKU
        ka6IQSPA+yOhtCi5OTGQB35lLOl0JaDnFSrbJdw+kVcjEIEhFh/VZ+4yGjJYKhwLcDZxin8hY4sC3
        NAZBSFhg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lepK2-002gxz-FQ; Fri, 07 May 2021 01:30:41 +0000
Date:   Fri, 7 May 2021 02:30:30 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: drop optional BOMs
Message-ID: <YJSYNiYMGCfOjjqC@casper.infradead.org>
References: <20210506231907.14359-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506231907.14359-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 04:19:07PM -0700, Randy Dunlap wrote:
> A few of the Documentation .rst files begin with a Unicode
> byte order mark (BOM). The BOM may signify endianess for
> 16-bit or 32-bit encodings or indicate that the text stream
> is indeed Unicode. We don't need it for either of those uses.
> It may also interfere with (confuse) some software.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
