Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93F6C04A94
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 19:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239943AbjHOTny (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 15:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239946AbjHOTnk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 15:43:40 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9801310EC;
        Tue, 15 Aug 2023 12:43:38 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-307d20548adso5137299f8f.0;
        Tue, 15 Aug 2023 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692128617; x=1692733417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFjY37lwo4N/hdruwu62FUgbt07yrT9B4CemMUeBHlg=;
        b=deKmEK3EVC0relv6FoeLV/hBmopAbaf56boedCAzAk5jVleG3i48b5kPendYyM4b9x
         S805j8zdqZHR0tPCt01xzPS8Xvh45mxSDpx/Z7+mPZ3rL742Oz2yQfilR/BURj06YVP1
         ErLSjpu2jOYZ3Z4zufAPFR0spyq7rSI1ZQuM0Na1LB7S1pbOYd0mMlqU86STXjBQyk41
         Iq0+4UzSCFC3TqOY3tGysi/Dfd3J/11c1bAOGUCIpiFHzDYFfPgIe+ZW19irhCxknenR
         jjufLbn5gU0WA7ODpoDqB2pWmjydvGXYXUpSE314+qC+8IAxzEn6j5aQacduNI9fHFsk
         UEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692128617; x=1692733417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFjY37lwo4N/hdruwu62FUgbt07yrT9B4CemMUeBHlg=;
        b=GfwhOSA92o9ZdHkCo517/0E53JNLnZxN4uAbK0g9uh0z/NIW2BsnGOx/VwoKniVs4j
         mFnbmwN5zi03a+GpvATls9a5ee1lPaBUsTDnwvj77oNMzE2WZ01p7B2L/yBzMMeuQcB7
         HXGAWd+Dl4kjALUJqCeSAMljoEwvi5y7g0NyOR14awphAsaP9me5LAeYkmbQKo/E3ReY
         BhWXohtiRu41HBQvLKEoUGpVAJN50//o+Pyxx/BdrFG4+oJ7GGJNXA1s7hXlJP4xobwG
         k29sNC7douiGt5cC00G5mKfTH3NXwpSj6tiL0JlUF8vzXQDRNUrwfY85YfbqbbtdFRpA
         LsEg==
X-Gm-Message-State: AOJu0YxoIxw1QSLmhBZKOLb6gD6pHCrLc/dmOFk3pNjE5NlSPtYLH5Wy
        DkML2M0qjUzZtHsEip5cGSr2K+2guG6Hbc89
X-Google-Smtp-Source: AGHT+IH1n4EEnPCvQC0zMSUwJ7mYVnh7ge0qJgekyXhXDSefHl53GlcAN1nd13h90OBVbXn+1T4lig==
X-Received: by 2002:a5d:5482:0:b0:319:8a21:6f9a with SMTP id h2-20020a5d5482000000b003198a216f9amr1730728wrv.63.1692128616694;
        Tue, 15 Aug 2023 12:43:36 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:9934:e2f7:cd0e:75a6])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d6610000000b003179d5aee67sm18814892wru.94.2023.08.15.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 12:43:36 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v2 05/10] tools/net/ynl: Refactor decode_fixed_header into NlMsg
Date:   Tue, 15 Aug 2023 20:42:49 +0100
Message-ID: <20230815194254.89570-6-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815194254.89570-1-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move decode_fixed_header into NlMsg in preparation for adding
netlink-raw support.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/lib/ynl.py | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 3ca28d4bcb18..4fa42a7c5955 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -189,6 +189,7 @@ class NlMsg:
 
         self.error = 0
         self.done = 0
+        self.fixed_header_attrs = []
 
         extack_off = None
         if self.nl_type == Netlink.NLMSG_ERROR:
@@ -228,6 +229,19 @@ class NlMsg:
                             desc += f" ({spec['doc']})"
                         self.extack['miss-type'] = desc
 
+    def decode_fixed_header(self, ynl, name):
+        fixed_header_members = ynl.consts[name].members
+        self.fixed_header_attrs = dict()
+        offset = 0
+        for m in fixed_header_members:
+            format = NlAttr.get_format(m.type, m.byte_order)
+            [ value ] = format.unpack_from(self.raw, offset)
+            offset += format.size
+            if m.enum:
+                value = ynl._decode_enum(value, m)
+            self.fixed_header_attrs[m.name] = value
+        self.raw = self.raw[offset:]
+
     def __repr__(self):
         msg = f"nl_len = {self.nl_len} ({len(self.raw)}) nl_flags = 0x{self.nl_flags:x} nl_type = {self.nl_type}\n"
         if self.error:
@@ -317,23 +331,18 @@ def _genl_load_families():
 
 
 class GenlMsg:
-    def __init__(self, nl_msg, fixed_header_members=[]):
-        self.nl = nl_msg
+    def __init__(self, nl_msg, ynl=None):
+        self.genl_cmd, self.genl_version, _ = struct.unpack_from("BBH", nl_msg.raw, 0)
+        nl_msg.raw = nl_msg.raw[4:]
 
-        self.hdr = nl_msg.raw[0:4]
-        offset = 4
-
-        self.genl_cmd, self.genl_version, _ = struct.unpack("BBH", self.hdr)
-
-        self.fixed_header_attrs = dict()
-        for m in fixed_header_members:
-            format = NlAttr.get_format(m.type, m.byte_order)
-            decoded = format.unpack_from(nl_msg.raw, offset)
-            offset += format.size
-            self.fixed_header_attrs[m.name] = decoded[0]
+        if ynl:
+            op = ynl.rsp_by_value[self.genl_cmd]
+            if op.fixed_header:
+                nl_msg.decode_fixed_header(ynl, op.fixed_header)
 
-        self.raw = nl_msg.raw[offset:]
+        self.raw = nl_msg.raw
         self.raw_attrs = NlAttrs(self.raw)
+        self.fixed_header_attrs = nl_msg.fixed_header_attrs
 
     def __repr__(self):
         msg = repr(self.nl)
@@ -596,7 +605,7 @@ class YnlFamily(SpecFamily):
                     done = True
                     break
 
-                gm = GenlMsg(nl_msg, fixed_header_members)
+                gm = GenlMsg(nl_msg, self)
                 # Check if this is a reply to our request
                 if nl_msg.nl_seq != req_seq or gm.genl_cmd != op.rsp_value:
                     if gm.genl_cmd in self.async_msg_ids:
-- 
2.41.0

