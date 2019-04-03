Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E59437D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Apr 2019 20:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfDCU4z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Apr 2019 16:56:55 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36377 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfDCU4z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Apr 2019 16:56:55 -0400
Received: by mail-qk1-f196.google.com with SMTP id k130so320687qke.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2019 13:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stZxDD4/RlpqPkI85AH0c96rqP0StTYiJpkpgjsDnoM=;
        b=CsIBJnWfJpPzyCqAIU5cny97i2F+R4Pvkgtm/DLuMfzm8QWHgmOwdSoXe+HyphN1w3
         eR8ny5zi+qW9kOpCPm0SaEldAEVlW9Cy7YTtMOSETbAtuF7U+uluKgEFTmEkAX/6K8RS
         RktcO9ETfx2gWHWMHtJUc6fcCjml6p+hbgTIfHv5ORI7Mtz3GkUOIzRSgdgTM+w2cadV
         ch9o/Bkh/8Cid3zkvm2ZgQYzmybO205fjkIKvQaI+4K89SfYckKPUEGwaAIwuNsHDTFY
         7+/CCH/20Z78eXbzAjz51G/cqjRV/AVvj7rdaegd1nlfY5oCkA4G//kEdoGI16b7mqDi
         CSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stZxDD4/RlpqPkI85AH0c96rqP0StTYiJpkpgjsDnoM=;
        b=jrQmltltBrnehrzBRzoHXncWPXpaYrHhXqIWmjHfkz0nUUdLz0pqgEdwCvu2yPF+Mj
         NouX0AKG2PhFMi44s8wGMpeuvXSpOdExenqE0Af+ae3tj9nJphhemEf6PFp4Hd2O91EJ
         8jACzpSNAPn2BNL2gcYDTSk/eQOvPl1lhUi/IRdnog3IK5lJnagntUwghyMfqPOfODZ0
         jEZr3hJHmX7dwoDhaAsFRIe1V28mydgmU6TyRhhL4Yky/Rj0ShVlnmHojb6Y8+CfnZ3I
         TnitaFLBhIBf/pgFGytBjsxoZz2axUDozNwaRCOE+jT+2VRsz7qvwAOWAHjEobEicVu7
         K70Q==
X-Gm-Message-State: APjAAAXMZfaoi3FOfaFbcy1OF73nenIvTnGWmdCm/Urn+B+bqcFSBPVv
        nCr1X9woP3zl0MOYEpsTTT0q7Q==
X-Google-Smtp-Source: APXvYqxcCCYV8i8I/W0oj0Xa6OjIg2fMiNWDfgZbUxTeFZcC5XsWhn8KbYqES02wedrCevgpiTmKCQ==
X-Received: by 2002:a05:620a:1244:: with SMTP id a4mr1889868qkl.282.1554325014312;
        Wed, 03 Apr 2019 13:56:54 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id s54sm10662373qtb.83.2019.04.03.13.56.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Apr 2019 13:56:53 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
Date:   Wed,  3 Apr 2019 16:56:45 -0400
Message-Id: <20190403205652.183496-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The file was removed in the below patch and is causing this error:
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code

Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
Cc: Maxime Jourdan <mjourdan@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/meson.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
index 479f6f51a13b..b9e2f9aa3bd8 100644
--- a/Documentation/gpu/meson.rst
+++ b/Documentation/gpu/meson.rst
@@ -42,12 +42,6 @@ Video Encoder
 .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
    :doc: Video Encoder
 
-Video Canvas Management
-=======================
-
-.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
-   :doc: Canvas
-
 Video Clocks
 ============
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

