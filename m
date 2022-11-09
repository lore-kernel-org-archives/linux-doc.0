Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3DCC4332F
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 20:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiKIUaR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 15:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiKIUaR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 15:30:17 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D27FD14;
        Wed,  9 Nov 2022 12:30:16 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 54F3C735;
        Wed,  9 Nov 2022 20:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 54F3C735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668025816; bh=wGLPC3XtH96GwGtDKrwRTD/1iXa52FW0QweS8oRlDpY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qPK2EAw6dWlpkSpiMikN2mqv/flF0gdhmOo0I65UF07hUN/3fkNicOnZJ3Di6YgZT
         H++xz1PzHGmtMKxr3vwiRd3nz3pTeomlvgBuBREU5Kfbf/wXANOPlGfhjFlmE6Hj4R
         IKxeiTvR5mPaD9Zs0GRX1jxy2G0hdpZTSdh7GamVLhcbcX/yskb5cGK7p8dI0kWMCy
         VYaIB0xFaUJ/VjnD9HFW+w/kY2Zewc/+YkHov5Ns1R3CELH3LBAVvPW8XEaG4oOBzK
         C/7Zn1ezGaCPMLD6iD9NDcOQ5CkxJSiXVNL5nRplKy3hpGj+NAF7H8y+NzA6FrU9Rl
         +XFb5MAAR9xCw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
In-Reply-To: <20221108115707.1232621-1-daniel.vetter@ffwll.ch>
References: <20221108115707.1232621-1-daniel.vetter@ffwll.ch>
Date:   Wed, 09 Nov 2022 13:30:15 -0700
Message-ID: <875yfnlvl4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> We love to nest our documenation for good structure, but that means
> the table of contents needs to keep up or you can't navigate them.
>
> Realized this trying to find the drm property documentation, which
> with some shuffling around disappeared. Why I didn't realize we can do
> this earlier, no idea.
>
> Since the relevant parts of the toc are only loaded if you're in the
> right .html file there's no harm in going all the way to unlimited.
>
> Note that this has no impact on the alabaster theme (which has a much
> simpler sidebar toc which doesn't show the entire hierarchy, only
> what's in the local rendered file) nor on the various :toctree:
> rendered inline in the output.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
> v2: Rebase onto linux-next, reword commit message to take into account
> that alabaster is the default now.
> ---
>  Documentation/conf.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index c715610d6297..a5c45df0bd83 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -296,6 +296,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
>                  # Add color-specific RTD normal mode
>                  html_css_files.append('theme_rtd_colors.css')
>  
> +        html_theme_options = {
> +            'navigation_depth': -1,
> +        }
> +
>      except ImportError:
>          html_theme = 'alabaster'

Applied, thanks.

jon
