Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B86B7D6B1
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 01:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751501AbeCTBil (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 21:38:41 -0400
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36742 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751498AbeCTBik (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 21:38:40 -0400
Received: by mail-pg0-f68.google.com with SMTP id i14so17452pgv.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Mar 2018 18:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w8/Wc79K5U6pl5yi1CmH8tR0mKYaKIQ4WrHT1sUQ2cY=;
        b=DaAA+nldW1ZGq766K/NbdY1mCPoE6xZ9P1lE+TrjEtwqkM+L4AEJ88c/GAy+VOnqQi
         eb3SICJJecUyazJDdcoPZfAI048cVplw3GVHjJvfgx3q1NXFvwTosTZLYJ9CfeWRvj9S
         KAoivRW0VeHPRaIVX/5eT757bEcxO7ZdauPSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w8/Wc79K5U6pl5yi1CmH8tR0mKYaKIQ4WrHT1sUQ2cY=;
        b=gwJL7UBXNnSuLzaegYciNGUsT/nRG8lDY6dEpkluA2XiEX7dwimE4AH1hiC5WSO4WR
         TxQHnVjBG3kwLAOreD6OX638yv8bwb5L3QcbkhcO6FjWCfb+U66VAcTroz4LWne8ZhLo
         IPYYMrHLyoXzdwtknOOEtp6eIoSkVITu32zTictcDU6Zmzazb1rc56PBi9R7lsRo5IG3
         c+FdGxF74yZEG7b1jVOolAaFts18jv5YI/rc4KXxFt3PI5lmm2vKa6pRMFp2dfnH85Ko
         o1bXbmQ4K2jyBMpMIBzONVkLueDQ9+2lL9hVmikTDae9OasTohhKntMDYX6bQKNi/ot1
         N1VA==
X-Gm-Message-State: AElRT7GRQVM1CPQ0wjuDGmjfE7yNoAVfDI9Sy9/nEND3VBpiHlF3DBO0
        T7RRuBUFgNxj4IhfRiTWilF4DA==
X-Google-Smtp-Source: AG47ELvkY/1d6+U0GWP7TLNp1jkYXf1QjB/QL96MXEe9hdOtaGZc9/qCeg5bgoU7fFgt8VgFZqewjA==
X-Received: by 10.99.168.13 with SMTP id o13mr1397502pgf.198.1521509919562;
        Mon, 19 Mar 2018 18:38:39 -0700 (PDT)
Received: from localhost ([218.255.99.6])
        by smtp.gmail.com with ESMTPSA id z85sm582430pfd.104.2018.03.19.18.38.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Mar 2018 18:38:38 -0700 (PDT)
Date:   Tue, 20 Mar 2018 09:38:36 +0800
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH V4] thermal: Add cooling device's statistics in sysfs
Message-ID: <20180320013836.hiu6oy3smwmk35tp@vireshk-mac-ubuntu>
References: <6e557b90950723065d49c9a545146ce31d7dc6e1.1516096153.git.viresh.kumar@linaro.org>
 <1520924571.3766.8.camel@intel.com>
 <1521014472.2087.32.camel@intel.com>
 <20180314081426.GG15832@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180314081426.GG15832@vireshk-i7>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14-03-18, 13:44, Viresh Kumar wrote:
> I got those warnings as well, and I quietly ignored them :)
> 
> I ignored the renaming part for the sake of consistency. The other existing
> routines for similar purpose are named as:
> 
> thermal_cooling_device_type_show
> thermal_cooling_device_max_state_show
> thermal_cooling_device_cur_state_show
> thermal_cooling_device_cur_state_store
> 
> for me it made more sense to follow that naming convention. And I didn't use the
> _RO and _WO variants for the same reason.
> 
> Now here is what I propose now:
> 
> - You apply this patch as-is and ignore the warning.
> 
> - I will send few patches on top of that to do:
>   - renaming of all such routines to shorter versions.
>   - Use the _RO or _WO variants of the macro everywhere.
> 
> What do you say ?

@Zhang: Can you please share the way you want this to get merged ? And if the
above is fine with you ?

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
