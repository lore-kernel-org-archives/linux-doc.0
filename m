Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D70C28CBC
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 18:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92E29208E4
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 18:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WpMlExT/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgEIS7O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 14:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728005AbgEIS7N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 14:59:13 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EF1C05BD09
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 11:59:13 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so5775187pjb.1
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uk9SlQz0CEzsa9L5BG2dNiuhefw99CVH+DuavxyjFwA=;
        b=WpMlExT/LVZeacy+KQ32hrpYo3R8XLnZFgCb869aNV+iiJ4EApUMjwk4xusqybUsck
         IQsuT29KxtXyciI21GTLSAOx5ucTEuI1DNlfzz+U1uA4nl/ZYLB37ks3l7sCuyFgfsb7
         C39XCT5j6YqMLMPgPmiFNCU6Ambyi9SwoV1Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uk9SlQz0CEzsa9L5BG2dNiuhefw99CVH+DuavxyjFwA=;
        b=MAeiCsC94FiJBpfYGjBMUtuotZj5Iw3P7/5TG/Xv5C04nViblixLSBLbBlhP7ryehf
         /GI8S/etKkw+tgfoplnW/U31ngs74WfR1zByA6uMqh3qMPcqPOuHOz8B72Z4v28KxUob
         lpYM4jjx2Xq+yQyq0rFpPP4wbDagoA11kjobnph9tyQBayj0829ahLYnQOVhQg9trXQQ
         JWXfhXC1L20B68HpPdNVWIQ17Uxq4AR5ONSXAiyRZ5iGUyl9fLivmMcXQvBi907XSL8I
         b/taQWlHX8c3IOfr6UZRuZ/D0eVxdHmTPqi7ruWBdX00+n/sjShu1+hRUxo461X6uC4E
         3lmg==
X-Gm-Message-State: AGi0PuYLNjYOsMOf0s/WbS030FOaoXWuqHZOdnfxOBxnozIaGauSt2Yw
        agKSZJQOK8k/3l1ZIvxnwd4Vzw==
X-Google-Smtp-Source: APiQypKBNQXLzuVMARkaYrebfFtrKeGEowsUVjfCgRHf5JpipmwnEaSx8EB4o1ubtEkZ1ly+hXTS1A==
X-Received: by 2002:a17:90a:db0a:: with SMTP id g10mr13107736pjv.54.1589050752729;
        Sat, 09 May 2020 11:59:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j26sm5139846pfr.215.2020.05.09.11.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 11:59:11 -0700 (PDT)
Date:   Sat, 9 May 2020 11:59:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rafael Aquini <aquini@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        dyoung@redhat.com, bhe@redhat.com, corbet@lwn.net,
        mcgrof@kernel.org, akpm@linux-foundation.org, cai@lca.pw,
        rdunlap@infradead.org, tytso@mit.edu, bunk@kernel.org,
        torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
        labbott@redhat.com, jeffm@suse.com, jikos@kernel.org, jeyu@suse.de,
        tiwai@suse.de, AnDavis@suse.com, rpalethorpe@suse.de
Subject: Re: [PATCH v3] kernel: add panic_on_taint
Message-ID: <202005091159.A317BEFF@keescook>
References: <20200509135737.622299-1-aquini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509135737.622299-1-aquini@redhat.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 09, 2020 at 09:57:37AM -0400, Rafael Aquini wrote:
> Analogously to the introduction of panic_on_warn, this patch
> introduces a kernel option named panic_on_taint in order to
> provide a simple and generic way to stop execution and catch
> a coredump when the kernel gets tainted by any given taint flag.
> 
> This is useful for debugging sessions as it avoids rebuilding
> the kernel to explicitly add calls to panic() or BUG() into
> code sites that introduce the taint flags of interest.
> Another, perhaps less frequent, use for this option would be
> as a mean for assuring a security policy (in paranoid mode)
> case where no single taint is allowed for the running system.
> 
> Suggested-by: Qian Cai <cai@lca.pw>
> Signed-off-by: Rafael Aquini <aquini@redhat.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
