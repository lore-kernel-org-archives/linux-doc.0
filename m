Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C3FC432BE
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE38960EFD
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbhGWGtt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 02:49:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:35840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhGWGtt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Jul 2021 02:49:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F11CD60E90;
        Fri, 23 Jul 2021 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627025421;
        bh=UnS96zYM0c8w/kcN1k1/95kES/5k9EDsz9trSoOA8Co=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NMSjuOUCyj+acp7j0je4E+one/7OqGHT88K2d5Msm2HpUgzZX2ZnWpJH9DGw8sUTX
         103XhrCNGWn/LvuKN3n30ScUxCJVPr3Atbc8CLiwWV9e9fWsCIb8ZyxFB11IpJMhd2
         hFEljvbcqB/9aOEVlCA9Gmxnhn62O/DVN1ldemSs=
Date:   Fri, 23 Jul 2021 09:30:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dongjoo Seo <dseo3@uci.edu>
Cc:     SeongJae Park <sj38.park@gmail.com>,
        "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
        acme@kernel.org, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        corbet@lwn.net, david@redhat.com, dwmw@amazon.com,
        elver@google.com, fan.du@intel.com, foersleo@amazon.de,
        gthelen@google.com, guoju.fgj@alibaba-inc.com, jgowans@amazon.com,
        joe@perches.com, linux-damon@amazon.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sjpark@amazon.de, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com
Subject: Re: [PATCH v34 00/13] Introduce Data Access MONitor (DAMON)
Message-ID: <YPpwCS4CpGtJTy9t@kroah.com>
References: <2E16FC36-18B4-4F92-86AE-51249CCDB1A4@uci.edu>
 <YPpq4u+b/UzAE/3u@kroah.com>
 <23F9BFF6-51B0-4EF7-AF2F-278F89D310C3@uci.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23F9BFF6-51B0-4EF7-AF2F-278F89D310C3@uci.edu>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Fri, Jul 23, 2021 at 04:16:27PM +0900, Dongjoo Seo wrote:
> Thank you for your comment!.
> 
> It has been a long time since Nvidia ended supporting the new kernel
> version on tx2 boards, but for researchers, this set of boards (tx2,
> px2, agx) is a very attractive candidate to use.

But why are you stuck at a known-buggy and insecure kernel version?  I
would work on fixing that first, before worrying about new features.

good luck!

greg k-h
