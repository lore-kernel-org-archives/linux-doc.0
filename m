Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB646C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 18:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C6A364F71
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 18:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbhCLSxn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbhCLSxM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Mar 2021 13:53:12 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B32C061574
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 10:53:00 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id u18so12331241plc.12
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 10:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4lnxveEJ/0ZKlbul4AkdRbzETouaO+1JW1spiBW8ehI=;
        b=g7ECqI3a3+o2sGXX/XLkecd+qRB7jy07detu5ysXiCWsWZRQlW36mV/mpnHpeRUV2e
         96flARGCs1u7qPUrBPnGMKsHREUIgX1qR+ezAldlSRbnvJyrEopC9FaAcc2RFpkevMc7
         jaIlyPRaOqgqvTnhi6X9EAHnlWs4x7BglhW6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4lnxveEJ/0ZKlbul4AkdRbzETouaO+1JW1spiBW8ehI=;
        b=DCFzlZwL/jUQxC9Cm7tXNAvVIBlzaJJJOaNoxhT8YA1do5lAOWt5T00q65shPB5UwA
         N3AS+mVV8htfXgbMYAsgSQtdhRyjRF1Jn6TXKl96TJBGs6axFv+1OBSlMRKm8efG2blI
         GdOwdSwINB4idqKWPYV61kQi8q8YrZy86WfyzY5aF++TN0mVe273YXdDyU2FDwYWa7Ag
         63wRXT/YOZQdCjSLIQ/BiRx6gdwH3tJPwDKcbJ5W7GzbX3ZOizvjXW7Wu3Ykcb6LXw1W
         Rce86f/kh6MAF1EgUp06XgLtQM6tGsEc+Bum41lEHIbn/reD5QCDzt02fLw9B+/LfJXN
         XrtQ==
X-Gm-Message-State: AOAM531wS1grqO/rh0fe8QKnatSA3uYSw1hA+JDfUUOevpsfI+G3s/ve
        HMA5kEraqaNKw0Nn0/YWLQpWu/8uG4JJZQ==
X-Google-Smtp-Source: ABdhPJzIK3/zcsP1TXvm2aWXTGtveRpCxedeg7bNwF+dueqAOaOCNWvyJk+0QCrzytMON1/F3YT+Sg==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id lb12mr15505099pjb.133.1615575180327;
        Fri, 12 Mar 2021 10:53:00 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id k3sm5798446pgq.21.2021.03.12.10.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 10:52:59 -0800 (PST)
Subject: Re: [PATCH v3] Expose the bus kernel docs to the build docs.
To:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210307031611.GU2723601@casper.infradead.org>
 <20210308191417.4750-1-wt@penguintechs.org>
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <c94755bb-abde-4abb-1303-731592bec570@penguintechs.org>
Date:   Fri, 12 Mar 2021 10:52:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308191417.4750-1-wt@penguintechs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew,

I hate to bother you, but how do I know if this patch is acceptable or 
not. I am not sure how this is tracked.

Thanks,
wt

On 3/8/21 11:14 AM, Wren Turkal wrote:
> Before, the bus type related APIs that were defined in the
> include/linux/device/bus.h were not referenced anywhere in the docs, so
> I linked it to the bus types api documentation.
> 
> Signed-off-by: Wren Turkal <wt@penguintechs.org>
> ---
>   Documentation/driver-api/driver-model/bus.rst | 8 ++++++++
>   Documentation/driver-api/infrastructure.rst   | 3 +--
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/driver-model/bus.rst b/Documentation/driver-api/driver-model/bus.rst
> index 016b15a6e8ea..c53b01e95fd9 100644
> --- a/Documentation/driver-api/driver-model/bus.rst
> +++ b/Documentation/driver-api/driver-model/bus.rst
> @@ -1,3 +1,5 @@
> +.. _bus_types:
> +
>   =========
>   Bus Types
>   =========
> @@ -144,3 +146,9 @@ sysfs directory using::
>   
>   	int bus_create_file(struct bus_type *, struct bus_attribute *);
>   	void bus_remove_file(struct bus_type *, struct bus_attribute *);
> +
> +Functions and Structures
> +========================
> +
> +.. kernel-doc:: include/linux/device/bus.h
> +.. kernel-doc:: drivers/base/bus.c
> diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
> index 683bd460e222..eb2a2c9e3c0c 100644
> --- a/Documentation/driver-api/infrastructure.rst
> +++ b/Documentation/driver-api/infrastructure.rst
> @@ -41,8 +41,7 @@ Device Drivers Base
>   .. kernel-doc:: drivers/base/platform.c
>      :export:
>   
> -.. kernel-doc:: drivers/base/bus.c
> -   :export:
> +:ref:`bus_types`
>   
>   Device Drivers DMA Management
>   -----------------------------
> 

-- 
You're more amazing than you think! ymatyt.com
