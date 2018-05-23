Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FC167D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 08:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754599AbeEWI1h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 04:27:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754196AbeEWI1c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 May 2018 04:27:32 -0400
Received: from localhost (unknown [37.173.74.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6383E20873;
        Wed, 23 May 2018 08:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527064051;
        bh=ywEGLbaOjV1y43Jo5VI4fWMpfJt+bet/UBhC1NAkUAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRbiTrRW/jtCGQQqZ4G5RMhY07tYSeNltoz5R9sG5pow/OTlJPpz+PgP7d/tGOKhF
         c5r7D1WF4rfaPmuTjYtiFcAlb7WEHAHky+MrqGQpEKhzqjhtWLPH6Xq4QEDhHeHqAW
         BT61j0lWN5FbG0VMz1Q09HTIjqU9jJeOt5aZUSzg=
Date:   Wed, 23 May 2018 10:27:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>, rajatxjain@gmail.com
Subject: Re: [PATCH 1/5] PCI/AER: Define and allocate aer_stats structure for
 AER capable devices
Message-ID: <20180523082713.GG7247@kroah.com>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180522222805.80314-2-rajatja@google.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 22, 2018 at 03:28:01PM -0700, Rajat Jain wrote:
> --- /dev/null
> +++ b/drivers/pci/pcie/aer/aerdrv_stats.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2018 Google Inc, All Rights Reserved.
> + *  Rajat Jain (rajatja@google.com)

Google has the copyright, not you, right?  You might want to make that a
bit more explicit by putting a blank line somewhere here...

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

If you have a SPDX line, you do not need this paragraph.  Please drop it
so we don't have to delete it later on.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
