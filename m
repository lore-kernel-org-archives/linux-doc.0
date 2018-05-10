Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0435F7DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 21:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752537AbeEJV2k (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 17:28:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51860 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752416AbeEJV2j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 17:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dDN6xQtno2dTHFP6SBP1UcR2PAQ3LWgEIblTrz2U9ag=; b=Fwj34C3HC5n25CW8qNy8Ge+mZ
        oMofPmBws/CbE+dzjjBcOLeh1n2bKoDEz1dDGqJjaCwyBpztLpDRIYaXON2h9qFb71bfk9UNiiFpN
        f2Xmmnml6a8zQYudzTBYScy/D/HF8fLFkHvsvB2jiIArI0uri/7PIu5726N8q/wWv0EHPi3EfzPtB
        dRASGqHvtOsSHtGC3cmixU4Nv1nNpq/Ukihqxh021H8pMfrOb+MpkEfRM7RXVZSUr/m92ecETfY2K
        sWSu/Rbkt5cIMuUgjCJOVzPH4b9Jg+W7afJ5PNpZvv0GMYUmnun/mEOXupEF7ODzZoxLo/KBxng1a
        wLnMhDGNQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGt79-0001WU-0O; Thu, 10 May 2018 21:28:39 +0000
Date:   Thu, 10 May 2018 18:28:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        "Luis R . Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v2 00/11] Fix some doc build warnings/errors and broken
 links
Message-ID: <20180510182834.7b4bd7e3@vento.lan>
In-Reply-To: <20180510142235.221da447@lwn.net>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
        <20180510142235.221da447@lwn.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 10 May 2018 14:22:35 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Wed,  9 May 2018 10:18:43 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > Patches 1 to 5 on this series contain the patches that weren't yet
> > applied from the past patch series and touch only at Documentation.
> > There are two changes there:
> >   patch 2: fixed the description and added a c/c to cgroup maintainers;
> >   patch 4: rewritten according with Louis request, droping several hunks.  
> 
> Of these, I've applied 2, 4, and 6.  The networking and crypto folks like
> to apply their own documentation fixes; I assume they'll pick these up.

Hmm... I'm pretty sure I emailed about patch 4. Luis actually came with
a better solution: he partially removed the note, as it is outdated.
Better to revert it as otherwise it will rise conflicts at -next once
merged.

> 
> > Patch 6 rewrites scripts/documentation-file-ref-check on Perl,
> > adding an auto-fix feature.  
> 
> Applied this one.
> 
> > Patches 7 and 8 fix things that would cause troubles for the
> > automatic autocorrection tool.  
> 
> #7 is applied.  #8 doesn't apply, though; I'm not sure which tree you made
> it against?  In any case, I've stopped here for now.

Andrea commented about #8. You already applied an identical patch :-)

> > Patch 9 touches a lot of random places (including MAINTAINERS)
> > that contain broken links and can be auto-fixed. It could be
> > broken into one patch per touched file, but I think that is
> > overkill.   
> 
> Let's keep this one (and the ones that follow) aside.  I'm happy to apply
> them, but I think they are best applied as an end-of-merge-window thing.  I
> envision lots of conflicts, and I already have a pile of those to explain
> to Linus this time around.

Yeah, this patch touches on a lot of stuff. Better to handle it by the
end of a merge window.

I suspect you'll need to re-generate it by running this command again:

	./scripts/documentation-file-ref-check --fix

But you should check the results, as false positives may arise.

If you prefer, I rebased the tree with the pending patches, placing
patch 9 at the end. This way, you'll likely avoid conflicts with
patches 10 and 11.

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=broken-links-v4

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
