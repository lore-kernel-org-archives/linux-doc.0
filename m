Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8CF87D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 02:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbfDQCFC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 22:05:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34746 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfDQCFC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 22:05:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id b3so11325573pfd.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2019 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=DHgWX8BenTTHLAIhsHOcfwer3VhUji97XDm74Dz1U3I=;
        b=BToFSUdGYTU24GWhSNQ8aJwRmvHHUTDWahfHxafKU+iea7ZU/xbw1yALrSu0IeEWbZ
         Fcl12lCOOwxRvbaucutb/QXyEgFkUokX8yPUfm80rvFV3NvckORsC9Bj5yH59/IHLPM9
         sfIK59cbauE+Q6M0VtEG/7UolhfbDs3wAffQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=DHgWX8BenTTHLAIhsHOcfwer3VhUji97XDm74Dz1U3I=;
        b=KhF3OPOyegWar3GMS/X1eWBeKe42dtYgZ0iAYPN8GCSdO3tiogHuHP6VPSY5eDMpkf
         N3du2J6/5gPkIwlg9bD+I1ZdhQIkayKVDfNL9nypuwzDUL7HVp62vL+POGpeePQI9VML
         rqVgLRRd+Po6gsmT/n0FRW4J5nvW5zr3+WPzq3ICukmEv17IHXwAahGkj8rFrvZZ5VA6
         UYxmlo2pvC+6DX8YBAwYSLfbbuV+B2Bwr+0lCZZ0m3Ch+4qQ5yxNSGB9noEr9fsEiJj5
         aHhGrl7ykJ8ugKVCIWokZ6C5q82fJPuAKvDpQTG3APghV2bCMhg6AgtTS6MV7utm5+QJ
         HHFg==
X-Gm-Message-State: APjAAAX82KYa1yCCB+sgw1QwLGQ0TWOum9qjPTYfRHxJzwEz39NTtBQC
        tPID/sm70YJQdko+2IAtCmC0qA==
X-Google-Smtp-Source: APXvYqx95duLpezI8vQsZevG2MTXhFBesevf2aH+BVMCN5Uzq4QaQNc9/K4q0o5UaHkzxOSPK8jLng==
X-Received: by 2002:aa7:9294:: with SMTP id j20mr22851905pfa.64.1555466701410;
        Tue, 16 Apr 2019 19:05:01 -0700 (PDT)
Received: from localhost (50-46-216-15.evrt.wa.frontiernet.net. [50.46.216.15])
        by smtp.gmail.com with ESMTPSA id p128sm123265808pfp.30.2019.04.16.19.05.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 19:05:00 -0700 (PDT)
References: <20190416183620.39950-3-ruslan@babayev.com> <20190416201603.GA25257@roeck-us.net>
User-agent: mu4e 1.0; emacs 26.1
From:   Ruslan Babayev <ruslan@babayev.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ruslan Babayev <ruslan@babayev.com>,
        Jean Delvare <jdelvare@suse.com>, xe-linux-external@cisco.com,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (pmbus) add support for IR35215
In-reply-to: <20190416201603.GA25257@roeck-us.net>
Date:   Tue, 16 Apr 2019 19:04:59 -0700
Message-ID: <87zhopcrp0.fsf@babayev.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Guenter Roeck writes:

>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>
> Alphabetic include file order please.

Sure

>> +
>> +static struct pmbus_driver_info ir3570b_info = {
>> +	.pages = 1,
>
> Either this ...
>
>> +	.format[PSC_VOLTAGE_IN] = linear,
>> +	.format[PSC_VOLTAGE_OUT] = linear,
>> +	.format[PSC_CURRENT_IN] = linear,
>> +	.format[PSC_CURRENT_OUT] = linear,
>> +	.format[PSC_POWER] = linear,
>> +	.format[PSC_TEMPERATURE] = linear,
>> +	.func[0] = IR3570B_FUNCS,
>> +	.func[1] = IR3570B_FUNCS,
>
> ... or this is wrong.

The latter is wrong. Thanks for catching it.
