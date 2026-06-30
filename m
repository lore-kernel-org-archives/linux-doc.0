Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909663C4B83
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837375; cv=none; b=CqjF5ATIcAgTQosc5YZ4F/hm1JYdT6iJ+Urc8kVsBE/EnOxbqi0pT6Hjn66aCW9umiXPOW0FTfuAPqVqTRxUgEihhXdzZHi8hkYsSoFfC8or8EMgPipLAqL/HeXiyfLdwawU0h9loRbpZpHMWN9wu+1+EX+ylpu9Yb0PWEBd2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837375; c=relaxed/simple;
	bh=utDuo2WNw3hePhQreU1zjsPiOgUN3XHnEKmrepDTN04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLQs5HjHMYV3JimKHVqEGYiNm/zg3lgBTiN/KPo0CR6dPKOlaKqOUiRgZh1W8cELjib3ScotqnTQcbitPaC91r9DKFlBHCWg3kXvBUHtp596wSsFaaeOagfvrSlOfVUu8TKMhmX1m90ry+7n3a3EJHXd0KfITvtqIW829jXNcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=csGW8IHv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="csGW8IHv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso25120675e9.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837372; x=1783442172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=csGW8IHvgiGLs7tFcdW23YF6OeGnEZV2ILK4m9z+46f7X+fJk97XtsMCa/bfWkHSuZ
         DqxXrGgQDYy6zGpLMbZc61Dp+yd37lAXsg3DeFdyYriVXTZAzq4PxwUQ/3maOapx9TF8
         nbQmqkS3ah0UrMV8iDwxXrO9duSIM5tocADOO85wGelGo//vU8F5rrPDhBqR90g3z68U
         YIg/oj7i3/71g7E2s436tbXDzwQH0s73oFEEZXyJeUoG/RJ07pAIdruOXFBP77nqmrYL
         zppVNtDX6qu7nOganAIt16YSgyXojE6QFdZqWuP/9Nqd09O/PabUwGatbwclASttFD91
         LEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837372; x=1783442172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=TD5jJKbFne5gWs51D6UbtztxzG05AmkiMyX01Lm5DDnTNLUaPXqGhDfiCsDYRpUXrA
         mUU/h2Q+SfKV7eN5ElULgmymAV9zoRqFMsvfysmeknLF60WjKiPCSUS9ulArAXrAG9wL
         DRhC1ahaODEJEjUkmaUwlP+iRgvRmJ4Buqi7Zte+BmJqsX0hm44NmKx/jVDAh2q6ev9F
         B1eMX/ohibnIv3Yk2AN9yci0cJmuZ3/Dew6UVtZHJaSGgC6idQ0KslirYi7SgQFwuuID
         bWTZQigzUVCj46eQX8I8AkCgrR1084tgtkYNpQAyikB1ZxPRBw921aLJ0oNedhjNxUSB
         c5Ww==
X-Gm-Message-State: AOJu0YxRUiHC/oyf4l5H732DHY4hTqDLQAGbbQI3RIkPuIrYiYpRPrAV
	kzk+f4ttQkhVFshW0d5vMMv3aUxbpnudzytBFJZTe8brfiYFomCqZMd+Vshe0Idh2xg=
X-Gm-Gg: AfdE7cn8SrjJGH8uYvQ+emhq7KRWSGtdQFDtwbmnAgIrVsKQ05/FW2XO3C0C1zP0ox+
	g5flkzH0GK2OUHR29xLQisEl62T3BZyldExuybf7+HZ0KzOK9FTe2qozO2f6+Ku2toOJAxSmfo1
	5EyZN1PGq+3DIQClFQOjelZmLaezaeCp8WmNqVpC6kzEZ5Wv9s8JV8H+SET+uYoEaaddXoC6fl+
	SLaD7BBcm98l6Qw4+VQ0ECiOnbHXIBpUOSYy9KAH4BNY1UVp39ZaWDvLelK/9FGgoSPNU3AsnUt
	osB95XtVWLv1YZ72bRjgrlBRwG9ckQMnjqolR/AUOUyHdl7KoZsjpy1OWWBqatwlUlULhyTSrBq
	QhHtcR/0RsBj8IuXXKeXI7lkrvl0o2O3QYT9ZGlhbahnaiX7bjtYcufVE3vzGNb0g9cQv+rSLl9
	SD/GJCOEd0qaSzubersjROw6Hj77T1N0eJSdphi2kZCGL2Ow0Kq/M3swnNjkoVU1adaGAhTA6g4
	/yw44eqwABtFADNs4JgG9mYFKm/
X-Received: by 2002:a05:600c:3b0a:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493bc92bb20mr34808675e9.13.1782837371886;
        Tue, 30 Jun 2026 09:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:11 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:36:00 +0100
Subject: [PATCH v2 4/4] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-4-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
In-Reply-To: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=2383;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=utDuo2WNw3hePhQreU1zjsPiOgUN3XHnEKmrepDTN04=;
 b=sOnrvPsO84DB97ORuTR1juL7r2Scn8EpMF3I6l/RvF7EoCDpqEEMlFajIZ/HKJT/YwxAr/2XU
 BP0Ae4MruK0CtpsU9u95RIYdHBzLEQVUODBhCas0gDrC1e6LVEiZTQM
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

boot_delay has been deprecated in favour of an extended printk_delay,
let's update kernel-parameters to reflect the addition of printk_delay
and the deprecation of boot_delay.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -650,11 +650,19 @@ Kernel parameters
 			See Documentation/block/cmdline-partition.rst
 
 	boot_delay=	[KNL,EARLY]
-			Milliseconds to delay each printk during boot.
-			Only works if GENERIC_CALIBRATE_DELAY is enabled,
-			and you may also have to specify "lpj=".  Boot_delay
-			values larger than 10 seconds (10000) are assumed
-			erroneous and ignored.
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			Boot_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+
+			This will soon be deprecated, please use printk_delay
+			instead.
 			Format: integer
 
 	bootconfig	[KNL,EARLY]
@@ -5468,6 +5476,19 @@ Kernel parameters
 	printk.time=	Show timing data prefixed to each printk message line
 			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
 
+	printk_delay=	[KNL,EARLY]
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			printk_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+			Format: integer
+
 	proc_mem.force_override= [KNL]
 			Format: {always | ptrace | never}
 			Traditionally /proc/pid/mem allows memory permissions to be

-- 
2.34.1

