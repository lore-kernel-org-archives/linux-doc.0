Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D5A6B7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 09:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbeJORkV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 13:40:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60042 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbeJORkV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 13:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NmPu84ir63CZv85hOlnMfOoasv5zPXqnw8nY1yizox4=; b=RNTvWdhDA2xFeBqJuy41cP6yW
        JeNh4mPAX7DlYkIP8elFSfHU4UGyfQsoLnzLT2wOugLTHuKMzYHD8sbo//NtPpJqEVEOTm6L6ZyEv
        ndFoKJ1R0f5KaDbNjkAbEkNMCZEI/5fYHux34EbG75m6Zxa3q1uIOOCSdLLPiBSXzYfdx9JUA+I5Y
        QdyyLO+YoAWE+sTvxWUtBsrNNemz28/YNVlWTB2yXKR8O5DIoyqMyIKPWHrwCa0z/butlqqAlyizm
        RQKDcqfUkAdslRAQxr+txbet9J3Lyx+bhAoRwlxy1Xd2zwYcNJkBwI7Y0UPJRWNcmjqo/BTJUyxdV
        ZjVmh5LWw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gBzbJ-0007Z3-8S; Mon, 15 Oct 2018 09:55:49 +0000
Date:   Mon, 15 Oct 2018 02:55:49 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Dave Chinner <david@fromorbit.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/22] xfs-4.20: major documentation surgery
Message-ID: <20181015095549.GA23946@infradead.org>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
 <20181006005154.GM12041@dastard>
 <20181011112735.4f696d8a@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181011112735.4f696d8a@lwn.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 11, 2018 at 11:27:35AM -0600, Jonathan Corbet wrote:
> On Sat, 6 Oct 2018 10:51:54 +1000
> Dave Chinner <david@fromorbit.com> wrote:
> 
> > Can you let us know whether the CC-by-SA 4.0 license is acceptible
> > or not? That's really the only thing that we need clarified at this
> > point - if it's OK I'll to pull this into the XFS tree for the 4.20
> > merge window. If not, we'll go back to the drawing board....
> 
> OK, I've had a long conversation with the LF lawyer, and she said clearly
> that we really should not be introducing CC-SA material into the kernel
> source tree.  It's a pain; I really do like CC-SA better for
> documentation, but it's not GPL-compatible, and that creates a problem for
> the processed docs.

That was exactly my concern with this patchset.

Btw, I think we have the same issue with idr.rst, and unless we can
relicense it we should drop it from the tree, as it actually includes
kernel source files.
