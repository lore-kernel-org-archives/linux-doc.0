Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19A9E7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Jun 2018 21:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932940AbeFUVAn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Jun 2018 17:00:43 -0400
Received: from ale.deltatee.com ([207.54.116.67]:40342 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932721AbeFUVAm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jun 2018 17:00:42 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtp (Exim 4.89)
        (envelope-from <logang@deltatee.com>)
        id 1fW6gj-0003Ge-Mh; Thu, 21 Jun 2018 15:00:18 -0600
To:     Matthew Wilcox <willy@infradead.org>
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
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20180618193636.16210-1-logang@deltatee.com>
 <20180618193636.16210-3-logang@deltatee.com>
 <20180621192220.GA6635@bombadil.infradead.org>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <6a6e5417-eb7b-921f-34a7-41e22abe5541@deltatee.com>
Date:   Thu, 21 Jun 2018 15:00:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180621192220.GA6635@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: christian.koenig@amd.com, alex.williamson@redhat.com, benh@kernel.crashing.org, jglisse@redhat.com, dan.j.williams@intel.com, frederic@kernel.org, kai.heng.feng@canonical.com, marc.zyngier@arm.com, paulmck@linux.vnet.ibm.com, tglx@linutronix.de, mingo@kernel.org, corbet@lwn.net, bhelgaas@google.com, hch@lst.de, sbates@raithlin.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v3 2/3] PCI: Allow specifying devices using a base bus and
 path of devfns
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 21/06/18 01:22 PM, Matthew Wilcox wrote:
> On Mon, Jun 18, 2018 at 01:36:35PM -0600, Logan Gunthorpe wrote:
> So you probably want to reword this too.  Two formats, one with optional
> trailing path elements?

Thanks for the review Matthew! I've addressed all your feedback for a v4
which I'll post shortly.

Logan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
