Return-Path: <SRS0=+qdo=6T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CC8C47247
	for <linux-doc@archiver.kernel.org>; Tue,  5 May 2020 22:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3896620721
	for <linux-doc@archiver.kernel.org>; Tue,  5 May 2020 22:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vxdx7wlj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbgEEWP0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 May 2020 18:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgEEWPY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 18:15:24 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A783C061A0F
        for <linux-doc@vger.kernel.org>; Tue,  5 May 2020 15:15:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f7so1606814pfa.9
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2020 15:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WLWOsjOGJm6CWI5BnvgjlmmbJOBBrRgGgKS+2MfQM9U=;
        b=Vxdx7wljo2iZmV2a9JAM7LwXbjka8TA+rAvlvo/SqoizmrdaVRELMhuRnmaMP6Ijbf
         9HMPJyt1a1fGNolV2ClKHMXrJIPfRxjyykDd+k1enL7NbAe0JWXRk84m9F/l30U3vJLd
         nVWfEmSKlkdHIDIgNqOUKUx/qZhSEKD2scRNY3j9KeX3WQHNTlaDwNHdu5GqVBeYmVTl
         QO69ZpPgXs+ky9xzqO6kg/+oAAnIW13NOOGFTu3Olv1Tc6uvf/q0fq7JnpDTrtIAS/FN
         ULwTApsgzBvdYGYsspx9Kgrcs1QoD/Ltu50Hcozu0p7b/GKTga304FcLA+CU1GprjzCh
         0hRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WLWOsjOGJm6CWI5BnvgjlmmbJOBBrRgGgKS+2MfQM9U=;
        b=Urs0tK5Elps68s981GdyjA3XE8RnEEUj80O2OLsMke+QHrkRLGMwUkUIkn9NfxE4+G
         3x+DPqL2i9z4bga0gJgrbnz8i9IeIo3yfYd66rDWtmwkqXb2Eb2jW9RbdOoZjHQbV9CP
         Qwx+W1R6UXDT+SUNwB8U8p9NR39dxbLdTcVd0ceGjciGD/pVIDQPxvuQas2xdLpsEb/T
         nUWdyxv+8jqwz6KsnxhVvRtY/tZod4/txEY1aHNOdFA5plS3iSAnHodZZcxxCc8/Ycta
         hoQoj3QeAKAMYjA6utvOdlEQy5btD6uRREh6jUaU+jmfneKAegGrk5GDYzbFkymspuXB
         dLNg==
X-Gm-Message-State: AGi0PubAKD+7pQ4Jt1Yc9VTDkR3egy3XDfmMUJ66v+vKz1RaqU+jMWdr
        x+kiGZN+z/kI9cSWy45v7T1OSw==
X-Google-Smtp-Source: APiQypIkpgDKKbaVknUHuqijb1yDmklD4TRDh4hYEyL/2sFNqw/Z+p8e9Zuk8McZf8OUNCu1IbAFKg==
X-Received: by 2002:a62:9211:: with SMTP id o17mr5184245pfd.234.1588716923511;
        Tue, 05 May 2020 15:15:23 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y25sm106878pgc.63.2020.05.05.15.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 15:15:22 -0700 (PDT)
Date:   Tue, 5 May 2020 15:16:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/14] remoteproc: Make core operations optional
Message-ID: <20200505221608.GA2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-2-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> When synchronizing with a remote processor, it is entirely possible that
> the remoteproc core is not the life cycle manager.  In such a case core
> operations don't exist and should not be called.
> 

Why would the core call these functions if it knows the remote is in a
state where it doesn't need these?

Regards,
Bjorn

> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index b389dc79da81..59fc871743c7 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -67,7 +67,7 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->ops->sanity_check)
> +	if (rproc->ops && rproc->ops->sanity_check)
>  		return rproc->ops->sanity_check(rproc, fw);
>  
>  	return 0;
> @@ -76,7 +76,7 @@ int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  static inline
>  u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->ops->get_boot_addr)
> +	if (rproc->ops && rproc->ops->get_boot_addr)
>  		return rproc->ops->get_boot_addr(rproc, fw);
>  
>  	return 0;
> @@ -85,7 +85,7 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  static inline
>  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->ops->load)
> +	if (rproc->ops && rproc->ops->load)
>  		return rproc->ops->load(rproc, fw);
>  
>  	return -EINVAL;
> @@ -93,7 +93,7 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>  
>  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->ops->parse_fw)
> +	if (rproc->ops && rproc->ops->parse_fw)
>  		return rproc->ops->parse_fw(rproc, fw);
>  
>  	return 0;
> @@ -103,7 +103,7 @@ static inline
>  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
>  		     int avail)
>  {
> -	if (rproc->ops->handle_rsc)
> +	if (rproc->ops && rproc->ops->handle_rsc)
>  		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
>  					      avail);
>  
> @@ -114,7 +114,7 @@ static inline
>  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
>  						   const struct firmware *fw)
>  {
> -	if (rproc->ops->find_loaded_rsc_table)
> +	if (rproc->ops && rproc->ops->find_loaded_rsc_table)
>  		return rproc->ops->find_loaded_rsc_table(rproc, fw);
>  
>  	return NULL;
> -- 
> 2.20.1
> 
