Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 990E87D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Jul 2019 20:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfGLUMm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Jul 2019 16:12:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:59938 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727125AbfGLUMm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Jul 2019 16:12:42 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8E9EF382;
        Fri, 12 Jul 2019 20:12:41 +0000 (UTC)
Date:   Fri, 12 Jul 2019 14:12:40 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: conf.py: add CJK package needed by
 translations
Message-ID: <20190712141240.2acc23db@lwn.net>
In-Reply-To: <545902a588b76f18cba035700fc0835067e9a1f8.1562696797.git.mchehab+samsung@kernel.org>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
        <545902a588b76f18cba035700fc0835067e9a1f8.1562696797.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  9 Jul 2019 15:33:23 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> In order to be able to output Asian symbols with XeLaTeX, we
> need the xeCJK package, and a default font for CJK symbols.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/conf.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 191bd380c523..e0e1f087d351 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -277,6 +277,10 @@ latex_elements = {
>          \\setromanfont{DejaVu Serif}
>          \\setmonofont{DejaVu Sans Mono}
>  
> +	% This is needed for translations
> +        \\usepackage{xeCJK}
> +        \\setCJKmainfont{Noto Sans CJK SC}
> +
>       '''
>  }

Should there be a change to sphinx-pre-install as well so we don't send
people down the "which of 5,000 packages do I need now?" rathole?

jon
