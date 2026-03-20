Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DE35E956;
	Fri, 20 Mar 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000006; cv=none; b=CY2bne/5405oY9lhGx3bDH5h0fHn8hlaZohNt0Hi3bAHU+wKUDxaGt7nQ+w+8LghI7I8oMikM4by0fbS2p47gj2FQ/NesgVoCRcpKza4w01HE+XraArUnFt5IqF8dobk9igLh6G4sEZMWVuuwivkNeEh0Mm1ZlX3z0HqzWw7RUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000006; c=relaxed/simple;
	bh=oGBXFVA6b5hSd8r6F4eDGUdi4rjMPmXLArBN5DXSie4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1BBFynBXhDD5oIDA4jvVpFfLLTz0PYUP7CxYHEwJegH8mhr+KMB1W4qTWjIE/I8mcbWrzHdOyBzOJCGxBSDWWiKL+VrtJ7AvdP7kP3Hp9clLAePU/WjMkU4PeI25xC0XVSRfosWfbw5kzcnt5TuJB3pTT8oCB9rVZPt1XqV5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVSXhx3p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVSXhx3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63C1C2BCB0;
	Fri, 20 Mar 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000006;
	bh=oGBXFVA6b5hSd8r6F4eDGUdi4rjMPmXLArBN5DXSie4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PVSXhx3pC9IZPX3P8nkd7JZx7x+PSPFda1Aagvkj7mjsUlsrwhG0DeT0qTYNh/h/g
	 0gxNpWTkD3I3OV5njMXksKqmDDxyioN2vVxWydj19iAA//qTnURb1+yL3PUrTblpb+
	 3GeyZjV3G7sk4mW1yiLo+Fv48cupajDvB5yiep/slUZb/fI8AQV+oBNV/xDP2S0by2
	 k6c7zLXGHDH//zy0cGJZbdv4EttKJ319clTSd6NqVEcjp8ZrutJeMF3tyAT8M//ZCX
	 aFDZq/frRtQpSwQlkASuFGCKrF0ynBd/l9vjrwbCOEE03Pm6kCP04/Qc1j6pqRV0D6
	 eLPzBaha7QIyg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w3WRH-0000000CbvC-3cZJ;
	Fri, 20 Mar 2026 10:46:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH RFC 2/2] HACK: add a parse_c.py file to test CDataParser
Date: Fri, 20 Mar 2026 10:46:41 +0100
Message-ID: <99bb5de72b3510f45c6aec7b505a7b48b060dbe3.1773998596.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773998596.git.mchehab+huawei@kernel.org>
References: <cover.1773998596.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This patch should not be merged. It is a quick tool to test
CDataParser.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 parse_c.py | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100755 parse_c.py

diff --git a/parse_c.py b/parse_c.py
new file mode 100755
index 000000000000..740445998965
--- /dev/null
+++ b/parse_c.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+# example.py
+"""
+Run a quick demo on a real C source file.
+
+Usage
+-----
+    python -m c_struct_parser.example <path/to/c/file.c>
+"""
+
+import argparse
+
+from tools.lib.python.kdoc.data_parser import CDataParser
+
+TEST = """
+struct property_entry {
+	const char *name;
+	size_t length;
+	bool is_inline;   /* TEST */
+	struct foo {
+		char *bar[12];
+		struct foobar {
+			enum enum_type my_enum; /* TEST	2 */
+			struct {
+				uint_t test; /* TEST 3 */
+				static const int anonymous;
+			};
+		};
+		;;        /* This is valid, but should not occur in practice */
+		{};       /* Same here */
+	};
+	enum dev_prop_type type;
+		enum {
+			EXPRESSION_LITERAL,
+			EXPRESSION_BINARY,
+			EXPRESSION_UNARY,
+			EXPRESSION_FUNCTION,
+			EXPRESSION_ARRAY
+		} literal;
+
+	union {
+		const void *pointer;
+		union {
+			u8 boou8_data[sizeof(u64) / sizeof(u8)];
+			u16 u16_data[sizeof(u64) / sizeof(u16)];
+			u32 u32_data[sizeof(u64) / sizeof(u32)];
+			u64 u64_data[sizeof(u64) / sizeof(u64)];
+			const char *str[sizeof(u64) / sizeof(char *)];
+		};
+	};
+	char *prop_name;
+};
+"""
+
+
+def main():
+    p = argparse.ArgumentParser(description="Parse a C struct/union/enum definition.")
+
+    p.add_argument("fname", nargs="?", help="C source file to parse")
+
+    args = p.parse_args()
+
+    if args.fname:
+        with open(args.fname, "r", encoding="utf-8") as f:
+            source = f.read()
+    else:
+        source = TEST
+
+    parser = CDataParser(source)
+
+    item = parser.item
+
+    print(repr(item))
+
+    print(f"{item.decl_type} {item.decl_name}\n")
+
+    print("parameterlist:")
+    for p in item.parameterlist:
+        print(f"  - {p}")
+
+    print("\nparametertypes:")
+    for k, v in item.parametertypes.items():
+        print(f"  - {k}: {v}")
+
+
+if __name__ == "__main__":
+    main()
-- 
2.53.0

