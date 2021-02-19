Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673D5C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 18:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C1C964E4B
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 18:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhBSSn6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 13:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhBSSn5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Feb 2021 13:43:57 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE2FC061574
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 10:43:17 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id a4so5282975pgc.11
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 10:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+RaWaFyQSNsA+BxQXW757bzb1+DDQjnWqIXCvU1FnZg=;
        b=IB29ZKHRAnXgcgKwwmK3w5ghZp9HfMsnWzT6RFS62Y6zWIwZ7CCJoSrSE7Lg9NrBWc
         w3M5BI+zftcVbIRviRSOQBzakRnjADebkJudOi7J3tUkw1XQX3LOPRrE+ySS2IkAoqAl
         LUXX/GGA03GCbGSfve4PsfyrSVEQIP9s5eo7qx+yK893mNAI4xECCPr+aKwY06NXsvws
         mNnSAM7s9OHQ39a9jjq5hjMhTp5AuXx4HVRwmHUNnFYhFuiNdD03FkH+f3h5YjY9k+mJ
         6kzbUdNXnlDEVviIN6uWtNGf4MQjaStZ6k4IhvGguZypfVl+wHWN9z4ndGnhdjCEIbZv
         NaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+RaWaFyQSNsA+BxQXW757bzb1+DDQjnWqIXCvU1FnZg=;
        b=DHNoXo8hWUdNIrfFHW/6I9qfa+C9XmTZ0VrCeNL/bQCjhPfe8Vi9kaRDTbt1Z9MSaf
         dWKoItjtGKgdf32KquVCHNa2fvA4CvfR2dnmoP/M6rAT6UdUU0TzZRj/xHZXYS2tuwB4
         cwWTl1fGjIKDijnFp4AJR5XLEauI6KZCwGg2seioRaWBkShKK9hxMFy5KVaeYY+dOh05
         QhHsaKzmggiTYb+kjmJ5VsGWZhmWxGm1PgKNOUoo3qFqBHhA36JVQOuwo0R9XJ5O5ljg
         u+cswuX7vmorA/m4h/9WN+LdIH0YtfuCvtraYeUA9u9WkjXvPlIwwGMCJccpROoq6O66
         1VxA==
X-Gm-Message-State: AOAM530ydh5I2Jbn6G54Rf/0tI7ACU+jgVsZXGEjsS4mF+mjjvJHtvrq
        4XmmX4Iab99Zgox/3xuoNELbqQ==
X-Google-Smtp-Source: ABdhPJzN3Ygk8eCkB5+wa7JUByPcyaxHt1dR5NpZBx7GgeX6f5K0ZJD27MStvkvvMK9kb4CZFXlcxA==
X-Received: by 2002:a63:545f:: with SMTP id e31mr9763184pgm.212.1613760196381;
        Fri, 19 Feb 2021 10:43:16 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w128sm3601162pfw.86.2021.02.19.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 10:43:15 -0800 (PST)
Date:   Fri, 19 Feb 2021 11:43:13 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] coresight: syscfg: Add registration and feature
 loading for cs devices
Message-ID: <20210219184313.GA3065106@xps15>
References: <20210128170936.9222-1-mike.leach@linaro.org>
 <20210128170936.9222-3-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128170936.9222-3-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[...]

> +/**
> + * List entry for Coresight devices that are registered as supporting complex
> + * config operations.
> + *
> + * @csdev:	The registered device.
> + * @match_info: The matching type information.
> + * @ops:	Operations supported by the registered device.
> + * @item:	list entry.
> + */
> +struct cscfg_csdev_register {
> +	struct coresight_device *csdev;
> +	struct cscfg_match_desc match_info;
> +	struct cscfg_csdev_feat_ops ops;
> +	struct list_head item;
> +};

I would call this structure cscfg_registered_csdev and move it to
coresight-config.h.  That way it is consistent with cscfg_config_csdev and
cscfg_feature_csdev and located all in the same file.

I may have to come back to this patch but for now it holds together.

More comments to come on Monday.

Thanks,
Mathieu

> +
>  /* internal core operations for cscfg */
>  int __init cscfg_init(void);
>  void __exit cscfg_exit(void);
> @@ -33,6 +49,10 @@ void __exit cscfg_exit(void);
>  /* syscfg manager external API */
>  int cscfg_load_config_sets(struct cscfg_config_desc **cfg_descs,
>  			   struct cscfg_feature_desc **feat_descs);
> +int cscfg_register_csdev(struct coresight_device *csdev,
> +			 struct cscfg_match_desc *info,
> +			 struct cscfg_csdev_feat_ops *ops);
> +void cscfg_unregister_csdev(struct coresight_device *csdev);
>  
>  /**
>   * System configuration manager device.
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 976ec2697610..d0126ed326a6 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -219,6 +219,8 @@ struct coresight_sysfs_link {
>   * @nr_links:   number of sysfs links created to other components from this
>   *		device. These will appear in the "connections" group.
>   * @has_conns_grp: Have added a "connections" group for sysfs links.
> + * @feature_csdev_list: List of complex feature programming added to the device.
> + * @config_csdev_list:  List of system configurations added to the device.
>   */
>  struct coresight_device {
>  	struct coresight_platform_data *pdata;
> @@ -240,6 +242,9 @@ struct coresight_device {
>  	int nr_links;
>  	bool has_conns_grp;
>  	bool ect_enabled; /* true only if associated ect device is enabled */
> +	/* system configuration and feature lists */
> +	struct list_head feature_csdev_list;
> +	struct list_head config_csdev_list;
>  };
>  
>  /*
> -- 
> 2.17.1
> 
