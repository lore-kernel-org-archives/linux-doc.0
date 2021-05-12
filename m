Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F5DC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 06:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC1D961933
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 06:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhELGXu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 02:23:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229776AbhELGXu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 02:23:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0047061928;
        Wed, 12 May 2021 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620800562;
        bh=+GtcoEGn48W18sQPB5jjhcR6X0ZWVJ8sGeKiDqqJNmc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nY7YNKDrhy/9g9UPpZtkdUi3OlfrL8uhBXwFA+KqNU9fnXJHMm54u33BsBqjoHhQm
         CdpuVThMbGgV4D4jonEXdeen9FYnAjBFt0gGHtGTqVEVmg4ar1sf+2aLBCPlZ4jkq3
         kTgpfHTdFdUmLoaUtDItYwBVhQ7PxRKb5Eo8BT5zeGbg8iYGponXyJxSfqW3RgQImF
         Y19ZERQHfWutKt0jH6Zq8bWMvUcZqhEIJNil0jjKG+1u6y9Jr5HkyJzjow8QcoXxJF
         vN6lS3H2UxcEO79s13l+jLIV6VaP459oKExbfTub8I6QwyznE643JSSDcYV8aJMVgK
         z7FTjS9KNIUlg==
Date:   Wed, 12 May 2021 08:22:38 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210512082238.682f6aea@coco.lan>
In-Reply-To: <20210506174849.GH6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506174849.GH6564@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Michal,

Em Thu, 6 May 2021 19:48:49 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> [  127s] + :
> [  127s] + locale
> [  128s] LANG=3Den_US
> [  128s] LC_CTYPE=3D"en_US"
> [  128s] LC_NUMERIC=3D"en_US"
> [  128s] LC_TIME=3D"en_US"
> [  128s] LC_COLLATE=3D"en_US"
> [  128s] LC_MONETARY=3D"en_US"
> [  128s] LC_MESSAGES=3D"en_US"
> [  128s] LC_PAPER=3D"en_US"
> [  128s] LC_NAME=3D"en_US"
> [  128s] LC_ADDRESS=3D"en_US"
> [  128s] LC_TELEPHONE=3D"en_US"
> [  128s] LC_MEASUREMENT=3D"en_US"
> [  128s] LC_IDENTIFICATION=3D"en_US"
> [  128s] LC_ALL=3D
> [  128s] + echo LC_ALL=3D
> [  128s] LC_ALL=3D
> [  128s] + echo LANG=3Den_US
> [  128s] LANG=3Den_US

Where those the locale settings that you used when the build
failed?

I tried to reproduce the bug here with, disabling the parallel run (as
it masks the real error) with both:

	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONE=
TARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=3Den_US; =
done
	$ make cleandocs && make SPHINXOPTS=3D-j1 htmldocs

(this one caused lots of warnings on Debian, due to the
 settings at /etc/locale.gen)

and:

	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONE=
TARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=3Den_US.I=
SO-8859-1; done
	$ make cleandocs && make SPHINXOPTS=3D-j1 htmldocs

Without any success.

Could you please provide more details about the build VM and the git=20
changeset that caused the issue?

Thanks,
Mauro
