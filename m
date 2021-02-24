Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88552C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 22:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D74960233
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 22:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhBXWTr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Feb 2021 17:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbhBXWTq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 17:19:46 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504CEC061756
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 14:19:06 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id lr13so5553503ejb.8
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 14:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=esgHPFAXtJraAFZeVMnbgtLoIpVTIBSPXC2kaE9EIyo=;
        b=Bk62oPLB6TXDuzwnMS2NVq6cZU2EJ+AgM1xn5jV+9BsuyYK0qKJTJ/1QjllD0IpCIx
         C0+vR8F8imu7znz7XfUVRtxSj6vyCbzzt8h7YyWqTTT8M88zCKOKkfMeCKTG8Pdj5Ljw
         2AgNFO6k0WOlAPxrmeYAKCUVW2ktlwKBGt5JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=esgHPFAXtJraAFZeVMnbgtLoIpVTIBSPXC2kaE9EIyo=;
        b=sOwC0f2srJ1iUh2YoARZ5nboaurYmEZw50WOzAZ1BhKu8hriBw2frY+1ST+eTzVt4+
         tz7M5OlV8M65/W/BMZ8YHnHrdMUGHfoH5R+DH0TmF6WCjOIY7nC3FBmM9AnjWBvbUraU
         tJRWUlbhbf3Arxyc+xUyu90MTre4FGQDw7H9DMMO6yxzzQzyuxWhFIFW9jliyF2Myqmg
         jbPtcRJibCXTH0h9F8Np04Z83T2Amu00wZi8tdv7n+xwksbmW6OsAWWtMKHGBA7ZwPpp
         pElwMUFFFcJUqbq2fYMHOV7n4CFyQvrnxBgJ58zQYF/yJlr2wlB3/MaKZ7CoQ2ykkybO
         Jwsg==
X-Gm-Message-State: AOAM530et5iD3h85G04t0RpW5orK2mguOg7NV3ZVackYB9isDjO/e6CH
        yIwRIJKm0AMGKfhce4UtAm83Mg==
X-Google-Smtp-Source: ABdhPJxjiD5KAeODBCv+FcuEH0jO8vVbYzDx7TZOo87cBVxKIdxa0Yg5W3ud56iHmkQMwwQ8RBhiPQ==
X-Received: by 2002:a17:906:32d1:: with SMTP id k17mr33393373ejk.141.1614205144864;
        Wed, 24 Feb 2021 14:19:04 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id t19sm1987576ejs.122.2021.02.24.14.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 14:19:04 -0800 (PST)
Subject: Re: [PATCH/RFC 0/2] background initramfs unpacking, and
 CONFIG_MODPROBE_PATH
To:     linux-kernel@vger.kernel.org
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210224142909.2092914-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <e240d10c-2c81-d3f2-9973-5527297db8de@rasmusvillemoes.dk>
Date:   Wed, 24 Feb 2021 23:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224142909.2092914-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/02/2021 15.29, Rasmus Villemoes wrote:
> These two patches are independent, but better-together.

kernel test robot says I'll have to add a 0/2 patch:

linux/initrd.h: grow an include guard

[because defining a macro a second time with the same contents is ok, so
is doing another extern declaration, but a trivial static inline
definition can't be repeated sigh]
