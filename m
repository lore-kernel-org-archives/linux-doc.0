Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434D0C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 15 Dec 2021 00:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbhLOATd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Dec 2021 19:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbhLOATd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Dec 2021 19:19:33 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCB0C061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 16:19:33 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id k21so27244413ioh.4
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 16:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMAMO0djljzKE3TENnIaAeCLl2cv92t1lTW3pqGBMI0=;
        b=VolncuD+ecLvUJYaYCLJYLHnoSda1ds53ng7/XHsT6rIWQNgZKX7N5dginAgH92FO2
         BoLitBFswKWP4wzRENpMLpf1rMRH7MXB/Kgqlnm2EcGeO2YedQhzsKt3OXP39DX0W2HO
         Lp9HXliGQtlsVv27n8YZl7bI85kk5vXWRwz68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMAMO0djljzKE3TENnIaAeCLl2cv92t1lTW3pqGBMI0=;
        b=VwVk+CufYxolMxSfg6N0d1MiI7YgG0CW9PdQzqcXkJzECzElPnf3WlHgYwo+JYEA+Z
         a9hXjodJctzx7lIMkQ8HTjdeoLW8hCOgWMmvYeZVxT7RKKuWI3zA16Lb1AkFMJCCRtf0
         NmFpmCqk6u8CYmx5xl+pfJijCZrgP/5ahaH1QLop3WVLEB+S6d1ct+5S0ZBxRFgIOg8Y
         WBlqL8vF5l1jhXbw4iIt5EtJcOBYqPsvzxVeQGjk7fO8VxSBHrj0C35Q8wOumFw6MqBf
         +f4lc3NKGjQL7bgJx2lNN/tvs5Nb3wtCp6LWOIjEfrhknUMmG1SylVbW4X+CCP2URwMI
         pKWQ==
X-Gm-Message-State: AOAM531iiKLfJ6RfAOtEtO8fNtMQGCsqo32EAq667oX7IK0oyhUsAgTp
        whse8LiALrsYLjfqn/PiHd9ijw==
X-Google-Smtp-Source: ABdhPJwhscLR8urvPYNYICV9n50i02n9ItYu6S9knOO/0EpDjHr2GIwgeFzqaHpnegAQXSBVR0bqeg==
X-Received: by 2002:a05:6602:24ce:: with SMTP id h14mr5443876ioe.87.1639527572066;
        Tue, 14 Dec 2021 16:19:32 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b8sm258975iow.2.2021.12.14.16.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:19:31 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     corbet@lwn.net, akpm@linux-foundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs/vm: fix Unexpected indentation warns in page_owner
Date:   Tue, 14 Dec 2021 17:19:29 -0700
Message-Id: <20211215001929.47866-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix Unexpected indentation warns in page_owner:

Documentation/vm/page_owner.rst:92: WARNING: Unexpected indentation.
Documentation/vm/page_owner.rst:96: WARNING: Unexpected indentation.
Documentation/vm/page_owner.rst:107: WARNING: Unexpected indentation.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/vm/page_owner.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 9837fc8147dd..9a3af6aafa09 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -89,11 +89,11 @@ Usage
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
-	 // Detailed stack
+	// Detailed stack
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
-	 // Detailed stack
+	// Detailed stack
 
    The ``page_owner_sort`` tool ignores ``PFN`` rows, puts the remaining rows
    in buf, uses regexp to extract the page order value, counts the times
@@ -104,7 +104,7 @@ Usage
 
 	XXX times, XXX pages:
 	Page allocated via order XXX, ...
-	 // Detailed stack
+	// Detailed stack
 
    By default, ``page_owner_sort`` is sorted according to the times of buf.
    If you want to sort by the pages nums of buf, use the ``-m`` parameter.
-- 
2.32.0

