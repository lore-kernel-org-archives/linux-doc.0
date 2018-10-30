Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60A277D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 05:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbeJ3OHh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Oct 2018 10:07:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33502 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbeJ3OHh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Oct 2018 10:07:37 -0400
Received: by mail-pl1-f196.google.com with SMTP id x6-v6so4934539pln.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Oct 2018 22:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RCjkjiTRGgZL2A0FAx+5895V+sW9tiOmXxjM8S1+Okk=;
        b=IjJxFoePkltq37DEUMfY5cZa3fiOA909kBsNXCt/vf2itu+FsMoBX1SU8HhrtbHUPa
         MgcNU1BKTergtaT/vBzoVeH4zEn49UKos68wRO4/vU5QcbSdHPFA3KpMsoX/s7VE/IgU
         fGjE2eqFpzht0Q2mJGvnXGYo0+SLkAbss7ioQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RCjkjiTRGgZL2A0FAx+5895V+sW9tiOmXxjM8S1+Okk=;
        b=Mz9FKjxYlhktEMJrmGmUhdlFodkZ1DUrOnbYMuUlkqjU+94H9pGn41ZLKilXSCbdc7
         9OUhXts1+T45AdlfonJEQt8Gx585EF0+7+LILi8o6SsiGOnMD6+DWc3+TNtv5Dca1wxE
         NP3Vgqhz0A5W9DFszp6kCJaLthOi1ZvgnLMD6SFRiMjGlgAxL+e7IY5DX/dJ7k/RXRnh
         SiEJyVjSOZ2EZAvBcks24xY6nQYDgssHvmrOShMlPCV8t7QL7T5LldVZYHgety1Bh/t9
         RoymKJ6shpJByqVhYdVAI5wjjiNMse2UyaE3iggR8M3mP7Nvl0mn73UO4DBFOwGVKpHA
         gWpw==
X-Gm-Message-State: AGRZ1gLxwbuQfoPPJm4IAXEV7zlFNgbO//YjBaHC37VVdGuumwIY1YJa
        Rgp42k5HZTiyvTJ8TS6zr/Y6fw==
X-Google-Smtp-Source: AJdET5cabykt6yrZFLTct9Z0C4l+VLI+9y3OMGbHfHame3WREXzHr6RT5eJk0gU6AAGkvhq/C2qbVA==
X-Received: by 2002:a17:902:8d83:: with SMTP id v3-v6mr17238139plo.162.1540876539636;
        Mon, 29 Oct 2018 22:15:39 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id z5-v6sm10985602pfd.99.2018.10.29.22.15.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Oct 2018 22:15:38 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH] doc: correct parameter in stallwarn
Date:   Mon, 29 Oct 2018 22:15:34 -0700
Message-Id: <20181030051534.256658-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.1.568.g152ad8e336-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The stallwarn document incorrectly mentions 'fps=' instead of 'fqs='.
Correct that.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/stallwarn.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/stallwarn.txt b/Documentation/RCU/stallwarn.txt
index b01bcafc64aa..073dbc12d1ea 100644
--- a/Documentation/RCU/stallwarn.txt
+++ b/Documentation/RCU/stallwarn.txt
@@ -205,7 +205,7 @@ handlers are no longer able to execute on this CPU.  This can happen if
 the stalled CPU is spinning with interrupts are disabled, or, in -rt
 kernels, if a high-priority process is starving RCU's softirq handler.
 
-The "fps=" shows the number of force-quiescent-state idle/offline
+The "fqs=" shows the number of force-quiescent-state idle/offline
 detection passes that the grace-period kthread has made across this
 CPU since the last time that this CPU noted the beginning of a grace
 period.
-- 
2.19.1.568.g152ad8e336-goog

