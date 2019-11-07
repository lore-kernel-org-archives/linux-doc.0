Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E3097D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Nov 2019 19:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfKGTjT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Nov 2019 14:39:19 -0500
Received: from ms.lwn.net ([45.79.88.28]:39240 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbfKGTjT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Nov 2019 14:39:19 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 974426EC;
        Thu,  7 Nov 2019 19:39:18 +0000 (UTC)
Date:   Thu, 7 Nov 2019 12:39:17 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Louis Taylor <louis@kragniz.eu>
Cc:     mchehab@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/sphinx-pre-install: fix Arch latexmk dependency
Message-ID: <20191107123917.28b1c18e@lwn.net>
In-Reply-To: <20191102184511.82011-1-louis@kragniz.eu>
References: <20191102184511.82011-1-louis@kragniz.eu>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat,  2 Nov 2019 18:45:11 +0000
Louis Taylor <louis@kragniz.eu> wrote:

> On Arch Linux, latexmk is installed in the texlive-core package.
> 
> Signed-off-by: Louis Taylor <louis@kragniz.eu>
> ---
>  scripts/sphinx-pre-install | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index 68385fa62ff4..470ccfe678aa 100755
> --- a/scripts/sphinx-pre-install
> +++ b/scripts/sphinx-pre-install
> @@ -520,6 +520,7 @@ sub give_arch_linux_hints()
>  		"dot"			=> "graphviz",
>  		"convert"		=> "imagemagick",
>  		"xelatex"		=> "texlive-bin",
> +		"latexmk"		=> "texlive-core",
>  		"rsvg-convert"		=> "extra/librsvg",
>  	);

Applied, thanks.

jon
