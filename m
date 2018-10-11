Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 062687D088
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 15:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbeJKW4y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 18:56:54 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57334 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbeJKW4y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 18:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5OFE+kDLgDKIUChQrgPy1tx5qymEnOAsRqZxp9OwaAc=; b=E3Q0y58/L17elJg0BlZfmF4SL
        LxqbgfZ4ktMFja1Z6YOg7Rj1kUuBvcs2Q2jp2OS+T1wSP8W04Y9ZEoEpwRuvRSKoau3xm8pMTaY+6
        lIFkjNu0ALGJ/HDTIuFcwQg98UwBu5XcJcjA0RXvDpuD1vtx6F36MX77VQG7GVehDuz0lj8D3Z7Lq
        DYWAKX2M+i3E51uOAcW76INBt4nLFjCQkLZhiAQujpaSHXyKziQHS/4pV8g/N1VxWQN01fCxn1env
        +KW2sA/BjTEK9SMr2Xi2x1hPMOdETa391DuVasGcYWY+HRQyVCUBbPOA+hSXu5XON+XDvSfBbXDnu
        0IpCU0JyQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gActi-0001dv-Ks; Thu, 11 Oct 2018 15:29:10 +0000
Date:   Thu, 11 Oct 2018 08:29:10 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     John Garry <john.garry@huawei.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com
Subject: Re: [PATCH] docs/completion.txt: Fix a couple of punctuation nits
Message-ID: <20181011152910.GA8191@bombadil.infradead.org>
References: <1539183392-239389-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539183392-239389-1-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 10, 2018 at 10:56:32PM +0800, John Garry wrote:
> This patch fixes a couple of punctuation nits which can make the document
> more correct and readable.
> 
> Also missing "()" are added to some function references for consistency.

While there's nothing wrong here, any chance you want to try converting
it to .rst and adding it to the overall index?  It looks a lot like
rst already.
