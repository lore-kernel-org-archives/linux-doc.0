Return-Path: <SRS0=p0eP=3M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251C2C33CAA
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 05:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5FA724125
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 05:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E5hcdab6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgAWFzL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jan 2020 00:55:11 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52212 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgAWFzL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 00:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=x+tl0buwkubh0DyQEprytmPxurFxgOAOtj6qON+IDDM=; b=E5hcdab6878nRKkFe5olgaeoV
        SrnvwmKLhOkwnU/oKsRnxKA4pY9zx+hbTjXc+/rJueCYkXfVzo8yYhwW5PMEJeEeR0P/5htEFH8C/
        TwjEegJV6u6Xl0QVbM+BNH2W/G2xCsY8+389CgNGmvufb/WX3tRxpYm0WNpLBTXhZHmIE2uf/MZfu
        se7QW1pSpbsZVLU90365v5Nk8u6CvRz5hs+i5tYS4WWi2WoN3E3QsCm15cL6cqHz0CIPMdngzaaXu
        3uamkXjr5BWb7VNczGqETTgv0p0zQ6nWrgzyUybwBGDf7SVtyxnqAy7N14uzGrvTg2jxEI9HY/nqQ
        9+ah3SrPw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuVSR-0003q5-0w; Thu, 23 Jan 2020 05:55:11 +0000
Date:   Wed, 22 Jan 2020 21:55:10 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a maintainer entry profile for Documentation/
Message-ID: <20200123055510.GF4675@bombadil.infradead.org>
References: <20200122162140.6a13e6a9@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122162140.6a13e6a9@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 22, 2020 at 04:21:40PM -0700, Jonathan Corbet wrote:
> +The documentation subsystem has a single maintainer who is doing the work
> +on his own time, so the response to patches will occasionally be slow.  I
> +try to always send out a notification when a patch is merged (or when I
> +decide that one cannot be).  Do not hesitate to send a ping if you have not
> +heard back within a week of sending a patch.

Odd change of person in this paragraph ... should it be first or second?
