Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 068D47D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  2 May 2019 20:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfEBUZB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 2 May 2019 16:25:01 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36896 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbfEBUYw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 May 2019 16:24:52 -0400
Received: by mail-qt1-f195.google.com with SMTP id e2so2596536qtb.4
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2019 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/6qNotoliIpbPHnDpGzPxcs8ZNPZhDNNCLjPstNPrT8=;
        b=fuLFXSmMYasKCbAvERQIDPmeji6jmUCut5rU3+vXaNqJapiPf+Pd76zCuQ9iRqkGrg
         jtTJT2SKM3FzXrxp628Mk9GRNOuyz9a89X4RECJyGW7SkSE9PpfvH43NM/DBPW07d99W
         9fLXZGcFt4JzXs5/+Yq/zhpAHIigS0l8030J3q9hvc9SfiyCyJVhDxiEkrplr6OQnUbR
         LGMfuwMwHbhO4kjqwaX6f5GQx3SE0ma4wXa6l9EAe1C6oA4fhAzEw7/GvyTrO3+o4quS
         3uOi8vAb5+oBrQBV1TGoYfsFSAUBPQPmxuvfUB1WKEhxyUomR4f2/zDgdfqspPFM2l8W
         JMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/6qNotoliIpbPHnDpGzPxcs8ZNPZhDNNCLjPstNPrT8=;
        b=mxw6GLnsR1PElYVK7NOq/oa1KNoDESGo6tewRiC3gOfdwyI8XfAbW+VX6Ekc9cI0QA
         IQxjLrxmxXQVhJd2Q0wIZMsmJMiiPlL91HdZfQA2ozhCpUr30N3Pcv3T/XwikY+CitFV
         g36szx8SwZxai5V5yVUhMkLBPQLihoBFtwUbAM2FgG2Xff4M5PwrPIBI6MzeE/uZqTL9
         cj5jO84DPiY+AcKqkIJR0Yh367A5ogdVJiEamnMfDZvkcrXZSTFgsQZEZGOnloh+NDSS
         rcA3onKBpeWrU04ydUTdl1EdUwhaWXFf3PKOTIza79nV1ofHzCs06scBYdDuOKmj26Vi
         i+Lg==
X-Gm-Message-State: APjAAAWJK6oHEoPPuGX1gmRGuT7zIIZvmNY0vJfYTmaq0WoKtNCvekHn
        pmOxUcMz69i/R/kHzEh5G7rvVw==
X-Google-Smtp-Source: APXvYqwSU1Jdrkyw3M+MyjI6lPDb3x/ZKyog0Rh3SrhdsdOj+e3kblRkHPJvXnL3UfDPqGFLVUtz0w==
X-Received: by 2002:ac8:35ec:: with SMTP id l41mr5257887qtb.109.1556828691717;
        Thu, 02 May 2019 13:24:51 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id j25sm114467qtc.24.2019.05.02.13.24.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 13:24:51 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, linux-doc@vger.kernel.org
Subject: [PATCH 1/2] drm/doc: Remove atomic_state_helper.h from drm-kms-helpers.rst
Date:   Thu,  2 May 2019 16:24:29 -0400
Message-Id: <20190502202449.237184-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

There are no structured comments in the file, so it generates this
warning on compilation:

include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found

Fixes: 9ef8a9dc4b21 ("drm: Extract drm_atomic_state_helper.[hc]")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/drm-kms-helpers.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 14102ae035dc..e7804a9eef9f 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -77,9 +77,6 @@ Atomic State Reset and Initialization
 Atomic State Helper Reference
 -----------------------------
 
-.. kernel-doc:: include/drm/drm_atomic_state_helper.h
-   :internal:
-
 .. kernel-doc:: drivers/gpu/drm/drm_atomic_state_helper.c
    :export:
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

