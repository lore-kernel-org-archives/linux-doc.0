Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41244C2D0E4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 10:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA6C42220B
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 10:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgKSK0I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 05:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgKSK0I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 05:26:08 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0624C0613CF;
        Thu, 19 Nov 2020 02:26:07 -0800 (PST)
Received: from ip4d149f6e.dynamic.kabel-deutschland.de ([77.20.159.110] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kfh8e-0006XQ-Q0; Thu, 19 Nov 2020 11:26:04 +0100
Subject: Re: [RFC PATCH v2 08/26] docs: reporting-bugs: make readers check the
 taint flag
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1605203187.git.linux@leemhuis.info>
 <d21b7ead04852d3de7dd6892fe5e27aca1f345ff.1605203187.git.linux@leemhuis.info>
 <20201118170547.4fabd38b@lwn.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <90ffa1af-29b1-49d9-a62b-628fc651a761@leemhuis.info>
Date:   Thu, 19 Nov 2020 11:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118170547.4fabd38b@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1605781568;7a9f01fc;
X-HE-SMSGID: 1kfh8e-0006XQ-Q0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 19.11.20 um 01:05 schrieb Jonathan Corbet:
> On Thu, 12 Nov 2020 18:58:45 +0100
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
>> +If your kernel is tainted, study
>> +:ref:`Documentation/admin-guide/tainted-kernels.rst <taintedkernels>` to find
>> +out why. Try to eliminate the reason. Often it's caused by one these three
>> +things:
> 
> One little detail that jumped at me just now: the automarkup extension now
> understands Documentation/whatever and makes a cross-reference, so there's
> no need for an explicit :ref: for those.

Ha, cool, thx for the tip, will adjust accordingly!

Ciao, Thorsten
