Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884361;
	b=yXjVCKg7Z6l69Xgf6ewzP2Lk25fX3JpWN7NHcoYoIIhPTemFjE6a62qlJDWjul+Xc8s2
	 QlHZfiPy5lvbyjKnrYHUx7GgM1nFFaxr1hRSs0Ophf4iybUdMK2mSZQSKjE9gypMejO2f
	 xjsMum1ID6yKBVCG+h4F8i461PAXdHdXHhuV6UonSASm+yxoWRpCRGnsKrQ0nk2MyixPz
	 rtiG7xG4Fag1H6+ACY9Ipe45sdKoTQFGyEbLgEVI/e95j3Nft8ECfWSw4PED966hTtBIZ
	 tZF/usD4t+joHpp/rpTuB0gqDpxK0dRAXJzKjHGlk3n3+6T/8wQ8K1b5EE++gMDhe3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
	b=UEH6IgaF3tUyXQAnDB5d8mIQy33TisUNFSDSpMy1zvZOrXa59qJHW5ul10hzRK4B9b7p
	 g/6Hts4texJnQmCW3Yr1AFOv4bFO06uLXQpNGbZ5cX2dZRMXp/U5E//YLuMr7TSwo2y8B
	 ZMwHsqMKJoB1C05VdXm4KXF5dXk1/qFXw4EAiowlfVQYkLbYwW9w/F6e0d6P96fUnfyiw
	 nL/fbFPcm2+0onOshmWoxe4BynvIPV/ffHyckrmajAmQ2MMaIt7QEM7qYfh+4EzK09Vjd
	 /r5em18pLZHlOc5WQdFzcV6mWxPojjOv/O4muwLK13UwQxYzJTjufclKNqhMmBMZFPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF3ZIRbU;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A2606A89D
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616A2606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF3ZIRbU
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db763cec7so1852177d50.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884359; x=1795489159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
        b=GF3ZIRbU7LqrXGuYUzXiVeHsCoUZGHberWUzLzJSu4GkotszijPt0mqboO5i45yf86
         1Kpq8r8oxv/AwTrhJAaagVPXl7sUccrAFod7uS7R71tEWeAnpr8yofaRz1HBY/12skTk
         fqi5nS24DdzW46ZgmaWeIZmF1nXJz6GUQqkn2LrrX18L/z3w6Ac4EbXY0Sgt3vBRNV22
         C+eT8/iWoqrfdoKnEWXyWwQg/yZzPiNoWtRO9gk45o92lcABpkHG3x9FM8VpP49qIMaR
         WDOApUvYOZtwjvHIUdKuIZtyBE6UG5y2+QW3Z/E82tIdWqaCeakF6+Ny4iN+KyOK17TJ
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884359; x=1795489159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=689Tm9O+vBEQHj/FM7Y6c1v93wlxXsLmvU6MsCP0/kA=;
        b=ndb91qN+z4e9e+eOTFO4IWLNwJueNC8+181QxhAbSE/axmm+YNAMmde/ydOOecVuv4
         kpr7ehhZ970kiTZ90/9xQJLmC3Qt90fYEJV51WD4Mzr4muu6I+dWizg5+dxwJU8Cmd3m
         nhe1ESVPUvhfHMuxxukr/KjJUQ076ROxN/CRc63dxKuMnoB929wkI6V1QRMzskcJ9uYl
         SnhnnW/Atx593z5jpDD9zMC784GfZVlmmIRA2uAChZu+yIO99fv9YrmjO/Op5oItLKu0
         SH7a3VVAaV1yPng4pYy8VFB9JhmGo/3AYeklKgG/ho87iEndy2p3VunOLnBavgRMH5Uh
         mi8g==
X-Forwarded-Encrypted: i=1; AL+hErGxNFWEFuBzrpFARWh41tLK4N2jYf9DbMC4RLczRUBTLnFYxwY3FbrwJ9Jx6VW92vLKTeJRyYo+ECw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91vMGxCZUAPx3ME5nUhIyFzRTB2zi2Cpa+zUlNkl6g6ujbKyJH
	RtWdPtVG2W2+ivJlNrWmkcQnpc5n9WT3thcMf9Gm6rNRpStXc0txDg9cRGW6yPzVwkk=
X-Gm-Gg: AZFdTZczv9U2ruc3nyVrXjf0Hx2Sv52fJmOx6JlgEav0vpSRvdTSTaUeLARE0vzF9fY
	bnWaXjsVYTzx/OmkHB36QjnKDwBXBnn0GI777r5tqw4pIolpRxJvS0R4psILbCvmfW2h7JoPn6q
	iWFg0HdyOQj13GZRkZnUS6vHtu2aCfhgpKxYe90cwf6iiahoWaHckSJSH/U3/dmsgFgAM+udo/x
	KA6SrDN6ef5XMGXLfZN74hNFLp6x5DePhh1iVb1SOkB20+Krkvz7x6jlQvUYBcj71SB6bs9w+tg
	XaMWLx6RQwTyFEQEmkiuy3mHSmZghnHF5ZkEELqFZ8rO+W7Ws9+OP7sXwmUaR8XFXb3ndwPPHm8
	7or7kg/zsz7Epb2cnUvREd2lZXu7cOkC6Ydm5mNF8O0bimbCQsXhsiSCsuKxKCPsKS9YPlgzHIN
	U7CtI+UpjFquMuhc5A+PONW/O1QFM3/LZZgNGBc4nNypECN74pWQb0J/xaTSC0xBCU+232RpUKH
	m4jRXFzlrOQktBRtNmcvG/TTWoghO4fIstQaKVIreIa0PyqB3UFKw+naX4bWPqKHe6kR8ldlJKm
	mze7szYn7Sl0iFllRzvEW99zBsdxjNBpJ+5GrvJGEjFrV8i+eFXmKrS6OOq7hRFP/mwylV43mSu
	2/PxPLN4nAQE8W7FdUb/KWM3VABt8s/3f/FvVj5maU69GDAlal6iPFPFF3ay3wLcx9NQv5xweNa
	tncFNT+c1vgwE+iTwTEYc=
X-Received: by 2002:a05:690e:1388:b0:67d:b4ba:b4cb with SMTP id 956f58d0204a3-67db4bab988mr2441881d50.27.1794884359223;
        Mon, 16 Nov 2026 18:59:19 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dbbdb9d0csm3768907d50.1.2026.11.16.18.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:17 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:11 -0500
Subject: [PATCH v2 4/7] alpha: marvel: notify environmental events
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
Message-Id: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=DL1ALKxKn/ychnU0MAIXks8gfYB5EJCjJIeCgE+gavc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oTdbLrVEKd2SzHxK2p4Y+zItjcnJ5wi+cfEH3Ie
 ldYdcmXjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmIIfhJ6OdfMbWBV
 Pm/Lue9DZq+83lhpXaC4s3sfel3V6TdlNsSg3DX7H4o4axMVKP5Q164m++1rJtef7ypVRC9/Hly
 f8VK+5ocgAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 16ccd2002a11..dbbf827a18ad 100644
--- a/arch/alpha/include/asm/marvel_env.h
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -2,6 +2,8 @@
 #ifndef __ALPHA_MARVEL_ENV_H
 #define __ALPHA_MARVEL_ENV_H
 
+#include <linux/notifier.h>
+
 /*
  * Ask the console to refresh the environmental readings of the GCT node at
  * @offset from the start of the GCT. Returns the console status, which is 1
@@ -9,4 +11,7 @@
  */
 long marvel_cfgtree_partial_update(unsigned long offset);
 
+/* Called from machine check context on each environmental system event. */
+extern struct atomic_notifier_head marvel_env_notifier;
+
 #endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 46c521cea9a0..6e0b0aabdaca 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -17,10 +17,14 @@
 #include <asm/smp.h>
 #include <asm/err_common.h>
 #include <asm/err_ev7.h>
+#include <asm/marvel_env.h>
 
 #include "err_impl.h"
 #include "proto.h"
 
+ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
+EXPORT_SYMBOL_GPL(marvel_env_notifier);
+
 static const char *
 marvel_env_state(u16 state)
 {
@@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_subpackets, int print)
 			status = MCHK_DISPOSITION_REPORT;
 	}
 
-	if (print)
+	/* The frame is processed twice; notify on the printing pass only. */
+	if (print) {
 		marvel_print_680_frame(lf_subpackets);
+		atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL);
+	}
 
 	return status;
 }

-- 
2.56.1

