Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677995;
	b=QFesF0MrY3/tHLzO1vIk5CUQbvQWMdrv3GRYps49/6Hx9e3MmSix+RAVYynT3EsCwHRd
	 oIAt7AKyoeMnFcpg++gUvBdZlRyjl1+GUlhQjMcPsjW5ZUBBq/1hB7A2EpKVqAVCTeZZ5
	 dRODwT+GFoQZz/7hsJ5ooBxg7N18egI47ZkLOHF+5Aq/ApyyO7yrIeONnXSeDivRtA/2p
	 et+yNisexbPXVyUGCjcO+c84hjPZZsP41ewq8ls71X5mJ2oundVUEamLEpZNocGxIZGUu
	 aCEW0EKD9E7tysVp6VqaijATR1aAuNsh/xA740+MtBA3LAxiydNMrr7CoZzd+fCArZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
	b=eHtt97tbG1Nu42XWFDlOXmIal/t6wTS8wLzYJX6pNIOI52oxxypMt/+L/t8D3alIQ8e4
	 7cmAk0k8v9djA/4Qa0mWYX74ZqnznUVkoCD8e39DHUjINXR4wObKkz24n4R3lX8qUmAPX
	 YdBlUNVVaeEYnki3QT9ke+wFhkVfNyTGq03y18PkvBvJ4hchcQ9seXjnfdph3+dUsq4OI
	 z6Y6cqOaI7SK/tmbvVsG5MI6Sp11N12D1FNkxhKf3ZlMudTihQfG1y5AJt9mRkWk/UzCy
	 5BNAo6/QrV9aNQJRJVeCWFOL9VCQBfkxxW3P0QcQQeuiCPgPv/UNRLzx1ZPNJLZCbEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6drsopL;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB6606A88B
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEB6606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6drsopL
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b3a332105bso18939407b3.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677994; x=1795282794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
        b=k6drsopLEdEuqFlLxE/NDeKDCYT530WfFE/TrzGfkN4YICfl1q/noav/2UgzS/a1TL
         XAvCon6wHJfct4UGuRE0fdGIEwC6LlOrLsEiTaVvg5m8VOfBK49AOT4SHwKRQB2MYhKw
         lU4Hxa1dwR7wsLscuK/eqGZN2QbHRyQkx0jzY8ENcykrWXHxpIqz9NinggpEmDVQXkO2
         mjb3NhC9TlCC2GgWjuxPtI17JlvBrIaZYb/LEyWjbhpsCa0Cyc8fCnjZo4aNe/Z3JL89
         AH8GVtQOnYieC/xYl97G0tv3ZbqCHmZvs4erUtv7UVW8GwzvTkCuL6ktH6LczGZTUmeH
         YpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677994; x=1795282794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
        b=aQld7tMZ8QWYa5F5LK6nLERUnQxF5no4kuSa2XI/TBc7YvIsGlxAqF3CyH/M50cik6
         FFexw7BJDgPozQEnPylhSdps8qkwbPbFBkCr0E9My1y14NGOeVsANqCFtk7Z0/YnF+ZM
         991gss/33pmM18Kc4OZwh0T5elWvE19rVnafHy19OFIFSp7VxHuZTxQDL/jSA27fHE1b
         umLtk2r/G37krZVqYDiI6K9mrzbz4LwkmhC61CyOLcJjCz96SxCTH6naF07qw2DT3ihe
         zqaot8K9fRcBUpQ1dIQ5mHemnQeNkFnVi6mmjxEFmQxE1Ai7EWS61ziaFJMtH438cXiy
         +gpg==
X-Forwarded-Encrypted: i=1; AL+hErFli2Y9jAc6x/qP81NeDF9XUVt76EhgNFslWM35tWLJKNYdXEaF0RmUvzB4FAkbrdAOZfUNh/flgSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hqlo25ox6zKED9pCbAAF5lausk8oQuuNprdT4wxY7JNCad3hv
	hNWXZJBkHr7pSe0ELIuc1aj9rdexyamOrg32tnOeTOT6u27sZq8rLWiB
X-Gm-Gg: AYBFou07+4fPkDv2SGlDr5Qz3EmyqmpNnxKNjQNDJgM/LuZ+IF/mhU4kP/JkcXjC8TK
	BBAauJY3WI/gAFevaq1zGb3E+05QT7VfGowJjUIBaJKxiFSvX+gbVEwrwrVjCjmXF3/obmvFWMK
	1suBugB9F8ZhnXka+w+u/JvlPCVEr1b2MUaC7wFK6MjJtivc3RUAGBIm8Gcj8msoFpr94ZXTIzL
	FNG5vTBkCsxIuQI03rFyXNZwXzKNZvrlCfVBu8D1+/omELQc6+yhyhDarYnvlBJmyPhcMnEybRD
	RqBiLc49EKSe1fo1P+sDlzNWJxXfPGgdcG9r7YBTS7x7/ErIngXykttXKa/5xWAXq/MmVT8ip0x
	GcihcMXBNrySuCluv33mRXTmgyf2269tBBDQwxulYG9OHeykawR/6X5bHI6BFOQ6nd+sHV4lAsk
	T2aaQYJxGbLq7jh7pFlfrbJtS52uTAMHelvQbnUZGrSOKStinSUKRL0tIiw7LRfM1+l21g5/3O7
	3nxYGsw5m7BDmzvmIkbapsBn1kN25hruO7UQU92UEyV/eHga9zxM4WT/Arb99yzXNqjPSWB+oNA
	q3RaXDoZZZlzCUQME5zE6bDRv+sMMM7eyhbksZXxgHQZeZLPYeq65K1MTA8H1ZGxd5gwCCBL0Y/
	Z4NWReLt3VKOJN1RaTlSaKdQ1w4FCTYcHuUXAERCFVX7Om8wB7QnhE9afXM+Z7w==
X-Received: by 2002:a05:690c:a849:20b0:8b1:533a:e19 with SMTP id 00721157ae682-8b3bb296857mr39010357b3.35.1794677993918;
        Sat, 14 Nov 2026 09:39:53 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm48215087b3.37.2026.11.14.09.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:53 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:48 -0500
Subject: [PATCH 2/7] alpha: marvel: fix the environmental subpacket layout
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-marvel-env-v1-2-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=N8IGXtCKffK0ze/UfS7rq8ZxTgXFnR2UM7OuuHAxgNc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnMO0fTV7Tg3uYDE1etXm9/0dCQsU3I3oJTredV1
 K3HN276dnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1Pd8ZGQ6f+qzE0q
 /NOMEo6/kbc8u7YW+WnlAyb/ctWiYt77PiRggjQ6eXzfr39xS4NyvbyV6fVXd+uauzB/eK2zXB4
 SuNbmxPZAMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

struct ev7_pal_environmental_subpacket does not match what the MBM and
CMM firmware (V2.7) put in system event frames, which is:

  +0   cabinet
  +2   drawer
  +8   PE (the power and environment node holding the sensor)
  +10  sensor index
  +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed

So the byte printed as "Condition" was half of the sensor index, and the
state was never printed. Use the firmware's layout and print the state
along with the sensor's key. This matches the frames in the error log of
an ES47.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
 arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/err_ev7.h
index ab17e6333764..5d30af0221fb 100644
--- a/arch/alpha/include/asm/err_ev7.h
+++ b/arch/alpha/include/asm/err_ev7.h
@@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
  *	   class PAL (14), type POWER_SUPPLY (14)
  *	   class PAL (14), type LAN (15)
  *	   class PAL (14), type HOT_PLUG (16)
+ *
+ * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packet.
  */
 struct ev7_pal_environmental_subpacket {
 	u16 cabinet;
 	u16 drawer;
 	u16 reserved1[2];
-	u8 module_type;
-	u8 unit_id;		/* unit reporting condition */
-	u8 reserved2;
-	u8 condition;		/* condition reported       */
+	u16 pe;
+	u16 sensor;
+	u16 reserved2;
+	u16 state;		/* EV7_ENV_STATE_* */
 };
 
+#define EV7_ENV_STATE_OK	0
+#define EV7_ENV_STATE_WARNING	1
+#define EV7_ENV_STATE_FAULT	2
+#define EV7_ENV_STATE_UNKNOWN	0xfffe
+#define EV7_ENV_STATE_REMOVED	0xffff
+
 /*
  * Convert environmental type to index
  */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 832567a3ccbb..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,6 +21,19 @@
 #include "err_impl.h"
 #include "proto.h"
 
+static const char *
+marvel_env_state(u16 state)
+{
+	switch (state) {
+	case EV7_ENV_STATE_OK:		return "ok";
+	case EV7_ENV_STATE_WARNING:	return "warning";
+	case EV7_ENV_STATE_FAULT:	return "fault";
+	case EV7_ENV_STATE_UNKNOWN:	return "unknown";
+	case EV7_ENV_STATE_REMOVED:	return "removed";
+	default:			return "unrecognized";
+	}
+}
+
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
@@ -49,17 +62,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		if (!env)
 			continue;
 
-		printk("%s**%s event (cabinet %d, drawer %d)\n",
-		       err_print_prefix,
-		       ev_packets[i].name,
-		       env->cabinet,
-		       env->drawer);
-		printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
-		       "Condition 0x%x\n",
-		       err_print_prefix,
-		       env->module_type,
-		       env->unit_id,
-		       env->condition);
+		printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %u, state %#x)\n",
+		       err_print_prefix, ev_packets[i].name,
+		       marvel_env_state(env->state), env->cabinet,
+		       env->drawer, env->pe, env->sensor, env->state);
 	}
 }
 

-- 
2.56.1

