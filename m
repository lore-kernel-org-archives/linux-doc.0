Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB02C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC76561108
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242369AbhHETMT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:12:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:51490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242328AbhHETMS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 15:12:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE46561078;
        Thu,  5 Aug 2021 19:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628190723;
        bh=3/P9jMgnr17dFIwUnHvNdPBy4enCxguNdG2aEY+cqFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y86CkqGBkt6pIWqke11q2NocT2RAXbi0S/FRYLXu4lwcXPzXr3nyX2LxIjY8lO6I7
         K/M0BEEtZiwhLJYHExq23brlNtjBwPQsDxRcP8YN5vWnF3pi2pExkMeXJDaEvdZKGM
         CQMaoQFLwuLb+0rZrZIcntSPI/USQT1OmIuLtlvc=
Date:   Thu, 5 Aug 2021 21:12:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dan Williams <dan.j.williams@intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1] driver: base: Add driver filter support
Message-ID: <YQw4AEwIUGe3RpCx@kroah.com>
References: <YQrqhYEL64CSLRTy@kroah.com>
 <f2b1d564-8174-f8e9-9fee-12e938c6d846@linux.intel.com>
 <YQuYCePPZEmVbkfc@kroah.com>
 <YQuZdVuaGG/Cr62y@kroah.com>
 <YQuaJ78y8j1UmBoz@kroah.com>
 <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com>
 <YQwlHrJBw79xhTSI@kroah.com>
 <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com>
 <YQwpa+LAYt7YZ5dh@kroah.com>
 <7d6751b1-c476-51d3-25c6-b65c0e93d23b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6751b1-c476-51d3-25c6-b65c0e93d23b@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 05, 2021 at 11:53:52AM -0700, Kuppuswamy, Sathyanarayanan wrote:
> I am not sure how USB and Thunderbolt "authorzied" model works. But I
> don't think it prevents built-in driver probes during kernel boot right?

Yes it does.

Again Intel created this framework well over a decade ago for busses
that it deemed that it did not want to "trust" to instantly probe
drivers for and made it part of the Wireless USB specification.

Then Intel went and added the same framework to Thunderbolt for the same
reason.

To ignore this work is quite odd, you might want to talk to your
coworkers...

greg k-h
