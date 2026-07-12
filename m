Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8133A4513
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851654; cv=none; b=laOOGJRkYrVckkWh3x9k6TZsfg+MLgkK80CxxVSV9EWUKUHtlBbgA1o3q65LFVNZdF2rr2ljVPDoVHyuvrUPG9FTMq6tzbFcgMKk/fdAi4BtGendiYZDvQ9nyaqhe7Y1CkyLfYvzufAY5tSoCIXymyzpNo5PP3LUzgyLn5q1cCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851654; c=relaxed/simple;
	bh=P9s4hcVnWj9tTnGZZIC8g3yyXZe0SBB5hWMsufMT864=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fo2kDEVPPavYSGyhCpOzIII3Z5lGD3yQWw3tl15ZoBJG4CCom63EBb/z9skqvEy2+Ciay69iHEwmcxBIlR61MOtlmNx0GJBmqCVwoZ0gU5tSoxiSif5zAlKhHk+cAabVlwMvWNXKFsKb88HHutCzfYb+/KdA2UtxohtMnBR/lPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Vrxp3Xro; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Vrxp3Xro"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2191210f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851651; x=1784456451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEbITgTEpDZxe5ZFo5f4LGGlEUTcfS1MEeyafnuEbDQ=;
        b=Vrxp3XrosyesJK02x9LigsL/JLfBJhi0TYuq+dU3NNN2P1mcnMpIS/Ix2BOjU6Eb1p
         5uxAD82SSbCXmUF/kcki6hw9mLI2+ZkOKLVzT1x3AAHM6Jk7D7NxXLdV+qRP4VVClh/n
         heWBO9zx0Jqmh/66v3eNM77OjUU6eTtzWp02ftm4ztDBMUiwHntIwtM8Qv+aSA6Zb186
         hs8uA98I7YKcDkr8jKWSWOwfAYkxSS9/mqsVPl3HQFhB2EBFeXAQ51X3l21CKvq0AW1q
         LEcpMAp0dJx+rVTlEeB3JxZgzf2SVST5fuGuK34Pk9pCYuggb4QEJ+9ysZNFW8tWt+b+
         nVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851651; x=1784456451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEbITgTEpDZxe5ZFo5f4LGGlEUTcfS1MEeyafnuEbDQ=;
        b=IvGYSqoVYOuv0DTfFAPgV2mi9NpmNk+PCPSdL0R2NMuKLPbUaFTenjBmA2KPAY1lo/
         3+h535eDFpUTwy3OYniA+zQ3MViDf8UhJaWsHsZa0YYq87JRIb5YkLRBb6oacuicclcm
         VlVxHgo40pNVusAlu6tgyBuLGBHB27R/Bs9NWcvKXibZgxRDL/CTaEreTae8shLcFjTw
         UGg+Gbo/DtuWYRsyzgqWGkKPN/cAOaV+SDlg3TbZeIqaNC//nSpfOPydlc1yLbyhgSiP
         zbidpzk7kDMd+os+CXTIGYQfUT62SDuDIq324rvDHdkQXNftS5AQcYLiWmzuoN4YuF0l
         CQbw==
X-Forwarded-Encrypted: i=1; AHgh+RpJNz3N7LFuUWQqV+DINHlC3Qe+HE+7YGtsq01La+GLg7DIMN11jE+sCT1qwx1Gcs5YJUfPonNBcSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxegmDTj5BVcb3VXOIVSrtdW5DnGwFOVpSySiVYx0GC3Sw5GkJC
	lIPwmW1RjoylZQIij5ZUvG3KiDS93UxTEd/qm2D3a1ipMd0t4oDkEKDv4ef9n0UbEM4=
X-Gm-Gg: AfdE7cnFx6mIxoclnYlHZXSF/qm0hhRGrLuTATTjTTJYiCzwojLCFOnGRRK18voVYkq
	b/ywmKw1ZX6nEgSKi1ExlM8m/1Tn9t5KFNVAHkVG7oinog3e3QXzkwaPiUPq7Fa/4vBn442pdZ1
	IZIC68A6d1mgaEcXvcDfO29wEQm6/tvsDrJspMga74s7OC1SMusQywBKXTVVwx2RDnBa/YtLZ3g
	MwxQd4B5rUq3fTIEJRDrKuim5HkXcdmWuMcsWfOuOI+CbEl6MnJ3o7kHGkkhX1izW106ihxZYjg
	wHf0DWZIOM5Jm7hRImpUDi7J3tHbsG+cebZk7d1SV49V9IsrKB1um5QjnSIircLDTJ+rnkj396w
	xrddxbs69YLOoOKLGiP2YTAffR1GlQaCyK5OHNMmR1VyW8BOxK0IClWMQ00SZfmpbCFnYEiRXg0
	eWORGiALCuKLdPf+Abq4u5adUtnh7Kwdn3WhCN8pcA3JZV8E5Rg/EK1xmKctODBT696S3BGeHFd
	qw50RojphqqVnQ4E78DzF62dES1
X-Received: by 2002:a05:6000:381:b0:47e:4b05:2c8c with SMTP id ffacd0b85a97d-47f2dcdf16bmr5941928f8f.15.1783851651388;
        Sun, 12 Jul 2026 03:20:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:50 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:33 +0100
Subject: [PATCH v3 2/6] printk: add bounds checking to boot_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-2-574547b8f71b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851646; l=1714;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=P9s4hcVnWj9tTnGZZIC8g3yyXZe0SBB5hWMsufMT864=;
 b=C56SsQSM0G9++0Mvl1+EFh/6zQ8sQqd4MLbaB/EJJ10czH+MgpAwpdrT0cTcbOODbk+gvOJLF
 SMn+wTwDPCqArrjFNrKnXgbvdRhIhXUkCVLxl10G3JpSuARaONX7gZ2
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

As the boot_delay kernel parameter represents a duration in
milliseconds, let's set its type to be unsigned int and add
bounds checking.

Please note that the existing pr_debug will only be displayed
when boot_delay is non-zero:

 pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
          "HZ: %d, loops_per_msec: %llu\n",
          printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 31aabdf8248cc39c54ee11685d4a37deac1c174c..8be562c9be277670ba3209ed1f810fc87175848a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1291,19 +1291,22 @@ static bool suppress_message_printing(int level)
 
 #ifdef CONFIG_BOOT_PRINTK_DELAY
 
-static int boot_delay; /* msecs delay after each printk during bootup */
+static unsigned int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
 
 static int __init boot_delay_setup(char *str)
 {
 	unsigned long lpj;
+	int boot_delay_val;
 
 	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
 	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
 
-	get_option(&str, &boot_delay);
-	if (boot_delay > 10 * 1000)
-		boot_delay = 0;
+	get_option(&str, &boot_delay_val);
+	if (boot_delay_val < 0 || boot_delay_val > 10 * 1000)
+		return 0;
+
+	boot_delay = (unsigned int)boot_delay_val;
 
 	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
 		"HZ: %d, loops_per_msec: %llu\n",

-- 
2.34.1

