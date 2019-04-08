Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 567A47D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Apr 2019 06:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfDHGQI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Apr 2019 02:16:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39892 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfDHGQH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Apr 2019 02:16:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id k3so6677707pga.6
        for <linux-doc@vger.kernel.org>; Sun, 07 Apr 2019 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CfvbGnjyK6QBz+f+ilqK6DelekKKtPChS3cXJ94sQ7k=;
        b=dmOzrBN3YULvEY0f4eCIYBRnInVqZzkclcfjxL0+6tjS0CzCI7wJS4nUXQ3bAojUbH
         yiUdPNEDcSZHn7CpQ9QHY3ZgQEX4UvZFXuOUPERrG0AmpxRLwLGa6RrHAjg3syepwk/7
         z2FvFKUWnesuGWLbsyuDtU52U8HMAyDm/dj7OFHb7SggGZrVLZ//HOocmTtjIvro3ugD
         CbPApvXZJQCVmcQtiVyDs0hK9/ya5AJ4ox+ORrGxSzVxFCyd7E4X1SLsGAJAYWIn5y0u
         z/K0AipwLjVcVhllloY/h6qwETGIEUFcFllb0xJf2NUjEUo3RaFAJR+MmU+Y+Tb5aaOJ
         uvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CfvbGnjyK6QBz+f+ilqK6DelekKKtPChS3cXJ94sQ7k=;
        b=BX2a72BYBRJ7/EUrDqR22QPvq8dww4P5LXMvFbfU0ObS9Odpt8opT3xmraV6hVvlDx
         KWP7WxO6awbayJywhXKMlHDfOJ3luSJUkQossGkPHpZvR5qGS3i1HoJ0S77ddEeyKyFy
         0S+QpnAQEF6es2+mArNH1pxMpEdsZz8tFCEst/APD4faAssyylKC5aHGUwSxP/hnaGyA
         8GrSKyh/ZWOPAhg/IEhC2VaJ29ZOomWVp54FAX3hTnTX+oRn19ZcISsNdxYSlTuYBjzb
         +qYtt8r1NaHgA1A8fhsk7mymN9yb1QSlIk0UnEq0648BVSmwS8ZDzmFE8aAqmVV3aacT
         cZkA==
X-Gm-Message-State: APjAAAVxAZCZtKb5J7i2k4xOnPqnXHQryd11rYPYezp694fyNqVwb9X6
        F/XY0ctvxfkl+AOTNyXvZN5PQw==
X-Google-Smtp-Source: APXvYqyGw1d2DrXrhALSJbebXmgwtFetA7DWxJPdBM5szRUq2LmSoUKxxERkEgGlWGLoRwUEr6Zw9g==
X-Received: by 2002:a62:474a:: with SMTP id u71mr27860107pfa.87.1554704167103;
        Sun, 07 Apr 2019 23:16:07 -0700 (PDT)
Received: from localhost ([122.172.162.162])
        by smtp.gmail.com with ESMTPSA id m2sm41859927pgr.74.2019.04.07.23.16.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Apr 2019 23:16:06 -0700 (PDT)
Date:   Mon, 8 Apr 2019 11:46:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 0/4] Documentation: PM: Assorted updates
Message-ID: <20190408061604.vezucnff4dp2tx7x@vireshk-i7>
References: <4546107.fVFrecLk33@aspire.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4546107.fVFrecLk33@aspire.rjw.lan>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04-04-19, 00:02, Rafael J. Wysocki wrote:
> Hi All,
> 
> There patches make some changes in the PM documentation:
> 
> - Add "references" sections to cpufreq-related documents (patch [1/4]).
> - Add SPDX license tags to multiple PM-related documents (patch [2/4]).
> - Unify copyright notices in PM-related documents (patch [3/4]).
> - Add an SPDX license tag and a copyright notice to the new
>   intel_epb doc (in linux-next only ATM).

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
