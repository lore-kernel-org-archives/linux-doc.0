Return-Path: <SRS0=LbMJ=A7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CF5C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 20 Jul 2020 01:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3495722BF5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Jul 2020 01:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YzaOgEgb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgGTBCR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 19 Jul 2020 21:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgGTBCR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Jul 2020 21:02:17 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF68C0619D4
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2020 18:02:16 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e8so9515071pgc.5
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2020 18:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ca542pBq1PPBrcky+qLS22aaKt8lZZIIoQ77Avc1ldc=;
        b=YzaOgEgbtBPVqDtWpGiyWNmcJ66bxJmMjPQMr3UnEZOhDky155ZHGk9RRisYxhz/I5
         97TKRnm1fxj3tsqkU8Izyt9H/tXdMDUzVeIf99ZqLAr7IU18j4BKDOeHR3+r2oZKPELm
         /eHC+MWkWbdfhoy+wgkea6V8T0X5IDrP3NQiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ca542pBq1PPBrcky+qLS22aaKt8lZZIIoQ77Avc1ldc=;
        b=rkU0dKGbYGYAn9KkUuZ75chncb9DbgLgwx/5IMbu/J4TdF2NWOcHmINNp0BL5zoI3F
         dKLl0EF5mAXHqbaHIhoesaMFEtgUgssj/0e76U8q3PSIH/LlrgSIquMy8yRrZxzq1vSE
         45L0GGDqlQdf1Z0fcxUPlX/3/l9Z+MJgFCBfUXusqZceQijYDGJxpotJrGch8io5xMR7
         pIvhZ4t1u+Ad0NDF+4wKigmHF+/eMpQtLUxjB77zl09ckH1TL2kR7zwAu6JHYNqoASy+
         gDmWNpBgaaMIRZMMshhQKGmnGlzPil/lEvFgqz8jWNuUe0ozycxv5AyrjOV9Wn/xas0w
         jGGA==
X-Gm-Message-State: AOAM530u+Ps/N/U0Vfr38SRlDT3WTOHtMIwrlVlgDFCrYSHcSeEFrdVS
        xeqVJ0ukGZMoUq+IDhuA4Oa/YyNvu+U=
X-Google-Smtp-Source: ABdhPJx2hZirPwk7iOr7nJlIJXs1ZDJxJ6ysBFW4SaOThhgRb0LDF31Sn3KaNJMSoLmldg34RyThAQ==
X-Received: by 2002:a63:cb03:: with SMTP id p3mr16640113pgg.444.1595206936363;
        Sun, 19 Jul 2020 18:02:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r2sm14441026pfh.106.2020.07.19.18.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 18:02:15 -0700 (PDT)
Date:   Sun, 19 Jul 2020 18:02:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, gregkh@linuxfoundation.org,
        tyhicks@canonical.com, jpoimboe@redhat.com, jkosina@suse.cz,
        tglx@linutronix.de, steve@sk2.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] docs: process/index.rst: Fix reference to nonexistent
 document
Message-ID: <202007191802.E3B03B06B0@keescook>
References: <20200718165107.625847-1-dwlsalmeida@gmail.com>
 <20200718165107.625847-5-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718165107.625847-5-dwlsalmeida@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 18, 2020 at 01:50:59PM -0300, Daniel W. S. Almeida wrote:
> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following warning:
> 
> WARNING: toctree contains reference to nonexistent document
> 'process/unaligned-memory-access'
> 
> The path to the document was wrong.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
