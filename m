Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 87DE47D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Jul 2019 19:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfGETEO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Jul 2019 15:04:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35848 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfGETEO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Jul 2019 15:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aqxHOYdtlBcr42nxe8TaU35611wJBdvw3AquNf/xCyo=; b=HZ/Udi2zZimfKGgXmuHLPRHLk
        6T4+IMcvrGP4TqwCMcFYISUs2epX0YiGWP2dIOyP30yC7Y0YwtI8u3Ev7o5bZC0R4FjhzjJU5r/SH
        zdci4VmeOZ3HDvrmJwpOnlMiy2VUCTxifvpf55Q6s2F2xyPwxNgwayMxd0c/SAlvyjVZ9SRxxpnP5
        b7UuwghJT88faewH7HrBeHgxQX/Uqyz+/7jjxqCKHFYA8SLgR+ugQWOQegfO0v68Ey0m5zPQaEebH
        QV576hmLIkSRiWpFx2/KJdvEddquNc6WSeIH+RHKwk62OOvBJbfv1ttGjtGneYlRjcQium8EaMaDq
        OARoDRKGA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hjTVE-0007fc-DW; Fri, 05 Jul 2019 19:04:12 +0000
Date:   Fri, 5 Jul 2019 12:04:12 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Sheriff Esseson <sheriffesseson@gmail.com>
Cc:     skhan@linuxfoundation.org, darrick.wong@oracle.com,
        linux-xfs@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc : fs : move xfs.txt to
 admin-guide
Message-ID: <20190705190412.GB32320@bombadil.infradead.org>
References: <20190705131446.GA10045@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705131446.GA10045@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 05, 2019 at 02:14:46PM +0100, Sheriff Esseson wrote:
> As suggested by Matthew Wilcox, xfs.txt is primarily a guide on available
> options when setting up an XFS. This makes it appropriate to be placed under
> the admin-guide tree.
> 
> Thus, move xfs.txt to admin-guide and fix broken references.

What happened to the conversion to xfs.rst?

