Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A84307A5;
	Fri, 10 Jul 2026 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694775; cv=none; b=oIkv3hZ9SOniI0PKWWuHnta96sy5PjbRNaDFTwcsqh3PaU2WjsSIeAbE1VzN10gbQgt8mq0xj+jUvlRAgPr9K6THktxiLZ+DsSKB9zLtr2D4KWerh0Q8ekSMEBp/Nkg+V9kMKsI8xqA0260qHRtJoGI5y1B0FVuIBHp52GrNUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694775; c=relaxed/simple;
	bh=kEQKlJmnmxHwtUEVUAQjNgl2GEcYxNL62chrngmDfIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKiBSAztveams/vlDBrVMDwTWQKau/HiopIv63IGoqYwr2YZctL/7TWwGLWIPF8t1TxSdAk2PNwTnJigjdD+W6k0uemKgwROU1v6hPfAMg89X3XvHsWS7cv7GoAXCliPmbJGyOb+ousIffX4iWbnCT6v63C9Swtm20HZh2OXUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hsCNNOfv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ep92m/Ox; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hsCNNOfv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ep92m/Ox"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783694772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucqPL5/NRLTNYGQ3Jt4vipNd/bWEl2WnKfYE8oGbXT0=;
	b=hsCNNOfvJYjB6u+5IXMASE6OEygd/j4q4rKGyEto+WNxZ+tbWoduPkn1aB8k62+7ieQ59p
	qKsHQB6Aao6mQfqNgxIo9Iw/s4mbqGKBMl1VgVEWT2tAAeLENZqoJiD39UFDGzjA2TVMd1
	YwQoDEVsfiVTZ6sfubi3uhxpYGMFfV6sbqw3UizPdJMG0dTuyz9DDGyKsnWaO0kB0lrIf1
	j5M03xnFK9PrNSnn9QB/uroGqvqK6Lo/AK1E5a9QDsblvVMra1wILwRFUnlEh7AX1AshMw
	lFqa2FHSjLofWOvaapVKIbTVM8vpG0f/V7PitwpPgPgicBRUewP3X4fmtpqApQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783694772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucqPL5/NRLTNYGQ3Jt4vipNd/bWEl2WnKfYE8oGbXT0=;
	b=ep92m/OxaJ68AAXEoQWxbOC+EtB2EM2Ri86JnOIy9BSNx2prRr4mXVSvFtzberE1QECxN6
	lEHu6I+d8TeRztBA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Chris Down <chris@chrisdown.name>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH printk 3/3] printk: Support setting console sync mode via console=
Date: Fri, 10 Jul 2026 16:51:53 +0206
Message-ID: <20260710144609.194487-4-john.ogness@linutronix.de>
In-Reply-To: <20260710144609.194487-1-john.ogness@linutronix.de>
References: <20260710144609.194487-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the console= kernel command line argument to support specifying
sync mode at boot time. This is achieved by introducing a new "sync"
option that can be passed within a console= cmdline argument.

For example, assuming the first serial device should be a console using
sync mode:

   console=ttyS0,115200,sync

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Co-authored-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/serial-console.rst |  8 ++
 kernel/printk/console_cmdline.h              |  1 +
 kernel/printk/printk.c                       | 79 ++++++++++++++++++++
 3 files changed, 88 insertions(+)

diff --git a/Documentation/admin-guide/serial-console.rst b/Documentation/admin-guide/serial-console.rst
index 1609e7479249f..37cbd9581c53a 100644
--- a/Documentation/admin-guide/serial-console.rst
+++ b/Documentation/admin-guide/serial-console.rst
@@ -32,6 +32,14 @@ The format of this option is::
 			and F is flow control ('r' for RTS). Default is
 			9600n8. The maximum baudrate is 115200.
 
+			One can also specify extra options (comma-separated)
+			to modify console printing behavior. The "sync" extra
+			option will cause console printing on that console to
+			be synchronous (printed in the context of the printk()
+			caller). This could cause adverse timing side-effects
+			for the system, but can be useful in certain debugging
+			scenarios.
+
 You can specify multiple console= options on the kernel command line.
 
 The behavior is well defined when each device type is mentioned only once.
diff --git a/kernel/printk/console_cmdline.h b/kernel/printk/console_cmdline.h
index 0ab573b6d4dc2..ce4709f7a1b0c 100644
--- a/kernel/printk/console_cmdline.h
+++ b/kernel/printk/console_cmdline.h
@@ -8,6 +8,7 @@ struct console_cmdline
 	int	index;				/* Minor dev. to use	    */
 	char	devname[32];			/* DEVNAME:0.0 style device name */
 	bool	user_specified;			/* Specified by command line vs. platform */
+	bool	sync;				/* Print in sync mode	    */
 	char	*options;			/* Options for the driver   */
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 	char	*brl_options;			/* Options for braille driver */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e82e864a4d672..e53ac5554e5eb 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2567,6 +2567,81 @@ static void set_user_specified(struct console_cmdline *c, bool user_specified)
 	console_set_on_cmdline = 1;
 }
 
+/**
+ * find_and_remove_console_option - Find and remove a named option from console options string
+ * @options: The console options string (will be modified in-place)
+ * @key: The option name to find (e.g., "loglevel")
+ * @val_buf: Buffer to store the option value (if present)
+ * @val_buf_size: Size of @val_buf
+ *
+ * This function searches for a named option in a comma-separated options string
+ * (e.g., "9600n8,loglevel:3,sync"). If found, it extracts the value
+ * (the part after ':') and removes the entire option from the string.
+ *
+ * If an option does not support values, @val_buf should be NULL, in which
+ * case no value part is extracted and any user provided ':' is considered part
+ * of the option key.
+ *
+ * The function modifies @options in-place by:
+ * 1. Temporarily null-terminating option names and values during parsing
+ * 2. Restoring separators if the option isn't found
+ * 3. Removing the found option by shifting the remaining string
+ *
+ * Return: true if the option was found and removed, false otherwise
+ */
+static bool find_and_remove_console_option(char *options, const char *key,
+					   char *val_buf, size_t val_buf_size)
+{
+	bool found = false, first = true;
+	char *option, *next = options;
+
+	while ((option = strsep(&next, ","))) {
+		char *value = NULL;
+
+		if (val_buf) {
+			value = strchr(option, ':');
+			if (value)
+				*(value++) = '\0';
+		}
+
+		if (strcmp(option, key) == 0) {
+			found = true;
+			if (value) {
+				if (strlen(value) >= val_buf_size) {
+					pr_warn("Cannot copy console option value for %s:%s: not enough space (%zu)\n",
+						option, value, val_buf_size);
+					found = false;
+				} else {
+					strscpy(val_buf, value, val_buf_size);
+				}
+			} else if (val_buf) {
+				*val_buf = '\0';
+			}
+		}
+
+		if (found)
+			break;
+
+		if (next)
+			*(next - 1) = ',';
+		if (value)
+			*(value - 1) = ':';
+
+		first = false;
+	}
+
+	if (found) {
+		if (next)
+			memmove(option, next, strlen(next) + 1);
+		else if (first)
+			*option = '\0';
+		else
+			*--option = '\0';
+	}
+
+	return found;
+}
+
 static int __add_preferred_console(const char *name, const short idx,
 				   const char *devname, char *options,
 				   char *brl_options, bool user_specified)
@@ -2609,6 +2684,7 @@ static int __add_preferred_console(const char *name, const short idx,
 		strscpy(c->name, name);
 	if (devname)
 		strscpy(c->devname, devname);
+	c->sync = find_and_remove_console_option(options, "sync", NULL, 0);
 	c->options = options;
 	set_user_specified(c, user_specified);
 	braille_set_options(c, brl_options);
@@ -3932,6 +4008,9 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (_braille_register_console(newcon, c))
 				return 0;
 
+			if (c->sync)
+				newcon->flags |= CON_SYNC;
+
 			err = console_call_setup(newcon, c->options);
 			if (err)
 				return err;
-- 
2.47.3

