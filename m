Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C4507D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 21:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbeGQWUp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 18:20:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50502 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729713AbeGQWUp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jul 2018 18:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0ohJIOhrzmWjWIsJX31VurnBqjwo6diRJ1ZrQ1KI/e0=; b=s6XkD5u6bc22WE4rSG4qBkIJa
        NQGkzB+viGogHXdAs/Lrbt+45CBFplIYh2cdOpZLRtrPN6aFcCV6DF7wbWdPOsaI+qdVhT2sfNoAj
        0Ikp2+kRbLMf0QtG/mpxby3wWHOpJQy/Q3x82r3t6Xod8D674PKYIk8cil2DzFx8UcsCHBP/wfTvR
        Tymsh8gX1ptS1oMKv8Tu58fJiyw7DqC6cQAMcASmcQesfc8OAUGEeQGil+F7L+dhXMDmX2VNaww4g
        jEGBCufoZKFJN45NjZKyZQyYNk7ousuJChsB9kjQreeMwkgeiMju4b76ILErsTgepUN8Ug3jz7Kcl
        JqVADdpxg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ffXnH-0001wY-OV; Tue, 17 Jul 2018 21:46:03 +0000
Date:   Tue, 17 Jul 2018 14:46:03 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20180717214603.GB1771@bombadil.infradead.org>
References: <20180717170204.30470-1-logang@deltatee.com>
 <20180717203900.GA1771@bombadil.infradead.org>
 <20180717210053.GB128988@bhelgaas-glaptop.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180717210053.GB128988@bhelgaas-glaptop.roam.corp.google.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 17, 2018 at 04:00:53PM -0500, Bjorn Helgaas wrote:
> On Tue, Jul 17, 2018 at 01:39:00PM -0700, Matthew Wilcox wrote:
> > The Nehalem system makes an interesting testcase because it exposes some
> > registers in fake PCIe devices that aren't behind the root ports.  eg:
> > 
> > ff:06.3 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Memory Controller Channel 2 Thermal Control Registers (rev 04)
> 
> I think these appear as conventional PCI devices; at least the ones
> I've seen, e.g., [1], don't have a PCIe capability, so I think it
> makes sense that they're not behind a root port.
> 
> [1] https://bugzilla5.redhat.com/attachment.cgi?id=433169

Oh, I don't think we're doing anything wrong with how we're displaying
them or what we're doing with what the system presents to us.  My only
point was that this is a good test-case for code which assumes that all
PCI devices lie under a PCIe root port.  At one point during development,
my code reported that device up there as

/06.3 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Memory Controller Channel 2 Thermal Control Registers (rev 04)

but since I had that system available to test with, I spotted that problem
and made it present that device as ff:06.3 (both with and without -P).
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
