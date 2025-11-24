Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C72F7468;
	Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978276; cv=none; b=gw66tsHKjXZTPyn99/AFEP5q1eqIitdice62uF1sUhA1FQC4Nz9NsrUWuZmM0wwvwN/2KWA4F3gIfEok5hddAIckK/2R8LM8fgZau8Wvei2D2eK7OkRU1q8k11Sxv/Y916oNRGiEGmuqk3NJ0sNg7MMcKW2BZJIRVYtqYtdb5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978276; c=relaxed/simple;
	bh=9Ismxj297GqUp52pxp1UAgRMzcZZT3Gw6Sjv2/ZSBZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbLFd87l4xOyS4yrkXX2IrOf0zpFwbi+wtkI3pXn3V23zyY92V3uTcxAP4NqbSXhiB4H+oyG3GbqZLstOTk4lMqEvN5/ecUwX4d3zhJgEWafIJ8oyKqq/g94NI2mmOzOmwldmg/G8LzuoPzWohY2HRSKkRrlz0JWUegw+bQ8UdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkKUnHB3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkKUnHB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AE0C19423;
	Mon, 24 Nov 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763978276;
	bh=9Ismxj297GqUp52pxp1UAgRMzcZZT3Gw6Sjv2/ZSBZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pkKUnHB3iB7dcNti78RUUdH0cEwOBdpcp1d++SEF+jQSaaXnggv/nEfd4UXiWHqUX
	 p0o5OqVHoj5VCSj73PwrnEt8Bu36B9I0b5SvpmxDDecZvhKahHCFGYvG9ongFzbn35
	 ENzkxZGq2cDc2PAIG7LcYheot0E8CtRn06A3njEljRyaDi+cOgZvvQwOu3bET63J6e
	 fQ+NCPR7pK7qA5V8Pi3CchA4tw8L2sMQx/GVYQtQPxbWaTQ2rTuLbTqIfvfS82IRuQ
	 sJNvxeqBFMFJ34hxWKzevVyQTVPj/FH/+ic8Lmk2UIbELnpNqO5M1BNs28MnQSbUCy
	 IM7EKJYolpOGg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vNTKU-000000013c4-0dRz;
	Mon, 24 Nov 2025 10:57:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] kernel-doc: add support to handle DEFINE_ variables
Date: Mon, 24 Nov 2025 10:57:43 +0100
Message-ID: <a64ce3b4bda7d3010beaa889347ea32af4fd9ee2.1763978209.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763978209.git.mchehab+huawei@kernel.org>
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Improve the parser and output plugin to work with macros,
adding support for the common pattern of using DEFINE_*
to create variables.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py |  5 ++---
 tools/lib/python/kdoc/kdoc_parser.py | 25 +++++++++++++++++++++----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 8d811c2afaab..9f09c763a009 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -486,7 +486,7 @@ class RestFormat(OutputFormat):
 
         self.lineprefix = "  "
 
-        self.data += f"\n\n.. c:macro:: {name}\n\n{self.lineprefix}{full_proto}\n\n"
+        self.data += f"\n\n.. c:macro:: {name}\n\n{self.lineprefix}``{full_proto}``\n\n"
 
         self.print_lineno(ln)
         self.output_highlight(args.get('purpose', ''))
@@ -801,13 +801,12 @@ class ManFormat(OutputFormat):
 
     def out_var(self, fname, name, args):
         out_name = self.arg_name(args, name)
-        prototype = args.other_stuff["var_type"]
         full_proto = args.other_stuff["full_proto"]
 
         self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"{prototype} \\- {args['purpose']}\n"
+        self.data += f"{name} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
         self.data += f"{full_proto}\n"
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index edb0fb5330e0..a3cd1bb0c8e7 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -946,12 +946,27 @@ class KernelDoc:
         # Store the full prototype before modifying it
         #
         full_proto = proto
+        declaration_name = None
+
+        #
+        # Handle macro definitions
+        #
+        macro_prefixes = [
+            KernRe(r"DEFINE_[\w_]+\s*\(([\w_]+)\)"),
+        ]
+
+        for r in macro_prefixes:
+            match = r.search(proto)
+            if match:
+                declaration_name = match.group(1)
+                break
 
         #
         # Drop comments and macros to have a pure C prototype
         #
-        for search, sub in sub_prefixes:
-            proto = search.sub(sub, proto)
+        if not declaration_name:
+            for r, sub in sub_prefixes:
+                proto = r.sub(sub, proto)
 
         proto = proto.rstrip()
 
@@ -965,14 +980,16 @@ class KernelDoc:
            return
 
         var_type = r.group(0)
-        declaration_name = r.group(1)
+
+        if not declaration_name:
+            declaration_name = r.group(1)
+
         default_val = r.group(2)
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
         self.output_declaration("var", declaration_name,
                                 full_proto=full_proto,
-                                var_type=var_type,
                                 default_val=default_val,
                                 purpose=self.entry.declaration_purpose)
 
-- 
2.51.1

