Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30C3C4363D
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 23:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31ACE20872
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 23:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NzEuf1QY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbgJGXkh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 19:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgJGXkh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 19:40:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C57C061755;
        Wed,  7 Oct 2020 16:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=amvhMCFH/JEIzDR6sopUyHJKq5Cz3j6B99MCLm4PLCs=; b=NzEuf1QYXkIppO+WmF/yTipZAi
        HKPLikcTWXOLOg3cY1DMoHSipFfv8e1TMgGGqR/p3AqSYcjqk2d4bpKV7sNG2fnmRQoNsJcHhNK3z
        XCU77xWWMp6pN4hjUPUfHZiU+aP87ljxdgtQHdk64r8TT/d/3wxW1/Y26PNXgqzRW1kfHUqMBBMqK
        ecuTASwF8BGrNN7v+H2f2buhDg9n3mPT5TFJbVTgcig57nvuoRibQ1j/xvQhHzpnw+KN3fCBGOP5o
        c+tKKwLVmlGz6HjZ6HJyS1ddzOdYrTpnhBboFY3JHRPZIfz0ggFb4tbmxkWt4hHclq10pEZ+8YZBo
        wrdmrN9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQJ2n-0004oB-20; Wed, 07 Oct 2020 23:40:25 +0000
Date:   Thu, 8 Oct 2020 00:40:24 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@protonmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH] docs: Make automarkup ready for Sphinx 3.1+
Message-ID: <20201007234024.GY20115@casper.infradead.org>
References: <20201007231214.326456-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201007231214.326456-1-nfraprado@protonmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 07, 2020 at 11:12:25PM +0000, Nícolas F. R. A. Prado wrote:
> While Sphinx 2 used a single c:type role for struct, union, enum and
> typedef, Sphinx 3 uses a specific role for each one.
> To keep backward compatibility, detect the Sphinx version and use the
> correct roles for that version.
> 
> Also, Sphinx 3 is more strict with its C domain and generated warnings,
> exposing issues in the parsing.
> To fix the warnings, make the C regexes use ASCII, ensure the
> expressions only match the beginning of words and skip trying to
> cross-reference C reserved words.

Thank you for doing this!

I have a feature request ... could you automarkup NULL as being :c:macro?
Or maybe just anything matching \<[[:upper:]_[:digit:]]*\>
(i may have my regex syntax confused ... a word composed of any
arrangement of upper-case, digits and underscores.)
