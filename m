Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EDEC77B61
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 09:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjDMJGz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 05:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjDMJGy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 05:06:54 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657891991
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 02:06:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id f26so29567419ejb.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681376807; x=1683968807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFx0Tegz+na2H8E8/SzrHR4EtntR/LNXLbl5VqgfAAI=;
        b=lsJ2z0bXokcLYWx6io3xwLHcgn0faiH4+P0IvW9E10joQb+97+re0PuWf+bs3Ft6om
         d9GTi9+eDNkO4KlWLcrJFEYRQgG716x1TFp+bClTgHAsMT5xZ1/xjc5XlVYTJR6bvyJo
         HCCcu6lIrVhVxqNV7u3pQgAOzgzNXuqF/1rYfGyLTuBzEC0nVHqK9iPw7T1R5uwiuEos
         yD+duCuzQqoA7w4Mcyq9x5tG0lWDFrEpwLwPkoheDpmpBSWONswoJML0mJJaTbWAh+ht
         G7nf8Wt9aZMk4QuokT1JUELuS2OkOoWGj0kfgJL6HXQ9u/dXldme7qyIfGjtZXJ13UgI
         DReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376807; x=1683968807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFx0Tegz+na2H8E8/SzrHR4EtntR/LNXLbl5VqgfAAI=;
        b=IWXSApGdUdqISEqLKSSBoN8537tuk9FQn4a9E0/+gT9idxK6Lu45NHJnbBHxVaPuAa
         JfpebWKFhAJyA1VsQ8n58uPNhdQim26QjuY7f2YZ3R8IHjSQCfFcEWmpvFxc0b9FUQN+
         iFFTdCyYNze8X8IyhZjAwGNDjLyzvrYw+K2VN5WvP3vXjD3D3GMENZNwa4OxfcKcx2SP
         pwpciFM73NxXSm+8MuAuTh5E69cX6qUB/K3+ks8PvbrRydyxYg66rado0kWore+4poEk
         XjOioF+Qlt72OqFpJK0X3eMGdgIeVCSQ93/QHk7szMxdwj8MBgtSWqUggHLEhGeEmRhu
         yKqg==
X-Gm-Message-State: AAQBX9cHXIhhkAoDea6eCg7VsjrRARsR4IejHHnnBot2+nBN7E1Z+lJO
        scd/l7XKMvH9Ds0HsDFGhEC8Hw==
X-Google-Smtp-Source: AKy350bYyZoPIbN0SskyVMj2/knKJPoBCk/EFJg5yFIO6NYIS0yJuuL9UIj0eA50IFkR0rVmkRoIXA==
X-Received: by 2002:a17:906:6b0e:b0:932:cec7:6801 with SMTP id q14-20020a1709066b0e00b00932cec76801mr1645505ejr.54.1681376806829;
        Thu, 13 Apr 2023 02:06:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id xb9-20020a170907070900b0094e6a9c1d24sm693413ejb.12.2023.04.13.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:06:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Documentation/process: always CC responsible lists
Date:   Thu, 13 Apr 2023 11:06:44 +0200
Message-Id: <20230413090644.15734-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The "Select the recipients for your patch" part about CC-ing mailing
lists is a bit vague and might be understood that only some lists should
be Cc-ed.  That's not how most of maintainers expect.  For give code,
associated mailing list must be CC-ed, because the list is used for
reviewing and testing code.  Example are the Devicetree bindings
patches, which are tested iff Devicetree mailing list is CC-ed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

At least one person was arguing with me that CC-ing selective lists for
his patch (e.g. skipping list X for code X) is okay, thus let's be more
specific here.
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

