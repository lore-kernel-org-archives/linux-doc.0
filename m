Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6CB8B7D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Jul 2019 21:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfGLVQX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Jul 2019 17:16:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45378 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727967AbfGLVQW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Jul 2019 17:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=G1sCFsSksPuQgLbIm6AG4b0R7Uh+g1uHd1WLkFwbgqs=; b=cBFOYEPorWm3vVfrSHIRjKIhS
        CNsMMALF0jvrDcaiFV7c3pXd237SCCspVHB2mNIuMqukwYiPMDnuiKoYWL8iaL2KWRHQ4/+BBFiG5
        cIHuzoCT/nP6cwuQlZJu1+OjwjivHoMNuPU673yV5ata6WCTITblD3PfbzQ8FRajjeZ0Hz5ZPkg9o
        Wr8lLQzK55hxujXdbBT9fwjycUeP/yHCYYT0SfFh7vBNMrP8XaYJP1S0evcyD8SbrP1lXmB37J6yl
        ME1vyEyN+mucmmTDOpDpCAHlFs5GfIkZEvS3bVPiShWV30lHH6WqaZbWamdVLlTokXbYB4m/1wQmG
        c6VSMMyjA==;
Received: from [186.213.242.57] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hm2tx-0000Fz-U2; Fri, 12 Jul 2019 21:16:22 +0000
Date:   Fri, 12 Jul 2019 18:16:18 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: conf.py: add CJK package needed by
 translations
Message-ID: <20190712181618.16076499@coco.lan>
In-Reply-To: <20190712141240.2acc23db@lwn.net>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
        <545902a588b76f18cba035700fc0835067e9a1f8.1562696797.git.mchehab+samsung@kernel.org>
        <20190712141240.2acc23db@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 12 Jul 2019 14:12:40 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue,  9 Jul 2019 15:33:23 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > In order to be able to output Asian symbols with XeLaTeX, we
> > need the xeCJK package, and a default font for CJK symbols.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/conf.py | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > index 191bd380c523..e0e1f087d351 100644
> > --- a/Documentation/conf.py
> > +++ b/Documentation/conf.py
> > @@ -277,6 +277,10 @@ latex_elements = {
> >          \\setromanfont{DejaVu Serif}
> >          \\setmonofont{DejaVu Sans Mono}
> >  
> > +	% This is needed for translations
> > +        \\usepackage{xeCJK}
> > +        \\setCJKmainfont{Noto Sans CJK SC}
> > +
> >       '''
> >  }  
> 
> Should there be a change to sphinx-pre-install as well so we don't send
> people down the "which of 5,000 packages do I need now?" rathole?

Makes sense. I'll try to add those, probably as a separate patch.

Adding dependencies for the xeCJK package should likely be easy,
but the requirements for the Noto font is trickier, as it seems
that it requires both a texlive package and a distro-specific one
(at least on Fedora - but I suspect the same will likely be true
on other distros as well). 

I'll need to run it though all VMs I used when I created 
sphinx-pre-install (or recreate them - I haven't touched them for
a while).

Thanks,
Mauro
