Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18310C43217
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 14:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245288AbhLFOJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 09:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245330AbhLFOJS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 09:09:18 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BE2C061D5E
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 06:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nIX45mcZkc5g0C0ks8qLlO5lLFaELtLwp8qPzQwIEHk=; b=Ee3TTvBaSx1Zm6p2yNLI6gAu9Z
        rqWUo4LTe8CuxINgsHI7896jGBhnWz/epwQekwFmJhsqRpMde89Mc3awMBxArUgrYiJnX1HaSA0CB
        AbBHGPT+qf7E8olgbTlt08dT78mFZdwfS/JJxZ50MFl66n4OsCdBX0mrCRsRLKUfQfjWwzFH2UVfq
        fBcguWcGArFioJd4UwBfrWKx1rXewRIHgg5k2+eQ8OggjwNzp+1xDJT7iRe25X96II4DSOI+kiYSg
        uMJamS2k0GJHhU9wh+8UUfxdD9A3bZP9gShv1oI4q61DzhmHEYDHHZhlF9MsbhLFFq+eKO1R/XFOC
        giH1H2ww==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1muEcm-004m2e-K9
        for linux-doc@vger.kernel.org; Mon, 06 Dec 2021 14:05:48 +0000
Date:   Mon, 6 Dec 2021 14:05:48 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Subject: css missing
Message-ID: <Ya4YvBcsxXLhjwRj@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I don't know what changed to cause this (could be something in Debian,
could be something in the kernel).

On August 16th, I generated a 'make htmldocs' that looks fine.
Yesterday, I generated one and it's missing these two crucial lines
(there are many other changes, but restoring these two lines to any
given file makes it look fine):

   <link rel="stylesheet" href="../_static/css/theme.css" type="text/css" />
   <link rel="stylesheet" href="../_static/pygments.css" type="text/css" />

I can't find any commits that look relevant.  I have sphinx 4.3.1-1
installed.  I also tried with 4.2.0-5 with the same result.

