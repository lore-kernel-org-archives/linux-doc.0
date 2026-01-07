Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0281F315D23
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788535; cv=none; b=L2i+/F/85iWIlSzl+4CCv6AVOIEQbyou41g8G2mFbJQM08KpybKRZNUldYf7aRfbpMj4CeuEmiOvyHPhUD2Hi+vI2vTXP25X086tf2JkJNUI9GPceBfv2bFXR3Jr5omVvdPAMUdAnqWkuTBTdZYtqxqJWSr48X/CuvlbgZ9jO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788535; c=relaxed/simple;
	bh=LXy2Ua1cUOSGWHBNdtUnsbR39WZkmXzM0hJK6m/a3KQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLXy0q2Xlc5A0yheFLYvcQVpb/W8GBWHiInnyNQZ7F7etnDYUMss7PIwuwNydY2FZ75z3RLsABQNX+0WB82rUUAVB+jqpLn5rjuxUZklXyKRXatG4fWY9vtMCrbYN64TBObjm/oTju0ncLqOPzHOvV7wt9JTVkovt6R5wbyjskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRXN1+RR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRXN1+RR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1017171f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788532; x=1768393332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN8D9zqUx9hP6RtZocuSaBDdTng6nEw0sA37guFjwQ4=;
        b=NRXN1+RRNkQ7mKgu5WGlHn+4slocIXbevPh0nbkziTpQlR754cABtNinS36Fk5sTpM
         U/DnMNA79oC36nc2RwDgUQKU2/ymfL2lvcjg3rV4btX9ybityBBv0nT3CIgOMLf+PJrx
         Lj91wej5KBDuXSdihL1QHQhdiWQT2sp4lQiyY1cG8AaCD1p1GLr/3lnxAPpGoEl8gsz1
         AmFgfWCMFpnwMcGhv+fg+Ve453IWtxtyHaJp5CWsIJEtmdtqdAUNhJdp9CmBZePwvxCV
         4/lNTeBRKYeEUxFmaJD2FBeuI/1fgsXJSVIykkcbOgpfEI+JHFXjAatAZDT9B9tkllPd
         jm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788532; x=1768393332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uN8D9zqUx9hP6RtZocuSaBDdTng6nEw0sA37guFjwQ4=;
        b=Jf5rqrCvJtczWr9HjZ4/l71iWy978ZbTBsu9S6TJuEgf73JnzCSXcfNq5NZT1TxJX/
         H5C3nYTn58FFufjaS3q9mw5nwbzSIdTffJZILFxZzqVqV36bX1M83RBXQcN1LsRmdTJ9
         5Gd0jqWzHknjAIx2ddliAai6qz01ikleRMw03h6iEoW//jxAJOaoY/wlsLpfENFZGqZY
         nXNmSkZDX6nky1ZUrnjC83X9mEQvBQnJSt2vVsllMkfewIXTgIfUf/NO0zz0VUj2x0JD
         elN94i9qGp4DiZhI9A4JpTSd8Sbj+TxGu8ME/nNjCFHyJio3XgA1YI+SrKCcLCKq90wS
         LHzg==
X-Forwarded-Encrypted: i=1; AJvYcCUDWTXpvQ5FfnwTEa+YU+a+0J3PfdcMUTQdo5qc+p5JpbCpqfW9KYXKJnrktbRBswSbsllucVbiE6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyasU3YelCMOqeumo2nhMmZv8HYUR0S9qvKZsJUW0D1KNPovV1W
	gZmIbnnV8j/zJ8KFQKQwq1LHJRrjR+an64OZsppsazw7U+X8S5+QGin1
X-Gm-Gg: AY/fxX4srpSFZcJ3i7Wbk3LCbBBHXjROXZvcJXVy8TMXLVyvoREC4kcfoeizJCCJX0j
	gmwqzU006wb3ncSmNtgSGHiEssfSMEGHq67eu8EkdYzDRVlM0PbA+oYgUxt8clz4/HPiYwU1rpl
	mVu8+ZglwbZ35LpYobQmoHPQ+ake1s71TiGfAze2biuE8XRbPd1/VQbgsxvea1Cmnxtvpak8fzq
	yQGmlhF94WDN7gAfnKRaOzdxWXlqw+Px0j6OPSjwtERJrGrxDV+2MTVv+kEKIN1KiTGJVW3hZcc
	ywBTujvy6jBDnXju6ruJfggqSBmHMoHpqf6gtg6Mlkyum7s2NHeeYncFdx2Mt6TMDV2FDNxGpSR
	wn0pMP31X+s9Vcv9amGTl+qnBJ9qz3sddSkQdhUmJ849cz5zs6QWq2meMNBLXqhuoSyg3GMK96n
	/cEq9yCjxYQ/6h+1sbWOJKET5lnpCU
X-Google-Smtp-Source: AGHT+IGr9TUwQpcofSbPB7NYJIiUrsvqauRvD/eEo4Cw0ZOENCc6OAYe73MHpEeICsPVDw5iyoM7jA==
X-Received: by 2002:a5d:64c7:0:b0:42f:b690:6788 with SMTP id ffacd0b85a97d-432c378a0d4mr3006796f8f.10.1767788532034;
        Wed, 07 Jan 2026 04:22:12 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:11 -0800 (PST)
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
Subject: [PATCH net-next v1 08/13] tools: ynl: ethtool: fix pylint issues
Date: Wed,  7 Jan 2026 12:21:38 +0000
Message-ID: <20260107122143.93810-9-donald.hunter@gmail.com>
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

