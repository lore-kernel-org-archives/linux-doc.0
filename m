Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 92AB07D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Jun 2018 20:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933175AbeFLUgp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Jun 2018 16:36:45 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35128 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933609AbeFLUgo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jun 2018 16:36:44 -0400
Received: by mail-lf0-f65.google.com with SMTP id i15-v6so470577lfc.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Jun 2018 13:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AUg8/xwPIkMDxiYNYGykKAZfJA+HDKFtGocvEavjPb4=;
        b=BLal9SONTRyzxVr023TVmi/2q6rCUmVIik9CSWEPg2QZ6G3+E5Z/GWrbL5iRL84c1P
         4tV0VPmlbg/LvFJhSPJJnL3YbTRCct5CMh7DW0Kd99EcWI7pHZ4/K4vY+DZWe8JJskSI
         42Gtl1ZF9ZbIVy0sZI1DfxIB5NOf4IhsRoVcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=AUg8/xwPIkMDxiYNYGykKAZfJA+HDKFtGocvEavjPb4=;
        b=cGtGpI0S5YxyE4x1LiLA4N+jLWa02HZKhD2G6b+WpKRGyx5XZcYtKktCn1k/wB/qRr
         5fLk5ASE71nriITgGGDdMr9mv6HnLLnU0gJWsy5FJQO/NVm/soRQKYzPUKfGfxSHrJSJ
         js8DcC2TmPjRIu8451YFP8tyMirUGMp2EY55P9tpFk2Bx2ri9PM3rDBjZ06DlwZQ1Lmp
         uAxmfWbYnWUMCdVtH2HSFsaQE43xu5fUwk6wWcI0dbp6+Kn9//jMvk6P79SDuW5r3SII
         2mct10VIMcxgjrkPWMbWocQwjkUm3Q8zZS+5gzbHZm2/Z6aGto+D4gYKCVTTvd7yv4MU
         Vt4w==
X-Gm-Message-State: APt69E0STBq6rwj95f24YFEM5kOKE9yyv+lyUs+RHvBfxx3tSy1wYh9F
        V15xuZ9LRnFMj2nE1DSnVO+nig==
X-Google-Smtp-Source: ADUXVKKNMq0GExFPFyYmwdNK5BZRgmyyZuqCvdU+MjKgONiLvYayIRPKMKu1XhZR6Y7j0xXtx7KmjQ==
X-Received: by 2002:a19:a68a:: with SMTP id p132-v6mr1050414lfe.89.1528835802838;
        Tue, 12 Jun 2018 13:36:42 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id q78-v6sm194028lfd.35.2018.06.12.13.36.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jun 2018 13:36:42 -0700 (PDT)
Date:   Tue, 12 Jun 2018 23:36:39 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     davem@davemloft.net, corbet@lwn.net, akpm@linux-foundation.org,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        vinicius.gomes@intel.com, henrik@austad.us,
        jesus.sanchez-palencia@intel.com, ilias.apalodimas@linaro.org,
        p-varis@ti.com, spatton@ti.com, francois.ozog@linaro.org,
        yogeshs@ti.com, nsekhar@ti.com
Subject: Re: [PATCH net-next 6/6] Documentation: networking: cpsw: add MQPRIO
 & CBS offload examples
Message-ID: <20180612203638.GC9473@khorivan>
Mail-Followup-To: Grygorii Strashko <grygorii.strashko@ti.com>,
        davem@davemloft.net, corbet@lwn.net, akpm@linux-foundation.org,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        vinicius.gomes@intel.com, henrik@austad.us,
        jesus.sanchez-palencia@intel.com, ilias.apalodimas@linaro.org,
        p-varis@ti.com, spatton@ti.com, francois.ozog@linaro.org,
        yogeshs@ti.com, nsekhar@ti.com
References: <20180611133047.4818-1-ivan.khoronzhuk@linaro.org>
 <20180611133047.4818-7-ivan.khoronzhuk@linaro.org>
 <16c97ea6-9f28-1dd6-136a-2473423bf94a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <16c97ea6-9f28-1dd6-136a-2473423bf94a@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 12, 2018 at 02:55:18PM -0500, Grygorii Strashko wrote:
>
>
>On 06/11/2018 08:30 AM, Ivan Khoronzhuk wrote:
>>This document describes MQPRIO and CBS Qdisc offload configuration
>>for cpsw driver based on examples. It potentially can be used in
>>audio video bridging (AVB) and time sensitive networking (TSN).
>>
>>Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>>---
>>  Documentation/networking/cpsw.txt | 540 ++++++++++++++++++++++++++++++
>>  1 file changed, 540 insertions(+)
>>  create mode 100644 Documentation/networking/cpsw.txt
>>
>>diff --git a/Documentation/networking/cpsw.txt b/Documentation/networking/cpsw.txt
>>new file mode 100644
>>index 000000000000..f5d58f502e52
>>--- /dev/null
>>+++ b/Documentation/networking/cpsw.txt
>
>Could you name it with "ti" prefix, pls?
>
>Like "ti-cpsw.txt" or "ti,cpsw.txt"
will name it ti-cpsw.txt in v2

>
>>@@ -0,0 +1,540 @@
>>+* Texas Instruments CPSW ethernet driver
>>+
>>+Multiqueue & CBS & MQPRIO
>>+=====================================================================
>>+=====================================================================
>[...]
>
>-- 
>regards,
>-grygorii

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
