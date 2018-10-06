Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8E2A7D082
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 14:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbeJFVNm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 17:13:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:58770 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbeJFVNm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 6 Oct 2018 17:13:42 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 200E86EC;
        Sat,  6 Oct 2018 14:10:14 +0000 (UTC)
Date:   Sat, 6 Oct 2018 08:10:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Dave Chinner <david@fromorbit.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/22] xfs-4.20: major documentation surgery
Message-ID: <20181006081013.2c8bb0b6@lwn.net>
In-Reply-To: <20181006132951.GA17023@bombadil.infradead.org>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
        <20181006005154.GM12041@dastard>
        <20181006132951.GA17023@bombadil.infradead.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 6 Oct 2018 06:29:51 -0700
Matthew Wilcox <willy@infradead.org> wrote:

> I had an informal chat with Bradley Kuhn at LinuxCon Japan about using
> CC-BY-SA-4.0 and he indicated that I was probably better off using the
> GPL-2(+) for documentation.  I've changed the XArray documentation from
> CC-BY-SA-4.0 to GPL-2+.

Would you consider doing the same for Documentation/core-api/idr.rst?
That's the only CC-SA SPDX tag in the kernel now, and it's a clear
example of just what I'm worried about: it pulls in a nice DOC section
from the code when you run Sphinx on it, so we're not just talking
function prototypes here.  I was likely to come knocking on your door
after my upcoming conversation anyway...:)

Thanks,

jon
