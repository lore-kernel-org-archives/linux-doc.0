Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D700C64EC7
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 19:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjB1TOp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 14:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjB1TOp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 14:14:45 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8149A30B35
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 11:14:43 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2F1B249B;
        Tue, 28 Feb 2023 19:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2F1B249B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1677611682; bh=4rusV75kVasHUd8RbND76R6FYe7b4yAmv0qA7thUq7E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JwoXQO8iS95OiZjTk7+is3ycBnvdlPNL8zrwUOf9ULSgZLjo+tlVrFe7a0TdP1y5n
         cQQmjgme5MIlJru2/8wx194DGB3HoLvdFC0Wd4WCyzD1TCkP5yx0vdeGeJ2fn/sNm6
         ptQlEUfcvard/HuK+/5jfuhaESCCQ5ds1jQyemPvOOevPSrcmMKgNc8h3/Ol0LtYIf
         vcHFIf6gRcjugYQABiH3RxXujFSCl32nsk5XNmiBmG4pv60DjIwPL3MftTCqUXOGjQ
         Pndhchmfhi/CX2lA5MaC3QZfJtgXhtitjC+4H1CPqNjvaNrulW8qar1JUgMntZsk3X
         iOhxZLH6CZJ4g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     David Rientjes <rientjes@google.com>, linux-doc@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH] docs: rebasing-and-merging: Drop wrong statement about git
In-Reply-To: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
References: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Feb 2023 12:14:41 -0700
Message-ID: <875yblzjoe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>
> The "^0" doesn't have the described effect to only do fast-forward merges.
> For example
>
> 	git checkout 055efab3120b
> 	git merge v5.2-rc1^0
>
> creates a normal merge commit. In fact "v5.2-rc1^0" only refers to the
> commit the tag v5.2-rc1 points to.

So that pattern came straight from Linus, and it still works fine for me
- just tried it and got the expected fast-forward.  Maybe you have
something in your git configuration that makes things behave
differently?

That said...

> Fixes: d95ea1a4e1fb ("docs: Add a document on repository management")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> ---
>  Documentation/maintainer/rebasing-and-merging.rst | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Documentation/maintainer/rebasing-and-merging.rst b/Document=
ation/maintainer/rebasing-and-merging.rst
> index 09f988e7fa71..85800ce95ae5 100644
> --- a/Documentation/maintainer/rebasing-and-merging.rst
> +++ b/Documentation/maintainer/rebasing-and-merging.rst
> @@ -213,11 +213,7 @@ point rather than some random spot.  If your upstrea=
m-bound branch has
>  emptied entirely into the mainline during the merge window, you can pull=
 it
>  forward with a command like::
>=20=20
> -  git merge v5.2-rc1^0
> -
> -The "^0" will cause Git to do a fast-forward merge (which should be
> -possible in this situation), thus avoiding the addition of a spurious me=
rge
> -commit.
> +  git merge --ff-only v5.2-rc1
>=20=20

Git was fixed a couple of years or so ago to do the fast-forward by
default when it can, so the original advice in this file is unnecessary
- as is --ff-only (most of the time).  So the patch is worth applying,
but I may tweak the changelog some.

Thanks,

jon
