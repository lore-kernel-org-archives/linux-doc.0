Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EA9C19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 12:29:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236240AbiHCM3J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 08:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237984AbiHCM3I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 08:29:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9911AD83
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=E180s6CR6wzNu92DGCX8oKdkGcM5/g3jotE81kgtv04=; b=A427Az3ZNMojBwwhPcJmf8bFeI
        52bnlX2e9804xOgiCz9irxqrkbbhGpCFRArB8qtpHind/CwjihKTRnRhXK3zWrgwIX1FsmisnC+pg
        J0k1XfIKPnG3/2um9pu5cql/JkYKb8ExWKl7OX5XKBKamB8dKrEQyc8JpaDqm9Eg4siW3Y85vi7eX
        905yGJZe+G4X/W09pLY++ktq+jAyEIqkhERyTZDrnd4lSbzm8Th3K3MZUrzIRsA+IF7NjHJn/ytcm
        Holz80tRpytx5Dy1VqU1epHPSOPFGFGNz+rUFHCSEp6IaqBPAkew1Nay9qMXQc2d+Z74PNclqomVh
        55GTQBjg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oJDUl-009GF6-1m; Wed, 03 Aug 2022 12:29:03 +0000
Date:   Wed, 3 Aug 2022 13:29:03 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
Message-ID: <YupqD5I4uTnk/MY8@casper.infradead.org>
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
 <YulJQKL22sB31lfU@casper.infradead.org>
 <87y1w5rdq6.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1w5rdq6.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 03, 2022 at 09:24:49AM +0200, Ricardo Cañuelo wrote:
> Hi Matthew,
> 
> On mar, ago 02 2022 at 16:56:48, Matthew Wilcox <willy@infradead.org> wrote:
> > You don't need to use :c:func:`foo`.  You can just write foo() and the
> > tooling will convert it into :c:func:`foo` for you.
> 
> Thanks for the tip. However, I did some tests and the results aren't
> quite the same. For functions with kerneldocs that are referenced in the
> same document (.. kernel-doc::) the tool does efectively link to the
> generated documentation, but for all the other functions using
> c:func:`foo` generates a different formatting than `foo`, which does no
> formatting at all.

I didn't say `foo`, I said foo().  This is handled by
Documentation/sphinx/automarkup.py.  To quote the doc-guide:

Please note that there is no need to use ``c:func:`` to generate cross
references to function documentation.  Due to some Sphinx extension magic,
the documentation build system will automatically turn a reference to
``function()`` into a cross reference if an index entry for the given
function name exists.  If you see ``c:func:`` use in a kernel document,
please feel free to remove it.
