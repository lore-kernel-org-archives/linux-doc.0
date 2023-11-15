Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F92E849
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 833F310F;
	Wed, 15 Nov 2023 02:34:14 -0800 (PST)
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id 901211801BF;
	Wed, 15 Nov 2023 11:34:13 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: jirislaby@kernel.org
Cc: corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rdunlap@infradead.org,
	tomas.mudrunka@gmail.com
Subject: [PATCH v9] /proc/sysrq-trigger: accept multiple keys at once
Date: Wed, 15 Nov 2023 11:34:08 +0100
Message-ID: <20231115103408.193561-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <670993bf-a8ef-4561-8213-6a37d0598d83@kernel.org>
References: <670993bf-a8ef-4561-8213-6a37d0598d83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just for convenience.
This way we can do:
`echo _reisub > /proc/sysrq-trigger`
Instead of:
`for i in r e i s u b; do echo "$i" > /proc/sysrq-trigger; done;`

This can be very useful when trying to execute sysrq combo remotely
or from userspace. When sending keys in multiple separate writes,
userspace can be killed before whole combo is completed.
Therefore putting all keys in single write is more robust approach.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
V8 -> V9: Fixed english bit more
V7 -> V8: Added this list of changes
V6 -> V7: Fixed english in documentation
V5 -> V6: Documentation now has notice about undefined behavior
V4 -> V5: Added this list of changes
V3 -> V4: Bulk is now bool instead of char (and fixed typo)
V2 -> V3: Fixed code styling (and introduced typo)
V1 -> V2: Bulk mode only activated by underscore now, added docs

 Documentation/admin-guide/sysrq.rst | 11 ++++++++++-
 drivers/tty/sysrq.c                 | 18 +++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 51906e473..0042fa26b 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -75,10 +75,19 @@ On other
 	submit a patch to be included in this section.
 
 On all
-	Write a character to /proc/sysrq-trigger.  e.g.::
+	Write a single character to /proc/sysrq-trigger.
+	Only the first character is processed, the rest of string is ignored.
+	However, it is not recommended to write any extra characters
+	as the behavior is undefined and might change in the future versions.
+	E.g.::
 
 		echo t > /proc/sysrq-trigger
 
+	Alternatively, write multiple characters prepended by underscore.
+	This way, all characters will be processed. E.g.::
+
+		echo _reisub > /proc/sysrq-trigger
+
 The :kbd:`<command key>` is case sensitive.
 
 What are the 'command' keys?
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 6b4a28bcf..5411351e4 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -1150,16 +1150,28 @@ EXPORT_SYMBOL(unregister_sysrq_key);
 #ifdef CONFIG_PROC_FS
 /*
  * writing 'C' to /proc/sysrq-trigger is like sysrq-C
+ * Normally only the first character written is processed.
+ * If first character is underscore, all characters are processed.
  */
 static ssize_t write_sysrq_trigger(struct file *file, const char __user *buf,
 				   size_t count, loff_t *ppos)
 {
-	if (count) {
+	bool bulk = false;
+	size_t i;
+
+	for (i = 0; i < count; i++) {
 		char c;
 
-		if (get_user(c, buf))
+		if (get_user(c, buf + i))
 			return -EFAULT;
-		__handle_sysrq(c, false);
+
+		if (c == '_')
+			bulk = true;
+		else
+			__handle_sysrq(c, false);
+
+		if (!bulk)
+			break;
 	}
 
 	return count;
-- 
2.42.1

