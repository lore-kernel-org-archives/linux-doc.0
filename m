Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A496D7E3B2
	for <lwn-linux-doc@archive.lwn.net>; Thu,  2 Aug 2018 10:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729899AbeHBMDX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 2 Aug 2018 08:03:23 -0400
Received: from www.llwyncelyn.cymru ([82.70.14.225]:45822 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726702AbeHBMDX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 2 Aug 2018 08:03:23 -0400
Received: from alans-desktop (82-70-14-226.dsl.in-addr.zen.co.uk [82.70.14.226])
        by fuzix.org (8.15.2/8.15.2) with ESMTP id w72AA0JR012178;
        Thu, 2 Aug 2018 11:10:00 +0100
Date:   Thu, 2 Aug 2018 11:10:00 +0100
From:   Alan Cox <gnomes@lxorguk.ukuu.org.uk>
To:     "Tian, Kevin" <kevin.tian@intel.com>
Cc:     Jerome Glisse <jglisse@redhat.com>,
        Kenneth Lee <nek.in.cn@gmail.com>,
        Hao Fang <fanghao11@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@huawei.com" <linuxarm@huawei.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Zaibo Xu <xuzaibo@huawei.com>,
        Kenneth Lee <liguozhu@hisilicon.com>,
        "David S . Miller" <davem@davemloft.net>,
        "linux-accelerators@lists.ozlabs.org\" <linux-accelerators@lists.ozlabs.org>"@fuzix.org
Subject: Re: [RFC PATCH 0/7] A General Accelerator Framework, WarpDrive
Message-ID: <20180802111000.4649d9ed@alans-desktop>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D191290E1A@SHSMSX101.ccr.corp.intel.com>
References: <20180801102221.5308-1-nek.in.cn@gmail.com>
        <20180801165644.GA3820@redhat.com>
        <AADFC41AFE54684AB9EE6CBC0274A5D191290E1A@SHSMSX101.ccr.corp.intel.com>
Organization: Intel Corporation
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> One motivation I guess, is that most accelerators lack of a 
> well-abstracted high level APIs similar to GPU side (e.g. OpenCL 
> clearly defines Shared Virtual Memory models). VFIO mdev
> might be an alternative common interface to enable SVA usages 
> on various accelerators...

SVA is not IMHO the hard bit from a user level API perspective. The hard
bit is describing what you have and enumerating the contents of the device
especially when those can be quite dynamic and in the FPGA case can
change on the fly.

Right now we've got
- FPGA manager
- Google's recently posted ASIC patches
- WarpDrive

all trying to be bits of the same thing, and really there needs to be a
single solution that handles all of this stuff properly.

If we are going to have any kind of general purpose accelerator API then
it has to be able to implement things like

	'find me an accelerator with function X that is nearest my memory'
	'find me accelerator functions X and Y that share HBM'
	'find me accelerator functions X and Y than can be chained'

If instead we have three API's depending upon whose accelerator you are
using and whether it's FPGA or ASIC this is going to be a mess on a grand
scale.

Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
