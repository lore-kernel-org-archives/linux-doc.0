Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCC507D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Nov 2018 21:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405113AbeKWHmc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Nov 2018 02:42:32 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57738 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbeKWHmc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Nov 2018 02:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CqyXbKsmh+wTPLeR2BVlEo49o1VhXctDWwmVXqlAZ9U=; b=cK+oiQ8eySRlo5vFkL77r8KqT
        hKN19FvG6zyNjng/jVJq39iSvuoqEKPSS0GcfoPGlcAx6LAq2m42r0FMApd8iAfS0SKRWeVMDeNRM
        /7tSm+CGX7VGwNUTUfNV+IBEpdNPLvvf6CVjmmC6mmcgJumWSzODuDod3mCfh4f/JgewcabAeA3aA
        1m+m5MKo5o23fmD/Bk10+6FHHuaSiyMdHJWDoRtSBMtAcicGOrzs9708CznqL6e01AMtQZnKtrxrV
        Z5EawpBs/Tlz4p/v+5IGuJK7yuJmfWZw1FJLAbVWZhnuqcnJUBfK7dbNzNPWLQadeWSBRCQs9wKdh
        xSOaANCQA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gPw6H-0008By-F5; Thu, 22 Nov 2018 21:01:25 +0000
Date:   Thu, 22 Nov 2018 13:01:25 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Shreyans Devendra Doshi <0xinfosect0r@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: dev-tools: Fix typos in index.rst
Message-ID: <20181122210125.GT3065@bombadil.infradead.org>
References: <20181122153456.24413-1-0xinfosect0r@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181122153456.24413-1-0xinfosect0r@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 22, 2018 at 10:34:56AM -0500, Shreyans Devendra Doshi wrote:
> Fixes a spelling error and removes an extra whitespace character.

There is a fierce battle amongst those who insist on one space after a
full stop and those who insist on two.  I recommend not getting caught
up in this battle, particularly since the point of this is to produce
html documentation and the amount of space displayed after a period is
then up to your web browser, not the source text.

I would not NACK this patch, since it does fix a typo, but please don't
send any more patches which adjust the number of whitespaces after a
full stop.
