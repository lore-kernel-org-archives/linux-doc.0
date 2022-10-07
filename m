Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1717CC433FE
	for <linux-doc@archiver.kernel.org>; Fri,  7 Oct 2022 08:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiJGIyv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Oct 2022 04:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJGIyt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Oct 2022 04:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5F611819
        for <linux-doc@vger.kernel.org>; Fri,  7 Oct 2022 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665132880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=erTMAY0Lz1mBTM5QiEVhhkwV7oze28OkA0csFjC86zk=;
        b=I6a8ugkvSOCUnReQ3bECFZSeXJip/9ZuzJWf1ItcXtHV9qyoAsGVFc4lS5IYB/EQI7e423
        dlsvun8v/YQq63+f+aiLIlDPG5bDYEUUZ+ZJC4oiU8N0NnsjzSypBWhvLR4yHXgJiw7aVe
        v3dDYMXeRJ85PaDCvXZU8tGHSfI7eBQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-F0apExtIPtmV-jfiLPeGbQ-1; Fri, 07 Oct 2022 04:54:36 -0400
X-MC-Unique: F0apExtIPtmV-jfiLPeGbQ-1
Received: by mail-wm1-f70.google.com with SMTP id n32-20020a05600c3ba000b003b5054c71faso4006126wms.9
        for <linux-doc@vger.kernel.org>; Fri, 07 Oct 2022 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=erTMAY0Lz1mBTM5QiEVhhkwV7oze28OkA0csFjC86zk=;
        b=nbuAL0/+JQzuk1DJ23Yi5XPFg7rqyI/njyE+Ww5SjgSwkQdkGd50Ndhirs0ch/wDvc
         JcJr8KCfAhxmDW+vVq4LdLOfz8o7vhQe8sxGPI62hHQqVj32YUvZVscNvXwy/WwGLZYG
         cSaSnPIOiZL4eMu0k4e7Odyau4qSSenQmhVMlsU9G9EPLaSntowyMPPirFinneZq5wFk
         7FUz0Fjc0ED2TArgxbQvwvQVdv6jsUm1NEo+IKAVW0OE2seyYD02+GTJV4z4+uwDjj+z
         Rb+/BR6Jsw5/EFwB81isCK1aFGowCQW5pS98sCO72oVJAIifFupPTx4GRWJXshHHzuuU
         xtPw==
X-Gm-Message-State: ACrzQf379iPO+TVOmmafbYvVpMUAD2B9BaYQPcdlgVKTLlD/TpK/+cj1
        ARRK6uXCHiMWS9cMyu2QTtSgDsZhpgqCCk6+Y9TQUM9NHqX0lJzvtkcgkk9WgnNdYRoDgykMR9G
        lYe1vjdFSkQju3yiqkWX1
X-Received: by 2002:adf:a3da:0:b0:22c:d73b:38a5 with SMTP id m26-20020adfa3da000000b0022cd73b38a5mr2354748wrb.541.1665132875089;
        Fri, 07 Oct 2022 01:54:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DF1bSRv8hQLgWk5KKniXnteS+urv1Jd80jb6Ho4Z//modUXSHY7aP8w9k2YsEdsxR69AeaA==
X-Received: by 2002:adf:a3da:0:b0:22c:d73b:38a5 with SMTP id m26-20020adfa3da000000b0022cd73b38a5mr2354728wrb.541.1665132874854;
        Fri, 07 Oct 2022 01:54:34 -0700 (PDT)
Received: from localhost.localdomain ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d64a3000000b00228cbac7a25sm1505933wrp.64.2022.10.07.01.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 01:54:34 -0700 (PDT)
Date:   Fri, 7 Oct 2022 10:54:31 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        ecree.xilinx@gmail.com, stephen@networkplumber.org, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v2 3/7] net: add basic C code generators for
 Netlink
Message-ID: <20221007085431.GA3365@localhost.localdomain>
References: <20220930023418.1346263-1-kuba@kernel.org>
 <20220930023418.1346263-4-kuba@kernel.org>
 <20221006125109.GE3328@localhost.localdomain>
 <20221006075537.0a3b2bb2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006075537.0a3b2bb2@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 06, 2022 at 07:55:37AM -0700, Jakub Kicinski wrote:
> On Thu, 6 Oct 2022 14:51:09 +0200 Guillaume Nault wrote:
> > > v2: - use /* */ comments instead of //  
> > 
> > Probably not a very interesting feedback, but there
> > are still many comments generated in the // style.
> 
> It's slightly unclear to me what our policy on comments is now.
> I can fix all up - the motivation for the change in v2 was that
> in uAPI apparently its completely forbidden to use anything that's 
> not ANSI C :S

I didn't realise the v2 comment was for uapi headers only. So I was
surprised to see // comments in the generated files.

> Gotta keep that compatibility with the all important Borland compiler
> or something?

Personnaly, I like the /* */ style, but I don't think my personnal
taste should influence this patch set. I genuinely thought you wanted
to convert all comments, hence my feedback. Feel free to ignore it :).

