Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F6C4363A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3432C2225C
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O9TNwuoj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410300AbgJ0KEJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732066AbgJ0KEJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Oct 2020 06:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603793048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wolut7a1c2zX7C+Xumd0b7oYYiNOd60jt9NVhVqZ7rs=;
        b=O9TNwuoj3kKwQaEpq90+R1PgLIoEMkQQDDDCTNSiGvgM4t9DlDe8NYDdx5O88CxJxwaE7m
        vFwCQ+AeUUTGEoNRt5izGVUk38vGCfZ5wZUOtAX2RHfz6mdidcLFwMn86Vs0luWZxtlu3R
        mMwI2efaYGmtmAdLjqVzJY4AJK6sOz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-V2zOweY_Oku_7mkWHoK9QQ-1; Tue, 27 Oct 2020 06:04:06 -0400
X-MC-Unique: V2zOweY_Oku_7mkWHoK9QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C649564085;
        Tue, 27 Oct 2020 10:04:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com [10.36.114.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D56DD5C1BB;
        Tue, 27 Oct 2020 10:04:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id B769C9D0D; Tue, 27 Oct 2020 11:04:01 +0100 (CET)
Date:   Tue, 27 Oct 2020 11:04:01 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 25/32] drm: kernel-doc: add description for a new
 function parameter
Message-ID: <20201027100401.j5zmjzk7jwwwq5cn@sirius.home.kraxel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
 <9366f48e6e9c3ec2f31a3e68452a2b23a1089fce.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9366f48e6e9c3ec2f31a3e68452a2b23a1089fce.1603791716.git.mchehab+huawei@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 27, 2020 at 10:51:29AM +0100, Mauro Carvalho Chehab wrote:
> As reported by "make htmldocs":
> 
> 	./drivers/gpu/drm/drm_prime.c:808: warning: Function parameter or member 'dev' not described in 'drm_prime_pages_to_sg'
> 
> Add a description for the new parameter.
> 
> Fixes: 707d561f77b5 ("drm: allow limiting the scatter list size.")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> ---
>  drivers/gpu/drm/drm_prime.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d6808f678db5..9f955f2010c2 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -794,6 +794,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>  
>  /**
>   * drm_prime_pages_to_sg - converts a page array into an sg list
> + * @dev: DRM device
>   * @pages: pointer to the array of page pointers to convert
>   * @nr_pages: length of the page vector
>   *
> -- 
> 2.26.2
> 

