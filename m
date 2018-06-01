Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 679307DF8B
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 15:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751780AbeFAPrr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 11:47:47 -0400
Received: from ale.deltatee.com ([207.54.116.67]:35056 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751777AbeFAPrq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Jun 2018 11:47:46 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtp (Exim 4.89)
        (envelope-from <logang@deltatee.com>)
        id 1fOmHA-0006zB-Dn; Fri, 01 Jun 2018 09:47:37 -0600
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
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20180531235010.5279-1-logang@deltatee.com>
 <20180531235010.5279-3-logang@deltatee.com>
 <20180601083000.62d10d14@t450s.home>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <cb689b24-477d-9274-8984-574c244d2499@deltatee.com>
Date:   Fri, 1 Jun 2018 09:47:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180601083000.62d10d14@t450s.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: christian.koenig@amd.com, benh@kernel.crashing.org, jglisse@redhat.com, dan.j.williams@intel.com, frederic@kernel.org, kai.heng.feng@canonical.com, marc.zyngier@arm.com, paulmck@linux.vnet.ibm.com, tglx@linutronix.de, mingo@kernel.org, corbet@lwn.net, bhelgaas@google.com, hch@lst.de, sbates@raithlin.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williamson@redhat.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v2 2/3] PCI: Allow specifying devices using a base bus and
 path of devfns
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 01/06/18 08:30 AM, Alex Williamson wrote:
> Cool, I'm glad this worked.  I note though that there's really not much
> difference between:
> 
> [domain:]bus:slot.fn
> 
> and
> 
> [domain:]bus:slot.fn[/slot.fn[/slot.fn[/...]]]
> 
> IOW, what's defined here as the "path:" specification doesn't require
> that we start at a root bus device, it can really specify a path
> starting anywhere, including the target device directly.  So can we
> simply extend domain:bus:slot.fn to support paths without a separate
> identifier?  Thanks,

Yes, I think you are right. I was just hesitant to change existing
behavior. But if that's the consensus I'll change it for v3.

Thanks,

Logan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
