Return-Path: <SRS0=ZijC=47=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609D2C4CECE
	for <linux-doc@archiver.kernel.org>; Sat, 14 Mar 2020 03:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C3F92074E
	for <linux-doc@archiver.kernel.org>; Sat, 14 Mar 2020 03:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W6ezz92F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCNDMz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Mar 2020 23:12:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36438 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgCNDMx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Mar 2020 23:12:53 -0400
Received: by mail-pg1-f194.google.com with SMTP id z4so353455pgu.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2020 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a4vxLIWWizY4c94tKl8VxzoeCXjGcvdAGAK/KKBIiws=;
        b=W6ezz92Fnc3Q/6TEc9BYLSA6xe+WA9hEJXfgEQZIyFIsHVOW2NBbH5DPiqAJcu5JuP
         89pFOrYQQjN250fN/yIJqbyrY/PL2EEyLT0eNefPLUNFyPanFZWHpCahR/d0OOLoVWkK
         KJRWch1vHZa9uSzMPyR92lWlIsKeosUfl0jqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a4vxLIWWizY4c94tKl8VxzoeCXjGcvdAGAK/KKBIiws=;
        b=KW626zB3DmH10UF1RnfdZaLv+CBPLFnrdeAVGUpa1+3ErzxLt8Tego3Dx7PvNF+kvy
         BjYjDMFYOFR949skTpW6US/788B3oaKVCxMLiI+4u+rIPerwnYgyLP0hThODt6gALbhd
         z0aRvtFtRPn9sc+16IhCl0IosXwJ6SsYgFD4B1KzeDkeQGBjJ1TXLHw0nJAFrLae8RIB
         CjbNgLSqAPtThRM9ZVsYirC/5YJAyL9kIwIra6R8/xoY+TwvNKkRDtlams8QLxEeBlNb
         8ApEm2ENmDT+jEym3iTzdD/GSBF1DH+vX0qVNmvsRu09X4XdZJ3Dyn++ASAH3+0byV0K
         2n3Q==
X-Gm-Message-State: ANhLgQ2jlWNlO2EVzkmbHn0CGcefvkY/Ie+Kwvu1zLRxWyXYO4xKQlo/
        +mFwmyqqnH06WE2AdBOAvDjaJQ==
X-Google-Smtp-Source: ADFU+vs4x5cG7qYmSSdMh7Lt9j4AbCiuf8O4X5jvNemXHgiKvZMzloMDqnCWSAI9GJ6X1EWvJR70AA==
X-Received: by 2002:a63:3193:: with SMTP id x141mr16084059pgx.311.1584155572098;
        Fri, 13 Mar 2020 20:12:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k3sm2188966pgr.40.2020.03.13.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 20:12:51 -0700 (PDT)
Date:   Fri, 13 Mar 2020 20:12:50 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, mcgrof@kernel.org, yzaikin@google.com,
        tglx@linutronix.de, kernel@gpiccoli.net
Subject: Re: [PATCH] kernel/hung_task.c: Introduce sysctl to print all traces
 when a hung task is detected
Message-ID: <202003132011.8143A71FE@keescook>
References: <20200310155650.17968-1-gpiccoli@canonical.com>
 <ef3b3e9a-9d58-60ec-d638-88ad57d29aec@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef3b3e9a-9d58-60ec-d638-88ad57d29aec@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 13, 2020 at 02:23:37PM -0300, Guilherme G. Piccoli wrote:
> Kees / Testsuo, are you OK with this patch once I resend with the
> suggestions you gave me?

I think so, yes. Send a v2 (to akpm with us in CC).

> Is there anybody else I should loop in the patch that should take a
> look? Never sent sysctl stuff before, sorry if I forgot somebody heheh

akpm usually takes these kinds of things.

-- 
Kees Cook
