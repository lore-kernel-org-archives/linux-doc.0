Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA15E7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 Aug 2018 20:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbeHTXjz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 Aug 2018 19:39:55 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54182 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbeHTXjz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Aug 2018 19:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=luA3eh/Wn1FdXN2Ggn6dipTSqvzRSfuzCDJmiKnZ5Js=; b=cNsp0GSh2wotkT+L8l5PqNUDS
        5Sud9QT0XztWxNgbmKWijM9gcHjYLlewub2gld8QG7h621KXhlP15YhKrqpvkxhuGXVsiMUbfxJlc
        Go0YS7Opou5I4fBZKAeMslNNikrgKilm9XIHkr2BU19BCGEUZedSgZLc0iEeFM6aR1q+CQrcWdtBq
        KVu0IA6G/umfJ1Ld/MimWv0z5j4kVAfpLj8ipF6HUduLFM1/UbfNtdswhXcW/n9b9EbZEgYlXfXsX
        DZRdozoFerVxIzSwmIM+XryGj965L9ME9sMom8zF8ExabdZWzL1ymtH6VYmjOBsHTLrjN9R418y3U
        kirA1kJTg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1frqhO-0006Pl-Ko; Mon, 20 Aug 2018 20:22:50 +0000
Date:   Mon, 20 Aug 2018 13:22:50 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        netdev <netdev@vger.kernel.org>,
        Linux Docs <linux-doc@vger.kernel.org>
Subject: Re: Checkpatch False positive
Message-ID: <20180820202250.GA6345@bombadil.infradead.org>
References: <8cf91e5fb848eecd98a2f9493387906b3a5f1506.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cf91e5fb848eecd98a2f9493387906b3a5f1506.camel@intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 20, 2018 at 01:21:30PM -0700, Jeff Kirsher wrote:
> Checkpatch.pl should probably exclude *.rst files from the SPDX License
> Identifier check, since they are documentational files, like *.txt. 

They're still copyrighted work, so they should still have SPDX tags
to identify their license.

checkpatch has:

                                } elsif ($realfile =~ /\.rst$/) {
                                        $comment = '..';

so we're explicitly including rst files in the checking for now.

