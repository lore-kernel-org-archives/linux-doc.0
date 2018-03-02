Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C47DE7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 16:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967937AbeCBQm4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 11:42:56 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41856 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967452AbeCBQmz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 11:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=K3qQRx1M/BqfUVymRZ3vBqiOamWdjMfNdZ0Qx9h09y8=; b=AmzFmWCGYNUsyShWJlUsICQTC
        ZA3KPy3znHiQCWv8EzIXH+mpn8raBxdXHCbuEkRSptpREIKeW5Tv3scQJefoDDm2FkvroUuh96M8h
        mU8Zy7N9ziyHlKNR8kBlkDUIC2J1xmD7sPr2F6AOTzpMDRFlhW0XJ0gOgD2zO0dhVpP0hdom0yr49
        qQ5+oxmmqA+ueMJxA5z0SpjOOqZPGMfv+BhtPY/h/HhxfaarxvencbKh+cDcYUUHuMuIqGGAdcHjn
        Li9tq5Ws+Q22dZ3k33o+xMe0CS4AyaDcu8906JRs3okznMhnQzD3Yjwh6Siuj8tycAHy7/oIzXXyc
        NHPummofQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.89 #1 (Red Hat Linux))
        id 1ernlm-0006jP-Il; Fri, 02 Mar 2018 16:42:54 +0000
Date:   Fri, 2 Mar 2018 08:42:54 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Takashi Iwai <tiwai@suse.de>, Jonathan Corbet <corbet@lwn.net>,
        Jiri Slaby <jslaby@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/sphinx: Fix Directive import error
Message-ID: <20180302164254.GB31400@bombadil.infradead.org>
References: <20180302152831.11510-1-tiwai@suse.de>
 <871sh2v53l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871sh2v53l.fsf@intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 02, 2018 at 06:01:50PM +0200, Jani Nikula wrote:
> On Fri, 02 Mar 2018, Takashi Iwai <tiwai@suse.de> wrote:
> > The sphinx.util.compat for Directive stuff was deprecated in the
> > recent Sphinx version, and now we get a build error.
> >
> > Let's import from the new place, docutils.parsers.rst, while keeping
> > the old sphinx.util.compat as fallback.
> >
> > Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1083694
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> > v1->v2: Change the fallback order as Matthew suggested, the new one at first
> 
> So this crossed my mind as well... and then I thought it'll probably
> succeed on older Sphinx, and the fallback is not needed. The question
> is, are these equal? Can we just import from docutils.parsers.rst?

I found a github page which implies that docutils.parsers.rst.Directive
was added 12 years ago (!) so we're probably safe to rely on it:

https://github.com/docutils-mirror/docutils/commit/9649abee47b4ce4db51be1d90fcb1fb500fa78b3

Again, I'm no pythonista, so I may have muddled this.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
