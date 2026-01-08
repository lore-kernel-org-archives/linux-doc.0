Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83C243956
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888855; cv=none; b=TrlCpjqPfsBgre5sTZghAxSfZX7DHDzXiU86uVf9ubar7u/gv7KcmQP6Na14CYCkeyCu2f83BP8Z6V7b/xFSI8nhUroNZjxZ9taXvRMvDUu49wmp2TIE3QaQ552/a5oEJsccJmvJy8DN8PlbZJhaMKqQF/o/qWHXTSo8VBGSqpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888855; c=relaxed/simple;
	bh=LXy2Ua1cUOSGWHBNdtUnsbR39WZkmXzM0hJK6m/a3KQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1iSGhQnIAQcxsu8PAr0+iDGhRoS8LCJ+ravuksKdtTB+RNcGIhlSajmJ+kSdPNATT1T+EwmXKCfj4tb8jY0xuRuIqb7qpQrvySUIsHElxw4KK7d+pP4wV+jEKzI5GztNJti2b05CzPDAp3xbR7qyBoB3VFgb3PfdmSxr6yov2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDBcptIS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDBcptIS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1725405f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888851; x=1768493651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN8D9zqUx9hP6RtZocuSaBDdTng6nEw0sA37guFjwQ4=;
        b=eDBcptIS0VRNduzrOJvCI6whOOG3jjMrsWJGLlnve4D+JdpEErS86ORdy09C60N+zh
         HUYnKsraUq/dYo08TyGyTGrmanUyapA1dun9GbGUlhA1bmmnRBlx3Usf5QVprSC2GsNt
         5S6UdHJ/R1Cvs7p/qIS+8mgjTGe6U1xNmdEG5Y6+xU2Ta7QFwxrj0VGxnL8rhE2RD5D0
         QLp3YuGMTnZoj+jKosM1sbrlBwwpMYWEu606TDIalOdl8/zLB2F4s0u9d8GkKZAjDnYY
         UVB08APgD/BCPyGeTbmu46ON5m8u9JfFU3DcD5MYXfBPJw1BbbXfk5wcA8aMf8qI24mY
         fYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888851; x=1768493651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uN8D9zqUx9hP6RtZocuSaBDdTng6nEw0sA37guFjwQ4=;
        b=BdzUDX76U7nBQjnnXH+ipoa3EqT9WljZsxLSCmNjUjNhcsUpBKPOQUbYGtJKrJGmN+
         LHc+A2VsiXSCCrWtyIu7w9dM75aOCJVZTfaGbKsHSAQBYMKDK2vK1SkdpRxN9QmML6XZ
         sx1VNdO39JWfif9kKvyNAg+lBnX7JVEeLxYcL+iBUbvFv0PRBr73u+wkWzltK+R2FgzS
         KbwjnffGoTxVkVVRk06w2dYRAPSDrOjcCG0BdhQNy6ce22pY1Ve+al9STdQZwb6JuJgZ
         Fkvp7uEqaKaf2NxLhhNxgzWvjZt6fBZYI0BN8uD99CofJh7i2vbxfR3b1A94cHNjKHrF
         /e9A==
X-Forwarded-Encrypted: i=1; AJvYcCVVajWymuFTOx7dzOd2J9lNGE2Si3uY992Vblg1tyUCtoucyo09eMDPua4lcEVBiXzvGE1Qu6wZQnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrasEvGO+7gOMgOlmoPNgWDvcAiEdPah8CkWNQYJrj4pKGgNlw
	4dWvFxATQXRBs0VoJFip03CwejVsEK4sFO0AZUl2cKAch7k9O7sFBU5o
X-Gm-Gg: AY/fxX5lZJw61boehrBismKJMk+bkH3sQCbCnMO10Q1sG53jGQRgAOq4TirNvlT6rhH
	xO+l4+kTO3A4WvStoq6hR0vbByE7rSak/GAfsZrKDmsZ09PbJDLnPp60OmRJxWv72a9b0BV3tFH
	uM/pR3g+hwxU5MhKRnSg3pmIDke+jsoOo8fhSxF/RMoM3JF343rB+VYCBuWerIh8DDeqwdRz7M5
	i3QgIOiM2jtxzW/BfdupjdBptvTIsYQ3QnlEycpik9GlVsocXuWSZjOppTz7fi+p5mrbAcB5Jaa
	ZcTY/Y6bt5SV5Xvljms7sh0qhHE6w7QzwBTGXIK0B8wJBQkY9WHpuORtSpXujqJseBL+WsEtBTv
	PuZ4OageakGfoXd7rh4a7shBCQlEvQBbPoU6g9CJX/6CRXjZ1ZklOTZ68g6arFULOWvIWhxak1B
	4a4+BUm/Cu6u6qHjMYNHEzJKg+l+DJ
X-Google-Smtp-Source: AGHT+IFWuMKAlw7vAFoR/06p1Ty8iS62arXcBSiWcP9P0l+zbna8uaAvmkxQD38fb3oGMEha5w4Ccg==
X-Received: by 2002:a5d:64e3:0:b0:42b:3dfb:644c with SMTP id ffacd0b85a97d-432c3628287mr7819387f8f.10.1767888851369;
        Thu, 08 Jan 2026 08:14:11 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:14:10 -0800 (PST)
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
Subject: [PATCH net-next v2 08/13] tools: ynl: ethtool: fix pylint issues
Date: Thu,  8 Jan 2026 16:13:34 +0000
Message-ID: <20260108161339.29166-9-donald.hunter@gmail.com>
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

Fix or suppress all the pylint issues in ethtool.py, except for
TODO (fixme) items.

Suppress:

- too-many-locals
- too-many-branches
- too-many-statements
- too-many-return-statements
- import-error

Fix:

- missing-module-docstring
- redefined-outer-name
- dangerous-default-value
- use-dict-literal
- missing-function-docstring
- global-variable-undefined
- expression-not-assigned
- inconsistent-return-statements
- wrong-import-order

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/ethtool.py | 46 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/tools/net/ynl/pyynl/ethtool.py b/tools/net/ynl/pyynl/ethtool.py
index 40a8ba8d296f..f1a2a2a89985 100755
--- a/tools/net/ynl/pyynl/ethtool.py
+++ b/tools/net/ynl/pyynl/ethtool.py
@@ -1,5 +1,10 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# pylint: disable=too-many-locals, too-many-branches, too-many-statements
+# pylint: disable=too-many-return-statements
+
+""" YNL ethtool utility """
 
 import argparse
 import pathlib
@@ -10,8 +15,10 @@ import os
 
 # pylint: disable=no-name-in-module,wrong-import-position
 sys.path.append(pathlib.Path(__file__).resolve().parent.as_posix())
-from lib import YnlFamily
+# pylint: disable=import-error
 from cli import schema_dir, spec_dir
+from lib import YnlFamily
+
 
 def args_to_req(ynl, op_name, args, req):
     """
@@ -49,7 +56,8 @@ def print_field(reply, *desc):
         return
 
     if len(desc) == 0:
-        return print_field(reply, *zip(reply.keys(), reply.keys()))
+        print_field(reply, *zip(reply.keys(), reply.keys()))
+        return
 
     for spec in desc:
         try:
@@ -89,11 +97,12 @@ def doit(ynl, args, op_name):
     args_to_req(ynl, op_name, args.args, req)
     ynl.do(op_name, req)
 
-def dumpit(ynl, args, op_name, extra = {}):
+def dumpit(ynl, args, op_name, extra=None):
     """
     Prepare request header, parse arguments and dumpit (filtering out the
     devices we're not interested in).
     """
+    extra = extra or {}
     reply = ynl.dump(op_name, { 'header': {} } | extra)
     if not reply:
         return {}
@@ -115,9 +124,9 @@ def bits_to_dict(attr):
     """
     ret = {}
     if 'bits' not in attr:
-        return dict()
+        return {}
     if 'bit' not in attr['bits']:
-        return dict()
+        return {}
     for bit in attr['bits']['bit']:
         if bit['name'] == '':
             continue
@@ -127,6 +136,8 @@ def bits_to_dict(attr):
     return ret
 
 def main():
+    """ YNL ethtool utility """
+
     parser = argparse.ArgumentParser(description='ethtool wannabe')
     parser.add_argument('--json', action=argparse.BooleanOptionalAction)
     parser.add_argument('--show-priv-flags', action=argparse.BooleanOptionalAction)
@@ -156,7 +167,7 @@ def main():
     # TODO:                       rss-get
     parser.add_argument('device', metavar='device', type=str)
     parser.add_argument('args', metavar='args', type=str, nargs='*')
-    global args
+
     args = parser.parse_args()
 
     spec = os.path.join(spec_dir(), 'ethtool.yaml')
@@ -170,13 +181,16 @@ def main():
         return
 
     if args.set_eee:
-        return doit(ynl, args, 'eee-set')
+        doit(ynl, args, 'eee-set')
+        return
 
     if args.set_pause:
-        return doit(ynl, args, 'pause-set')
+        doit(ynl, args, 'pause-set')
+        return
 
     if args.set_coalesce:
-        return doit(ynl, args, 'coalesce-set')
+        doit(ynl, args, 'coalesce-set')
+        return
 
     if args.set_features:
         # TODO: parse the bitmask
@@ -184,10 +198,12 @@ def main():
         return
 
     if args.set_channels:
-        return doit(ynl, args, 'channels-set')
+        doit(ynl, args, 'channels-set')
+        return
 
     if args.set_ring:
-        return doit(ynl, args, 'rings-set')
+        doit(ynl, args, 'rings-set')
+        return
 
     if args.show_priv_flags:
         flags = bits_to_dict(dumpit(ynl, args, 'privflags-get')['flags'])
@@ -338,25 +354,25 @@ def main():
         print(f'Time stamping parameters for {args.device}:')
 
         print('Capabilities:')
-        [print(f'\t{v}') for v in bits_to_dict(tsinfo['timestamping'])]
+        _ = [print(f'\t{v}') for v in bits_to_dict(tsinfo['timestamping'])]
 
         print(f'PTP Hardware Clock: {tsinfo.get("phc-index", "none")}')
 
         if 'tx-types' in tsinfo:
             print('Hardware Transmit Timestamp Modes:')
-            [print(f'\t{v}') for v in bits_to_dict(tsinfo['tx-types'])]
+            _ = [print(f'\t{v}') for v in bits_to_dict(tsinfo['tx-types'])]
         else:
             print('Hardware Transmit Timestamp Modes: none')
 
         if 'rx-filters' in tsinfo:
             print('Hardware Receive Filter Modes:')
-            [print(f'\t{v}') for v in bits_to_dict(tsinfo['rx-filters'])]
+            _ = [print(f'\t{v}') for v in bits_to_dict(tsinfo['rx-filters'])]
         else:
             print('Hardware Receive Filter Modes: none')
 
         if 'stats' in tsinfo and tsinfo['stats']:
             print('Statistics:')
-            [print(f'\t{k}: {v}') for k, v in tsinfo['stats'].items()]
+            _ = [print(f'\t{k}: {v}') for k, v in tsinfo['stats'].items()]
 
         return
 
-- 
2.52.0

