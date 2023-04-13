Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1602AC77B71
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 16:55:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbjDMQzI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 12:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjDMQzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 12:55:07 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC41E6F
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:55:04 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q23so29570100ejz.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681404903; x=1683996903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yaaw//EbAt4NWXvmiMmr3k4gEQRN54OZznnAXNyHyME=;
        b=ZeXrXrEMEs/QAmKjGHz1fjrmD5tvTmiXbSFoLXkpa2D8kGf4guB1SFyFJtEC0Ua6Bz
         iUzEDrAqb6p8BXiKXyvOhPW7KxSkNEhPlKv3OALYF4K8kv3zXQUm+PZRPizD0ZqNVlyM
         1WqISRDKmxMZqUr5uYlDNBOdLc7Vsmv7EzAiA3hqomJGSRp3gUQrLpik18z+HembWowS
         xNAlvZw9rv66QRYtx1uaeqa8fLh6r8ndMVdlo06PyZjLOLXLFBZM9KQShjRpwb4CTPw3
         ZhOpum9sIU8Q5biwwYpQ3SffxncWbWkVFO9DrOjuD+ZOOHroop+Y73dta6JOc1YXk4Z5
         oVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681404903; x=1683996903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yaaw//EbAt4NWXvmiMmr3k4gEQRN54OZznnAXNyHyME=;
        b=O9tBpqCHt9vWFxVeZp96J06roBZZUZJ1eJhYSAvhlUV4+2wqxv2PWlGGwfUCtqAObD
         VcZaKksA4XXvcFdoNVPLqNo+mLgDxayg/ww+vBbXDeZRoeH4J50UQxE1OrG2f+3PBEqt
         0e84P1sTNKBMaTDR+nrDP6gzrykS6MR/INwKvZEIdtB6LvhBasgAMbdU14GIZaeSSsE2
         nZcWK/qdenjgVFK+I02xM80ubQequivBBx85Ax+HnoYIYOYjDycqvjznF+oBsxMLV0p/
         k+z/WiOvCz5mt1FSA78iQI4wzpZHGu8cqMu/EYhFbr5+0xuTOOaVXsAailPqusAsZO3V
         MSwA==
X-Gm-Message-State: AAQBX9fzWjykyXDyIQERV/OBrPp+mcn/dU9M7ozhnDDwE/caCmqRJZwD
        sdNcfCpUUazIc4929K6t1wYr7w==
X-Google-Smtp-Source: AKy350YYMcLNDEracut3HPq7w8j0sIYcfOgS5va9Sd7zxos+V/vtZyEDRRFO2koITXrE5n3gE48sAA==
X-Received: by 2002:a17:906:6b0e:b0:932:cec7:6801 with SMTP id q14-20020a1709066b0e00b00932cec76801mr2986931ejr.54.1681404902875;
        Thu, 13 Apr 2023 09:55:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5032:d2d4:ece5:b035])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090686ce00b0094a57f50d7csm1195083ejy.200.2023.04.13.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:55:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] Documentation/process: always CC responsible lists
Date:   Thu, 13 Apr 2023 18:55:01 +0200
Message-Id: <20230413165501.47442-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The "Select the recipients for your patch" part about CC-ing mailing
lists is a bit vague and might be understood that only some lists should
be Cc-ed.  That's not what most of the maintainers expect.  For given
code, associated mailing list must always be CC-ed, because the list is
used for reviewing and testing patches.  Example are the Devicetree
bindings patches, which are tested iff Devicetree mailing list is CC-ed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

At least one person was arguing with me that CC-ing selective lists for
his patch (e.g. skipping list X for code X) is okay, thus let's be more
specific here.

Changes since v1:
1. Fix typos in commit msg, a bit improve it.
---
 Documentation/process/submitting-patches.rst | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 12d58ddc2b8a..486875fd73c0 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -231,20 +231,17 @@ patch.
 Select the recipients for your patch
 ------------------------------------
 
-You should always copy the appropriate subsystem maintainer(s) on any patch
-to code that they maintain; look through the MAINTAINERS file and the
-source code revision history to see who those maintainers are.  The
-script scripts/get_maintainer.pl can be very useful at this step (pass paths to
-your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
+You should always copy the appropriate subsystem maintainer(s) and list(s) on
+any patch to code that they maintain; look through the MAINTAINERS file and the
+source code revision history to see who those maintainers are.  The script
+scripts/get_maintainer.pl can be very useful at this step (pass paths to your
+patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
 maintainer for the subsystem you are working on, Andrew Morton
 (akpm@linux-foundation.org) serves as a maintainer of last resort.
 
-You should also normally choose at least one mailing list to receive a copy
-of your patch set.  linux-kernel@vger.kernel.org should be used by default
-for all patches, but the volume on that list has caused a number of
-developers to tune it out.  Look in the MAINTAINERS file for a
-subsystem-specific list; your patch will probably get more attention there.
-Please do not spam unrelated lists, though.
+linux-kernel@vger.kernel.org should be used by default for all patches, but the
+volume on that list has caused a number of developers to tune it out.  Please
+do not spam unrelated lists and unrelated people, though.
 
 Many kernel-related lists are hosted on vger.kernel.org; you can find a
 list of them at http://vger.kernel.org/vger-lists.html.  There are
-- 
2.34.1

