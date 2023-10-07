Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D783E81E14
	for <linux-doc@archiver.kernel.org>; Sat,  7 Oct 2023 03:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbjJGD5Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 23:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbjJGD5Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 23:57:24 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BBBBD
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 20:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=ZQog0NF2K+q/b/uy0DYX2KSFkpgsKJXWNkkr/ngs9AA=; b=UpdOng0r/oD2X1H14xI15wC4MK
        mDrrSfxBhaaE62oD2AS5a53bLQQu9ZCMWM7IHZ8NjFYIqg3SNFbVJ7FhRJdf/EwYZepTCzDqVhKQH
        tLRo+vqCecGlAxL7XiyNlPtiKBzW/WTZKv/gOJiNWc3Z1cRZT5AEfHNPE2hbXSrjr3gbbgsgj7caF
        /KpHxMHqnPxQpp+26THr6FrG4TFdNlP+50C6YvbdBz8pCowNtOxdxIuzQN54ANG6uv9TDgdxN3xwJ
        tKU2eP855qmw8gDkPcQUNYoeqb7wn6KGcBC2TmrrJOpQ04I4YtpVpybEah1zKz7Cd57pCjLn8JQlj
        a0sAzRWQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qoyRG-001Xv1-RR; Sat, 07 Oct 2023 03:57:14 +0000
Date:   Sat, 7 Oct 2023 04:57:14 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH] doc: Always check kernel-doc
Message-ID: <ZSDXGgofqj+9l16e@casper.infradead.org>
References: <20230817144142.903553-1-willy@infradead.org>
 <87cyzkmh26.fsf@meer.lwn.net>
 <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
 <CAK7LNARKv_HGsF3r076u+G1ia645stimnoYc93CQ-9_3wvBe5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARKv_HGsF3r076u+G1ia645stimnoYc93CQ-9_3wvBe5w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 20, 2023 at 07:48:26AM +0900, Masahiro Yamada wrote:
> On Sat, Aug 19, 2023 at 2:14 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Fri, Aug 18, 2023 at 10:49:37AM -0600, Jonathan Corbet wrote:
> > > "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> > > > kernel-doc checks were initially enabled only for builds which had extra
> > > > warnings enabled.  We have now eliminated enough kernel-doc warnings that
> > > > we can enable kernel-doc checking by default.  This comes at a slight
> > > > cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
> > > > increase by less than 5%:
> 
> Adding CONFIG_KDOC_CHECK or something
> will allow people to avoid 5% build-time cost.
> You can set "default y" or "default COMPILE_TEST".

No, people won't set it.

> > > So I'm not opposed to this and can carry it in docs-next (after the
> > > merge window, though, for something like this).  But, it seems to me, we
> > > should copy Masahiro (added) on a build patch of this type.
> >
> > Thanks!  I've got a small collection of doc fixup patches redy to go;
> > I'm going to spray them at maintainers and see what lands in this
> > merge window.  I'm focusing on mm/ and fs/ since I know those areas
> > better than others.  net/ is in good shape; only 25 lines of errors
> > (21 of them in ceph).
> 
> Any single instance of warning may result in a rejection by Linus.
> Anyway, we will see.

Can we have a way to enable kernel-doc coverage on a per-directory basis?
It will stop us from regressing.  I got mm/ down to zero warnings, and
that promptly regressed.  If we force kernel-doc to run on files under
mm/, developers will notice breakage quickly.
