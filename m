Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C77C47080
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 23:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AC416127C
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 23:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhEaXFs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 May 2021 19:05:48 -0400
Received: from darkstar.slint.fr ([172.105.89.79]:51942 "EHLO
        darkstar.slint.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhEaXFp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 19:05:45 -0400
Received: from ici.slint.fr (men75-h08-176-172-247-100.dsl.sta.abo.bbox.fr [176.172.247.100])
        by darkstar.slint.fr (Postfix) with ESMTPSA id F3A72A374D;
        Tue,  1 Jun 2021 00:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=slint.fr; s=default;
        t=1622498623; bh=3bAlbuxlGD9uu4MDT8BvwrlQdGBjsxw8rObZYHpVlZQ=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=GfPZbHPtcyZa/8EkC1NbdA2exnzeYV6CZrGm2UE2iRy0ukzksrEOXiKHkr76JsRWA
         wo1XW26zk4fUhMAzgq4BSIRAIxh+ZoKpk5djtQ0aXGncIun1MZ3Fsp9cpeuvhCvwTz
         dwUCdkgpUr3oS+mcBXniAkqgBmKxaeo0b/TWvygPunrFM7gP6TrjFqiQW2O8m2eErD
         md5w5uhSPJah9R8MvEWOADM4yMN0MxN92eKpBbMZccFpmSzATT6aOBltzDoO4XGbag
         cdhug1rCkLYstGE7yYJD+jPLNMr8RFl0QY6XRTyp9hc56rz2oH3Hcf2pCAjtfKAE9e
         /lv50+44WM99g==
Subject: Re: docs: Convert the Speakup guide to rst
From:   Didier Spaier <didier@slint.fr>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        speakup@linux-speakup.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210531215737.8431-1-igormtorrente@gmail.com>
 <20210531220754.h4ep2dj65wl6hejf@begin>
 <393c2df8-9cb1-f428-5629-6e98c078c24f@slint.fr>
 <648b7668-1aa8-dc1d-c92e-7dfc8d3270a7@slint.fr>
Message-ID: <8a56bc62-9684-5e31-dfdb-205e81810281@slint.fr>
Date:   Tue, 1 Jun 2021 01:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <648b7668-1aa8-dc1d-c92e-7dfc8d3270a7@slint.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/06/2021 00:47, Didier Spaier wrote:
> So blind users can check its accessibility I attach the web page built 
> with rst2html5.py
my postfix MTA told me that:
linux-kernel@vger.kernel.org>
and:
linux-doc@vger.kernel.org
rejected this message because it contains an HTML part (indeed).
If someone ask I can upload it somewhere and provide a link.

Didier
