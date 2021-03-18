Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C1C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 17:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DC9864EF2
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 17:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhCRRIy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 13:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbhCRRIb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 13:08:31 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8216FC06175F
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 10:08:31 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id l1so1853983pgb.5
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ujDbuCzAN+YLNYYi8/HDfmgkpZHJOtMkPUu0MD84H14=;
        b=BFzQr8bJm/ZNyI6XHmJ4i3xuf4M+X5mAwVbg7D6tWIxiI8ZCIGyucPo90h/LfUox5/
         bABSvLMpq0WKCgE2zsxgnc4y2/ccGXTJBSc6+TzeJkEqurYKBDN9T+76qt7EGpMHk//o
         9PpZQBYHKUj3F6z3PWYRYxCOGAPDww7+p4CRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ujDbuCzAN+YLNYYi8/HDfmgkpZHJOtMkPUu0MD84H14=;
        b=eH5h7EmpIT/sBlZhCAGhqbBAYR3x2wza//6yx5+3YdVpqbdz7XeV/tjWfF1shyO7kW
         YIwNl9568OAjR2NIbNmasHNvpkvAdCpWwnELH9qu0SrJydM6jaEFH4fkrkmIEsd9iZ3T
         hUMWHIhVFUDG7zwjBU2SweKRTJjFfphzpm5L4OqqG9Zbymgn98L16idhMb1IrWPrXtXG
         HQNYpsUbD51gPgqPODNUwU22gWD0bZx5rOy1PNenPJALr1PcqSmfTv2Xj6Tb+Ok+ki3d
         utH3vn15SJHmQH871+GhSVJbOyqcKFKv6eT71s7uqajnLAr3Vh58zSmb9n5QUnBupFux
         Jv9Q==
X-Gm-Message-State: AOAM533ulUegUj+Ic25Lrpzjjh1hKH4OpetD7+nxu/kaef1bFnnQNTdA
        lJr8YRninRJY1aiGDlDuPFkrFQ==
X-Google-Smtp-Source: ABdhPJycuac0e0voT5If8aAn21pk9Q9lKAxNTmoy4nmVnKUyybmi18zoXEcWvQWsGih0sCZ2JrRVbA==
X-Received: by 2002:a05:6a00:2da:b029:202:7800:567 with SMTP id b26-20020a056a0002dab029020278000567mr4825125pft.71.1616087311096;
        Thu, 18 Mar 2021 10:08:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a8sm3004546pfk.138.2021.03.18.10.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 10:08:30 -0700 (PDT)
Date:   Thu, 18 Mar 2021 10:08:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>, linux-mm@kvack.org,
        akpm@linux-foundation.org, cl@linux.com, penberg@kernel.org,
        rientjes@google.com, iamjoonsoo.kim@lge.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: Add slub_debug option to panic on memory
 corruption
Message-ID: <202103181007.BD08B37D00@keescook>
References: <20210309134720.29052-1-georgi.djakov@linaro.org>
 <390d8a2f-ead9-48a9-99eb-65c73bd18422@suse.cz>
 <6bfebf01-5f52-49bd-380b-04785c474c81@linaro.org>
 <8fd43de6-71e4-cfe7-8208-32753cf1c363@suse.cz>
 <202103172244.D5ADB06A96@keescook>
 <ea740a0a-6225-3d6c-095d-1c456e497e3a@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea740a0a-6225-3d6c-095d-1c456e497e3a@suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 18, 2021 at 01:56:05PM +0100, Vlastimil Babka wrote:
> I was going to suggest adding a panic_on_taint parameter... but turns out it was
> already added last year! And various memory corruption detections already use
> TAINT_BAD_PAGE, including SLUB.
> If anything's missing an add_taint() it can be added, and with the parameter you
> should get what you want.

Ah-ha! That works too. I hadn't seen that -- I wonder if I can wire some
other hardening things up to that. (e.g. refactor BUG_ON_CORRUPTION
finally.)

-- 
Kees Cook
