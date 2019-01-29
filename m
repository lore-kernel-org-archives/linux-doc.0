Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C482F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 16:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfA2Q2X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 11:28:23 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:56243 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfA2Q2X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 11:28:23 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 88C35803A1;
        Tue, 29 Jan 2019 17:28:20 +0100 (CET)
Date:   Tue, 29 Jan 2019 17:28:19 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/TODO: Add vrefresh replacement to the todo
Message-ID: <20190129162819.GA30803@ravnborg.org>
References: <20190129161611.241599-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190129161611.241599-1-sean@poorly.run>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=UpRNyd4B c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=jPffMzPaPsipmjaQQJAA:9 a=yLM0eJMvxk8QBGgi:21 a=rDyO8_-3u5PkMvxz:21
        a=CjuIK1q_8ugA:10 a=Ctdz5JVgVzkA:10 a=xmb-EsYY8bH0VWELuYED:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 29, 2019 at 11:15:51AM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/gpu/todo.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 38360ede12215..7fc30380eaf6c 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -262,6 +262,21 @@ As a reference, take a look at the conversions already completed in drm core.
>  
>  Contact: Sean Paul, respective driver maintainers
>  
> +Convert direct mode.vrefresh accesses to use drm_mode_vrefresh()
> +----------------------------------------------------------------
> +
> +drm_display_mode.vrefresh isn't guaranteed to be populated. As such, using it
> +is risky and has been known to cause div-by-zero bugs. Fortunately, drm core
> +has helper which will use mode.vrefresh if it's !0 and will calculate it from
> +the timings when it's 0.
> +
> +Use simple search/replace, or (more fun) cocci to replace instances of direct
> +vrefresh access with a call to the helper. Check out
> +https://lists.freedesktop.org/archives/dri-devel/2019-January/205186.html for
> +inspiration.
Bonus points for the link!

	Sam
