Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E30F87D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 17:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfANReX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 12:34:23 -0500
Received: from ms.lwn.net ([45.79.88.28]:37144 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbfANReX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 12:34:23 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4D373738;
        Mon, 14 Jan 2019 17:34:22 +0000 (UTC)
Date:   Mon, 14 Jan 2019 10:34:21 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Joel Nider <joeln@il.ibm.com>, Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs-rst: infiniband: Convert user verbs doc to rst
Message-ID: <20190114103421.7fef97c0@lwn.net>
In-Reply-To: <20190114165621.GD22910@ziepe.ca>
References: <1547456451-7102-1-git-send-email-joeln@il.ibm.com>
        <1547456451-7102-2-git-send-email-joeln@il.ibm.com>
        <20190114165621.GD22910@ziepe.ca>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Jan 2019 09:56:21 -0700
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> >  Documentation/infiniband/user_verbs.rst | 70 +++++++++++++++++++++++++++++++++
> >  Documentation/infiniband/user_verbs.txt | 69 --------------------------------
> >  2 files changed, 70 insertions(+), 69 deletions(-)
> >  create mode 100644 Documentation/infiniband/user_verbs.rst
> >  delete mode 100644 Documentation/infiniband/user_verbs.txt  
> 
> Thanks for getting this going Joe, I've been mulling over writing more
> docs for this area for a while now.
> 
> Jonathan/linux-doc: Can you Ack at least the build system parts of
> this please? I can take it through the rdma tree, unless you prefer
> otherwise?

Can I make a request?  This appears to be user-oriented documentation; can
we please place it into the userspace-api manual, rather than keeping it
in its own silo?

Thanks,

jon
