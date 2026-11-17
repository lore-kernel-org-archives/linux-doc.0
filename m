Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884354;
	b=gutbxkRZhY4kLC1g/FdN/a4Z2xl4cAjpSIhe1CNa6OHRMPWuBRzK1TsMp/OGO+7kJVIE
	 QEgR5iTRDpiSdCA8p1qrVGQEU9idnJiTuxO7NsHUBO6gJGTw/dyjnEo6PAqxPIDjG3vGs
	 XXNBANcKGWxUtzPLh2i4TXIdrDDIVVLc+Qwl3YTegdxM6ppIkn6afn5Cy4Hzxaxp/WTME
	 T5vThcHoyYEHTzpx1qiCWWiHNW+2tpfOr3cHloBJ6qj4xD+ZxS+VC5cG4vTkU67F/wia/
	 M+TL6W2212nApCLBeiUxq5FPlfXUmqRynHoFs+d8C0mZDDiKw4nbIhn81x0qE1NUTVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
	b=b+QKSw9TTPoBYfw3kbzlwsD6GUgHrFBzFEgrmzBB2Q7Hrfpqnq3MvH1r5uAZE/dR/ri3
	 rRY+IbaPMFsEHw4TtZY+Yjtf32ZAV+wsrtIz4ZxZwLh6AtVMX8ENalQv95cbSf60cElY2
	 sOXse7wxpFlFet/IAs0x8qOTM93+578QXUpyV5Qcn3k5uZ3gps+9SshUEgj+TOLgFIOMb
	 Oig6YLsxBmdiNfqNhiieM9kGALPSQUPb6vW8+PMASDQ4+El80StevSNhzvLuAP6ufBsV5
	 x9VFfSbcgMfTKUb9ZBHQzAJU0Rf02DsVgLD3/m0HoeC1mvzwc4O98JHazNEuyM+1Fpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL80WENN;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC10606A339
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC10606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL80WENN
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db763cec7so1852129d50.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884353; x=1795489153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
        b=wL80WENNSTootYxtR+B3YqVHCVtpSWi0ER6jk/PCnQBPezPc0/U7vRAzRMzzc3UCQ8
         Yx6eZ8XDwdxhz+AQ18JZYy+Rdwtm3/R4/ERR38NvW8P8P05NBvpDOndLb8m94oxTizGk
         uBipB3yR05uvDI5wj2SRRVzj2SbfVT50/JegaA0WhKUu3bxNjobo4t/MrXxcFQdQQeJX
         5TsQzLd1vmDeUmJ13FcBT3aD9k3GjFSVKrnyDxIOT1xB1hmewVNDYMz67TctVMkM8wEe
         ptCeZEiAXOnhNd+FQdyCNqWpHGBUDCZXmHUmHYFfJ91f2CaGgDImCPivQ1NNbE5vjXT6
         m/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884353; x=1795489153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
        b=CELGhdZDQhWn0RhSFkbVSdwGQHO3ICMB4EKHN9yD7USfrxXqataPQkLwOUviobc8fb
         06cdDgh+KIA/+NQG7SEipDofjLfoisVCMgGe4XTSzU5bNVughQ0sRaIo+OLW6iz9/9Kd
         7hss81xx39O5DQmCw3V+2v83bKDyqFccNmyv+e8AMbeZQgDLXWSHoLSyQznbSHTVDx+W
         bMXppKqyNnBzvPkQ87Za9DJ/Vc9VBq3755bo+xC9x8QJu49bmSvEQjef11RKWeuBI2tQ
         zA+8poyuh/4vgDfbCwVgX5wY07dbFygrXfFMHRSD8okEM+FnlUiqhVPZ8vp028nh2O69
         YPAg==
X-Forwarded-Encrypted: i=1; AL+hErGKHpkJD89PftGePScTGUQgxDWKUo8yIRazAk5YOGeI0wSzSi4nSSN0C4q1AbDVxW/RhzbAB+PQXvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UE5NRx4mEXLs9LrJNV4vYFHDkEx6qsn9Pn7bFfqX+iL9JscDM
	uIA/rFOOMQSG/F843CzpA1FzAYZhwZSLs35bb/1EHXg546B9Hv0Kn5hpphS1KlgMNA0=
X-Gm-Gg: AZFdTZd4ZJjumJQpdqbayxsuRXXHNIPTvmFbtrtTYH3f0BFSI2jnicvKwSqQLlC+Khl
	lse2BOLP5RXKQ1TjwN/fbxexDmPBC/Y31pXeaXjUFLyGfZEok78l+ndveiapqgo0Fb5a39ysscF
	U++ZpAJ6cjBBFrPBrJoYRiu8yva4gl4nwiieY2sQMkuwskU2Rwdx+HR4ZvHgvUlMmDY1/h2PV6t
	1M7z5uSeQ3PyvlCtQod8pbGeE7P13OVRAJFgv6cBAMq2+S+sDlSt6UBg8RoQTw+wBFZrpH9mFyq
	kJ+3AP2PhsJINJENnI1gYZNIdJiv8u6kvysmuTjMKotISToDfW0SuZSl4dNsGhEHuqOCmHdKkx1
	ey1cMCNYJiPqm5nrUykWSunQ8ngSGlGCndEa2Pve9gOhvGjhHxEc9kPJCb744TduSKgDyN+4wtq
	f+pt31du8w9WJEOYtIcfYSq2WG0oRaSlFwUNLLTtzxfgr0RsYNkig0q2tiU8Y4TU+nMFgpZW7HG
	sFxb1SWKebv531H8PLc/ddPLcpzd7xU3CThELcg9f2siIhDitPQwOIH0RKXWXfB4Y8/h5ld8kAi
	xHNq8/ty8fjDLS+x1rbVIOczhVOenwW/RGUxnXG60k0tDA84G1lEWNEIjR5B5gXsrnJ3wKwNAmh
	s3d21jjJAg79w6cx4Yg1zSS103l56AsH4c356r86GmmoOHrnWiitz/0hvRJLXv2tSyllWzoVSCH
	Uz2NIfg/A99IpwmAvxyw==
X-Received: by 2002:a05:690e:b89:b0:67d:b299:df5e with SMTP id 956f58d0204a3-67db299f0camr2146318d50.108.1794884353312;
        Mon, 16 Nov 2026 18:59:13 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec069d3csm14474487b3.28.2026.11.16.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:12 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:08 -0500
Subject: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket
 layout
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
Message-Id: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=N9eREZDTgtKh+3whukIkS3keJAYcEhk3gX0b/rM2its=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rDn+Uq9cLsRvnN/k/mcbrFSgELM+9JLDM9dTw5u
 SpfNGd+x0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFzT/Jfhn1m9ueOWxm
 bve0Xut0Xjas401AktCg7dO+8z85rFdz9Vv2P4HyBZt+NUnmfmOrUNvKe/TO83//lgu/DkJF6Ly
 t4gkfvPGAE=
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
index c0c0ccefc467..85f7a56816ce 100644
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
@@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
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
 #endif /* CONFIG_VERBOSE_MCHECK */
 }

-- 
2.56.1

