Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03020385D69
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851653; cv=none; b=CDvlxAreWN84h8rmpIUa3PVC3PAMClNDxMWpHYQI3NrIqN/XEb1krTgNYkONjdUzn89I+22aAsgJVYLdgFRE2a/dR5qqtpYa4Q2eakBuiogvNuwlGWJbudFAKTaCFejq4AV0xOqw889WVhKK78eRNpn+yEeBpQE1NJpghN+3Xbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851653; c=relaxed/simple;
	bh=oSSXLP7Jw1rIzHEsyC+huk83PWweBjE2sp/igTikZ4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HDlxWSUQ/ED23Rgc55wkYfFeGke6AG9HJx4gglqh6sFsdO6ZqAGt9VOESEho/j3+CcCr3wEWdmCJAdvKfeJXCk4qaubn8VROri2akFMXnlx0s3cdUBuU8kwJNfI+pTZS9tvZsyGD36BgWoWjHwa57vQMhBEUBm0K0sCVuF9KhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=W5Wqb2sg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="W5Wqb2sg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47db714766aso1576374f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851649; x=1784456449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QsBZuNbKBWzgjiOqQ12i1N0POi8kQELijizTKDd75sE=;
        b=W5Wqb2sgtgLBnBS/+dI+opPyuOIa1eU/sIl7qbLAiJZE5hdie7W12+o+pZ3IjZbvka
         SSPnjx9fDGrV2oVkY8eb1HxZKsoz910zrFpTzl7GT0+wBSa2p0bLOFRzYtXJhpw3SB/s
         OJw3B28Klf5Us2tVpssOGfX2KJ9Vi5eLTdJEugLTZbs4smBomsRdvDwcBjFjW61M5scC
         2Q+rSEfFBxjogRh/SbsNLJPUmb329fZiCKh2ykGWS6wShGHt5lQMDVse7ztB0GRo37IB
         18GIgnQf07ixcgsB3gwc5DTF9uIkblcu0+hO52ZqdCJX3BMbEj9bKtI/2W/KMfKKzIuN
         OmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851649; x=1784456449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsBZuNbKBWzgjiOqQ12i1N0POi8kQELijizTKDd75sE=;
        b=OUd8cL7IbfzUV7yDVuSlwPS76NYZsXo3dd4tVdBbblwJjzRO97fNYJWcKXefvFJeb5
         drIoKJN27TRZ66UIRxXDWXIgEZTWFbevj/0yU6WhbIe6iRO/oursntswwhz/jmDXE0sW
         KQhLV1+tC0FBkFPlGVywBYzwytnh0nOqx8LLHbnFvOIui1mhfEgWq01lCkP4LJKvaRxi
         kt0s7QmccoU0OUhm6fw+MQwbwSdjyDt/sjcI4twIf8cJeeBTgMGdvxk38LX5uhYPzhZ3
         HtpdecjHlzj/J4aErK7jq6BvKNGRo1QDSi3KKVfl4LD6EVDYJ+cn5B3GYR82HbqWkeCf
         4jEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7z3HARgwrJVYZNw+JefagF9la7Hobi0+hDgXi/MS603/p9oA3LN6ubD0NtilvtBRVklyUnQQFjTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIw5Jw0Zt81sbDcIS404lIjUYlQJOT/S5SnoflfctKuPQZ0A63
	3Tyk4xgu+Sh3tR+Ms25hTiFZ8+0knDdFh6vqVzNG8FhuJlgmMXyKzDJfWTCVQtpxwOI=
X-Gm-Gg: AfdE7ckxPKLnOk57otBjR/wOBeDQb1AXJS35kYBMFLLAognzOF6tzSEujA9BViLUKFD
	FpF7cXS0oeS6hVxTa8j5wMHss0bqxnLbGuZapJ1aryXCXVciwxqmDO7psryN73+RhRHwkSOk9wz
	ETF80Zg3nZeCFWcc22GpsadxNH3QdvPtDrA5AJgV5nZk+yqFIzPoW63lV3xGzMSYCtqTz1QioDo
	QBTAUoFNveEPNWfSNeJgtU4OBz/RrDLK/nqYvXjbn9hrxYleNJvyaaIQh6pdd4PYWVCpd9CylMA
	6txLvm4ZBfGWE4Rv5ydJm4bnubyl23RxqU6wErXAxfJvOCFUBKOLD41PdIPr+FBCpI6EZjIDLEu
	yBKuCHekk1/Ka+RJcWmHPETUj8TKXbh8X+7dBaZNV4MLsrGdqAqEtjZmoDJxA94Q12Z0Rd6vUtm
	1R8ehgD6IhqM6T1EDJE652MWmojMLDoI8BYZ26aFZW/Af9ZFkAcaJKic/q3FYk4JVnrmoM3hs78
	Yea/GPU/q7Bq0T73mAaVw+9oFpy
X-Received: by 2002:a05:6000:4713:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47f2dc863cdmr5646096f8f.11.1783851649453;
        Sun, 12 Jul 2026 03:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:48 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:32 +0100
Subject: [PATCH v3 1/6] printk: sysctl: use unsigned int for printk_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-1-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
In-Reply-To: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851646; l=2135;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=oSSXLP7Jw1rIzHEsyC+huk83PWweBjE2sp/igTikZ4M=;
 b=x8nBiQHIvIKnAVgonaWo+uUY7v5twNS6bzsYUhVo0lss1zOJ5+lit0Q0af5u1hiyoIPREE9jR
 atWY6ieG3qeCEcg54Bgrfwiek8JNG5zWx6/EqttQlWhO1E78dykv/4H
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

As the printk_delay sysctl represents a duration in milliseconds,
let's set its type to be unsigned int.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 include/linux/printk.h | 2 +-
 kernel/printk/printk.c | 4 ++--
 kernel/printk/sysctl.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd411f2238b45374e8a71222f0407c..ea52dc72b73b64898f82a0319b01c27323b18dee 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -188,7 +188,7 @@ extern int __printk_ratelimit(const char *func);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
 
-extern int printk_delay_msec;
+extern unsigned int printk_delay_msec;
 extern int dmesg_restrict;
 
 extern void wake_up_klogd(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a41e7df10c29939a2abb55462859..31aabdf8248cc39c54ee11685d4a37deac1c174c 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2117,14 +2117,14 @@ static u8 *__printk_recursion_counter(void)
 		local_irq_restore(flags);		\
 	} while (0)
 
-int printk_delay_msec __read_mostly;
+unsigned int printk_delay_msec __read_mostly;
 
 static inline void printk_delay(int level)
 {
 	boot_delay_msec(level);
 
 	if (unlikely(printk_delay_msec)) {
-		int m = printk_delay_msec;
+		unsigned int m = printk_delay_msec;
 
 		while (m--) {
 			mdelay(1);
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index f15732e93c2e9c0865c42e4af9cb6458d4402c0a..56c3db63b3f8c6c5fddc4e4de1f41c6102f0f4b1 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -44,9 +44,9 @@ static const struct ctl_table printk_sysctls[] = {
 	{
 		.procname	= "printk_delay",
 		.data		= &printk_delay_msec,
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(unsigned int),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
+		.proc_handler	= proc_douintvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= (void *)&ten_thousand,
 	},

-- 
2.34.1

