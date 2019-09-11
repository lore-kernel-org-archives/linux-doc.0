Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 101A87D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Sep 2019 22:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbfIKWFS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Sep 2019 18:05:18 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39040 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfIKWFS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Sep 2019 18:05:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id bd8so10767686plb.6
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2019 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PBR/ZqujBMyrRxXxfP7k8gbUqJWi1d6iXuppjK7dj3M=;
        b=GYLoGeCupwyTlVppEvlqpoCvKCs/Ne7NCKSlYhxpkkPmt9DzrgArr0jlhMrDxEiMv5
         K229oH24XDJu7zEkk5vWuUg8c5sKb/HT4/RkqQf0lwWeHPcbKgOvvI8iP2YKx9niTpp1
         mxQtPrcaMuYYzc2EFKaOdPtwP+lPDTfQSSp7PlWPR6wzAUkAxVy3EZxujMEOvupBIWEW
         /yZvCQJnYkh5Ht4PtbbiPvpwnvEvV/SBFo62TzOaQ2Hd+pyBwNmpESX8tlh85yoN7g32
         2zWJViSEOJjXRIPlXpB/NrKJ8yxK1hFm2lKG3wdcHANszoL9yBVXou3lI9byQKD92aEl
         /5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PBR/ZqujBMyrRxXxfP7k8gbUqJWi1d6iXuppjK7dj3M=;
        b=Z99prIWcy9eResgYG+RZVjX7LbdRtmIWSBEaKzWRyeYQb++0cQRYDZ2zBzDRoUL7OH
         Q1K1GcxdHHUcLYs+UNDZnQfNJ76eSX6yBYw1MKsmto8DjmpODX26KPYQ5xr7mqkBVisC
         34QJxhKLdNLRHXwHgSyCcmNIclB3xDocPvy1xg3bKqwp0FkLEVGD6iplKAlKYLWp/ERe
         uBECkDNblFCjZrtYBGj3mHUICCFL08oANQIaDJgQ0iAkZ/Cydd/GYPhbr8w4W7sT2cwg
         XSAnOntK4DROPZVzBUd6iGsb0U8orGf8k50OHaMGyA2JezisWg2/fekwHyQoN8s6YHic
         E+yA==
X-Gm-Message-State: APjAAAVr69QYXarynV/xbhqxes+oE7iUyq4++rDRNmlgGy8YODipCJvN
        mbwkTdOSLMO3sR7Cvo1uIG5+/uHO4cnKpg==
X-Google-Smtp-Source: APXvYqwTYfnX9fTWWd4yn0IXL1esnJDVFrzwrPA2drnZMdglBBstDiOpsZCFmNJF792hkMXdBGwpWw==
X-Received: by 2002:a17:902:ba96:: with SMTP id k22mr21079978pls.219.1568239517941;
        Wed, 11 Sep 2019 15:05:17 -0700 (PDT)
Received: from [192.168.1.188] ([23.158.160.160])
        by smtp.gmail.com with ESMTPSA id f62sm28613723pfg.74.2019.09.11.15.05.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 15:05:16 -0700 (PDT)
Subject: Re: [PATCH 1/3] docs: block: null_blk: enhance document style
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, m@bjorling.me, kernel@collabora.com,
        krisman@collabora.com
References: <20190911144636.226945-1-andrealmeid@collabora.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2252d8d6-17e6-402b-9136-dc85e3cccbdd@kernel.dk>
Date:   Wed, 11 Sep 2019 16:05:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911144636.226945-1-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/11/19 8:46 AM, André Almeida wrote:
> Use proper ReST syntax for chapters. Add more information to enhance
> standardization in the file and to make the rendering more homogeneous.
> Add a SPDX identifier. Mark single-queue mode as deprecated.

Please use a cover letter for sending block patches if there's more
than one in the series.

I applied these, though rewrote the commit message for patch #3.

-- 
Jens Axboe

