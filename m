Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A95617D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 10:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbeHJM7x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 08:59:53 -0400
Received: from nikam.ms.mff.cuni.cz ([195.113.20.16]:60548 "EHLO
        nikam.ms.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbeHJM7x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 08:59:53 -0400
Received: by nikam.ms.mff.cuni.cz (Postfix, from userid 2587)
        id 5A2B2542EDB; Fri, 10 Aug 2018 12:30:35 +0200 (CEST)
Date:   Fri, 10 Aug 2018 12:30:35 +0200
From:   Martin Mares <mj@ucw.cz>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Logan Gunthorpe <logang@deltatee.com>,
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
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: lspci: Display path to device
Message-ID: <mj+md-20180810.103017.64385.nikam@ucw.cz>
References: <20180717170204.30470-1-logang@deltatee.com>
 <20180717203900.GA1771@bombadil.infradead.org>
 <mj+md-20180810.091549.51451.nikam@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mj+md-20180810.091549.51451.nikam@ucw.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello!

> ... the more I think about it, the more I am convinced that we want to
> re-use the bus topology builder from ls-tree.c. I will give it a try,
> stay tuned.

Please see the "topology" branch in pciutils.git.

					Martin
