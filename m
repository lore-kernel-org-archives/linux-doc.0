Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379D6C4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 16:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDD49206DD
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 16:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbgJEQRh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 12:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgJEQRh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 12:17:37 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB9BC0613CE;
        Mon,  5 Oct 2020 09:17:37 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 291832E4;
        Mon,  5 Oct 2020 16:17:37 +0000 (UTC)
Date:   Mon, 5 Oct 2020 10:17:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
Message-ID: <20201005101736.7adf4f46@lwn.net>
In-Reply-To: <ee1f16453ad40eae2603adfde5f6dda3ab1befc7.1601798520.git.mchehab+huawei@kernel.org>
References: <ee1f16453ad40eae2603adfde5f6dda3ab1befc7.1601798520.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun,  4 Oct 2020 10:02:03 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> When kernel-doc is called via kerneldoc.py, there's no need to
> auto-detect the Sphinx version, as the Sphinx module already
> knows it. So, add an optional parameter to allow changing the
> Sphinx dialect.
> 
> As kernel-doc can also be manually called, keep the auto-detection
> logic if the parameter was not specified. On such case, emit
> a warning if sphinx-build can't be found at PATH.
> 
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/kerneldoc.py |  5 ++++
>  scripts/kernel-doc                | 40 ++++++++++++++++++++++++-------
>  2 files changed, 37 insertions(+), 8 deletions(-)

So I'm glad to see this.  Still not fully sold on the autodetection, but if
we don't actually use it, maybe I can live with it :)

One little nit:

> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 233f610539f0..e9857ab904f1 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> +    } elsif ($cmd eq "sphinx-version") {
> +	my $ver_string = shift @ARGV;
> +	if ($ver_string =~ m/^(\d+)\.(\d+)\.(\d+)/) {
> +	    $sphinx_major = $1;
> +	    $sphinx_minor = $2;
> +	    $sphinx_patch = $3;
> +	} else {
> +	    die "Sphinx version should be at major.minor.patch format\n";
> +	}

Can we allow just major.minor, with patch defaulting to zero?  People
passing this by hand may not want to look up their patch version every
time, and I doubt it will ever matter...

Thanks,

jon
