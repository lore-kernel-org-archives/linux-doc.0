Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F359E7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 14:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933165AbeEWO1G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 10:27:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60068 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933114AbeEWO1E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 10:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3189R8bGe+tnYiJ2j9YyCMbFDZVajvcyLNLZkWPF5Ho=; b=lomb7NDPO8m2CWdrvms9dZsle
        7xunSRejCgCBzLVkUrzQR80cyhrnLtL+azC7uBEVN7S1QlHIp0UR7HMxdg5gTGqJ8icyTLx2+0Qyn
        sr+lyRo5GlimjCg0t9ueiFw4CpRsJ8B/VhiflRR8L8IMm8/MTetc5FN7r8lNp3++Y3QT4w0ZXhB1W
        LSrUOTUSC4suGu/WzhT2OXV812bR4pRkAQFAnxTL+mkhQtBkhef6Y/vS3Tl7j5gy8wdezmwX099e/
        BNlhfvHObr+UVQ63e2nexxXjkY1IjEY5k7esHKgUx4dbZr0c7ts3/BY6Ic6RpYuN7PKm0tx++e3Wd
        MawSWccYw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fLUjA-0006Q8-LJ; Wed, 23 May 2018 14:26:56 +0000
Date:   Wed, 23 May 2018 07:26:56 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Jes Sorensen <jsorensen@fb.com>
Cc:     Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle McMartin <jkkm@fb.com>,
        rajatxjain@gmail.com
Subject: Re: [PATCH 1/5] PCI/AER: Define and allocate aer_stats structure for
 AER capable devices
Message-ID: <20180523142656.GE19987@bombadil.infradead.org>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-2-rajatja@google.com>
 <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 23, 2018 at 10:20:10AM -0400, Jes Sorensen wrote:
> > +++ b/drivers/pci/pcie/aer/aerdrv_stats.c
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Fix the formatting please - that gross // gibberish doesn't belong there.

Sorry, Jes.  The Chief Penguin has Spoken, and that's the preferred
syntax:

2. Style:

   The SPDX license identifier is added in form of a comment.  The comment
   style depends on the file type::

      C source: // SPDX-License-Identifier: <SPDX License Expression>

(you can dig up the discussion around this on the mailing list if you
like.  Linus actually thinks that C++ single-line comments are one of
the few things that language got right)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
