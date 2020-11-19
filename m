Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2812DC2D0E4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 09:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4380246DC
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 09:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgKSJmp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 04:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgKSJmp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 04:42:45 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2670AC0613CF;
        Thu, 19 Nov 2020 01:42:45 -0800 (PST)
Received: from ip4d149f6e.dynamic.kabel-deutschland.de ([77.20.159.110] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kfgSf-00025U-8V; Thu, 19 Nov 2020 10:42:41 +0100
Subject: Re: [RFC PATCH v2 21/26] docs: reporting-bugs: details on writing and
 sending the report
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1605203187.git.linux@leemhuis.info>
 <f01ecda5c1509643f6543a6e2dd5a4cbaa1ee420.1605203187.git.linux@leemhuis.info>
 <20201118171727.5105df6a@lwn.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <eade01af-a188-9268-c866-45545d0e5b26@leemhuis.info>
Date:   Thu, 19 Nov 2020 10:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171727.5105df6a@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1605778965;49cc2f06;
X-HE-SMSGID: 1kfgSf-00025U-8V
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 19.11.20 um 01:17 schrieb Jonathan Corbet:
> On Thu, 12 Nov 2020 18:58:58 +0100
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
>> That's also why this commit removes scripts/ver_linux as well: the
>> details it collects are only needed in some situations. And some (a
>> lot?) distributions do not ship it anyway; a better, more modern script
>> would likely resist in tools/, which would increase chances that distros
>> shipping it as part of packages like "linux-tools".
> 
> [...] It's been patched a couple of
> times this year, so somebody is paying attention.

Ugh, why haven't I checked for this? Argh :-/

>  Probably safest to just leave it there.

Agreed, thx for pointing it out.

Ciao, Thorsten
