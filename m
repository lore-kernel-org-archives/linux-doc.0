Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A406A21CA03
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873250; cv=none; b=YUclLAbZfCE1BWJAC5TN2KyRDMDiVgV0AclpObiwZf55Wmjlt67qz08/GpWUv5WwTbOHCnlFcSHqRuJB8uHUlvo1UyV4gYUGi5bUlExVnH/hP9vSm6Mpody+D8hCAN2NvyfN06r/JroZsS04XCoCp3gy0Q/F3Nk3M8O5fYNJ3PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873250; c=relaxed/simple;
	bh=jIVgzPBltGNZWpTwHcxqGn5dVwFUT+l2cVu5/6J4ouE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZbMJzTnUoy41g+w9uGWg8uNQ0pWKjwwHEg+oPLZvWAytjJU3IMtY7K//dwgHULVES1FoMLxWXzSHYF809j+wuMuymT8WPFRHi7hQ0gIHhI9Y8oRRC2Yh/v8IX6KmjqyCCAf5KxrsPrFvTFYdRJnRrC9RYs31DaAW3HwQK58w+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0jz7GDE; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0jz7GDE"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5674d8be45eso116521e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873247; x=1774478047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSVG/Z212JOiayg/u0tKfi71Tksl0qFTwHTls7loQis=;
        b=I0jz7GDEEiCyijn4JZwEVK3TW8ax6Sho7X/rwbtqQn9YjcJhXvXBVGGeP123Gnhcll
         5fntZXqH/ISCLGEFfM92vfUxuAvIcuKLPosKdS3Ut8GjxorbWFrtnKkX2PJ/PXOHRsAV
         d4vhwf70K9BcxpsWI1+PzudRZZhYm+KXpCO8gjc4Ax/sKs63cEeETHxyI0QbklmRVtVD
         7SfL3OqTaSDmrh2D2UIPyogYyerVoiSOc+2jjSLYWIeB/NpXrO9seJVkf8zXb+VmE5qi
         Y6k0B5VdVWuyntP/isucRnW0L+N/GX/2lSyXo5uQOVdeTtOD4uZM5kyQ5eLjO6kdkc0e
         Utdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873247; x=1774478047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSVG/Z212JOiayg/u0tKfi71Tksl0qFTwHTls7loQis=;
        b=T41x4hRc+dU/lb2m4UZglmUtoma+Pyb1Yzh0fEtf05qQeJONPkh2gVEp6cnJYMGiYE
         7nkLPOwWyKjwhdPSfzh7ijsXChj+l59SFN7bmLHW/TaVYQ7ZRViLVi1Q5NlSTTspy5Yt
         tTFsrnbkcBk3+z7Fhrk0SiPSrxP3/tnpfIDxcgwSPcjGGqSjjPmv8BYPCV09cLdyxCTZ
         A3J7DUGMimKwFA+jyxzVhumhUAFhsuat+t241cujqucE6r8ud5mTo+YFVOKjviaf8uez
         DECocSTv16onWrkD97bEgc34LWy3nMWa5p6fa/qbT3YgE4i8kxpqD7l9SZujvBO+hIV+
         2LZw==
X-Gm-Message-State: AOJu0YzruhjkCKQplohunqWmTV6EmxXVxTuSLIRKHXf1ww2m8xVXilYb
	GuJEC2AB1qNWBSETvLBQ8duc16osHsKULbXydPEqEsjclXnwY7cIdvGiIKVzKOW5
X-Gm-Gg: ATEYQzyaTDpXIQr73eguto7vasfbfv037JiR/EhfGqgKm8pB+oLRllyfBiq3pKZyula
	SXGRviEHhhhZrNx9t6mzAo+UliiuP9VzMinidsrHw6mQzopJEND4fqi9ULBpsarVSPqwfB/eFip
	mvdPfd3QEPWZi+UKQgHTvNqXNkDnzQ37iE3bmUjQUtLsnm+Cte8u7ubBgv+cSE7wlWZJOKp5OEh
	kZ34Mxfz6X55HHZ4vKtAHp6VBUznNG3dvBaTxhmoh7ejKjuOSBYd98Okcto+pkHJnIuilBWDam+
	VLXqu5s2viB4PL4FOUq2W3/kT7euSuxu3SJNT1mKbNmmOL8NPm/BySf9KS8GE90ccnvjk7LR65d
	AM7BwgUIZQ47Wmqns8mZmY/b1xCtYf08wPiFVAhEgQJU5cT+SoXr7+q9C5XuUXGYrlykVtL8aWU
	fVG4zkIVXiwTU1OVy41blgyK1jC4FTBrP9HfmygHpN7mFhwiT9exp+qUkv8onKrhD1hlRDtH9wR
	rYN2cZm1BJ5Mu60
X-Received: by 2002:a05:6122:870a:b0:56c:ce79:9e18 with SMTP id 71dfb90a1353d-56cce79a447mr677774e0c.4.1773873247303;
        Wed, 18 Mar 2026 15:34:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951032d062esm2044071241.7.2026.03.18.15.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:34:07 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 2/2] docs/pt_BR: translation of maintainer-soc-clean-dts.rst
Date: Wed, 18 Mar 2026 19:33:23 -0300
Message-ID: <20260318223325.386762-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318223325.386762-1-danielmaraboo@gmail.com>
References: <20260318223325.386762-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/maintainer-soc-clean-dts.rst into Portuguese.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |  1 +
 .../pt_BR/process/maintainer-handbooks.rst    |  2 +-
 .../process/maintainer-soc-clean-dts.rst      | 28 +++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index d6a28bc5a..86a608ac8 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -71,3 +71,4 @@ kernel e sobre como ver seu trabalho integrado.
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
    Processo do subsistema SoC <process/maintainer-soc>
+   Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index 71ea0b9d6..8329d2304 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -15,4 +15,4 @@ Conteúdos:
 
    maintainer-netdev
    maintainer-soc
-
+   mantainer-soc-clean-dts
diff --git a/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst b/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst
new file mode 100644
index 000000000..a7e7bf0f1
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================================
+Plataformas SoC com Requisitos de Conformidade de DTS
+=====================================================
+
+Visão Geral
+-----------
+
+As plataformas SoC ou subarquiteturas devem seguir todas as regras de
+Documentation/process/maintainer-soc.rst. Este documento, referenciado em
+MAINTAINERS, impõe requisitos adicionais listados abaixo.
+
+Conformidade Estrita com DT Schema de DTS e dtc
+-----------------------------------------------
+
+Nenhuma alteração nos arquivos de origem do Devicetree da plataforma SoC
+(arquivos DTS) deve introduzir novos avisos de ``make dtbs_check W=1``.
+Avisos em um novo DTS de placa, que sejam resultado de problemas em um
+arquivo DTSI incluído, são considerados avisos existentes, não novos.
+Para séries divididas entre árvores diferentes (vínculos de DT seguem pela
+árvore do subsistema de drivers), os avisos no linux-next são decisivos.
+Os mantenedores da plataforma possuem automação implementada que deve
+apontar quaisquer novos avisos.
+
+Se um commit que introduz novos avisos for aceito de alguma forma, os
+problemas resultantes deverão ser corrigidos em um tempo razoável
+(por exemplo, dentro de um ciclo de lançamento) ou o commit será revertido.
-- 
2.47.3

