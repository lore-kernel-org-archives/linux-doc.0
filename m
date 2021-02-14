Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B676CC433DB
	for <linux-doc@archiver.kernel.org>; Sun, 14 Feb 2021 12:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83B1B64E61
	for <linux-doc@archiver.kernel.org>; Sun, 14 Feb 2021 12:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhBNMPs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 14 Feb 2021 07:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhBNMPr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 14 Feb 2021 07:15:47 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFC8C061574;
        Sun, 14 Feb 2021 04:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=cO4TJQiLzSJvyzQhBBsyceVZexbL8Li+rkU5IQoUjek=; b=quJ48Y+XnK1GYayG0Hgxm3hCkV
        iKMWge/aVkCbxqxWT35slYvdE8xSdW8MMH72RImumL9ouvnVD5ZsvM7upKoRYjcLIbjP0O7oEdMTf
        spLwPXTyqtKgWv48Juzydxkl+rWjnrmVFH3zE5fVnv0cke1PAXZCkqOFyOpi3GnZGiOOpTm+tp44q
        t2FjExjwNt23HOFRs1q/cQFzQZSFuqxYx8QPfleaZdVYuUXI0NjJFiL+SgYp56fjjXmNQFEqu78wO
        4ZxFd+zvwuktqH1NOy3dfDMMYo5gBj7XOzGPNyIsfXc8H2hO9bkHaUVHWjTLYmEO8a0oZJcuKnRfo
        KZHcS01w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lBGIn-00EAjO-GG; Sun, 14 Feb 2021 12:15:01 +0000
Date:   Sun, 14 Feb 2021 12:15:01 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     joe@perches.com, linux-doc@vger.kernel.org,
        lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/3] docs: add documentation for checkpatch
Message-ID: <20210214121501.GC2858050@casper.infradead.org>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210213131513.51386-3-dwaipayanray1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 13, 2021 at 06:45:12PM +0530, Dwaipayan Ray wrote:
> +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style

It's quite amusing that this patch contains lines > 80 columns.

Also patches 2 & 3 can be combined into a single patch.

