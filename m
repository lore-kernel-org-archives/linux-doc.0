Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35BFEE49B2
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 11:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241005AbjHXLU6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241000AbjHXLUc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 07:20:32 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8022110FC;
        Thu, 24 Aug 2023 04:20:27 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31adc5c899fso5957536f8f.2;
        Thu, 24 Aug 2023 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692876025; x=1693480825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwU5ZIdx6k1IITw9kHNMNIZu5zHc1LPTGr73mesHXQY=;
        b=dMeXOZ7G/Ldgw/c5bpbvWrK1wCI0FC6XJtPz5WZ7PlHvt6vsi8IuoUY4zyy0z/iyiY
         NoD9+Eo1ckJE35G5V0Fs9QjTMYEkmId/9FOS8f/2trY78GNe5zsTv9zNYQuQI7RtK9V1
         qd1ptqCwwbyD9gAYyhJlO8/Tz9YmAzXDQVbN+JtvJbdJA5mBGIr2BhoDEiUIUG43pSwR
         nih4yNcYaPoS+h9QpzrSSR6jDI5qWfc3cyl/QSvWRTzScmcBj/nVQGGbGKu0WYkLbpaa
         xU65/IkPY2J6JvG7Ed6YfULchGA0HDmV5K8Dk86KObLIYjisat3hcpXzLs/7JhBu/J5o
         nhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876025; x=1693480825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwU5ZIdx6k1IITw9kHNMNIZu5zHc1LPTGr73mesHXQY=;
        b=j33NwuwQbMeqwQayMLxxQCO1O4/DiGbx+KpO8hNS3Ij4GrTKlj+HQokgThG5JRsOkO
         pCQxcMZhc4WJw2OY2ps5mkRLXf/ECYMfpVtO96v3ZSvGyy2PligWzk1qKD9SSE8tr9DI
         0hA0eocBFWTXXU+zJDdAxu3ifmDnCaT3TroWSQGKUvqSY5Ncf+pHc6S9vyhySJkNoYB/
         byHLx7BZQzUr8nUe65tDDkdrYdfAkqOOIrRjyhFSj3jQ5VRh6cVThPBgtvR+9/xfhUa4
         c2L6PJsq43tx8C4HLylxaV8bABC5SMlVBd3OwKl6cKsCK/xqJ/vHN1zs7ip+AjLGZnL7
         sQKw==
X-Gm-Message-State: AOJu0YxsDg8LJygPmwwWTp8f2LZo4KLXC0NUP/bFOTPWB5IePyp8RpJu
        9S7jFZy6VzmlmhO1QU+k8PZ+oEsz9zKCBQ==
X-Google-Smtp-Source: AGHT+IGPJMTCHuHAURonkq/dP4UPR34XmUGS8PJq9njIfCvONssFWW6+rj/y84kxWoryKIcCL0Yjkw==
X-Received: by 2002:a5d:5242:0:b0:317:5351:e428 with SMTP id k2-20020a5d5242000000b003175351e428mr11768497wrc.4.1692876025453;
        Thu, 24 Aug 2023 04:20:25 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:1a5:1436:c34c:226])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm21875295wru.54.2023.08.24.04.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:20:25 -0700 (PDT)
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
Subject: [PATCH net-next v5 09/12] tools/net/ynl: Add support for create flags
Date:   Thu, 24 Aug 2023 12:20:00 +0100
Message-ID: <20230824112003.52939-10-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824112003.52939-1-donald.hunter@gmail.com>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for using NLM_F_REPLACE, _EXCL, _CREATE and _APPEND flags
in requests.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 tools/net/ynl/cli.py          | 12 ++++++++++--
 tools/net/ynl/lib/__init__.py |  4 ++--
 tools/net/ynl/lib/ynl.py      | 14 ++++++++++----
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/tools/net/ynl/cli.py b/tools/net/ynl/cli.py
index ffaa8038aa8c..564ecf07cd2c 100755
--- a/tools/net/ynl/cli.py
+++ b/tools/net/ynl/cli.py
@@ -6,7 +6,7 @@ import json
 import pprint
 import time
 
-from lib import YnlFamily
+from lib import YnlFamily, Netlink
 
 
 def main():
@@ -19,6 +19,14 @@ def main():
     parser.add_argument('--dump', dest='dump', type=str)
     parser.add_argument('--sleep', dest='sleep', type=int)
     parser.add_argument('--subscribe', dest='ntf', type=str)
+    parser.add_argument('--replace', dest='flags', action='append_const',
+                        const=Netlink.NLM_F_REPLACE)
+    parser.add_argument('--excl', dest='flags', action='append_const',
+                        const=Netlink.NLM_F_EXCL)
+    parser.add_argument('--create', dest='flags', action='append_const',
+                        const=Netlink.NLM_F_CREATE)
+    parser.add_argument('--append', dest='flags', action='append_const',
+                        const=Netlink.NLM_F_APPEND)
     args = parser.parse_args()
 
     if args.no_schema:
@@ -37,7 +45,7 @@ def main():
         time.sleep(args.sleep)
 
     if args.do:
-        reply = ynl.do(args.do, attrs)
+        reply = ynl.do(args.do, attrs, args.flags)
         pprint.PrettyPrinter().pprint(reply)
     if args.dump:
         reply = ynl.dump(args.dump, attrs)
diff --git a/tools/net/ynl/lib/__init__.py b/tools/net/ynl/lib/__init__.py
index 4b3797fe784b..f7eaa07783e7 100644
--- a/tools/net/ynl/lib/__init__.py
+++ b/tools/net/ynl/lib/__init__.py
@@ -2,7 +2,7 @@
 
 from .nlspec import SpecAttr, SpecAttrSet, SpecEnumEntry, SpecEnumSet, \
     SpecFamily, SpecOperation
-from .ynl import YnlFamily
+from .ynl import YnlFamily, Netlink
 
 __all__ = ["SpecAttr", "SpecAttrSet", "SpecEnumEntry", "SpecEnumSet",
-           "SpecFamily", "SpecOperation", "YnlFamily"]
+           "SpecFamily", "SpecOperation", "YnlFamily", "Netlink"]
diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 5d04a2b5fc78..484b42354ae7 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -35,6 +35,10 @@ class Netlink:
     NLM_F_ACK = 4
     NLM_F_ROOT = 0x100
     NLM_F_MATCH = 0x200
+
+    NLM_F_REPLACE = 0x100
+    NLM_F_EXCL = 0x200
+    NLM_F_CREATE = 0x400
     NLM_F_APPEND = 0x800
 
     NLM_F_CAPPED = 0x100
@@ -649,10 +653,12 @@ class YnlFamily(SpecFamily):
 
       return op['do']['request']['attributes'].copy()
 
-    def _op(self, method, vals, dump=False):
+    def _op(self, method, vals, flags, dump=False):
         op = self.ops[method]
 
         nl_flags = Netlink.NLM_F_REQUEST | Netlink.NLM_F_ACK
+        for flag in flags or []:
+            nl_flags |= flag
         if dump:
             nl_flags |= Netlink.NLM_F_DUMP
 
@@ -711,8 +717,8 @@ class YnlFamily(SpecFamily):
             return rsp[0]
         return rsp
 
-    def do(self, method, vals):
-        return self._op(method, vals)
+    def do(self, method, vals, flags):
+        return self._op(method, vals, flags)
 
     def dump(self, method, vals):
-        return self._op(method, vals, dump=True)
+        return self._op(method, vals, [], dump=True)
-- 
2.39.2 (Apple Git-143)

