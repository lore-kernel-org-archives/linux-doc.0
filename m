Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387408;
	b=aM9EtSZnZzs3KwG3kzSdcNpl6fLQrtqhRCMyptbm5hVtjOAAreyvF2J66sJaAxx+Kw49
	 u4qOV1aln4lAzkH5WaQioFlfjmU1VAWQzQYK3PCGAgaHpDDSRGIS44kj+/5BplgC6pwXx
	 QXzoPP3NgtoYXp3yyGHI7fH9gdQqlVwwR9fG/pklj4DwKbQnJPWBioQ33TKVXyPu7jxqu
	 DBjP63uWv20dAliG1zUc5bDgQbwR6ySMSmUWuf23U4cYfrqRZwvOHDBFT/ncjGNx3OxiB
	 kdipXHyyHx1uW466tZmQdP3y6nFDArPQFhOrYAOfJYPgE4hGszzjGfp8Ccu7C1RZqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kD+8hVqKVLhBJLMudt/owxF4vjQZMFBH2XanHyBepaU=;
	b=gfHF+adgA1COLE88eVASbZ61v6ukhqjjmqUYKWL2fnCuv7zLIh6a+jZE+txRyP05uSI6
	 8iaZWjlF3MBfUvriv2Odfxzosjh3akVGZOSVOWoqHACrlIFcOf1SfkstL6s/HdOPaFhng
	 b2Dxq/xazFMq6DpTlaPcLq9pGd2MGsOrjCfuNeVsw0JQVtTYDYrd4NhkFGJYtvNj+qx5K
	 x80i7QmvFva3bLKxM2eQ1uJsYlwgtkU+7fhkGcVUte9pDOX8PTJFkNnTA3LgGJgWvDHbP
	 0b7vhnGK8DT/l9760y41ydcll6YLn4udwj7w4c7l21h1ouikNF7gBluxsanZ11qhQ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LmKF2FYG;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40685606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40685606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LmKF2FYG
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-486f013db83so372940fac.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 12:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793387406; x=1793992206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kD+8hVqKVLhBJLMudt/owxF4vjQZMFBH2XanHyBepaU=;
        b=LmKF2FYGpMuwc8y/AW8Eiv+v399Yl/3WEc7NB9ph9yWaNGEo3sGY1s1NqgkUcyOHzw
         Q0kMTirWVyj1YHMgDHpqApdPokirUD+N4OvzwXSHFRZddqN7Ez1XsO5xjr18ljn+jbdj
         X4GzrqLsuBBTgil3Y3+ewAUqyes0KSjA0voJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387406; x=1793992206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kD+8hVqKVLhBJLMudt/owxF4vjQZMFBH2XanHyBepaU=;
        b=eSJ/0JEcpw8x9i52syxrqxhtnpoIEsXnB8qqAQps7Y9lJidxRLxoCgQ7HLNi6Y6UgE
         c9e5URHQcXpav844XTwR/VmsOdX2la62bsKxwO2NRsAcZgkhjZ9Hbkh9aQF/45QrS6Ku
         rm4jcorgIdFnrvoH9R/DEGQnti3SVCaIJS1Tq4Mw1enjX6P2y7EBzSLg6Fp40eMDf6kv
         s5ATINQNCElSuf1b/tAULjdRDcqk1JHPVGYtVqupzSHsMNtaIpAt2MLTHhRhtk8hdcgm
         mM4Ls/EHDVPOYw90ajI9BgYQaoboEM6fXk1kxypaj0VcMMjOQ6PF6Y5JwjEBxWiedV+p
         AqkQ==
X-Gm-Message-State: AFq9FYJxwM1Rkrdr14Js4Vm7ZGzNkyfZC/lF1HrzC7fePLYjDvC7Ma7C
	6H7D70hJ0ClFfbor0bs5enlu2vNNC8bEHd01/Yml981W6np/XouxrStDt6GBGVux4g==
X-Gm-Gg: AYBFou00WaXwd/RurYSpDrVY1jxLyQkt5m+wAD2nUZtKto/omKwPZmst24xyXGRj2Gp
	PRbOGYwRxQTVk2RE6lC5Y2ZDH9o+lGaNDGwp24RjewociykN3kcLU/rPswz90zWvBqfoAoEt5/x
	a4TbdBTPtWNG1CeoXhvzVjLTDSlV2FL/d+rJdCo7/6b/eRQKe8+p3GZC+P7hoVM4vbxsCGHCSSy
	Kj3C6ggdQoYAph39+1ZwuQI+HPY6Mk0fVwcGXPIS3EXvO9y/OwX2JT3Ccjl7bLapBNKlrWbl7MA
	XpBpg7/6O0O5tcCx9SCSsJIuXjFIdKVKjLo7y4I7CNByGm754B3koDIgp08DyVA7Qv5FUIkx8Wt
	2gwOHrMr11KRUcIn3XQrh4BPg7K6KhAJYuEW7DqYcaKdihIfTm6aF9EabVfTcy4M6B69mn15AYk
	i/zoRlbbt6swvx1zhmYyH+LPtJD+Baub4GFrdxs2cJhqlDYV3knpiqW/l7xV2IUYK1AD7PU5oK+
	vrEXT9zXZNAtJp4KAazn60MGLUVfnrkbuMGHkGxEIOlE4HqGOZLota6WAasEDfnYWUFy3Rv3Iwp
	0bGGEIHclwa5sB6jnHTkWe+dbuotcZvtdiYxt/SdiKlRKXXF4iHrkAswAzU/h5S2j526vXnZ8vb
	g3zFHZ4ZzNJkmFak=
X-Received: by 2002:a05:6871:4410:b0:4a8:9bb3:3439 with SMTP id 586e51a60fabf-4a9077edc24mr2353106fac.60.1793387406016;
        Fri, 30 Oct 2026 12:10:06 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm743296fac.0.2026.10.30.12.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:10:04 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH] pstore/ram: Allow ramoops.ecc to override DT and platform_data
Date: Fri, 30 Oct 2026 13:09:42 -0600
Message-ID: <20261030190943.3472498-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ramoops is instantiated via DeviceTree (ramoops_parse_dt()) or
platform data (e.g. chromeos_pstore), the ramoops.ecc kernel
command-line and module parameter is currently ignored. Depthcharge
and firmware often create the /reserved-memory/ramoops node without
setting the "ecc-size" property, leaving users unable to configure
or override Reed-Solomon ECC from the kernel command line without
modifying firmware tables or DTBs.

Initialize ramoops_ecc to -1 to differentiate between an unspecified
parameter and an explicit override. Snapshot ramoops_ecc_param in
ramoops_init() before ramoops_probe() overwrites ramoops_ecc with the
active ECC size for sysfs parameter visibility. In ramoops_probe(),
if ramoops_ecc_param >= 0, let it override cxt->ecc_info.ecc_size
(retaining the backwards-compatible mapping of 1 to 16 bytes, and 0
disabling ECC). Also update Documentation/admin-guide/ramoops.rst to
document this override and modernize the struct ramoops_platform_data
example.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Assisted-by: Gemini
---
Tested on an x86_64 Alder Lake Chromebook (brya / osiris) running Linux
6.18 with ACPI / platform_data (chromeos_pstore, default ecc_size=4):
- Default (ramoops.ecc=4): ramoops initializes with ecc: 4, and console
  and pmsg logs in /sys/fs/pstore/ persist across warm reboot.
- Positive override (ramoops.ecc=16): overrides platform_data ecc_size=4,
  initializing ramoops with ecc: 16 and updating
  /sys/module/ramoops/parameters/ecc to 16.
- Zero override (ramoops.ecc=0): overrides platform_data ecc_size=4,
  disabling ECC (ecc: 0) and updating /sys/module/ramoops/parameters/ecc
  to 0.

 Documentation/admin-guide/ramoops.rst |  9 +++++++--
 fs/pstore/ram.c                       | 22 ++++++++++++++++------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/ramoops.rst b/Documentation/admin-guide/ramoops.rst
index 2eabef31220d..2c512b718717 100644
--- a/Documentation/admin-guide/ramoops.rst
+++ b/Documentation/admin-guide/ramoops.rst
@@ -54,7 +54,10 @@ on restart (i.e. new dumps after the restart will overwrite old ones).
 Ramoops also supports software ECC protection of persistent memory regions.
 This might be useful when a hardware reset was used to bring the machine back
 to life (i.e. a watchdog triggered). In such cases, RAM may be somewhat
-corrupt, but usually it is restorable.
+corrupt, but usually it is restorable. Software ECC can be configured via the
+``ecc-size`` Device Tree property or ``.ecc_info.ecc_size`` in platform data,
+and can be overridden via the ``ramoops.ecc`` kernel command-line / module
+parameter (where ``0`` disables ECC).
 
 Setting the parameters
 ----------------------
@@ -101,7 +104,9 @@ Setting the ramoops parameters can be done in several different manners:
         .mem_type               = <...>,
         .record_size            = <...>,
         .max_reason             = <...>,
-        .ecc                    = <...>,
+        .ecc_info               = {
+                .ecc_size       = <...>,
+        },
   };
 
   static struct platform_device ramoops_dev = {
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 2eb0d4fa2186..3eac84701fb2 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -69,12 +69,11 @@ module_param_named(max_reason, ramoops_max_reason, int, 0400);
 MODULE_PARM_DESC(max_reason,
 		 "maximum reason for kmsg dump (default 2: Oops and Panic) ");
 
-static int ramoops_ecc;
+static int ramoops_ecc = -1;
+static int ramoops_ecc_param = -1;
 module_param_named(ecc, ramoops_ecc, int, 0400);
 MODULE_PARM_DESC(ecc,
-		"if non-zero, the option enables ECC support and specifies "
-		"ECC buffer size in bytes (1 is a special value, means 16 "
-		"bytes ECC)");
+		"if positive, the option enables ECC support and specifies ECC buffer size in bytes (1 is a special value, means 16 bytes ECC; 0 disables ECC)");
 
 static int ramoops_dump_oops = -1;
 module_param_named(dump_oops, ramoops_dump_oops, int, 0400);
@@ -780,6 +779,15 @@ static int ramoops_probe(struct platform_device *pdev)
 	cxt->pmsg_size = pdata->pmsg_size;
 	cxt->flags = pdata->flags;
 	cxt->ecc_info = pdata->ecc_info;
+	/*
+	 * If "ramoops.ecc" was explicitly specified on the kernel command line
+	 * or module load options, let it override the Device Tree "ecc-size"
+	 * property or platform data (with 1 mapped to 16 bytes for backwards
+	 * compatibility, and 0 disabling ECC).
+	 */
+	if (ramoops_ecc_param >= 0)
+		cxt->ecc_info.ecc_size =
+			ramoops_ecc_param == 1 ? 16 : ramoops_ecc_param;
 
 	paddr = cxt->phys_addr;
 
@@ -864,7 +872,7 @@ static int ramoops_probe(struct platform_device *pdev)
 	ramoops_pmsg_size = pdata->pmsg_size;
 	ramoops_ftrace_size = pdata->ftrace_size;
 	mem_type = pdata->mem_type;
-	ramoops_ecc = pdata->ecc_info.ecc_size;
+	ramoops_ecc = cxt->ecc_info.ecc_size;
 
 	pr_info("using 0x%lx@0x%llx, ecc: %d\n",
 		cxt->size, (unsigned long long)cxt->phys_addr,
@@ -963,7 +971,8 @@ static void __init ramoops_register_dummy(void)
 	 * For backwards compatibility ramoops.ecc=1 means 16 bytes ECC
 	 * (using 1 byte for ECC isn't much of use anyway).
 	 */
-	pdata.ecc_info.ecc_size = ramoops_ecc == 1 ? 16 : ramoops_ecc;
+	pdata.ecc_info.ecc_size = ramoops_ecc < 0 ? 0 :
+				  (ramoops_ecc == 1 ? 16 : ramoops_ecc);
 
 	dummy = platform_device_register_data(NULL, "ramoops", -1,
 			&pdata, sizeof(pdata));
@@ -978,6 +987,7 @@ static int __init ramoops_init(void)
 {
 	int ret;
 
+	ramoops_ecc_param = ramoops_ecc;
 	ramoops_register_dummy();
 	ret = platform_driver_register(&ramoops_driver);
 	if (ret != 0)
-- 
2.56.0.317.g454f8302e1-goog

