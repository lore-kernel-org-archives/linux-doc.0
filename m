Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB68C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 20 Feb 2022 20:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiBTUnz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Feb 2022 15:43:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiBTUnz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Feb 2022 15:43:55 -0500
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.47.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D524504F
        for <linux-doc@vger.kernel.org>; Sun, 20 Feb 2022 12:43:33 -0800 (PST)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 3BFD37278
        for <linux-doc@vger.kernel.org>; Sun, 20 Feb 2022 14:43:33 -0600 (CST)
Received: from gator4132.hostgator.com ([192.185.4.144])
        by cmsmtp with SMTP
        id Lt3NnpL3GRnrrLt3NnxEvM; Sun, 20 Feb 2022 14:43:33 -0600
X-Authority-Reason: nr=8
Received: from host-95-232-30-176.retail.telecomitalia.it ([95.232.30.176]:34172 helo=[10.0.0.45])
        by gator4132.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bristot@kernel.org>)
        id 1nLt3M-003r3n-Jq; Sun, 20 Feb 2022 14:43:32 -0600
Message-ID: <9531b09c-6dc2-f551-d699-29b0c8cc2aeb@kernel.org>
Date:   Sun, 20 Feb 2022 21:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] docs: Remove duplicated words in trace/osnoise-tracer
Content-Language: en-US
To:     Oscar Shiang <oscar0225@livemail.tw>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYCP286MB1913117487F390E3BCE38B15A1399@TYCP286MB1913.JPNP286.PROD.OUTLOOK.COM>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <TYCP286MB1913117487F390E3BCE38B15A1399@TYCP286MB1913.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4132.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kernel.org
X-BWhitelist: no
X-Source-IP: 95.232.30.176
X-Source-L: No
X-Exim-ID: 1nLt3M-003r3n-Jq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: host-95-232-30-176.retail.telecomitalia.it ([10.0.0.45]) [95.232.30.176]:34172
X-Source-Auth: kernel@bristot.me
X-Email-Count: 2
X-Source-Cap: YnJpc3RvdG1lO2JyaXN0b3RtZTtnYXRvcjQxMzIuaG9zdGdhdG9yLmNvbQ==
X-Local-Domain: no
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/20/22 13:12, Oscar Shiang wrote:
> There are 2 duplicated words found in osnoise tracer documentation.
> This patch removes them.
> 
> Signed-off-by: Oscar Shiang <oscar0225@livemail.tw>

Acked-by: Daniel Bristot de Oliveira <bristot@kernel.org>

Thanks
-- Daniel
