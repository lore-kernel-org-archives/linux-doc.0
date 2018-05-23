Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C814F7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 14:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933456AbeEWOqn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 10:46:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933149AbeEWOqk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 May 2018 10:46:40 -0400
Received: from gandalf.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BFEB20873;
        Wed, 23 May 2018 14:46:38 +0000 (UTC)
Date:   Wed, 23 May 2018 10:46:36 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Alex G." <mr.nuke.me@gmail.com>
Cc:     Jes Sorensen <jsorensen@fb.com>,
        Matthew Wilcox <willy@infradead.org>,
        Rajat Jain <rajatja@google.com>,
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
        Thomas Tai <thomas.tai@oracle.com>, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle McMartin <jkkm@fb.com>, rajatxjain@gmail.com
Subject: Re: [PATCH 1/5] PCI/AER: Define and allocate aer_stats structure
 for AER capable devices
Message-ID: <20180523104636.55303f16@gandalf.local.home>
In-Reply-To: <ffa4e203-f320-b9be-c0d7-8432e949765b@gmail.com>
References: <20180522222805.80314-1-rajatja@google.com>
        <20180522222805.80314-2-rajatja@google.com>
        <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
        <20180523142656.GE19987@bombadil.infradead.org>
        <46f0a2fa-9b48-c6d3-05ac-a75168b1998c@fb.com>
        <ffa4e203-f320-b9be-c0d7-8432e949765b@gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 23 May 2018 09:33:30 -0500
"Alex G." <mr.nuke.me@gmail.com> wrote:

> > Well I'll agree to disagree with Linus on this one. It's ugly as fsck
> > and allows for ambiguous statements in the code.  
> 
> You misspelled "fuck".

No, Jes is Danish. That's how they spell it.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
