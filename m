Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D382C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbiFCPWm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbiFCPWl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:22:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E62EE1E
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=pEDRaNGp+Ey1X5YgRwXsydSRdn6EiYWPYLqH5acB/Gg=; b=ilRIb7c1jMzUVIjNV4aZrWhF4o
        r28gEeG5oNpFlfMxykYdzL3Sr36MH1qvEbbEthzEa71HnFEEsxPGx+tUWSCDYp8GjlTTijLrSQS9y
        pNUoXg3uN34jFfX2VaFhhM0PI+jbb9jwhAzeTe/I01ma6dxOImiV3L5adlM7p/VOGhFRLkgoGOItV
        9OUYWmkIsHXJvqhsrvM67NYCyq/4svC60BZR3BJoHyvREP4Jq2aYWjdgiqxi7Rw3vQypj8l6A50WE
        Nf5dthrZ0U2Wt+bBXKwTvS98iKCJSYXDoF4hpdi+J6AYEd13s66X0Tzl6Hi5agmLr6X2qwTjtG2Br
        qMcKJ6KA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nx98C-007yGw-GV; Fri, 03 Jun 2022 15:22:32 +0000
Date:   Fri, 3 Jun 2022 16:22:32 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <YponOKPBgE8pgBYD@casper.infradead.org>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d5xx1xo.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 03, 2022 at 08:21:39AM -0600, Jonathan Corbet wrote:
> Adam Turner <aaturnerpython@outlook.com> writes:
> 
> > Hi,
> >
> > I was pointed in the direction of this mailing list by Jani Nikula in
> > [1]_, who said:
> >
> >> Thanks for the ping. I was heavily involved in the early days of
> >> converting the kernel to use Sphinx, but I haven't closely followed
> >> the recent developments. Basically I think I'd also be inclined to
> >> push for much higher minimum Sphinx version requirements than what
> >> the kernel currently has. The minimum at the moment is v1.7.9 
> >> (or v2.4.4 for PDF). It's difficult to maintain support for a wide
> >> range of Sphinx versions. Perhaps the best bet would be to mail the
> >> kernel documentation list at linux-doc@vger.kernel.org and Cc 
> >> Jonathan Corbet corbet@lwn.net to try to reach an understanding on
> >> the recommended minimum version and version ranges that makes sense
> >> for both parties to support. HTH.
> >
> > This email is an attempt to do that. 
> >
> > From Sphinx's perspective, we'd like to remove long-deprecated code.
> > What is a good solution here for both sides? The intertial option is
> > for us to delay the deprecation by another major version (removal is
> > currently scheduled for Sphinx 6 (2023-05), and we are currently 
> > releasing a major version every May.
> >
> > Jani reports that you still require Sphinx 1.7.9 -- I have no 
> > investment in the documentation development of the kernel, but he
> > rightly notes that is quite an old version -- released 3 years and 9
> > months ago.
> >
> > Please would you let me know if there is anything required on our
> > (Sphinx's) end that would let us drop the "pre v3" support gracefully.
> 
> We've been meaning to raise the minimum version for a bit.  Going to v3
> might be a bit of a stretch, though.  I still do most of my test builds
> with 2.4.3 just because Sphinx got so....much........slower with 3.0.
> I've not yet had a chance to try out 5.0 to see if that helps things,
> that's on my list to do soon.

We'd need to coordinate with kernel.org's automated build of the
documentation.  I believe Konstantin handles that.  With pip, I imagine
he can install whatever version is needed.

There's a bug I've been meaning to track down & report where _some_ links
are broken when building with the Sphinx natively installed on my system
(Debian 4.3.2-1).  I haven't bothered because (a) life is short and (b)
it's not affecting the kernel.org build.  If we're going to ask
kernel.org to move to a newer version of Sphinx, we should make sure
that the links won't be broken on whatever version we pick.

An example:
<span class="kt"><span class="pre">void</span></span><span class="w"> </span><span class="p"><span class="pre">*</span></span><span class="sig-name descname"><span class="n"><span class="pre">kmap_local_folio</span></span></span><span class="sig-paren">(</span><span class="k"><span class="pre">struct</span></span><span class="w"> </span><a class="reference internal" href="#c.kmap_local_folio" title="folio"><span class="n"><span class="pre">folio</span></span></a><span class="w"> </span><span class="p"><span class="pre">*</span></span><span class="n"><span class="pre">folio</span></span>, <span class="n"><span class="pre">size_t</span></span><span class="w"> </span><span class="n"><span class="pre">offset</span></span><span class="sig-paren">)</span><a class="headerlink" href="#c.kmap_local_folio" title="Permalink to this definition">¶</a><br /></dt>

Other than that being a big pile of html, that <a href> around 'folio'
should be a link to struct folio and not back to the c.kmap_local_folio
anchor.

I appreciate this is not a great bug report, but I find the entire
build system beyond my comprehension.
