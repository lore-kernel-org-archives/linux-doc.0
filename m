Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046994;
	b=XjyghqJwQXGXmxe9RM0ZnfX2Qh9d971S/meyVtO3yApKuH13c+Z7FuTzh01A1ICERg4b
	 KZ7/2W7ttN0Ql0j/uHcUhT/NH5aKJrxZh73Vvsif9ceoizeV+DDpEcA6WlbkvSEuM1mdN
	 5RQOui7hcEAVixS1AJa/hWKjoFUI6R37c3XY/Vjnr8hG01TQjluTD7Dk1YtUnA1GuBmnC
	 13SBeSMic+x2Icx5B6gAKPin+Q6Q8nc/YX3anoxnndYsBtocRCjF6K0FsOO3wS1KkFFyG
	 6H91wCpK21gJaY9xkS2wEzE2N2eqSbMbVTTVPJHy0MMJa0WzwsMRLdVe/hphbLRxj0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=sDKulaAbD/B5x7FunslFUHWUiBpb9S+IzA8zQjFY1MoWUM/tcd+WR+n4f84e1x3WHamv
	 Ar0uiJzdwc/yU1j+K9GKsnXzWVRpqlesvGU1CqvkXHVym5BeYJlo4kWpi7Yo1/ZJgnoHJ
	 KqyJCYc/nrloNGdPWRsQ4zp5958fC8gPPqTaEVk8SZYnB2hEm1AISfgDEqi8no1BOjVq8
	 lDrNEdLThNar1b30tQnNwn4FIUsijvhN54T8hVFzcUA0J7ptt4+O47fRvjDaY7nV5Srbd
	 Ukzize4EV+jmbbvIPEV1mbjQHhppJ1ukt4AUUfIMhCEr/0dJtwCrWHCmr/90QL1sl0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53260A2605
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 00:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F53260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b315dd057bso11709707b3.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046993; x=1795651793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=EhtTpJ76+FnPhG+PiTg1598hHMEeBs8dAYpnflx5oDdjN3405Qwl+4BF8HE7knr+Gw
         4fpmK3qFzpggPK/eifxkZaQ8Nkp4DYQBHOYz0/moedP/klluSBnwanY/otpG8U9L1TZ8
         xMpCvCylHLgiTv9cLZHw/CYT+0wytXHaxK50M3U5CUy3U8XoNmhkJM+tCXrBHcFyEhqp
         dumcD2MgkYrpiBT6ndb54Mr/qJJGj/vzeCLjGfKyudL2OJb6ErGELWyq5OTsWWdEBrtt
         jLaaF8hkXD4kq7wquuECY3gcerl7J+3KB1MMpEn2SbRpYJSc+AL+OoyQMqxvkJVi+jN3
         IHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046993; x=1795651793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=z0TLlTULzLGDv6KzquQsrNRF01Lg+fACcklWJ5tvIypXNKTbZtPpoqvbcmlOpq+xB8
         KkOpJe4XJR29vWRQc/Bi4x1kkNPrqqecSmnibLkpmajDpl4v0m4TVRIX0cbN2aCSl2mL
         X4OS+In3CR/aaJahkdb/tyN3JUAJ1HtRN01yDQ8wfYpQ+85pvXRFs5v/LeQ9fDEMMoMi
         OQoHzy56wpikaPe8H8YOVsPFa4vir7X0kZLlxNiOeghzmMwZL4++BGBtI/sUgilDCV7l
         voxlu0tOkS/PYfJaaZgwv/5SssVlhOpWYo+lZRXJsxnrcends4i7QOO+qYVLy4bjg+hG
         7/gA==
X-Forwarded-Encrypted: i=1; AL+hErE/JuoXzfo/A98rI30Pympq2MzqcOPKSc+7qt5wlLffwTdkb1STMm4vDKZeYXqcgwRfTWcTkT/KMqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YeY1RynRf10D7ZKvWVruZtQqnf/YD42PTq7zrCXd1I1Vy/98e
	1mXleaR3DtjOKgrYoT7cRc5X7C2xptCMXH2EXkZOHeLCWrSWYUWMQZuT
X-Gm-Gg: AZFdTZceStbdKy381JU7rKsXt3p5a6A/36D0ID21UZWltJe60XrdNGyebcJqmZjZKlv
	d6zH3p8F4StXSupJpAAqz6abxDmHsMQgOmjpn9lH2nJBRaWGF+BPAU1F5tiH6xkhKtWW3Kz8RXz
	dceAzX88w8FRTN8iRan/WS9+6misL2fwOvwDT3daxQGvTYxAk2QXkhYTEg6DG1DC3WgbEdI7htD
	VXS4Lr1qrt8oP8N7Hf4p9AD6AqYLDIu8wfropulrVNF3XMhAu/sxZ5beonhUgqB/2iSFnpsw/d4
	YTjksutwqFhtObkfbzhhy3IZrUBZ0z9ujeNT4QW0E7C6lp4HIUgJIRShO+m8SMstmzgw63/XfKH
	g/pMe6t/E9V60oJk5fba1KD6Wwy9LGH4CQtWUbGJIPRtoe/scw+qQskxNwRhBSOFemu7JTA0yOW
	KlKt5R30ea0AW8XJgMwts2Ka7Un0r5KeP5FXKIKHTCZPR8e1V3wtEWQZa/Mic+GaU6GBHN5FlJc
	ABcNVN89TjZ0OSfgOzZjMrJ+NEbkro2n18qzF6qziZ275geL0EJ0+nDPQdOH70vVVZWcJdhwrOn
	8RGqRd1jSKlxYx8OfTBhGa1+t5jlK+y+7ZYPtadhpIK6L363lOPouhkwwcnJ2dYrit8WyJZ/0bO
	bXGoFXwlBOiU3EEDDXEPs2g3oOHN7d0ABE8UNs0pffA/U98oi8QSL96C1TrdUscVBMGgPO2e9aM
	yjhCFLaElC3rQIpYJykQ==
X-Received: by 2002:a05:690c:446:b0:8b0:e238:271b with SMTP id 00721157ae682-8b4febd9edemr19519507b3.2.1795046992979;
        Wed, 18 Nov 2026 16:09:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03091esm26035277b3.12.2026.11.18.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:47 -0500
Subject: [PATCH v4 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261118-marvel-env-v4-2-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XklqMwT/PPvSl/C974Mp0mfRe3/KXuU163X3rMxs
 qvpdvGcjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmNTsjw+kNJuUfey
 XaX0k+rDLh5fnh6md/bdsfpxUl79uqVrHN72VkeJj9oNnukvqD5x371YVYpbdfNUub08OVFPalM
 /TOk20bWQE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 9304ae74877d..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,7 +21,6 @@
 #include "err_impl.h"
 #include "proto.h"
 
-#ifdef CONFIG_VERBOSE_MCHECK
 static const char *
 marvel_env_state(u16 state)
 {
@@ -34,12 +33,10 @@ marvel_env_state(u16 state)
 	default:			return "unrecognized";
 	}
 }
-#endif /* CONFIG_VERBOSE_MCHECK */
 
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -70,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

