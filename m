Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D24BC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0559260FEB
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbhCaUY2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 16:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbhCaUYT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 16:24:19 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D60C061574;
        Wed, 31 Mar 2021 13:24:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A81FF867;
        Wed, 31 Mar 2021 20:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A81FF867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617222258; bh=V69OvbPP4NOdAIt0hpaxumI8PQ/bvcYp0rVSuSOspz0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qndR9uk9iHQlt4ULDyGVHLbKrxpIuqPacZyF11P/wtVbXiu/l6euEHfwMcgURxULQ
         Kt737M9aauHClqbkb0sRv0KaMXIIITE3Su/VwnYXDbNnpo3xpIwsppxlzZQAJrHfip
         XrHXlquCz/CDpwuZsDBzm090DIyiV/5mLNZIN22g0mUDLDcxg092Fu68aYuYhRhkZW
         FkgO3QRuCdTJOqcTVfPGAbSGwrzer9XTOo9+20f/BrRT9N3mo14dO2udUSvbs5iuvY
         lUvrRBG0cnYYVDn1wkb4zYXHMvgC48ziIOI+7Dozf+AssEorYwmDQH8D6EIDl3Tg75
         FPCzkkkzoM55w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] fs/namespace: corrent/improve kernel-doc notation
In-Reply-To: <20210318025227.4162-1-rdunlap@infradead.org>
References: <20210318025227.4162-1-rdunlap@infradead.org>
Date:   Wed, 31 Mar 2021 14:24:18 -0600
Message-ID: <87r1jvjclp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix kernel-doc warnings in fs/namespace.c:
>
> ./fs/namespace.c:1379: warning: Function parameter or member 'm' not described in 'may_umount_tree'
> ./fs/namespace.c:1379: warning: Excess function parameter 'mnt' description in 'may_umount_tree'
> ./fs/namespace.c:1950: warning: Function parameter or member 'path' not described in 'clone_private_mount'
>
> Also convert path_is_mountpoint() comments to kernel-doc.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
> Jon, Al has OK-ed you to merge this patch (and the next one, please).
>
>  fs/namespace.c |   14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

An actual acked-by would have been nice, oh well.  Meanwhile, I've
applied them with fixes to the typos in both changelogs :)

Thanks,

jon
