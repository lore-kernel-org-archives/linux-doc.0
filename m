Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAFB1DE8B9
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 19:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169314; cv=none; b=e5jtwxG5r3YblWNKFm9p/XPwQIUb/qv0bVfxBR7F2H0422QgtcwB6YvHjdA74v42DWT5M/RXVOELEU++dU8qweY/vRiwvAqBjywSoR8EH8uZG++MDYpqXjH62qJay7d5Wvc6teQTSz+MPzmsttpeGXebfvcZksH/tnE9z1omZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169314; c=relaxed/simple;
	bh=eUA71z1hIjKNOvxnXQEls9LTBPEc6g6iX+lcrcPdObc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5JeaFd5L1KajFZVG8y8u1fcUc9eB92LFLAaKXeCPsYN13dJ3ovbQU2D/ikV5sgSBksR4wvnybzPil7BK6ZU+TIlPh7/AU4WfJaYpbMuwfGinT/uSbIEVhhZTRvYxUDpU20pZfxw3uPc/tfSJ7XtSP7t4T0BfttcLwD0O3mtvd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com; spf=none smtp.mailfrom=kutsevol.com; dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b=YUOlAv+K; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b="YUOlAv+K"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b15467f383so351293285a.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 11:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kutsevol-com.20230601.gappssmtp.com; s=20230601; t=1733169312; x=1733774112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRZpDuxb0fnCTNdiv+eYSWo0c2+YedGDoD8nLAb9AxE=;
        b=YUOlAv+KEF/YXmGMmjgNOEE/+xPznslcztZeDTWWPn+gb6PEa5rakdCv8ROHJzSQj1
         MDkNabUGqTykvfGqqtpHZdIMVFZj7lKAd6j1jD0g/sIfxx984e/hMlMuqgUlONCrV/EX
         LDTgedYClwgKT0Km4h2yl3QEiHf8gVlHjb+LMJ7rkhzvCXx+QRff9tu+cQ7yQa43ajJb
         mIk/1DGOjFRp8JZze83KkyGQw82M8EiJ8KO8oZRWrZQhjQYQSfPzBTTB8F8OAqKK+7ln
         xJ2XBkWm5oTiEnPTpzVw3UPsPasG6Q1gN6GvkIeraWUycMgQR0pjAsYLVjBfSr3Dym4n
         SAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733169312; x=1733774112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRZpDuxb0fnCTNdiv+eYSWo0c2+YedGDoD8nLAb9AxE=;
        b=t1mbF9isjvr8ngbEWUVUqDNlBrNEcmrCKJifu7xMCY7Iyft8oCHjiGYlNUnup6+LT+
         sxCUmk5LSfcZNLtRT3PMWV0flozdkgUxd5eJKlCVtcKg4/Qv39KDWfGyL/4RwXaXizUZ
         fM0h2mUACeYDR6m0lmZ5yTk+rb3eT5KVVcD/QQJ+h296F/dxcDaT70IH1XPEJpaXz1+h
         8Sxqbzz7ZLBXipiSeQMvWnjmI/w62xMj5exmwsTDH8WsU6tIjMBEj6mDPMSe/XsAE0Y7
         wULUI8w/vWAdklk5oiFVlzz9BALDOA4BYLMjsQSgxrzzPmsieRBuQBSwQ0r5zu2FoIDw
         AISQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYFLDAGnwq8a7+h02ZevmhWsphbELFbFByhJU9Ul//uwO9kPVzmmcv1v9bCoXnZlsKJsjiKCRRIo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytMkdXLzdc0ABu0DZg8zO35nm1tLGKpwRbMYGZGtB/WOiswM8a
	uV14p2qloOFharMRGgsKct2AQ9MQDFi3JP7Gp6rMXWBEH0GqpEG13Y0ahH9g4WM=
X-Gm-Gg: ASbGncsSbMTRq2ZkGh2NFggxLr7ns/bG8mxriXWs2FlpLZK0Agl1cpiBfQ8w38szIKG
	iV80JPxo9gZC5lPHfVjgeIgZpE95+ViWTuVd62qGXa2n+EQPa/IibJpzcuq5R/T21ZKnGFUoYyC
	ELvn3dHWYXiw78ZJ9/7Qz5ed9v6J3myCgwSVBlnhlKw6GWhWLhFTUygwZitlHGHGHi04aPrLMHd
	0UEhSkSORLqrDxtzGb/yr4yL/MY5b49KJMTbVKXRgo46kg17BfRpQIoq+JcD0m1fJLzcUyKMfJc
	Y64nulvKztr8GBVoZg==
X-Google-Smtp-Source: AGHT+IER+aopHzq3Qub8r1H+QKI7Szm1e1dlYhCaPMPGeY07rn7YaUg8NfWRAz5rccCycX4qtdKCmA==
X-Received: by 2002:a05:620a:4049:b0:7b6:6ee8:6c06 with SMTP id af79cd13be357-7b67c45e1b6mr4044295085a.30.1733169311894;
        Mon, 02 Dec 2024 11:55:11 -0800 (PST)
Received: from localhost.localdomain (fwdproxy-ash-112.fbsv.net. [2a03:2880:20ff:70::face:b00c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6849aac8dsm439338585a.77.2024.12.02.11.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 11:55:11 -0800 (PST)
From: Maksym Kutsevol <max@kutsevol.com>
Date: Mon, 02 Dec 2024 11:55:08 -0800
Subject: [PATCH net-next v5 2/2] netcons: Add udp send fail statistics to
 netconsole
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-netcons-add-udp-send-fail-statistics-to-netconsole-v5-2-70e82239f922@kutsevol.com>
References: <20241202-netcons-add-udp-send-fail-statistics-to-netconsole-v5-0-70e82239f922@kutsevol.com>
In-Reply-To: <20241202-netcons-add-udp-send-fail-statistics-to-netconsole-v5-0-70e82239f922@kutsevol.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Breno Leitao <leitao@debian.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Maksym Kutsevol <max@kutsevol.com>
X-Mailer: b4 0.13.0

Enhance observability of netconsole. Packet sends can fail.
Start tracking at least two failure possibilities: ENOMEM and
NET_XMIT_DROP for every target. Stats are exposed via an additional
attribute in CONFIGFS.

The exposed statistics allows easier debugging of cases when netconsole
messages were not seen by receivers, eliminating the guesswork if the
sender thinks that messages in question were sent out.

Stats are not reset on enable/disable/change remote ip/etc, they
belong to the netcons target itself.

Reported-by: Breno Leitao <leitao@debian.org>
Closes: https://lore.kernel.org/all/ZsWoUzyK5du9Ffl+@gmail.com/
Signed-off-by: Maksym Kutsevol <max@kutsevol.com>
---
 Documentation/networking/netconsole.rst |  5 +--
 drivers/net/netconsole.c                | 61 +++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index d55c2a22ec7a..94c4680fdf3e 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -124,7 +124,7 @@ To remove a target::
 
 The interface exposes these parameters of a netconsole target to userspace:
 
-	==============  =================================       ============
+	=============== =================================       ============
 	enabled		Is this target currently enabled?	(read-write)
 	extended	Extended mode enabled			(read-write)
 	release		Prepend kernel release to message	(read-write)
@@ -135,7 +135,8 @@ The interface exposes these parameters of a netconsole target to userspace:
 	remote_ip	Remote agent's IP address		(read-write)
 	local_mac	Local interface's MAC address		(read-only)
 	remote_mac	Remote agent's MAC address		(read-write)
-	==============  =================================       ============
+	transmit_errors	Number of packet send errors		(read-only)
+	=============== =================================       ============
 
 The "enabled" attribute is also used to control whether the parameters of
 a target can be updated or not -- you can modify the parameters of only
diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 4ea44a2f48f7..636a56bb04cd 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -36,6 +36,7 @@
 #include <linux/inet.h>
 #include <linux/configfs.h>
 #include <linux/etherdevice.h>
+#include <linux/u64_stats_sync.h>
 #include <linux/utsname.h>
 #include <linux/rtnetlink.h>
 
@@ -90,6 +91,12 @@ static DEFINE_MUTEX(target_cleanup_list_lock);
  */
 static struct console netconsole_ext;
 
+struct netconsole_target_stats  {
+	u64_stats_t xmit_drop_count;
+	u64_stats_t enomem_count;
+	struct u64_stats_sync syncp;
+};
+
 /**
  * struct netconsole_target - Represents a configured netconsole target.
  * @list:	Links this target into the target_list.
@@ -97,6 +104,7 @@ static struct console netconsole_ext;
  * @userdata_group:	Links to the userdata configfs hierarchy
  * @userdata_complete:	Cached, formatted string of append
  * @userdata_length:	String length of userdata_complete
+ * @stats:	Packet send stats for the target. Used for debugging.
  * @enabled:	On / off knob to enable / disable target.
  *		Visible from userspace (read-write).
  *		We maintain a strict 1:1 correspondence between this and
@@ -124,6 +132,7 @@ struct netconsole_target {
 	char userdata_complete[MAX_USERDATA_ENTRY_LENGTH * MAX_USERDATA_ITEMS];
 	size_t			userdata_length;
 #endif
+	struct netconsole_target_stats stats;
 	bool			enabled;
 	bool			extended;
 	bool			release;
@@ -262,6 +271,7 @@ static void netconsole_process_cleanups_core(void)
  *				|	remote_ip
  *				|	local_mac
  *				|	remote_mac
+ *				|	transmit_errors
  *				|	userdata/
  *				|		<key>/
  *				|			value
@@ -371,6 +381,21 @@ static ssize_t remote_mac_show(struct config_item *item, char *buf)
 	return sysfs_emit(buf, "%pM\n", to_target(item)->np.remote_mac);
 }
 
+static ssize_t transmit_errors_show(struct config_item *item, char *buf)
+{
+	struct netconsole_target *nt = to_target(item);
+	u64 xmit_drop_count, enomem_count;
+	unsigned int start;
+
+	do {
+		start = u64_stats_fetch_begin(&nt->stats.syncp);
+		xmit_drop_count = u64_stats_read(&nt->stats.xmit_drop_count);
+		enomem_count = u64_stats_read(&nt->stats.enomem_count);
+	} while (u64_stats_fetch_retry(&nt->stats.syncp, start));
+
+	return sysfs_emit(buf, "%llu\n", xmit_drop_count + enomem_count);
+}
+
 /*
  * This one is special -- targets created through the configfs interface
  * are not enabled (and the corresponding netpoll activated) by default.
@@ -842,6 +867,7 @@ CONFIGFS_ATTR(, remote_ip);
 CONFIGFS_ATTR_RO(, local_mac);
 CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
+CONFIGFS_ATTR_RO(, transmit_errors);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -854,6 +880,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_remote_ip,
 	&attr_local_mac,
 	&attr_remote_mac,
+	&attr_transmit_errors,
 	NULL,
 };
 
@@ -1058,6 +1085,34 @@ static struct notifier_block netconsole_netdev_notifier = {
 	.notifier_call  = netconsole_netdev_event,
 };
 
+/**
+ * send_udp - Wrapper for netpoll_send_udp that counts errors
+ * @nt: target to send message to
+ * @msg: message to send
+ * @len: length of message
+ *
+ * Calls netpoll_send_udp and classifies the return value. If an error
+ * occurred it increments statistics in nt->stats accordingly.
+ * Only calls netpoll_send_udp if CONFIG_NETCONSOLE_DYNAMIC is disabled.
+ */
+static void send_udp(struct netconsole_target *nt,
+					const char *msg, int len)
+{
+	int result = netpoll_send_udp(&nt->np, msg, len);
+
+	if (IS_ENABLED(CONFIG_NETCONSOLE_DYNAMIC)) {
+		if (result == NET_XMIT_DROP) {
+			u64_stats_update_begin(&nt->stats.syncp);
+			u64_stats_inc(&nt->stats.xmit_drop_count);
+			u64_stats_update_end(&nt->stats.syncp);
+		} else if (result == -ENOMEM) {
+			u64_stats_update_begin(&nt->stats.syncp);
+			u64_stats_inc(&nt->stats.enomem_count);
+			u64_stats_update_end(&nt->stats.syncp);
+		}
+	}
+}
+
 static void send_msg_no_fragmentation(struct netconsole_target *nt,
 				      const char *msg,
 				      int msg_len,
@@ -1085,7 +1140,7 @@ static void send_msg_no_fragmentation(struct netconsole_target *nt,
 				     MAX_PRINT_CHUNK - msg_len,
 				     "%s", userdata);
 
-	netpoll_send_udp(&nt->np, buf, msg_len);
+	send_udp(nt, buf, msg_len);
 }
 
 static void append_release(char *buf)
@@ -1178,7 +1233,7 @@ static void send_fragmented_body(struct netconsole_target *nt, char *buf,
 			this_offset += this_chunk;
 		}
 
-		netpoll_send_udp(&nt->np, buf, this_header + this_offset);
+		send_udp(nt, buf, this_header + this_offset);
 		offset += this_offset;
 	}
 }
@@ -1288,7 +1343,7 @@ static void write_msg(struct console *con, const char *msg, unsigned int len)
 			tmp = msg;
 			for (left = len; left;) {
 				frag = min(left, MAX_PRINT_CHUNK);
-				netpoll_send_udp(&nt->np, tmp, frag);
+				send_udp(nt, tmp, frag);
 				tmp += frag;
 				left -= frag;
 			}

-- 
2.43.5

