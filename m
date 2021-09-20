Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33F5C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 16:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE2F461163
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 16:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242378AbhITQTv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 12:19:51 -0400
Received: from relaydlg-01.paragon-software.com ([81.5.88.159]:60443 "EHLO
        relaydlg-01.paragon-software.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229530AbhITQTi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 12:19:38 -0400
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Sep 2021 12:19:37 EDT
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
        by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 297CB808E5;
        Mon, 20 Sep 2021 19:10:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paragon-software.com; s=mail; t=1632154249;
        bh=xdgmEPYnHFaxg6xjvhwcByKV5eW4B3sKzJ1mZsaWWyM=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=lLQgKepIfwlPTl3CZM9B6UUsgYhWaJO7iRFfOnOZ4/y1IbV2uhu1SZNALyZ/VaAdS
         8Lx/bhUIpxCQvqMlcPGpJKTHCJrcWxn5JbwLV9fKh0kHFQxAhoe7qZLQoOHNR7Shm7
         qFhRE2+PdmiGUKo4O94QqCU19wC+HKVdCbQ7TyvQ=
Received: from [192.168.211.150] (192.168.211.150) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 20 Sep 2021 19:10:48 +0300
Message-ID: <e0ccb847-a8a6-d011-87fc-bd3674b047c1@paragon-software.com>
Date:   Mon, 20 Sep 2021 19:10:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] Doc/fs/ntfs3: Fix rst format and make it cleaner
Content-Language: en-US
To:     Kari Argillander <kari.argillander@gmail.com>,
        <ntfs3@lists.linux.dev>
CC:     Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210909215753.34138-1-kari.argillander@gmail.com>
From:   Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210909215753.34138-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.150]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10.09.2021 00:57, Kari Argillander wrote:
> Current ntfs3 rst documentation is broken. I turn table to list table as
> this is current Linux documentation quide line. Simple table also did
> not quite work in our situation as we need to span rows together.
> 
> It still look quite good as text so we did not loss anything. This will
> also make diffing quite bit more pleasure.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---

Applied, thanks!
