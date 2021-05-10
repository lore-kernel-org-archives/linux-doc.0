Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E15C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C25F561152
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhEJKWH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 06:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhEJKWH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 06:22:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433AAC061574
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 03:21:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id di13so18076046edb.2
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gRUkuXLvOd629w4Wa3qbU1BWVXD7weS5ofld23M/oV8=;
        b=GNb4LYCp3rtxfKdKb0K6j/ySzrtNwKjW1EHUdfz4kWJOE/umuFGfZLd752/SD3PDP7
         UDPVey96cU/hMHDtiUPQjqyQjnlfssVNeZQipN+cH2fIfWOlDrOMyrqlMJCe0+8yNUjt
         gNKzLNj2AMicDbuvFfBkEaMpHBrqABLIpDj20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gRUkuXLvOd629w4Wa3qbU1BWVXD7weS5ofld23M/oV8=;
        b=IpJikL1o7yM5//s0cu26IQ7B9b+lKXC1i9mCNl3zVXAU3jxDjXvKMmXmmyh3p3uI46
         abbUodvEEj69+zuEuV68sGsPTp93J+EDtkbxvYcPDXJLutYBtEnHXaMoXWk4E7kQeS1D
         68TFzeqBjpOCVED2Y7SCJY5jTi7acbVZv7n9xKT1MTAl4yGNimhFs7SxgOGE1GSMPkCS
         c7YMihknMl8Kqt5Vjbplkkswtjlni0RkeuS3y6LDY0eC0h8neKVIJYQwkeM1terKaeTa
         yNqdli4KfkcNojG0I/JSVfjm4lFsnmt9zW0xFbGox1CAi/Q65RDs7I14XiwUS7VS5N6J
         t+3w==
X-Gm-Message-State: AOAM531Hvohy1MgPetg4WAGAa79UlwsPpGFrsDy+9Kk625WBjvxfDJrC
        tgxzGI1lKQrTLyDo0X6p8MEltg==
X-Google-Smtp-Source: ABdhPJxeFyFb+ZTVNxW2gxjFPEe2ruMF4COjrzjEdL03Vb9LcgJmU9AacKf6Mphif45FXxU83024BA==
X-Received: by 2002:aa7:d702:: with SMTP id t2mr28111661edq.367.1620642061055;
        Mon, 10 May 2021 03:21:01 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id c8sm10927965edy.63.2021.05.10.03.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 03:21:00 -0700 (PDT)
Subject: Re: [PATCH] docs: admin-guide: update description for kernel.modprobe
 sysctl
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210420125324.1246826-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <50761eeb-6592-ba5c-e86b-ba3efe3233ff@rasmusvillemoes.dk>
Date:   Mon, 10 May 2021 12:20:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420125324.1246826-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/04/2021 14.53, Rasmus Villemoes wrote:
> When I added CONFIG_MODPROBE_PATH, I neglected to update
> Documentation/. It's still true that this defaults to /sbin/modprobe,
> but now via a level of indirection. So document that the kernel might
> have been built with something other than /sbin/modprobe as the
> initial value.
> 

Andrew, can I get you to pick this up? It's a follow-up to what is now
known as 17652f4240f7.

Rasmus
