Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F22EE49AA
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 12:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbjHUMxm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 08:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbjHUMxl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 08:53:41 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC26CD
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 05:53:39 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso578807b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692622418; x=1693227218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FGj7cgUeosSqTN/BBHBDpq4ZyUn/x93LQfy/ClJCFOc=;
        b=kyWX9hSLpAVOja1750OXW/QVKio4MmIVBBfRwhH6n/n9t+blozapD0mxyh02Dn7QWy
         U8B3x0hIcNQPaIOb69glmycvy9xsWk5i00uLFy3iAwWUsoCWOM/6rEmHPj/y2vPT3IR8
         43ZBusyxagmEdEWUZD7G3j1U+bUd31oBHxMETewPTlwhl4eZnvmgRfsNVeX7sZ24MDKS
         ZnAG0p/YCbCuOaQSWJFFKGXrwVU7FNSjkFB2/NsY6gya2dfvDjceZavWXbm3GGpoiUKT
         o1MCjctSze9XfjOwEWS5DFwWEZVNCzoJsJ2sMBiJ5QIwrVVxIfso+zQoUd/kQzexbAgl
         6YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692622418; x=1693227218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGj7cgUeosSqTN/BBHBDpq4ZyUn/x93LQfy/ClJCFOc=;
        b=LMN4AKTz8j/IC9uaOJDS6D38ffPCaHb5r4LvIOq3bqkJF++Sl4oP0Zui07xOyTiTPt
         ahemsS+Ay/WneKyLGBDPnXBiYdVjte9VAmX8mQe5tKhulJhjggHyHl6KOW2ZETrL74zG
         fmxSCPM7Qe5QLnTM8EGEwCidEpAu6qDpi44d9cATlrL33UQubNRQU2kWx3T4IF5/EDWo
         Mx9XAu9bYFoM8hRGXjQIQVUgeTdWhHBp48bX1h9JlmymTJ4Zhg/vRRBBc6ywG0apViaK
         neUwG4D2ZXYlae+vkCHoe+PQ5pPmeMKXdzDQCdDLF2Y6vbY/pMfbHqXct9oQGYEkT618
         5nkA==
X-Gm-Message-State: AOJu0Yxf8SZNAZC4UvA4S5sMcCFX3fUbdF2XRgKjXbiTw43s7TXd59xF
        qFrKqzgLwOnh4w/DoZDDxV7fOw==
X-Google-Smtp-Source: AGHT+IGe4iVmkOrwuPWAugYbuiVpJRW6VeHjDTj1eIWYsr7cFWnlIOuVBua0w1tuWmu3DBw6edBQmQ==
X-Received: by 2002:a05:6a20:96ce:b0:131:f3a:4020 with SMTP id hq14-20020a056a2096ce00b001310f3a4020mr3477088pzc.33.1692622418516;
        Mon, 21 Aug 2023 05:53:38 -0700 (PDT)
Received: from leoy-huanghe.lan ([94.177.131.100])
        by smtp.gmail.com with ESMTPSA id q10-20020a17090311ca00b001b83dc8649dsm6942852plh.250.2023.08.21.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:53:38 -0700 (PDT)
Date:   Mon, 21 Aug 2023 20:53:22 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Gang Li <gang.li@linux.dev>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1] docs/zh_CN: add zh_CN translation for
 memory-barriers.txt
Message-ID: <20230821125322.GB57731@leoy-huanghe.lan>
References: <214aed18-5df5-1014-b73d-a1748c0cca13@linux.dev>
 <20230819162526.GA274478@leoy-huanghe.lan>
 <f7eac106-abe4-aba1-14df-6c9d1bfdf3b3@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7eac106-abe4-aba1-14df-6c9d1bfdf3b3@linux.dev>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 21, 2023 at 02:39:15PM +0800, Gang Li wrote:
> Thanks for your review!
> 
> Your suggestions will be integrated into the next version(v2).
> 
> On 2023/8/20 00:25, Leo Yan wrote:
> > > +		|       |   :   |        |   :   |       |
> > > +		|       |   :   |        |   :   |       |
> > > +		| CPU 1 |<----->|  内存  |<----->| CPU 2 |
> > 
> > Unalignment caused by extra space around "内存".
> > 
> If using Chinese, it is impossible to align properly no matter
> how it is modified. If strict alignment is needed, the text in the
> charts should not be translated.

In my editor (vim), a Chinese character is two-width of English
character.  So you could see in above, I can simply remove a space for
alignment.

Anyway, if you have different editor or configuration, using either
langauge is fine for me.

Please expect I will have more review.

Thanks,
Leo
