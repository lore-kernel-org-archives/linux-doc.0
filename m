Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633667;
	b=jmkhjMcF84zprlazs0ZfPQeNr+PEwHnUJTnmsLAWsbrATsrcxcs2+5yMO0uVFpwVRKcq
	 Z8eMpMMkAQJ8BiRIgio10p984JwrGegIxueYTbnm9P0QHjQtQ5acCqFO9jB08ynCbi5lI
	 Iir2L4sPoEc0zozC0DT7eOmKgphPOBfbvnEylhsJiKETpcB3C8fYhGu+Wg8d0yx9wsIEV
	 B1Gz36K99XqwCxcd1v7Njmv2p7QXG1pU9/Io6Jkl1Xj7n6wdYePK8h0fC9eIzrjGlp+0e
	 Z1J8Kf3dHOacQnb0AgyApC+PO+bBFmW34lpyJKy9usY02wl1f5SKs3H7FxCGWAXam+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sKg8ZyMEEgOXaGd8usgF3WU02o1HXUcHjHUf4a0nWGw=;
	b=3kaZTokHusVeX/omdwdeLk8n27hu1+p9EaD++RlOodQYY1P0rtLkjCdRSTZJT3ykblQz
	 swdLQSN1suPGAjekDxIzZ+fDSZImrWjVzJRuVBCxkKix8txWnMF8tHEnx/4HCatDE4Wfn
	 s9TXWPV4yn9A60xX07Z5bUBq6zM2FzBzFdxI3ON7+3zOKnyq0OoHnbUcCZNEputuRKztq
	 mlxp35cHb4KhWwPZliZRlZM5FsUjC8m40BHHeh76L02oqVAFLfKjXQ4JVGuHcKOZlaqAH
	 wj1qwR6641er+bcink21beAdVHXMsL8TYg3W0R2FINlhPoEpxOWSm4U9sAxo7FbQYew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFWesse3;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617E7606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 19:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFWesse3
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4834164c88.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 11:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633666; x=1796238466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKg8ZyMEEgOXaGd8usgF3WU02o1HXUcHjHUf4a0nWGw=;
        b=sFWesse3cL28V8jFgtWKa3sArLJ4cUGPF0a1k6zvtoIheXiQiv5m6nQpFjhjQtjnUs
         0lP3pojglMhy+AKhtXLwRPasBn8iWb2/zwFHh/ZNTgUqil0PsHQcUp4kh5cPrW9ClEeL
         SBABfdnKBjwA5PZYNa2zLx522WUpM0wiOOAEhFAsNqVIHuCdejxAXi5TyuqSrHNtJNuL
         4UWrWZTTrO6I/JktPfRL0NjX+f17O6l6KxKZwfpc41OOaztXyiEWUv3ImSjvemOY11fz
         H+fEGFLrFH/pP+oXWjMuwBWjgtaSdCPSCc33VyBnNk1lHlJFu2PDvdD5NLGbjMJi31BL
         HBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633666; x=1796238466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKg8ZyMEEgOXaGd8usgF3WU02o1HXUcHjHUf4a0nWGw=;
        b=frlED73cILwbvv0tk/dm9l9wUxJUo8tu/vt/Q8bSB+u0iH4yyXUfAJ2HwHjNFK6xGM
         F0g00KzYTRdfFo5UwQStUvebjr7Asbzg3bkxHQsUfjenuTD8p2jj9ib4SXd1DTtTLAeO
         H7ptZT+JRoFYbBVEhjMq6FJTYTU2RxLgHxSdANiOVpwiix5UjiGIL9kIf5YIRnlVkGCA
         gS8x1X2t0gf1WQumhy9Lx2IgEhc6z9G39Kf4MERKTMR4KroRXi6rT9L5Xh8OiHQrUTVK
         QX2YA2FfhYnietgVfZhlA0DXPdUdLRl/A3c7noeQziaX4+MrMikFpj89OfelZPcuKjQy
         sIJQ==
X-Forwarded-Encrypted: i=1; AL+hErEaqhnp8Xw1c0XeQNry0WA8PnFo8+YtIT7y/5yjxQviYE0UTXE/z0beyzQo7LPDFd3LA7EuZbZHP+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6PRpSi2KFZ6x0G+OhqTgsNcIsbjvjS57mlmj983EA7FlyQpcp
	NZFjYqRlkgpUvI/Gar9Q8tZkBLpknq+ZCWa5g2iKgUwLrHz5X3OM610W
X-Gm-Gg: AZFdTZfaDi89UUCg1GM5j82vXCi+yXbt7C/UXJnbIp2b7kS/+RdsghFekq7TtwG5x1D
	mZISvnDDS+5A+Sd2QG8X8cNTjD6aTxYY1dRmfOOvJuIGHfUQuxxM2RRtLsDJS7krEOw6MxIGGBf
	OuWBS/ebw3AYv2cy/hEMdTte9r9yU947WKH2ExJlE+NIeXaNiHImeCbcXKhtAg//2J/mpk2mY7K
	p+ZkRAP0aCRkHiHacR2eSr6EZuGzBy0BsRWfc5PkZU9CjDN8DJy9IpBkTO9q6n2VE+3OuDzAfj0
	2dtnyS4cWDErau9QmhPWb1aDzMWrmuxQl+a1iEcy0w4Xdw4v9PQLgRK+6C+5k/oPsy75wGa5FzR
	kvMnBQ61qkIAiAjEU1Vnaz6cTCPOUjZZNA+EF/pXWyiluJRIOpwf/1fawN6JTQWvnKwO4v8yrXN
	0rxQ/TFt94d4JFmL1hfAIgVYeO50gAFkNwpbOTyQYBU3TDieOZXGFLuy9Ew7lhYkd/Qu8eswo6K
	m/Goa+UCM1gVKaSG8K/YE6nh1PbEcs5B5dSeKADD+oIE8BPJ62qQ6zxhuJIwImsaYWYgnB8su+w
	zR5OfjhYVsZqUIAMg5OU4lB6nud+ixB0rM9Y/3vULw==
X-Received: by 2002:a05:7022:7f01:b0:1b2:6a01:f55e with SMTP id a92af1059eb24-1b56f39c712mr9624578c88.34.1795633666143;
        Wed, 25 Nov 2026 11:07:46 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:45 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 1/3] docs: python: abi_parser: Detect a symbol repeated on one file
Date: Wed, 25 Nov 2026 19:07:40 +0000
Message-ID: <20261125190742.2420486-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_issues() warns when a symbol shows up on more than one file, but
it never looks at a symbol that two entries on the same file claim:
"if len(files) == 1: continue" skips that case.

The parser stores every entry under a key of its own, so a repeated
symbol on one file is visible as two entries with the same file.
Compare at that level and warn, and keep the cross-file case
informational, because two drivers may expose an attribute with the
same name for different devices, as sysfs-driver-hid-lenovo-go and
sysfs-driver-hid-lenovo-go-s do.

Verification: get_abi.py --dir Documentation/ABI validate used to
print four warnings for the cross-file case and nothing for the
repeated one.  It now prints four informational messages for the
former and two warnings for the latter, at sysfs-driver-mlxreg-io
lines 348 and 744 and at sysfs-driver-hid-lenovo-go lines 389 and
566.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/lib/python/abi/abi_parser.py | 47 +++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/tools/lib/python/abi/abi_parser.py b/tools/lib/python/abi/abi_parser.py
index d7bb20ef3acc..519ccacbadca 100644
--- a/tools/lib/python/abi/abi_parser.py
+++ b/tools/lib/python/abi/abi_parser.py
@@ -554,28 +554,41 @@ class AbiParser:
     def check_issues(self):
         """Warn about duplicated ABI entries."""
 
-        for what, v in self.what_symbols.items():
-            files = v.get("file")
-            if not files:
-                # Should never happen if the parser works properly
-                self.log.warning("%s doesn't have a file associated", what)
+        # Two entries on the same file that claim the same symbol are a
+        # copy-and-paste mistake.  The parser gives every entry a key of its
+        # own, so such a pair shows up as two entries here.
+        per_file = {}
+        for key, v in self.data.items():
+            if v.get("type") == "File":
                 continue
 
-            if len(files) == 1:
+            file_ref = v.get("file") or [None]
+            fname = file_ref[0]
+            if fname:
+                fname = fname[0]
+
+            for what in v.get("what", []):
+                per_file.setdefault((fname, what), []).append(v.get("line_no"))
+
+        for (fname, what), lines in sorted(per_file.items()):
+            if len(lines) < 2:
                 continue
 
-            f = []
-            for fname, lines in sorted(files.items()):
-                if not lines:
-                    f.append(f"{fname}")
-                elif len(lines) == 1:
-                    f.append(f"{fname}:{lines[0]}")
-                else:
-                    m = fname + "lines "
-                    m += ", ".join(str(x) for x in lines)
-                    f.append(m)
+            self.log.warning("%s is defined %d times at %s: lines %s",
+                             what, len(lines), fname,
+                             ", ".join(str(x) for x in lines))
+
+        # The same symbol on more than one file is normal: two drivers may
+        # expose an attribute with the same name for different devices, as
+        # sysfs-driver-hid-lenovo-go and sysfs-driver-hid-lenovo-go-s do.
+        # Report it, but do not call it a problem.
+        for what, v in self.what_symbols.items():
+            files = v.get("file")
+            if not files or len(files) < 2:
+                continue
 
-            self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
+            self.log.info("%s is documented on %d files: %s", what,
+                          len(files), "; ".join(sorted(files)))
 
     def search_symbols(self, expr):
         """ Searches for ABI symbols."""

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

