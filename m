Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5122EC05027
	for <linux-doc@archiver.kernel.org>; Wed,  1 Feb 2023 18:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjBASLv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjBASLv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Feb 2023 13:11:51 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC657D281
        for <linux-doc@vger.kernel.org>; Wed,  1 Feb 2023 10:11:50 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id m13so7377766plx.13
        for <linux-doc@vger.kernel.org>; Wed, 01 Feb 2023 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZcEiLwuGvgZy4WbOe+tVhsK1ysP7K4BzmXVw4JAXzM=;
        b=RnL1pWmrmdXIcSb/mREIPWPO6cQWyvXMXz/LCi20vjexTD/CheLDEt3eO/J8ToSi+e
         sdVBCQYhwysSolB9HI1d4Wjka0nXYd1pNufzAy3S1KayYA5F8dlQHxnrdgH4f/09QVbV
         Crxg4rm0vonkeedZspc2OZBnrDAZdSPnrrsUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZcEiLwuGvgZy4WbOe+tVhsK1ysP7K4BzmXVw4JAXzM=;
        b=Qc8NAdGWV1TkzP2E10uf6RY6NqBYM1q0J1br7Sp81pc+pAx3EgzKP8mdUWp8U23p4J
         FgfYQwPk/T4nHnij79sFtoXa+RA+SbWAPgX4J5/t2gvAbQINFHp5o6pX9cXQMtN8hk6M
         DpBvhg5oX1Bc/LAoI6XbrMjOuLe+VMMGDO8I6m7iRJ0DFouqwhkaGwpW5fMXw+EJpMKS
         RHVGG+tf/OUGJ8w0fti0FX742UkmkJZP5/OyBLkTXQ3B6kg+h/ofoFQGUjCHJR9Xx5FA
         yrvMQryzkHk3DZyKs/qZ7X1VdQ5qUkNDvczu1yz/C6KnZd9dJ/kOrdTTtR9riYsyHOBj
         jpzQ==
X-Gm-Message-State: AO0yUKV3pQm0Jgr0Vkt8gLCgOSqh2B3N3w1HHy36nFrqsh6L3TPsm/1/
        UrOzCH5NgJPG0mB/uyxTxzvKCQ==
X-Google-Smtp-Source: AK7set+hJJWR7YXXz5wuO795O6qLa2UbY0jGtxOgBHL3Stl7ViXIyC6O4rw0eaMNdDc8fwCCrlUQdg==
X-Received: by 2002:a17:902:e2cb:b0:198:68b1:6255 with SMTP id l11-20020a170902e2cb00b0019868b16255mr3149630plc.56.1675275109485;
        Wed, 01 Feb 2023 10:11:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:ba26:efe8:5132:5fcf])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001968b529c98sm5718969plg.128.2023.02.01.10.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:11:49 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     rafael@kernel.org, viresh.kumar@linaro.org, corbet@lwn.net
Cc:     Douglas Anderson <dianders@chromium.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH] docs: cpufreq: Frequencies are in Hz, not kHz
Date:   Wed,  1 Feb 2023 10:11:19 -0800
Message-Id: <20230201101112.1.Ia7bc164622c8bb2dd7720ecd456672ccfd70fc5b@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Though the documentation for the cpufreq files has always specified
that the frequencies are in kHz, they simply aren't. For as long as I
can remember looking at these files they've always been in straight
Hz. Fix the docs.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
NOTE: git blame shows that this has been wrong since before the kernel
switched to git. I've tagged the first git commit as Fixes, but we
could easily just drop the Fixes tag if that's a better way to go.

 Documentation/admin-guide/pm/cpufreq.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index 6adb7988e0eb..eb46c5983a0a 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -242,7 +242,7 @@ are the following:
 
 ``cpuinfo_cur_freq``
 	Current frequency of the CPUs belonging to this policy as obtained from
-	the hardware (in KHz).
+	the hardware (in Hz).
 
 	This is expected to be the frequency the hardware actually runs at.
 	If that frequency cannot be determined, this attribute should not
@@ -250,11 +250,11 @@ are the following:
 
 ``cpuinfo_max_freq``
 	Maximum possible operating frequency the CPUs belonging to this policy
-	can run at (in kHz).
+	can run at (in Hz).
 
 ``cpuinfo_min_freq``
 	Minimum possible operating frequency the CPUs belonging to this policy
-	can run at (in kHz).
+	can run at (in Hz).
 
 ``cpuinfo_transition_latency``
 	The time it takes to switch the CPUs belonging to this policy from one
@@ -278,7 +278,7 @@ are the following:
 	listed by this attribute.]
 
 ``scaling_cur_freq``
-	Current frequency of all of the CPUs belonging to this policy (in kHz).
+	Current frequency of all of the CPUs belonging to this policy (in Hz).
 
 	In the majority of cases, this is the frequency of the last P-state
 	requested by the scaling driver from the hardware using the scaling
@@ -308,7 +308,7 @@ are the following:
 
 ``scaling_max_freq``
 	Maximum frequency the CPUs belonging to this policy are allowed to be
-	running at (in kHz).
+	running at (in Hz).
 
 	This attribute is read-write and writing a string representing an
 	integer to it will cause a new limit to be set (it must not be lower
@@ -316,7 +316,7 @@ are the following:
 
 ``scaling_min_freq``
 	Minimum frequency the CPUs belonging to this policy are allowed to be
-	running at (in kHz).
+	running at (in Hz).
 
 	This attribute is read-write and writing a string representing a
 	non-negative integer to it will cause a new limit to be set (it must not
@@ -326,7 +326,7 @@ are the following:
 	This attribute is functional only if the `userspace`_ scaling governor
 	is attached to the given policy.
 
-	It returns the last frequency requested by the governor (in kHz) or can
+	It returns the last frequency requested by the governor (in Hz) or can
 	be written to in order to set a new frequency for the policy.
 
 
-- 
2.39.1.456.gfc5497dd1b-goog

