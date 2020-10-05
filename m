Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC2AC4727D
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 13:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 145A920848
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 13:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDGJepbf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgJENC5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgJENCz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 09:02:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B55CC0613B8
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 06:02:55 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id lw21so7805160ejb.6
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k47cGKkf4qf9SPHSejDxpYHXYSythF1m72YxsTEJ3U4=;
        b=UDGJepbfHFjDM9wwhA+3gPy6Y+fsl1TQENDQkQtM/Ep8aH1NiPpUWqWz6Cevjrm+ra
         z+rveTtoERU/REvUXG5uCYFw/RhvPCq/swLhwSYD8Tg5unRjYw/VRh1huXelTWyxJ5+R
         Q3uBLpIViDJTV55Y5p5bdz3dwoQZK5SRRFpsigkY2uGN8p5O4jqWl3BkoEqKi0a6SGkI
         4DkIMbu743IH41Lu+lpKw6eplflNR5ZZG8Iu5cJiypqlPi0uNzkpVXatuWO+UVqFabHu
         fvvlOK7AinwtsMj9oQjF0Goz6l0+t48GF4YaBYK3SFD/4TmP/Bpt0UfTx/iiGSPOMyVc
         OdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k47cGKkf4qf9SPHSejDxpYHXYSythF1m72YxsTEJ3U4=;
        b=HWJeBpWD4j4gW8MfbWNqQPA9fGANEmMo0xq8BXYdjhjw3zLgvocAcrTTlW8T6GpLn3
         SHH08RVlff1SNZZc9VYtKTSLTR3+hhBdD7zC6zvS2xNS3lp0cEAWMbdKootNiN7HLbKt
         gbjhfa1tUYPTEdRtqoc1IwgKIxtQWKeEN/dlBMmyYuo4BpFJhXkFagsE+Dy0CHl5qeZi
         LjLTxrYkZjN+RQXhqP7HSo5bV5V42xidkEMSOUZCDtEFOHM72RK99B56hrJHIeLxBlyg
         35CQw/TrdMUMt/iHZgU1ZykluXjy8NxDhWKTTfjkJBgTXIdZPOZVntejnxbuCBn7l4IL
         jM8Q==
X-Gm-Message-State: AOAM530y7MhOn/To4+YaUMlB3mTpjK8l/VAkIreK8RL8jhtDo1tbEvJQ
        8KVk15rmn7orZ9uDzpabCvY7qQTlbdk=
X-Google-Smtp-Source: ABdhPJz1Js/KalLIi5DMuws5RyKnxzTm+JQM6h0M8LFw6iwbX4PJNsMd9PQLkF2jJ3VvIcALHy+3Sg==
X-Received: by 2002:a17:906:3f88:: with SMTP id b8mr16073076ejj.14.1601902973283;
        Mon, 05 Oct 2020 06:02:53 -0700 (PDT)
Received: from hal.fritz.box (200116b846cf6a005ec5d4fffe9b0465.dip.versatel-1u1.de. [2001:16b8:46cf:6a00:5ec5:d4ff:fe9b:465])
        by smtp.googlemail.com with ESMTPSA id k23sm8131276ejk.0.2020.10.05.06.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:02:52 -0700 (PDT)
From:   =?UTF-8?q?Ga=C3=ABtan=20Harter?= <hartergaetan@gmail.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net,
        federico.vaga@vaga.pv.it, harryxiyou@gmail.com
Cc:     =?UTF-8?q?Ga=C3=ABtan=20Harter?= <hartergaetan@gmail.com>
Subject: [PATCH 1/1] docs: fix kernel-driver-statement rendering
Date:   Mon,  5 Oct 2020 15:02:13 +0200
Message-Id: <20201005130213.74624-2-hartergaetan@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005130213.74624-1-hartergaetan@gmail.com>
References: <20201005130213.74624-1-hartergaetan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove the extra newline and indentation after `J. Bruce Fields` in the
rendered html, and extra indentation in the rendered pdf.

The `J.` sequence was interpreted by sphinx as a letter ordered list
starting at letter `J`.  It produced a sub ordered list as item of the
main item list.

    <li><ol class="first upperalpha" start="10">
    <li>Bruce Fields</li>
    </ol>
    </li>

The escaping is done before the name and not between the `J` and `.` to
keep the name writing intact.

Signed-off-by: Gaëtan Harter <hartergaetan@gmail.com>
---
 Documentation/process/kernel-driver-statement.rst               | 2 +-
 .../translations/it_IT/process/kernel-driver-statement.rst      | 2 +-
 .../translations/zh_CN/process/kernel-driver-statement.rst      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/kernel-driver-statement.rst b/Documentation/process/kernel-driver-statement.rst
index a849790a68bc..3a89fec1882e 100644
--- a/Documentation/process/kernel-driver-statement.rst
+++ b/Documentation/process/kernel-driver-statement.rst
@@ -67,7 +67,7 @@ today, have in the past, or will in the future.
  - Pekka Enberg
  - Jan Engelhardt
  - Mark Fasheh
- - J. Bruce Fields
+ - \ J. Bruce Fields
  - Larry Finger
  - Jeremy Fitzhardinge
  - Mike Frysinger
diff --git a/Documentation/translations/it_IT/process/kernel-driver-statement.rst b/Documentation/translations/it_IT/process/kernel-driver-statement.rst
index f016a75a9d6e..2b4acc95c347 100644
--- a/Documentation/translations/it_IT/process/kernel-driver-statement.rst
+++ b/Documentation/translations/it_IT/process/kernel-driver-statement.rst
@@ -75,7 +75,7 @@ futuro.
  - Pekka Enberg
  - Jan Engelhardt
  - Mark Fasheh
- - J. Bruce Fields
+ - \ J. Bruce Fields
  - Larry Finger
  - Jeremy Fitzhardinge
  - Mike Frysinger
diff --git a/Documentation/translations/zh_CN/process/kernel-driver-statement.rst b/Documentation/translations/zh_CN/process/kernel-driver-statement.rst
index 2b3375bcccfd..a7fac3f04bb1 100644
--- a/Documentation/translations/zh_CN/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_CN/process/kernel-driver-statement.rst
@@ -64,7 +64,7 @@
  - Pekka Enberg
  - Jan Engelhardt
  - Mark Fasheh
- - J. Bruce Fields
+ - \ J. Bruce Fields
  - Larry Finger
  - Jeremy Fitzhardinge
  - Mike Frysinger
-- 
2.28.0

