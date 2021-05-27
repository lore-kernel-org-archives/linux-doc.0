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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B6CC47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 13:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AF23613BC
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 13:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbhE0Njl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 09:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51925 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236470AbhE0Nji (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 09:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622122685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tVBXSCO27kLxA3llmYVew8byKCUgpzvuP+dEf6X37dg=;
        b=KDlMB+PyHUwiUqHhOF1+r7vuEaB0EOsVj46OXrkMwW4slEO0bgE3sP7uU/M1gi49K8ZrKY
        zVExdBu1WEObo6cq4EiBYHmFZudemh9ThB9GbJnSxRPhp7CQOXgcJdLzzlVlyJUKnfIqxM
        1UUFlfE99hpvshqf23MK3Kg0PLujjiU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-jSIIKHbvO2WdRp173S0fMw-1; Thu, 27 May 2021 09:38:03 -0400
X-MC-Unique: jSIIKHbvO2WdRp173S0fMw-1
Received: by mail-qt1-f197.google.com with SMTP id f3-20020ac849830000b02901e0f0a55411so144376qtq.9
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 06:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tVBXSCO27kLxA3llmYVew8byKCUgpzvuP+dEf6X37dg=;
        b=R7THW/kg5hXa4Rhyyw4RFTgrjM2CGyABTxge+vW/ds8h+IzDgfAmfzpStB2IhzYf6s
         XwSiicwVtuaBXkObko9mERFryIXC6qEqVaYjcEJP/f2q0YKLG81AusYJfhnLKp4olZ73
         X1cesGEYZ0khDOxeCJQOk656Z2vFOTaVNEp6NuKgEDs+ZhpJ7EgikBMUTRLTmYtilZCS
         aHkitmoOcz+G2wSX2rIEI56vERBQ7AI52in4jkqlbDEQ/lMkvhphM+/s+7AYaDfLU0Wl
         dY4mwjc6WCkyV6gz/eMoA5ewRwCugE4vz35IxI34pD+OBmN382nA/nvtEeMyDJ174c0i
         5Jbg==
X-Gm-Message-State: AOAM533onHeie2urvJAU7fQkXYvgsr/kD8m8x9alPfY6zZxVU8BqjZmB
        lOPWK5cYCpsTysGgNUTFHvuKZPFYFZ7sTkyx8PmOsar8gzfxG4+vO216/uUHk0ou3S/UdVkH4FD
        4KNNa5/T/z9qs8ykyvoq2
X-Received: by 2002:a37:9fce:: with SMTP id i197mr3506574qke.227.1622122683278;
        Thu, 27 May 2021 06:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTEZQ/wu8kPy0HDlDUPe9PBB+lF70tkpeywGi82+RHai09/oiu4Y+5Ri0mD41XjBiUsoSWGA==
X-Received: by 2002:a37:9fce:: with SMTP id i197mr3506551qke.227.1622122683041;
        Thu, 27 May 2021 06:38:03 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id 11sm1386020qtt.0.2021.05.27.06.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 06:38:02 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] docs: lockdep-design: improve readability of the block
 matrix
To:     Xiongwei Song <sxwjean@me.com>, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiongwei Song <sxwjean@gmail.com>
References: <1621868745-23311-1-git-send-email-sxwjean@me.com>
Message-ID: <6677ed15-4ae3-650d-bbfd-5b5436f3741b@redhat.com>
Date:   Thu, 27 May 2021 09:37:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1621868745-23311-1-git-send-email-sxwjean@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/24/21 11:05 AM, Xiongwei Song wrote:
> From: Xiongwei Song <sxwjean@gmail.com>
>
> The block condition matrix is using 'E' as the writer notation, however,
> the writer reminder below the matrix is using 'W', to make them consistent
> and make the matrix more readable, we'd better to use 'W' to represent
> writer.
>
> Suggested-by: Waiman Long <llong@redhat.com>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   Documentation/locking/lockdep-design.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/locking/lockdep-design.rst b/Documentation/locking/lockdep-design.rst
> index 9f3cfca..82f36ca 100644
> --- a/Documentation/locking/lockdep-design.rst
> +++ b/Documentation/locking/lockdep-design.rst
> @@ -453,9 +453,9 @@ There are simply four block conditions:
>   Block condition matrix, Y means the row blocks the column, and N means otherwise.
>   
>   	+---+---+---+---+
> -	|   | E | r | R |
> +	|   | W | r | R |
>   	+---+---+---+---+
> -	| E | Y | Y | Y |
> +	| W | Y | Y | Y |
>   	+---+---+---+---+
>   	| r | Y | Y | N |
>   	+---+---+---+---+

Acked-by: Waiman Long <longman@redhat.com>

