Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55C3B7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Nov 2018 09:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387676AbeKOTTW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Nov 2018 14:19:22 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54436 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbeKOTTV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Nov 2018 14:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0TNaX70GioYtvTQDqyv/QpWDX7/5UE5L7j1Mc0R2P60=; b=ASURhQvBmA8mzpNoKYuGXh44J
        WDDVgXJPF0P3xh+/0NB4we9wPiJSTZmOdCsjYCUv74/OChY6K3UUrAjmnI2VyfiFa9rF8S+iQRf0+
        CToW5f/gmBAsRNk8FDt5gk8eK5oQyJjBQZ4WD1i6BdD31mfvwnzte5NaTHKCkT9fd7/g3yRGvZjJd
        /OfiFSQnZ37SmT57oeKUoe+87auELsrnsQBz54zE/Et1UrZnJuF5mqmS905e4uBtgtELcGYbolc3B
        QTQ1zVQuHzZK+vn5ZwpKOxH6vG59286SNnKFmI5UVhMCxps88M0wFgF6GHOVmUDuRhSjW76a8Fmx0
        CzK9+1vIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gNDhG-0006l3-8c; Thu, 15 Nov 2018 09:12:22 +0000
Date:   Thu, 15 Nov 2018 01:12:22 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Palmer Dabbelt <palmer@sifive.com>
Cc:     linux-kernel@vger.kernel.org, andrea.parri@amarulasolutions.com,
        aou@eecs.berkeley.edu, keescook@chromium.org,
        Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
        yamada.masahiro@socionext.com, jhogan@kernel.org,
        Will Deacon <will.deacon@arm.com>, jglisse@redhat.com,
        linux-doc@vger.kernel.org, dhowells@redhat.com, jcmvbkbc@gmail.com,
        rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com,
        ren_guo@c-sky.com, david.abdurachmanov@gmail.com,
        linux-riscv@lists.infradead.org, mingo@kernel.org
Subject: Re: Re-run features-refresh.sh
Message-ID: <20181115091222.GA25926@infradead.org>
References: <20181113020113.29640-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

FYI, we really should kill ARCH_SG_CHAIN in its current form.

See my series here, which could use a review or two:

https://lkml.org/lkml/2018/11/9/958
