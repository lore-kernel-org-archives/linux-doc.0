Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F1067D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 21:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbeGQVfV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 17:35:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730092AbeGQVfV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Jul 2018 17:35:21 -0400
Received: from localhost (unknown [69.71.4.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6A3520693;
        Tue, 17 Jul 2018 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1531861254;
        bh=jyAyA87q5GjW/n4zlgeFINvr31lUtLiCTCEMZgF1ysk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u96y1yL0kwVMqpOZXOv35K4M0LO/9ie2yOqg4Fab5vmZKWeXGNUTxdZlq31GL1KzK
         VUG03m+gxa4seXvEck8VKKAfa4qcgjbl7uRWC79LdAF0Ah7eQuw8QKaCFWJXssvPw8
         UMPgECZGk1XlQ5IS2ahhZLUIYgJ0OZP+t06LBscU=
Date:   Tue, 17 Jul 2018 16:00:53 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Martin Mares <mj@ucw.cz>, Logan Gunthorpe <logang@deltatee.com>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, Stephen Bates <sbates@raithlin.com>,
        Christoph Hellwig <hch@lst.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: lspci: Display path to device
Message-ID: <20180717210053.GB128988@bhelgaas-glaptop.roam.corp.google.com>
References: <20180717170204.30470-1-logang@deltatee.com>
 <20180717203900.GA1771@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180717203900.GA1771@bombadil.infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 17, 2018 at 01:39:00PM -0700, Matthew Wilcox wrote:
> I don't like telling the user to grovel around lspci -t by hand.  It's
> not many lines of code to add a new -P option to lspci to show the path
> to each device instead of bus:dev.fn
> 
> Here's three examples, first without, then with -P.
> ...

> The Nehalem system makes an interesting testcase because it exposes some
> registers in fake PCIe devices that aren't behind the root ports.  eg:
> 
> ff:06.3 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Memory Controller Channel 2 Thermal Control Registers (rev 04)

I think these appear as conventional PCI devices; at least the ones
I've seen, e.g., [1], don't have a PCIe capability, so I think it
makes sense that they're not behind a root port.

[1] https://bugzilla5.redhat.com/attachment.cgi?id=433169
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
