Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2027F7E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 18:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754173AbeCGSJR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 13:09:17 -0500
Received: from isilmar-4.linta.de ([136.243.71.142]:35406 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753168AbeCGSJQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 13:09:16 -0500
Received: from light.dominikbrodowski.net (isilmar.linta [10.0.0.1])
        by isilmar-4.linta.de (Postfix) with ESMTPS id 489F4200911;
        Wed,  7 Mar 2018 18:09:15 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
        id 14FBD2023E; Wed,  7 Mar 2018 19:07:34 +0100 (CET)
Date:   Wed, 7 Mar 2018 19:07:34 +0100
From:   Dominik Brodowski <linux@dominikbrodowski.net>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: add Co-Developed-by docs
Message-ID: <20180307180734.GA9004@light.dominikbrodowski.net>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
 <1520222301-11874-3-git-send-email-me@tobin.cc>
 <20180307101614.6722b592@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180307101614.6722b592@lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 07, 2018 at 10:16:14AM -0700, Jonathan Corbet wrote:
> On Mon,  5 Mar 2018 14:58:21 +1100
> "Tobin C. Harding" <me@tobin.cc> wrote:
> 
> > When Co-Developed-by tag was added, docs were only added to
> > Documention/process/5.Posting.rst and were not added to
> > Documention/process/submitting-patches.rst
> > 
> > Add documentation to Documention/process/submitting-patches.rst
> 
> Someday we should really pull those documents together into a coherent
> whole so we don't have these weird synchronization issues.  But it's much
> easier to just apply this, so that's what I've done for now, with Willy's
> comma tweak.

In case you still have my patch to Documentation/process/5.Posting.rst
pending, we'll have a mismatch between Co-developed-by there (which has been
used a number of times in the past), and Co-Developed-by in
submitting-patches.rst and checkpatch and Co-developed-by (which was used
exactly once in Linus' tree). That should be coherent at least...

Thanks,
	Dominik
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
