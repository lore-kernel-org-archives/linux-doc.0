Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F44C48BDF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:04:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A57B460D07
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:04:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFOHGW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhFOHGV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 03:06:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DBEC061767
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 00:04:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ce15so20701112ejb.4
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dDnQ3QB85Gn0cKZby7/Zyyqy1Rp705LyOrTbTWC8ZPg=;
        b=BNXSp1FC5dsQako8AGyvJ9xttO365TYOfFn539Gixzqm/BCff/vdPVwUM4GbjAQYoY
         2e/io92co05F0YLDiT39LlhlRVx6X8pz1JtgMkgdjiYFlg1j8IRUr5fJb/CnxgmBUGdY
         LJ/WtLiTjVxPoqnQ06csdwdungVOZ7inbWwn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dDnQ3QB85Gn0cKZby7/Zyyqy1Rp705LyOrTbTWC8ZPg=;
        b=b6V9kE+9qwj5VKXWZbeQYiLFeQDNoCsl5VltQypxXMbWW2uIj/3N2N26hiTNcPwplc
         JNWLMYRrkz4jg6MYiOLP1jkbbzaCgzcmKZp92uGLQca0jEoIVoeRbDDAzHEWARSWQp3B
         lnVf0XD4ujcblFSPAfGiMalXUX1DsLLpLtQFzGRBv7caXktl+9jO51+db2WO6C18W1Dp
         fBfw+Ai4VaB8dyPD8wGchXZT1Ttg2pQGtxtFuzDUXoHZjKx1hXWuVMFbTLMDnHtolPaP
         DPDGM4YaDwfbEfQPttYpaoxwXmk7kJTZyKDV2D+CQ+EGTVgkG6XgDyQKYBa9TFDuY1N7
         Nkwg==
X-Gm-Message-State: AOAM530l9rNj/DKNMrAs1+KRAQjsArnwnvjhu62+aS5f5HA0tmmOgLyk
        rfUfny/b4Oxjp7WTtFq+xWqQWA==
X-Google-Smtp-Source: ABdhPJz2rYXOmm/RyorN5PFLvvAsFPaRuC6CUfRKW6ne7tY3dOolyAiJP3+xZ0C2UThkvIMfIzV3YQ==
X-Received: by 2002:a17:906:b855:: with SMTP id ga21mr19303912ejb.550.1623740654543;
        Tue, 15 Jun 2021 00:04:14 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
        by smtp.gmail.com with ESMTPSA id m7sm7448455ejo.95.2021.06.15.00.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 00:04:14 -0700 (PDT)
Subject: Re: [PATCH RFCv3 2/3] lib/vsprintf.c: make %pD print full path for
 file
To:     Justin He <Justin.He@arm.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
References: <20210611155953.3010-1-justin.he@arm.com>
 <20210611155953.3010-3-justin.he@arm.com>
 <35c35b55-3c58-59e8-532a-6cad34aff729@rasmusvillemoes.dk>
 <AM6PR08MB4376F90B594C5134302A830AF7309@AM6PR08MB4376.eurprd08.prod.outlook.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9c18bf38-b04b-b4b6-d5f4-ae95cd3c33ce@rasmusvillemoes.dk>
Date:   Tue, 15 Jun 2021 09:04:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB4376F90B594C5134302A830AF7309@AM6PR08MB4376.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 15/06/2021 08.43, Justin He wrote:
> Hi Rasmus
> 
>> -----Original Message-----
>> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>

>> Why the !buf check? The only way we can have that is the snprintf(NULL,
>> 0, ...) case of asking how much space we'd need to malloc, right? In
>> which case end would be NULL+0 == NULL, so buf >= end automatically,
>> regardless of how much have been "printed" before %pD.
> 
> My original purpose is to avoid any memory copy/move for kvasprintf->
> vsnprintf(NULL, 0,...). But as you said, this can be folded into the case
> buf >= end.
> Do you think whether following case should be forbidden?:
> vsnprintf(NULL, 8,...).

That is an obvious caller bug. The caller tells vsnprintf "here's a
buffer of size 8 at address 0x0". And checking buf for NULL in the guts
of %pD would anyway be completely pointless as it would crash for a fmt of

"x%pD"

or basically anything at all before %pD because those specifiers (or
literal parts) would cause a write to buf - and if that somehow
survived, the buf %pD would be given would now be (void*)1L.

>> Now you're passing p to string_truncate or string_nocheck, while p
>> points somewhere into buf itself. I can't convince myself that would be
>> safe. At the very least, it deserves a couple of comments.
> 
> When code goes here, the buffer space must be as follows:
> |.........|.........|
> buf       p         end
> 
> So string_nocheck is safe because essential it would byte-to-byte copy p to buf.
> 
> But I agree comments are needed here.

Yes, because no matter how string_nocheck happens to be implemented
today, some day somebody might throw in a memcpy() or do something else
that means overlapping "buf" and "s" arguments are suddenly broken in
some configurations or arches.

Rasmus
