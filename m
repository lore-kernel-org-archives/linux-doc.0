Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E1FC7DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 19:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753233AbeDPTgS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 15:36:18 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:46860 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753391AbeDPTfb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 15:35:31 -0400
Received: by mail-pf0-f194.google.com with SMTP id h69so11000645pfe.13
        for <linux-doc@vger.kernel.org>; Mon, 16 Apr 2018 12:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tuybmXnIw8o7e0ZlNrxSj711s4fTF2uNswv5BobIx2Y=;
        b=KWIcVsbmVyPhQAEmdFl++FxgkrrF5tKlH36pdaix3mBSRyqU/Mu/wpaLdK+aa4VNfB
         xC7/t+/j0ZNPDer8K+ttSD/GztIntk49FTXILAMOiK0F38umiVUbJ0tt6tIgDmMQa85I
         jIzCWvLPCd2wVNSbwAiX5xyb2QdmgnREws1Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tuybmXnIw8o7e0ZlNrxSj711s4fTF2uNswv5BobIx2Y=;
        b=GED5DwRh6R9tmDDm1b1OA3V7ElKFsDmp6mW33mKR2TN11kxr3AFwZgkEuC3CTqi+SD
         g4zPgk+UktKMn8fKowNqVqGCB3PdNbsBiOFXyJzmM9w2zSiBjPwpg17znpFIb8IUad0D
         1+GJ7m+TLHSHVZx4WtxQciE2Zzy1MsoPxsMPRZS6z8V8Q9QaI5sIp9X3MkQ5gmppYPXn
         I3AU16WLxlOl1pBRaQZJcljqiurygabH1pW4Hel0t/ntgxRXZEke0BfkCWgJrluSToR9
         qNAkTNbrh2H3nDoYK0Xf5/FbGnJZh7UaopjFZv0RvpR5/1SnCr/HHDKEr35ZuLedOGVZ
         C96A==
X-Gm-Message-State: ALQs6tDKF3E85IYkuLZ//ncuNY1Ywe8XlW9hAhDQj/QpoFJt8/w5XH3V
        Rqb//yxBemKIMb7IQ4rIw4pIBQ==
X-Google-Smtp-Source: AIpwx4/xCS7yHaKCC6rmheyU5PAS+FpT+1Wb2Dub8EicOwixHx97u9GX7IGLy5GlJDV1fYzA9BvJ8A==
X-Received: by 10.101.76.77 with SMTP id l13mr13860341pgr.192.1523907331111;
        Mon, 16 Apr 2018 12:35:31 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b78sm7038785pfj.6.2018.04.16.12.35.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 12:35:30 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben.Gainey@arm.com
Subject: [PATCH 1/3] coresight: Remove obsolete reference to "owner" in CoreSight descriptor
Date:   Mon, 16 Apr 2018 13:35:25 -0600
Message-Id: <1523907327-20979-2-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523907327-20979-1-git-send-email-mathieu.poirier@linaro.org>
References: <1523907327-20979-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Field "owner" of struct coresight_desc has been removed a while back but
the documentation was not updated to reflect the changes.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/trace/coresight.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
index 6f0120c3a4f1..710c75b6c73f 100644
--- a/Documentation/trace/coresight.txt
+++ b/Documentation/trace/coresight.txt
@@ -187,9 +187,6 @@ that can be performed on them (see "struct coresight_ops").  The
 specific to that component only.  "Implementation defined" customisations are
 expected to be accessed and controlled using those entries.
 
-Last but not least, "struct module *owner" is expected to be set to reflect
-the information carried in "THIS_MODULE".
-
 How to use the tracer modules
 -----------------------------
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
