Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7E2D77D0D8
	for <lwn-linux-doc@archive.lwn.net>; Sun, 13 Jan 2019 22:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfAMW1N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 13 Jan 2019 17:27:13 -0500
Received: from foss.arm.com ([217.140.101.70]:52662 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfAMW1N (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 13 Jan 2019 17:27:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C93A380D;
        Sun, 13 Jan 2019 14:27:12 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994423F5BD;
        Sun, 13 Jan 2019 14:27:12 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id EC7B4682073; Sun, 13 Jan 2019 22:27:10 +0000 (GMT)
Date:   Sun, 13 Jan 2019 22:27:10 +0000
From:   Liviu Dudau <Liviu.Dudau@arm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Brian Starkey <brian.starkey@arm.com>,
        Ayan Halder <ayan.halder@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation: Add AFBC modifier usage documentation
Message-ID: <20190113222710.GL20661@e110455-lin.cambridge.arm.com>
References: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
 <20190111181344.GI6310@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190111181344.GI6310@bombadil.infradead.org>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

On Fri, Jan 11, 2019 at 10:13:44AM -0800, Matthew Wilcox wrote:
> On Fri, Jan 11, 2019 at 06:07:49PM +0000, Liviu Dudau wrote:
> > Hi Jonathan,
> > 
> > I have a patch adding documentation for the AFBC modifiers supported
> > by the DRM framework with an upcoming patch series. Patch has been
> > out for review for a while, please pull.
> 
> Nowhere in this email do you say what "AFBC" stands for or is.  Intel are
> awful for acronyms.  ARM are rapidly getting as bad, or worse.  Nobody
> else cares as deeply about your project as you do.  Provide some kind
> of clue about what you're doing and why anybody else should care.

While your critique is pertinent, I think you're forgetting this is a
pull request, not a patch. I didn't think that a pull request for a
patch that has been on the mailing list for a while and that contains
documentation that explains clearly what "AFBC" stands for (Arm
FrameBuffer Compression, for the record) needs to have the additional
information inserted there. At least in my experience, pull requests
explain why the request has been sent and what patches it contains,
not descriptions of what is inside the patches, because those are
handled via different methods.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
