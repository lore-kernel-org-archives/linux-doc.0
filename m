Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677993;
	b=Tk4cMFT0xoWbi6CkJWg6Edp/KdLfooGEVhh1rA6c/nqFhfnKfeqALoaZTlrMlN6HrDjP
	 I/mkP/VldGNjHYveieOuhUGO1jiF+lQgDZ5wSTSdcp7xoXFF+jWdxj4oOtapK3EoF+HWz
	 ICswQrDCzKLRulvslmycGFrv+WsdaUWhyvaLXXAOk7GiNa0YXdLm1en42VArIl9tbjKmT
	 xyEa4TzMmArvIVCcXaGXrJr62ZnfGgUenCY0ec7bJUQ7iPtwyPuNvMvUE6sRRI2+615qH
	 995Hvd2cQkThIRj58qtfytKnRBLTiLyC8acxOkawpCXCy4I+5+7DoU8Zwyo9mP98IBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
	b=suSa28yRPzTzoh1lDI0IPYLWtLoW8WarPYUADyr7UvkaHZFarT0aAZPhSho3dphBkKbW
	 j64/jNUR2PejBo0hqhctsQk9pCzqdwQ97rbZsnPkcAcvEQvE9dfSFB0EjJpK1I6l9vSq5
	 xrecD1ycWzr4YbQsszRX3LcOX+GkX8ekn4WCy+CN+qjRIi7oupBq8lmJ/6mAPfQTsDJKR
	 xr6jYM6YSTVxPAz9wxDz8TJElrnjzYdYWGU7I0WVi7Hw6AZPODYjI21Mx6zYLqIrxCTHT
	 +n2k3LZx/B5KTmLhcicOR3ZOFDWZzoWkHsIXURuKhCcEuxJxv34c1/FoeaSt2/TbkqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE7606A32D
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61BE7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67bee1f693bso1711513d50.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677992; x=1795282792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=hNgFT9c2jrdkCXe55vN/stCrCyN+Lw640rnMSlUyfveTcPAERNwY5hXqsDsJ1Cploa
         mdt7EAcxVlt7g2rsjB2Rh9n+n1dhScx0bu7VqwBr501yTwPD360zJP1WmZfpRbhqYXxO
         5o2yA/UOKUK/dVFF459TiKvjZ27ntw3yptNDpLX68xbamI5YeWuyQiU3HOSz9dQDk2VT
         wjLEX0MYiLPIH9ChzzHBrwlWbi2Ae4xmAy1TNymeGDAumaqPIgJeOqc6v7o1PzePMM1+
         gBj+Xo4LhOm0QVTVxSM84IqijNXmWy+89k21MaEkHgwe2VG18EWvkvY5hC9saz5qYqTJ
         yKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677992; x=1795282792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=S5h/GRRydSWeFwIKzjrOIcft7JHQ32mpKFSwxjvdAr63fWlC8aZaatvIXOvcLozoDi
         KHCI4w3P+2OjQmILGb7K1E4ej6gfFuQfTU22Hx33s9w3e/zmDVeiJMXINTc8S7RuCw/9
         fOxwiJeqAycMC+EYy7da9igtEqgDpEnRmxG1dh0rGroLVQijmFB3cdj8JdonKAGCcLjM
         /5EI8tp9xe4bLYWinKkgTWEFHyyl3hWASKWRb5kzIWybcyAL7Z1MQPVC0wPwe4JF4kUx
         KXCpaO8KDKp0vYCQfkMs/d2f89pOrYp3iQQcH9nVtZl0ifRwVfDwoX4VsOxuNu5hl/hu
         MvvA==
X-Forwarded-Encrypted: i=1; AL+hErE0GTbRWFaOC9xiFpyIxJZ41sMO7m35536tbB3hiHcYsYAiKrIHKlS6iRhkLa2yFbzh9FwehZOr050=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AHHTHxDwMJkY8jTkWCRqRiK6SSNqZ0Pl9sFJ8OZI9j7PS2/fS
	dukYP+UmawDMGLN3leVqPxFriM+7oS/P13uetdzIJX2y38vPCCHV4TkD
X-Gm-Gg: AYBFou2DHMGcyW7R11XA20+QDCdbPJ1iod6LzHRiQ9styOA69UVJBoeqKKdW1L1l7vG
	sH70eH6u51NqqZcyreqqIeKGKSq+dQi2EXbyL+b9DG5qhZbK2Usbf2PWC5/svq0AfI/PCfroJqB
	eCPJSRACcr5DvCjyAK/+76+U4xpyhgf17CKbFGYGQFSt9ILZa7lZ+9VD6WvJwv/6azk8ihbTClo
	Qnti8L+xgEutSGQUZt/UOrNOxMlyFiPy83Lf12jQkOe8pmGpXJ7/scQPX6sm/NvhTXNBQ+Yy4xI
	YpBlqb8y4pe/ao8FK5cY5UhPAXNyyWROG+kdrwfKBnAe0QhP3svvo2RW7p5kGyMK7TRDx4iuCvX
	EX2TuXQefTwO7tjKIeCzfmvgf/yqQppZGGgaO0TadXOWDTYvO1YafEnHdQMsAR8cw9jWTey9Q38
	bw0NwmBoiP88Y8cBmw8oyIfQdubLRikWaD7CeSqRJg7u5T7H9Hm4us3nVcpQBs5upZqCZQ6aqn1
	uoxzoOElWB/ODyOulVlkAqDmjYPaIeR4abeVLdsE/ryFxtIBrn8DkkE5DRv+FpkmPpEoDrtPFeo
	hAPXVfWMcM3Of+VIubYs+BZraObog4Kau8Sd/JUJV9UuMm9i6uKmug2LKRxLJB+RLaN6LKsiADf
	H3Pkflpp6y4kgUXvMMtuxojrbuiC2AtFcH2rzQVWmUq5/Owj4882fn1NBVjyoVQ==
X-Received: by 2002:a05:690c:e3ec:b0:8b4:b5e4:e7a4 with SMTP id 00721157ae682-8b4b5e4f2c0mr27973607b3.21.1794677992256;
        Sat, 14 Nov 2026 09:39:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9d05acsm48540367b3.35.2026.11.14.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:47 -0500
Subject: [PATCH 1/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
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
Message-Id: <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Y3Z+L3Q1B+1LTrQWdh3AhhyWOlCmGs2mmWLvmmWQrZY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHksxnqmP3lDM0usxYK/0c0pPTY7/r1lnCz6bZp9r
 nSy5Wn/jo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlG0pDhf+2LB+qXxP
 O2lV9Jygq3cygu3GHev37zmu9d67755yuf2c3wP+39hz4HjcAfYg8vS3Zwb7j3MEFxmegenlsK0
 Uc4sx+6cAAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..832567a3ccbb 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -24,7 +24,6 @@
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -62,7 +61,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       env->unit_id,
 		       env->condition);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

