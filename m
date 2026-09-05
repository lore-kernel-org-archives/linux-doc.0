Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F5A30C618
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636609; cv=none; b=KlYWPbTOqt/yt7KSRmOefW2RD2TafZ6pCoOeP4ZFOadaT85gBuORGej3ZjJcOSxXAmWG1KcBR2GjTCztGa3jE11HrxRWMsgv6kXB9xvf7xDKLrKBmRAO5QKUa/rkYaoIX8TeNXofMNl9gUtQ9K4LaAXhc9WiFJX/SwqQ9zVuKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636609; c=relaxed/simple;
	bh=yhM+b63vr5V43kcCXGQ/uSxYgWi4ForYPSYOShFRT2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KslBLVju9kKPnkiY9HQuHTiz16DY+w8P6gCHWzjEnzhzvXPqE782E928gdv+jQo6LgXQsl37NVYIWfag9BkaYZ2EUa9IGZpGZm7XBxfqXHPti8o4DDUmTrLjovEKnP8TFkkdsWeWS2IEBQnLRGMUficJPUkjQjOZ351hL1NzMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVGkYEd1; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVGkYEd1"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-855a66e5b5dso17961137b3.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636607; x=1789241407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILXNuL/80wwzYLTSp5b5rT1wBP6MxeRfeIo9FlLJMtI=;
        b=TVGkYEd19brnXS5SZV1+iCVFC3LoOQP8kcZ6x2qM6uqV51Qcol8l3c9NgiQPEHafoY
         muqePvEowqz72AYLeMoasq2+c5qhHx0qoQzQfM6v6GFVf6UXkDhZd7Iddx+kOliyJnZY
         bPSfva1ptxm4GCpL5QeyM+duB7juBta75d8A0fS7/2neNteya4tkYofpdWrLHmZ+tliP
         /uWOF/2ALfVkaQp6+llSIUB7AHlLgcpJGB2mrQs1ub+bHaL+uXNpblFl6MAfmX8Ogpof
         PyAigRS6+5Kfm48As4dMywi2R+ec5RGciIsHeIOpaWOUXYI1ZqJeYdR35AvKchQsrxiX
         YW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636607; x=1789241407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILXNuL/80wwzYLTSp5b5rT1wBP6MxeRfeIo9FlLJMtI=;
        b=cyIwj20EPpSlXJrqZgfuZe90Ae7+mwDpw7yQu87Z1tPdr4aa18Jxfz9WLWjrZ01q7y
         LzV+Tj5ahuhfzXErdihULHB/pSP2u2NEy92zXtF8vHi/B1XpZfJEJQZ2aUNazrS+nNj2
         o/fkc6LEOKdaLwtUjQl9nFEjNfrYlu4VaQD3gzRKQA8JTiEzCw2MSgqMe9zV+gosaiu9
         SHJzBkx8ut5IQX1QIbqg1q2qvEN67C60teBs0EUCsr+CMWm+9eUEUDZ1IADd/edy9/It
         yUdNBJ5KSP9y2OWnPJGCPfn7pV0/wJl6y9NPsB+sLw03f6Zq5+SI368D4N0Xwy18daXb
         /NxA==
X-Forwarded-Encrypted: i=1; AKwUvBy/6Mf2ruBlhbJMReYpLY+yPCjmqPzCZ8absl/o+aiq7FI7h7j3LzG/Qt5cuX/jD6GfLNMis63XJLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k6baBjmh84yz1RuA27KFu8MpTysDHOvjDHBzadN/4EtgIMa79y
	yCfNtXKSsyeNgdHu9+sq3rAgzrn2CdixCV7KOwyJjnvqsYsjcp5LdR7s
X-Gm-Gg: AYBFou2rY6d+8mIseVWD2wM2uO9tNUr0a5CEQTjwqQ2dG425/jZ98Gf81pBklVWevAY
	OrMEoW3VyJWVYUVxUucIyhSPUvOu3ZUVIVc/PELYs7otgyVDWeFCG7HCNwfZDB23rVi/8I8VjTR
	7tcuD03BahEsPqh/PgZfzlQdaesu6R0ZDL1papnlHPzLg9OZDJWEBJEkaGUBhiherfuKREdWeVx
	rNrfN0vDAWTlHCcpJq6HYNhcNTnfNWwresGCrgJU1s7QLWEXjb8RZUeS46mmKYdbpArxsncVHzN
	d10DIn4ujhNdLP134tDAJFMmplR5VIdHF6gYHCmoksZ7R0B+MlAT6eOb6A5vvnfT0cCF6u68Ur8
	mKrmHDft6mOwpuUQK5djMKO6xPjkI6fBTd/YshIwfbfd5toJyf+KvQCPE6AVBz2gFiSLAPns8Qa
	dubiNsMINMS0V+THd32qH9zsKoRplPayQwf4AlSOp6yPzXmkCbMFXTfNqnZyMLcHtWeyUpUc8=
X-Received: by 2002:a05:690c:6703:b0:81e:f5ac:e40 with SMTP id 00721157ae682-8712938dca2mr61150397b3.20.1788636607152;
        Sat, 05 Sep 2026 12:30:07 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714c0e5c6fsm43788877b3.48.2026.09.05.12.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:30:06 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:40 -0400
Subject: [PATCH v2 19/22] alpha: select ARCH_WANT_LD_ORPHAN_WARN
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-19-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=yhM+b63vr5V43kcCXGQ/uSxYgWi4ForYPSYOShFRT2k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E5xNlpx7GPC4W1WfCLresMqjrzIuT3TKF/17Q93j
 rg/PtncHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNNQjQjw/pNljXTw0
 71Bc7YvUE4cVPIMuv8Jd6zfawVzKyFZr96u4Lhnw6L3x1vU3UH1mq/xHdX8nLDlltaSn4Uy9+xz
 /7Das0/fAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

With .eh_frame and the relocation sections now placed explicitly, an
Alpha kernel links with no orphan sections left, so ask the linker to
warn if new ones appear.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b9ff67370877..33b51bef5139 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -40,6 +40,7 @@ config ALPHA
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
 	select ARCH_WANT_IPC_PARSE_VERSION
+	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
 	select EDAC_SUPPORT

-- 
2.54.0

