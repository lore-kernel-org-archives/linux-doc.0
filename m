Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99B226159E
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888852; cv=none; b=XNk/9WkJmyUXqCTlIpSZeMnOGuQjN5fjypd457OiBtLQLsNxTa9CVzBhrRQiWMoGV/X5PSr4a+M+RP1HclIvrBuWWWvMdr3b76S7un3B5CPllCRdWvGULInt+dIN73Ign+DYL/9f28fRe8zhsMuelHf5iQ18Vi9Vq4knrhg4dyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888852; c=relaxed/simple;
	bh=8uPxZzD0xa6vZLKsY0KL+LZqvjbdbbYIMuV17g7zJ/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfnNA7MLz7uXLsme4f+p9HMnnm2y6BnVSaSfBGrWp3lrFlC7ivZL4wKupAtk15/YN13g6ddK/MjPKG6F1CT+1N1mAbdd/oLPP+GEyeYTWNSIowEEHEQa9up+r3z5wdFgvT3UO+P7nDpAfLqtF85TGOgpXWtXepO9K32zVI7NLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddw6aJPF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddw6aJPF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso25080145e9.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888849; x=1768493649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F61UVj+EIFW6s6BLu5Dtw+FuIVlV0w3b5yFMFCUC/uA=;
        b=Ddw6aJPF2f86A3H4pbJqoZh+ycHN2vATCbLjB/Eo8HXkFbJiZ9YSOEOU/SRGchvvnG
         wnwkxxzHWjkHoD6wIE88SFPGa4jzdu/mA+WWHefgG0EDbcWVCJ2o2NlXNNQVEPZgcPuV
         H3tJk4mANGn5RDFssxJk+bXyRJu8L3zYsKt9UAKYLuU19EHZ+HAUNsRpIF7LF2HCIUGF
         +6o1fkK1w1/4tTxW8LUxK17Nq0VL5vgnPtO4vjk0YN6OPPmADnl3ia6WNYCIIsHhuVEg
         nSHFqTrl0m5pd1iUxNjtwXJoi2aBXNzFq/prasjR/Peh6233JXz9rP3YnnseMmF1siBl
         0cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888849; x=1768493649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F61UVj+EIFW6s6BLu5Dtw+FuIVlV0w3b5yFMFCUC/uA=;
        b=tQtgfnsbjVfxwdR0l9gNQ/OfL0YSYteHx+YynJhJJ1CDNhEfOCWttbTHPGctl/aV19
         YQj98ZLizionGQiW7u2vn6euYIzKwefqco5MsIHUTTA5yqIe0C5HQh6YBIRyGG92qvAh
         tjBhcu8Vk1Rtb+83tiKslPflcr/2azg4kzkunWzR1k2ylHURL7XC3mXycDrABw27272T
         vcF5QiTIQxbY73vjxZO0TYG5g8pvcANC8wZOVHo0SAhHLvnv0pQWs7DdeCEx3p0GSbRi
         s0A49sdzp1rKAFDCf2oVu5uygUIg9g/SdUJjYLQ5jqy3rOnleNUK9qJ60eNvzROlXhZh
         qViQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEjTla2CCsGtrg7bf9X+pvt0G8hk9XyveorvVyiNmWInKhTF58JuopAERGm2ZKY9sxRl3lZB+1pak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzydCsp+DA5cfWOf3c6Dm/GrK0Alb+eEgChTAguH1k1PsCmOYEX
	KKwlHm8ez9vojNR96vyS0PP43VHb5SRCJYhUsp2pWTF0lMNHjifv3PnG
X-Gm-Gg: AY/fxX72/9B1S5D426n9LYG8byMVTfSIY/0DjixXhT+kcliqlQtaO118DrWF55YcN94
	g48hMqg36WZgHLz5REp8NgeGL0ciDIuTsy9cgjlJMPe7G0f05It8PSBpyrmXcl5aiJckE3e9oy8
	L9UuqYMMIzzvxLKJIShh+bYAF0VNEwxEq0xH6TIJUOvDbXjmMzehtQ1bWvcNHZ6eng5hQwFurrp
	4TYXYc4ji0OB93IOvLJPLVymxC+E2hDu0udcFFa+CqEHiukaGbjWzTp+2KMxAReLviajD1bWw9/
	ClrfGFUDWvu/pxO/Vuol3KD4ynwaTMi87StvYqWMy46DGiHay8w/aSbOJAexw5rz/cBvSTh5e5J
	otTVAvlVVl8NGdVPSfiRAvNOQWZHH2VgS0g35Ge9xdL2uXkuUHgbsmLOmfHUExWH/d7b2UwIZYC
	XP1MKdiiplahZdyTn5CiEF7ZN9Kx4J
X-Google-Smtp-Source: AGHT+IHUw0ndgQGARDPiYjVBJPpd3MIFT3PQ+nibX6sAPlgiHUG2yZLPiIcDwuxJDwU7YwDTjppNTg==
X-Received: by 2002:a05:6000:258a:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-432c36280damr8218539f8f.3.1767888848837;
        Thu, 08 Jan 2026 08:14:08 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:14:08 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 06/13] tools: ynl: fix pylint global variable related warnings
Date: Thu,  8 Jan 2026 16:13:32 +0000
Message-ID: <20260108161339.29166-7-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108161339.29166-1-donald.hunter@gmail.com>
References: <20260108161339.29166-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor to avoid using global variables to fix the following pylint
issues:

- invalid-name
- global-statement
- global-variable-not-assigned

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/lib/nlspec.py | 16 +++++++---------
 tools/net/ynl/pyynl/lib/ynl.py    | 24 ++++++++++--------------
 2 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/nlspec.py b/tools/net/ynl/pyynl/lib/nlspec.py
index f3173146b64b..0b5277082b38 100644
--- a/tools/net/ynl/pyynl/lib/nlspec.py
+++ b/tools/net/ynl/pyynl/lib/nlspec.py
@@ -13,10 +13,6 @@ import os
 import yaml as pyyaml
 
 
-# To be loaded dynamically as needed
-jsonschema = None
-
-
 class SpecException(Exception):
     """Netlink spec exception.
     """
@@ -439,6 +435,10 @@ class SpecFamily(SpecElement):
         mcast_groups  dict of all multicast groups (index by name)
         kernel_family   dict of kernel family attributes
     """
+
+    # To be loaded dynamically as needed
+    jsonschema = None
+
     def __init__(self, spec_path, schema_path=None, exclude_ops=None):
         with open(spec_path, "r", encoding='utf-8') as stream:
             prefix = '# SPDX-License-Identifier: '
@@ -463,15 +463,13 @@ class SpecFamily(SpecElement):
         if schema_path is None:
             schema_path = os.path.dirname(os.path.dirname(spec_path)) + f'/{self.proto}.yaml'
         if schema_path:
-            global jsonschema
-
             with open(schema_path, "r", encoding='utf-8') as stream:
                 schema = pyyaml.safe_load(stream)
 
-            if jsonschema is None:
-                jsonschema = importlib.import_module("jsonschema")
+            if SpecFamily.jsonschema is None:
+                SpecFamily.jsonschema = importlib.import_module("jsonschema")
 
-            jsonschema.validate(self.yaml, schema)
+            SpecFamily.jsonschema.validate(self.yaml, schema)
 
         self.attr_sets = collections.OrderedDict()
         self.sub_msgs = collections.OrderedDict()
diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 4bc8e58cb621..9774005e7ad1 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -320,9 +320,6 @@ class NlMsgs:
         yield from self.msgs
 
 
-genl_family_name_to_id = None
-
-
 def _genl_msg(nl_type, nl_flags, genl_cmd, genl_version, seq=None):
     # we prepend length in _genl_msg_finalize()
     if seq is None:
@@ -338,6 +335,8 @@ def _genl_msg_finalize(msg):
 
 # pylint: disable=too-many-nested-blocks
 def _genl_load_families():
+    genl_family_name_to_id = {}
+
     with socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, Netlink.NETLINK_GENERIC) as sock:
         sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_CAP_ACK, 1)
 
@@ -348,18 +347,14 @@ def _genl_load_families():
 
         sock.send(msg, 0)
 
-        global genl_family_name_to_id
-        genl_family_name_to_id = dict()
-
         while True:
             reply = sock.recv(128 * 1024)
             nms = NlMsgs(reply)
             for nl_msg in nms:
                 if nl_msg.error:
-                    print("Netlink error:", nl_msg.error)
-                    return
+                    raise YnlException(f"Netlink error: {nl_msg.error}")
                 if nl_msg.done:
-                    return
+                    return genl_family_name_to_id
 
                 gm = GenlMsg(nl_msg)
                 fam = {}
@@ -439,15 +434,16 @@ class NetlinkProtocol:
 
 
 class GenlProtocol(NetlinkProtocol):
+    genl_family_name_to_id = {}
+
     def __init__(self, family_name):
         super().__init__(family_name, Netlink.NETLINK_GENERIC)
 
-        global genl_family_name_to_id
-        if genl_family_name_to_id is None:
-            _genl_load_families()
+        if not GenlProtocol.genl_family_name_to_id:
+            GenlProtocol.genl_family_name_to_id = _genl_load_families()
 
-        self.genl_family = genl_family_name_to_id[family_name]
-        self.family_id = genl_family_name_to_id[family_name]['id']
+        self.genl_family = GenlProtocol.genl_family_name_to_id[family_name]
+        self.family_id = GenlProtocol.genl_family_name_to_id[family_name]['id']
 
     def message(self, flags, command, version, seq=None):
         nlmsg = self._message(self.family_id, flags, seq)
-- 
2.52.0

