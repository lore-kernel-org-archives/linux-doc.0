Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8E1C388F7
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 00:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79F1C21D93
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 00:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BW8LFvnO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731746AbgKKAUm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 19:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731854AbgKKAUi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 19:20:38 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06849C0613D6
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 16:20:36 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id i13so169708pgm.9
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 16:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gRsyoKFAiYsdDr9vFUIknQF83zHV+rgJ/rjEsefe3mE=;
        b=BW8LFvnOIc7NxtiaAB5pesBKEQKPF+1c5mD/tFKnQ5zjxRsoAaahN8+/Zp9540edo1
         mPLR68RuvnW27YFLzO9fW9R2kj59uw628K3z2qe7xJlcvWRnTxKB5z6im2kbvfCmisCq
         sw236ukvht5WKM8LWRjv50SP1IYnIcFLZFH8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gRsyoKFAiYsdDr9vFUIknQF83zHV+rgJ/rjEsefe3mE=;
        b=tUrmMtqZnMxgX+yVdGKRf9HHJQ3+VLi6hwhPh9Yf27UwE1mXdYO/RAoG56h8cqIeGk
         OPSlm+43fm7KGliwOm+phi2TYl0V6C9TtD/m/qOYTY0UTy+EIkZAEsmykd5bnHf1iebI
         fbFcg5mErZ0NgviRkJawBg/81DamAi3Ie5tQn+3gp2o0yMm3JFuWVcj3fwzNLvtwpi64
         C4xu79e0VjsoNq2ajXd9om5SCIc7PISDEWxqhgJ20p4yiexviD5aMwSrWbpjBegixWg7
         Ct1xU0jib52f/QM7FMIDkGyBMXAjTDcjR5SGaMMBpyv2ju1nC+ghOAtMZGlWSSOxTqQU
         P7mA==
X-Gm-Message-State: AOAM531IpzwkHXPmJkf/wHqdY9UPA1pHxjWZqn0O3cg2NffUaf5PCsmK
        lznSaX2S7hQSfjKShvADTcF7+Q==
X-Google-Smtp-Source: ABdhPJw8V0hN09vn6qMlXU43NAuiryNHrDsiEFWKhIEDdVIwr2He8RTDBr87CnFsvLyQEVznm+NUwQ==
X-Received: by 2002:a63:c20f:: with SMTP id b15mr18599734pgd.230.1605054036660;
        Tue, 10 Nov 2020 16:20:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y129sm127683pgy.84.2020.11.10.16.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 16:20:35 -0800 (PST)
Date:   Tue, 10 Nov 2020 16:20:34 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, corbet@lwn.net,
        gregkh@linuxfoundation.org, peterz@infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
Message-ID: <202011101619.341C9C7E64@keescook>
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <20201110210316.GO17076@casper.infradead.org>
 <11b5153f-e092-d1c9-deb1-e81a171bb866@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b5153f-e092-d1c9-deb1-e81a171bb866@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 10, 2020 at 03:58:48PM -0700, Shuah Khan wrote:
> Yes we have some instances where unsigned is being used. I considered
> going to unsigned. Changing the API to unsigned has other ramifications
> and cascading changes to current atomic_t usages that are up counters.

As in, existing callers expect the "read" value to be int?

-- 
Kees Cook
