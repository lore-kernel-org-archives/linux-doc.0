Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F2B47D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Oct 2018 06:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbeJSOY1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 10:24:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39880 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbeJSOY1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Oct 2018 10:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=55GbKBienQs3IWf9ZfUN4//t9Ah8U+JhLNP0YgUJgSM=; b=axYAqlijr583mmycXhoDmIzsf
        AM7cA1rmNcF94IdbRumWYtephQ+i+4YCjlHQN8srY1zGZpcNO6kjAiaxczRzzOV2VR/x7nEkuaopX
        rbPJRUOpMi1kJSf29MUcckVclnW6zv3Ya+6hocFSK/1mU/Sx0l2T/c6J8pwhbT+9JWQgmrCTgCPiS
        GDpGJxL5NHhzGFOg3G2Y4Tz4JIA5X/1Uoxtt+H4EMmOiAw80leWXWf3ghCGa/LnAWhwQS4KI9smqU
        MqpqSSFk9Z2N4yomFaSfdTXZvsucD0q5QkhoJeAfVaRNCWCZa7pfzK4L+z1m4GzsjFZXjIXc1KA+1
        7h3nkudhg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gDO8Q-0003dG-0S; Fri, 19 Oct 2018 06:19:46 +0000
Date:   Thu, 18 Oct 2018 23:19:45 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Vitaly Chikunov <vt@altlinux.org>
Cc:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Jonathan Corbet <corbet@lwn.net>, Shaohua Li <shli@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-raid@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm: add secdel target
Message-ID: <20181019061945.GA7403@infradead.org>
References: <20181014112439.8119-1-vt@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181014112439.8119-1-vt@altlinux.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just as a note:  the name is a complete misowner, a couple overwrite
are not in any way secure deletion.  So naming it this way and exposing
this as erase is a problem that is going to get back to bite us.

If you really want this anyway at least give it a different way, and
do a one-time warning when th first erase comes in that it is not in
any meaninful way secure.
