Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C03CEB64DC
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jun 2023 18:21:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjFYSVY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jun 2023 14:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFYSVW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jun 2023 14:21:22 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D840EFF
        for <linux-doc@vger.kernel.org>; Sun, 25 Jun 2023 11:21:19 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F18D3F18A
        for <linux-doc@vger.kernel.org>; Sun, 25 Jun 2023 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1687717278;
        bh=wxjGe/lCblUrN68a4XQN1nsTtxNGrWMej+sIZU4igV4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=HrfyLzjLMyKJ4XmRjDsZOa3S4jQIkX1H8wrFu6AXCaikUzlWlBetEFwsGjhC+nlZ8
         EfKz4iSQPTd1iFlIAIpiR6W9W1IAdFlT/wYWmHwHr0nksPbCbMbI51xwVuw8D4bU93
         +fMXOKDkrTO0P0dtv69inRJa1FdW52ktF2JGPSzUxIq1GDAf+NwYjUnH+52wvBSZX2
         kNKQjWuzLvQ4GZrZXu8OJiDNeNrWTxUJ0QhUjzeDvBpRc5iHAgl4qHJqDNGqtKdRC0
         hAHN69HrY8fwZYCihg7BLrRrV92Fw7GPgjKhDyV+LWlyJx9HDYZQ2c4Pq+A8wNZsQ/
         73o9U0Hs+zlOA==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3112808cd0cso1640451f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Jun 2023 11:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687717277; x=1690309277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxjGe/lCblUrN68a4XQN1nsTtxNGrWMej+sIZU4igV4=;
        b=XMHQ82/QWcq3D2KTMx084uv0cVYWTlnUsarsHxrvT8x39vYHql99u2L4m5BbFBNJ/X
         BoCPJJeicNgKt0YiTCKdYeWSF47BoyeggDT9THJobkQAJu07luYyYS7AcoL4YIoDTG+z
         jQ+BSHipHCgzFMvEelwDaGgDsG8UajMeXMWvtM4mmb5y423s3JM2oYEwj4JcS/P65chv
         SQnxC84HYD6Zh/pzq2mWV83ZZawdI0nX1s9p50vENa6ECWNVLwRLmDvloDzB3CxQ1cJI
         Ap81FxPPJzzNWMsZhEjsIwATJIk9ajvq03zuFGBqif+dwZ0HCWPPS81DahoaTNSHzECq
         03rA==
X-Gm-Message-State: AC+VfDwtRfyAnILrRb964UQ1uO39o3v0fUGYh5z5DL2LQq+Vcr/rQu7E
        33LNNELTWz2rvj9P5wOepmnnddDjSE+G/8n/XSSEcoGTT+ldzgoJ+IjZ2GS257IOx0JxnCH+qxx
        yBkpJiV9Wy3ca2G+5SGzqbbaHkAYnaA0+oum9Vg3HwW7j6g==
X-Received: by 2002:a05:6000:128b:b0:313:e355:3882 with SMTP id f11-20020a056000128b00b00313e3553882mr3748696wrx.44.1687717277251;
        Sun, 25 Jun 2023 11:21:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6S30lL42ngZfRs+yinpa3JZs4sM3LVRhFsZUquMzyoXVAp6yKc2+J/eKRyo5ftDBg6DZwYnw==
X-Received: by 2002:a05:6000:128b:b0:313:e355:3882 with SMTP id f11-20020a056000128b00b00313e3553882mr3748675wrx.44.1687717276747;
        Sun, 25 Jun 2023 11:21:16 -0700 (PDT)
Received: from amikhalitsyn.local (dslb-002-205-064-187.002.205.pools.vodafone-ip.de. [2.205.64.187])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm5190381wri.73.2023.06.25.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 11:21:16 -0700 (PDT)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     brauner@kernel.org
Cc:     linux-fsdevel@vger.kernel.org,
        Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Seth Forshee <sforshee@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: filesystems: idmappings: clarify from where idmappings are taken
Date:   Sun, 25 Jun 2023 20:20:47 +0200
Message-Id: <20230625182047.26854-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let's clarify from where we take idmapping of each type:
- caller
- filesystem
- mount

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
v2:
	- fixed https://lore.kernel.org/oe-kbuild-all/202306252253.qxHG1txo-lkp@intel.com/
---
 Documentation/filesystems/idmappings.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/filesystems/idmappings.rst b/Documentation/filesystems/idmappings.rst
index ad6d21640576..f3d168c9f0b9 100644
--- a/Documentation/filesystems/idmappings.rst
+++ b/Documentation/filesystems/idmappings.rst
@@ -373,6 +373,13 @@ kernel maps the caller's userspace id down into a kernel id according to the
 caller's idmapping and then maps that kernel id up according to the
 filesystem's idmapping.
 
+From the implementation point it's worth mentioning how idmappings are represented.
+All idmappings are taken from the corresponding user namespace.
+
+    - caller's idmapping (usually taken from ``current_user_ns()``)
+    - filesystem's idmapping (``sb->s_user_ns``)
+    - mount's idmapping (``mnt_idmap(vfsmnt)``)
+
 Let's see some examples with caller/filesystem idmapping but without mount
 idmappings. This will exhibit some problems we can hit. After that we will
 revisit/reconsider these examples, this time using mount idmappings, to see how
-- 
2.34.1

