Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D07FC4321E
	for <linux-doc@archiver.kernel.org>; Sun,  4 Dec 2022 05:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiLDFXH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Dec 2022 00:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiLDFXG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Dec 2022 00:23:06 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D1B15812;
        Sat,  3 Dec 2022 21:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=dgVHt+Jd1knxNFHv/jVEXESp4GJac+4zUYs1MQ65XWs=; b=xZuqYWvOiIHPghtfhYjyCTe+1F
        bpUGArRGm8TdFVhu4DF/BMYnf0WceSp0j4iakE4kR5QIyexhnDRRSkCbwnV2RZ/wDU/KJAZRQj2wz
        AEgpMbQ1eMawE151CebeAQMuhjJ4wNm2FTNVh6TN8FezMAvDCDqLQkIlq4jYW2Cku61cnBkIdk3oH
        K3Gm+Ww0aAnszA3UTHJxqI4qchgD3NfpN6m19UiVbzkmo98Nhxl4vlvTJywiQdWbLcIgbL+bfTLR4
        MvuX69iGAXLN+NhIbcFxzuJ6ySxMIbr5YP8XLLnfeYM2e8gtaZt/5UT7atTEjvNMnTGwXNcH5sueV
        WuX5uzTA==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1p1hSy-006Z1m-Ev; Sun, 04 Dec 2022 05:23:04 +0000
Message-ID: <79d34265-06c3-cf7d-05bd-755e4d4115c5@infradead.org>
Date:   Sat, 3 Dec 2022 21:23:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] Documentation: admin: move OOO entries in
 kernel-parameters.txt
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20221204013050.11496-1-rdunlap@infradead.org>
 <Y4wdsB1XR5GBMKIx@debian.me>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Y4wdsB1XR5GBMKIx@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 12/3/22 20:10, Bagas Sanjaya wrote:
> On Sat, Dec 03, 2022 at 05:30:50PM -0800, Randy Dunlap wrote:
>> Do not backport.
> 
> Why? Why don't you want this to be AUTOSEL-ed for stable?

I just don't think it's worth it, but I'm not absolutely opposed to it.

>> diff -- a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -378,18 +378,16 @@

> 
> LGTM, thanks!
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 

Thanks.

-- 
~Randy
