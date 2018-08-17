Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 503C37D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 17 Aug 2018 06:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbeHQJx0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 17 Aug 2018 05:53:26 -0400
Received: from verein.lst.de ([213.95.11.211]:34037 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbeHQJx0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 17 Aug 2018 05:53:26 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 5B27070573; Fri, 17 Aug 2018 08:52:16 +0200 (CEST)
Date:   Fri, 17 Aug 2018 08:52:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Joe Perches <joe@perches.com>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <rob.herring@linaro.org>,
        Jonas Oberg <jonas@fsfe.org>,
        Andrew Morton <akpm@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] license-rules.rst and LICENSES: Use only spdx version
        3 with -only and -or-later
Message-ID: <20180817065216.GA11170@lst.de>
References: <f9a4cd2b1c1cd7938a4e0b8aa9489a0ad96669ca.1534443693.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9a4cd2b1c1cd7938a4e0b8aa9489a0ad96669ca.1534443693.git.joe@perches.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 16, 2018 at 11:26:03AM -0700, Joe Perches wrote:
> The current linux-kernel source git tree has a mixture of the deprecated
> spdx version 2 and the newer version 3 uses.
> 
> Update the process/license-rules.rst file to show only the version 3 style
> and use only the version 3 styles in LICENSES.

IF we _only_ document version 3 style we also need to switch every file
over to use it, otherwise we end up in a situation with undocumented tags
again.  So if we want to apply your patch we aso need to run your included
script.  With a run of that script:

Acked-by: Christoph Hellwig <hch@lst.de>
