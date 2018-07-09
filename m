Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 636A87D048
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Jul 2018 17:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933364AbeGIRAu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 13:00:50 -0400
Received: from ale.deltatee.com ([207.54.116.67]:45990 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933274AbeGIRAt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Jul 2018 13:00:49 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <logang@deltatee.com>)
        id 1fcZVO-0005p6-0d; Mon, 09 Jul 2018 10:59:18 -0600
To:     Alex Williamson <alex.williamson@redhat.com>
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
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Matthew Wilcox <willy@infradead.org>
References: <20180627174650.27433-1-logang@deltatee.com>
 <20180627174650.27433-4-logang@deltatee.com>
 <20180706165655.62306b6f@t450s.home>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <db0ed0d6-c9ad-6414-77b0-d8ff293337ef@deltatee.com>
Date:   Mon, 9 Jul 2018 10:59:11 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180706165655.62306b6f@t450s.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: willy@infradead.org, christian.koenig@amd.com, benh@kernel.crashing.org, jglisse@redhat.com, dan.j.williams@intel.com, frederic@kernel.org, kai.heng.feng@canonical.com, marc.zyngier@arm.com, paulmck@linux.vnet.ibm.com, tglx@linutronix.de, mingo@kernel.org, corbet@lwn.net, bhelgaas@google.com, hch@lst.de, sbates@raithlin.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williamson@redhat.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v5 3/3] PCI: Introduce the disable_acs_redir parameter
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/6/2018 4:56 PM, Alex Williamson wrote:
> Maybe we track if we enabled ACS via a device specific quirk and
> minimally print an incompatibility error if it's also specified for
> disable_acs_redir?  Thanks,

Ok, makes sense. I'll look at it for v6.

Logan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
