Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30A376A0D
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636570; cv=none; b=pIxQSIG1VA1/P7x7YOhOPSXDPdshF45eAXBbg1ohsQMYP6ym6fAz5+MC0JnOuT8aeFyGTBrCJhgx/o3RpqW0IBUCpnfV8jCMBsubY3avJZcOHvTsHa5njoPwLWMs7TAvJA++VigOQIvu7j9NvaQQEVMHTs3000nMDETadvIjfoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636570; c=relaxed/simple;
	bh=ipd5upR2TEicpga1iLZip+mHEfDMT1WpKFPSlKGjSaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOVCH5YZWvLReCzyMOAWhO8cofZVCb7w6d8bSFOy9dCc5iwsVtrNTbTi+SgDBe8J1we260p+5XTTQpv/Y5ElLR0IFSTJY/YhwU8qlm2ikjioHk8PI+r4Xf100/DLOwInjV2T1GdkJRXEl+y92a7zYH59fpAl/bxVB5kxIO2mPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpcSEKhr; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpcSEKhr"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66e63afda8fso1830871d50.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636568; x=1789241368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atqCgSgVfFJqR4IxbadjiI271vf2EWHpjmIlm326evY=;
        b=OpcSEKhrKAtKrYizCLc3WjuN/Alb5C3lqk7Kwg40NRdsOlpNQbDLXYA5cH/iqJrx8R
         UDpqlZcyrsh37+VqNmr/xQoKUxpAUG3t8lkzrdvFdubRXPCKee4jhm19nFhZOIsZb194
         Cfndra7zWVMJmh/M7RAil4BL+13oCZS4Pb5PAX6/pXsgadHtu0MFXcQwmcDjHXg7REYv
         JD7JiA+vv5AZ1/FpZbDfyfE8oZlxR59dVQOUf/4SH2LEpb1RBkf+4EPiAsR/mUXUBzKD
         bRd/LLU7e497NCMAQen7rnKGtEb0ELoMhBdrWoONcG4OvvuOwEfs7t7a4KKsPIkd0w/O
         2thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636568; x=1789241368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atqCgSgVfFJqR4IxbadjiI271vf2EWHpjmIlm326evY=;
        b=AVfDS4POv44iVt5pTx8VOIBEkujrnZxS/SXty8guetxo0AryoXF1WcUTrJWSGs0DPH
         EM4m3JV4Fu1vXjpjaNV5VGdLR7KQvxntJCrizQx+qQuUWYIx5z+wu7OgkMkazwdCbz07
         GCKnYvRMay7yvXVtyeIB4pLi4OKVnu3bYBaIHslZl6rIKNA+167DiVKELAQAumuzQB9P
         sX7bv2HTzR9i24Z1ggEu/RI7hs+pv8XIF4DWwYVsU9jIhoLysii8OcSzMLkFRLuyiYHm
         5X1vy3fVpraIICjt+ZbCVBI6MYy+Vr9FVKsaHfMUKVU6qv9A2yfaD+A2PG+QTZwl0hjU
         p3kA==
X-Forwarded-Encrypted: i=1; AKwUvBzSgMfASpXyQ+wReQ16AykvSVZesMRsY+0EVjopOU6wVRym2keHJDAhKLpdE7iBE/bRtUT5ZHk0wAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kaa2muOqHHadulpDqjlAMuQTTLpojin9QjUarIOcHRXMsYUjqj
	MXR8xWfBWA1OqXJT6vqs/M3HnZGYAGevq8VcxRYCGs8z5E5ci/DWdpB8
X-Gm-Gg: AYBFou2TKQcDDjXZo2MCa0U5qsqzCePz5cGxiVYXsXoLxMFBqffiZUmXt2+F/vAO/Nl
	CvE/fRXi/0MXM/HVO5Euw9riBhx2vO31whYoMoMW200W1OEAvrm8xGEfqth19D9RWPUp6HZsC4X
	6tgnGoc5fhVxYluTkWR4d7h2t6gvvLQ8VfGV3AcTbGliXCc0Yg0OaXnrc+qw4qK6ZkRr/oCn8pn
	T25hqJIBKcFsbTOMKW8fu01/AUC9k/51skrluv0M7BsNLJtqMQsh13VP4htFAxx+EJthT5X4lWp
	ZSv2AnyVM9TWzLD2VnzwrEUd4j+rGd3TSii7U+9vlanIoFh1S5+7VCVqUgYvmNdWG0G6ztI0w+S
	OQJLellrg1FneXINEH0kFxpEIx3ffO2sKANlKE5Vx5i5qvnns9r8o1oLQMXFKXMOkfn5wwJ54qt
	nTiSaWa+DFMg7GyA80TvEyX89Obt4gJJQjUuTnqpEczfzDUWzk+y4KKHr7KiNm
X-Received: by 2002:a53:df11:0:b0:66c:82b9:ae73 with SMTP id 956f58d0204a3-66fc1beceabmr1869927d50.46.1788636568096;
        Sat, 05 Sep 2026 12:29:28 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb497aec3sm4999866d50.20.2026.09.05.12.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:27 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:22 -0400
Subject: [PATCH v2 01/22] alpha: enter hardirq context before looking up
 the irq descriptor
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ipd5upR2TEicpga1iLZip+mHEfDMT1WpKFPSlKGjSaY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E4+t2kl9wXTxDXhVofZ2/30lDO/v3/bsz10jojH+
 gu+n59mdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1sw0Z/mkUZfEcPl
 6Um9Okxx7ucbu/ffGSzHQnZcdr1b+fyXUwmzMybLxgkGgl2lTmobr02SHJE4dNu9K2sV7fxHlj6
 v0ewedr2QA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

handle_irq() called irq_to_desc() before irq_enter(), so that lookup ran
with the preempt count still saying task context and with RCU not yet
watching.  Generic code called from an interrupt handler should see
hardirq context, and irq_to_desc() is more than an array index once
SPARSE_IRQ is in use.

Move irq_enter() to the top of the function and add the matching
irq_exit() to the invalid interrupt path.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 4a6a8b1d5a8b..5867a1655045 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -107,18 +107,21 @@ handle_irq(int irq)
 	 * handled by some other CPU. (or is disabled)
 	 */
 	static unsigned int illegal_count=0;
-	struct irq_desc *desc = irq_to_desc(irq);
-	
+	struct irq_desc *desc;
+
+	irq_enter();
+
+	desc = irq_to_desc(irq);
 	if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
 	    illegal_count < MAX_ILLEGAL_IRQS)) {
 		irq_err_count++;
 		illegal_count++;
 		printk(KERN_CRIT "device_interrupt: invalid interrupt %d\n",
 		       irq);
+		irq_exit();
 		return;
 	}
 
-	irq_enter();
 	generic_handle_irq_desc(desc);
 	irq_exit();
 }

-- 
2.54.0

