Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60A777D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Feb 2019 04:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbfBSERt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Feb 2019 23:17:49 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:40170 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfBSERs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Feb 2019 23:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=J1kuKbtxD6MNyy8D9naKRJnlEZrpwaWn+gsbVLfqxOU=; b=gs2F8T7bBVArkP6bUHZM4zN4v
        f7tlZUtpfbsNVUvFu7oH+l2a2SX/GPtp7oiVhdK9ZnuX50An5iuEFBqr978PI792scRsV2lc6+z7E
        ykyd/XCzr6IaI5jwZW6TDxDYl9E6Q6E+EM13Z/Scmd1hb+eSSBxSZhQZUWgnWzD6qH5xsniUzn6c/
        5OFRn1SjwWCww7ohT51pQBOBUYxQ2H9fS6SA91kFqJ97F6S02pCvm8kH/ueNNoLk5KTNOKrpkrFuv
        iyNMO4g2vAAyjTeIMO/5zccaJiol0XGU7S/AQlK5gTft8vCoqz157RA21Q5RojC3eVEs6PKbDJePy
        FTQhQVm/Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gvwqq-0008DP-5b; Tue, 19 Feb 2019 04:17:48 +0000
Date:   Mon, 18 Feb 2019 20:17:47 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] linux/kernel.h: fix reST markup warning for roundup
Message-ID: <20190219041747.GY12668@bombadil.infradead.org>
References: <e79e49d4-4a7d-48c6-afdf-0f958f423f62@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e79e49d4-4a7d-48c6-afdf-0f958f423f62@infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 18, 2019 at 04:34:26PM -0800, Randy Dunlap wrote:
> - * The `const' here prevents gcc-3.3 from calling __divdi3
> + * The ``const`` here prevents gcc-3.3 from calling __divdi3

Probably time to remove this hack ...

willy@bobo:~/kernel/idrext$ grep gcc Documentation/Changes 
GNU C                  4.6              gcc --version

