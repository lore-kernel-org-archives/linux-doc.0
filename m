Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59049EE49AF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Aug 2023 19:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjHVTna (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Aug 2023 15:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjHVTna (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 15:43:30 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D53AE47;
        Tue, 22 Aug 2023 12:43:27 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3ff0146dbd8so188485e9.1;
        Tue, 22 Aug 2023 12:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692733405; x=1693338205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMuGyBGwOFR2Dl4/VsqtMGb9yINdqL6Q/X3v/ZGykPE=;
        b=EPBYoxpH1xSKcbM9fnhA3EI++cwMO2G06BH4/0EUKZvOHmYVx3ZMc478S6s+t2FEzR
         bYruh5AGknFmwVMxf0syY2r+Pfx1rdetuqi3R6bQS1hVBKChC58lqacTH21reOc5C4/o
         5p02RCjNjKDG9wm+dmoof/rZzQALZarCkvIblXwEdfQywdvYQZkRooxQ0EABmCIaw/ci
         daXS2NHNPqmCKNGvgtkyPs5dPRNfvah9I9zBsEVb4/AQ3Ba2l4j1Iu3fMomJEcYeTbWA
         pBVC6LXk5otO8lBCmh6WZwXyk2oxLfcOiV8WioC6qtVNl2Nv5Wi74Bt1Irc3AGKfQ9Jx
         5jDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733405; x=1693338205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMuGyBGwOFR2Dl4/VsqtMGb9yINdqL6Q/X3v/ZGykPE=;
        b=gNulvMDqGfdLoEHi4IMOa+0fW7LJGJhDMvM1QNWQwSCgCANKtT0RX+yGBoMG3gqkFn
         8WeBVlkZ1+9kxEjcIN5M7QAB1owsVQvAc7W6+qrOMtzcRxSHD7g7VgdJVrWawsA6GCly
         e3mvnIkMDFZUaO3s9MvVddoMFfEGohlTn233ADOtQJ35MtdJjR5K/+QuagiUhClXpupM
         NuLyUfHFF1RypEUwJlw0aGDzrDZIjyhwmz27XcBSnSgwUjTAPl75kpTcxln7MXpC8BgM
         e1fawRZzCd6eL4fHTorLuIULA18bS8ytR9UY7oqU/kgPVcLxiCN3KvJsy9r2yB8WeakQ
         Ypow==
X-Gm-Message-State: AOJu0YxSD8KhMJQyAP6H3tjf8bwg+8ztyiM+298AEAj/JaqO7klCUfYM
        5IklF46pH1h5yBJvXM6Jri5MLfXk/Oh6pA==
X-Google-Smtp-Source: AGHT+IHhxyPICG05cffJnQweLsDcM+nWhJVjiUPf/XAraVKwsqna7Xgjn3yW2OHGjHM8tiqHlsaP4A==
X-Received: by 2002:a05:6000:1807:b0:316:fc86:28ae with SMTP id m7-20020a056000180700b00316fc8628aemr6967202wrh.15.1692733405088;
        Tue, 22 Aug 2023 12:43:25 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:3060:22e2:2970:3dc3])
        by smtp.gmail.com with ESMTPSA id f8-20020adfdb48000000b0031934b035d2sm16846067wrj.52.2023.08.22.12.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:43:24 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3 06/12] tools/net/ynl: Fix extack parsing with fixed header genlmsg
Date:   Tue, 22 Aug 2023 20:42:58 +0100
Message-ID: <20230822194304.87488-7-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194304.87488-1-donald.hunter@gmail.com>
References: <20230822194304.87488-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move decode_fixed_header into YnlFamily and add a _fixed_header_size
method to allow extack decoding to skip the fixed header.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/lib/ynl.py | 65 ++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 6951bcc7efdc..1d1bc712456e 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -293,7 +293,7 @@ def _genl_load_families():
 
                 gm = GenlMsg(nl_msg)
                 fam = dict()
-                for attr in gm.raw_attrs:
+                for attr in NlAttrs(gm.raw):
                     if attr.type == Netlink.CTRL_ATTR_FAMILY_ID:
                         fam['id'] = attr.as_scalar('u16')
                     elif attr.type == Netlink.CTRL_ATTR_FAMILY_NAME:
@@ -317,23 +317,10 @@ def _genl_load_families():
 
 
 class GenlMsg:
-    def __init__(self, nl_msg, fixed_header_members=[]):
+    def __init__(self, nl_msg):
         self.nl = nl_msg
-
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
-
-        self.raw = nl_msg.raw[offset:]
-        self.raw_attrs = NlAttrs(self.raw)
+        self.genl_cmd, self.genl_version, _ = struct.unpack_from("BBH", nl_msg.raw, 0)
+        self.raw = nl_msg.raw[4:]
 
     def __repr__(self):
         msg = repr(self.nl)
@@ -509,17 +496,44 @@ class YnlFamily(SpecFamily):
 
         return None
 
-    def _decode_extack(self, request, attr_space, extack):
+    def _decode_extack(self, request, op, extack):
         if 'bad-attr-offs' not in extack:
             return
 
-        genl_req = GenlMsg(NlMsg(request, 0, attr_space=attr_space))
-        path = self._decode_extack_path(genl_req.raw_attrs, attr_space,
-                                        20, extack['bad-attr-offs'])
+        genl_req = GenlMsg(NlMsg(request, 0, op.attr_set))
+        fixed_header_size = self._fixed_header_size(op)
+        offset = 20 + fixed_header_size
+        path = self._decode_extack_path(NlAttrs(genl_req.raw[fixed_header_size:]),
+                                        op.attr_set, offset,
+                                        extack['bad-attr-offs'])
         if path:
             del extack['bad-attr-offs']
             extack['bad-attr'] = path
 
+    def _fixed_header_size(self, op):
+        if op.fixed_header:
+            fixed_header_members = self.consts[op.fixed_header].members
+            size = 0
+            for m in fixed_header_members:
+                format = NlAttr.get_format(m.type, m.byte_order)
+                size += format.size
+            return size
+        else:
+            return 0
+
+    def _decode_fixed_header(self, msg, name):
+        fixed_header_members = self.consts[name].members
+        fixed_header_attrs = dict()
+        offset = 0
+        for m in fixed_header_members:
+            format = NlAttr.get_format(m.type, m.byte_order)
+            [ value ] = format.unpack_from(msg.raw, offset)
+            offset += format.size
+            if m.enum:
+                value = self._decode_enum(value, m)
+            fixed_header_attrs[m.name] = value
+        return fixed_header_attrs
+
     def handle_ntf(self, nl_msg, genl_msg):
         msg = dict()
         if self.include_raw:
@@ -594,7 +608,7 @@ class YnlFamily(SpecFamily):
             nms = NlMsgs(reply, attr_space=op.attr_set)
             for nl_msg in nms:
                 if nl_msg.extack:
-                    self._decode_extack(msg, op.attr_set, nl_msg.extack)
+                    self._decode_extack(msg, op, nl_msg.extack)
 
                 if nl_msg.error:
                     raise NlError(nl_msg)
@@ -605,7 +619,7 @@ class YnlFamily(SpecFamily):
                     done = True
                     break
 
-                gm = GenlMsg(nl_msg, fixed_header_members)
+                gm = GenlMsg(nl_msg)
                 # Check if this is a reply to our request
                 if nl_msg.nl_seq != req_seq or gm.genl_cmd != op.rsp_value:
                     if gm.genl_cmd in self.async_msg_ids:
@@ -615,8 +629,9 @@ class YnlFamily(SpecFamily):
                         print('Unexpected message: ' + repr(gm))
                         continue
 
-                rsp_msg = self._decode(gm.raw_attrs, op.attr_set.name)
-                rsp_msg.update(gm.fixed_header_attrs)
+                rsp_msg = self._decode(NlAttrs(gm.raw), op.attr_set.name)
+                if op.fixed_header:
+                    rsp_msg.update(self._decode_fixed_header(gm, op.fixed_header))
                 rsp.append(rsp_msg)
 
         if not rsp:
-- 
2.41.0

