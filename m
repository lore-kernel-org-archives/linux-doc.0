Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F00EB64D8
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 17:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjFTRRy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 13:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjFTRRx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 13:17:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC651981
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 10:17:43 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-312863a983fso34805f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687281462; x=1689873462;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdF5fJc3RpQKsA1Z6nsArhtDlSIHXXx5950e0HmHoSI=;
        b=BCP+qIWJFcis7g5pw0oTrdChdSQ2PHL2PHvNLYUt1z7g1FZ3kxPFc2jvshApPKMEfk
         B3Zr6bpf0EXBZxhGfRWmAHuFl0w3+KH0BFKs3/uV/YQCVihgDTYhZbY0Sd13Q6iZDZvI
         Bz6grrFI62lVk4Mbja4ssOH7wu8Tkv9b8C9Od5qTfSaaTPMdyAo8nTDdSx7ElIqDOO0y
         nVgKHnz7iBJAQw3biY1jhZwdJm8WJerNP6q5u6onygBh93tmKnazKnyYneayY5IgmOTU
         Cw4/3H2ScXKnRIB+Xb/TSEiIPjJ2uKsGGy6wO3vTbxXmzcZWwWdZQZsAY4ROCkNm7YD+
         6yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281462; x=1689873462;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdF5fJc3RpQKsA1Z6nsArhtDlSIHXXx5950e0HmHoSI=;
        b=IOKTEafhLU91QN14hkpyRVguDcGgEXW8+KyhtdNOr+T8tNGQ64xyCEJ8aBQ+zEfaq8
         YLdajNVWZAiZpGrPWp7c4ea0mHDLRWvXAITL6/UtiazqYefzEBDXJRfJ+YZg5fd+HvJi
         61rwVR/ksewpkg8dficFt6eH3wKy9o1eOg/jS1Z6Nd2KAwTU0WDUU8ZA8rOIdDaUCfAK
         Nv45HbBsL/mPAwxiMYehWgx078VoTqp40pLYuNGZa4ZzH3AOII5x2odtpioc2sC+fTY8
         CY0T0Zdp3VYmeCiYsjoIIjcVQreovzmB0Z1f47C2JboXr2NSj7KR3HDK/zmYY+TAUcJ0
         aiGQ==
X-Gm-Message-State: AC+VfDznIqqHOkQSheElWjxJ8DGggVEWDAzJ+cbzdOuTKfPf751IojoH
        prdMEFitMyz6J/RA+1z/MMCcRQ==
X-Google-Smtp-Source: ACHHUZ5Cbn9oh78M9g89VcoH3bD7gPz8OkjEvkSJEUejoWV5ErLmGgx4cFnTaCqES1AsIJeVmtr5Ag==
X-Received: by 2002:adf:ea8d:0:b0:311:1b8d:e566 with SMTP id s13-20020adfea8d000000b003111b8de566mr10135149wrm.52.1687281462168;
        Tue, 20 Jun 2023 10:17:42 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:8530:a6a3:373f:683c])
        by smtp.gmail.com with ESMTPSA id y10-20020adfe6ca000000b0030fd23381ffsm2469591wrm.11.2023.06.20.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:17:41 -0700 (PDT)
Date:   Tue, 20 Jun 2023 19:17:35 +0200
From:   Marco Elver <elver@google.com>
To:     Andrey Konovalov <andreyknvl@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Taras Madan <tarasmadan@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] kasan, doc: note kasan.fault=panic_on_write behaviour for
 async modes
Message-ID: <ZJHfL6vavKUZ3Yd8@elver.google.com>
References: <20230614095158.1133673-1-elver@google.com>
 <CA+fCnZdy4TmMacvsPkoenCynUYsyKZ+kU1fx7cDpbh_6=cEPAQ@mail.gmail.com>
 <CANpmjNOSnVNy14xAVe6UHD0eHuMpxweg86+mYLQHpLM1k0H_cg@mail.gmail.com>
 <CA+fCnZccdLNqtxubVVtGPTOXcSoYfpM9CHk-nrYsZK7csC77Eg@mail.gmail.com>
 <ZJGSqdDQPs0sRQTb@elver.google.com>
 <CA+fCnZdZ0=kKN6hE_OF7jV_r_FjTh3FZtkGHBD57ZfqCXStKHg@mail.gmail.com>
 <ZJG8WiamZvEJJKUc@elver.google.com>
 <CA+fCnZdStZDyTGJfiW1uZVhhb-DraZmHnam0cdrB83-nnoottA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZdStZDyTGJfiW1uZVhhb-DraZmHnam0cdrB83-nnoottA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Note the behaviour of kasan.fault=panic_on_write for async modes, since
all asynchronous faults will result in panic (even if they are reads).

Fixes: 452c03fdbed0 ("kasan: add support for kasan.fault=panic_on_write")
Signed-off-by: Marco Elver <elver@google.com>
---
 Documentation/dev-tools/kasan.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 7f37a46af574..f4acf9c2e90f 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -110,7 +110,9 @@ parameter can be used to control panic and reporting behaviour:
 - ``kasan.fault=report``, ``=panic``, or ``=panic_on_write`` controls whether
   to only print a KASAN report, panic the kernel, or panic the kernel on
   invalid writes only (default: ``report``). The panic happens even if
-  ``kasan_multi_shot`` is enabled.
+  ``kasan_multi_shot`` is enabled. Note that when using asynchronous mode of
+  Hardware Tag-Based KASAN, ``kasan.fault=panic_on_write`` always panics on
+  asynchronously checked accesses (including reads).
 
 Software and Hardware Tag-Based KASAN modes (see the section about various
 modes below) support altering stack trace collection behavior:
-- 
2.41.0.185.g7c58973941-goog

