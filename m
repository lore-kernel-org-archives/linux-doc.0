Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AD5C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 10:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73452207C3
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602584479;
	bh=1KOk9XSZS8NJ0MqOzm4ccGPeLdbKxr3CC3OT5GpcB/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=WJJAd6Al/8q0mRHpi6D3VZQGPdNnyriRz063wArBsg+S/uHlbTuJaW5OL8DLdFQ27
	 43K72QyUCo1V4kzfhpMmzApi4ZWhEYX0z42iKYzcCekrxC/VFwzjk/HI3fUsrkvhH4
	 3XoQ4pgdY2NeA4UubkITuWLOkJZdauIIjNTJxtdo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388020AbgJMKVS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 06:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387936AbgJMKVO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 06:21:14 -0400
Received: from coco.lan (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 574A520708;
        Tue, 13 Oct 2020 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602584473;
        bh=1KOk9XSZS8NJ0MqOzm4ccGPeLdbKxr3CC3OT5GpcB/s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MdnR7Je7aPtn7qo7mlk9G2HQnjOAhHmWLSlrguko5AoRZCYk2bcCiXKDhiWf5xXn/
         y/RnsrDRCyFQ/WZxemnoNk2pKqTB59XI+rdwGKSN8kdZl/CItB8q1AWuwIm+CUpPNL
         rQbtMASSNQ3d8htTdRecf2IEkb9JA70P5XZkt/wM=
Date:   Tue, 13 Oct 2020 12:21:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation for 5.10
Message-ID: <20201013122108.232a57d6@coco.lan>
In-Reply-To: <20201013205856.21f762ff@canb.auug.org.au>
References: <20201012133042.688ee6a6@lwn.net>
        <20201013104950.25764be1@coco.lan>
        <20201013205856.21f762ff@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 13 Oct 2020 20:58:56 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> On Tue, 13 Oct 2020 10:49:50 +0200 Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >
> > If everything goes well on tomorrow's next, I'll send you a pull request
> > with those.  
> 
> Sorry, bad timing, but there won't be a linux-next tomorrow (I have a
> day off).

No problem. I'll then do it on Thursday. Enjoy your day off!

> 
> > The other ones depend on merges from DRM, hwmon and other
> > trees. So, I'll keep rebasing them and should be sending you a late
> > PR by the end of the merge window, fixing the remaining doc issues.
> > 
> > We're aiming to have zero documentation warnings by
> > the end of the merge window, when built with Sphinx 2.x,  
> 
> That would be nice.  I am still getting about 35-40 each day.

Yeah, currently the warnings are so polluted that it is hard
for developers to see new ones.

Btw, after rebasing the remaining fixes on today's next, there
are a few new warnings:

	build succeeded, 7 warnings.

Hopefully this will be solved soon, after we merge those
fixes upstream, as it will make easier to detect new
ones early and should help maintainers to enforce a cleaner
build.

Thanks,
Mauro
