Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6E9F07D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 06:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935565AbeEXGIn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 02:08:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:56978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935526AbeEXGIm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 May 2018 02:08:42 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E328620882;
        Thu, 24 May 2018 06:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527142121;
        bh=rw2Vj5wtWVd3PKxSCxbPhlW5pqGRYEAq7NPQxzun65g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s9CfhC7wgiFRThmdU3EuuPLkn/S99bM9UqWWhE89XkTYkuHF+vrHyW7GPX98Jo7c1
         RXhTHwVdw7PCJxaNcZ60xxZ5Ijm+9+0cVmMWtXybxg+aaBj6WWaibvHVRX8VoQBNJd
         /vgFlFWIMmyCw+jX46zls15bWQD4xt7hCw33/QR0=
Date:   Thu, 24 May 2018 08:08:22 +0200
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
Subject: Re: [PATCH v2 1/5] PCI/AER: Define and allocate aer_stats structure
 for AER capable devices
Message-ID: <20180524060822.GA3016@kroah.com>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180523175808.28030-1-rajatja@google.com>
 <20180523175808.28030-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180523175808.28030-2-rajatja@google.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 23, 2018 at 10:58:04AM -0700, Rajat Jain wrote:
> ---
> v2: Fix the license header as per Greg's suggestions
>     (Since there is disagreement with using "//" vs "/* */" for license
>      I decided to keep the one preferred by Linus, also used by others
>      in this directory)

The rules are pretty simple for how to do this, and they are documented
in Documentation/process/license-rules.rst, please just follow that like
the rest of the kernel has done.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
