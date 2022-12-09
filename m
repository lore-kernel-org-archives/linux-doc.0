Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A204C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiLIHI6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLIHI6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:08:58 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13A2BF5B
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:08:56 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:08:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bbCVZfBnGB6dst25eR4yjQc8BrQvNgm3ROo2L7PFXHU=;
        b=Nq6KsVjbJIPQBguXKh4PYWaTX+0B7UbO+dN/wz28lGQE0lLtbAUZ2asVBTDZ9eshl6Lpjp
        nMk97z8se2a5NjwT6eCkW37lrD5E4nrRzOl+et0+6gzthBZnWvGMQda+gap7yXu3TOX7eO
        ivPM+81iAOI7kA5MpVlQnbg8DMjN7zs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 10/13] docs/zh_CN: Update the translation of usage to
 6.1-rc8
Message-ID: <Y5Le+QB0UVHMFHcb@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <2fc8bf4a43e003e7fc34e14344f77b19d76e9a47.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fc8bf4a43e003e7fc34e14344f77b19d76e9a47.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit 1da89ea0b006 ("Docs/admin-guide/mm/damon/usage:
> document schemes/<s>/tried_regions sysfs directory")
> 
> commit 465d0eb0dc31 ("Docs/admin-guide/mm/damon/usage: fix the
> example code snip")
> commit f1f3afd59d78 ("Docs/admin-guide/mm/damon/usage: note DAMON
> debugfs interface deprecation plan")
> commit 9056a2229495 ("Docs/admin-guide/mm/damon/usage: describe
> the rules of sysfs region directories")
> commit c3774845541e ("Docs/admin-guide/mm/damon/usage: fix wrong
> usage example of init_regions file")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/admin-guide/mm/damon/usage.rst      | 68 ++++++++++++++-----
>  1 file changed, 50 insertions(+), 18 deletions(-)
