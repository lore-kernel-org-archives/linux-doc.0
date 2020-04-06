Return-Path: <SRS0=nUK8=5W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE64C2BA18
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 07:55:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84E8E206F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 07:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=prytznet.se header.i=@prytznet.se header.b="ME8rhdVn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgDFHzN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Apr 2020 03:55:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37957 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgDFHzN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Apr 2020 03:55:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id v16so13600355ljg.5
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2020 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prytznet.se; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=j2CD7PYQMoilDEnHHFG60n6KX8Uka97ohbUCjI+7rtg=;
        b=ME8rhdVnzsWowRezZDI8BCZ+eJZy0ZPtJ5PXO2XzHqk5HmXPXHRkIQEsG/h/KslskA
         7vdq72BXtEMT7l/j0aRM2H8jde3F+zLAsaZC7Qjnl6k6uXJsItfzp7+59Y/CQHP+SvnX
         xsft4LkE1PA0Mq97twkXqnouAlLRtjBf4k0URAD5ZxzI6r/uxR8Z475gq6TRLNhdDEsa
         /0o0o8dzlYeEokSOyNgPQcOyXljr/4McOclxL05gtbfjnGk0fzBPeGXo3w8pC7vdouJ/
         nL1i7z9KNFpZ4FpkoOiZbvsz6VGOwuEotq5T4Eh1gjouB5Whavf7H50Nr+Z0q3hgnuOl
         /efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=j2CD7PYQMoilDEnHHFG60n6KX8Uka97ohbUCjI+7rtg=;
        b=P6AyQrUj9qzGAgVn6XEkKBlSjNUGawZ3zlGX9/3pH2E924OzJfzjnLhjOLuzAmRvVD
         QkFBfGr9wnTn2szfXxuTkB3i6R8SdActVoEmwZvvGyiuyqRIhg52BVqh0RU1B3JF7MRA
         l3dVmMtxUIya6ig9GyO6+ZrKnBs4rbLUbIzkBWqHM39euvpqDox0blhTknqWT92ixsLz
         8J+TQCVXHZbL1rJbUpm/ofeedOPJS0FiiMfYKKj/Cf1/RjjxuS7fdbybudWFz2SPs8+4
         jx8xuLIxwXHAwhUWN6w/9fIu+Y6bnXd4ppQ1SXlH9WWYEAvxmp1hLgu2AV9tmqsvEPBj
         qoIg==
X-Gm-Message-State: AGi0PuYlCLJ4gcigdhYKUoHNT6cP00GXB85MKCmS68/7ZXSiYSEo4uaV
        9LisnIQaeF6RJFkoP1m1bMIE/BDXJLKR0w==
X-Google-Smtp-Source: APiQypJbz7JKd/JTk+qyO/1IdneHwv2Nouf3A1GfpVZZqIFv0UC8AyzqOmon5HdFAO6bc9Fu6Tsdeg==
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr11171030lji.110.1586159710311;
        Mon, 06 Apr 2020 00:55:10 -0700 (PDT)
Received: from localhost.localdomain ([158.174.82.32])
        by smtp.gmail.com with ESMTPSA id e12sm11834559ljl.36.2020.04.06.00.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 00:55:09 -0700 (PDT)
From:   Vilhelm Prytz <vilhelm@prytznet.se>
To:     linux-doc@vger.kernel.org
Cc:     Vilhelm Prytz <vilhelm@prytznet.se>
Subject: [PATCH] docs: filesystems: fix typo in qnx6.rst
Date:   Mon,  6 Apr 2020 09:55:02 +0200
Message-Id: <20200406075502.9615-1-vilhelm@prytznet.se>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- 'structer' replaced with 'structure'

Signed-off-by: Vilhelm Prytz <vilhelm@prytznet.se>
---
 Documentation/filesystems/qnx6.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/qnx6.rst b/Documentation/filesystems/qnx6.rst
index b71308314070..fd13433d362c 100644
--- a/Documentation/filesystems/qnx6.rst
+++ b/Documentation/filesystems/qnx6.rst
@@ -185,7 +185,7 @@ tree structures are treated as system blocks.
 
 The rational behind that is that a write request can work on a new snapshot
 (system area of the inactive - resp. lower serial numbered superblock) while
-at the same time there is still a complete stable filesystem structer in the
+at the same time there is still a complete stable filesystem structure in the
 other half of the system area.
 
 When finished with writing (a sync write is completed, the maximum sync leap
-- 
2.17.1

