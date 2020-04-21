Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B924C54FCC
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 16:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FABD206D5
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 16:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgDUQci (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 12:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725930AbgDUQch (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Apr 2020 12:32:37 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82B6C061A41
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 09:32:37 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 66471823;
        Tue, 21 Apr 2020 16:32:37 +0000 (UTC)
Date:   Tue, 21 Apr 2020 10:32:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Gal Pressman <galpress@amazon.com>, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
Message-ID: <20200421103236.4b64155c@lwn.net>
In-Reply-To: <20200421123837.GZ3456981@phenom.ffwll.local>
References: <20200420074115.23931-1-galpress@amazon.com>
        <20200420170059.5a42693e@lwn.net>
        <20200421123837.GZ3456981@phenom.ffwll.local>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 21 Apr 2020 14:38:37 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> > On Mon, 20 Apr 2020 10:41:15 +0300
> > Gal Pressman <galpress@amazon.com> wrote:
> >   
> > > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > > 
> > > Signed-off-by: Gal Pressman <galpress@amazon.com>  
> > 
> > Applied, thanks.  
> 
> Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
> drm. And maybe I actually get around to doing the doc polish for all
> things dma-buf that I've been promised to do since months :-)

I actually looked for it in linux-next before applying, but didn't (and
don't) see it there...?

Thanks,

jon
