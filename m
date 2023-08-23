Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F78EE49B2
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 11:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbjHWLm1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 07:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbjHWLm1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 07:42:27 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F74CD0;
        Wed, 23 Aug 2023 04:42:25 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40061928e5aso2500645e9.3;
        Wed, 23 Aug 2023 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692790943; x=1693395743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGTcE4hW1wmK3YLI+VZd9ibjhnWGHcOir/OGBUb1v5g=;
        b=i11LrcsAickTUTniS8kLlbyF1zbAj6BJScxYqyh63uBZxJHtJQ9s5OsULLNPXnJTqw
         FdSEOQH/A5XzRavauj/bjA9JtxTOUaWe131qlXIJV7jQM1H5WpRD86oZ+l16FBDG+Mot
         asMYJ1v/nIlTj//0uS1JA694vEeOXRYv5OHacmjkHE1x7lC+RjBAF5oinaVWXmmJqBBW
         36J6t99lllKJCiyP+Tkn8ZmPhako4Uc4rgk2kmrUrFapxekiH56LaEgYdp2OLvEIlEZB
         nuRkx1dtFeBclLQX0/6mKSx/CLcfJ6xf0/AezdMH/1TymBF40uDgfKkIJqUeNUDd3dFr
         ho9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692790943; x=1693395743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGTcE4hW1wmK3YLI+VZd9ibjhnWGHcOir/OGBUb1v5g=;
        b=F5pR2EMrwPrRwwqmd/Ht2Rv95Ahua1XvgKDOGLHShpYYnY7ah/8r7AZO/+SItCPlnz
         VbrTNBYRPLVUMWcEwDB/OrZ1HjFuvcvhkUMjYbWM8OceMLXGuaqVPmUblYNAaKpwJhXR
         TqQ9Zk+1tohTHuM6KkHoBs1rdbpDV9K5Gcqc5edkmbSAEUEmWuh0KHzwU9kVVMlDa/w8
         +dkciAjeCf3uDIo4crfanJs8EmHXIw+AQ9F9gqff0ulVVh0Ukh+t0Sd6a+uL+y5xHoZY
         c/5OcYQX15KXSDYCFeYDm4BY2YKo8fwXHnTMfXzarhP6b1gLvg3rR8+Pl7gvb35+6+Na
         a3Kw==
X-Gm-Message-State: AOJu0YxwWp0PQLr/qaCzoIdUkOzi8ZG1hLILP/ji08MS4M5o3rDO6T+a
        1GT/ADskiNUvEgAqXwZEpq8ccVamJLzH7w==
X-Google-Smtp-Source: AGHT+IGUHgRYBxh6OYBjOB62Jw6JtZoOJeKzQWRwplVotrOKs8QfZXTptlvxj23PM869tbMOVHOp6w==
X-Received: by 2002:a05:600c:b42:b0:3fb:b34f:6cd6 with SMTP id k2-20020a05600c0b4200b003fbb34f6cd6mr9904631wmr.41.1692790943346;
        Wed, 23 Aug 2023 04:42:23 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:e4cf:1132:7b40:4262])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003fed9b1a1f4sm559508wms.1.2023.08.23.04.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:42:22 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v4 08/12] tools/net/ynl: Implement nlattr array-nest decoding in ynl
Date:   Wed, 23 Aug 2023 12:41:57 +0100
Message-ID: <20230823114202.5862-9-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823114202.5862-1-donald.hunter@gmail.com>
References: <20230823114202.5862-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for the 'array-nest' attribute type that is used by several
netlink-raw families.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/net/ynl/lib/ynl.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 4fa4416edd58..b44174f1fa33 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -490,6 +490,17 @@ class YnlFamily(SpecFamily):
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
@@ -509,6 +520,8 @@ class YnlFamily(SpecFamily):
                 decoded = True
             elif attr_spec["type"] in NlAttr.type_formats:
                 decoded = attr.as_scalar(attr_spec['type'], attr_spec.byte_order)
+            elif attr_spec["type"] == 'array-nest':
+                decoded = self._decode_array_nest(attr, attr_spec)
             else:
                 raise Exception(f'Unknown {attr_spec["type"]} with name {attr_spec["name"]}')
 
-- 
2.41.0

