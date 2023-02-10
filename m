Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BF6C05027
	for <linux-doc@archiver.kernel.org>; Fri, 10 Feb 2023 11:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjBJL4T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Feb 2023 06:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjBJL4S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Feb 2023 06:56:18 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE6F3AB9
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 03:56:16 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id gr7so15199381ejb.5
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 03:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsoJhV93aSxUg6rF5+WxZGTHjWYEV4hUOoTihOuUqNQ=;
        b=KTyGgz38lHLU3X2JA2ey7jIKYG6q8mgrT9LhnhuTPhbvsd2zn/jS76Z/4xrqi6tCQg
         i7Q8sZRtPGg29/LrEqVjZHxaw5uuV5rvOv/gcPLlE5QYxa8E+Z1UKzUjMLl0JJr8Mait
         vYQpY+rmNfO5Ej2Fl9ZO74NDLrEaAevkboNw6mwcn3JSa2Z2/iG0+QLi4Q4I41XQ1YBi
         qW/z0HuGHxpQOm4MkEXlnas07iMfVbO/RCqCdABMqRLwlQfLROGBEkpVZU4oEhmJ45IZ
         Oj45BD+j9TebshjUntF2niXvkOC2hFTNyzF14w7U+ftM2VPoPhwyHYnyoqP1qY3+xPZ3
         +TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsoJhV93aSxUg6rF5+WxZGTHjWYEV4hUOoTihOuUqNQ=;
        b=tx4NL6JPrsICOR7+tX6OIJBi6N1lad4f4NmbSOdukyLt9vUSaXKQrStFoVtbHTy6ot
         iUHn0x4JOnSmza0dELl1FP+5iZPd2WVtSeBG/tAQXwfzTqmO9k0JiSYPjn6GGA/khNAy
         V+rATIIlUZlmWthGKVwArfD3rb/xYXQl/en+OPZE3FZFYVYyXnBDybb0pQV58ed50E9E
         oJU04Yq5ZT3/T052F3tL90wgb5lN57MegejQJ+VhU/r2atEKFBPshMqa8LqZfO8O20Am
         DBY93+dv5IOK8UAom/nsqQcbo2jioMQAE2Ym/PHZWCLbXOaeVaU0opaGEcFVNZGPsUZ/
         9rLQ==
X-Gm-Message-State: AO0yUKWpt9f2gtpsONaqZriGpvKD9kzfR1UphM3ULDGzr1Yt8vhAfTUf
        u5Uq9V7dBhwW+Vq1JnVMcR5VIQ==
X-Google-Smtp-Source: AK7set+OSl7fgcVCOKCK43T8iMsGLa5gVRS5IbYZKsuZDCKPEtigsIa2AQao5Cw9SR1L2sFyakffEQ==
X-Received: by 2002:a17:906:6b1a:b0:895:58be:954 with SMTP id q26-20020a1709066b1a00b0089558be0954mr14610849ejr.58.1676030174769;
        Fri, 10 Feb 2023 03:56:14 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id w14-20020a170906384e00b008878909859bsm2263694ejc.152.2023.02.10.03.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 03:56:14 -0800 (PST)
Date:   Fri, 10 Feb 2023 12:56:13 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Lucero Palau, Alejandro" <alejandro.lucero-palau@amd.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-net-drivers (AMD-Xilinx)" <linux-net-drivers@amd.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "edumazet@google.com" <edumazet@google.com>,
        "habetsm.xilinx@gmail.com" <habetsm.xilinx@gmail.com>,
        "ecree.xilinx@gmail.com" <ecree.xilinx@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jiri@nvidia.com" <jiri@nvidia.com>
Subject: Re: [PATCH v6 net-next 2/8] sfc: add devlink info support for ef100
Message-ID: <Y+Yw3UHO9ZWzyYZa@nanopsycho>
References: <20230208142519.31192-1-alejandro.lucero-palau@amd.com>
 <20230208142519.31192-3-alejandro.lucero-palau@amd.com>
 <Y+O0A5Bk/zWur76J@nanopsycho>
 <DM6PR12MB4202FE90A833282B28053DF7C1D89@DM6PR12MB4202.namprd12.prod.outlook.com>
 <DM6PR12MB4202A784865D367996F4A3BBC1D99@DM6PR12MB4202.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB4202A784865D367996F4A3BBC1D99@DM6PR12MB4202.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thu, Feb 09, 2023 at 11:46:04AM CET, alejandro.lucero-palau@amd.com wrote:
>
>On 2/8/23 15:24, Lucero Palau, Alejandro wrote:
>> On 2/8/23 14:38, Jiri Pirko wrote:
>>> Wed, Feb 08, 2023 at 03:25:13PM CET, alejandro.lucero-palau@amd.com wrote:
>>>> From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
>>> [..]
>>>
>>>
>>>> +static int efx_devlink_info_get(struct devlink *devlink,
>>>> +				struct devlink_info_req *req,
>>>> +				struct netlink_ext_ack *extack)
>>>> +{
>>>> +	struct efx_devlink *devlink_private = devlink_priv(devlink);
>>>> +	struct efx_nic *efx = devlink_private->efx;
>>>> +	int rc;
>>>> +
>>>> +	/* Several different MCDI commands are used. We report first error
>>>> +	 * through extack along with total number of errors. Specific error
>>>> +	 * information via system messages.
>>> I think you forgot to remove this comment.
>>>
>>> With this nit fixed, free free to add:
>>> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
>>>
>> I'll do.
>>
>> Thanks
>
>Just wondering if this single nit deserves a v7 or better to delay it as 
>another patch.
>
>We got another patchset for ef100 ready to be sent and we would prefer 
>to not delay this one more than needed.

Cleaner would be v7, but I don't mind that much. Let the patchbot to
decide :)
