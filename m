Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7660EEE49B0
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 11:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239369AbjHXLU5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240994AbjHXLU3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 07:20:29 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1752219BD;
        Thu, 24 Aug 2023 04:20:26 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401b0d97850so2371455e9.2;
        Thu, 24 Aug 2023 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692876024; x=1693480824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHo0WyP8xgW16yDEg6dBt6z1hcOwztrudJTUIb2n8nc=;
        b=seq9zvt5ElfFLErccMzSgjRYXACItf1unV/E6WOrf4yInZgbx3A29TwlPpRXG4NLUu
         3nwGAl9G+PPwTo2kBU4O1b031ycLJxCavKi3AiQPHigyl40Ol9VuIqunYrCSZqi3XAoH
         frUBdH5PpPECooLacJT7Ai337TtfiUA6QKiw/gtc/+RUTDyF2rjABnJ47hm+WEDSUz8a
         k0vySsd9AmmB2Ouxa5MNCRUsaPA7pUFkUFUKeEbPWtTMipR3jA+6Raqw43qZpWGGk9G7
         tUT6hE1m8/wN5mdNdtSx2lFrQDp7i99vbriX8tlRPjlQtjkhT2Rmjts2gvgA8sxsDnkn
         jnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876024; x=1693480824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHo0WyP8xgW16yDEg6dBt6z1hcOwztrudJTUIb2n8nc=;
        b=Hjg6KlS9/xI5I2J8H4UxY85bSeYCSketQEU7WScHLsmtihtrVwvsVsIrlhScdfSvqz
         7Qz3TLeHskuDG7QhhawT+JJgpIoHDwdJIdLwzxTE23EsNVg2GKKqIVNhsz0ja6/wRPez
         miEyI+YLRcJ8RtrJrSa7p75EXdYmg2ypBKy8YBikhZ5b2QXze/9RXmryAvClhvZze4jG
         XRA6aSR67hprS4O9yaviJEJSoxOzOEUvMyK6H9/8t6g78SEZHdME3wdpvFoKaSeTyoIH
         iX/GBKbatThNm/bIKff7MmcxciCEzAy3sw4JcF62eVVTMeBePGQzrzOOX5+e+dVIJM7h
         xlqw==
X-Gm-Message-State: AOJu0YzDzUttCZCq0yzEDSKNXUjdaxyEOPdWIGJBy7RPhPGe4Vl057pt
        Fykjb2dZ/hGmS/3gey+KxmPm0Rd6v0pNQQ==
X-Google-Smtp-Source: AGHT+IHnl200izGVnvM+E3LfWpfRIWzbCiPiStalVBBSzXeLRQxTd+f0zXrlXR9BPkRnv3YAdWIhtQ==
X-Received: by 2002:a05:6000:8b:b0:314:36f0:2214 with SMTP id m11-20020a056000008b00b0031436f02214mr10472163wrx.6.1692876024049;
        Thu, 24 Aug 2023 04:20:24 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:1a5:1436:c34c:226])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm21875295wru.54.2023.08.24.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:20:23 -0700 (PDT)
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
Subject: [PATCH net-next v5 08/12] tools/net/ynl: Implement nlattr array-nest decoding in ynl
Date:   Thu, 24 Aug 2023 12:19:59 +0100
Message-ID: <20230824112003.52939-9-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824112003.52939-1-donald.hunter@gmail.com>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
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
2.39.2 (Apple Git-143)

