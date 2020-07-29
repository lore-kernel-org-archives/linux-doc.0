Return-Path: <SRS0=iu5e=BI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4586C433E1
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 18:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89AAD2053B
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 18:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgG2SGs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Jul 2020 14:06:48 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:49235
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbgG2SGs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 14:06:48 -0400
X-IronPort-AV: E=Sophos;i="5.75,411,1589234400"; 
   d="scan'208";a="355583502"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 20:06:46 +0200
Date:   Wed, 29 Jul 2020 20:06:45 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     mchehab+huawei@kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: Documentation/scsi/aha152x.rst
In-Reply-To: <da610848-322c-3bcf-e351-bead548d8961@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2007292005000.2459@hadrien>
References: <alpine.DEB.2.22.394.2007291908280.2459@hadrien> <da610848-322c-3bcf-e351-bead548d8961@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Wed, 29 Jul 2020, Randy Dunlap wrote:

> On 7/29/20 10:16 AM, Julia Lawall wrote:
> > Hello,
> >
> > The ada152 documentation mentions some compilation flags.  This was
> > converted to ReST as eg:
> >
> > +- DAUTOCONF
> > +    use configuration the controller reports (AHA-152x only)
> >
> > --DAUTOCONF
> > - use configuration the controller reports (AHA-152x only)
> >
> > This is clearly not correct.  The - should be attached to the D, and not
> > be converted to a bullet.  I tried replacing:
> >
> > - DAUTOCONF
> >
> > by
> >
> > - -DAUTOCONF
> >
> > but the result with rst2html was not very satisfactory.  The DAUTOCONF
> > seems to be slightly raised with respect to the rest of the text.  And a
> > subsequent case:
> >
> > - DSETUP0="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
> >
> > comes out different from the ones that have no associated list of possible
> > values (larger letters, different font).
> >
> > What should be done instead?
> >
> > Also, does the kernel include some scripts for testing the documentation?
> > make Documentation/scsi/aha152x.html doesn't seem to work.
>
> I would do this:
>
> $ make SPHINXDIRS="scsi" htmldocs
>
> to limit the htmldocs build to Documentation/scsi/.
> I don't know of a way to build only one output file.

Thanks!  That worked.

The -Ds still don't look at all good though.

julia
