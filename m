Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F062ECE7A94
	for <linux-doc@archiver.kernel.org>; Mon, 25 Sep 2023 12:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjIYMuR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Sep 2023 08:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjIYMuO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Sep 2023 08:50:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6834B92;
        Mon, 25 Sep 2023 05:50:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23089C433C8;
        Mon, 25 Sep 2023 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695646208;
        bh=r1SYmSUarBUenaxk9oPJzkQomDGhy3tq1zUDGZ5RiQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BrY6AbrY6tHSTn+Ap+2KvYjqSOfa+rVOWJ7hUlM0daPx8AkRSFKScuSuLIDEWCdRJ
         /b4ETXxXoo7H5MazjEVis+niNT24IjaYPFPezHyTSjBf0v2G/DqcUlsvkQ2TR+nhs4
         KxK3RCqLFq2RDxuEYfiPRpONKA/dYs+iKqun6u/zo+kKCHWd+cfkE6whluzvd/aDSx
         ueRsnfwjQJso1WM+wXZfJpIGpjDRIbruBHL1LogXc+Gk47Iys+s9M+kAIQJw8D8VKG
         LcWb/ROdbL5nV30XPoiTT0CiN2sxVWkNSNrP3w2MtkIynE9StT2PLv0GEMW4C91m59
         rFw9TLloQsmSA==
Date:   Mon, 25 Sep 2023 14:50:03 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Glauber Costa <glommer@openvz.org>
Subject: Re: [PATCH] docs: admin-guide: sysctl: fix details of struct
 dentry_stat_t
Message-ID: <20230925-beordern-garant-16db0ea033c5@brauner>
References: <20230923195144.26043-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230923195144.26043-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 23, 2023 at 12:51:44PM -0700, Randy Dunlap wrote:
> Commit c8c0c239d5ab moved struct dentry_stat_t to fs/dcache.c but
> did not update its location in Documentation, so update that now.
> Also change each struct member from int to long as done in
> commit 3942c07ccf98.
> 
> Fixes: c8c0c239d5ab ("fs: move dcache sysctls to its own file")
> Fixes: 3942c07ccf98 ("fs: bump inode and dentry counters to long")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Glauber Costa <glommer@openvz.org>
> ---

Acked-by: Christian Brauner <brauner@kernel.org>
