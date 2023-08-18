Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6F2EE4981
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 17:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239211AbjHRRO7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354384AbjHRROd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 13:14:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1A23AB0
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 10:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Sged2QBxFz12vkRid+UwW1ChCbX67jfoXNst1SEnGXo=; b=RIoa3ZG3DZeK88/qcBc/XDkO7r
        00nh58emeQr4ce8YdUOxsWcFKWLJiD7PiwaRnaO5GedPpt3uE9LiFdJ2iH5i72zaD+104J0PL2AZb
        JhWimTyvyh4moqH1iBigxK8EQKb9ORtxzN+BvZRHr9cEo3wGWsxV4iWT7c5Q+oBS/KS0qUpuGLJ/w
        mcwhWU7D0jKjNZI6YGoLHxM8vydEAG4pfyB+tLxdtkhWhMfCBd6KykbC3UbWM7Xn68YehzK1V1la2
        cYhHa05xIe6Mmmpb0/IH3gTkr7a6uTRp1yXDqnQEGjTw7bBNMZgIxkxyRpxRoGh0422tcFlb0mpUg
        sylquLsQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qX33M-00AfAj-MY; Fri, 18 Aug 2023 17:14:28 +0000
Date:   Fri, 18 Aug 2023 18:14:28 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Carlos Bilbao <carlos.bilbao@amd.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] doc: Always check kernel-doc
Message-ID: <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
References: <20230817144142.903553-1-willy@infradead.org>
 <87cyzkmh26.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyzkmh26.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 18, 2023 at 10:49:37AM -0600, Jonathan Corbet wrote:
> "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> > kernel-doc checks were initially enabled only for builds which had extra
> > warnings enabled.  We have now eliminated enough kernel-doc warnings that
> > we can enable kernel-doc checking by default.  This comes at a slight
> > cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
> > increase by less than 5%:
> 
> So I'm not opposed to this and can carry it in docs-next (after the
> merge window, though, for something like this).  But, it seems to me, we
> should copy Masahiro (added) on a build patch of this type.

Thanks!  I've got a small collection of doc fixup patches redy to go;
I'm going to spray them at maintainers and see what lands in this
merge window.  I'm focusing on mm/ and fs/ since I know those areas
better than others.  net/ is in good shape; only 25 lines of errors
(21 of them in ceph).

I would suggest that we still have quite a lot of kernel-doc which is
not incorporated into .rst files, which seems like a shame.  Does anyone
have time to write a script that finds every file with kernel-doc in
it, then finds which of those files do not have ".. kernel-doc::"
lines in Documentation/ ?
