Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353B6C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 12:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02B40613D8
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 12:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhD3Mh1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Apr 2021 08:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbhD3MhZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Apr 2021 08:37:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E942C06174A
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=pdZr9+Z33g/ltrp+tqVGMH2Sfqh45zT2m/bYasLMJq8=; b=F3UqpWmhFb/qFEtsXOtEVzNC2n
        O6Sm0TuppLkS2BsQBlB0BduH2KCochavRZzt5lBqwh2jzGNcFjADfI/VT44ro1OfUcM29NhLJS1dL
        2SLCmFdjdvmgXJEhclOWgsC4GurxxmK1o4MAjU/3hD+OHX3T9UUNND/gBlG6fB5SRJQHBJVDmhgb7
        W9JDlj3H6e+wR2uJe5DJsMIjbu0ELGYww9j3TBuP+KigJxszPomeRtEfNq7ic6c+vb5mGGNnzgORZ
        NvEhlq/d3yWr1VLegjbWb5zqitGONDeB1T7bq5/eJNpBdWcHjclYdu91hbukEhU7BpcuJb3u/xqxA
        DmlQ1w/w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lcSMD-00B0ne-Da; Fri, 30 Apr 2021 12:35:18 +0000
Date:   Fri, 30 Apr 2021 13:34:57 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: Re: [PATCH 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Message-ID: <20210430123457.GM1847222@casper.infradead.org>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
 <20210419133526.GB2531743@casper.infradead.org>
 <77f0e536-9458-5ef2-6cd8-6d47f0452e14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77f0e536-9458-5ef2-6cd8-6d47f0452e14@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 30, 2021 at 07:06:08PM +0800, Alex Shi wrote:
> On 2021/4/19 下午9:35, Matthew Wilcox wrote:
> > and surely you need a '.. kernel-doc' to have the ':internal:' make sense?
> > 
> > Then, I wonder how useful it is to bring kernel-doc written in English
> > into a Chinese document?  Wouldn't we be better off admitting that we
> > don't provide Chinese documentation for kernel APIs and referring to
> > the English documents?
> > 
> > (I would love nothing more than to provide Chinese documentation for
> > kernel APIs, but we don't have any kind of system for providing that
> > today)
> > 
> 
> I wouldn't reject the Chinese version of kernel-api, but a bit concern
> of the subtle of the doc could be kept in translation. It would be a
> big challenge. :)

That's a big challenge, to be sure, but logistically, where would we
keep it?

A concrete example, we have:

Documentation/core-api/xarray.rst

which has
.. kernel-doc:: lib/xarray.c

which contains:

/**
 * xas_load() - Load an entry from the XArray (advanced).
 * @xas: XArray operation state.
 *
...
 */

So where do we put the Chinese translations?  The kernel-doc is
adjacent to the function to "encourage" C programmers to keep
the documentation up to date when they change the function.
Do we also put the Chinese text in xarray.c?  Do we have a magic
Documentation/translations/zh_CN/lib/xarray.c which contains the
translations of the kernel-doc in lib/xarray.c?  Do we then have tooling
which notices that the inline documentation in lib/xarray.c has changed
and notifies the translator to keep it up-to-date?
