Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1CFC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 06:23:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E78861422
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 06:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbhDUGYa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Apr 2021 02:24:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:46978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235975AbhDUGY3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Apr 2021 02:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5259361421;
        Wed, 21 Apr 2021 06:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618986237;
        bh=yl/EdA30w7Ubmk3pTbQcHXk9BFC3bs7ulum3Oyt71Mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cpw826sV/Y/ioGMC08dttXBmA6y/S/ZAPi4cG19VqhlH2lNJEw823qKkqknEVdrUy
         CxJSIFcJPItGOcTCgfxxG//FjPri5nrpjhZu/RMHdIXccVE/mDr90vaGa7A2p4K1ZP
         HPrWlwNir3054PONTwXYG0+Cgqi+4QGrCoMGPU+8=
Date:   Wed, 21 Apr 2021 08:23:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] docs: driver-model: Update the documentation for
 device class
Message-ID: <YH/E90QVq7yP01ii@kroah.com>
References: <20210407061053.81940-1-manivannan.sadhasivam@linaro.org>
 <87czuoio8r.fsf@meer.lwn.net>
 <20210421061340.GA6522@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421061340.GA6522@thinkpad>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 21, 2021 at 11:43:40AM +0530, Manivannan Sadhasivam wrote:
> On Tue, Apr 20, 2021 at 04:29:24PM -0600, Jonathan Corbet wrote:
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> > 
> > > The current documentation about the device class is out of date such
> > > that it refers to non-existent APIs and structures. This commit updates
> > > them to the current device class APIs and structures, removes wordings
> > > that no longer valid while trying to keep the original content intact.
> > >
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >
> > > Changes in v2:
> > >
> > > * Fixed CLASS_ATTR_RW as spotted by Greg
> > >
> > >  .../driver-api/driver-model/class.rst         | 144 ++++++++----------
> > >  1 file changed, 66 insertions(+), 78 deletions(-)
> > 
> > Note that this file was removed in commit 1364c6787525 back in
> > February by Geert (added to CC).  If you want to update this document,
> > you'll first want to bring it back.
> > 
> 
> Oh thanks for the info! Perhaps I could just revert 1364c6787525 and add this
> commit on top?

Nah, leave it removed for now, it needs lots of work to be relevant.

greg k-h
