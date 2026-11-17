Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939215;
	b=V+FnN2qKUUNGtCvQ4v+uoxnG5tPAOD22bfEZju6JMJOu6BeRFwfN22Xn+NWECh9TbNcN
	 St5lmojacb2Jvl5Gkgm6bGbnGpb6UAQCyXnTpJc2IsaL1azO9R5bLZZ6geCTjifJmSGXg
	 mlHxW9zC2usSh8gSNo3gu1REdtuTA1d5E7WPkOoU7MZ1/WyKwUZ3d3o0Gk+i2zqC4mA7N
	 sTLHJG6EyzPfe18e/5nldxKE8Udb9eAA6JzZr14cW5f9+aWcCSUWnqDIhXuSwbIBYVdjs
	 wFmpGzOA9RiBfwekPzIptOC9/NIf22UZHw+Lrn0Ph4OuTh/AOf39M4QHiZysqnoWqqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=bGENzkVf0wFrf91WzryA3XlB0OEHUJEkXBJZZO4L4nXUYpKmmUGB6WEHWzkDpBJyNJYr
	 j4q8tm2pRCOaBKS6UJFtB+vCZxOGIpgwz/4OP62otWm0/ZvMwEFI8NcEBB9mLiEJwfk6d
	 Dyial3Ek5u+Z4iv76BQoHKAMDIMUxD7m6mPTV7l1kH3juZ6JVOru1PMv/bGOWNp83zUsu
	 r9+EkC+L7EZyxWQp9TH4PEKHxvJN8ecAMo7zHSZpETs6GN4DZaSKKskZfMt9JlXtJY6Ps
	 UHRd8sx/FqFBsHtHmvEtFHwvSEJhduYhRNnmuxQqK2lL1AL6AtxGjwoaIikQZVIRGJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rqr/hizJ";
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A649606A89C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A649606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rqr/hizJ
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c58f18765so4033738d50.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 10:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939214; x=1795544014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=Rqr/hizJwM04N5r7rdBlI1SrpCZm1YU2VwykcRD4dToC01j8O0eiPOi8Zfdo+cSsEe
         KepkZt+HzaSliry7cfleqlm+vsu4kjci8eNfqf8ZW3D7n2FU6NT5ga6OyRwovGfvl7u3
         moafL7fNIaKLFfV5rLTysxDKefHgo2Ste3Vh64H4ghp2hsu/BLV6Pa4fKa+pUfA0nXT5
         POTyodqTZK1gOQDkzhdPVkul/bv3zKZlZuhLJIo88VWu96PktIZfaiYanN37OPuObyx9
         vgeQG5E4qagJYZGOTrtTjO4v+BZSFK2wUK8eHyxLKXvbbb1hzVoVMMYRSQdGAcRYgpct
         78wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939214; x=1795544014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=MWLYCx+nsJPHBuDR6qG19kTM4V+3un35+Jg0fZiApNHqWW64k/PWPXC4Ij97Fdkv1T
         d9c1y2A/tK9kMliF55ZKR7A2jp3wnEsEvxb9NfNy0to8gFXMGJyjVkBoiVGzb88S3pqM
         JUUxBdDniHScuXbD4lXzMVViUr9pe547i3YVsqOagPBK3Nk6hg8VDYoxBoTCqr3+e63y
         dWX07JP0lD+HfeIVPuJtnWHKpJLaPJfAbBagwWS7ga1sxbsmI7rDKr0LuAi/hUc7etot
         HPBdlmEiqTMtNmHrj6xZm8bGY1utpyt+n96ht7c1yD9aMd/Lg517K6rDnnMOP/2ArV9E
         gKYQ==
X-Forwarded-Encrypted: i=1; AL+hErGz3y3/wUAxDC42rpvaMyJmRjK5WNteNqWn3ayFjLy32MVV2rgEwW7vliwsux5vp1JOeadMhfhRrl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2XuVv/Ot8PF5TGyAGTPLkhAb37dDetvgE0y/DY/h77d0Np5WA
	uKywZ2SCBrJa5Q6mHMjtSjf93AfDMZVOaBjqvJbh3EToqZr7wnHCYhg4
X-Gm-Gg: AZFdTZc990Cht09JkZJ2mM/MhJsR2mBP1OrMXI9xdKLWXlEiAJefBEX2MHAqckOY//K
	8IAEECOu9UbM2+YLzb6CQXAjSCXdJMlovT9eM+affY07QKy2AeZ3nvIKVJpjExxTNndCKsAZYap
	f9m+du++5OyxlsTydlzLswi9VyJqxN76k6tSpp5PSceF3VxUN1VSb1CBk9zUh7Ldvl+mm8/xhMZ
	gnSyz2Xh8bCc/fI8m4zTAqHFAyMSMrGZipQRKq40qfcmZbVg/lvL1m4Nki4HYEI9Jz2prYnQMzu
	MYfO4j9/hnpGm50n9i4bcmElHvPd/Stsi2ElHVdXZkfR6depRtzepOdoFfXnKjIK/PRUSoc/E/e
	94iVCWdu8cbqtZixwb3Mep5ovqjis8aVZ3kzjszMD0KTAWWU/HRphoiEV60DicBnTs3eL8PYxFE
	ZOo60mO2hlRhNV3kVgK7EFYYE3tgFQoZmlcof4c9XSGTPGoJkLlQCuXCt4iH4bWqu+TvrFVzFV8
	WIhRMD/V/t8ZS7FxZ9q/9MXmf2jO5Zh8/N0i70Heb+3oBFnCvTMFMhWnJU6c+UMkJgRqHpm4qB2
	pK3DwdntZLekrhICxDobXyVV9fJ0Pt9TFWkzSIpSqxj9R739of95Oqv+qVcTGXO+L8y5P4TocRK
	fkYXSaSwWbmlT3q3a8d4TCJV2KanTmviYm7n4+aAMBCh3kFOhU4v209OvDF2/VTaeFdgyHoBV2I
	mRyNpjDHCq9cWZxcDoDw==
X-Received: by 2002:a05:690c:6884:b0:8b4:e4ec:ce6d with SMTP id 00721157ae682-8b4fed78f0amr379807b3.73.1794939214002;
        Tue, 17 Nov 2026 10:13:34 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed5e0sm269767d50.5.2026.11.17.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:33 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:29 -0500
Subject: [PATCH v3 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261117-marvel-env-v3-2-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPS4do6tJej8Qo3K4pUai1r64iQ/OB6bvq06wFnh9
 enzUVa3Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaac5KMDEvyCxZoVf
 DXn7AILdtx97zkt38x8yqdFjlJ/23XMjfpfcrIsP7flWshMtsm+FV29HNHPRM5XzcvbOWcLY5i+
 nZVP89d4gMA
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

