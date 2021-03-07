Return-Path: <SRS0=pILf=IF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1EDC433E0
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 01:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D0E564DDE
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 01:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhCGBqu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Mar 2021 20:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhCGBqf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Mar 2021 20:46:35 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67051C06174A
        for <linux-doc@vger.kernel.org>; Sat,  6 Mar 2021 17:46:35 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 18so4862941pfo.6
        for <linux-doc@vger.kernel.org>; Sat, 06 Mar 2021 17:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eIq+GxVtZxarjQGt9ar6dChG4GoMdEL7HfKpoddXB5w=;
        b=SzWFkGKrayAtI9lJUISvwrA1/pqIH3r4tIVebwx79MAbKzn3gScTuBcZr2U/Axvw30
         3zUUGfXqOsc5lOhyIhOS5wVpgc6SU7koqRXRPUpHFK1Y9JXQg1pUd/SY0hmR2cE+/YpL
         oi368sfnuMZbeQXgXUuxq/ajNlRmx8jylFjww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eIq+GxVtZxarjQGt9ar6dChG4GoMdEL7HfKpoddXB5w=;
        b=pFRq6k6IEXGklx+peQzTafI3s53M+K+ha3ehouI0h95vnowuwTSJOrWLi7qwCbPrrC
         m83ZtiUDctPSnBwd1PoClbEX22MTRkonFN2Ur6V+Lc21COakIN6L2exQZ3J742fsli4T
         3rFKk9A+RwXg7wKeNylRhlnWchievBpbeE3Wfx6zfbukQ7vZoBDxKeE1J7dZA9iGC2xs
         rPV7Y025z7Z2UAD71BBznwXTM6AFcEcGWrX0ehgjHxTFXIeecxgRuKw+xj1uncLQ7507
         qU+pBoL6ZoDYkTMp1lcxUEvICP9hFTl0MsD5IzA1I7b/XYf7hNwu9X0D9UNMYgkCcvCn
         N/tQ==
X-Gm-Message-State: AOAM533yhj6x+N5o5gyrLkweclfLfYsyHdlgTT4+QjsvdXujk7x5DEkF
        lzP+ObVfr2x2PYs0uoPaJ3OF1A==
X-Google-Smtp-Source: ABdhPJxvOId0xV4z5En2NoX4D88nEpafSAWG3lFdNrujJKbKDZowLVaivo8Q6ydJqkIiPsTlhzNFGg==
X-Received: by 2002:a63:ee4e:: with SMTP id n14mr14862459pgk.422.1615081594653;
        Sat, 06 Mar 2021 17:46:34 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id 35sm6053061pgm.64.2021.03.06.17.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 17:46:34 -0800 (PST)
Subject: Re: [PATCH] Expose the bus kernel docs to the build docs.
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210307013301.39420-1-wt@penguintechs.org>
 <20210307014445.GT2723601@casper.infradead.org>
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <80cc4102-2abd-21e8-2140-a54919da3f3d@penguintechs.org>
Date:   Sat, 6 Mar 2021 17:46:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307014445.GT2723601@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for the feedback. I will cut another patch in a sec.

On 3/6/21 5:44 PM, Matthew Wilcox wrote:
> Do you want to put a heading in front of it?  I did this in xarray.rst:
> 
> Functions and structures
> ========================
> 
> .. kernel-doc:: include/linux/xarray.h
> .. kernel-doc:: lib/xarray.c
> 
> Also, I see that drivers/base/bus.c is included in
> driver-api/infrastructure.rst, and I feel that they should probably be
> included together?
