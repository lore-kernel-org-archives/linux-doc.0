Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A46C636CC
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 07:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjBHHgE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Feb 2023 02:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjBHHgD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 02:36:03 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1F942DD3
        for <linux-doc@vger.kernel.org>; Tue,  7 Feb 2023 23:36:01 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qw12so49032996ejc.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Feb 2023 23:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+6cVpfdUT3Cffvw9dsOrnLoatIHL7xASe/2O5QaTNk=;
        b=dqpAIl0/8qbmmQMm1uh/EgYDasKhNSKt29jD4NpGeo/r174jskgE7VSoJZ4dtHqoJY
         F67lOJ2HExE+lw4HpylDvdaw9u6HxLarFr/9STZ5jfQBsJHUszcZ/8FbR6I7NspGHoHO
         JQbb0+iexz6kn/FBtv062hFshDmOuRHcnWGl0J6hgZ9jeF6I4JGQQonsN9UqBxjuM7sd
         ACQxiXRMkSvMTOrzQAJ64gR7wudwYphvDNa1e3482ZF1l9+IOecV5zoOlWxgEbzhWJY3
         /yKX/0F1W5p99ZlkRZGN6QmupZOnsPSn1ZywDgroEijdUxztlhz731DdbdZDkaqUBLrH
         HOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+6cVpfdUT3Cffvw9dsOrnLoatIHL7xASe/2O5QaTNk=;
        b=JKuxypO6rvORYlsQHi4Ty+rB51es8vE/VTyQBomJFeV3gbsAvSb59Kei/24iwvVmfO
         Yn4JKWQvNtFEy7GVWMedRzdTqPo1feQp+CqDcgt00+UGm+JJpR2Es/v77hSlUY7/GT3P
         MUupsE8F1gOd6Qne88jO0RtQ9OIP92s3TSeSOotv8bnNtQR3wnJoPKWmedLBrkoJE2A+
         NEz9oVedHPE1dU0JYCDd9D7FecfP533N2Q7nrsHV/o5fj7g+/84YIY8O73CXlfK9BTF3
         zjLx90IvMIlS80oKpU4slrWTk4gCGdJbeZriFuQxpzpdC++o8Fd8Guy5Kp92J7IPwezl
         99iA==
X-Gm-Message-State: AO0yUKUrHXOvvgE3zqcTT65YpNBznMWtcGGIQFNEZf5g2a63IMhQJp3h
        dr8OQHwLN/7kPzAby/Zd7MEMPw==
X-Google-Smtp-Source: AK7set+lidga156sV3Lb85JJC6TjO0DASsExDaoW/ESBbk5LQP/Gld3sksV0kENNHzU5WzlEhCrR/g==
X-Received: by 2002:a17:907:1743:b0:8a9:f10c:455 with SMTP id lf3-20020a170907174300b008a9f10c0455mr5725845ejc.23.1675841759713;
        Tue, 07 Feb 2023 23:35:59 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906845000b008784ecb2dd5sm7913653ejy.104.2023.02.07.23.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:35:59 -0800 (PST)
Date:   Wed, 8 Feb 2023 08:35:58 +0100
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
Message-ID: <Y+NQ3tuK6hnDmvah@nanopsycho>
References: <20230202111423.56831-1-alejandro.lucero-palau@amd.com>
 <20230202111423.56831-3-alejandro.lucero-palau@amd.com>
 <Y9ulUQyScL3xUDKZ@nanopsycho>
 <DM6PR12MB4202DC0B50437D82E28EAAC2C1DB9@DM6PR12MB4202.namprd12.prod.outlook.com>
 <Y+JnH+ecdTGgYqAf@nanopsycho>
 <DM6PR12MB42026D97627495DC2FF2A346C1DB9@DM6PR12MB4202.namprd12.prod.outlook.com>
 <DM6PR12MB4202E78CB7CB3BE13817B782C1DB9@DM6PR12MB4202.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR12MB4202E78CB7CB3BE13817B782C1DB9@DM6PR12MB4202.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tue, Feb 07, 2023 at 06:24:05PM CET, alejandro.lucero-palau@amd.com wrote:
>
>On 2/7/23 15:10, Lucero Palau, Alejandro wrote:
>> On 2/7/23 14:58, Jiri Pirko wrote:
>>> Tue, Feb 07, 2023 at 03:42:45PM CET, alejandro.lucero-palau@amd.com wrote:
>>>> On 2/2/23 11:58, Jiri Pirko wrote:
>>>>> Thu, Feb 02, 2023 at 12:14:17PM CET, alejandro.lucero-palau@amd.com wrote:
>>>>>> From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
>>>>>>
>>>>>> Support for devlink info command.
>>>>> You are quite brief for couple hundred line patch. Care to shed some
>>>>> more details for the reader? Also, use imperative mood (applies to the
>>>>> rest of the pathes)
>>>>>
>>>>> [...]
>>>>>
>>>> OK. I'll be more talkative and imperative here.
>>>>
>>>>>> +static int efx_devlink_info_get(struct devlink *devlink,
>>>>>> +				struct devlink_info_req *req,
>>>>>> +				struct netlink_ext_ack *extack)
>>>>>> +{
>>>>>> +	struct efx_devlink *devlink_private = devlink_priv(devlink);
>>>>>> +	struct efx_nic *efx = devlink_private->efx;
>>>>>> +	char msg[NETLINK_MAX_FMTMSG_LEN];
>>>>>> +	int errors_reported = 0;
>>>>>> +	int rc;
>>>>>> +
>>>>>> +	/* Several different MCDI commands are used. We report first error
>>>>>> +	 * through extack along with total number of errors. Specific error
>>>>>> +	 * information via system messages.
>>>>>> +	 */
>>>>>> +	rc = efx_devlink_info_board_cfg(efx, req);
>>>>>> +	if (rc) {
>>>>>> +		sprintf(msg, "Getting board info failed");
>>>>>> +		errors_reported++;
>>>>>> +	}
>>>>>> +	rc = efx_devlink_info_stored_versions(efx, req);
>>>>>> +	if (rc) {
>>>>>> +		if (!errors_reported)
>>>>>> +			sprintf(msg, "Getting stored versions failed");
>>>>>> +		errors_reported += rc;
>>>>>> +	}
>>>>>> +	rc = efx_devlink_info_running_versions(efx, req);
>>>>>> +	if (rc) {
>>>>>> +		if (!errors_reported)
>>>>>> +			sprintf(msg, "Getting board info failed");
>>>>>> +		errors_reported++;
>>>>> Under which circumstances any of the errors above happen? Is it a common
>>>>> thing? Or is it result of some fatal event?
>>>> They are not common at all. If any of those happen, it is a bad sign,
>>>> and it is more than likely there are more than one because something is
>>>> not working properly. That is the reason I only report first error found
>>>> plus the total number of errors detected.
>>>>
>>>>
>>>>> You treat it like it is quite common, which seems very odd to me.
>>>>> If they are rare, just return error right away to the caller.
>>>> Well, that is done now. And as I say, I'm not reporting all but just the
>>>> first one, mainly because the buffer limitation with NETLINK_MAX_FMTMSG_LEN.
>>>>
>>>> If errors trigger, a more complete information will appear in system
>>>> messages, so that is the reason with:
>>>>
>>>> +               NL_SET_ERR_MSG_FMT(extack,
>>>> +                                  "%s. %d total errors. Check system messages",
>>>> +                                  msg, errors_reported);
>>>>
>>>> I guess you are concerned with the extack report being overwhelmed, but
>>>> I do not think that is the case.
>>> No, I'm wondering why you just don't put error message into exack and
>>> return -ESOMEERROR right away.
>> Well, I thought the idea was to give more information to user space
>> about the problem.
>>
>> Previous patchsets were not reporting any error nor error information
>> through extack. Now we have both.
>
>
>Just trying to make more sense of this.
>
>Because that limit with NETLINK_MAX_FMTMSG_LEN, what I think is big 
>enough, some control needs to be taken about what to report. It could be 
>just to write the buffer with the last error and report that last one 

Wait. My point is: fail on the first error returning the error to
info_get() caller. Just that. No accumulation of anything.


>only, with no need of keeping total errors count. But I felt once we 
>handle any error, reporting that extra info about the total errors 
>detected should not be a problem at all, even if it is an unlikely 
>situation.
>
>BTW, I said we were reporting both, the error and the extack error 
>message, but I've realized the function was not returning any error but 
>always 0, so I'll fix that.
>
>
>>>>>> +	}
>>>>>> +
>>>>>> +	if (errors_reported)
>>>>>> +		NL_SET_ERR_MSG_FMT(extack,
>>>>>> +				   "%s. %d total errors. Check system messages",
>>>>>> +				   msg, errors_reported);
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> static const struct devlink_ops sfc_devlink_ops = {
>>>>>> +	.info_get			= efx_devlink_info_get,
>>>>>> };
>>>>> [...]
