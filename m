Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9583F5BFA
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787508; cv=none; b=R9tBJ9P1+mEFRNlEZCLNkAfY5CCErwV+Ac0olQHAu+1G6CN3QnZ0X5WJI+xNauCcmZiNQESA+qysQ8RyvfxXVu0L4p8q0/ot/NX3lc+iODnJMyLjTVlGmfoV+DL0tQOQrXIlURsgRvgpXudl4JyPnsZXDTw3BexYagTs6A9DRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787508; c=relaxed/simple;
	bh=AtNohlQ0WYu7yAy0ZDcPtcuY1C2JeuynsMtDfbhK1Oc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxD6IEeR6nLUBGDmyrFRwxWASMPkIBh9WiVS3Zc1kNxe27qq7pznFd1ZZ4pY4kmNQlHVhR2FLbss3+TD3i057iPcaWvmlKiJEBsehv8gx1oabyu7rKPcrZ4eT5MGBtp6cJ87BkVIF9xwSlBe0SVSTQO/V4C/wm9gMd1GbvT0dhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvOy8Eb4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvOy8Eb4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso6071975e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787505; x=1782392305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=AvOy8Eb4O66msKeiGx9eKXsBNctPy7nQL4W2hlD8s60TyF5D1pddEMLn3117zVTmxk
         YNvSxXaMZbPe782JNFuvTz1oLtsLItPH0wtYxoV47mmqHtQjs3llYiNA4MHwhGl3sjNR
         2SE70W4ed+/o9dqqdYgTvZMjINPAHyS+gkKwVov1wMG138uWeb1G2FMICYPxCtBGGyYG
         MVXDi1qEflcuvTKuEt9y+vdQ8P2i4GTMVkzjZQgjdElMGPB97BPAnTDOycQfg6weUgrE
         Hw9Fk2BG9DomVaVBRqpebEsGO0l29Rke3mxLDvd0tObP82kSQd+WivKesac9BiGVagxm
         kBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787505; x=1782392305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=pzK6WPTGpUGyKJX3Qb4mxsaM6KkpZcxiGVIKxpuu0WFAJqmRc5teeqyLHB0dJ8yQTp
         F4C9BOwMD64Fkg0ex2oYLbNhi/KeWcBc6ESEvB9G5I6Oll5iQREKekvS1VxoyR/gAWPw
         dxvr2ejDWDUH76eM2iHA1sSl5n2t7VzI6BbmlQ8zXq+xh/y573zIup2+aY3+XSlu6aaK
         rSgDmKDHMepL1q/o1N2md5+cW3q//9IX/7QPcXQ+Kzy4aNHVMdPn/Kdld7AQPPBttI4x
         GNqkRgHjbfxIxSK2p9+KY1uNy6ZCkzD3ZKa6dUL3aGsQroWQ1upwbwQNBotE3vkgN25p
         hK3g==
X-Forwarded-Encrypted: i=1; AFNElJ+Jb4Lgr95+2G4x0qNibwi9aLCgS/TcDEMhMloQYx6NMxJvJHGnR5yB6BuKbWYP+KoIT3xSW1Jd2+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4V/abpQ36FPlqDmZyJFNhBs46RTBBFNJe16ENIC5z4Hj0GCzc
	91CsYXrMpIGCHWVzkRp2zI96O+OrkKLKN9O2ZP7eZ1FIw+S89DFPjF40
X-Gm-Gg: AfdE7ck1jwO61Lj7Ytt5F/+HfdACVtxxVvXBu+s05S0sRhtXs89NbxmB5aycqY2lece
	aH3fILwdAflL2910XY19nd+5o+rTNDrcWeoI2FktWGpYGSy1/gKrLiwfRkzpkPyCaCBvESv545B
	R0RRyHa4bjqPRTg1DBNo2iul9D7+EamcQCQNNxl/LlCcQkD3AaToD/KjA48dEYbpIZbWiSFH912
	Tz4wVJhlbij0Mjfgrx1QMp9i5u20zlntdUuGbkQMkn/ma6IfqtWIHmgF6zM4JGu7L10iLH+V6Qu
	F+8hoOdmqoUA8pryCtqKzFeHOJpml11fQMbI3gry9UTBc4qLLlI8pRLI8SiYLdw9bnzg92i2VPA
	BZcVRA0lp3VphX4Inzxfw9v4YXMa5V5ngk3yiSyxFMOSkIoG3/y3bKHhqklZMcThKfznUt7fdFS
	QFNiYcdThvqrONNN8yfrepIjLQbGxcsIIn7VzmXLcaEBjrNBdQcEW/YslLa03pCQ==
X-Received: by 2002:a05:600c:2947:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-492333f5dbamr93229425e9.10.1781787505189;
        Thu, 18 Jun 2026 05:58:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 18 Jun 2026 14:57:15 +0200
Message-ID: <20260618125752.1223-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0

