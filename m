Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6ADCB7E281
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 18:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1034433AbeCBS2h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 13:28:37 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51060 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162994AbeCBS2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 13:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8S5jzo+uofDkl7gAViByLwoC7Tz/SRGIimxjIeg4lqA=; b=stN4H0R2Yp0pJjENkTMvFBFAp
        cszyDW2xpL26p/TWpCv67bHS8eqRNTvcGSeyQgj+6ha//vtgq/VU2U1B8LdRhMLJjg1Vh0xbNCndv
        wRArTksZL92NlJmh3+SgjQ8oDO1mqmQ7Uc/ZNt0AS12iKYJ4rscEVKLQmZIgS9iZGOroqDeNffL0j
        9aznPKHTinXjoxFJjt4rTWLspDgVKW1a2/Kbi9/0HnvrNZ6S5SkMrkfkcML2z4vjoJyY2MGjUukYz
        Pg9YsyBbv1I7e356FCXXHjTyUaG1eRFS9fIX1WgpbE6UOXy4BNepd9vip0zBuyH1O/EsRlvkLj+YB
        3QP3V/AGQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.89 #1 (Red Hat Linux))
        id 1erpPz-0006p0-Vd; Fri, 02 Mar 2018 18:28:31 +0000
Date:   Fri, 2 Mar 2018 10:28:31 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Takashi Iwai <tiwai@suse.de>, Jonathan Corbet <corbet@lwn.net>,
        Jiri Slaby <jslaby@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/sphinx: Fix Directive import error
Message-ID: <20180302182831.GF31400@bombadil.infradead.org>
References: <20180302152831.11510-1-tiwai@suse.de>
 <871sh2v53l.fsf@intel.com>
 <20180302164254.GB31400@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180302164254.GB31400@bombadil.infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 02, 2018 at 08:42:54AM -0800, Matthew Wilcox wrote:
> On Fri, Mar 02, 2018 at 06:01:50PM +0200, Jani Nikula wrote:
> > On Fri, 02 Mar 2018, Takashi Iwai <tiwai@suse.de> wrote:
> > > The sphinx.util.compat for Directive stuff was deprecated in the
> > > recent Sphinx version, and now we get a build error.
> > >
> > > Let's import from the new place, docutils.parsers.rst, while keeping
> > > the old sphinx.util.compat as fallback.
> > >
> > > Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1083694
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > > v1->v2: Change the fallback order as Matthew suggested, the new one at first
> > 
> > So this crossed my mind as well... and then I thought it'll probably
> > succeed on older Sphinx, and the fallback is not needed. The question
> > is, are these equal? Can we just import from docutils.parsers.rst?
> 
> I found a github page which implies that docutils.parsers.rst.Directive
> was added 12 years ago (!) so we're probably safe to rely on it:
> 
> https://github.com/docutils-mirror/docutils/commit/9649abee47b4ce4db51be1d90fcb1fb500fa78b3
> 
> Again, I'm no pythonista, so I may have muddled this.

I spent some time delving through the Sphinx codebase.  The compat
version was added so you could use Directive with docutils 0.4 onwards.
docutils 0.5 onwards has Directive.  So as long as we're comfortable
mandating docutils from 2009, we're fine ;-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
