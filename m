Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 434147D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Feb 2019 21:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfBDVMh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Feb 2019 16:12:37 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55663 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726843AbfBDVMh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Feb 2019 16:12:37 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id A59802227E;
        Mon,  4 Feb 2019 16:12:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 04 Feb 2019 16:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=EJYum4721TK1QHLmPWann/68xaT
        5TQkkQVastKXzpqs=; b=hjAOLmWb6z/Vn41NzPTbD+tPmZ39rM34cclFZyH/HFF
        nnAnkj2PjA6Yi/iU4hwlDdEgyY2qiL6d0+VUGUpAnESDrpcN1DoV8pUdJU0cyXII
        66BVnm+/FoZBh8vGoFR7M6UW+T72JHh59juibuf9Pb4AUDWuOeQ2Rc3oEUi9YVo8
        53xf9NGsyZnNAWrLCPzMTnCl8w+Qd99+N1A+cHDxcrxqkQhs5raqZHbYIyxaK4t5
        lHuyuIkGetOnNVkoSj21nHxiyn0OzeKMh5NU9UXGiKGhXKPnE5bYNOXd3LvAMxSA
        W0rknUGSEl7BDpFxTxx5hwfRx5rHM5tPHqkRHnjfc3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EJYum4
        721TK1QHLmPWann/68xaT5TQkkQVastKXzpqs=; b=W/LG7u+cKKCdOcB58gLHc0
        f3SSmReXMtvlQCnRvCx9OUs/C3yk0Ro6WTJkfSBotJltwRWrwi/S49SItUkrxeCy
        DcZxOJ0CbMUUg6K2/EsNh3yuxpeVsBvovu31y+i4BqNmCryLfL7xwgpxgE/nFLrB
        /lXOolz7z83/ohv6xfdvYsOT7QRIVpyTVZ+pNC/WSXLMv+5DA6Iy8ZFE+oOcwUvr
        CQqi7DYKl0FAflVnB2HWxqM8Nz20if9zap3nO1XOatPcPChhV0q+bsPh/Q6YhU6k
        liFDPDzNeM8RemSSvs0n0KBRwByHziK636C+7sHtmFsECBpLBn/RqaBKQre8kkcQ
        ==
X-ME-Sender: <xms:w6pYXMtcpG0kQr4s5_7wzoInZk4Hx0UIz0YdJA-oGHFDwt0ETfAz5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrkeeggddugeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
    tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdeftd
    dmnecujfgurhepfffhvffukfhfgggtuggjofgfsehttdertdforedvnecuhfhrohhmpedf
    vfhosghinhcuvedrucfjrghrughinhhgfdcuoehmvgesthhosghinhdrtggtqeenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvddurdeggedrvddukedrvddtuden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehtohgsihhnrdgttgenucevlhhushhtvg
    hrufhiiigvpedt
X-ME-Proxy: <xmx:w6pYXKB7DqtZwmPecgqfvcnzhYLln7psFknmzn4qobv5vq6TPP-mWg>
    <xmx:w6pYXI9xmeP2MUXdDLpYSkkYl3TRkol4OyR8tiFfAgdARC6NlGnipg>
    <xmx:w6pYXI7oaFLsnz2Lg5Wt_xFOR7xOZ1x0E1EkmVgoBS8blVBDX_XGQg>
    <xmx:xKpYXMtGkhQXbR0GBK7uUMHe4_qJdm4z8Vap4TN8CnAAjwM3eMQ2iA>
Received: from localhost (ppp121-44-218-201.bras1.syd2.internode.on.net [121.44.218.201])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0255BE412C;
        Mon,  4 Feb 2019 16:12:33 -0500 (EST)
Date:   Tue, 5 Feb 2019 08:12:20 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190204211220.GA8601@eros.localdomain>
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc>
 <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain>
 <20190201160310.5b98eb69@lwn.net>
 <20190202143209.GA8620@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202143209.GA8620@rapoport-lnx>
X-Mailer: Mutt 1.11.3 (2019-02-01)
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 02, 2019 at 04:32:10PM +0200, Mike Rapoport wrote:
> On Fri, Feb 01, 2019 at 04:03:10PM -0700, Jonathan Corbet wrote:
> > On Fri, 1 Feb 2019 07:56:08 +1100
> > "Tobin C. Harding" <me@tobin.cc> wrote:
> > 
> > > > > From: "Tobin C. Harding" <tobin@kernel.org>
> > > > > 
> > > > > sphinx emits warning
> > > > > 
> > > > >        WARNING: undefined label: memory-allocation ...  
> > > > 
> > > > Weird, for me it works fine. The generated html at kernel.org [1] also
> > > > seems to be Ok...
> > > > 
> > > > What version of sphinx do you use?  
> > > 
> > > Thanks for looking at this Mike.  I was running 1.4, I see there is a v2
> > > out so I'll upgrade but if the warning doesn't show for you then I'd say
> > > we just drop this patch.
> > > 
> > > Jon,
> > > 
> > > Is it within your usual workflow to take just the first two patches from
> > > this series or would you like me to spin another version without the
> > > final patch in it?
> > 
> > We currently document that 1.4 is supposed to work, so we should stick to
> > that; I think I'll go ahead and apply all three patches.
> >
> > We should maybe consider dragging our minimum version forward a bit, or
> > else we might want to document this particular gotcha.
> 
> I have 1.4.6 (the one listed in sphinx.rst) and everything worked just
> fine...

I tried to investigate this further and I am unable to reproduce the
original warning.  I'm using python virtual environment as directed by
the output of `make htmldocs` so the environment should not have
changed.  The only other plausible explanation seems to be that I've
gone mad and can't remember what I was doing three days ago.

Thanks for your patience.


	Tobin.
