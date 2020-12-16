Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D266DC4361B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 22:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A047320721
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 22:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgLPWVE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Dec 2020 17:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbgLPWVE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 17:21:04 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69574C061794;
        Wed, 16 Dec 2020 14:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Mq/E/K9xrIl07CGLouqL6o2wn8vEoUKM/zgEdi6AGmI=; b=kOAxWX3fArJU/3IZI/hpUGepX6
        XiZu8EHruyL0KnNFLxv/WmQMjfuNSEs3VP2J7YvehJhm1bp9lweJCFcWIhslNpB49S6rEMX6Da9a4
        zftSWJ9uTSPsUkQH0c7Xtzv2pLhBF7aCcktAj/w6sQKBIfTzflG/DwMg+eUXAnTv5XbwuMYs70lBg
        SM5hly2nN1NUiyZHFMg3BoyuK9LSDqujfvSEHvu974kpZgmqfQsw1ROyi9VHQaeqEuARPV8ys6aYm
        oIrDc3gQXwNAgJ42HGqB13jhOL8OuTq5ulPdt7dHIwHnIgpfwvc/FvWHrQYRbcCxyoBG1OXShjebQ
        85D6ulkg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kpf9e-0004AV-Lk; Wed, 16 Dec 2020 22:20:18 +0000
Date:   Wed, 16 Dec 2020 22:20:18 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     konstantin@linuxfoundation.org, corbet@lwn.net,
        miguel.ojeda.sandonis@gmail.com, grandmaster@al2klimov.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: PGP pathfinder service is no longer maintained
Message-ID: <20201216222018.GA15600@casper.infradead.org>
References: <20201216220110.GA12262@ripley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216220110.GA12262@ripley>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 16, 2020 at 11:01:10PM +0100, Oliver Graute wrote:
> Hello,
> 
> Unfortunately the site https://pgp.cs.uu.nl/ is not maintained anymore
> and the "Finding paths to Linus" link in the Kernel Maintainer PGP guide
> is dead. Is there any alternative sites to find a way through the web of
> trust?

Several.  Konstantin has a local one: https://github.com/mricon/wotmate
and if you want a web service, I like this one:
https://the.earth.li/~noodles/pathfind.html
