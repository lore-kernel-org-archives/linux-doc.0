Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80091C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 18:09:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 509826113D
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 18:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhEFSKP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 14:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhEFSKP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 14:10:15 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208CDC061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yUlIV1muZMeSGzR0/cOWxWNnGKlri2Zf0GkDC7kvXlc=; b=Lh4+xC8zvY4EqoV6UeCw/GsVlb
        QPgnNtZGHY8UjD3GFoYuiL34hiQsBRg3Km8Dt4UdCI1Fg0CpvCFyPvgVxwt/1KKw0k2XWtF+hAbCj
        jfm5bGYO5PzmbhB47Xtmp6KJYl1b1fXVT36jsdcZeQSZiK/XwIHv0TaLSHWSp9VO+YMEGG/rdmq06
        Pakul4OXIsBwKcPy4Y1uL1SZWtHuJ/jKTv3xYSQRwNSfFJmZVEvG7mQofC1nLc7yY6+mHbA/FAzzY
        OA8TPoQ+GcC12Gy/y1YHMfzrlppLZfwC3TJbbQYPBqWTon6UxNEg3+Cm3fY7kBuaLLX0A+EUmQpNG
        FB/46FZw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1leiQU-0023kI-Bl; Thu, 06 May 2021 18:08:53 +0000
Date:   Thu, 6 May 2021 19:08:42 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506180842.GD388843@casper.infradead.org>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:
> I have been going thru some of the Documentation/ files...
> 
> Why do several of the files begin with
> (hex) ef bb bf    followed by "=================="
> for a heading, instead of just "===================".
> See e.g. Documentation/timers/no_hz.rst.

00000000  ef bb bf 3d 3d 3d 3d 3d  3d 3d 3d 3d 3d 3d 3d 3d  |...=============|

ef bb bf is utf8 for 0b1111'111011'111111 = 0xFEFF which is the
https://en.wikipedia.org/wiki/Byte_order_mark

We should delete it.
