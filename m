Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7DBC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 11:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238491AbiCNL3x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237023AbiCNL3x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 07:29:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1133BA68
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 04:28:39 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <rhi@pengutronix.de>)
        id 1nTis9-0001Nw-Ke; Mon, 14 Mar 2022 12:28:21 +0100
Received: from rhi by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <rhi@pengutronix.de>)
        id 1nTis7-0001q2-Tk; Mon, 14 Mar 2022 12:28:19 +0100
Date:   Mon, 14 Mar 2022 12:28:19 +0100
From:   Roland Hieber <rhi@pengutronix.de>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] docs: trace: bring headings in order
Message-ID: <20220314112819.up5sls4m4u6bu4oa@pengutronix.de>
References: <20220313105557.172732-1-rhi@pengutronix.de>
 <20220313105557.172732-2-rhi@pengutronix.de>
 <20220313200143.3328cb87@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220313200143.3328cb87@rorschach.local.home>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 13, 2022 at 08:01:43PM -0400, Steven Rostedt wrote:
> On Sun, 13 Mar 2022 11:55:56 +0100
> Roland Hieber <rhi@pengutronix.de> wrote:
> 
> >  
> > -2.2 Inter-event hist triggers
> > ------------------------------
> > +Inter-event hist triggers
> > +-------------------------
> >  
> >  Inter-event hist triggers are hist triggers that combine values from
> >  one or more other events and create a histogram using that data.  Data
> > @@ -1676,8 +1676,8 @@ pseudo-file.
> >  
> >  These features are described in more detail in the following sections.
> >  
> > -2.2.1 Histogram Variables
> > --------------------------
> > +Histogram Variables
> > +-------------------
> >  
> 
> Histogram Variables is a sub section of Inter-event hist triggers,
> which this now removes. This affects the output a breaks the intention
> of the document. I haven't looked at all the other updates, I just
> stopped when I saw this.

Ah, yes. This was probably overlooked when the document was convert into
reST initially.

I'll fix it in the next iteration.

 - Roland

-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |
