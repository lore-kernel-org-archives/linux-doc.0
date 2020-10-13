Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCF5C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 19:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F2220E65
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 19:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJGIgGIm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgJMTYi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 15:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28197 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727499AbgJMTYg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 15:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602617074;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mROpDD81dZMvuz/AL/wFzK+yDGJlDRaA6Hxnsxnh1II=;
        b=fJGIgGImDKJG6inpkPBLj3f0sFKRc6Fbae44Ks7bW670b9NWWicfZ7+n6+IhBC7JilVw2L
        Ih2Vvgagw+A8fL0JJHmU7dP1d5jaB6/CNcQoPPGzqFH1VfXTD0n1jFgUQvkwABhE4/kFq6
        OEk8JaRsjSPICMepMGMqhs1xKF71Klk=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-XIFXohwUPD-BULtzI6pOVQ-1; Tue, 13 Oct 2020 15:24:31 -0400
X-MC-Unique: XIFXohwUPD-BULtzI6pOVQ-1
Received: by mail-il1-f199.google.com with SMTP id h16so651715ilq.17
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 12:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=mROpDD81dZMvuz/AL/wFzK+yDGJlDRaA6Hxnsxnh1II=;
        b=oIox6H1ab+y7xs82OmEEc0aCamWx114zPx37VLLN9jvM+SUlllQ5fMGKu+v18MKAqr
         HEl80rWaiKd1lCYa3VYSueRJCEdC8wqVN3NgakMkGGTpKhDIGC63Jz+dx+eGBWyUPNyT
         fyCR3N2IkKFfcVexV7twaJC8tJfuHP1JVlJhTFH+9PdjnIndXewSmj4Zr/5l6T5Uv2Za
         E9e91KD3SRUO9U1WD+S5DA0GUnfsRLwa76zVkotrQ9rI6q3qRz7/vmaPaURVKDdeoj+V
         hoDgrZ4IBLRzF7gTBPzlLdmd7Xu+pSP5BLJDRvtdOeYNzNxvFxb6RN75lKTeNl9Ut87I
         5KsQ==
X-Gm-Message-State: AOAM532QJWuVvpZWnA4mJ3+DOBRCDyXZrTNzIKzh+KXlifEGAtWfmeJg
        i1RQXEc/LkZDQxCe3Zp8JN7y7NH8E6kv5fopan10noqkrWKd/Qrz86D32qIzKE0Kn1EORZYeIOh
        BloF5UNnw+RjF1Qz5eVhF
X-Received: by 2002:a5d:9693:: with SMTP id m19mr278057ion.161.1602617070905;
        Tue, 13 Oct 2020 12:24:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxexpvv1trKHY3fOYkDVpjsNWt+h1IcDl+tBkAzFj7h6q2G5dun5m8lXLcBt9JKl3VfJCYqTA==
X-Received: by 2002:a5d:9693:: with SMTP id m19mr278043ion.161.1602617070662;
        Tue, 13 Oct 2020 12:24:30 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id h14sm651139ilc.38.2020.10.13.12.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 12:24:30 -0700 (PDT)
Message-ID: <195e21dc50fbcccf4f7a17d089d5dbdc6603d645.camel@redhat.com>
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
Date:   Tue, 13 Oct 2020 15:24:28 -0400
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for the fixes! I will go ahead and push 11 and 12 to drm-misc-next.

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

