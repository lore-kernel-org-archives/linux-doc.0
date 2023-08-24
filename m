Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B60AC3DA6F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 11:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjHXLUv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239344AbjHXLUT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 07:20:19 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582EC10FA;
        Thu, 24 Aug 2023 04:20:17 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31aeedbb264so4494648f8f.0;
        Thu, 24 Aug 2023 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692876015; x=1693480815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guMXOiwH+7PQQTpnwzBFMxTJ+ih2dVZbmeyJv2NUgGc=;
        b=OS3YYLz9l6NBxtiAGDWVdQnHrrZPaImf2cF1cF+GuasSnBd2geakFM8oIxIErcuAij
         y4Ef0P6fNLjsl856KrLN1YSTbeU1b8PyXbwiXYmlDbDJDTUeMJwwTB/A9tXZqf6p4PDw
         TzTte0IcAjUcUvDTei+ALMWaH/PxQadRJYPHVUP00nDnjFQem1xgSl9+Ec1XuxQDstjn
         whDgc6xSZtqnsPlZHLYysSV2LJ/bSXBfsGKHsLykE00dRts66/5bLxJ7I0UtQqvl9guC
         96KFrp/xML35Kr5sJl7AzxugvvBCyB0bHgBdzJkNuzQVz/kA31hLdFTueuNASOgxS/jd
         /dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876015; x=1693480815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guMXOiwH+7PQQTpnwzBFMxTJ+ih2dVZbmeyJv2NUgGc=;
        b=KR7mXh2C6Omcwzzb8/BLeEHk3o7VWDvyuQJysxf1ym/AuHNpxQB3sdtjUuTgBDSDxG
         xuYol+hzmkHhtD4v2GlIovCeGStw12I7i+JLW1OSM0bJ80r3PUwK8RCswDALmIV3IpB/
         f/bZV9vHpP1JtamhnI3V6154QzwtgmdVNEkcgNZNIK41Xi/DhPRfs7xqtNbAnV82o9Ua
         N+g1EZSKrTE/VPWMz60URqIw5unj4cs9hHqAo/MLwPpq6fqXuZaLJ7BE5wsRzaCkZp27
         Q3J/TR4vKUsbUsJ0M9gK+R8WGFUr3fTULG9TO4soo4eSp2taP5HcUTJ7uaHf9r/P2/zD
         xEig==
X-Gm-Message-State: AOJu0YxfSr4Nt1s2cIWqCsHS4IqoTbE7oDbZr0JL4LNU3Tw+a8/TshMv
        CM+cgzI5oD4fIvwNpy/WumgZd9cQAvzdHQ==
X-Google-Smtp-Source: AGHT+IFJ/Ft4r+NCLXk6RxHfgkxBlr1aYmpuHuN0w2hcOdOC0nr4JlP6LgmyAZbUQ8bJIfR83C2eYA==
X-Received: by 2002:a5d:4a12:0:b0:318:7bc:122e with SMTP id m18-20020a5d4a12000000b0031807bc122emr11658199wrq.23.1692876015175;
        Thu, 24 Aug 2023 04:20:15 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:1a5:1436:c34c:226])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm21875295wru.54.2023.08.24.04.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:20:14 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v5 01/12] doc/netlink: Fix typo in genetlink-* schemas
Date:   Thu, 24 Aug 2023 12:19:52 +0100
Message-ID: <20230824112003.52939-2-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824112003.52939-1-donald.hunter@gmail.com>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix typo verion -> version in genetlink-c and genetlink-legacy.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 Documentation/netlink/genetlink-c.yaml      | 2 +-
 Documentation/netlink/genetlink-legacy.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/genetlink-c.yaml b/Documentation/netlink/genetlink-c.yaml
index 4c1f8c22627b..9806c44f604c 100644
--- a/Documentation/netlink/genetlink-c.yaml
+++ b/Documentation/netlink/genetlink-c.yaml
@@ -41,7 +41,7 @@ properties:
     description: Name of the define for the family name.
     type: string
   c-version-name:
-    description: Name of the define for the verion of the family.
+    description: Name of the define for the version of the family.
     type: string
   max-by-define:
     description: Makes the number of attributes and commands be specified by a define, not an enum value.
diff --git a/Documentation/netlink/genetlink-legacy.yaml b/Documentation/netlink/genetlink-legacy.yaml
index 196076dfa309..12a0a045605d 100644
--- a/Documentation/netlink/genetlink-legacy.yaml
+++ b/Documentation/netlink/genetlink-legacy.yaml
@@ -41,7 +41,7 @@ properties:
     description: Name of the define for the family name.
     type: string
   c-version-name:
-    description: Name of the define for the verion of the family.
+    description: Name of the define for the version of the family.
     type: string
   max-by-define:
     description: Makes the number of attributes and commands be specified by a define, not an enum value.
-- 
2.39.2 (Apple Git-143)

