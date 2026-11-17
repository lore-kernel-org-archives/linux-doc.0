Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884357;
	b=nLIxuzoK0wtxm5in0rWj4qT7t0LEwVdgHbRKsw63sA50tsvdpE7Y4B9dWmfjM1GUt7ar
	 c7P+e1FILQXqasbbnFk4vM4TcX9JI0K30/2rrIAV5y5FxT63NUvWhNXir8+YJNpz4zTz+
	 NypgC470HGSqT7o645tdkZodkHNgg1FJqODEP0nzA3S3VEtqR5ylqjivTojxMmwZ6/sSO
	 j9FA6AG8I6feOG9WUwS5qc6r2gM8hzwniNev+CSlG99SO+l0zJr1j0hrNKCiWh9Ow78wG
	 HvUEsisqUNgAnKli5RM+08S2HafXmS+nDGKXy8xCPiFUhtacFUCxhtH1hDxUgZFTHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
	b=Jyp0a77Wa7Fbm6f7phCcy4tLPLU2rm4nRN0toHIJDtLxY1LgHiOAaOV+EpqsS6DgsWXM
	 CGcZBSjcpOs5oNRG78JfEs1whXlmMis3gNM7jZMyvNNdEOcCbvHHYpDjXt41ykz1cKiMv
	 ik2rSw5fuwq9XAL2EV7fT5arcZ58CatCQcKd5NlsX1tUaiJEwOzaCzxMteUMY3iCPefDB
	 b/xEx4m3no7nQN6Thx0P75rPs1i02os2BPc9Vk5kpDknp06JPerhYQ7oM1xXPYsKzW+wh
	 f022MFimRcA1Oxter7vw1J3ksgMqT7ciPAO3/8ldp5S/0LNuqa8PPJcVMhREGgk0ZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19590606A332
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19590606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4e246acc2so11511117b3.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884356; x=1795489156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=GufmHECwABO7UKejS9V0/k/4iN0Nfpe04t416Pjq799GhiP7h4Cak+ke9GOYKXHxuU
         +Q2d1kFnb7uw7piGNFmMPNdtdd7XU8QfTYP1Yhr0EjegxbPWMwMmayAc3TNkD1Rk13uV
         Xs6sQz1YggwRBE+NVOAppkTBRCnYckQ3sM84/44MLVceB+WcvyshHqNAPaDVCv2QI9Ou
         rLMHK87Ez/irHc97+5TL9v4CypZohb9Mr2zzDiuueZniQ9qmI9M5gfoMT3W1yzcZe+JA
         Qa2MzVe6LqdpGfyxUNpiCUzWAO6/Hf7rsWwNNECCJUsVTK7AuCOFVysomLWrGVpEut3G
         jSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884356; x=1795489156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=B/fDqpDNp1pkNm4aBc6OrLzBMg9cxmvzJ518g7tmRSBEpwEjnCmnbp5Uk5KGV77c65
         gzxOGuXZQS6GrMso64LDi4dU9zDTkJMwVgt66UTOLNjluiTO1+mtKsqLcE2rf/hOLy7D
         5WNNcg4wVFI5X6cePeUWNo3aAcrBXwnJnhMLNDpByUoOUzBZdfkSA7me759CC1XaBygX
         dH+PxIyVej1a+QtfA5jTW2gqjN8vqMM81+7HlynH1U+VVfPftmYCO/x92F3moWjJs78F
         iRYweCdd1vkWP9p4FZDxjjZZ/UrgqwuaJq6Ss2IyIei6iNNbQzftj2/JsyvATZvHrMBY
         Q7CA==
X-Forwarded-Encrypted: i=1; AL+hErE7aCZO/zPwcMbEadmV63akeEWyx8lDojmNj1fqm13KMsIkkWlDZblQH/Gia0xz409H5cbAXbu04MI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OCURstxyIMX9hsRxluq5d7MMXLJe2YfQRkt4as954vuqJxKsv
	4BWOal93MMtRw27fgPag0mr/renMYApW8iztZF5YXq0anqapo8rvflZWpA0m6Ymabq8=
X-Gm-Gg: AZFdTZevWEjRuKTwMob1Vv/119oVfZ1F67tgGMhUoedtaWb11JWvp7Cbcj779uaWRcg
	Vg2rmzSUcWawHnqotOXuiGKPbvnMd3Hez8PH2eXEBhgQk/4CU1nxl9T0HZOoSK8piRbBROuFpD2
	aPfCe8mpfrgSl3lEuBrFxA+3ar2ADC83I3EpGe0d9o3KBBKk61CDYAB++adZctWe7u10qdGCHDe
	GeFr+sfSIlpVsQsdWm372w2vyoOjDh7C0IY3dZzyZHBSWgW3jTA99tKEsB1p7GThcZEi8oq5o+F
	b8ZKi+q5kIqwbm2s+SvgN0izhwb+jBI3dH4/SuiN3OujHalRH1h2YE/z/TtZT1jmGk3hUyxChcw
	7ReJiI2UgO42S80VgdurKhH2qZdg2Jb2uEbbit5zsURi2/0sFaq7CRAJRX9IwXwtRDz1rOJrJZh
	+oiexeupb+rbDAIExaoTzzpFpqEalNNz6K3n61JFJMYziKXROFofSnuk7CWstb//EP45EtT1C6y
	dw1i9iILyGO9bvZvyTBcS9KofG+0FgjswQq50Sr4KmpCB+Q0Iz7L2PNzCYRRJ7MQmDp3nLAA/Vo
	rvUKYS8t3zMgaaVq25zGSW8o71elKluWAALXexs8GctAsEEnJGa0EdghCFjX8UhOgPzZvQ7IOOw
	x3YEbL8a3ETDEtTF8YizO/p7t+TPIEROStEhfnOZ4JHy903AhzdOuBYEUzluzR8skJN5uDhDmYR
	KF3Its0pWbF//LVp+2Xg==
X-Received: by 2002:a05:690c:d8b:b0:8b4:c71b:e4f6 with SMTP id 00721157ae682-8b4c71beb96mr41119167b3.3.1794884355050;
        Mon, 16 Nov 2026 18:59:15 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec3079fbsm14326407b3.41.2026.11.16.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:14 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:09 -0500
Subject: [PATCH v2 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hvA3Q0T5bLITKm5NNV73hsX++cwWKaI8fp/0V4p4/zI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oj9XQ74+/CihkSieIccSG7w9892PD6MkvjTeNKi
 YOFRwQ6Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYagUeMDEuz09/9+X
 pB71uTU+2kCX/L1SZucD1dOfu4QsF/BWlOFS5Ghk5no+WK+95mGB753qu6xiVYyy2bN3Mp63RmK
 es7zFUyjAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 85f7a56816ce..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -37,7 +37,6 @@ marvel_env_state(u16 state)
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

