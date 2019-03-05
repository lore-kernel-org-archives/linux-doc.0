Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75A1E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 10:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfCEK4Y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 05:56:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52672 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfCEK4X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 05:56:23 -0500
Received: by mail-wm1-f68.google.com with SMTP id f65so2089607wma.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2019 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZViCH+TS4lSxA2PPw2VWHlLppPCsdU1EeGaqIlVvosc=;
        b=O7jHy8fzQV44BnKnDoefKBsY9CjMXOs80HUIN7pc59JtsjCM9edZOgQbtmZ7W4qigX
         34grfZLCJDg67LnuB4obquCyNnK7UYNYTlBsS97WfazNkMkX2zXGHGSbFFQDRlwcKc9V
         urgXvoNuzR6wrRIp98zT99mERoHVHPL9PaOxq1ZMztdM6UrBSC5AZv2yJhGpJa0IAk1T
         Tjbgn33c//VP97svry9P90c274TV89TJ9qsa12IwV+PhZonCEzqxLWpekOhrmZ00VLPY
         ld0BbPNm8oTp5KRRUC7GCPnvnaIu8RE+J2Pp/7kqF93csxvJx2v10adZi6IzsLaDcpEK
         i99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZViCH+TS4lSxA2PPw2VWHlLppPCsdU1EeGaqIlVvosc=;
        b=Xey1EaPvpBqITNieVYdwLHAbNii7WaS4+Q+lvLSOzhN8LGmJZXXU1Y8OSTe0qE3Fh+
         4vItChJSgMQqFkA2dDaGPEtc5t4WlfZy2jRVVqBUoHGBAN9Ut+oqWLk12IPjQjzhqZgN
         XkcSRPB7a2NQHrPnGyLokr+QBMVTXcX3Dr/2F6I9BlaQgrIoj8a0Uln68uUOJsnXxhEf
         SOXleBTDrl4I6subw0D+AcHasUzHfUVvIB8OXfyWhVzkt3LLlmacEI0iAIhYdJp7zTnM
         wjNA8drVOwv4vuMaMyGs7+0qEdCCI7G6nYecoK42XeDBKln2vAxMHWTA7kUQoBHL4l85
         PZAA==
X-Gm-Message-State: APjAAAUxyf0U2P8i3R0PBOb2JOqSyGJNhC7CUcNJhBhYjpg4CJYu+0+L
        37oPMwhArM2zkxuWLJilyrFHbBcf0Aw=
X-Google-Smtp-Source: APXvYqy3PbEac/ieqYlfR0bFepRgY7rM/wRNPEDkHMV52mbVix74GaKeoNCZ0GtadrYkVY5FA8N7eg==
X-Received: by 2002:a1c:7e58:: with SMTP id z85mr2391680wmc.52.1551783381694;
        Tue, 05 Mar 2019 02:56:21 -0800 (PST)
Received: from tim.wework.com (66.157-14-84.ripe.coltfrance.com. [84.14.157.66])
        by smtp.gmail.com with ESMTPSA id v20sm9519335wmj.2.2019.03.05.02.56.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Mar 2019 02:56:21 -0800 (PST)
From:   =?UTF-8?q?Timoth=C3=A9e=20Isnard?= <timotheecisnard@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, trivial@kernel.org,
        =?UTF-8?q?Timoth=C3=A9e=20Isnard?= <timotheecisnard@gmail.com>
Subject: [PATCH] Documentation: admin-guide: Fix minimum required gcc version
Date:   Tue,  5 Mar 2019 11:53:03 +0100
Message-Id: <20190305105303.30838-1-timotheecisnard@gmail.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Timothée Isnard <timotheecisnard@gmail.com>
---
 Documentation/admin-guide/README.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 47e577264198..a582c780c3bd 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -251,7 +251,7 @@ Configuring the kernel
 Compiling the kernel
 --------------------
 
- - Make sure you have at least gcc 3.2 available.
+ - Make sure you have at least gcc 4.6 available.
    For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
 
    Please note that you can still run a.out user programs with this kernel.
-- 
2.21.0.rc0.258.g878e2cd30e

