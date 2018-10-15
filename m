Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 80CED7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 14:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbeJOWON (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 18:14:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:40104 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbeJOWON (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Oct 2018 18:14:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 69AF42D6;
        Mon, 15 Oct 2018 14:28:42 +0000 (UTC)
Date:   Mon, 15 Oct 2018 08:28:41 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Dave Chinner <david@fromorbit.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 00/22] xfs-4.20: major documentation surgery
Message-ID: <20181015082841.2b6815ee@lwn.net>
In-Reply-To: <20181015095549.GA23946@infradead.org>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
        <20181006005154.GM12041@dastard>
        <20181011112735.4f696d8a@lwn.net>
        <20181015095549.GA23946@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 15 Oct 2018 02:55:49 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> > OK, I've had a long conversation with the LF lawyer, and she said clearly
> > that we really should not be introducing CC-SA material into the kernel
> > source tree.  It's a pain; I really do like CC-SA better for
> > documentation, but it's not GPL-compatible, and that creates a problem for
> > the processed docs.  
> 
> That was exactly my concern with this patchset.
> 
> Btw, I think we have the same issue with idr.rst, and unless we can
> relicense it we should drop it from the tree, as it actually includes
> kernel source files.

...and a significant DOC section at that, not just function prototypes.

I'd already asked Willy [CC'd] about this once, haven't gotten an answer
yet.  Hopefully we can address this once he comes back around.

Thanks,

jon
