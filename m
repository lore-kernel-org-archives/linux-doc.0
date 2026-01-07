Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15008313E38
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788526; cv=none; b=H0lu6oKEoP2n6oj0kXvXq9E3sbogoeAxgjIVhzELkfTETuJf8+PI/ErIQSdtA636q7++OJcNMt+SReWhQPD+eC57zgYiB91EcM9urC9shZ+V1mxYUz83Q3vWDz+BlS1j8NYjgCH/ubN2pD1zciLU8aaZql8olOjwnXnB4iV1/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788526; c=relaxed/simple;
	bh=lVWIfW3F1a20z8S3LjWOB0sV8YuzT8UoNgFPjrAmLTc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6PMVeegpSgr/OYQUX+RwmR5JZxSKRrM88w3pni0avjuDegUpeeLa0MQL9/+nyUjZ6JaL8IG/L/m5CZ/1r32ajF5IiNZpvbDtSOGNo1DtzdAYvMaWnnA27EUORr+dIFPg/VK09CL0hWRt+J0uXXOzha1IFZBfJb0odEnugxhx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzwHUYIb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzwHUYIb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-431048c4068so470521f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788523; x=1768393323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMNJ4Kts5/HNCAR4F0oACjGDHyVhBwLAyv8CS9rPlaU=;
        b=OzwHUYIbeAd0rTe1F+dDg7yLKscPc0PaumWuPsZu4jaQsFtOF9tw/IluIGTXsoEAqO
         DyOtB88UU1yh++R8dYVnmwl7fYM2sMgOxjFNQDigR4XYSmWTsPIQax8ZT3Q/cOQofKRM
         LcJH8f/eaoTtK3PhkYjd0pE4kheXY4dOFHhP7TVphe72RDDya/rg3eWApBBmHCHqP9iL
         SmvekFOxmeQGaQA1D+XppMkAwBOyGyntrCDgC/buPnpKaMRwPb1viDCxkpiKUDvXrmOx
         nV8HyFVqCliIzmiTjstjg/MzV8o65Qq68q4RUVqGDw1I+VPdhQSAqKbASWeB5baYSBVs
         c58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788523; x=1768393323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SMNJ4Kts5/HNCAR4F0oACjGDHyVhBwLAyv8CS9rPlaU=;
        b=X1WECVUuR7AedwpjNeYl8MHBCXRdaI1oM+F4ERFToRNtPrwRGO38nUrzc7uayGPLOM
         ru2I0zPYiU24E9Ck57GxVfNkbxEQbSZrlP+oJ+tsN4knvjSZgFNibvzJYktClo+b/+bC
         5FIAiYgNJQL1rH0HUrRFZKfOZntZkv5gt2Ti/8XJjHz0BqzDkGOhYWnoN5P+3hIr+EFJ
         PAAjHEWh7ZHZufHRK+ZXoc3cGTXFOLWcRUOk8ibIU7OANX08PAeuBCcPIrtVfP1RTgBu
         Z4ImXCCRRcQY8dtyTuy29p5+tlZmaK67X+B8t9MyQEUX1ItXy548mzyPHtcSjwk82oOz
         ywAA==
X-Forwarded-Encrypted: i=1; AJvYcCVTKX8nV1Z5WjdSF+vM4povYzTbfhJM5/qA6rx/bJIpb0Yh++E2r5BfZhbhfnkBtrCtB/NnjytfiBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKotmvNDFFWTyM7ezqtteojxQ+EjOLZSbAURxEueDErw72qWe
	cx8/hC2ak5s/rb2MuLA9b8DiNB1WRC2biuIbPpWE4FkPE6IK/lXUVUXk
X-Gm-Gg: AY/fxX7RY9jdSQEAwfWbdZ8VB2FcXCRabFagUuGvc724PnGtjxNg30SuxQXM4Uyh92b
	5sPaDYPt+nTAi7C0RmXZodm84dfCotPjOaJqdPdtKZwgApkjP/mrhFvt2HTx3tbGzBdyYP3sxb8
	n7qw6tAWJYxgBKxAy76hovysnAQVIc0eTzHPNmnqYgKIhup41pc4mpHmExfB8QT4TfhaTyWJ/f8
	cMv9JLCv3x/2IGmZwLbjxch8W4pzJl/f1o/65yhiYCQ3CFzL3xxjcMbdpDnsdZK9tRdDlFsXv+o
	bG9zIHhzUABiq2PyCyeZ39u/hwcVJdRO1zbf4stSUTWEygtJHVjtDnOTYoi8AmRa1+RLeth9ruv
	jKtkcCWNoBJZiHn4SM4LjiawI/AECdf5jftEz0zvosIckKzKK1qxpE0fBIqhzjUWbxTdzGOsd5I
	+dtnNFx1e8sMvUylHERog6JIwNyh38
X-Google-Smtp-Source: AGHT+IEClxmk/vQCXvjMJIOWAtl/Cd8tfP/PJn3xuGZQyRDQG6DGD2FyzM/F0ozjr6n8QhHkFhSjIQ==
X-Received: by 2002:a05:6000:18a5:b0:42f:b555:5275 with SMTP id ffacd0b85a97d-432c3634556mr3368042f8f.10.1767788523134;
        Wed, 07 Jan 2026 04:22:03 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:02 -0800 (PST)
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
Subject: [PATCH net-next v1 01/13] tools: ynl: pylint suppressions and docstrings
Date: Wed,  7 Jan 2026 12:21:31 +0000
Message-ID: <20260107122143.93810-2-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107122143.93810-1-donald.hunter@gmail.com>
References: <20260107122143.93810-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some docstrings and suppress all the pylint warnings that won't get
fixed yet:

- no-name-in-module,wrong-import-position
- too-many-locals
- too-many-branches
- too-many-statements
- too-many-nested-blocks
- too-many-instance-attributes
- too-many-arguments
- too-many-positional-arguments
- too-few-public-methods
- missing-class-docstring
- missing-function-docstring

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/cli.py          | 17 +++++++++++++++++
 tools/net/ynl/pyynl/ethtool.py      |  1 +
 tools/net/ynl/pyynl/lib/__init__.py |  2 ++
 tools/net/ynl/pyynl/lib/nlspec.py   |  7 +++++++
 tools/net/ynl/pyynl/lib/ynl.py      | 18 ++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/tools/net/ynl/pyynl/cli.py b/tools/net/ynl/pyynl/cli.py
index af02a5b7e5a2..996c76be1403 100755
--- a/tools/net/ynl/pyynl/cli.py
+++ b/tools/net/ynl/pyynl/cli.py
@@ -1,6 +1,10 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 
+"""
+YNL cli tool
+"""
+
 import argparse
 import json
 import os
@@ -9,6 +13,7 @@ import pprint
 import sys
 import textwrap
 
+# pylint: disable=no-name-in-module,wrong-import-position
 sys.path.append(pathlib.Path(__file__).resolve().parent.as_posix())
 from lib import YnlFamily, Netlink, NlError, SpecFamily
 
@@ -16,6 +21,10 @@ sys_schema_dir='/usr/share/ynl'
 relative_schema_dir='../../../../Documentation/netlink'
 
 def schema_dir():
+    """
+    Return the effective schema directory, preferring in-tree before
+    system schema directory.
+    """
     script_dir = os.path.dirname(os.path.abspath(__file__))
     schema_dir = os.path.abspath(f"{script_dir}/{relative_schema_dir}")
     if not os.path.isdir(schema_dir):
@@ -25,6 +34,10 @@ def schema_dir():
     return schema_dir
 
 def spec_dir():
+    """
+    Return the effective spec directory, relative to the effective
+    schema directory.
+    """
     spec_dir = schema_dir() + '/specs'
     if not os.path.isdir(spec_dir):
         raise Exception(f"Spec directory {spec_dir} does not exist")
@@ -32,6 +45,7 @@ def spec_dir():
 
 
 class YnlEncoder(json.JSONEncoder):
+    """A custom encoder for emitting JSON with ynl-specific instance types"""
     def default(self, obj):
         if isinstance(obj, bytes):
             return bytes.hex(obj)
@@ -94,7 +108,10 @@ def print_mode_attrs(ynl, mode, mode_spec, attr_set, print_request=True):
         print_attr_list(ynl, mode_spec['attributes'], attr_set)
 
 
+# pylint: disable=too-many-locals,too-many-branches,too-many-statements
 def main():
+    """YNL cli tool"""
+
     description = """
     YNL CLI utility - a general purpose netlink utility that uses YAML
     specs to drive protocol encoding and decoding.
diff --git a/tools/net/ynl/pyynl/ethtool.py b/tools/net/ynl/pyynl/ethtool.py
index fd0f6b8d54d1..40a8ba8d296f 100755
--- a/tools/net/ynl/pyynl/ethtool.py
+++ b/tools/net/ynl/pyynl/ethtool.py
@@ -8,6 +8,7 @@ import sys
 import re
 import os
 
+# pylint: disable=no-name-in-module,wrong-import-position
 sys.path.append(pathlib.Path(__file__).resolve().parent.as_posix())
 from lib import YnlFamily
 from cli import schema_dir, spec_dir
diff --git a/tools/net/ynl/pyynl/lib/__init__.py b/tools/net/ynl/pyynl/lib/__init__.py
index ec9ea00071be..c40dd788fe8a 100644
--- a/tools/net/ynl/pyynl/lib/__init__.py
+++ b/tools/net/ynl/pyynl/lib/__init__.py
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 
+""" YNL library """
+
 from .nlspec import SpecAttr, SpecAttrSet, SpecEnumEntry, SpecEnumSet, \
     SpecFamily, SpecOperation, SpecSubMessage, SpecSubMessageFormat
 from .ynl import YnlFamily, Netlink, NlError
diff --git a/tools/net/ynl/pyynl/lib/nlspec.py b/tools/net/ynl/pyynl/lib/nlspec.py
index 85c17fe01e35..2ffeccf0b99b 100644
--- a/tools/net/ynl/pyynl/lib/nlspec.py
+++ b/tools/net/ynl/pyynl/lib/nlspec.py
@@ -1,4 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# pylint: disable=missing-function-docstring, too-many-instance-attributes, too-many-branches
+
+"""
+The nlspec is a python library for parsing and using YNL netlink
+specifications.
+"""
 
 import collections
 import importlib
diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 36d36eb7e3b8..27169ff8dafc 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -1,4 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# pylint: disable=missing-class-docstring, missing-function-docstring
+# pylint: disable=too-many-branches, too-many-locals, too-many-instance-attributes
+# pylint: disable=too-many-lines
+
+"""
+YAML Netlink Library
+
+An implementation of the genetlink and raw netlink protocols.
+"""
 
 from collections import namedtuple
 from enum import Enum
@@ -22,6 +32,7 @@ from .nlspec import SpecFamily
 #
 
 
+# pylint: disable=too-few-public-methods
 class Netlink:
     # Netlink socket
     SOL_NETLINK = 270
@@ -289,6 +300,7 @@ class NlMsg:
         return msg
 
 
+# pylint: disable=too-few-public-methods
 class NlMsgs:
     def __init__(self, data):
         self.msgs = []
@@ -319,6 +331,7 @@ def _genl_msg_finalize(msg):
     return struct.pack("I", len(msg) + 4) + msg
 
 
+# pylint: disable=too-many-nested-blocks
 def _genl_load_families():
     with socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, Netlink.NETLINK_GENERIC) as sock:
         sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_CAP_ACK, 1)
@@ -447,6 +460,7 @@ class GenlProtocol(NetlinkProtocol):
         return super().msghdr_size() + 4
 
 
+# pylint: disable=too-few-public-methods
 class SpaceAttrs:
     SpecValuesPair = namedtuple('SpecValuesPair', ['spec', 'values'])
 
@@ -555,6 +569,7 @@ class YnlFamily(SpecFamily):
                 return self._from_string(value, attr_spec)
             raise e
 
+    # pylint: disable=too-many-statements
     def _add_attr(self, space, name, value, search_attrs):
         try:
             attr = self.attr_sets[space][name]
@@ -778,6 +793,7 @@ class YnlFamily(SpecFamily):
                 raise Exception(f"Unknown attribute-set '{msg_format.attr_set}' when decoding '{attr_spec.name}'")
         return decoded
 
+    # pylint: disable=too-many-statements
     def _decode(self, attrs, space, outer_attrs = None):
         rsp = dict()
         if space:
@@ -838,6 +854,7 @@ class YnlFamily(SpecFamily):
 
         return rsp
 
+    # pylint: disable=too-many-arguments, too-many-positional-arguments
     def _decode_extack_path(self, attrs, attr_set, offset, target, search_attrs):
         for attr in attrs:
             try:
@@ -1081,6 +1098,7 @@ class YnlFamily(SpecFamily):
         msg = _genl_msg_finalize(msg)
         return msg
 
+    # pylint: disable=too-many-statements
     def _ops(self, ops):
         reqs_by_seq = {}
         req_seq = random.randint(1024, 65535)
-- 
2.52.0

