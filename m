Return-Path: <SRS0=NFUt=IG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFEBC433E0
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 08:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF05E650BB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 08:11:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhCHILY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 03:11:24 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:27479 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhCHILK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 03:11:10 -0500
Date:   Mon, 08 Mar 2021 08:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1615191068;
        bh=JgpnMwHv+56Z6pM6R18747j5rGXmQCVa51r6ebshfRk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=sfNjOLTVrPdS3IcCfZiOSwBb+EXq+wran9dJbq2YryRlmjvvpb+UCAj28EFCV/cNI
         pt248GoiPdF+tBNLuykiujJySmaldkm6r6v63ajlOtLXurCWvdxlFVmMeja9aLgit4
         rE4vEmw1T1LiEVFjHewVMskmSH+2CJdHNKB5cPU0T4tq2QNEl9K94p9qka5NifYybL
         IErLQfwMwPWMuM5SQnn8XPwN/T4NkSoJZfT/FQa1H1IJhmOQInbnzrXvK56+DgGZvT
         vdPzrwl3+zwQz3aUwrkhK3fGHGzHUDC6bRgB4q8XgaonL5SR1kdtRR7C+EY3SFsB+U
         rHf0fFMiilqRQ==
To:     Jianhui Zhao <zhaojh329@gmail.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, airlied@linux.ie,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tzimmermann@suse.de
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] docs: gpu: fix typo
Message-ID: <hKfmUsjpKZHUiRQ8FD_ZeOFKn1zaa5b5x2rmlF3iWLw4m3aPtg75LyDiFgkeNR5-DlgOzV0Flw6ARPrqJxFGdnHQbVXVyzEV9sHk1J50qAA=@emersion.fr>
In-Reply-To: <20210308064250.3681707-1-zhaojh329@gmail.com>
References: <20210308064250.3681707-1-zhaojh329@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

R-b me. Pushed, thanks!
