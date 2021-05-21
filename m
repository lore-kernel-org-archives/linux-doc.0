Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F87C47078
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 15:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98EE8613E4
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 15:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbhEUPTF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 11:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55880 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233019AbhEUPTE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 11:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621610261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RoYhqqzDmicG8nqQq3Z4gKK4A7xeq01hKkih7BDgRQQ=;
        b=ft9ZK1OdfWrKyq9meeUi4dHcrWBmWZLdb6pzmKtfmoGz0/LqUhqXKF2HrVTpnHi+iB4g8x
        cV2lLEEGboDew9L9Ip1fMRL7AkhCearjZXb7XkFS9lsJoVRYuuzx05MiKgbWC3nOh/tb8z
        uej/osjKvH3jTf51Sup28hXdtSC3XCU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-nX2GgarJOCCk_xEvN4zZUw-1; Fri, 21 May 2021 11:17:39 -0400
X-MC-Unique: nX2GgarJOCCk_xEvN4zZUw-1
Received: by mail-qt1-f197.google.com with SMTP id 1-20020aed31010000b029019d1c685840so15719120qtg.3
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 08:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RoYhqqzDmicG8nqQq3Z4gKK4A7xeq01hKkih7BDgRQQ=;
        b=QRmHbRcMV/W0jwkxJ1nhmNG83LgPEpy7mKpXn7/+vDocgiLgbtTE3IepOkm4RtQcwn
         p8Rzn3aHEicGYhaLFbclF4VMVTXoZeyTW1JCdf+CtZM36bA9nqO5wSlI9sSRH4bBBHVc
         ur8pmad20XEDUjpQgvM9ZU1jHbezJ6jx6kN2ldtGM840e2f+FRZd7oFDTKpbo8k2wbRo
         DUY7lRlZ0PqnUOUBS3Vold35FSsW82UfLEPIxJ26mbq83Q2aTbPN6LPNWVULunvybQoO
         N4PWRTqCX2RmcJi2V6Stv/I9wwutnaVf944r2TU/cw0UW0lu+CCaexNofbmmsJdxp0t+
         Z1GA==
X-Gm-Message-State: AOAM530SJIS96Sd8PXlRGijk1VaqrBQ6BdiHH35hRcwfG8VIBfC5TQj3
        O4K5LB4zZdbdotFLLE9UNB8cf09uB06LzRVNFYSvMacpMTtvsu6aE4ZFsNVo3Po2Auzrt7VKrI9
        fCAF++I9BqoFE9OOKr9Sw
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr11877211qtd.167.1621610257592;
        Fri, 21 May 2021 08:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEIsyCtsBuBfdyij3/7qNA1kAHeoRXkFlZHhVZ8IT4lYajSTtySLt1mT2P9dgK6jTZwptx/g==
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr11876953qtd.167.1621610254177;
        Fri, 21 May 2021 08:17:34 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id k125sm5038764qkf.53.2021.05.21.08.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 08:17:33 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] docs: lockdep-design: correct the notation for writer
To:     Xiongwei Song <sxwjean@me.com>, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
        corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Xiongwei Song <sxwjean@gmail.com>
References: <1621578594-13237-1-git-send-email-sxwjean@me.com>
Message-ID: <e0c0302f-e63f-7eba-872b-85e21b0b1622@redhat.com>
Date:   Fri, 21 May 2021 11:17:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1621578594-13237-1-git-send-email-sxwjean@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/21/21 2:29 AM, Xiongwei Song wrote:
> From: Xiongwei Song <sxwjean@gmail.com>
>
> The block condition matrix is using 'E' as the writer noation here, so it
> would be better to use 'E' as the reminder rather than 'W'.
>
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   Documentation/locking/lockdep-design.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/locking/lockdep-design.rst b/Documentation/locking/lockdep-design.rst
> index 9f3cfca..c3b923a 100644
> --- a/Documentation/locking/lockdep-design.rst
> +++ b/Documentation/locking/lockdep-design.rst
> @@ -462,7 +462,7 @@ Block condition matrix, Y means the row blocks the column, and N means otherwise
>   	| R | Y | Y | N |
>   	+---+---+---+---+
>   
> -	(W: writers, r: non-recursive readers, R: recursive readers)
> +	(E: writers, r: non-recursive readers, R: recursive readers)
>   
>   
>   acquired recursively. Unlike non-recursive read locks, recursive read locks

I would say it should be the other way around. Both W and E refer to the 
same type of lockers. W emphasizes writer aspect of it and E for 
exclusive. I think we should change the block condition matrix to use W 
instead of E.

Cheers,
Longman

