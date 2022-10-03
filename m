Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7889BC4332F
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 16:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiJCQNi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiJCQNg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 12:13:36 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F9C32065
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 09:13:35 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso6105248wmq.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V6sEgywP+y9yheTpj3XS7gZeAORICObdhjMK1hQwQH0=;
        b=pWqhnYP/qEo+YN1EmxWDVoecNDnJujxP9EKyEf5YtiSh4fYKjX5Vs03tCmO/wJG5w0
         9f61vO9VWYVFdvf0AOJNaP3Tp40tllmpLDQUMIHFhojgUxNAGt4m7SHjsKT6R5M063gg
         FzLAKetaXGkfmoYZrV7QjjB2aEgRU/eAac5LSL8io0vRp8y8uRKHGyB8mbnYtNdi9M1V
         PmQuKbXJHY7jkB8KCJUkBSKSCAjmUy0+qgNUhF2d9AL1kUDhv5emEc9ss/F1+j0GtXTU
         GiTjxpMjKndioUoS2nUd4jtqpq+nr3gTPUz/Z5eK8n32ZTTcaMbdjL5py8DaTXJMi+y6
         M12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V6sEgywP+y9yheTpj3XS7gZeAORICObdhjMK1hQwQH0=;
        b=Q3FH8CBmeAsLka1GuPahN129xIUhjUzjsfQ8+/Q/Cys+K0LyyKbytS+lA0GIZ61rbt
         gLIbeo7E2uxvd3T8Gf7wAKoGBw0mSmHwTiXxcub7GRdnzvud2krbF8glHuaYcK68lyG2
         ZTqWY3FjdSK2sIAjV3kyAjWZUzwI4XvTaIG58V3l/uBaILQjuSQwhRlXRVyqs9hb/II/
         sQGkw+JSm3+lfJjjKVXdJfoAzitGNll3sNWCRohAyF0psnTQbmYDktQAl70WHUlyIOUQ
         eGXe7bEh+EPt8+mey0QnYppHvFBMJuBJU144SJ20e0uTGWwagZymCn4AIMS4lfIkJCCX
         pXzA==
X-Gm-Message-State: ACrzQf2/Cwcz6TNOaf64cV1E5EavlI9/GKfvq32Fk9lpPv5JcTNNuf6l
        eNb3Mocctjl80VGSlbQiS2yeZw==
X-Google-Smtp-Source: AMsMyM6I/ktl+ZwYRao+nj/NL8354oPKCfCXeO8N5GKZgH2GuO2d810BtogmxDxnr34XsrdxGPml9g==
X-Received: by 2002:a05:600c:1989:b0:3b4:b6b6:737 with SMTP id t9-20020a05600c198900b003b4b6b60737mr7476809wmq.79.1664813614189;
        Mon, 03 Oct 2022 09:13:34 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v129-20020a1cac87000000b003a845621c5bsm12111335wme.34.2022.10.03.09.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:13:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 2/2] Documentation/process: Be more explicit about who to mail on patch submission
Date:   Mon,  3 Oct 2022 17:13:29 +0100
Message-Id: <20221003161329.431107-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003161329.431107-1-bryan.odonoghue@linaro.org>
References: <20221003161329.431107-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recently when submitting a yaml change I found that I had omitted the
maintainer whose tree the change needed to go through.

The reason for that is the path in MAINTAINERS is marked as Supported not
Maintained. Reading MAINTAINERS we see quote:

           Supported:   Someone is actually paid to look after this.
           Maintained:  Someone actually looks after it.

The current submitting-patches.rst only says to mail maintainers though not
supporters. Discussing further on the list the suggestion was made to state
that the following are the right addresses to mail:

- Maintainers
- Supporters
- Reviewers
- Dedicated lists
- LKML as a fallback when there is no dedicated list

Add in a two sentences to capture that statement.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/process/submitting-patches.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index be49d8f2601b4..90fda3367a405 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -227,8 +227,11 @@ You should always copy the appropriate subsystem maintainer(s) on any patch
 to code that they maintain; look through the MAINTAINERS file and the
 source code revision history to see who those maintainers are.  The
 script scripts/get_maintainer.pl can be very useful at this step (pass paths to
-your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
-maintainer for the subsystem you are working on, Andrew Morton
+your patches as arguments to scripts/get_maintainer.pl).  In the output of
+get_maintainer.pl the recommendation is to mail every maintainer, supporter,
+reviewer and dedicated mailing list. If get_maintainer doesn't indicate a
+dedicated mailing list linux-kernel@vger.kernel.org should be included. If you
+cannot find a maintainer for the subsystem you are working on, Andrew Morton
 (akpm@linux-foundation.org) serves as a maintainer of last resort.
 
 You should also normally choose at least one mailing list to receive a copy
-- 
2.37.3

