Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA8EE743D7
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 01:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjI2BAT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Sep 2023 21:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbjI2BAT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 21:00:19 -0400
Received: from out-210.mta1.migadu.com (out-210.mta1.migadu.com [IPv6:2001:41d0:203:375::d2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE81139
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 18:00:15 -0700 (PDT)
Message-ID: <022235bd-0226-c896-02a1-aa7765eaa6ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1695949212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qtKt+ZDkUpFphIBKnAoHk52i8tmcI0v9dPl6VlzoB7M=;
        b=A9bOvlMm//bDoKBydN6sv621PcEys4Q1KWYt6SFL67G5XSVHDWO89gXkAZT1ElNueSITkO
        lDRHJSTo8A34TQDzwMit2+IM/xNI5MmKvhj+nJk2vOvuQ/Oyqf3BIpuao7qi3HVvlQh9o+
        mLFO8CQbJAx+IeXSl8gc9qBx9FtAnTU=
Date:   Fri, 29 Sep 2023 02:00:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/2] Documentation fixes for dpll subsystem
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Networking <netdev@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>
References: <20230928052708.44820-1-bagasdotme@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230928052708.44820-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/09/2023 06:27, Bagas Sanjaya wrote:
> Here is a mini docs fixes for dpll subsystem. The fixes are all code
> block-related.
> 
> This series is triggered because I was emailed by kernel test robot,
> alerting htmldocs warnings (see patch [1/2]).
> 
> Changes since v1 [1]:
>    * Collect Reviewed-by tags
>    * Rebase on current net-next
> 
> [1]: https://lore.kernel.org/all/20230918093240.29824-1-bagasdotme@gmail.com/
> 
> Bagas Sanjaya (2):
>    Documentation: dpll: Fix code blocks
>    Documentation: dpll: wrap DPLL_CMD_PIN_GET output in a code block
> 
>   Documentation/driver-api/dpll.rst | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 5a1b322cb0b7d0d33a2d13462294dc0f46911172

For the series:

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
