Return-Path: <SRS0=xqSd=4C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90061C35242
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 22:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5784D20848
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 22:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u90Wxsf5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgBNW6n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Feb 2020 17:58:43 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:33039 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbgBNW6n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Feb 2020 17:58:43 -0500
Received: by mail-yb1-f196.google.com with SMTP id b6so5606805ybr.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2020 14:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OfncaOBUirWGLh9Iq7kwxxSsByucOt2Wppw4ynvXDuo=;
        b=u90Wxsf5Ig6CIpSBubkniP8EqwOm+uA3CGPM2VlU1xJwm/CNWNMzqWgIgc4zTvEKnZ
         pXIiA2MJtIB5CaDlq0rjvS5gBY7vXxXr1nTjo5Ber3QKd8vkG51mHN2D3JbfQLrFsQDA
         1Dbm6iHADDO1Q6eUbS+x/kWC0EkLDSzWXa9LJHgp139x0L6qTtm8MVNkfj92bSkWE4O3
         Z1jWuFWLfGlcFh+dD/4KvBYKz9ssSO9bEo7/MpSw93nIxa1FFVBq5MLgwCeZhPo0KOwk
         gQXux8ij+iBCPMTfbs+DsjU9Hchfr4oxd9RgjsohIAaTo2JcuonM/kV1CFl0WIwtqSjO
         e0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OfncaOBUirWGLh9Iq7kwxxSsByucOt2Wppw4ynvXDuo=;
        b=umTsOHV8v1OXX5709ZbL2XS6YqMMowolBrgdgc+EJn4fgY8t1SOtXvrdIiN72GyXw6
         BnHvlNzEqhcTYzGBYgE8Gm/2gEpmU9SxdrPCj8skp674UFjwFiESZmvXtyRLPndZvH4k
         vKGgfEZkYsNlPkJLzDY2k20bnCLXidnyjHj88rZMXa1pVeaOqC14IiTf8/KF9vTb9X2s
         IDRcM1PDNRKfPAjit+uAIWmXA/ZPdkseGGXRWDONtUlx0p2JWGn7GVJob8JM++0dTJLx
         HICm8/5QsRqNmhrQ+0AOEmEcczwqfhrc5CnTy7HuhoVw47Z1qyZvu7RHXOxYbEffgK7b
         Op7Q==
X-Gm-Message-State: APjAAAUkX1Viu5FY/gHHIpjFuHIZpT+0M9Stsf+Gr2EkWZcpmmZgl9cw
        HjlPjdg1Kvv1ZSf59l7c+hgRzA==
X-Google-Smtp-Source: APXvYqzE3ne/xD31Jgns9lDh+Obe40lIZIm7x1bBVViPpTWpRAdA9aqaJHaVEF5ciDTUGB5ipW67/w==
X-Received: by 2002:a25:6d88:: with SMTP id i130mr5279654ybc.402.1581721122491;
        Fri, 14 Feb 2020 14:58:42 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c84sm3331908ywa.1.2020.02.14.14.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 14:58:42 -0800 (PST)
Date:   Fri, 14 Feb 2020 15:58:39 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 5/6] coresight: cti: Add in sysfs links to other
 coresight devices.
Message-ID: <20200214225839.GB20024@xps15>
References: <20200211105808.27884-1-mike.leach@linaro.org>
 <20200211105808.27884-6-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211105808.27884-6-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 11, 2020 at 10:58:07AM +0000, Mike Leach wrote:
> Adds in sysfs links for connections where the connected device is another
> coresight device. This allows examination of the coresight topology.
> 
> Non-coresight connections remain just as a reference name.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-cti.c | 41 ++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> index 9e18e176831c..f620e9460e7d 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.c
> +++ b/drivers/hwtracing/coresight/coresight-cti.c
> @@ -441,6 +441,37 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
>  	return err;
>  }
>  
> +static void cti_add_sysfs_link(struct cti_drvdata *drvdata,
> +			       struct cti_trig_con *tc)
> +{
> +	struct coresight_sysfs_link link_info;
> +
> +	link_info.orig = drvdata->csdev;
> +	link_info.orig_name = tc->con_dev_name;
> +	link_info.target = tc->con_dev;
> +	link_info.target_name = dev_name(&drvdata->csdev->dev);
> +	coresight_add_sysfs_link(&link_info);

I understand there isn't much to do if a problem occurs so just catch the error
and add a comment to assert you're doing this on purpose.

> +}
> +
> +static void cti_remove_all_sysfs_links(struct cti_drvdata *drvdata)
> +{
> +	struct cti_trig_con *tc;
> +	struct cti_device *ctidev = &drvdata->ctidev;
> +	struct coresight_sysfs_link link_info;
> +
> +	/* origin device and target link name constant for this cti */
> +	link_info.orig = drvdata->csdev;
> +	link_info.target_name = dev_name(&drvdata->csdev->dev);
> +
> +	list_for_each_entry(tc, &ctidev->trig_cons, node) {
> +		if (tc->con_dev) {
> +			link_info.target = tc->con_dev;
> +			link_info.orig_name = tc->con_dev_name;
> +			coresight_remove_sysfs_link(&link_info);
> +		}
> +	}
> +}
> +
>  /*
>   * Look for a matching connection device name in the list of connections.
>   * If found then swap in the csdev name, set trig con association pointer
> @@ -452,6 +483,8 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
>  {
>  	struct cti_trig_con *tc;
>  	const char *csdev_name;
> +	struct cti_drvdata *drvdata = container_of(ctidev, struct cti_drvdata,
> +						   ctidev);
>  
>  	list_for_each_entry(tc, &ctidev->trig_cons, node) {
>  		if (tc->con_dev_name) {
> @@ -462,6 +495,7 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
>  					devm_kstrdup(&csdev->dev, csdev_name,
>  						     GFP_KERNEL);
>  				tc->con_dev = csdev;
> +				cti_add_sysfs_link(drvdata, tc);
>  				return true;
>  			}
>  		}
> @@ -546,10 +580,12 @@ static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
>  	struct cti_device *ctidev = &drvdata->ctidev;
>  
>  	list_for_each_entry(tc, &ctidev->trig_cons, node) {
> -		if (tc->con_dev)
> +		if (tc->con_dev) {
>  			/* set tc->con_dev->ect_dev */
>  			coresight_set_assoc_ectdev_mutex(tc->con_dev,
>  							 drvdata->csdev);
> +			cti_add_sysfs_link(drvdata, tc);
> +		}
>  	}
>  }
>  
> @@ -602,6 +638,9 @@ static void cti_device_release(struct device *dev)
>  	mutex_lock(&ect_mutex);
>  	cti_remove_conn_xrefs(drvdata);
>  
> +	/* clear the dynamic sysfs associate with connections */

s/associate/associated

> +	cti_remove_all_sysfs_links(drvdata);
> +
>  	/* remove from the list */
>  	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
>  		if (ect_item == drvdata) {

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> -- 
> 2.17.1
> 
