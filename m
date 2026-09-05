Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9F3BBFC0
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636612; cv=none; b=ehynwrjbAfqj8eHTQWFGZRKF0N2GtjjIZFiSa8/2AP/+8WvgC2xgr4fHwZ8t7dWFX/ELGxlDLjGFD0Egex3a9Gxq6iFDsHZL6EPbPzCpviek0x0PajhWVEVhjvGWMqoY5+jQxQycssV/VpqOP0Y4Dyhf4WI9rtSiiwft7Wl3OV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636612; c=relaxed/simple;
	bh=JPhW0tJqXaIn8Oiipq0xwNjIp3QnpGEFXpZHEWqLlVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTbvRphrJl7xfTORSMoz2gvT7QGIDqtmn35GNfN3XXvtFjLV+W1IUtlxsjI5QT5Cdnghpz4ccavRH/w4OFd49s9Sa+ggJk8i7CJdqc/YzGC80jFpeMaltNEvmM5nRxVhCiBobWrn+edhr+pIueqlivW7IbF37RXmlLrAZi88NHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENJa8j04; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENJa8j04"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8706dfdcd4fso28690497b3.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636610; x=1789241410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR+LhYK6Oy70AMhIlonjkFs7HP8Yt8BezTGlAJPcneQ=;
        b=ENJa8j04hN7geklOBo0Q3UWejP7zqZ/L1I9sfqHzgE2MqbM6Fel9FuyJ9Euq6Rwu0D
         4qaWcsZgkCBiopu8TMknH8ktVA5AxwzOnMkV0k2L3WxtSKCEetXCk7PlIb4gPTiVIxmz
         Ievhv2bf8ccYaP1uLkDABcFn+9RZyMg3JEOy02eQjXVX5uiHYQ+5o1RwNEVHElDpIUNy
         6Vs/B1f0SwyGZW6/6PuvJ/aYr/qexjj677woZD3LGL06X8OSnx1znjItOTSO0toDFqvx
         f/p5IbPGiMqReOJO0MpC+1+uX7aqn3yiCyhre4hC75B2m2f5lQVJ/AyPcaUJUHnqwZ8f
         gvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636610; x=1789241410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+LhYK6Oy70AMhIlonjkFs7HP8Yt8BezTGlAJPcneQ=;
        b=VixnPGBT5mkd1Eoe29iqwfp387rRE9CVAJV3SQfXwtUHSPr38kUIf0qQmE7lbWgAiW
         uUg3xNFR8VCGf337mVqWJpK6DVKL7+q3BdGa/oEoJfRkC8RfxA3tdlDfWiy5ljvmGwOU
         WHviPQCoVQ6kKPaWos6Mxw2/fzRvhMx0TyejoMr3KJKb9FPw6uPdyn+KJZ9FzZfoFYZX
         lg2fiIZ/Z5GeJfWVU6me8sEvx8ruOcwcWlQMzYGPVJv34yVAicFA/xvdNmSmNn6rVELa
         BLc2NV3FyIIxTWLAmew3vUaqpaw8zXrUXskd0u+AId6ilwcgTqqll0y2qvMBRL6nfV9Q
         t4sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPGFsoqXOpFcZq7YbRkpEkn5lcLdTluTnGCSEo3ZHpdLfA1V5NsrvlXOFudQIpwNOEyvL/TIbWOAI=@vger.kernel.org
X-Gm-Message-State: AFuF++lgiJZs++RnnDfTgwPY3jFRBgIlTbYDqDmUO+OZGR+IH8vDfYIb
	C/fUPShzOyA3yFJmFbVEuI3jslfLvWj4pV7oYzbi+rznXRXi5c8nCG6u
X-Gm-Gg: AYBFou0YwRFHO6ZfWkne1UGm701G8yiepXf8BlymsG32Kov4jWwn/hoziy0mVz/6EZs
	l8y8V1G7ZfW3vTcnQeESUwY7fZaUY3UAl4S7iUDuGe6Km9AfpBnyk4lrwMqK5XD0ldWiRvFTfwg
	KvdNnAktellCH6WGwlDzxSvuWJ5TqxR6iVwze19d+scqyrcGsFsyKp61IuGYXH5U1fCInSjiJkj
	2WAlUo7Gt9uSEF8qF1Jd6SEHnNsw8PsG/YoMWl2uDXwUWN61hroyQWlyE0wZqT65xDn9mia4gvj
	xESZgbCVeyXxr8JhLGpdjUmdU3x0k2lzITsGMPkbaCG2oUNn2v4GAlpkWPafd5ydPsHre9MLZUW
	rcy/7oZaEP2WK2n42iZSQSW/OLKAh1xWTgIXBEQTTDaLzaPBnnFC8JDwkvZVSD5ZFnr0TG5EGqX
	zJuiNJsHKfUdTV7XDY8h2M1cqiZQNZSKqqv96eKTBfT1dHdt5fsYtf0AlBjHzokW1Ei1Uos60=
X-Received: by 2002:a05:690e:241a:b0:66f:ae72:ddb2 with SMTP id 956f58d0204a3-66fb595067fmr3474531d50.16.1788636609633;
        Sat, 05 Sep 2026 12:30:09 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm5048420d50.9.2026.09.05.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:30:08 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:41 -0400
Subject: [PATCH v2 20/22] alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-20-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=JPhW0tJqXaIn8Oiipq0xwNjIp3QnpGEFXpZHEWqLlVM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7ZFlC5udjK8G2+QNjblXbq+8wCGNa9X8Aisdcjd
 lKGzmeGjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmUxkjw8Y7bG+ji6
 30DMQV2kxNXgs9dNDgmlBboxzn5FQe0F5Ux/C/XsHX9Ad36NL+hrZzSm83227X+yEntV9rnaGak
 HO3Py8bAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

activate_mm() on Alpha calls __load_new_mm_context() which assigns a
new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
between the ASID update and the page table switch could see
inconsistent state. Ensure activate_mm() is called with interrupts
disabled during exec.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 33b51bef5139..e5611766b6d6 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -39,6 +39,7 @@ config ALPHA
 	select GENERIC_PCI_IOMAP
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG

-- 
2.54.0

