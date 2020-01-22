Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6AFC32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE5182465B
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s7NnNb34"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgAVXxD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:53:03 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51086 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVXxD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 18:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bOW2OvB3Kl9DqND69M1MeTaeyv1a+EqY0OaHjR+igoc=; b=s7NnNb344SGOH7N7J/0gmxX8W
        pS9Muag7/Y5JKreqrdZNdkKjD8UAomFCaBmYY3aeDu9eqAWFSJJk7KuqUi0WQrVq9GvTaae76atlR
        pAuD85sK8TJKxh6ZrTA+R2pp72Du3NAxUCtjcCHPnW+/jDQHZ4j27cwx9puYvOz1+odyFQl8vSv+H
        ag/I+6wssBZX+QntF1Y8c4vtqmeZ6RwD8H61cmybvKjEMjt16qOp93D5j/MvUqE7HClcWhD3QAszV
        i6rWUTD4KstmuLL/we7XiaD5PbPARZmTtAMpamcc7p2NoJZCPmC3pyVNG33v3APd93A7U1YJmwoaB
        CbY1coTaA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuPny-0008Ty-P2; Wed, 22 Jan 2020 23:53:02 +0000
Date:   Wed, 22 Jan 2020 15:53:02 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a document on how to contribute to the documentation
Message-ID: <20200122235302.GD4675@bombadil.infradead.org>
References: <20200122162030.5b789232@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122162030.5b789232@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 22, 2020 at 04:20:30PM -0700, Jonathan Corbet wrote:
> This is mostly a collection of thoughts for how people who want to help out
> can make the docs better.  Hopefully the world will respond with a flurry
> of useful patches.

Thanks for writing this with your characteristic blend of self-deprecating
humour and supportive advice.  One thing which I feel should be mentioned
is the hard work put in by hundreds of kernel maintainers who have
written kernel-doc and nobody has done the trivial work to actually
include those source files in an rst file, so all that documentation
is being ignored.  A great task that's a step up from "fixing typos" is
"find documentation that's not currently in a kernel book and add it".
Even if it's just dumped into a "misc" section, having (eg) kvmalloc()
documentation in a kernel book is a benefit.

> +Please note that some things are *not* typos and should not be "fixed":
> +
> + - Both American and British English spellings are allowed within the
> +   kernel documentation.  There is no need to fix one by replacing it with
> +   the other.
> +
> + - The question of whether a period should be followed by one or two spaces
> +   is not to be debated in the context of kernel documentation.

Do you want to preemptively mention the Oxford comma here?
