Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48AF228CB5;
	Fri, 10 Jan 2025 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534549; cv=none; b=SzLWMQn+soskkxUpvapcFTpBcEbaZeOqKGe6B75V/Nby/DhENqLB8alA67akxkPKbwdfjbVo/jvWV56Tb/HufFBjYtSd3BeyC43lWVvY9lnpnDtuQjQRD5mjwRHausJhVlzs7TnOch7o2IL82FRfHSo9Ujj8miv53FURMfD/2ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534549; c=relaxed/simple;
	bh=XrKo0J1Wwa62xaxBr/FHq+uX+uQrrAIgJFaR8zAXlZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWDKLvCm00seQdLXGSayGV3RcZ3tDFrujXUiwPlzdCy3i32cR11GriK+RglMeaQRDaYqsYWY1+cYJhclQlJP7nM0BfDcKtHSv6/ZBmN/SPqdQEI5XQJZ2AFayE3tfyxJVP2fbfpRiHaczJeJrmM5NYB93sok6HXMLRYQj0yyHgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m0ezzI/C; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m0ezzI/C"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38F3E1C0004;
	Fri, 10 Jan 2025 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736534533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AqfChsBublPKNPqDj7oUFnFVtEI9kPgit48CypPI1M=;
	b=m0ezzI/Cm86cntiMXdthCCs0qLTrjBOeVc4By3Kn/8DA4GQYgoZJrZ9KrZIjeYIxTjVo1r
	DCoobkmIpJ5TkgU3E8UNNt6x7Q29ELbupeUspu0xQFQkflwI63RO9GvlMWRi7NM4r7jrel
	NIV/t3ig4hFr9tYd6oWmeKZfQG7CN7ApMjs5EzK6CzRAua1+Tl1nsnppOwxYiejWZxqQ0r
	Jb32CPlToo2uV40yTqsIiJAvnfukre3enyU7UsHdLEHfSP+Dc7osCUAfjsoAkUBUsbB5LG
	BxTtcZ61OzVNdLNiBHnnQgBXDof1ZpJwv3/3xLIiRNl9EDQfjVNjlrh/+9X2vA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 19:42:05 +0100
Subject: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
In-Reply-To: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com

When dumping long buffers (especially for debug purposes) it may be very
convenient to sometimes avoid spitting all the lines of the buffer if
the lines are identical. Typically on embedded devices, the console
would be wired to a UART running at 115200 bauds, which makes the dumps
very (very) slow. In this case, having a flag to avoid printing
duplicated lines is handy.

Example of a made up repetitive output:
0f 53 63 47 56 55 78 7a aa b7 8c ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff 01 2a 39 eb

Same but with the flag enabled:
0f 53 63 47 56 55 78 7a aa b7 8c ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
*
ff ff ff ff ff ff ff ff ff ff ff ff 01 2a 39 eb

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/core-api/printk-formats.rst |  4 +++-
 include/linux/printk.h                    |  1 +
 lib/hexdump.c                             | 21 +++++++++++++++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index ecccc0473da9c10f45f2464566f690472c61401e..90e6616284d1faf5882019eba8de6bebffe4883a 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -310,7 +310,9 @@ Raw buffer as a hex string
 
 For printing small buffers (up to 64 bytes long) as a hex string with a
 certain separator. For larger buffers consider using
-:c:func:`print_hex_dump`.
+:c:func:`print_hex_dump`, especially since dupplicated lines can be
+skipped automatically to reduce the overhead with the
+``DUMP_FLAG_SKIP_IDENTICAL_LINES`` flag.
 
 MAC/FDDI addresses
 ------------------
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 59e9e4c445108d66a3df422cfeaf79920e2ff08f..f89b4117483dce34d2da2f699848f16304deb942 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -755,6 +755,7 @@ enum {
 
 enum {
 	DUMP_FLAG_ASCII,
+	DUMP_FLAG_SKIP_IDENTICAL_LINES,
 };
 
 extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsize,
diff --git a/lib/hexdump.c b/lib/hexdump.c
index 4ac9c32c28a046d2ca037eaef95c785c1a866627..eaacd3f95b0442c0cebe884b26d9fc12e237eb68 100644
--- a/lib/hexdump.c
+++ b/lib/hexdump.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -239,7 +240,8 @@ EXPORT_SYMBOL(hex_dump_to_buffer);
  * @buf: data blob to dump
  * @len: number of bytes in the @buf
  * @flags: controls the output, typically %DUMP_FLAG_ASCII will print the ascii
- * equivalent after the hex output.
+ * equivalent after the hex output, %DUMP_FLAG_SKIP_IDENTICAL_LINES will display
+ * a single '*' instead of duplicated lines.
  *
  * Given a buffer of u8 data, print_hex_dump() prints a hex + ASCII dump
  * to the kernel log at the specified kernel log level, with an optional
@@ -264,8 +266,9 @@ void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
 		    const void *buf, size_t len, unsigned int flags)
 {
 	const u8 *ptr = buf;
-	int i, linelen, remaining = len;
+	int i, prev_i, linelen, remaining = len;
 	unsigned char linebuf[32 * 3 + 2 + 32 + 1];
+	bool same_line = false;
 
 	if (rowsize != 16 && rowsize != 32)
 		rowsize = 16;
@@ -274,6 +277,20 @@ void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
 		linelen = min(remaining, rowsize);
 		remaining -= rowsize;
 
+		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {
+			if (i && !memcmp(ptr + i, ptr + prev_i, linelen)) {
+				prev_i = i;
+				if (same_line)
+					continue;
+				same_line = true;
+				printk("%s*\n", level);
+				continue;
+			} else {
+				prev_i = i;
+				same_line = false;
+			}
+		}
+
 		hex_dump_to_buffer(ptr + i, linelen, rowsize, groupsize,
 				   linebuf, sizeof(linebuf),
 				   flags & DUMP_FLAG_ASCII);

-- 
2.47.0

