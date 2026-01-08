Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6372BB1D
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888838; cv=none; b=MiRmNtohvjrg8BD2PvfSHcOErU7vIylSWfwvi9lw0E8VMDvF7RilCyPpFVzh19o7Uk1tLe0ZynnQR7//vp6bpUCL2yKlTQRMZvtdK/y1USl1Sv/0BGYdnPZ4ZDIIXfDLaApuYyh+1WgPMJ1rbQ1f039sT5C7vYPHFd00MyGZSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888838; c=relaxed/simple;
	bh=lVWIfW3F1a20z8S3LjWOB0sV8YuzT8UoNgFPjrAmLTc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRrrvo1zicZ7N2pFRqDUIBnTKqyl9WNxkfhveFnQNSBbixTB7w4u9G6bdmEV2MXwlQRM3KbcVd119ekQjXbLjJgMwDsSzgt8ZNREZFZLl1RsldzCxfU1F5q9t5c1Amha6A/DtAtS1X2fQwGESCS5QQgAeh+vGQ/aHDnJKhTMy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF4u399h; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF4u399h"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-430f57cd471so1773132f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888835; x=1768493635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMNJ4Kts5/HNCAR4F0oACjGDHyVhBwLAyv8CS9rPlaU=;
        b=FF4u399hG8zNKeQCLIcaNUziTCK26r3Yj01FpDRo6pJGv7kSGtIQ/bT71ApuUvLfJd
         2AMVSFZZUl2sJGMF1go2FlDlgliCpheaBaQx+2H6e5Sm5ROS8ygJrLCVM7XyeLZ1dm/s
         1yapVAfPVbXlkSdBVqFCSwmsqMZGidgpKmfYSsQnPfTVVp3puuD390SFg6XMUj+HaE0h
         w+7qIbYCmLGshsYPv0bVVaMqZxvF0Y+tc6yNDaz3ouNYL9GA1BJ2NzK5tt17i8gtyrGJ
         sQ8IEOPj6iBbi7bFUeYa3JcOnhscRDSu7IXLjlVyRSiXhPVnylPHb7+A/PnF1sRbLH35
         bLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888835; x=1768493635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SMNJ4Kts5/HNCAR4F0oACjGDHyVhBwLAyv8CS9rPlaU=;
        b=SQkxCaddlslSH+u1koS68tHfNOc6mhg8qg3XdSOL9fZ3jQc2CCDRWh9FC3wSIdl8s9
         JtUXZEAeIcgzplc4mGrTJbsYZ+RxnNGM6Y5sN2pAu0V4TjC0hoLQAZsiAxLFRigK+wFU
         piWXNb3xx9SvFQeJVz5C/HnFEflr9iPxsMpNFAHP9/V243eGgioJNEh/KrtG2ff5un+y
         vLkX3zQy14vT9COC2oEzdFjkYLk7hyk7kziaaYLsX+g5pIoC4Wzsi3FO5P6SQThjEWEQ
         lbpjtSwatkVUuix/204qsTBX9Hla3YjlCgbHDccYHZ6IaNyAYfRE7058DC6yL/jHaVEt
         jTgw==
X-Forwarded-Encrypted: i=1; AJvYcCXRDhcazUIhKxxw17Lk+5sYa47xC1crMfszvumFOSlUaFWssu/sgy+Ithmoz8hMPuj5GmcX6hIzxqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXixe1jxNsUn0HmAIeIl0p5Hg7z+oy5LJkex1Nd5I8o9CQepe
	SBGdj2zY/k8oWpFp8iNt9OS1t9FaFv3JT0lnWgzKr6kjqhiccr71ibtd
X-Gm-Gg: AY/fxX5EtAt5tgV+pezGluZ1cTMnnz4Oxtm0c3yovAH92Z1IKIsmBdhMawsSLfJ32ZQ
	i9jj5WnlBrtMbp17QO3HeAildag+5I5y9MC5x6IN4CamdTQ1spY6gJarACpNdQyg/6WlB02WssX
	83A34ERd7+Em9do+mZ45W4jzM+0SH/pRLilbLasK/IRqeirF9B4hTEhW4wh2z7N42SaxIZNLT8o
	aNGxJFsicStJ7xQIdaCxMTe8Iq2CenfTH12DH6n56Puc7TA2SOWuidpOFA5+MzyVaBMEcJYLX/c
	BmLlY7zsZuyoavnfhzdRuXb3jcHnQihafWCPTAD6jA3qLxS0Abw6RiYyRyfocZveyvRrD0BJ7LR
	eptSucJG+m8xAm2yQZ5FuB70hjlvhkws448dz6FQ8zHy6lm6+qia1NeSh/OjaowgFAOGmwZUNI+
	bibd9YyYEmfsJ24Lp9utZbdeg2NpWJ
X-Google-Smtp-Source: AGHT+IE6vNbSgXqc7bzvrP/5e6NKODguexTvefFtgVRtzfZJRMfDkb1GcqhQfJbhalm1munvR3U/mg==
X-Received: by 2002:a5d:64c6:0:b0:42f:b581:c69d with SMTP id ffacd0b85a97d-432c3628323mr7963391f8f.3.1767888834336;
        Thu, 08 Jan 2026 08:13:54 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:13:52 -0800 (PST)
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
Subject: [PATCH net-next v2 01/13] tools: ynl: pylint suppressions and docstrings
Date: Thu,  8 Jan 2026 16:13:27 +0000
Message-ID: <20260108161339.29166-2-donald.hunter@gmail.com>
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

