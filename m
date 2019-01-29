Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A62867D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 16:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfA2QQO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 11:16:14 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:35533 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfA2QQO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 11:16:14 -0500
Received: by mail-yb1-f194.google.com with SMTP id 64so3972624ybs.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 08:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aIjHAV+36KMgkDiuku9xyhyhmKkL2eqGMAiFNl4QEJ0=;
        b=C5nDVjknT3OWrggWbzvWevm3SzdHpCT23d0cvxOuoBwUzf1pAE4CzbJhJT6kjMLa4n
         eG7whi7DtULlux6nC+Zn300j36RL5qet5xmp/Y/YwSCfcT2aLpUnIM7nE2NvmEdceYp7
         kLSh3jVd//8PikK1D6J1F/HI7INPYZ1KazRXFwx+iMMjoIQoB8lYSuF68QtEtM5USdRn
         4T0GOVtCpKdfgTnnZY8q2NTvN7qXoU6Ch457A4opctahZ1JrvW3XwLUtDb+mw5c/O6BP
         cOxNfpoFctsGNDUc79DJWFBG4H96IwBsZHvIZaXPvcr6jJgHxZacXtt8YvRzvOAQSWgY
         kUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aIjHAV+36KMgkDiuku9xyhyhmKkL2eqGMAiFNl4QEJ0=;
        b=kVC0G0bt/txnGGde/pSgKkR4NKTrNZBbBLvkFjZ8c62f7CA5ouZ7IRknOzX5BOxiwx
         JOYA1yu2+RtfFsB4JqN0waHXtrkg10v4jFQW6eGlhxA7uMGoxZ1YMusEA8zbewHcDylB
         nfOSQD49suw9o/M8prFwGkaqxVgwF2ZIdCA68dZnTcPU8g20Se7aK6OE1L6lbtLj1CWr
         d7hGJcCs/5oIL8y1hbar6Oh73N7ACyQBeDNbAgdpSs6euEsGt77r89bECO8MbnXjYD1u
         6E4upVTsLW8H8d13NOk2MN2ehA+bUIzIePa3TmuNrREB9PRukIsNIuFYWpeOxj+BhNbD
         sRug==
X-Gm-Message-State: AJcUukcd/T0D5x3+SxEwhGuapC8QUhqvYBnwXzIlaIXN/JAvvV5XmwD8
        IgzbnZ7GA7i8dK9m7lhYxpYlDw==
X-Google-Smtp-Source: ALg8bN79Oay9fHAPRucHh0yHmMzYIXmGGkmLSyTXllC3A0FCnZVkQj10I3HLglRszCOGa9wshV55Kg==
X-Received: by 2002:a25:ac2:: with SMTP id 185mr25290335ybk.349.1548778572581;
        Tue, 29 Jan 2019 08:16:12 -0800 (PST)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id y1sm13648387ywe.86.2019.01.29.08.16.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 08:16:12 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-doc@vger.kernel.org
Subject: [PATCH] drm/TODO: Add vrefresh replacement to the todo
Date:   Tue, 29 Jan 2019 11:15:51 -0500
Message-Id: <20190129161611.241599-1-sean@poorly.run>
X-Mailer: git-send-email 2.20.1.495.gaa96b0ce6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/todo.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 38360ede12215..7fc30380eaf6c 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -262,6 +262,21 @@ As a reference, take a look at the conversions already completed in drm core.
 
 Contact: Sean Paul, respective driver maintainers
 
+Convert direct mode.vrefresh accesses to use drm_mode_vrefresh()
+----------------------------------------------------------------
+
+drm_display_mode.vrefresh isn't guaranteed to be populated. As such, using it
+is risky and has been known to cause div-by-zero bugs. Fortunately, drm core
+has helper which will use mode.vrefresh if it's !0 and will calculate it from
+the timings when it's 0.
+
+Use simple search/replace, or (more fun) cocci to replace instances of direct
+vrefresh access with a call to the helper. Check out
+https://lists.freedesktop.org/archives/dri-devel/2019-January/205186.html for
+inspiration.
+
+Contact: Sean Paul
+
 Core refactorings
 =================
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

