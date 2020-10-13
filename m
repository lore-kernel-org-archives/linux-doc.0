Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2875C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 19:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5146920BED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 19:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhWwYGh9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732446AbgJMTU2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 15:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47623 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732410AbgJMTUY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 15:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602616822;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+T19di/I9uzvQiC5jnq09YBsE6/ITwy4uMdjnqLO7DE=;
        b=DhWwYGh9Y880PqQnYfmzaDS/5x6FSmBLRnaYR8rKuYqfHDskJ8CQHhbMSUZYsZBQ2Wvmvu
        iQiE6a6hcP83QRF4O3lK7OWcYQeAiXHOEOe0m7DSqyixGAqq8NgGNAJ0TNFg/BlklIV3z+
        71E2+R3Xa/kSesd5N0/xTm4Suu992Uw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-tshpRVZ0NBS0VJ5_e0Slkg-1; Tue, 13 Oct 2020 15:20:21 -0400
X-MC-Unique: tshpRVZ0NBS0VJ5_e0Slkg-1
Received: by mail-il1-f197.google.com with SMTP id f184so655775ilh.11
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 12:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=+T19di/I9uzvQiC5jnq09YBsE6/ITwy4uMdjnqLO7DE=;
        b=ctef2NMSk9+pDsvK2YA9Z4M/UMpK1HYycGzWumQ5/11XtCDniCgziV9L0r89/8B48j
         P+N3SBTtCP4Jcf/cmC9fO9/cHesihojMHRmtOv5uSsoGb3mggaPP4ZEGwfyxJ9bTuly+
         2NRgDmkmaaX86tQcP5vFGBZUZbtRDYMo0tM5Uya5CQOXy9eosxCmRz0qa+A/OJlum6k9
         GqEy5cXknILYjxNyw/E5YKOchyNuWjxRMQuq7SbQlAORy9iNyQomiV2xVUNxqPQV4iog
         BzHTf4MNiLGZkH/u9DlukI+GmX5jdO/vc5e7dGmPycUjUa2Tkw1kcl3j3wNfMuNH1Bb+
         X7Lg==
X-Gm-Message-State: AOAM532I/8YPavO0OEoB/R5fsGXKDNgqAYXba6igj9VAcItHm0RW2vLZ
        FmXkWf+PM8PtURJ+ZVXfQ6sX2VUWOC6/wZnMarMXnbZ4ViADHv7ax9he3mDtu8+2lhx/rfa6kJr
        qOcIzaPupthcWDq0wC3ye
X-Received: by 2002:a02:7b1d:: with SMTP id q29mr326888jac.118.1602616820090;
        Tue, 13 Oct 2020 12:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDqsRr5yoTlmjvRFYbjz/wMBkjy0QB3gawvWZcFb092FZr6amsv0o0aDw/QxH8erz1TOqYWA==
X-Received: by 2002:a02:7b1d:: with SMTP id q29mr326875jac.118.1602616819867;
        Tue, 13 Oct 2020 12:20:19 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id p65sm764536ill.23.2020.10.13.12.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 12:20:19 -0700 (PDT)
Message-ID: <7ac5989093cc0dfed7429dc99a0983d8a3a25068.camel@redhat.com>
Subject: Re: [PATCH v2 11/24] drm/dp: fix kernel-doc warnings at
 drm_dp_helper.c
From:   Lyude Paul <lyude@redhat.com>
Reply-To: lyude@redhat.com
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date:   Tue, 13 Oct 2020 15:20:17 -0400
In-Reply-To: <c7b13b7f9dae481fe552e3b8382841469bb993f0.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
         <c7b13b7f9dae481fe552e3b8382841469bb993f0.1602590106.git.mchehab+huawei@kernel.org>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> As warned by kernel-doc:
> 
> 	./drivers/gpu/drm/drm_dp_helper.c:385: warning: Function parameter or
> member 'type' not described in 'drm_dp_downstream_is_type'
> 	./drivers/gpu/drm/drm_dp_helper.c:886: warning: Function parameter or
> member 'dev' not described in 'drm_dp_downstream_mode'
> 
> Some function parameters weren't documented.
> 
> Fixes: 38784f6f8805 ("drm/dp: Add helpers to identify downstream facing port
> types")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index b1c71af88579..deeed73f4ed6 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -374,6 +374,10 @@ static bool is_edid_digital_input_dp(const struct edid
> *edid)
>   * drm_dp_downstream_is_type() - is the downstream facing port of certain
> type?
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
> + * @type: port type to be checked. Can be:
> + * 	  %DP_DS_PORT_TYPE_DP, %DP_DS_PORT_TYPE_VGA, %DP_DS_PORT_TYPE_DVI,
> + * 	  %DP_DS_PORT_TYPE_HDMI, %DP_DS_PORT_TYPE_NON_EDID,
> + *	  %DP_DS_PORT_TYPE_DP_DUALMODE or %DP_DS_PORT_TYPE_WIRELESS.
>   *
>   * Caveat: Only works with DPCD 1.1+ port caps.
>   *
> @@ -870,6 +874,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
>  
>  /**
>   * drm_dp_downstream_mode() - return a mode for downstream facing port
> + * @dev: DRM device
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
>   *
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

