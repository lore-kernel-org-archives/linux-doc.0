Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC57C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 06:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EB6723A69
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 06:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgLHG3O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 01:29:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:50806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgLHG3O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Dec 2020 01:29:14 -0500
Date:   Tue, 8 Dec 2020 07:28:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607408914;
        bh=vHX+oWerFWW+8Y7c7fGt8dRDu5AGKsXP9I6a+XO4HuA=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=XpbA15vgvUbl8WeeIOzx5kXMIrPwPm+EqLgUnIttxL4JyJ+tk14Q8+Kuzxi3McSap
         fZ3mxIOGyOq+HzdOd2loME0PgypCrrgyuSNWIXDEfF4cTwW5ms5Q/sx0iS8j4bSoKz
         dRCm4No1QACODZ0RjsCEt7zHDRB5LOa4N2tZB8LjsuSqA3sIk8m0A9bRL5b8V4SHrS
         mtj6zegsGufzK0mciA7BPp2BIHUYxuVcla85p0vxhkcWA/zHmSpl990PhjRn3ukC4k
         I6+quOCL0/w/ZotNIC79ccuuPFkAsRg3NS7bKdKcJtjDsHqjoTRSkcFS9ZTunIA1KM
         k9Lfo3FHG7pHQ==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     JaeSang Yoo <js.yoo.5b@gmail.com>
Cc:     corbet@lwn.net, jsyoo5b@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.org, markus.heiser@darmarit.de
Subject: Re: [PATCH] docs: update requirements to install six module
Message-ID: <20201208072828.11084458@coco.lan>
In-Reply-To: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
References: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 8 Dec 2020 10:46:28 +0900
JaeSang Yoo <js.yoo.5b@gmail.com> escreveu:

> On the update of Sphinx version to 2.4.4, the "six" library won't be
> installed automatically. (which is required by kfigure.py)
> 
> Main reason of this issue were occurred by the requirements changed from
> the sphinx library. In Sphinx v1.7.9, six was listed on the
> install_requires, but it has been removed since 2.x
> 
> The kfigure.py uses six library explicitly, adding six to
> requirements.txt seems reasonable
> 
> Signed-off-by: JaeSang Yoo <jsyoo5b@gmail.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  Documentation/sphinx/requirements.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
> index 489f6626de67..5030d346d23b 100644
> --- a/Documentation/sphinx/requirements.txt
> +++ b/Documentation/sphinx/requirements.txt
> @@ -1,3 +1,4 @@
>  docutils
>  Sphinx==2.4.4
>  sphinx_rtd_theme
> +six



Thanks,
Mauro
