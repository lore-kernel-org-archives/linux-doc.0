Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C128C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 19:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44F8E214D8
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 19:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C+9RmjIY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731907AbgJMTtS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 15:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33745 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727803AbgJMTtR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 15:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602618556;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f0ux1xTKPBxfq9RjQgexlsC3i9yhXD4P12rrGU6ncZQ=;
        b=C+9RmjIYXHXqlouXKyhljoxHCMcI/ebP0pB6WBBD1k5AWGp6Zw0Ph/cYB5MPGIHrA+9O1Z
        wNRTCYQ2YOb1pWQNJ/ynrFTLllzO+6Tu3xdCwGr43lPr5n8kI4S2FmJ7YRFmU58ttXhyTb
        hserdyfqjbg7/rk8zUw0+3reJ+tGlkM=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-yo2wRX2ZNuy8pFhFbPCx7A-1; Tue, 13 Oct 2020 15:49:15 -0400
X-MC-Unique: yo2wRX2ZNuy8pFhFbPCx7A-1
Received: by mail-io1-f71.google.com with SMTP id a2so773618iod.13
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 12:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=f0ux1xTKPBxfq9RjQgexlsC3i9yhXD4P12rrGU6ncZQ=;
        b=swu8MRvpe4ZkPf/YuGwCBf/WP5i0E23tCx2TWVJOCz5CIxqHzhrAbcDbbcO5rjFP9Q
         a+nr9lUCY38YOAr8ozED7zZWsTF8TthOWziu8qxRQJVAPS25f7As1hlXFh13m3gh28Uw
         sJKDqS+jg87/0Oj7dIZslpCIHw9Q1KVmGzh0+M0Jc3yTO33poZqJFOUAJtHi5XGRTNyE
         xTLllI1BPoKXY89mJTXaoJOhzwiw2/lBexzbmcHrItZCzxIbbdVO5FDsnAPVw7VvsK9a
         FSt+KnIQe/WTy47M6NrqiH6teWSGW8QN/7SSWPDJpzv6whr1qz9KvkxAKWs01QjBzjnW
         CvIw==
X-Gm-Message-State: AOAM530i4WEWbx0apAsEupVm85k3E/H4Z4tzTZDGuwTVcaAbIB093DH7
        0ss5yBZYNiy4cQxZJjkUH2frI/UKfeJZXWB37muyuBwHTGmJFm9kCMp5UGEEB6p9rnx0Ev1sbPB
        XaNwMzpCcGw6m8oMn9CYq
X-Received: by 2002:a5d:904d:: with SMTP id v13mr367275ioq.116.1602618554061;
        Tue, 13 Oct 2020 12:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDqfEEfyJyMyCoWRznA9va/mq9ExgxhqBZ33Zi9msVGip30Bel4moaxsKIohV04qcw3BC6lA==
X-Received: by 2002:a5d:904d:: with SMTP id v13mr367264ioq.116.1602618553871;
        Tue, 13 Oct 2020 12:49:13 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id p12sm873496ili.14.2020.10.13.12.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 12:49:13 -0700 (PDT)
Message-ID: <b7c9b5ddc2bdd5d1a0bb5a000d88681ad0b6fabe.camel@redhat.com>
Subject: Re: [PATCH v2 12/24] drm/dp: fix a kernel-doc issue at drm_edid.c
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
Date:   Tue, 13 Oct 2020 15:49:11 -0400
In-Reply-To: <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
         <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

wait, I think there's some confusion here. these patches have already been
pushed


On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> The name of the argument is different, causing those warnings:
> 
> 	./drivers/gpu/drm/drm_edid.c:3754: warning: Function parameter or member
> 'video_code' not described in 'drm_display_mode_from_cea_vic'
> 	./drivers/gpu/drm/drm_edid.c:3754: warning: Excess function parameter
> 'vic' description in 'drm_display_mode_from_cea_vic'
> 
> Fixes: 7af655bce275 ("drm/dp: Add drm_dp_downstream_mode()")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a82f37d44258..631125b46e04 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3741,7 +3741,7 @@ drm_add_cmdb_modes(struct drm_connector *connector, u8
> svd)
>  /**
>   * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
>   * @dev: DRM device
> - * @vic: CEA VIC of the mode
> + * @video_code: CEA VIC of the mode
>   *
>   * Creates a new mode matching the specified CEA VIC.
>   *
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

