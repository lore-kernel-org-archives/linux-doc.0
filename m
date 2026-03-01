Received: from a4i608.smtp2go.com (a4i608.smtp2go.com [158.120.82.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1D3112D0
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772402603; cv=none; b=gOMczESy9DGyk1LUFeUrxj0odY6rsWOLOS80Y346OJAvegG/XVF1ge+kIgMbUO12mrzOboBytHcjiiqAQBaAVQnRCMKmvfEAPzoNohyW0DgfZ6glDNeI1oDA3ytXcy5YszoNCOuvkeFo7+eq+97PiSS2sws1ifOb04DJUZNw0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772402603; c=relaxed/simple;
	bh=uz3gVg2kenPxXQ5TOLYHf84TzeLVgm6XmFUsx8miI64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWYlfinZKJViYHWdXRT3il1hrLxYSJdM8Y4celRbDV05F2MyluvlOnYFP/qfihSt2eD3mAmtq7xFQZp0QDW35cbqSc09+glxBjK2oyoiGYRZdWj53IKDmCKtsKerKEUnPao2+MuXd66CK4mNcIvKKVJL3OzVdEkpYvy/y+Aqg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=php.net; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=tavjIHvf; arc=none smtp.client-ip=158.120.82.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=php.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="tavjIHvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1772401694; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=1BVveRRLNCSPeHsZ8boBCy9xkRHhDKXcLowJaV0eSnc=;
 b=tavjIHvfXpal2FWqE37mZ7N6E06IwFPtqZ8ve4DT4sVtYzli+t0XKN2HCzLnPdlcEt4W+
 +Y+gYduj+cCKDE1oAirtRh7IHAufo43Sk5j11TCQzkanec/O1oJBeNHoDYBav9nqegIUUFS
 hYEHfd4id3nUovsl5KPsZMdZgUpzEup/sznmf2D6wJIRAHz0UOEmnuVMqdfbVQC5mz6HANi
 Oh5BwwfWwa9taPsqPnlAIfNDLYWRvBvZiaZjHAbPEue1hfZxN2y11VM5Q2UnHput8WY3FGB
 ol2MPk1g2TVbZprLYrf4ptAObSPvORicitvrafhip5Vxlw6X2Z7RwGbKKLsA==
Received: from [10.90.244.30] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.1-S2G)
	(envelope-from <as@php.net>)
	id 1vwoe1-FnQW0hQ0zBs-0pbc;
	Sun, 01 Mar 2026 21:48:09 +0000
From: Adam Saponara <as@php.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Adam Saponara <as@php.net>
Subject: [PATCH] vt: Add boot param for setting default vt console
Date: Sun,  1 Mar 2026 16:48:04 -0500
Message-ID: <20260301214804.283484-1-as@php.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 852842m:852842aGMEEIJ:852842snSm7HADLo
X-smtpcorp-track: woNXE5TtkdeW.jo837jczPaOs.3yyRTwzc97s

Presently the default console is hard-coded to vt1.

The param allows for setting a different default. The param defaults to 0
(vt1), preserving the current behavior. It is clamped by the constants
`(MIN|MAX)_NR_CONSOLES`. If set `>= MIN`, `con_init` will initialize that
vt as well (a couple extra kilobytes heap for the `vc_data` and
`vc_screenbuf` structs).

Without this feature, users achieve the same effect with an init
script[0][1][2][3]. This works but requires an extra `chvt(1)` which can
race with user interaction and flicker the screen at login.

[0]: https://bbs.archlinux.org/viewtopic.php?id=232058
[1]: https://unix.stackexchange.com/questions/399986
[2]: https://github.com/systemd/systemd/issues/7247
[3]: https://www.linuxquestions.org/questions/linux-general-1/x-4175722418

Signed-off-by: Adam Saponara <as@php.net>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/tty/vt/vt.c                           | 44 +++++++++++++------
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..6694b2edcfd6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8429,6 +8429,11 @@ Kernel parameters
 			overridden by individual drivers. 0 will hide
 			cursors, 1 will display them.
 
+	vt.default_console=
+			[VT]
+			Set default console; 0-62.
+			Default: 0 (vt1)
+
 	vt.italic=	[VT] Default color for italic text; 0-15.
 			Default: 2 = green.
 
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index c1f152d8b03b..e566942c380f 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -140,6 +140,7 @@ EXPORT_SYMBOL(vc_cons);
 static const struct consw *con_driver_map[MAX_NR_CONSOLES];
 
 static int con_open(struct tty_struct *, struct file *);
+static void con_init_vc(int console_idx);
 static void vc_init(struct vc_data *vc, int do_clear);
 static void gotoxy(struct vc_data *vc, int new_x, int new_y);
 static void restore_cur(struct vc_data *vc);
@@ -159,10 +160,14 @@ static void unblank_screen(void);
 
 int default_utf8 = true;
 module_param(default_utf8, int, S_IRUGO | S_IWUSR);
+
 int global_cursor_default = -1;
 module_param(global_cursor_default, int, S_IRUGO | S_IWUSR);
 EXPORT_SYMBOL(global_cursor_default);
 
+int default_console;
+module_param(default_console, int, S_IRUGO | S_IWUSR);
+
 static int cur_default = CUR_UNDERLINE;
 module_param(cur_default, int, S_IRUGO | S_IWUSR);
 
@@ -3742,7 +3747,7 @@ static int __init con_init(void)
 {
 	const char *display_desc = NULL;
 	struct vc_data *vc;
-	unsigned int currcons = 0, i;
+	unsigned int i, di;
 
 	console_lock();
 
@@ -3776,18 +3781,18 @@ static int __init con_init(void)
 		mod_timer(&console_timer, jiffies + (blankinterval * HZ));
 	}
 
-	for (currcons = 0; currcons < MIN_NR_CONSOLES; currcons++) {
-		vc_cons[currcons].d = vc = kzalloc_obj(struct vc_data,
-						       GFP_NOWAIT);
-		INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
-		tty_port_init(&vc->port);
-		visual_init(vc, currcons, true);
-		/* Assuming vc->vc_{cols,rows,screenbuf_size} are sane here. */
-		vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_NOWAIT);
-		vc_init(vc, currcons || !vc->vc_sw->con_save_screen);
-	}
-	currcons = fg_console = 0;
-	master_display_fg = vc = vc_cons[currcons].d;
+	for (i = 0; i < MIN_NR_CONSOLES; i++)
+		con_init_vc(i);
+
+	/* Init default_console if we didn't already do that above */
+	di = clamp(default_console, 0, MAX_NR_CONSOLES - 1);
+	if (di >= MIN_NR_CONSOLES)
+		con_init_vc(di);
+
+	fg_console = di;
+
+	vc = vc_cons[fg_console].d;
+	master_display_fg = vc;
 	set_origin(vc);
 	save_screen(vc);
 	gotoxy(vc, vc->state.x, vc->state.y);
@@ -3806,6 +3811,19 @@ static int __init con_init(void)
 }
 console_initcall(con_init);
 
+static void con_init_vc(int console_idx)
+{
+	struct vc_data *vc = kzalloc_obj(struct vc_data, GFP_NOWAIT);
+
+	vc_cons[console_idx].d = vc;
+	INIT_WORK(&vc_cons[console_idx].SAK_work, vc_SAK);
+	tty_port_init(&vc->port);
+	visual_init(vc, console_idx, true);
+	/* Assuming vc->vc_{cols,rows,screenbuf_size} are sane here. */
+	vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_NOWAIT);
+	vc_init(vc, console_idx || !vc->vc_sw->con_save_screen);
+}
+
 static const struct tty_operations con_ops = {
 	.install = con_install,
 	.open = con_open,
-- 
2.51.0

