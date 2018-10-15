Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF7957D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 20:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbeJPE1K (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Oct 2018 00:27:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56340 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbeJPE1K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Oct 2018 00:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5HeInDh30uqjoihQCLxLtY6AsyfWXChewjHsPT3H4LI=; b=Nls/5cgE2IvWwmb+6vSApmildP
        gBXrSv5ZolGYEvU187oTXAaA6/i47ijPv9sXC5KsWD2yOp5uVzYEKj87Tlay7YEr9JNTu6V7YMwi5
        B+apk9qH5VtLm+AAHgrJ75QcPvYjzTKwnAf9qSTKAVoKf/54MnFZFMoGtJ9Pzp+4wxAGxuQ7L5VaG
        MP9iNc7zZxiV7DcuRtEp9ONwdcR+sH8XPJVPbb6+WSYIZscUItFpPRLlMYlSammVkkIPWYAiLyJbZ
        KCzu+A9YCebnPsVZJWb90V74Xl8GS5NLCoJ2lGKrgUf21MfgVe3y9OwERebQpJKcAPjbyCzR2r4pn
        WMuVZ3wg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gC9ez-0003rm-IE; Mon, 15 Oct 2018 20:40:17 +0000
Date:   Mon, 15 Oct 2018 13:40:17 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] IDA/IDR fixes for 4.19
Message-ID: <20181015204017.GA10953@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Greg,

I have two tiny fixes, one for the IDA test-suite and one for the IDR
documentation license.

The following changes since commit f0a7d1883d9f78ae7bf15fc258bf9a2b20f35b76:

  afs: Fix clearance of reply (2018-10-15 15:31:47 +0200)

are available in the Git repository at:

  git://git.infradead.org/users/willy/linux-dax.git ida-fixes-4.19-rc8

for you to fetch changes up to a309d5db58793d4d91f5a346e3fa58aa6bf60b12:

  idr: Change documentation license (2018-10-15 16:31:29 -0400)

----------------------------------------------------------------
Matthew Wilcox (2):
      test_ida: Fix lockdep warning
      idr: Change documentation license

 Documentation/core-api/idr.rst | 2 +-
 lib/test_ida.c                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)


