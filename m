Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE15C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 16:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiJCQYX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiJCQYT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 12:24:19 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288CC22BD0
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 09:24:18 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bq9so17525424wrb.4
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V6sEgywP+y9yheTpj3XS7gZeAORICObdhjMK1hQwQH0=;
        b=yt9KY5U9okipxbrLKzskc7Gs/cvXyXtn85MqF5hFwwO+6wBbaGQ52krnt5wJ0xPqGl
         Oum+qr+wzL0ibMgSEBF1DFQHCiyCItNgLIZq+j2AYFiKYh+4M3VyIqZ7ygLmBK/KXGGD
         d9v9VWpC2yf+B9eKg7TSoaiEj4ecGgEogicf58tBXqAMN9ztsm1WiyUEGJf8bEOfbEp+
         gi2FSZSCCb1Gb1rMB6+fDpeK8WJiNfDxAAhSUD95M2kwB29Ojznr/3MIb1n6NfuowQT1
         UVawQnybtk1BF3bifKxZNLTTb3KNBj3YmnKF7W6H2DqgXr4rjZTDpQONoGjAuR0806Eg
         ML0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V6sEgywP+y9yheTpj3XS7gZeAORICObdhjMK1hQwQH0=;
        b=nPvRdcEgA03hQ/Du4GgSkl+b0lpSQwmcSIj9h5rDWntp8mOjX4BQ42C+U2Kpox/4uM
         OX3BgKdh9TgTZJxlongOfFWWBDwgP4n9yED2+q1njxRpenvhKGhZtK5BzsrIFL1+jgvV
         9BL5iZVqG/3dLfdLLywtY+Vvi6ABtn4aT7NMZ6W/z3aXlLkk0EAKdYCzKG9fSlnI4TTe
         mk59DBZcOSbyWDp5fM/+VzTyrzx16Qtl4WaN17sdWshj/2oT+SFVLUko8Oj0MR1jvOqJ
         tZo8z94GGGyt9z2CTeHNQZbZrKvQsCDkKdw9kUJqdaB6dDsYCv4yyUNYrLYX0MSCSnS1
         dQdA==
X-Gm-Message-State: ACrzQf1FDQvVcCqXlYLviCJdv8rsZ07a3qziYgDieHnQcaZkAhac0v3D
        AquH+88Xu2wJOBADKzDV6sjSnA==
X-Google-Smtp-Source: AMsMyM4ho12Cev8om81o/z1uFofHRvXYNrtiG4XKAx2U7h4k6KiGEb/Mts1jmpPcuEmcIqxebc+qmg==
X-Received: by 2002:a05:6000:697:b0:22a:f737:b10f with SMTP id bo23-20020a056000069700b0022af737b10fmr12965233wrb.222.1664814256298;
        Mon, 03 Oct 2022 09:24:16 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b003b95ed78275sm4989013wms.20.2022.10.03.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:24:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com, akiyks@gmail.com
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH RESEND v4 2/2] Documentation/process: Be more explicit about who to mail on patch submission
Date:   Mon,  3 Oct 2022 17:24:11 +0100
Message-Id: <20221003162411.431774-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003162411.431774-1-bryan.odonoghue@linaro.org>
References: <20221003162411.431774-1-bryan.odonoghue@linaro.org>
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

