Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A8DC47088
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 00:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiLBAzn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Dec 2022 19:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbiLBAzm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 19:55:42 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B64920BA
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 16:55:42 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id cm20so3478395pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 16:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xl+qejN3tIVmJSkrvPgdLgILrBaOoxJHIfgTJ2nuQg=;
        b=U+LyVbbvc/EqSA7iugywzm78ANe70elPrUE6NMTdrgNZxzrN3L+KXn1dw/OCBzTVZC
         1ziu5BU9NNZ4E2l91AsMA/fiQOZTncgXH1a9s7Ci/SxRB1aneAxbUhMBp9Ni35w4S9ez
         sJ75+Hlki+gge/DYEBT4WOxRPS8Jcf3Y7BgOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xl+qejN3tIVmJSkrvPgdLgILrBaOoxJHIfgTJ2nuQg=;
        b=szqmA3IlEoMOSwbgPNGvi+YrQrrXRuqhyI0Nfb5qScW5yk+pUdagWDMJ0EAd5n27VZ
         FalDHFGwPWdWH3Hyxu7O+69/EWNXDUb6ubHmxxh6qmWc1m7N5FoOJ3nMEY2EgCOzYcWq
         ch4dl+4sXPGOtxS4Su2/qiK6cixcTas1sR5k1RBSrTXLWZdsMzpy8vJYSn1uqiZgIXhb
         Al8guFDrOtRFTF5qNVQrRq6mvS94lFEdctQV2y5MIvqMpphuIXBX1hVQYBwZ04D8Yd2y
         n3Rh73uuxKtl2YkfRB/5l2JOicPVjHxP4OJFl5q/bI1RDRXNVMD0Rxrookyc1Yr8hpIn
         Adiw==
X-Gm-Message-State: ANoB5pk1jLfc39l5ZIMTO6yAKCCqGi/O3mLOnIKph5bYP33ig9rEEATQ
        VlbnWT61fsYpBBfUel1SsTSp3g==
X-Google-Smtp-Source: AA0mqf4f9epwr9PYq1sO4cqczGzM2TpxtnEKENtU4QLl6r1QIGi9jn92cAb1SK/+1n/byGKTD/iLfQ==
X-Received: by 2002:a17:902:c194:b0:189:6995:660c with SMTP id d20-20020a170902c19400b001896995660cmr32787116pld.48.1669942541672;
        Thu, 01 Dec 2022 16:55:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79ac3000000b00575c5ae50cdsm3949150pfp.142.2022.12.01.16.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 16:55:41 -0800 (PST)
Date:   Thu, 1 Dec 2022 16:55:40 -0800
From:   Kees Cook <keescook@chromium.org>
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Oliver Glitta <glittao@gmail.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 3/3] mm: slub: test: Use the kunit_get_current_test()
 function
Message-ID: <202212011655.7B32E97C92@keescook>
References: <20221125084306.1063074-1-davidgow@google.com>
 <20221125084306.1063074-3-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125084306.1063074-3-davidgow@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 25, 2022 at 04:43:06PM +0800, David Gow wrote:
> Use the newly-added function kunit_get_current_test() instead of
> accessing current->kunit_test directly. This function uses a static key
> to return more quickly when KUnit is enabled, but no tests are actively
> running. There should therefore be a negligible performance impact to
> enabling the slub KUnit tests.
> 
> Other than the performance improvement, this should be a no-op.
> 
> Cc: Oliver Glitta <glittao@gmail.com>
> Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
