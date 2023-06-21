Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C68EB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 10:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjFUKBC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 06:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbjFUKAg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 06:00:36 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EEFA3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 03:00:32 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 045DF413A7
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1687341631;
        bh=AWRzGH6ZSf0xboDPPn0o1FV8eJ+EiIwoZtGC1w36Sx4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=nqu1JkirYUkOEdGHVEhH/aR0NNjp1f1qbE/AEXuI2JVp0Kn0OU6gJQh2NjUNqVOwg
         wYKXfkFLrezQcc2P2DUQvghcBeZ6xutsm4ivyP/d5rdQDt/vhk+0SDU8fTvIFDiFai
         L7E5SptSUmUemuEwrZ7lOTgx00s0lLTmmo7ObKyaVcPGzN6EMwSVvXfdJaCYTzIbQZ
         c2LBrvKmrhWpxryAI+UelJhUPc0CKANWfQO3MPIU+PhB6OdwFsdZdxrt0pz7iBk3KJ
         Z/asdnlM08lbG7IoQR2aoqVY0lvJd6vGyApocjXOMMrMMO/lY4Ggb9ALv6wbkKmAuV
         x2Sltm+2heCDg==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31275d62506so1117283f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 03:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687341630; x=1689933630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRzGH6ZSf0xboDPPn0o1FV8eJ+EiIwoZtGC1w36Sx4=;
        b=ZQO4eR77Cw1sr2eSiBL8Qyy2+ilM9VtSb/0tshZRtJE9/lQ2yBGiD7qNuivJdnLv9m
         icocpXIHCWmsljOcRL4V99ueUU5AqNhK9+ZrjBKnSxApqB637+AjpjCOT1yrMIB7EPYT
         YXJOUI7Ozg3oj49Upw0Nn3+/PA3FoiDE+9j8+LNGyQybjTxEVnsTCgJDBfrdsslrNfDJ
         WhKMuCqXAcjWzCGB29HwaWJswRiqdZQCHp+p9dnRZMgWSCov+Auicr94SF8CHgZa2dmH
         vnXI7dbEXmRPbeXvBF1WQP3lPLTwC6xBJKtthgytx5dm9bPCr44cDEwRKEY00edlY5kG
         aeBg==
X-Gm-Message-State: AC+VfDwFEwdcNB1WzyS/+oajsnI4B125hbfwoCVCev7c9tUUbdhJGoaW
        IYrFlx5byiOMVDWU76CFyKNDune8rwBr/c+8+vI8/YuLhWjok/oP19596U7ZwdZl6T1cjA01x0E
        GooYFyGv+0rGAArwtZp6w/8oFbSUKJiXkH/VGDw==
X-Received: by 2002:a5d:6ad1:0:b0:311:18ce:152b with SMTP id u17-20020a5d6ad1000000b0031118ce152bmr9508845wrw.61.1687341630631;
        Wed, 21 Jun 2023 03:00:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oq+fIPGFA+sWLn7jvMuxe5Lvalcwkqv7UzsK6f+Iq0Y+CIzxjFvRPS+Xk+lXhEcKckC55vw==
X-Received: by 2002:a5d:6ad1:0:b0:311:18ce:152b with SMTP id u17-20020a5d6ad1000000b0031118ce152bmr9508830wrw.61.1687341630348;
        Wed, 21 Jun 2023 03:00:30 -0700 (PDT)
Received: from amikhalitsyn.local (dslb-002-205-064-187.002.205.pools.vodafone-ip.de. [2.205.64.187])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d58ca000000b003111fd2e33dsm4024427wrf.30.2023.06.21.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:00:29 -0700 (PDT)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     brauner@kernel.org
Cc:     linux-fsdevel@vger.kernel.org,
        Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Seth Forshee <sforshee@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: filesystems: idmappings: clarify from where idmappings are taken
Date:   Wed, 21 Jun 2023 11:59:05 +0200
Message-Id: <20230621095905.31346-1-aleksandr.mikhalitsyn@canonical.com>
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
 Documentation/filesystems/idmappings.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/filesystems/idmappings.rst b/Documentation/filesystems/idmappings.rst
index ad6d21640576..c20382f8bbb0 100644
--- a/Documentation/filesystems/idmappings.rst
+++ b/Documentation/filesystems/idmappings.rst
@@ -373,6 +373,12 @@ kernel maps the caller's userspace id down into a kernel id according to the
 caller's idmapping and then maps that kernel id up according to the
 filesystem's idmapping.
 
+From the implementation point it's worth mentioning how idmappings are represented.
+All idmappings are taken from the corresponding user namespace.
+    - caller's idmapping (usually taken from ``current_user_ns()``)
+    - filesystem's idmapping (``sb->s_user_ns``)
+    - mount's idmapping (``mnt_idmap(vfsmnt)``)
+
 Let's see some examples with caller/filesystem idmapping but without mount
 idmappings. This will exhibit some problems we can hit. After that we will
 revisit/reconsider these examples, this time using mount idmappings, to see how
-- 
2.34.1

