Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CAA237D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Feb 2019 23:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbfBAXUY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 18:20:24 -0500
Received: from ms.lwn.net ([45.79.88.28]:33590 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbfBAXUY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Feb 2019 18:20:24 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AD3DA2BD;
        Fri,  1 Feb 2019 23:20:23 +0000 (UTC)
Date:   Fri, 1 Feb 2019 16:20:22 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     Greg KH <greg@kroah.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: process: GPL -> GPL-compatible
Message-ID: <20190201162022.796ab977@lwn.net>
In-Reply-To: <20190122093408.16756-1-kilobyte@angband.pl>
References: <20190122093408.16756-1-kilobyte@angband.pl>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Jan 2019 10:34:08 +0100
Adam Borowski <kilobyte@angband.pl> wrote:

> Drivers under MIT, BSD-17-clause, or uncle-Bob's-newest-take-on-PD are
> all fine, not just GPL.
> 
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
> Not reformatting to fill lines, it'll semi-conflict with another patch
> that's been acked but not yet pushed.

It still conflicted (and the patch has indeed been pushed to docs-next).
I fixed it up and refilled the paragraph while I was at it.

Thanks,

jon
