Return-Path: <SRS0=kJSq=5I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D23C54FCE
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 17:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE86C2072D
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 17:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNUiB0i2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgCWRU7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Mar 2020 13:20:59 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34951 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgCWRU6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Mar 2020 13:20:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id u68so7799565pfb.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2020 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G33GucGUpf7/OJos6cI68PxFAvCJCakeR7MrrB4yhOw=;
        b=xNUiB0i24A5k9G3lHwcmrEALWU/30OU8yRFBTjXBtxtlZlecmkO2n/QMaQk4YDIDxe
         NX+nI3XZ+2WAoZ09W9VFzkQ/jh65ai/HRmNlB9JmEDAe0lsphW/ILAJ2RE4xAL/UjPC3
         5wWoUeNhVG6ZzM8ee35Jhm11rYpF2JxhcOW5HOxiUc7dVosv0x3k8FDFM18uQJDHIXsn
         m+oQCE6MKpSmxTnDnpG6JGp6dvJL4CQ6eEi9o+GOT9dJlfdFTbnj62iybAJGH+1aSimD
         unHEckswTkURF+PuQ5yvD32DToVbjyatqABBmTwVYhI9+uJXcQbjwhFmDUtDaoDCYTY4
         DdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G33GucGUpf7/OJos6cI68PxFAvCJCakeR7MrrB4yhOw=;
        b=khiBssLtyHFV9JnRhxsBuAqhoVylDzMsfb5RZ3cVn675H5Oaudbp6AGCR5hddZRheo
         kD+kAW9J15fs8VOFJjixzx+S2CehvhRKNIMaOEJj2WMJWd/1E1720JF8/XvzMl9n9lQC
         JaiVVq78RuhVO/eof/VMaHNA5MiHCwXtKo/I8IUt4buqaDwNMH97agycnV81NRuLEBbd
         yLb9qXL6K66VdhQjmOQAvD0cTMFABDYVBsxx1RGGXCmWuyR7tQGguTew8ILlokfTsY3v
         qBat5ysP01QuVajGuHOTnx4l8SR8PAz4/g1wOOXKy50xoLuCSE69EdINdEzqoZFA4NFr
         mPlg==
X-Gm-Message-State: ANhLgQ3OOkgVvxFqerTzepcxqVjpJGnyguj6Js/8Omfh106EdahhFiRQ
        QAAeyK8PpkSYnWSkr4Hwx3tgLA==
X-Google-Smtp-Source: ADFU+vsT0+leS6MTUQxm8jSGA6B0eQIlUuhjTWMLPX1oVxqTf1CjesLTnnNqVmZDjDft3w7IYcKtzQ==
X-Received: by 2002:aa7:9566:: with SMTP id x6mr3236287pfq.104.1584984056928;
        Mon, 23 Mar 2020 10:20:56 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id na18sm154599pjb.31.2020.03.23.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:20:56 -0700 (PDT)
Date:   Mon, 23 Mar 2020 11:20:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] docs: trace: coresight-ect.rst: fix a build warning
Message-ID: <20200323172054.GA25141@xps15>
References: <049f74b1db84cf08a02d0922bfa7567a895d46f1.1584966380.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <049f74b1db84cf08a02d0922bfa7567a895d46f1.1584966380.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 23, 2020 at 01:26:24PM +0100, Mauro Carvalho Chehab wrote:
> Sphinx wants a line after "..", as otherwise it complains with:
> 
> 	Documentation/trace/coresight/coresight-ect.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/trace/coresight/coresight-ect.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> index ecc1e57012ef..a93e52abcf46 100644
> --- a/Documentation/trace/coresight/coresight-ect.rst
> +++ b/Documentation/trace/coresight/coresight-ect.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0
> +

Applied.

Thanks,
Mathieu

>  =============================================
>  CoreSight Embedded Cross Trigger (CTI & CTM).
>  =============================================
> -- 
> 2.24.1
> 
