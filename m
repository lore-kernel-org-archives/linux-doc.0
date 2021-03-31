Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48CBC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 919E460FEB
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbhCaUUh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 16:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236380AbhCaUUM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 16:20:12 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A0FC061574
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 13:20:12 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D711C867;
        Wed, 31 Mar 2021 20:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D711C867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617222012; bh=ewunRzsXfGOo/9F8OJKrm7DodBhAjDNJt4cXkZYgzQQ=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=HVUTTWrqapDCJ4yndjbca7rNyRfLOgPsmWLRPDyLKEJK0qoZAk9Oa05caGfApvzOL
         kqwrmjz1UQAERNN6pKjUL9/+l0vpIuFxY5/VTW+irn3kcEmt1Uo9go+DngpxWGoU+2
         J/ldK/6NuJj+I6RZ4HVYhe+iIscmTt/5MixMGkfa4pFkRKKelX6Pp3Hbob3LHLFBQU
         4MgIghC6s6gZyvcXAggmZByTwE4PzuwgMuh5DzgNi1xSS6Ci79kYe8gWkP2Tkr7F/T
         Pr/gM1usA3MwhR9J3A0aNRmyuxchfsyxnDJBMYvkcNVIREs4Dhhul9m1MU7lBvvJ03
         3ZzklCJyWDXKw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Askar Safin <safinaskar@mail.ru>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: documentation/filesystems/path-lookup: replace "These paths"
 with "Usually paths"
In-Reply-To: <1616546322.499771404@f511.i.mail.ru>
References: <1616546322.499771404@f511.i.mail.ru>
Date:   Wed, 31 Mar 2021 14:20:11 -0600
Message-ID: <87v997jcsk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Askar Safin <safinaskar@mail.ru> writes:

> Reader may think "These paths" refer to empty paths, so changing to "Usually paths"
>
> Signed-off-by: Askar Safin <safinaskar@mail.ru>
> ---
> diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
> index c482e1619e77..c68d6f275935 100644
> --- a/Documentation/filesystems/path-lookup.rst
> +++ b/Documentation/filesystems/path-lookup.rst
> @@ -57,7 +57,7 @@ example, if you have an open file descriptor on an executable file you
>  can execute it by calling `execveat() <execveat_>`_ passing
>  the file descriptor, an empty path, and the ``AT_EMPTY_PATH`` flag.
>  
> -These paths can be divided into two sections: the final component and
> +Usually paths can be divided into two sections: the final component and
>  everything else.  The "everything else" is the easy bit.  In all cases
>  it must identify a directory that already exists, otherwise an error
>  such as ``ENOENT`` or ``ENOTDIR`` will be reported.

"Usually" doesn't seem right here - it implies that there are times when
that cannot be done.  A better fix seems like just taking "These" out..?

Thanks,

jon
