Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9FC3B7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 21:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbeIMCOx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 22:14:53 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47655 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727010AbeIMCOw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 22:14:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1E38B21B55;
        Wed, 12 Sep 2018 17:08:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 12 Sep 2018 17:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :content-type:date:from:in-reply-to:message-id:mime-version
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=z6L2qD+kF8otdWVw52Jz5NxW5uUCDzgX/D01RV1YMlk=; b=QMg+sMiM
        RheGXLbqpVXdtl6z54cmapSArueOYPcDc5tSuSVGp5mlnGsaiAaVCN0XZhCmfJ83
        /93RMOh3y/T3VI2UpisuSLFLhvd0q9Paf3TpMpPDth0wEGiJUwYm9rOTDH/TUO8f
        JmKfYUTxLhWgrmH+4Y0Li+O+ipWiRlxw5Z6GANOR/4SoGNcAMRQvW2qHCNt5H/XE
        gkRo0XYo8YZDLkQllnR17oLowBtNOdupoT7m/0Ylvggv3x2V1Ge/v5K9d59PqWxF
        3sHVagx2c/EiGXwjD4Rryb2gHq6/fvima63AaUdFJZO8P4IgSaBsfNYmOjB9w48a
        HIeddiaF0RIbOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=z6L2qD+kF8otdWVw52Jz5NxW5uUCD
        zgX/D01RV1YMlk=; b=Z2gXVkxkuBzUrbOdsmgKJts+Lq6lSmBrCcV6+nPN3/dfh
        X8QbBmaT2tp5tasb8UeeU/pcuoN2BPGKdMlPSPYSJs74L7jn9nGG+OmPox4zbyZB
        ZX5Q841kM+04FruhVIhYVoCJdghUxQ/k80Dqt+RgAh16GoKY6m8kk4gLuQCxyX9A
        jKj+PtelawxCyHC14ej7HHNF0MToAw5Uv4tiX8jLaEKxjg4WZtpplL1rOu2FW32y
        1tN6yJQ1bxqAmyH+I/fbzHb427i22+9i14NXbWl69jan1H62nUrGTL4svIZ3/gs7
        vr4G+08nAZUJ081C1t6TE8R5bGwagVGqDheErAjig==
X-ME-Proxy: <xmx:T4CZW4Qo3qbr1qaBrB75J1tECLnVzru8MMoGkAeoXdSBNTDGP0HFMQ>
    <xmx:T4CZWw6_xBYpCZAmtLTd55PAIqPelDXbOvrZGM_c8UNeVtJNmtHhwQ>
    <xmx:T4CZW8vQyfrsKaj2i6uLvhh-oAyHq4UtyDONpEcux_TqtCvkenfn3A>
    <xmx:T4CZWxV3K3Ce0j-V77UjxGWgT__xbIBVhwGcYUKdUz056G7pbqOO_Q>
    <xmx:T4CZW7D4pnyCP4PB83Pqz0MgSrrzLAI8wRG7zz2p4HhKI8p0atS3qg>
    <xmx:UICZW3DBg1fwwgHElYRikUgxiYwsjXdFa2KDS96GRvLFP3rNLJ2rlA>
X-ME-Sender: <xms:T4CZW81DwxiDPOoP-uWrHNDjdgMHFmCx2MHOGhUwbIbTSLVKgj4rcg>
Received: from localhost (124-169-9-200.dyn.iinet.net.au [124.169.9.200])
        by mail.messagingengine.com (Postfix) with ESMTPA id F0E25102D4;
        Wed, 12 Sep 2018 17:08:30 -0400 (EDT)
Date:   Thu, 13 Sep 2018 07:08:27 +1000
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] tty_port: Fix function name and brief desc
Message-ID: <20180912210827.GB9737@eros>
References: <20180912075044.8695-1-me@tobin.cc>
 <20180912075044.8695-3-me@tobin.cc>
 <20180912093116.GC1089@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912093116.GC1089@localhost>
X-Mailer: Mutt 1.9.4 (2018-02-28)
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 12, 2018 at 11:31:16AM +0200, Johan Hovold wrote:
> On Wed, Sep 12, 2018 at 05:50:43PM +1000, Tobin C. Harding wrote:
> > File contains kernel-doc function comments that are not in the correct
> > style.
> > 
> >  - Add '()' to function names
> >  - Capitalise brief description and append a full stop.
> 
> Cleaning up these comments may not be a bad idea, but I have my doubts
> about this particular item. Many descriptions aren't full sentences and
> still won't be even if you capitalise and slap a full stop there, for
> example:
> 
> > - *	tty_port_hangup		-	hangup helper
> > + * tty_port_hangup() - Hangup helper.
> 	
> There's no requirement to use full sentences, and the old kernel-doc
> nano doc uses incomplete ones, as do most (?) kernel-doc comments
> throughout the kernel.
> 
> I'd just drop this part of the patch. 

Ok, sounds good to me.  Thanks for the review.


	Tobin
