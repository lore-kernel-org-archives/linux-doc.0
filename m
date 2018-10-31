Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 566AB7D08E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Oct 2018 03:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbeJaMhk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 08:37:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40696 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbeJaMhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Oct 2018 08:37:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id o14-v6so6685522pgv.7;
        Tue, 30 Oct 2018 20:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ARI2wOOdXKHCGw/EZBNSKV/KipdLXza0yLe1Fg56GKo=;
        b=AbD8lzYwJU0k1FVVw4JYgG81pFkNpw7ZHAnmSB/yLT3gROZhm68DiFryBgOO1fogof
         We4l+LXAiatJvZCszusgOqPz9oghwzRVAWQrM9D6qM0NQUyKAjNn2WNcTrjPXTG36vXA
         8JLvz4BiCbdfl/xM7l3ZAoB/yRhyTT0KwsUK2MjFkV5s+tzKeeNHMEagYdDctDarvTJd
         50CUMxl+KFoH2o4KSsU9xtsw5BWDZ/xGkHM12w11toQI/tNiaqk+MJHJclihMfrFzHwq
         EzE0jnOxDePQ8U1qMBHqQT1w7CDHwVRjxFAHr/fylDSMORvlI++z+O7gDo+PBgYPpjzb
         wUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ARI2wOOdXKHCGw/EZBNSKV/KipdLXza0yLe1Fg56GKo=;
        b=DdjZjQEuSXxx5SAdEbfyGiV8ypbuf9KS5pUCoyUK3WaksqW8OX52xuhPeeFe/8WlZK
         lrybnxsnS3dUA+1BQeXDxa8w122ca/VVcTp332MQvZ6gykg1mIw7khKzQ/Lg/D9A/DQb
         p/MQaNwteN0d1G+y5kz7UujaM0TsaLEXkH1olLPD3nabu8dxID+jdL6oGI/ryl/gRaDr
         GnTAi5tAr5+oQMMVHyo9VACmHAkdCPIqt7HRwy4Yp+EXkXbHT8T1+ZxZRYPrLtttxvWo
         HBj176VcWUdgH0JV/ujOWY1fpEGu1bBHy3T1Rs5khsJK82ViS/BVRMVLkD6tga5qSD1c
         J0Ig==
X-Gm-Message-State: AGRZ1gJd57cbWO1K7FCy8C1ugBueDSpHS64GKCkUbZpSDMGVLIxb30Nz
        l/6Dk/sJ77nhB8Z9vDaivEaqPXXD
X-Google-Smtp-Source: AJdET5cnFC6nhO7CyX7pRt1XhwE+ryiK8YwkYomplCdmP+ma2CyeVrvtUx8C32meKvvA30W/VTMp/w==
X-Received: by 2002:a63:e156:: with SMTP id h22mr1447717pgk.255.1540957286187;
        Tue, 30 Oct 2018 20:41:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g25-v6sm25879664pgg.73.2018.10.30.20.41.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 20:41:25 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (adt7475) document mapping of sysfs entries to
 inputs
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20181030202527.14581-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <092d62bc-8919-bb18-c377-57e3b7018c17@roeck-us.net>
Date:   Tue, 30 Oct 2018 20:41:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030202527.14581-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/30/18 1:25 PM, Chris Packham wrote:
> As per the usual standard with hwmon drivers the mapping to sysfs
> entries follows the register map of the device e.g. in0_input
> corresponds to the register 0x20, in1_input corresponds to 0x21 etc.
> 
> Hardware designers tend to work with input pins instead of registers
> which is where things start to get confusing. A hardware designer might
> say "the 1.5V rail is connected to the VCCP pin" leaving the software
> designer none the wiser as to which of the sysfs entries should be
> associated with the label "1.5V".
> 
> Try to bridge the gap by documenting the mapping of sysfs entries to
> the corresponding pins. This should allow someone to create a
> configuration file or other mapping without needing to dive into the
> code and ADT datasheets.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to hwmon-next.

Thanks,
Guenter
