Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E62AC4707F
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 07:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52CC7613D8
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 07:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhE0HGA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 03:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbhE0HF7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 03:05:59 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF45C061574;
        Thu, 27 May 2021 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=PPArDtmVSbaIBK9KdQAml3WznYWv8zCY7djwFtezsUU=; b=PddqSj8fdb7piv+KzrHrYivWZG
        n+ZYlhNLxGxVHAARYUTLxs1UfgeIbQtyHv4pD2swQr/TqEmzgn+zLdlD9T2pj9WGLVJb1UPPtL0nj
        e+eqlgFHSbCrWu5IVx3YnoMq32A4ug4xu+n7waRl5OWh3FkdfUT62gtJwOmDoLH4Muy2VwFKeWEBT
        U2gtTNk+oH3Ah+beTBKOB2zXK7o3eQMHcIz0lsZl8Lijtk5qpbztkW6iCmEL/FeVsvvZcs6NSjN0r
        nNZiqPuaxdku9HjZBZB1aLeRYAy1QMhXG3L14vimBnIbMBFlzCTNXP6PLf4lXIanp++/8fmCLVyfS
        QfcFXYkw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lmA3t-000wH0-PJ; Thu, 27 May 2021 07:04:16 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2B9F9300223;
        Thu, 27 May 2021 09:04:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1414E2C6D2B90; Thu, 27 May 2021 09:04:16 +0200 (CEST)
Date:   Thu, 27 May 2021 09:04:16 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Xiongwei Song <sxwjean@me.com>, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiongwei Song <sxwjean@gmail.com>
Subject: Re: [PATCH] docs: lockdep-design: improve readability of the block
 matrix
Message-ID: <YK9EcCOJhknGA6qE@hirez.programming.kicks-ass.net>
References: <1621868745-23311-1-git-send-email-sxwjean@me.com>
 <YK8SRvhp1+iR2y6G@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK8SRvhp1+iR2y6G@boqun-archlinux>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 27, 2021 at 11:30:14AM +0800, Boqun Feng wrote:
> On Mon, May 24, 2021 at 11:05:45PM +0800, Xiongwei Song wrote:
> > From: Xiongwei Song <sxwjean@gmail.com>
> > 
> > The block condition matrix is using 'E' as the writer notation, however,
> > the writer reminder below the matrix is using 'W', to make them consistent
> > and make the matrix more readable, we'd better to use 'W' to represent
> > writer.
> > 
> > Suggested-by: Waiman Long <llong@redhat.com>
> > Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!
