Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C0CC64E7B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 21:19:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54633207FF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 21:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RWKppFpv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgLAVSv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 16:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgLAVSu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 16:18:50 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3B4C061A04
        for <linux-doc@vger.kernel.org>; Tue,  1 Dec 2020 13:17:57 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id l4so1990525pgu.5
        for <linux-doc@vger.kernel.org>; Tue, 01 Dec 2020 13:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xJaKmI6na5T5AatcerLS5KIuUjusss8HMVYnHL9hQWU=;
        b=RWKppFpvI7O9Nk1xWUWvwkD4988+mAaKp3MVnM/N0rNlOdKGMN7Pzwm9LVfF//9voe
         vkfSejegwj60MQWV4MfbpnmhYvcvazkIdlGe6pFo+DLzfqEv2lBj3CuNWmlrs7ARfMRn
         IOJcSFwLf1FXGNvy3vCI9fU/emz2JR+KNDjdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xJaKmI6na5T5AatcerLS5KIuUjusss8HMVYnHL9hQWU=;
        b=rvOl2Yonchp0ou9dSt/irKTsGIc2+6sPDdXK2FyZswmoLvjvtXVU3x+AAuSotXiBG9
         64nb6mFei4uPoUiiFRyW+MRGaym8xw1Qc6K1FyEpwl+yFx062G2u+2vPu9oZQ9taaX59
         zS9r8yEEWW+sypcDClWV2w6jzaYanvtufQE1xJ9oLL0L+ubE6M86aHqdy1Fbjkcj1dgd
         A+tiQa8qrI1inST0Q+b7G9b83OShnRH0OWQkdKv+/u8oIHdNjOFNgpKuK0oUPT/88HB3
         Y2FeipHvfDgBOdIkKNtqceXwlOqvrQu/JC12Wv87me6GzTeT4IhwAJXjJrHpDFds7v7V
         sL0Q==
X-Gm-Message-State: AOAM530VPIVnxseJNlUOeF4w1+VLFih0EvIxLCTXCeccZhGFRd/JcHDR
        W4jyMZz05sB6/fEn7eESgbxYJg==
X-Google-Smtp-Source: ABdhPJw+BPzKlEns9G0kWGJJCE0tpZNIRXbmUtTmglTDps7ABlMu6UF1ItlFt0+XS9NxEwVUXueNtA==
X-Received: by 2002:a63:985:: with SMTP id 127mr3849650pgj.449.1606857476712;
        Tue, 01 Dec 2020 13:17:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t16sm460875pga.51.2020.12.01.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:17:55 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:17:54 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/16] refcount.h: fix a kernel-doc markup
Message-ID: <202012011317.D383308@keescook>
References: <cover.1606823973.git.mchehab+huawei@kernel.org>
 <afb9bb1e675bf5f72a34a55d780779d7d5916b4c.1606823973.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afb9bb1e675bf5f72a34a55d780779d7d5916b4c.1606823973.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 01, 2020 at 01:09:08PM +0100, Mauro Carvalho Chehab wrote:
> The kernel-doc markup is wrong: it is asking the tool to document
> struct refcount_struct, instead of documenting typedef refcount_t.
> 
> Fix it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>


-- 
Kees Cook
