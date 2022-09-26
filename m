Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18137C6FA82
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 23:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbiIZXAA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 19:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiIZW77 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 18:59:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A1AA1A74
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 15:59:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9497C31A;
        Mon, 26 Sep 2022 22:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9497C31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664233198; bh=2DgAMv+bWxo4zcSCOzPbTljElwjz2mqzj3P2B984Occ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dylPv9mTd9EY/0T9jxu0shEf7jL2AkzwUHur30F4MY1YK/nEq4qu6+Qjf48oxbr5e
         mbFyTIB1S6hqwTTTfri7wbQ5gXNhC57Wnb8au4/0WkQo82QZ4FpQ9Visd+5BVFcuZn
         hepMJGhbqlzlXnbFdWCy9lzydczpq8bK12+VpVWN+Iss2ZUS8voUTmfluSvO997R1r
         /wRKp/iR7ZVhhH9wt72UcBRsnDqKMp2FWQTZx3br0MKgGxBoX8NTTNRPnn1tWEYBvG
         dn4Vye40H3q17c1jusECCqKwe1yd9NhINFDVYtdm+8PYOivOQiY2TJh6nnEJfVWBy+
         XKIn1xdUNxjSw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     chenhuacai@loongson.cn, bobwxc@email.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 0/4] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 1)
In-Reply-To: <f5d792cb-133b-189d-4aaf-8523eaae6b44@loongson.cn>
References: <cover.1660881950.git.zhoubinbin@loongson.cn>
 <f5d792cb-133b-189d-4aaf-8523eaae6b44@loongson.cn>
Date:   Mon, 26 Sep 2022 16:59:57 -0600
Message-ID: <874jwtrbbm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> writes:

> Ping?

Hmm...  This was still sitting in my docs folder...I *think* maybe I was
waiting for reviews, but of course it already has those.  I've applied
the patches now, apologies for the delay.

Thanks,

jon
