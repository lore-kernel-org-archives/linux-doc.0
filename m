Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E86AEE49A6
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 12:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244819AbjHYM30 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 08:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244896AbjHYM3K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 08:29:10 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89852700;
        Fri, 25 Aug 2023 05:28:45 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b962535808so12984821fa.0;
        Fri, 25 Aug 2023 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966497; x=1693571297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOtp+o7cMmJlxmTzTz1LmUt8mH7fUN88EQ5doj+/DCU=;
        b=WxXcX/ZCl5+ZThzOXWyg9JfSbZ03mJH9r+GibNsDhHvRcdglSg60ALa7+PMzocZxTX
         nwKfzCHHoWVsLHj2aCXO8LzEUnC1a2QM9ttC4XUXJGUed5qa5Ag50Tmd81HCQqcNCKKJ
         yaPC3VvOuYVabGdE1PlFogiEk/xwMGIAozhrZjT4TThoRA30TUwVoOG17G9ut+NPAuhS
         J1Q+3KFPHj/2IzaAKWDGXN/+xBaUG+Q+wCmBGzwGCl83vUirMLcRi/l2vP243fduLJM+
         +ajM+p3sYRemPJ5MXAiQGS+64TjHBnakOZ2bcBWlFCVk9V4UOvhT57NfSXa2qp7ytNC3
         Sp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966497; x=1693571297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOtp+o7cMmJlxmTzTz1LmUt8mH7fUN88EQ5doj+/DCU=;
        b=LhuksE/L0SaOF1YwZrunpQWKG4JFoUn9kNjQlF705v8Jbp0iDQVyfp37pLpT8PUcfN
         kTEHGPD+wvVzbP1OObKTq6+l3fhGVRbJJTw9KSE4Ve7oH5nP11TlVqUuNMdkm86p97p9
         KHbBoOtM/owfiN6o1zqpLmjLzN22/sZ7f7GpTRr59QQIsx+nDDGwCaIGrlahzTchGn6q
         FjmJuNPIOhjzJZE/d6u3yUo+zOAfk454cSJCeXXl7M4kMem7AgUqT5nJnBIVLPgtF30c
         7dRiC+5A+wtvZkogg9YaFjhTmqnVOIETZ/1etjFxgG2iJqezIokJKQjINmWL0Jz3a/DU
         l8sQ==
X-Gm-Message-State: AOJu0YzUFwAV8m/21pZlBl9o9OJRhWLmzMSUNSQWay9Go9NuRtI8/Hx1
        vUS3/Sphm/2zqZCqD0rgGjNRlSsq1Wo9hg==
X-Google-Smtp-Source: AGHT+IGjkuUQdzjDQcw+R4NqMTuOGjSsPqNlV8WbG/QbTntxRXYO66yoZvp1sVz7Q9ayz/PwWKhQLw==
X-Received: by 2002:a2e:b0c9:0:b0:2b6:fa8d:ff91 with SMTP id g9-20020a2eb0c9000000b002b6fa8dff91mr14244107ljl.3.1692966497395;
        Fri, 25 Aug 2023 05:28:17 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:88fe:5215:b5d:bbee])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003fff96bb62csm2089561wmf.16.2023.08.25.05.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 05:28:16 -0700 (PDT)
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
Subject: [PATCH net-next v6 08/12] tools/net/ynl: Implement nlattr array-nest decoding in ynl
Date:   Fri, 25 Aug 2023 13:27:51 +0100
Message-ID: <20230825122756.7603-9-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825122756.7603-1-donald.hunter@gmail.com>
References: <20230825122756.7603-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for the 'array-nest' attribute type that is used by several
netlink-raw families.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 tools/net/ynl/lib/ynl.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index e5001356ad0c..5d04a2b5fc78 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -492,6 +492,17 @@ class YnlFamily(SpecFamily):
                 decoded = NlAttr.formatted_string(decoded, attr_spec.display_hint)
         return decoded
 
+    def _decode_array_nest(self, attr, attr_spec):
+        decoded = []
+        offset = 0
+        while offset < len(attr.raw):
+            item = NlAttr(attr.raw, offset)
+            offset += item.full_len
+
+            subattrs = self._decode(NlAttrs(item.raw), attr_spec['nested-attributes'])
+            decoded.append({ item.type: subattrs })
+        return decoded
+
     def _decode(self, attrs, space):
         attr_space = self.attr_sets[space]
         rsp = dict()
@@ -511,6 +522,8 @@ class YnlFamily(SpecFamily):
                 decoded = True
             elif attr_spec["type"] in NlAttr.type_formats:
                 decoded = attr.as_scalar(attr_spec['type'], attr_spec.byte_order)
+            elif attr_spec["type"] == 'array-nest':
+                decoded = self._decode_array_nest(attr, attr_spec)
             else:
                 raise Exception(f'Unknown {attr_spec["type"]} with name {attr_spec["name"]}')
 
-- 
2.41.0

