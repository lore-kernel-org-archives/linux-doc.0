Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1374C636CC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Feb 2023 14:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbjBGO67 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Feb 2023 09:58:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbjBGO6y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Feb 2023 09:58:54 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C6313534
        for <linux-doc@vger.kernel.org>; Tue,  7 Feb 2023 06:58:42 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qw12so43818898ejc.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Feb 2023 06:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wN/KmcWvC+g0rh8netV1xvNHoPshMB2frZ8aZYdI71A=;
        b=7xx3heBEKb1UFkq+GMecG30p+lzfOg8OPYf8e7eCscqw8EjPCCnOhrWHkajaBYmrAA
         7PXSRBDVm9zXAHAp/d5z4CqftVk7r+tyuUHBdrx5bxd/kA/v6y2Cvmb3SC+97rnhnQAM
         jv/lvkxZrZjqFuEFbznx40GrVG2KqEVtgPSn5aDX9hfOAzGW+3cidYeYzH2kIlQIIj/D
         aalKaNg1wZvrJJFWgW3Xk7zZwQvooTQnDWaMnZzID6dIR9SYE2u57LuTlh10TpHBgskr
         NC1xKMUH5bsnPHJBbvGacpppFE2puOFTP8MerUyPYun/A3XZpzOy8a+ZkXtwbylKTReE
         4V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wN/KmcWvC+g0rh8netV1xvNHoPshMB2frZ8aZYdI71A=;
        b=fVUk0MYvT8drM26UBKFHCifx6eDF/wRaA7fnEzWMA04KhmlxJw9zN+9IP69LxUXDVz
         O3rOJObnrjdEeEzRdAqDDITABurlJgmFXM4VAUQpmyanpPm64e46DAGCQp+oa2emxG1I
         PqW9KLviSC5454yN7muC+kFt6WUPNTA84oLHvE4m+PP+TiijxkMcT9JRdBeF9WnRzaRC
         zV573Q3jI8PRmZ0A6Z0BFjetlM1YSWcQBjzB0ZPxbnqvSyb63ZiGMuGvYH18cDZkFRlY
         MbyAPPN5YJO5OuL2CPNCM4EvWTSicxxTUggimJMReV5zZl0l30RaKRr33VqBrrW3qRXO
         8yZQ==
X-Gm-Message-State: AO0yUKXxIQ7fKIv3t7YofM13xUkFMOZle9POr0rv8VxhQVMfoMfA5z6q
        VCwTNarZozZo4fTn0dyUidEfnw==
X-Google-Smtp-Source: AK7set9lEdbNsyS9O2NKR6o46QFdkJfU81OwA7Wjw+kDzfTIwRj4zIlKFjBxC9km4LslfPt9H1CC4Q==
X-Received: by 2002:a17:906:7251:b0:887:dadb:95d9 with SMTP id n17-20020a170906725100b00887dadb95d9mr3838392ejk.45.1675781921210;
        Tue, 07 Feb 2023 06:58:41 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id p15-20020a05640210cf00b00499e5659988sm6459389edu.68.2023.02.07.06.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 06:58:40 -0800 (PST)
Date:   Tue, 7 Feb 2023 15:58:39 +0100
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
Subject: Re: [PATCH v5 net-next 2/8] sfc: add devlink info support for ef100
Message-ID: <Y+JnH+ecdTGgYqAf@nanopsycho>
References: <20230202111423.56831-1-alejandro.lucero-palau@amd.com>
 <20230202111423.56831-3-alejandro.lucero-palau@amd.com>
 <Y9ulUQyScL3xUDKZ@nanopsycho>
 <DM6PR12MB4202DC0B50437D82E28EAAC2C1DB9@DM6PR12MB4202.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR12MB4202DC0B50437D82E28EAAC2C1DB9@DM6PR12MB4202.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tue, Feb 07, 2023 at 03:42:45PM CET, alejandro.lucero-palau@amd.com wrote:
>
>On 2/2/23 11:58, Jiri Pirko wrote:
>> Thu, Feb 02, 2023 at 12:14:17PM CET, alejandro.lucero-palau@amd.com wrote:
>>> From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
>>>
>>> Support for devlink info command.
>> You are quite brief for couple hundred line patch. Care to shed some
>> more details for the reader? Also, use imperative mood (applies to the
>> rest of the pathes)
>>
>> [...]
>>
>
>OK. I'll be more talkative and imperative here.
>
>>> +static int efx_devlink_info_get(struct devlink *devlink,
>>> +				struct devlink_info_req *req,
>>> +				struct netlink_ext_ack *extack)
>>> +{
>>> +	struct efx_devlink *devlink_private = devlink_priv(devlink);
>>> +	struct efx_nic *efx = devlink_private->efx;
>>> +	char msg[NETLINK_MAX_FMTMSG_LEN];
>>> +	int errors_reported = 0;
>>> +	int rc;
>>> +
>>> +	/* Several different MCDI commands are used. We report first error
>>> +	 * through extack along with total number of errors. Specific error
>>> +	 * information via system messages.
>>> +	 */
>>> +	rc = efx_devlink_info_board_cfg(efx, req);
>>> +	if (rc) {
>>> +		sprintf(msg, "Getting board info failed");
>>> +		errors_reported++;
>>> +	}
>>> +	rc = efx_devlink_info_stored_versions(efx, req);
>>> +	if (rc) {
>>> +		if (!errors_reported)
>>> +			sprintf(msg, "Getting stored versions failed");
>>> +		errors_reported += rc;
>>> +	}
>>> +	rc = efx_devlink_info_running_versions(efx, req);
>>> +	if (rc) {
>>> +		if (!errors_reported)
>>> +			sprintf(msg, "Getting board info failed");
>>> +		errors_reported++;
>>
>> Under which circumstances any of the errors above happen? Is it a common
>> thing? Or is it result of some fatal event?
>
>They are not common at all. If any of those happen, it is a bad sign, 
>and it is more than likely there are more than one because something is 
>not working properly. That is the reason I only report first error found 
>plus the total number of errors detected.
>
>
>>
>> You treat it like it is quite common, which seems very odd to me.
>> If they are rare, just return error right away to the caller.
>
>Well, that is done now. And as I say, I'm not reporting all but just the 
>first one, mainly because the buffer limitation with NETLINK_MAX_FMTMSG_LEN.
>
>If errors trigger, a more complete information will appear in system 
>messages, so that is the reason with:
>
>+               NL_SET_ERR_MSG_FMT(extack,
>+                                  "%s. %d total errors. Check system messages",
>+                                  msg, errors_reported);
>
>I guess you are concerned with the extack report being overwhelmed, but 
>I do not think that is the case.

No, I'm wondering why you just don't put error message into exack and
return -ESOMEERROR right away.

>
>>
>>
>>> +	}
>>> +
>>> +	if (errors_reported)
>>> +		NL_SET_ERR_MSG_FMT(extack,
>>> +				   "%s. %d total errors. Check system messages",
>>> +				   msg, errors_reported);
>>> +	return 0;
>>> +}
>>> +
>>> static const struct devlink_ops sfc_devlink_ops = {
>>> +	.info_get			= efx_devlink_info_get,
>>> };
>> [...]
