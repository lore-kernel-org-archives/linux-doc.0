Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FB457D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Feb 2019 23:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfBAXDM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 18:03:12 -0500
Received: from ms.lwn.net ([45.79.88.28]:33442 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725803AbfBAXDM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Feb 2019 18:03:12 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 343102C4;
        Fri,  1 Feb 2019 23:03:11 +0000 (UTC)
Date:   Fri, 1 Feb 2019 16:03:10 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190201160310.5b98eb69@lwn.net>
In-Reply-To: <20190131205608.GB1329@eros.localdomain>
References: <20190131040623.15569-1-me@tobin.cc>
        <20190131040623.15569-4-me@tobin.cc>
        <20190131092757.GF28876@rapoport-lnx>
        <20190131205608.GB1329@eros.localdomain>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 1 Feb 2019 07:56:08 +1100
"Tobin C. Harding" <me@tobin.cc> wrote:

> > > From: "Tobin C. Harding" <tobin@kernel.org>
> > > 
> > > sphinx emits warning
> > > 
> > >        WARNING: undefined label: memory-allocation ...  
> > 
> > Weird, for me it works fine. The generated html at kernel.org [1] also
> > seems to be Ok...
> > 
> > What version of sphinx do you use?  
> 
> Thanks for looking at this Mike.  I was running 1.4, I see there is a v2
> out so I'll upgrade but if the warning doesn't show for you then I'd say
> we just drop this patch.
> 
> Jon,
> 
> Is it within your usual workflow to take just the first two patches from
> this series or would you like me to spin another version without the
> final patch in it?

We currently document that 1.4 is supposed to work, so we should stick to
that; I think I'll go ahead and apply all three patches.

We should maybe consider dragging our minimum version forward a bit, or
else we might want to document this particular gotcha.

Thanks,

jon
