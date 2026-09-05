Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDD39060C
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636584; cv=none; b=UA5mFnyyjBqZu+yhimnPgretiY8ZNlViyO+C11c7p5W3OrFhFakBn4AQrmClxTOEzw5tESm63pt90CKTno2xXNrya9lOy/r/mxDBoSjYlNYfs8/m6MrDckHRPc+9DtGdGv8YfZWp2jekUI5w+hSru4Gs8btVJeriyHF3Rbv4rfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636584; c=relaxed/simple;
	bh=q2x0WUHz2r8ueAKqk8Cn9VqXFBZAzyHK+DfKvxu66yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/ssh2wmJhzilfhAZ9nknxq0OtisENJiy0UBUfwbpeY5MuguzjDB7zPqTZ6zap4xggEMHYPcfs/cIgdXhw9lvqX6cSu0huPJshkPsQCcQFKLbk7SLiNAdRXlS1E+Z6jxQ3TlIhyaqicPP5v7yX2g6qFeC5CNQBviXrmSZaIGx04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSyIAuxL; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSyIAuxL"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66e63afda8fso1830909d50.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636579; x=1789241379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEzo1WzJ1Uxj/TIFMsQEInVmXuxuHLlSjkdBUICH5gE=;
        b=LSyIAuxLxlYC9L0DE3AP//fA9jN2EYDhc/0H7nzEkLAnCv/6T7X67Ziuaw/X+UyEcK
         H35KkuST3e1f+AIyr2I/Ur7xi7Ah3SlkWgogMNwc+ndijxh03aUC9WPmB5D1YH4lxQnA
         JgrYDZSUOsgIONndh/NWfcaZwZeBWpOoeV65+9bo+u0xjnw3esm+AEZx5OHwdkZBVw/I
         A+pBNHUqTh/W/WdJJOtbsd1voYjSfw2Kgbm2Jq2aoMlHsr3YrlXBVMy3YK9ve3Gir7lN
         mPMy2G5MYJGSfEi4S8IiRrIr4/M7kYnxUmFx+8ljy2IiEibAlC1uYsArtbg+RF0dKVNZ
         RV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636579; x=1789241379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEzo1WzJ1Uxj/TIFMsQEInVmXuxuHLlSjkdBUICH5gE=;
        b=Js7XgEJEqJM6pQp3hfSkJTpWvZ2uIovbVd5a9jcxpB2YLYV/18v3GgYfboUdvqf5Rv
         5xc2x/XJaJVt9a3dbLNIreqrCXiQKy7ulSRrSm5HkVq0uuojyZM+S4RELmGwBK5BpZ2T
         v8jLjw/ZyLX8S130yYGdFujwHVRBJu40oWCsTxR91+mp0FOcSaUHXzA23r5lwIv8OsOY
         0K9xQNaUNyJFdzCITZncoOOS4XRNaAE2yZxy/m24mHEpMlpzWczTSeKcFcmHov7GXqCr
         0EoM1QUf6P0AfFz+rA0VbTSjEs4pAFeSTP2iYv9pdL+gUu/KVMFg/0kc2o9ZYrLcX9rN
         ujrw==
X-Forwarded-Encrypted: i=1; AKwUvBxG5nwAA2nFFIbHLKp/RyRy9ra/xUm7mErQhLX8yYoGOSe4pI84kV/0y1/k1PT1XUN1Yk8ZiLVw4LQ=@vger.kernel.org
X-Gm-Message-State: AFuF++npmF8skkxBxlj7aIpDEk15PfsoWPn12GZnAcnBrZvlgjI8jJNK
	XO7LvcXKgYOVmEs5jqsMaU3saJiFTnPniZwj3rk7D16nNfuUp8DcGfd1
X-Gm-Gg: AYBFou10ZMfnreySriEpRLJDodgPDh2Ukv8Z3abwadTQmrXagjFnhwCJk3eIxxRpVBU
	ML2k/DK81t/qsgMdtczIQbzBhFqFcohxFAvZqViFMIDHceSMcOfheIHX1payQ/X/OiHUr+k9KpM
	zymmMoUiYKd8m03IeCwb6nGYk31YFWJoUW7tU9+MXRiLN3cwTdz9Hi/xvrRQg3vO1rbxI17bKRI
	HvK/kuSn5p7hHBn1j7nr+uQyIq264CjE6toxJYmkl+BuI6UWCABlFBQWUat9aTFRtZtbYI6jr2q
	ZzeVCbsgSCeJmiSQGmB5TR7FuiurIDmsDDERuN4INjmXGo+zZ9Yd6Q206KWPpGwW+y4kmqJ8Iwi
	KS6kLYG2RvqgqZoEhEhs9KQGH8iZ0xlif///sRYYyN89DicX4VGvm7oiPI/iRhwzvAuTRi1YY9p
	tH/TxNoKvS9TKBdxr41Sjnp4h8CP59ZNC7yw3fyXXoRt/J61+22ien3JyPx6R7
X-Received: by 2002:a05:690e:14c5:b0:667:5cde:6f36 with SMTP id 956f58d0204a3-66fc1bb8014mr3388782d50.33.1788636578685;
        Sat, 05 Sep 2026 12:29:38 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8894sm5071491d50.1.2026.09.05.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:37 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:27 -0400
Subject: [PATCH v2 06/22] alpha: select ARCH_SUPPORTS_ATOMIC_RMW
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-6-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=q2x0WUHz2r8ueAKqk8Cn9VqXFBZAzyHK+DfKvxu66yg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E6WtGqS3pvKJfx1ye9TR9bu+rTb+tTCMxrC0+Nqr
 zmERf541/GRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXMB1g+B/0deOFT/
 cfTA/8meDMFqTk8UHidPbMADf35Qc2X5RSue3EyHD2pv70ieHKQsd6TS+0Cqa5n4zMteB/1iYnt
 Z49VK/yAgsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
provide atomic read-modify-write capability, and already selects
ARCH_HAVE_NMI_SAFE_CMPXCHG.

Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
locks rather than immediately sleeping.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 032c23f979c4..d039b7135d18 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -14,6 +14,7 @@ config ALPHA
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI

-- 
2.54.0

