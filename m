Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CC3EE49B8
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 12:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244870AbjHYM3b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 08:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244872AbjHYM3F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 08:29:05 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1956269E;
        Fri, 25 Aug 2023 05:28:38 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fef56f7248so7478025e9.3;
        Fri, 25 Aug 2023 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966495; x=1693571295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nQaDeS/EbM7b5oVEBteA4LnG2vAtzAQdRS0EijLP2U=;
        b=FUCuZUE2tj4KXFD+u3DtAplA0odtMfeBqqslfqsS4JDOH+IlNDawVs3b4rTUou34Cr
         qqXG/Yu6YRtl4rAVLCKFLfL81WaINOwVQ9kYYzks4+u/6epV2jfmd7tirn6DRCPKXpyY
         FJBJyMG8UXF//2LsxHwE9G4mQ/m7a0RIUoOp6j9mTV+UTkCE7V8bIaMS/WCNKvMDDu6U
         89pBsWVMXB+7sSC+Tsz1QdciEzJzaByhMH9HlBCSyjy2RH/nlbSfFMhpnhN0Kxwm9QDi
         9BpXhsrvCreEYgOz9sABK0Twv4Oi2+9VQXa57+uUlkOs+afqaa1cQks/BrzIoWwvJ9ro
         AV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966495; x=1693571295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nQaDeS/EbM7b5oVEBteA4LnG2vAtzAQdRS0EijLP2U=;
        b=S7idPkE74gbQ9iwGLNETkacYCvGyVFv0CMBjhARsA5NYoflF9UZETNWwGzwraU2pin
         s+Xok+22/aiULhk11FwF4Pr8uK8fYR3RD21trFEjTy/0TxLGdXxYLjvoYMbTk8Ql//2n
         D55p1LsBfXRF43QTT8UhC/Rff822nlZgaDrewCEtRWAc9wMMD8hVDpI4zHXUFHyd5EdW
         aJJ1yLOvfabWNyP4F445OWXoHeOXi8gfmgQJp7s3r9RKxIV5cf3Vn46JVyWIi6y4+5CP
         Nz0RH1jfdYPggcMg3eylFuWgpBSI5MAoK2ezBsWc90zffUIjMAk0f2ErjzWYnNxGZlzT
         Xp6Q==
X-Gm-Message-State: AOJu0YwXnF+m6b+O7HiCUfZLJXtOEIPpKAUL5uZq7uFCfyDJMmGjq6eh
        d0mSSLxDzxToJAho0UnDINv8/MDRsm7LGw==
X-Google-Smtp-Source: AGHT+IFnBEZ/sq6nXVC6H4Eo5jVJhO9zChegBKo4IgJIQdaEhK7cPwk4ZzXDaWrI21lC/dDFAHc7ug==
X-Received: by 2002:a7b:c7d6:0:b0:3fe:46ea:62c6 with SMTP id z22-20020a7bc7d6000000b003fe46ea62c6mr14293609wmk.21.1692966494941;
        Fri, 25 Aug 2023 05:28:14 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:88fe:5215:b5d:bbee])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003fff96bb62csm2089561wmf.16.2023.08.25.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 05:28:14 -0700 (PDT)
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
Subject: [PATCH net-next v6 06/12] tools/net/ynl: Fix extack parsing with fixed header genlmsg
Date:   Fri, 25 Aug 2023 13:27:49 +0100
Message-ID: <20230825122756.7603-7-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825122756.7603-1-donald.hunter@gmail.com>
References: <20230825122756.7603-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move decode_fixed_header into YnlFamily and add a _fixed_header_size
method to allow extack decoding to skip the fixed header.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
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

