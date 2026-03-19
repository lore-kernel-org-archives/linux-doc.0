Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC82A3CC9E6
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921291; cv=none; b=HVzmA4YmNLU32ry5PbL97diKv9sZlPnrJ7beeavH0qstgcSqIz8t77F0fnYFLgyyijw0s5QqpbgZNnUy2IhC35z7QMgi0QIsEdI73CVl9w6x9WNfYzvCBCmjXu/Ox0QcFFEGcDDALl7U3XJcSTgU0+aLxhdxG+FSAOIxW2q3oQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921291; c=relaxed/simple;
	bh=nPMGypz+TbTu54lIHhy520adV8IO6vS1vuzXOnT6eGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4aUyN5OU3pqstp66i1eIinVDQA/OcW2wIK/xOb9TwoSXUUD1bf49B0ibzWU0n0Y0/tWTGxLaMWNe/ZojYCSXJFf08K72lck94R23PnyEB7JdX2ksqMN9fGpBrYeslqzHnBpzoyxU3ILdowVi7xjHZPTs4/ObrBEBLu32bHvZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONbuZlV2; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONbuZlV2"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so928999eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 04:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921285; x=1774526085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+jy5i9gBTj8FibX6K701s42yI4fT23kAsngbSwJa1Q=;
        b=ONbuZlV2zsbsZ3slem9s0AXqEG9ik0EojpZEQas0VcqgdM6VYGbbTutgyQ++ipdFAR
         l8myuIs72d2a054HKwG4R2JJ8i33VTEUd9LXQBlNDi5Brs/2EIrpPlncFktX2CeZFCjW
         P+j4y0i5i/HVnmw31Oj/QyYaPA9FLB4TbzbkKLz6dgNiumNjXZhLMruJvBKTVv4Wpdne
         D8eplxuB5xlOsjG2wY3OJXpFV/+dUw2iYG/2LEMf4QdoTygecISm1L3g1fv7btY7u9+P
         FjztSop5FUfE5ESQ3sqGfc82mpWFOhT0M5SXMl7Q3XjozSg5G8qyuw2rp/8K5BKjVDqX
         m+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921285; x=1774526085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+jy5i9gBTj8FibX6K701s42yI4fT23kAsngbSwJa1Q=;
        b=ZJxGttG0pa9WOTyWFD5osrnHzrF0tvEdROX57JcRn69l58ZBqg0n/dw3+3aZHtar1c
         iITEn1D/GrB/wI8VFWCRIDtXbfnazT3Iu8QDzGkH1KfkGthHio/je3Ur8ytVVkGykX39
         kW/ltQwNpaIAzah9/bT+gSDf+IETKz8dmYv4GT3CCMgT8htz+OCn55Ey8DdWbOWVamfG
         QEroF9mMgk967s9ZaDo3ZqzJRYtCNI8vfb6DkXnM2EuoNX+2BfLxmykZTGBJTerWOGGM
         NLLtgZaS+gbHnbFHk1J8wbX1NGsmaA/APvvzCKQZgyAgD4YixTyTRpXx/ymv6qwKQ/cA
         S+Mg==
X-Gm-Message-State: AOJu0YwN1Q4bWexwJcB9iSdiyWpGYdzueMjOkG9R8YRfbunIVXB4Bb9A
	OoK6Gzi1c8NcyeEeLAAlT1tZITm7VfsrQyyTOH7YY15FWF9r24QyCM2/GBIjvnIg
X-Gm-Gg: ATEYQzzWafPMjldrjh9fxjPmiZphSmiNHUv7ZCU0D6EcvO8YFKWuBPw6ymcC811zAwV
	kfbzQL7PI8LFByHaAsYTNODDZE+5zCfqbnJcjrzps94G7Aw2z7DmDSiQM0lIG4HXWfMFTxMMtN0
	aTchgAYGP9MjuPfO/PoYhT7Un9i5QSrzA1EwtFDEiwGQaiJsfqyFxGwdBwtb0cAzkvxHc+bQ2iq
	0zoYNNVtlmJK/LOTbZlAmYR8CaCoAcBEQaOEbR+zQpkA8IErIFc1UIYydlIOsR9nzTBUpobcrST
	bb1972J78Ybq0/d/bV2DIeEQbaO4UZk95B6Ph2Pd0BoUs64Z9nmTBxOzGbK+G8Z8cjAE9PSloqj
	+rCgs++TJDxXZ4yxqDPwTUXg/AS73HxPIPtBdvQBspist+F2Ie4KB9IB0MnVm46xWfiA81AO5NH
	189Y7k7Bfxo/9M0POpzC/N0bBuyCdk0yxISoQP7Y5eH8texGdBlcexNaps/P6VG8ftx8qi1RQ/v
	fcTdty0rB3N1czy
X-Received: by 2002:a05:7300:fb97:b0:2c0:e209:d3a3 with SMTP id 5a478bee46e88-2c0e50629cdmr3518866eec.22.1773921285116;
        Thu, 19 Mar 2026 04:54:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582c31sm7937917eec.16.2026.03.19.04.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:54:44 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 2/2] docs/pt_BR: translation of maintainer-soc-clean-dts.rst
Date: Thu, 19 Mar 2026 08:54:12 -0300
Message-ID: <20260319115416.495020-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260319115416.495020-1-danielmaraboo@gmail.com>
References: <20260319115416.495020-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
index 71ea0b9d6..ba36df8ee 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -15,4 +15,4 @@ Conteúdos:
 
    maintainer-netdev
    maintainer-soc
-
+   maintainer-soc-clean-dts
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

