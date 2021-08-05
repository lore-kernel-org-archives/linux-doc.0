Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D8C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 489036101C
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242954AbhHET3A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:29:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235961AbhHET27 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 15:28:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 482AF60F35;
        Thu,  5 Aug 2021 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628191724;
        bh=c0Vs2HNByH4Fwmy8Vxl8UQ27uBsApQZgZhBBXqQepZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qXJLPYpu3rpE8NBbGezgtyv/6usNCSrqixGehji/uZOhWmKxo55UXnWggZPCAjlG0
         iBE+anl1msqQhP9pnh22ackMBtwgSvcrNUTqwMMNzLxrChbkS1UV7/Gal9p7L/veib
         kVE07QIORwUa4vHhS18vPCjEJoMokdx/NEoevmaE=
Date:   Thu, 5 Aug 2021 21:28:42 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
Message-ID: <YQw76oNrFQvyW0ua@kroah.com>
References: <YQuYCePPZEmVbkfc@kroah.com>
 <YQuZdVuaGG/Cr62y@kroah.com>
 <YQuaJ78y8j1UmBoz@kroah.com>
 <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com>
 <YQwlHrJBw79xhTSI@kroah.com>
 <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com>
 <YQwpa+LAYt7YZ5dh@kroah.com>
 <1e0967ee-c41e-fd5d-f553-e4d7ab88838c@linux.intel.com>
 <CAPcyv4h26QmPhJKjtUB-VPc4TP95rBAer78OzkgXncg77tFWVw@mail.gmail.com>
 <179a8351-5541-a4f0-bbb2-5d4f398e2476@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179a8351-5541-a4f0-bbb2-5d4f398e2476@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 05, 2021 at 12:08:52PM -0700, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 8/5/21 12:01 PM, Dan Williams wrote:
> > What's wrong with the generic authorized proposal? The core can
> > default to deauthorizing devices on the platform bus, or any bus,
> > unless on an allow list. It's a bit more work to uplevel the local
> > "authorized" implementations from USB and Thunderbolt to the core, but
> > it's functionally identical to the "filter" approach in terms of
> > protection, i.e. avoiding probe of unnecessary unvetted drivers.
> 
> I have not yet read about the "authorized" model in USB and Thunderbolt.
> So bear with me if my question is basic or obvious. In the case USB
> authorized model, who maintains the allow list? kernel or userspace?

Please go read the documentation and don't ask others to do your work
for you...

