Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E2B0C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 18:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfAGSoZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 13:44:25 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:40128 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfAGSoY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 13:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Wgszna9uWHPbkqI/h2aGcpcDixRFivl24rgAs7PzJi4=; b=Uwjv7+4SkdPrFo+o6iMe5GtTc
        s+LiFBbYT2hVJc4y8pStuRNQEklXydCQQozLzQKWLCmYBJ0kmiWyDlwRxdvIb4K3X5CLQReLKZtEj
        sZqmxs9wJXYAyOofl7S0hx4B7viD7vGSkquA5agdduHMnzk6JdmmJXBoG0OjlvnDIk/PQHF1E6abQ
        H6b7r3AksdjnJJnnNjSpVHltR5gjtaUUh3BcYFXhoZ8fcj+qzjlcbE3rKK/RmSbrTzrk2tqmyh6Vy
        HQrJdrMwNSLw5Pv6C8sqDj8oBeMDEW6M7N9Fa5JCwg3H5qrZ3pGZ9d+AiP/GXk+isy24HosuoRkPH
        dyx0IhAwQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ggZst-0005Rc-7n; Mon, 07 Jan 2019 18:44:23 +0000
Date:   Mon, 7 Jan 2019 10:44:23 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: Consistent capitalization of "device tree"?
Message-ID: <20190107184423.GA6310@bombadil.infradead.org>
References: <20190107183711.GA5671@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107183711.GA5671@amd>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 07, 2019 at 07:37:11PM +0100, Pavel Machek wrote:
> Is it "Device Tree" or "device tree"?
>     
>  pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
>  235
>  pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
>  595

You missed ...

$ git grep -r "Device tree" Documentation/ | wc -l
84

although at least some of those are "Capitalise device because it's the
start of a sentence".

