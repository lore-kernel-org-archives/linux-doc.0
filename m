Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA60EE49B4
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 11:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbjHWLm2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 07:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbjHWLm0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 07:42:26 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A8FE5E;
        Wed, 23 Aug 2023 04:42:24 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so51826535e9.0;
        Wed, 23 Aug 2023 04:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692790942; x=1693395742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcNWXLC3IJX5tdDLpWjENUEZ3MRZhc4L+t+tPA70ZRg=;
        b=PFUklFdE2QLz8PiuB+qwbipTVPT1JC9TphuRxbfuht3oKMmDKC8zFJrx47pxIQVp7F
         HtaKs7Z4rPH91VPPuEF1Rt8HWZ0d4FuZaErqUjIqsbMmw8OC/Ead7agt7Zn9p0FGvqh7
         5xexanSWfPD3Fw275fUufO51tfULMqG2twBtOVl01ybORaOXLyRLjuKolsE+/asxPSoW
         BPxF3/NLYAzWBhHMaL4cajfrGDrFpKrHIzpNkG1VtLtpO3XD2RudTX1Aasnu5DyQEdm/
         /04fQcOVx+HlyDmTc7PfaRc33Z5QFDlSPoplqYEafjYuonwpGBNVISFaFjOX3HAYkHjS
         HACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692790942; x=1693395742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcNWXLC3IJX5tdDLpWjENUEZ3MRZhc4L+t+tPA70ZRg=;
        b=TROKbQKRfeYypb16ycn6p9nzxazDzn7j9I2FT9M0yj89mOBIsb8OEGVJeGQFbJmcJ9
         myo72hJio3T2AlI0gjRSEcLU0ZFs94AjqiYb5F7C1uqJWnl82d/yTuY2xpwq+K1Opfmm
         uQFBRO2q8Nnc91lpwER6O2ROCVpJlLm37wtI0Q4kdSr8spHT9pu9p6I1QzR6spFiXSUi
         uM+LWFv9yr1wqcJh9deQ0/0z8EHpsxJg6erSp2CxUsHqoJbsipdjg4D6n1Xvb1A0VEOT
         JJkUHgD1e9NKmHaYrrpm0HiKAPiMrWZgSLOHxtbSChJkwn+lP1T+MkToPT+r46E7GVR9
         VrXA==
X-Gm-Message-State: AOJu0YxuXe8ywEmvfyUNpayeH5GS9azGVD7LDYgOaMkCzC3rwfnEq66Q
        prVqNe4y0yMvvBbZhlCP/qaW4p5boSKp0g==
X-Google-Smtp-Source: AGHT+IHhnyrLlxT8rYyCaBIwL7xt8ZR+pfdC/7Y447PzP0U1Fgrk+fjy8iLaJDISgQG6lBIwKNr5gQ==
X-Received: by 2002:a7b:c7c3:0:b0:3f8:f382:8e1f with SMTP id z3-20020a7bc7c3000000b003f8f3828e1fmr8898603wmk.24.1692790942052;
        Wed, 23 Aug 2023 04:42:22 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:e4cf:1132:7b40:4262])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003fed9b1a1f4sm559508wms.1.2023.08.23.04.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:42:21 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v4 07/12] tools/net/ynl: Add support for netlink-raw families
Date:   Wed, 23 Aug 2023 12:41:56 +0100
Message-ID: <20230823114202.5862-8-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823114202.5862-1-donald.hunter@gmail.com>
References: <20230823114202.5862-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Refactor the ynl code to encapsulate protocol specifics into
NetlinkProtocol and GenlProtocol.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/lib/ynl.py | 122 ++++++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 33 deletions(-)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 1d1bc712456e..4fa4416edd58 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -25,6 +25,7 @@ class Netlink:
     NETLINK_ADD_MEMBERSHIP = 1
     NETLINK_CAP_ACK = 10
     NETLINK_EXT_ACK = 11
+    NETLINK_GET_STRICT_CHK = 12
 
     # Netlink message
     NLMSG_ERROR = 2
@@ -228,6 +229,9 @@ class NlMsg:
                             desc += f" ({spec['doc']})"
                         self.extack['miss-type'] = desc
 
+    def cmd(self):
+        return self.nl_type
+
     def __repr__(self):
         msg = f"nl_len = {self.nl_len} ({len(self.raw)}) nl_flags = 0x{self.nl_flags:x} nl_type = {self.nl_type}\n"
         if self.error:
@@ -322,6 +326,9 @@ class GenlMsg:
         self.genl_cmd, self.genl_version, _ = struct.unpack_from("BBH", nl_msg.raw, 0)
         self.raw = nl_msg.raw[4:]
 
+    def cmd(self):
+        return self.genl_cmd
+
     def __repr__(self):
         msg = repr(self.nl)
         msg += f"\tgenl_cmd = {self.genl_cmd} genl_ver = {self.genl_version}\n"
@@ -330,9 +337,40 @@ class GenlMsg:
         return msg
 
 
-class GenlFamily:
-    def __init__(self, family_name):
+class NetlinkProtocol:
+    def __init__(self, family_name, proto_num):
         self.family_name = family_name
+        self.proto_num = proto_num
+
+    def _message(self, nl_type, nl_flags, seq=None):
+        if seq is None:
+            seq = random.randint(1, 1024)
+        nlmsg = struct.pack("HHII", nl_type, nl_flags, seq, 0)
+        return nlmsg
+
+    def message(self, flags, command, version, seq=None):
+        return self._message(command, flags, seq)
+
+    def _decode(self, nl_msg):
+        return nl_msg
+
+    def decode(self, ynl, nl_msg):
+        msg = self._decode(nl_msg)
+        fixed_header_size = 0
+        if ynl:
+            op = ynl.rsp_by_value[msg.cmd()]
+            fixed_header_size = ynl._fixed_header_size(op)
+        msg.raw_attrs = NlAttrs(msg.raw[fixed_header_size:])
+        return msg
+
+    def get_mcast_id(self, mcast_name, mcast_groups):
+        if mcast_name not in mcast_groups:
+            raise Exception(f'Multicast group "{mcast_name}" not present in the spec')
+        return mcast_groups[mcast_name].value
+
+class GenlProtocol(NetlinkProtocol):
+    def __init__(self, family_name):
+        super().__init__(family_name, Netlink.NETLINK_GENERIC)
 
         global genl_family_name_to_id
         if genl_family_name_to_id is None:
@@ -341,6 +379,18 @@ class GenlFamily:
         self.genl_family = genl_family_name_to_id[family_name]
         self.family_id = genl_family_name_to_id[family_name]['id']
 
+    def message(self, flags, command, version, seq=None):
+        nlmsg = self._message(self.family_id, flags, seq)
+        genlmsg = struct.pack("BBH", command, version, 0)
+        return nlmsg + genlmsg
+
+    def _decode(self, nl_msg):
+        return GenlMsg(nl_msg)
+
+    def get_mcast_id(self, mcast_name, mcast_groups):
+        if mcast_name not in self.genl_family['mcast']:
+            raise Exception(f'Multicast group "{mcast_name}" not present in the family')
+        return self.genl_family['mcast'][mcast_name]
 
 #
 # YNL implementation details.
@@ -353,9 +403,19 @@ class YnlFamily(SpecFamily):
 
         self.include_raw = False
 
-        self.sock = socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, Netlink.NETLINK_GENERIC)
+        try:
+            if self.proto == "netlink-raw":
+                self.nlproto = NetlinkProtocol(self.yaml['name'],
+                                               self.yaml['protonum'])
+            else:
+                self.nlproto = GenlProtocol(self.yaml['name'])
+        except KeyError:
+            raise Exception(f"Family '{self.yaml['name']}' not supported by the kernel")
+
+        self.sock = socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, self.nlproto.proto_num)
         self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_CAP_ACK, 1)
         self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_EXT_ACK, 1)
+        self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_GET_STRICT_CHK, 1)
 
         self.async_msg_ids = set()
         self.async_msg_queue = []
@@ -368,18 +428,12 @@ class YnlFamily(SpecFamily):
             bound_f = functools.partial(self._op, op_name)
             setattr(self, op.ident_name, bound_f)
 
-        try:
-            self.family = GenlFamily(self.yaml['name'])
-        except KeyError:
-            raise Exception(f"Family '{self.yaml['name']}' not supported by the kernel")
 
     def ntf_subscribe(self, mcast_name):
-        if mcast_name not in self.family.genl_family['mcast']:
-            raise Exception(f'Multicast group "{mcast_name}" not present in the family')
-
+        mcast_id = self.nlproto.get_mcast_id(mcast_name, self.mcast_groups)
         self.sock.bind((0, 0))
         self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_ADD_MEMBERSHIP,
-                             self.family.genl_family['mcast'][mcast_name])
+                             mcast_id)
 
     def _add_attr(self, space, name, value):
         try:
@@ -500,11 +554,9 @@ class YnlFamily(SpecFamily):
         if 'bad-attr-offs' not in extack:
             return
 
-        genl_req = GenlMsg(NlMsg(request, 0, op.attr_set))
-        fixed_header_size = self._fixed_header_size(op)
-        offset = 20 + fixed_header_size
-        path = self._decode_extack_path(NlAttrs(genl_req.raw[fixed_header_size:]),
-                                        op.attr_set, offset,
+        msg = self.nlproto.decode(self, NlMsg(request, 0, op.attr_set))
+        offset = 20 + self._fixed_header_size(op)
+        path = self._decode_extack_path(msg.raw_attrs, op.attr_set, offset,
                                         extack['bad-attr-offs'])
         if path:
             del extack['bad-attr-offs']
@@ -534,14 +586,17 @@ class YnlFamily(SpecFamily):
             fixed_header_attrs[m.name] = value
         return fixed_header_attrs
 
-    def handle_ntf(self, nl_msg, genl_msg):
+    def handle_ntf(self, decoded):
         msg = dict()
         if self.include_raw:
-            msg['nlmsg'] = nl_msg
-            msg['genlmsg'] = genl_msg
-        op = self.rsp_by_value[genl_msg.genl_cmd]
+            msg['raw'] = decoded
+        op = self.rsp_by_value[decoded.cmd()]
+        attrs = self._decode(decoded.raw_attrs, op.attr_set.name)
+        if op.fixed_header:
+            attrs.update(self._decode_fixed_header(decoded, op.fixed_header))
+
         msg['name'] = op['name']
-        msg['msg'] = self._decode(genl_msg.raw_attrs, op.attr_set.name)
+        msg['msg'] = attrs
         self.async_msg_queue.append(msg)
 
     def check_ntf(self):
@@ -561,12 +616,12 @@ class YnlFamily(SpecFamily):
                     print("Netlink done while checking for ntf!?")
                     continue
 
-                gm = GenlMsg(nl_msg)
-                if gm.genl_cmd not in self.async_msg_ids:
-                    print("Unexpected msg id done while checking for ntf", gm)
+                decoded = self.nlproto.decode(self, nl_msg)
+                if decoded.cmd() not in self.async_msg_ids:
+                    print("Unexpected msg id done while checking for ntf", decoded)
                     continue
 
-                self.handle_ntf(nl_msg, gm)
+                self.handle_ntf(decoded)
 
     def operation_do_attributes(self, name):
       """
@@ -587,7 +642,7 @@ class YnlFamily(SpecFamily):
             nl_flags |= Netlink.NLM_F_DUMP
 
         req_seq = random.randint(1024, 65535)
-        msg = _genl_msg(self.family.family_id, nl_flags, op.req_value, 1, req_seq)
+        msg = self.nlproto.message(nl_flags, op.req_value, 1, req_seq)
         fixed_header_members = []
         if op.fixed_header:
             fixed_header_members = self.consts[op.fixed_header].members
@@ -619,19 +674,20 @@ class YnlFamily(SpecFamily):
                     done = True
                     break
 
-                gm = GenlMsg(nl_msg)
+                decoded = self.nlproto.decode(self, nl_msg)
+
                 # Check if this is a reply to our request
-                if nl_msg.nl_seq != req_seq or gm.genl_cmd != op.rsp_value:
-                    if gm.genl_cmd in self.async_msg_ids:
-                        self.handle_ntf(nl_msg, gm)
+                if nl_msg.nl_seq != req_seq or decoded.cmd() != op.rsp_value:
+                    if decoded.cmd() in self.async_msg_ids:
+                        self.handle_ntf(decoded)
                         continue
                     else:
-                        print('Unexpected message: ' + repr(gm))
+                        print('Unexpected message: ' + repr(decoded))
                         continue
 
-                rsp_msg = self._decode(NlAttrs(gm.raw), op.attr_set.name)
+                rsp_msg = self._decode(decoded.raw_attrs, op.attr_set.name)
                 if op.fixed_header:
-                    rsp_msg.update(self._decode_fixed_header(gm, op.fixed_header))
+                    rsp_msg.update(self._decode_fixed_header(decoded, op.fixed_header))
                 rsp.append(rsp_msg)
 
         if not rsp:
-- 
2.41.0

