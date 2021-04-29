Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60565C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 16:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27788613B0
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 16:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbhD2QQt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 12:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbhD2QQt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 12:16:49 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159EAC06138B
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 09:16:03 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 273852E0;
        Thu, 29 Apr 2021 16:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 273852E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1619712962; bh=MPWS5rZ68JpJHYVnh4HvW6j73faZU8AwOJxXpE8TmlE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=hLbGI7a+EszURBQ/VDQYIQ5XfsczwLRXk3fnsx5NSQEO+EyY+5wHIwVmeKICetNr4
         8WvJM/ERrCr5e0QePzul3Q1UmxX7QlQ/RR6aFaH9Zq03zAXRBSBIM4KZTDzXqVpmYX
         E7vdwyybHtcnifTPIvZfStomNaSwoGQaPJBd9fseYZusXgoFi1vpee5lyrI9fszKcK
         o0MVjmL502tw9cd4Gia+NnCaiGM70WcXTqLgoUjx1bDhliXhgIJYkGwDNX54PCBnwG
         GkbWue1ULDTVyY9YoXa2oNR96tS4n9CyhDazjKCuKz2c62jQMVK6qnLYBngKSEzTIl
         CDCLfCFKBiSDg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: Re: [PATCH 1/3] docs/zh_CN: add parisc index translation
In-Reply-To: <20210429151058.GA23087@bobwxc.top>
References: <cover.1619665430.git.siyanteng@loongson.cn>
 <7e64ac33597d69635497b03b29d63e17f905c96f.1619665430.git.siyanteng@loongson.cn>
 <20210429151058.GA23087@bobwxc.top>
Date:   Thu, 29 Apr 2021 10:16:01 -0600
Message-ID: <87v985cbi6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Wu X.C." <bobwxc@email.cn> writes:

> On Thu, Apr 29, 2021 at 11:33:33AM +0800, Yanteng Si wrote:
>> This path translates Documentation/parisc/index.rst into Chinese.
>> 
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
>
> PA-RISC docs are silent, lastest practical activity on 2013-07-09.

Indeed...PA-RISC in general is not a hotbed of activity these days.  Is
there some need in particular that is driving this translation?  The
work is there and I'll apply it, but I do wonder why...

Thanks,

jon
