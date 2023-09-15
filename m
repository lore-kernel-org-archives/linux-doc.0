Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9082CD37AD
	for <linux-doc@archiver.kernel.org>; Fri, 15 Sep 2023 20:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbjIOU6F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 16:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237770AbjIOU5o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 16:57:44 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115CE9B
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 13:57:00 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68bed2c786eso2419306b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694811419; x=1695416219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5BeJTKQ+1ikY10aMboTw9qo9cYRheGp8DXKbuRu77g=;
        b=UdLc2GKFGvI+Ek1td0zQybW6j6P5quhJ5s7rdIX2aH+2u5dtS0lXjvRInGTYK0GAqY
         U64H5IuTz0RbI1cBBe1J6t4XMTM+Rnm7F1+K20a3WUAhV+iGZ/x0qN3sOcY3uWlOIF01
         iLuvHtJ/n5JYAPpB8bAmuYWWiE5v3fPoYLfhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694811419; x=1695416219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5BeJTKQ+1ikY10aMboTw9qo9cYRheGp8DXKbuRu77g=;
        b=UkeAUxqxJJMWgVQz9PDeD1uWR0GAybPfNR4bZqxG41CVYPM8B/8GK49NBwZ1ec4QcE
         7lZlUIUi/KiE1GzXhvX0JQfIA+TRmOcbmyMOOAclxeir6LEaiRz5wsOFEC5sZVySLRki
         eMWbVl9ksKDkT0rTTFqXaf8zoIYUyIRoHweZjcvVjF5RpC5E+K07L8YF69tXzRWuAgUa
         Y+iGXMK+TULHX+EJ7inxGoe54KQAp8cbA2MLtWyZaeKzC3PD28dzI4yQ4nTT+5om7dam
         stxKucu+aLC0wkaSPpPK6+j12Tv4RjEjxx5sezDPLVcHDGptJ4kRYcmVGTLVhFipMfQw
         SF3A==
X-Gm-Message-State: AOJu0Yw/rDJCS2nt/iYXicOihmdWMogrE9mGMyTSfpmL2tKj29e76NIg
        KBOcaNygfPIf3GDuksd3vNUcAA==
X-Google-Smtp-Source: AGHT+IHJBAYhxn1GGRB5vzrXcaafNOi0rnc01xyeDJrxzCSkXZlY8N/3npkmx1Wu5YzdeWtLZT+rkw==
X-Received: by 2002:a05:6a21:3297:b0:133:e3e3:dc07 with SMTP id yt23-20020a056a21329700b00133e3e3dc07mr3739773pzb.49.1694811419599;
        Fri, 15 Sep 2023 13:56:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m21-20020aa79015000000b0068a6972ca0esm3336769pfo.106.2023.09.15.13.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:56:59 -0700 (PDT)
Date:   Fri, 15 Sep 2023 13:56:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     cl@linux.com, penberg@kernel.org, rientjes@google.com,
        iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com
Subject: Re: [RFC PATCH 03/14] mm/slub: move kmem_cache_order_objects to
 slab.h
Message-ID: <202309151356.1A6AC69@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-4-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-4-matteorizzo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:22AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> This is refactoring for SLAB_VIRTUAL. The implementation needs to know
> the order of the virtual memory region allocated to each slab to know
> how much physical memory to allocate when the slab is reused. We reuse
> kmem_cache_order_objects for this, so we have to move it before struct
> slab.
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Yay mechanical changes.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
