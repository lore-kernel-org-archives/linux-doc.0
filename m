Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691A5C7EE2E
	for <linux-doc@archiver.kernel.org>; Sat, 10 Jun 2023 07:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjFJHtj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFJHti (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Jun 2023 03:49:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415943A8C;
        Sat, 10 Jun 2023 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UmRbWljufOPyIQiIA7CHB8iopRQHod9Lz261qd58zvs=; b=nEy8SFw08DDvJdj0bE8owjCgYJ
        MxplFsLBDrXPMjndU9aVtWXYozgH686nLhrIwfzoPEdmK3bZZcdbaZZywwF0Le//wtRCM+oL4rZjd
        xAXCGmj7bTdJOTw185oeGzARHKM/OsYXo7DgGaS0V+UKYBBfR2oiMcnwNooQm2kB5W3XzmT00TqDd
        nP0ts9vHWoRIVfAIxOYT5y5E7ctDiFERDzIAlQK0RyublDP6Rj37SfvqnsSilB/KqlE+gpg5yHjEs
        kKgxOEsmznIm+llwr1JrwtPJFEpmNk5ZhqAYwYd6PZVMqt5L3PbHPGRTOZu2cc3e2NpqWG9KZ416Z
        Qftgjt7Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q7tLS-00FUgv-1F;
        Sat, 10 Jun 2023 07:49:10 +0000
Date:   Sat, 10 Jun 2023 00:49:10 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Demi Marie Obenour <demi@invisiblethingslab.com>
Cc:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe Perches <joe@perches.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] Rip out simple_strtoll()
Message-ID: <ZIQq9m7+YSLBIKzP@infradead.org>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610025759.1813-1-demi@invisiblethingslab.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I'd maybe say remove instead of "rip out", but otherwise this looks
good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

