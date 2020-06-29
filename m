Return-Path: <SRS0=3V3V=AK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CF7C433E1
	for <linux-doc@archiver.kernel.org>; Mon, 29 Jun 2020 19:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA8482072D
	for <linux-doc@archiver.kernel.org>; Mon, 29 Jun 2020 19:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9GnTVA7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbgF2THo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730103AbgF2THm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:07:42 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861DFC031C66
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 10:47:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id f6so4295838pjq.5
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XVsa/7jgqD/tCtEhtbq5P7SP0GjekJLQVl/koafNOZw=;
        b=D9GnTVA73GJ4bgKmDXAJab9PiX8TsI0txYixua7NV7rIPGUdAKmunxsnZC1OVhpwlX
         HzlzFtt+ZRmuPAjocI/Qo1OO33EyKKKA4RULPNh59glsc4j/l4ZrFkLTLG7+CxX9QHTX
         uQ749vuWWC+WbfATzjfrG1bb546BmgLIn3nYo/ex9OBbNzl5MJGT2CmD7CxGAlnMgyVd
         zjRJThGeijBfVyHYtXXptLsWunsRhtBCVmyNUt4PK1j/FMwihAVIKjPlBwKBKiu3k3tt
         YSnPis85muWHXYU1rvVYigFYJarMyXld1J+TqWRDzRu7pIkfMNF/hGBNLhG25HwnNVHY
         uYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XVsa/7jgqD/tCtEhtbq5P7SP0GjekJLQVl/koafNOZw=;
        b=olbqU0SlUzJUE8Gwo3Swb2LfNMwGg2U8i0kxH/uzXdZhcvtJhBh6k0rOTDE3ki5hfZ
         0gwW9cqF1AE6vrjmhDQeKTX7WeTPRTt1L26unUqCVjYFkvQcneoHh5sQK7XQC8kMub0q
         Fs+snDFRcNk8ZPG14fXsd34WUVssNVyxSxOz76tBA8emJQT0XE73WZaLrWXhU33OI8+N
         d4wtGrYmhSBa8XiniBDFbpgTxl/EtuMv7NL0ZLWshARFm+8eB3t94zlzrlaBmv8SS1Fg
         /qsCJ33O2NDdN2tm0jcyP2e63txqPVYv+rWreaY1jQchW1PtFE2AIZQ81bagIdSjlM/R
         +BZw==
X-Gm-Message-State: AOAM530OiZN4/wJykPCvODfxm5ICeoXOLEhtdY7mbClJ2DMHgXo1Jtqw
        ztvDTBr7DhOI2YS8kIAVMSdYPw==
X-Google-Smtp-Source: ABdhPJyYyhPHA3IrT2UbgCAhV0JzBoclpoISPsvyegTI3pLSc4N5Ot7mP8nK3t8GfGAEALvfEBwZ+Q==
X-Received: by 2002:a17:90a:ea18:: with SMTP id w24mr17579805pjy.42.1593452878964;
        Mon, 29 Jun 2020 10:47:58 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id h17sm299503pfo.168.2020.06.29.10.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:47:58 -0700 (PDT)
Date:   Mon, 29 Jun 2020 11:47:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, suzuki.poulose@arm.com, corbet@lwn.net
Subject: Re: [PATCH v5 4/5] coresight: sysfs: Allow select default sink on
 source enable.
Message-ID: <20200629174756.GA3724199@xps15>
References: <20200616164006.15309-1-mike.leach@linaro.org>
 <20200616164006.15309-5-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616164006.15309-5-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

I have applied patches 1 to 3 of this set.  Please see below for comments on
this patch.

On Tue, Jun 16, 2020 at 05:40:05PM +0100, Mike Leach wrote:
> When enabling a trace source using sysfs, allow the CoreSight system to
> auto-select a default sink if none has been enabled by the user.
> 
> Uses the sink select algorithm that uses the default select priorities
> set when sinks are registered with the system. At present this will
> prefer ETR over ETB / ETF.
> 
> Adds a new attribute 'last_sink' to source CoreSight devices. This is set
> when a source is enabled using sysfs, to the sink that the device will
> trace into. This applies for both user enabled and default enabled sinks.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight.c | 39 +++++++++++++++++++++++--
>  include/linux/coresight.h               |  3 ++
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
> index e9c90f2de34a..db39e0b56994 100644
> --- a/drivers/hwtracing/coresight/coresight.c
> +++ b/drivers/hwtracing/coresight/coresight.c
> @@ -934,6 +934,16 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
>  	}
>  }
>  
> +static void coresight_set_last_sink_name(struct coresight_device *source,
> +					 struct coresight_device *sink)
> +{
> +	/* remove current value and set new one if *sink not NULL */
> +	kfree(source->last_sink);
> +	source->last_sink = NULL;
> +	if (sink)
> +		source->last_sink = kstrdup(dev_name(&sink->dev), GFP_KERNEL);
> +}
> +
>  /** coresight_validate_source - make sure a source has the right credentials
>   *  @csdev:	the device structure for a source.
>   *  @function:	the function this was called from.
> @@ -994,8 +1004,15 @@ int coresight_enable(struct coresight_device *csdev)
>  	 */
>  	sink = coresight_get_enabled_sink(false);
>  	if (!sink) {
> -		ret = -EINVAL;
> -		goto out;
> +		/* look for a default sink if nothing enabled */
> +		sink = coresight_find_default_sink(csdev);
> +		if (!sink) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		/* mark the default as enabled */
> +		sink->activated = true;
> +		dev_info(&sink->dev, "Enabled default sink.");

I'm very ambivalent about extending the automatic sink selection to the sysfs
interface, mainly because of the new sysfs entry it requires.  I find it
clunky that users don't have to specify the sink to use but have to explicitly
disable it after the trace session.  We could automatically disable the sink
after a trace session but that would break with the current sysfs heuristic
where sinks have to be explicitly enabled and disabled.

Thanks,
Mathieu 

>  	}
>  
>  	path = coresight_build_path(csdev, sink);
> @@ -1033,6 +1050,9 @@ int coresight_enable(struct coresight_device *csdev)
>  		break;
>  	}
>  
> +	/* record name of sink used for this session */
> +	coresight_set_last_sink_name(csdev, sink);
> +
>  out:
>  	mutex_unlock(&coresight_mutex);
>  	return ret;
> @@ -1145,6 +1165,19 @@ static ssize_t enable_source_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(enable_source);
>  
> +static ssize_t last_sink_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct coresight_device *csdev = to_coresight_device(dev);
> +	ssize_t size = 0;
> +
> +	if (csdev->last_sink)
> +		size = scnprintf(buf, PAGE_SIZE, "%s\n", csdev->last_sink);
> +	return size;
> +}
> +static DEVICE_ATTR_RO(last_sink);
> +
> +
>  static struct attribute *coresight_sink_attrs[] = {
>  	&dev_attr_enable_sink.attr,
>  	NULL,
> @@ -1153,6 +1186,7 @@ ATTRIBUTE_GROUPS(coresight_sink);
>  
>  static struct attribute *coresight_source_attrs[] = {
>  	&dev_attr_enable_source.attr,
> +	&dev_attr_last_sink.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_source);
> @@ -1524,6 +1558,7 @@ void coresight_unregister(struct coresight_device *csdev)
>  	/* Remove references of that device in the topology */
>  	coresight_remove_conns(csdev);
>  	coresight_clear_default_sink(csdev);
> +	coresight_set_last_sink_name(csdev, NULL);
>  	coresight_release_platform_data(csdev, csdev->pdata);
>  	device_unregister(&csdev->dev);
>  }
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 58fffdecdbfd..fc320dd2cedc 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -184,6 +184,8 @@ struct coresight_sysfs_link {
>   *		from source to that sink.
>   * @ea:		Device attribute for sink representation under PMU directory.
>   * @def_sink:	cached reference to default sink found for this device.
> + * @last_sink:	Name of last sink used for this source to trace into. Set when
> + *		enabling a source using sysfs - only set on a source device.
>   * @ect_dev:	Associated cross trigger device. Not part of the trace data
>   *		path or connections.
>   * @nr_links:   number of sysfs links created to other components from this
> @@ -203,6 +205,7 @@ struct coresight_device {
>  	bool activated;	/* true only if a sink is part of a path */
>  	struct dev_ext_attribute *ea;
>  	struct coresight_device *def_sink;
> +	const char *last_sink;
>  	/* cross trigger handling */
>  	struct coresight_device *ect_dev;
>  	/* sysfs links between components */
> -- 
> 2.17.1
> 
