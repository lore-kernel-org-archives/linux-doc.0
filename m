Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC537FF56
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636574; cv=none; b=AtGGCiTQ+Fy/P5eI3tS1jTKqMy/RzExTvYsS+/rXYv9m9NfAl+h37jzKqYy4KwhIJMizJR+oTeNKXsrvJCMOn1XH6ru6ESHsnYY0Mrn2d+hbmBlQrnYJAlFgd8s7PGb+jfRX6ye7HfNdi06bKxl6BEAk2VsI+O9fYvOtP6JjELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636574; c=relaxed/simple;
	bh=vVEOPIoJhhKnaEymhmIy29uvCDgfhn7KwYHNS4eI4Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5ZoDq8SngrqodS8FQ6cctTtjYZfgE/sIBS8FSp04fWhzFO4MI2QQiY8AV1EU/BMZxroxavj+XDZNihWF06a+Cz6qn6txcYkqSmdjnqSq8NBGWgdw9bGEG0gaX9Sxzw7eCjm9Fgqao3tmKJAqotHxVR8G49AUUp7sioOxDhgeDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4A71kTe; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4A71kTe"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66f78cba2e1so2214818d50.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636570; x=1789241370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/3SiLHuAw4CPDUEV3jnJHbnIRJUdzpYKq468IdHDhk=;
        b=A4A71kTeqvmHXtS0FdWbO5bySAWCsbXPcUNFJlFKq310PdrVUdZC7+2k5gMVtSgVNl
         T4HvgYpsHN1lzwMz+QYgyAC6ezxDaTr5SMsi2eEE2Dc+/mbBxdbUvxDZID/1okgjq6r0
         Aedov6NIc5D0FumJ8v6cAe2pQwW4GCjKDl5xeCQm2aAEHzdH2qXrXTBr592vK1szYNM2
         Xw7Kbx6NN46fIXJVvovfa/+RpdCiR+3W8QGmljlPnSanvZ8lUeDi359l9CvTAXdtzOch
         6UiWsBuEa+qfRaES7Au4ILL6875lecxtqqtCy+o/2tE+cgEZH8sWb75z6AefgVpDyCYO
         ty8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636570; x=1789241370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/3SiLHuAw4CPDUEV3jnJHbnIRJUdzpYKq468IdHDhk=;
        b=XSt7C1hhIvNPpc2C9Qp5BJ2PWctlOb0g03pR6GkpZ3zuuo3tJSRWlRGZCn2j8Zm36B
         /dHq0VatuL6AIfUKIAnJ/pdmtvBSbuhW2jJ3Mn8tIjZ0rvriWUhBaGNPvGC+/0HJqwJZ
         Y7JW2rR+ls45sEpbXZdIbgnKpprVH7Jc7E6Ig2oVGNr3krrNUfMFl0zpeDtChoLHWpeQ
         jZY0nOX/N1vHuhB9sp8eiBXWmw8MLFMZpHnbBljgSQn9LXYg+eAVPF+uUiWKC0ha3+gc
         VPBHS3mLlJxdo8baO89cEOtCt6ascpROR0C/GOOvMooCr/JZazFawW/agh3CsPY3+oU4
         hxtA==
X-Forwarded-Encrypted: i=1; AKwUvBwqQeAHM28bRpf0Inq2WElHxLBZuFFTYD/O35U0geSPKwciWYTvRCHryb7AP4jWwaTa+j0lTpsr66Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mdffhuxBAcKdDCWDI/JZizwSUopCmKH+ki0k4rS6W4+nSVw+6Y
	jfTUid7QwndbZRjWD80Ow3egC6b02BrhTt/itwdrqPJnhdj8FQpwrVYL
X-Gm-Gg: AYBFou0DwjDcPIrgRDfmebTDOPfU2kXI3zN8g3qc+EKoedfxwq7W6jZA0sfLlIB7qcY
	RyY1StBzGZxm2NMhe/m0osNh+EXBzCS1Ui5pRPSPhE8gU6cgL8kgWazrjx/0gOeNeZPhwFenPYv
	8138LOoQVrwRXjhDhdZPfa7dPE87tbtGwiL6Va0NXOZJM9or8U2om0J1uvo/2OvEoqvw09/7Cka
	C78xXtSHyoHMONJKPftLhIjVtbOkFs3bml855KgPxLe99LNJT0c/8QueUEnZhr03aRMiVs0FyoH
	v+bNztYvx2WvRDosD7b7/1SIZOr1b8M//x90MBsfPHF98aBWUSFX0cXaSwBbZ2XNEu2fUNmJKbb
	N0Mm17vftDMgTO0VMcx20rMRWXfP5dIPk8z77Zekhq7yYGnyRxTLi1049veTnblZxllw52S1mA3
	2ll6J+vSVErkDkZnLFDKRDJ7NqFWjMmyKzYUDI6q6ig0WmeSVV3gobSki+/ib5
X-Received: by 2002:a05:690e:1446:b0:66f:cddc:44c3 with SMTP id 956f58d0204a3-66fcddc45b7mr690034d50.16.1788636570423;
        Sat, 05 Sep 2026 12:29:30 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb7c7e8d7sm4196494d50.14.2026.09.05.12.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:29 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:23 -0400
Subject: [PATCH v2 02/22] alpha: select ARCH_HAS_UBSAN
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-2-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=vVEOPIoJhhKnaEymhmIy29uvCDgfhn7KwYHNS4eI4Ls=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7WKReZHFC/1HvG4fgzU+6tfbHDcW9j4tKns9Z7X
 97gGb2Dt+MjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuSdrIyNCxd3kfb4
 3phnOtUmsfG/2XOHTnd6va4webUn8HTGaqFylnZNjxxedc4R3T9++ebDUx3Mtt1pJX6LF2nceNV
 yXrD0nKqTECAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GCC's undefined behavior sanitizer has no architecture-specific runtime
requirements. Enable it for Alpha to allow UBSAN instrumentation of the
kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 51a7391869dd..713a0c1cc930 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP

-- 
2.54.0

