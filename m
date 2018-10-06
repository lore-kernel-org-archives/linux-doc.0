Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E320B7D082
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 13:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbeJFUdM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 16:33:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48842 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbeJFUdM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 16:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wkSapPGHEC/kxN69RBLF/FMB/LVi8iZ3qIOCKwiG+NI=; b=Li/XEhimEJ0KxZx31AM9U+dHc
        3SweqRHE9T7DsLcWQE6nz0qSUE3IGnO0CGSQ9hSBQ+BBDY+4+YQ/aEbfqktM4eV+3YRHwXdzuLl1g
        y+n9MLQUv4AjnJ9TCEy8OVInGdqH+hknbh0dJO8coC+HanYgLOR9o4NDbccd9SZxVhwuu5LCoZ5Ar
        5eQyZ1/4hZC+ysei7cMpMtePrpcx5YwDXoYLqY6CMg40GxNxDe4rw2yFz/w3ismXinKPkBYxKLvpN
        pv4lVGcPIkB4fu35dTcLiDDs4KmOp7rrVnd3A1KJ0XI4gyDIyfpNFwkxvqUL3juQbnxwgWdOjsoCD
        yzd/0HAAw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1g8meV-0006ml-W1; Sat, 06 Oct 2018 13:29:51 +0000
Date:   Sat, 6 Oct 2018 06:29:51 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Dave Chinner <david@fromorbit.com>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v2 00/22] xfs-4.20: major documentation surgery
Message-ID: <20181006132951.GA17023@bombadil.infradead.org>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
 <20181006005154.GM12041@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181006005154.GM12041@dastard>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 06, 2018 at 10:51:54AM +1000, Dave Chinner wrote:
> On Wed, Oct 03, 2018 at 09:18:11PM -0700, Darrick J. Wong wrote:
> > Hi all,
> > 
> > This series converts the existing in-kernel xfs documentation to rst
> > format, links it in with the rest of the kernel's rst documetation, and
> > then begins pulling in the contents of the Data Structures & Algorithms
> > book from the xfs-documentation git tree.  No changes are made to the
> > text during the import process except to fix things that the conversion
> > process (asciidoctor + pandoc) didn't do correctly.  The goal of this
> > series is to tie together the XFS code with the on-disk format
> > documentation for the features supported by the code.
> > 
> > I've built the docs and put them here, in case you hate reading rst:
> > https://djwong.org/docs/kdoc/admin-guide/xfs.html
> > https://djwong.org/docs/kdoc/filesystems/xfs-data-structures/index.html
> > 
> > I've posted a branch here because the png import patch is huge:
> > https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=docs-4.20-merge
> > 
> > The patchset should apply cleanly against 4.19-rc6.  Comments and
> > questions are, as always, welcome.
> 
> Jon,
> 
> Can you let us know whether the CC-by-SA 4.0 license is acceptible
> or not? That's really the only thing that we need clarified at this
> point - if it's OK I'll to pull this into the XFS tree for the 4.20
> merge window. If not, we'll go back to the drawing board....

This is (obviously) not legal advice.

I had an informal chat with Bradley Kuhn at LinuxCon Japan about using
CC-BY-SA-4.0 and he indicated that I was probably better off using the
GPL-2(+) for documentation.  I've changed the XArray documentation from
CC-BY-SA-4.0 to GPL-2+.

YMMV, defer to the LF lawyer, but I thought it worth providing a data
point.
