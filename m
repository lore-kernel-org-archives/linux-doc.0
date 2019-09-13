Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 94DD57D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Sep 2019 16:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfIMQsa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Sep 2019 12:48:30 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41347 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbfIMQsa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Sep 2019 12:48:30 -0400
Received: by mail-pl1-f196.google.com with SMTP id m9so13497519pls.8
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2019 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DOpFGeHHDZEyxEO4+U90FaybHVvMCeu5i8LjqD7DE7c=;
        b=FH4bu5MebtvA25E/fjs9xUNBSmnzk3ucQQ2kOYf106Vpgc0OXlwheRXJ0JaobZxkyh
         o+JBTePajqx9FnVGroE5POhp1Jw1LPd2AmLAnyOCPveZtpCPMLw7DSQhIErPeKMghKTv
         jmtML/CltaZYemRact1Cm6/A73OWHUCRkhWJFAZ6UMJQs+RPcMtYUD/dYeVdmwND8fhn
         /D9uFSJZc065ryqVbGXluwV8uDeaS6WS29XBdzWUmI6X7yyoNlk77oXZdAu0B+tQ6TdE
         gFZzBtorl9Bc2jIzwAIOm3hr3H2TCZz83/V+EwZZdh2GS2utgO+M7wjUgo6q/ey33Mgl
         ncxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DOpFGeHHDZEyxEO4+U90FaybHVvMCeu5i8LjqD7DE7c=;
        b=H+mUjsOzhBVHOIS1qrwPqGzK94dzlyPJWanV/w8lccHqowvezYAXwx2C6loycxX05q
         lFc9+BK2gCzm2qLbWUYrQMw7L2ZUHx682EDlv8Hu2Xc2FGLp5Bfvf2+cu6WVleCEw3ZT
         xSgmVdYy5NYi2MdbGGnr+gGo2zeNaotkbGaEtLKSD1qzL7Rtx6fp90zDbuiJAS7zbkGu
         s5Ql/dgLlJJIFwtg2/dIsR1vT2yrtpLKomxXHg+xfBeGm/le/0lialqWKMDMZZnBa9H5
         N+c/132P8IeizNQzO/P0iR0Qn2VH9vspikNOP3kfJpT91uMzpy4jGlpKuM0eZzERgECH
         hRfA==
X-Gm-Message-State: APjAAAU/VjBQIOD36q9/SM46DqMP9viplrgO07Q84npusTKcmnibcfGn
        KSGPo0/etyiE68LZrCXNjlf+iBtUn0ANBg==
X-Google-Smtp-Source: APXvYqzGSP7mUzUeJS9IZwiuKqZ5tBGVNCLlwAQr9lS5T5ZKNEPWfqvzeCdY/2gBmzRvwKT0cCPHxA==
X-Received: by 2002:a17:902:222:: with SMTP id 31mr51181480plc.167.1568393307756;
        Fri, 13 Sep 2019 09:48:27 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:83a1:b44d:81f2:955a:8003? ([2605:e000:100e:83a1:b44d:81f2:955a:8003])
        by smtp.gmail.com with ESMTPSA id x22sm31307122pfi.139.2019.09.13.09.48.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 09:48:26 -0700 (PDT)
Subject: Re: [PATCH 3/3] null_blk: validated the number of devices
To:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
        Matthew Wilcox <willy@infradead.org>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Cc:     "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>, "m@bjorling.me" <m@bjorling.me>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "krisman@collabora.com" <krisman@collabora.com>
References: <20190911144636.226945-1-andrealmeid@collabora.com>
 <20190911144636.226945-3-andrealmeid@collabora.com>
 <20190912161937.GK29434@bombadil.infradead.org>
 <dbdb0415-8762-f9c1-a65a-3531d9cca109@collabora.com>
 <DM6PR04MB5754177B405819C802549AE686B00@DM6PR04MB5754.namprd04.prod.outlook.com>
 <d55554f5-7212-c5fc-dbb0-4269be913aaa@collabora.com>
 <20190913151249.GN29434@bombadil.infradead.org>
 <e029c399-e0cf-62e4-5ce3-a4287eb6cd94@kernel.dk>
 <BYAPR04MB5749E8298AEBE080BFD3F26A86B30@BYAPR04MB5749.namprd04.prod.outlook.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <bb344ee1-b7f1-9029-b9c1-177193371b35@kernel.dk>
Date:   Fri, 13 Sep 2019 10:48:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5749E8298AEBE080BFD3F26A86B30@BYAPR04MB5749.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/13/19 10:27 AM, Chaitanya Kulkarni wrote:
> On 09/13/2019 09:23 AM, Jens Axboe wrote:
>> It also breaks the case of loading it, then setting up a new device
>> through configfs.
> 
> Yep, this is exactly I was asking nr_device=0 as modparam is allowed
> and membacked null_blk creation will fail with this check.
> 

Yeah, it's totally broken...

-- 
Jens Axboe

