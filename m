Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67F847D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 13:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfBGN7Z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 08:59:25 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:35460 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726782AbfBGN7Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 08:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KfOi/3HsyLzqIol1uZmCQYVoaXQHN96q0jr/Un9J1Do=; b=coJNBdBW4GVnyZVB01z4yc5JkX
        5ZZQqkS4CSyy+E2hfGAXpD/jDMgILfFlw9Ti3JU8qlFw4kqO6y1GT3ktAzYalLvb4fPC77YQRWCkg
        ldPBuGcOMknoX/q39YP8AMaOZlRVV6GexPNaKlAhtowCE/owi4doAUErYIjNgtd4hTBGdHSFvReHL
        ESUl2HVy1nMzfmg10ADxUiohOtetLXMDL0kE92fAnNGMC/LdZUpYiLz8qLZ+aGMMnqAYo5cpPQVBO
        NhKsHthDHJASjl7Rn0OWUpIlDp+DTd42zjTIVv4uRlzBc/7BgRDQ21bUCtljitmOJStVVfD7J+/tt
        CmInRItQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1grkD6-0005Gu-D7; Thu, 07 Feb 2019 13:59:24 +0000
Date:   Thu, 7 Feb 2019 05:59:24 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Joe Perches <joe@perches.com>
Cc:     linux-doc@vger.kernel.org
Subject: Return: vs Returns:
Message-ID: <20190207135924.GV21860@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


This seems to be an extremely common mistake to make (indeed, almost
3000 occurrences of 'Returns:' vs 5300 occurrences of 'Return:').  Could
we have a checkpatch warning for it?

----- Forwarded message from Matthew Wilcox <willy@infradead.org> -----

On Wed, Jan 16, 2019 at 04:59:27PM +0000, Christophe Leroy wrote:
>  v3: Moved 'Returns:" comment after description.
>      Explained in the commit log why the function is defined static inline
> 
>  v2: Added "Returns:" comment and removed probe_user_address()

The correct spelling is 'Return:', not 'Returns:':

Return values
~~~~~~~~~~~~

The return value, if any, should be described in a dedicated section
named ``Return``.

----- End forwarded message -----
