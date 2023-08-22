Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DF8EE49AB
	for <linux-doc@archiver.kernel.org>; Tue, 22 Aug 2023 19:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjHVTng (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Aug 2023 15:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjHVTnf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 15:43:35 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D56AE46;
        Tue, 22 Aug 2023 12:43:30 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fee87dd251so30167605e9.2;
        Tue, 22 Aug 2023 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692733408; x=1693338208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eu63iS2EexWeSk5SNuLtclZBTZl986S1+6f1xVI24c8=;
        b=iw23BTaWuP7pKpr+644+ben5/sp3wwpMCEnpLJx4owJFOzMyc6BSPTpT7UD9NoJjfY
         yQbbOuV35xnmyRjVCI9+UEWWP9pf/d8asYsLTp7+REeRYQ1e8+6TMexko4YdCzPlvPtj
         b09jOMmWrr/Nvqquxe3yg9f+OkX5NpQ5SH809WltV2X9gJISiekGxY+mQFgvJY9h3aS0
         P0OsWIVcT2e8o8sfnP4de4v9vpnzRqk5XGAgcLO3EeS897wmq/sUPP6A4+c9Vis70u0Q
         q/5KkNj+mYIDwm5khWlXHw5QrTdrbue0CCkBIqimsePslefnj37Mj6TOEQtp5LMI2HKM
         vpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733408; x=1693338208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eu63iS2EexWeSk5SNuLtclZBTZl986S1+6f1xVI24c8=;
        b=PUBoOM9MehlCUDndrr9FQRUDrVDczycR3yYPFIiI57ap/ceyKKz9N+xpzJomnVHc6A
         TEBeRBwXvbYwudSrlZ3EFB2vic5OCJXWaAzmVZiWKbT5u0kYG0sacXLzsVcYDiFoYD8p
         mIZh4T4RkcbsysmPhM4bnv+fXakBfBNi5G6g2q3DJ0NTjS59HLScKXjuoVenpPpDxDVH
         l5+ksqFC0FmgkDobz6+vpjHSuu6mcR7kS7ArPoJqwDv9m6Nk/zu+A9IwVsHSSOATyiNr
         dUFZ2VdOuIsDczolk5DPmuWJrxPMifJtDpCOC2DdMRy99SUpd/mydQbzUY22aekyP+eU
         07Qw==
X-Gm-Message-State: AOJu0YyklubFswzT262D8IW9P+HZQsuqAdAoT7H7wWe1qGdN8EcqWCAR
        KpNiP/qVupkM1octn4pFABrqDnSII0exOA==
X-Google-Smtp-Source: AGHT+IG5k3Fcdajq92Cp3YXunNE3Xf3fvuLNW5/lIK9zNAdjHUryDLfBKdA/XNkeF0Mo5tNkm/maKQ==
X-Received: by 2002:adf:ec48:0:b0:314:2e95:1ec9 with SMTP id w8-20020adfec48000000b003142e951ec9mr7643494wrn.10.1692733408408;
        Tue, 22 Aug 2023 12:43:28 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:3060:22e2:2970:3dc3])
        by smtp.gmail.com with ESMTPSA id f8-20020adfdb48000000b0031934b035d2sm16846067wrj.52.2023.08.22.12.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:43:27 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3 09/12] tools/net/ynl: Add support for create flags
Date:   Tue, 22 Aug 2023 20:43:01 +0100
Message-ID: <20230822194304.87488-10-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194304.87488-1-donald.hunter@gmail.com>
References: <20230822194304.87488-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for using NLM_F_REPLACE, _EXCL, _CREATE and _APPEND flags
in requests.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
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
index 64f50f576136..ff35fcd7fef0 100644
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
@@ -647,10 +651,12 @@ class YnlFamily(SpecFamily):
 
       return op['do']['request']['attributes'].copy()
 
-    def _op(self, method, vals, dump=False):
+    def _op(self, method, vals, flags, dump=False):
         op = self.ops[method]
 
         nl_flags = Netlink.NLM_F_REQUEST | Netlink.NLM_F_ACK
+        for flag in flags or []:
+            nl_flags |= flag
         if dump:
             nl_flags |= Netlink.NLM_F_DUMP
 
@@ -709,8 +715,8 @@ class YnlFamily(SpecFamily):
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
2.41.0

