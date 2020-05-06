Return-Path: <SRS0=EZYx=6U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E12C47247
	for <linux-doc@archiver.kernel.org>; Wed,  6 May 2020 01:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2101520721
	for <linux-doc@archiver.kernel.org>; Wed,  6 May 2020 01:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEeDB7Zt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgEFB1H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 May 2020 21:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729621AbgEFB1E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 21:27:04 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F46C061A10
        for <linux-doc@vger.kernel.org>; Tue,  5 May 2020 18:27:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t7so2475plr.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2020 18:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xPLZJsayQjCGQwY1s3pIHaRye61Spu3GPa2g53Bgbks=;
        b=fEeDB7ZtkjwraZ9jqNqbxrp7Cectj/LniyG/WVDfQNq5mosFEZjdmr1kmgJXXf7gS7
         YrOsB8SvewJ12YN9j8EeYsTeXkf2jy0QY3xtTWr8zhWljmjTm5WPRdeMuVgMp75XZimU
         7ziiQemGDg6TRHGHElVK9iHo8KxOxqUfkxAY1BUfFaRAYUzySKqtlhu8Xl/7PBBLSdMy
         ZVO9y7q/g7hz/bEA1epVZ4L/vpmlB4LkfhTqm1WuhY11A0UQTl6+Nv7WJ7PdROMka9KA
         fNsryR1MYk5rtPLfoFUFzXBHAhmO5RlCCYU/lBWfxTP80j6Ul/WIQys3RFyl/zydXvaQ
         pS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xPLZJsayQjCGQwY1s3pIHaRye61Spu3GPa2g53Bgbks=;
        b=MeqdiTrb2n7zUmO3/nw+wklBFmcwWtY5Jd517OErbhAT1sFB/4WQok6LCnZ2GRy/Bm
         2JIvHxwgl3X5zrBn/Vjqi0Mqoep6lDCap1sPKveTtOZ0mZP8eYeVJpz2Greh3e8Dsxrn
         LTasFovV/DkZxLzoSQ1CQoXLWfFHtDr/hlbCZeZ47CRCWcH0zZfe5VwjYzv17rKUgB1h
         p2K73oQBojv9QXt88IY/J4f0P1nmTFOztuFEz6jZv3XW/2t8Cu2g8FpYOAcNXkulgWtL
         3i5fZVVBmpshgTG+ChnA0CKOCHSHGB0LqViCoFoLCHPb6/8yqr2eGwI5ypCML1ZzinZ3
         t99g==
X-Gm-Message-State: AGi0Pub484JfdhQzWEQ6Cmnv97rD5liIGAkQbXQHd6oXUpeJQ0G1Y+Q1
        hCwHp/NT3SSUyZWx5EDmv/RS2w==
X-Google-Smtp-Source: APiQypKMMlkzNjpv5d0j02REz81TfCnytVATHuXPJbjlnGrYHmHErVvmMGUWN25gsFd796v7EFTpgQ==
X-Received: by 2002:a17:90a:df88:: with SMTP id p8mr6494662pjv.119.1588728423310;
        Tue, 05 May 2020 18:27:03 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y2sm106442pfq.16.2020.05.05.18.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 18:27:02 -0700 (PDT)
Date:   Tue, 5 May 2020 18:27:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/14] remoteproc: Deal with synchronisation when
 changing FW image
Message-ID: <20200506012748.GH2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-12-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-12-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> This patch prevents the firmware image from being displayed or changed
> when the remoteproc core is synchronising with a remote processor. This
> is needed since there is no guarantee about the nature of the firmware
> image that is loaded by the external entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b73295..cdd322a6ecfa 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -13,9 +13,20 @@
>  static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
>  			  char *buf)
>  {
> +	ssize_t ret;
>  	struct rproc *rproc = to_rproc(dev);
>  
> -	return sprintf(buf, "%s\n", rproc->firmware);
> +	/*
> +	 * In most instances there is no guarantee about the firmware
> +	 * that was loaded by the external entity.  As such simply don't
> +	 * print anything.

Not only "in most instances", we have no idea what firmware is running,
so this can be shortened.

However, this does implicate that on_init = true, after_crash = false,
this will read blank, but a future rproc_report_crash() will indeed load
and boot rproc->firmware.

> +	 */
> +	if (rproc_needs_syncing(rproc))
> +		ret = sprintf(buf, "\n");
> +	else
> +		ret = sprintf(buf, "%s\n", rproc->firmware);
> +
> +	return ret;
>  }
>  
>  /* Change firmware name via sysfs */
> @@ -39,6 +50,17 @@ static ssize_t firmware_store(struct device *dev,
>  		goto out;
>  	}
>  
> +	/*
> +	 * There is no point in trying to change the firmware if loading the
> +	 * image of the remote processor is done by another entity.
> +	 */
> +	if (rproc_needs_syncing(rproc)) {
> +		dev_err(dev,
> +			"can't change firmware while synchronising with MCU\n");

The conditional checks for a future event, but the error message
indicates an ongoing event. How about "can't change firmware on remote
controlled remote processor"? "externally controlled"?

Regards,
Bjorn

> +		err = -EBUSY;
> +		goto out;
> +	}
> +
>  	len = strcspn(buf, "\n");
>  	if (!len) {
>  		dev_err(dev, "can't provide a NULL firmware\n");
> -- 
> 2.20.1
> 
