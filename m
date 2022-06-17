Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00EDC43334
	for <linux-doc@archiver.kernel.org>; Fri, 17 Jun 2022 13:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382507AbiFQNzt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Jun 2022 09:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382512AbiFQNzs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 09:55:48 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973343C4B8
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 06:55:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E09674E5;
        Fri, 17 Jun 2022 13:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E09674E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1655474144; bh=38vtG8F8DpATGIv38pChXBKHQbGJ3rZR5QRuShP6PvY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SnMSyTHLBj7+fwwc6sATZV0B2SdH7RLKELpg1uPEaEeL607cRXjEOLpd3BlawB8mv
         lwEv+jEvjvWG3qd9He8l/7B/hUEY/tu2rq3EOfWxkygdBBv0uNxaLnMF+6e+jt1CQS
         3yzi3yN45c0kN7O/peYRQmV2W71cgPu6F88qQbQC1SbYomeFSETx8a/3hecvYumXUS
         40zN+p1A++xyOdgiPIRpJunP8QPS8H+nCPP8Zmnd/kun5gXMSXzUmGTJkY4oYpqtcZ
         o/iAdUvFUerbh1Df82TJdCt5m54D/tKvFbyf7MeKtj3y4Ch1l9ocnUsytpzL/fzok0
         rL13Ovp8VZVpQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, chenhuacai@loongson.cn,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 7/9] docs/zh_CN: core-api: Update the translation of
 printk-format.rst to 5.19-rc2
In-Reply-To: <Yqu+x95ngy68Vu0p@bobwxc.mipc>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
 <ebfda3a43afbfb5dd0186a6e68e080dd933a4883.1655258291.git.zhoubinbin@loongson.cn>
 <Yqu+x95ngy68Vu0p@bobwxc.mipc>
Date:   Fri, 17 Jun 2022 07:55:43 -0600
Message-ID: <87pmj7qtr4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> On Wed, Jun 15, 2022 at 05:24:30PM +0800, Binbin Zhou wrote:
>> Synchronous translation from the following commits(Latest in front):
>> 
>> [1]: commit 2fbf5241a561("vsprintf: add new `%pA` format specifier")
>
> ^ this commit is from rust-next and not appeared in master or
> jc/docs-next yet, so please drop it.

An alternative is to take the changes relative to that commit (only) and
send a patch for inclusion in the Rust tree.

Thanks,

jon
