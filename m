Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FD487D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 22:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbfA2WFz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 17:05:55 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42769 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727342AbfA2WFz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 17:05:55 -0500
Received: by mail-qt1-f193.google.com with SMTP id d19so24116434qtq.9
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 14:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tycho-ws.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WkHarLW31VHhafsMLD+STTdwmaZxaox2qI9bgB04JG0=;
        b=lIZCE47QO4ruAuG7mEKE5RqYOEDbqoMi9pdEVriPnR6HZHSISlyGSkUpCn8Tlo7u5n
         +h9EjXiZyXJpxNVRBYD2C4iMmB/PIxJvAShetPIW7NpIOamXMale0E/g/ambvX9n2BMh
         0b6beIHUOb5b2zrAUzTIUCPQx+qL3VScwUZkj4XuiCQSSr836TwLj2PvY5wVVcuPlBOM
         9ftXuddhSyiJrk1qsECUwAb1igl0TNeo0XvZD0HZ1Ljl08J1h59KIRX6vq5/j5JajU/+
         g8gtsCyncbMlQElLCJJ+6k3dhZXsqT3k/N4MKFxNnJ7dYkBoOjBmijfXZ7pT8QmGmllD
         Fh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WkHarLW31VHhafsMLD+STTdwmaZxaox2qI9bgB04JG0=;
        b=Abf3l7zvg2qFhdpJEdw+hr9mFRMCk3UKOnHf8kPtqbRtoPgiK/iAGH23a+m2mg8iA0
         sNnLVgPMrTvlz3Pyvixnq1TEfWBXqEcMxUfDss+k+ATqinsgzB/4jkhRQrrz12lJXRgj
         zKwSdf/pslTEPNVqZx/LssP04RtP6WTNRb+SSX8BxzUrQ7BotksxyPJ768TUz9//f4Mr
         RSu5htLtvMK4l0dd9Z1NpQrsvh08zTgZqUWWT9wpUbtIMnX0qy7qBhd5/qSPyEiHJk2K
         AnPGwrKFKJRI61cKSVb3o4phnLKUsTykYVSarPB7yPvG9Ko5vxgpHl+s9VMTIaQm5Fc5
         0AEQ==
X-Gm-Message-State: AJcUukfiHqmFQY1Oj0Bx70AY30hGwnrLoCY7ddmGtoxdrBjjNEe7RKCK
        6pVgPHyyXlk2NnX0swYhjnb9Mw==
X-Google-Smtp-Source: ALg8bN4pOMBy+u8RtCDsgTP+6S2tW5CUY+fHPGfE1S5MDdPzMFEaii/GCYnhrowG6p2EuPoapC4BSw==
X-Received: by 2002:a0c:e105:: with SMTP id w5mr25952350qvk.234.1548799554220;
        Tue, 29 Jan 2019 14:05:54 -0800 (PST)
Received: from localhost.localdomain ([205.153.92.177])
        by smtp.gmail.com with ESMTPSA id w52sm93299565qtc.51.2019.01.29.14.05.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 14:05:53 -0800 (PST)
From:   Tycho Andersen <tycho@tycho.ws>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Josh Triplett <josh@joshtriplett.org>,
        "Paul E . McKenney" <paulmck@linux.ibm.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Tycho Andersen <tycho@tycho.ws>
Subject: [PATCH] rcu docs: repair some whitespace damage
Date:   Tue, 29 Jan 2019 15:05:46 -0700
Message-Id: <20190129220546.12934-1-tycho@tycho.ws>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While reading the docs I noticed some whitespace damage in diagram. Let's
fix it up to be consistent with elsewhere in the document: use one leading
tab, followed by spaces for any additional whitespace required.

Signed-off-by: Tycho Andersen <tycho@tycho.ws>
---
 Documentation/RCU/whatisRCU.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.txt
index 4a6854318b17..419ec18b87bd 100644
--- a/Documentation/RCU/whatisRCU.txt
+++ b/Documentation/RCU/whatisRCU.txt
@@ -310,7 +310,7 @@ reader, updater, and reclaimer.
 
 
 	    rcu_assign_pointer()
-	    			    +--------+
+	                            +--------+
 	    +---------------------->| reader |---------+
 	    |                       +--------+         |
 	    |                           |              |
@@ -318,12 +318,12 @@ reader, updater, and reclaimer.
 	    |                           |              | rcu_read_lock()
 	    |                           |              | rcu_read_unlock()
 	    |        rcu_dereference()  |              |
-       +---------+                      |              |
-       | updater |<---------------------+              |
-       +---------+                                     V
+	    +---------+                 |              |
+	    | updater |<----------------+              |
+	    +---------+                                V
 	    |                                    +-----------+
 	    +----------------------------------->| reclaimer |
-	    				         +-----------+
+	                                         +-----------+
 	      Defer:
 	      synchronize_rcu() & call_rcu()
 
-- 
2.19.1

