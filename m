Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C5EA7D08C
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Jun 2018 20:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754533AbeFVUvD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Jun 2018 16:51:03 -0400
Received: from ale.deltatee.com ([207.54.116.67]:47668 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754530AbeFVUvC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 22 Jun 2018 16:51:02 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtp (Exim 4.89)
        (envelope-from <logang@deltatee.com>)
        id 1fWT13-00032T-Q5; Fri, 22 Jun 2018 14:50:46 -0600
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Stephen Bates <sbates@raithlin.com>,
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
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Matthew Wilcox <willy@infradead.org>
References: <20180622194315.10475-1-logang@deltatee.com>
 <20180622194315.10475-2-logang@deltatee.com>
 <1222da4e-864c-5e27-b735-99fc53d1e367@infradead.org>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <baccb879-0ddc-37e0-1d54-747beb47e6a8@deltatee.com>
Date:   Fri, 22 Jun 2018 14:50:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1222da4e-864c-5e27-b735-99fc53d1e367@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: willy@infradead.org, christian.koenig@amd.com, alex.williamson@redhat.com, benh@kernel.crashing.org, jglisse@redhat.com, dan.j.williams@intel.com, frederic@kernel.org, kai.heng.feng@canonical.com, marc.zyngier@arm.com, paulmck@linux.vnet.ibm.com, tglx@linutronix.de, mingo@kernel.org, corbet@lwn.net, bhelgaas@google.com, hch@lst.de, sbates@raithlin.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v4 1/3] PCI: Make specifying PCI devices in kernel
 parameters reusable
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 22/06/18 02:05 PM, Randy Dunlap wrote:
> Hi,
> 
> On 06/22/2018 12:43 PM, Logan Gunthorpe wrote:
> 
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 97acba712e4e..cb999b2a9530 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -191,6 +191,92 @@ void __iomem *pci_ioremap_wc_bar(struct pci_dev *pdev, int bar)
>>  EXPORT_SYMBOL_GPL(pci_ioremap_wc_bar);
>>  #endif
>>  
>> +/**
>> + * pci_dev_str_match - test if a string matches a device
>> + * @dev:    the PCI device to test
>> + * @p:      string to match the device against
>> + * @endptr: pointer to the string after the match
>> + *
>> + * Test if a string (typically from a kernel parameter) matches a
>> + * specified. The string may be of one of the following formats:
> 
> "matches a specified."  eh?

Shoot, must have been over edited. Will fix for v5.

Logan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
