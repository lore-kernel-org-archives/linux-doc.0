Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 134767D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Jul 2018 22:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754151AbeGFWeA convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Jul 2018 18:34:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38500 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754120AbeGFWd7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Jul 2018 18:33:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 111BA307D840;
        Fri,  6 Jul 2018 22:33:58 +0000 (UTC)
Received: from t450s.home (ovpn-116-113.phx2.redhat.com [10.3.116.113])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 07B522A2DF;
        Fri,  6 Jul 2018 22:33:55 +0000 (UTC)
Date:   Fri, 6 Jul 2018 16:33:56 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
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
        =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v5 1/3] PCI: Make specifying PCI devices in kernel
 parameters reusable
Message-ID: <20180706163356.697f529c@t450s.home>
In-Reply-To: <20180627174650.27433-2-logang@deltatee.com>
References: <20180627174650.27433-1-logang@deltatee.com>
        <20180627174650.27433-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 06 Jul 2018 22:33:59 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 27 Jun 2018 11:46:48 -0600
Logan Gunthorpe <logang@deltatee.com> wrote:

> Separate out the code to match a PCI device with a string (typically
> originating from a kernel parameter) from the
> pci_specified_resource_alignment() function into its own helper
> function.
> 
> While we are at it, this change fixes the kernel style of the function
> (fixing a number of long lines and extra parentheses).
> 
> Additionally, make the analogous change to the kernel parameter
> documentation: Separating the description of how to specify a PCI device
> into it's own section at the head of the pci= parameter.
> 
> This patch should have no functional alterations.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Stephen Bates <sbates@raithlin.com>
> Acked-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
