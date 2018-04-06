Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F9177DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 21:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751384AbeDFVCg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 17:02:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42808 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751278AbeDFVCg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Apr 2018 17:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=arorSNz1aABH50/AFCGLHEP8cbhLbp+A36t46eHkKDU=; b=Hb1BL2NhjMlzSjO32PcyBn+o7
        9e3nHNQi8J0xs3k+Z6tjfX0D0rJ33KVIZfnMEN80ZXni9X1KjkU2DcoYzgz3eqCXR9NpPjdXbDUOI
        wz1YKrHI6CjCw8JfyHpDD06t5Dsg7Dqp0bijYsM+uPAJ2xVQRkdlgQb8xgZGwnHlcZnvf2buxt4A4
        Wv+Hu2rp3emWls6276VzOWh1ggRN3GGcrg7AoKLQXyCOieJ9piI2eDGHPHdFRtMaWJ9b07+Yphk+B
        AkLhVz592oGaiBL1ebPd36v4/InF1THjCeUpqp0CIRhoyIGBV4ifJdA9FXYmZvENmPZ/EIvs+MSoh
        XFrdtXikQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f4YVH-0001DX-HE; Fri, 06 Apr 2018 21:02:35 +0000
Date:   Fri, 6 Apr 2018 14:02:35 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next 00/12] fscache: Fixes, traces and development
Message-ID: <20180406210235.GB9618@bombadil.infradead.org>
References: <152287959470.14760.10350886166577848180.stgit@warthog.procyon.org.uk>
 <4034.1523025880@warthog.procyon.org.uk>
 <CA+55aFwKc1JzU6k=3R9n23HGXb5-BACT8pQ93rGTvgNjfa4ZHA@mail.gmail.com>
 <CA+55aFx_fs7C6JAX_ORJ9MoXEp25LcXS0CUnK4aO4p=hQw6xOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFx_fs7C6JAX_ORJ9MoXEp25LcXS0CUnK4aO4p=hQw6xOg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 06, 2018 at 11:32:11AM -0700, Linus Torvalds wrote:
> On Fri, Apr 6, 2018 at 11:21 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > No, but if you can redo the pull request part so that the diffstat I
> > get will match the diffstat I see in the pull request, that would be
> > good.
> 
> Oh, and can you please make sure there is a "[GIT PULL]" in the
> subject line for your pull requests?
> 
> Particularly during the merge window (not so much later) I end up
> having a separate filtered list of emails that I look at that mention
> "git pull".
> 
> Your pull requests don't seem to match that, so your pull requests
> don't actually even show up in my list of pending pull requests.

We have out of date information in Documentation ...

Jon, please consider applying:

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f7152ed565e5..908bb55be407 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -761,7 +761,7 @@ requests, especially from new, unknown developers.  If in doubt you can use
 the pull request as the cover letter for a normal posting of the patch
 series, giving the maintainer the option of using either.
 
-A pull request should have [GIT] or [PULL] in the subject line.  The
+A pull request should have [GIT PULL] in the subject line.  The
 request itself should include the repository name and the branch of
 interest on a single line; it should look something like::
 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
