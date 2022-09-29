Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF740C04A95
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 00:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbiI2AZN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 20:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiI2AZJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 20:25:09 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3572B183
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 17:25:06 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x18so22136688wrm.7
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DMK5M3ZC4tqdeA/Ru5Y38vzyP7ZT8PMwlA9cylifiqs=;
        b=t+aYFlFhZsB4zo48bi8ZFFloBffnIzSTxTBsHegXAaARCp64tQqsNjycL+g95sDuaS
         alez2dLG7hcBB6V+IRyScZtPfQqDQKAMXTjp2IPIh7BiloAb6wIR9bswRo8WEuRsSfoB
         uWctHFA9TgerkcRI1bKKIDipRe5yJpd4IlcDcEqmALT7kvw6pq0N0xaL+yOeGdmA3B1z
         R9evvFO70GEN5POp5UN33IQVt9+n2qeVaZOERBPnUynEBeRtb1nPNVjKfvIzC5ZFERIY
         v+k7fkSW0FfT+1FjTNchsVMUc+xiMRVv+QDdBnJCNLrFpYqH2TuyUYHK2k7q2BLxdJQT
         bfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DMK5M3ZC4tqdeA/Ru5Y38vzyP7ZT8PMwlA9cylifiqs=;
        b=xRuaYWCDbAoPUj95nGdYuw4lkTtUH6oRbsQpaCOcNhSGyPnNDqViouSYBqAQaGMlul
         ei+LLdGXcmEwBe6GbFjv+g+j02U/6zPAqCwq6a8tci8tiU8BADkzSdraevHKrqLl2e2K
         vfn4CZQQEZgrJ2XXn4WO3H79Uf4MbNyJ2TmlIQhPQxk7jUFR9SDabFetXK4Y15Zh/TUa
         GA5E6SYwrrv2IB+ssie+WKO2a6eti2Qg86XEqNCH6Pwbu/3Xm/2r2HsdtsCI67Ndbo27
         X60y4s6oGFbne35P+sfS3p8R5P5tKiCf8YpvPMi8KEAUkyzfdmrl8zwba5ALGDf/FNc7
         2E1A==
X-Gm-Message-State: ACrzQf15Y8prprI/aD+jQ9n3K7rEK0TqgUFvVtNR/lNVG7ty1Or1ugqr
        BasCyzILs9p1XfFelohuJJcm/A==
X-Google-Smtp-Source: AMsMyM7AGFbGHZVvTM54UiAZ1+YmBS8+UrYUKHn+vq8rG5hoyHBza6U80j8czzNwDHn1ebk/Qwn5dg==
X-Received: by 2002:a05:6000:1a8d:b0:22a:44e9:831e with SMTP id f13-20020a0560001a8d00b0022a44e9831emr247172wry.575.1664411104656;
        Wed, 28 Sep 2022 17:25:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t187-20020a1c46c4000000b003b4a699ce8esm3033841wma.6.2022.09.28.17.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 17:25:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 2/2] Documentation/process: Add text to indicate supporters should be mailed
Date:   Thu, 29 Sep 2022 01:25:00 +0100
Message-Id: <20220929002500.283481-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
References: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
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
supporters. When we run scripts/get_maintainer.pl anybody who is denoted a
paid maintainer will appear as a supporter.

Let's add some text to the submitting-patches.rst to indicate that
supporters should similarly be mailed so that you can't do as I did and
mail every maintainer get_maintainer.pl tells you to, without actually
mailing the one supporter you need to.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/process/submitting-patches.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index be49d8f2601b4..aabccaea93375 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -227,9 +227,11 @@ You should always copy the appropriate subsystem maintainer(s) on any patch
 to code that they maintain; look through the MAINTAINERS file and the
 source code revision history to see who those maintainers are.  The
 script scripts/get_maintainer.pl can be very useful at this step (pass paths to
-your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
-maintainer for the subsystem you are working on, Andrew Morton
-(akpm@linux-foundation.org) serves as a maintainer of last resort.
+your patches as arguments to scripts/get_maintainer.pl).  You should mail
+everyone who appears as "maintainer[volunteer]" or "maintainer[supporter]" as
+well as the relevant subsystem mailing list.  If you cannot find a maintainer
+for the subsystem you are working on, Andrew Morton (akpm@linux-foundation.org)
+serves as a maintainer of last resort.
 
 You should also normally choose at least one mailing list to receive a copy
 of your patch set.  linux-kernel@vger.kernel.org should be used by default
-- 
2.37.3

