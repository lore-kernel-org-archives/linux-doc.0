Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB56C7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  8 May 2023 16:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbjEHQkF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 May 2023 12:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbjEHQkA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 12:40:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170366EB1;
        Mon,  8 May 2023 09:39:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75E6C6252F;
        Mon,  8 May 2023 16:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABD4C433D2;
        Mon,  8 May 2023 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683563968;
        bh=k6cUHSsgK5Fn8DpZlfU29s/FNuK/SUl4o07CWRZz99s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mC0a7zrM1FiMolYByDwdo1vM7uJNnt5DJS/o1UEFnCWoz2+W/9BeveIDHs3SC0/EY
         EeXO1UF6/8p2MKgZTeFSJW9QsZ+Z3DR7eDXHZiO655BcmmIvskOVZdt0HbqBZpSCKT
         rmAelxzuu2KMxU2GpOuHFmEPFIC4GEkHaio29Pa5e14dPNoKxIsuTYAOn8VZzhp8px
         DtdPydAO+oXNc5FKPT73Aal0VABVde2qdq4a2QOcuTwj6lhBBsS/4X/Bnyc/y68f+B
         1U/Q+/7c/36jDDoWFdWeiJYHwpm8T026WiIfsgUrjPkH/8MTiNfeNK+YoN8o6pKkOY
         4cpeO04DZLjTA==
Date:   Mon, 8 May 2023 18:39:31 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, Rob Landley <rob@landley.net>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Documentation/filesystems: ramfs-rootfs-initramfs: use
 :Author:
Message-ID: <20230508-absehbar-nickel-c94c8e3069e3@brauner>
References: <20230508055928.3548-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230508055928.3548-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 07, 2023 at 10:59:28PM -0700, Randy Dunlap wrote:
> Use the :Author: markup instead of making it a chapter heading.
> This cleans up the table of contents for this file.
> 
> Fixes: 7f46a240b0a1 ("[PATCH] ramfs, rootfs, and initramfs docs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: Rob Landley <rob@landley.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---

Looks good,
Reviewed-by: Christian Brauner <brauner@kernel.org>
