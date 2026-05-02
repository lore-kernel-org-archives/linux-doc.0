Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8B2BE03B;
	Sat,  2 May 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720790; cv=none; b=flDQWdRfqYrJ/XYLExgbKZ861UXZrNFXB0srzHBDTQN7oMd0aB0LxYceVKEGKb9k3W+vOz0JswHoogeu/1mN8V+jwu9vJBOUXY79tDKma1hjHDNgq1eoDsYNRtF1hWrFQ5//eY4CAiFdLNNtmIrxcqfkqDZvU7K/hF5QPJMbvBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720790; c=relaxed/simple;
	bh=1BhQE12YvCHq6qtoF75ANphSTTLl26hrYGIArgyxMIg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=SkZj4F7us898n7wCLEbMUIp3iLdh830KAfapgjSXVBElk6P4KqeMZBJarAm6BYYtis5rqWuuob5kcJtBnPkUhc5Vbsl7NzoGOszAky9lEL/zZ+9XxK95Uizx/txRWy9q/kCo1t9yYUuZKKrO3NUC96mtEsxXnakDPIDxfB4QsH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=W8VITd6p; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="W8VITd6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777720757; bh=/ZARG5qJKou2U2YRFhbHR39Bt+W61WYqNG1U0crMawA=;
	h=From:To:Cc:Subject:Date;
	b=W8VITd6pqKZuKdg2oHBDwIvFgtBLCrJ9l96cqZtXWF7kR9nRv1y29ET0DaoWyQ4VH
	 qQpqHq+r+TquffbAUQjSS0TBrBDUZHY678nM7H7hkeuYzWZY3bwa62qODlB2WlMg5m
	 G3SZj0jGw2HmaGpRF3x9qSD5MJoP7lax9UaRyHUI=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 4CD848AB; Sat, 02 May 2026 19:19:13 +0800
X-QQ-mid: xmsmtpt1777720753tnk8m70qm
Message-ID: <tencent_A111D365F88A0FF724E809970A094533B206@qq.com>
X-QQ-XMAILINFO: N0Cpyjih+sbn+3b0zjYKLlqXV1CnLMzkW348A+mTe97gXYKmB402WNvACfyWeI
	 8KGQMmFAqATgykAzA/OOjTKl1X5t0tofk+gfHFxTuu4DsNoCDssLfDqagZbnn2yYpDO7wXCQEABw
	 kduiY2hAPu3ReC/eMuaKGjZacugf71HD9xAG+ff5/vN0Nl03uDGpDeNnGx+Q00IjoOaVL1utesjl
	 4fbJj/r/aJBV/zo8/mays9hVd58XHWMvYZvTJjphb5wzR6QEh1xnbMR8hMd0sXMOTD1cFFBAbqrN
	 X3am1RlgVRXN0W42o/xjLyKCf4v8inTx7r3nVrsa4y2OMWHQ43d3XTM2xrwHJDgVuSdMDxpZTXXk
	 mEmhJ7DDHeTOfAq0jzzHQr4Byj2+Pf1pro3kHtMTttbqpAdLbk04d9SQY4hzqFtOj4g4bbzNnllW
	 Bgrj1k+skQchmrxNViAGpXUF8DRZpK8LR/0nMuwu7exkuRK/QClA5wOFLSQV3VpQy6IBXkszz2mg
	 fKdWMgWNSqbg/RoUDRiUbh00d2VSAF2no3PXbASkbLF5pURrMaqwbRVg44s2Ks5xl/DpDrX80DaQ
	 7xCEWf9hZsKEiXd3Us9hr6cKG9k6JhNCWfEXG7OBggOQvuYXNt3bfxpS0AJ6N9kxPeGKsJ2XD8/y
	 frqFtNQtRUzD41Yh1mX5BVaMCnwbGQvs1XtLV5PMcOCudcNPYR7D3p4TvlLCd7slAHwg7R6Fyx/w
	 ZFp6V2vOjI/l6hYlDWmByy04wS/7wSV3JwFpAEuNa9teK6ZBigqoh/xDwo42CzvDRzDRD0VQUHlL
	 UFURXLFI05a4tZc/vdj9n6TNnk6RGRMkZ2gCmmLAB7NpE1ZQ9gnY/QAWGBW1IXgEInADr19lAQT+
	 w6yAn/RRJpUdRF+wQdC93v1Ajz3CoULYBUKXfOVxxTyg4RM2nsXYsn+8Dtz8Z3sleLUL5iIB/gV2
	 bNIm8FuvBXrcf2JXyhzk7DudEMQBISCzFBetvsd0xEK6wmLQi4vd4vzjP4XriEfu8YmIOSCXeXze
	 F2+brWtq3kD7bKvVyir+pZjZoKfzqIhY3U33W4hyCBBb6rQfEjuZCHy0N9se7QepYaf1OgjsYEEu
	 jPrIm/QFFCjeGvAeUpzZpWu6daIy5hPLJmSFAmxW96D72UVaRSlQ/K6XIfFBZFeOChdb+b
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Wang Zihan <3772548978@qq.com>
To: linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	carlos.bilbao@kernel.org,
	avadhut.naik@amd.com,
	linux-kernel@vger.kernel.org,
	Wang Zihan <3772548978@qq.com>
Subject: [PATCH] Documentation: translations: Fix "Linux Torvalds" -> "Linus Torvalds"
Date: Sat,  2 May 2026 19:19:13 +0800
X-OQ-MSGID: <20260502111913.144321-1-3772548978@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the misspelling of Linus Torvalds' first name in Italian
and Spanish translations.

Signed-off-by: Wang Zihan <3772548978@qq.com>
---
 .../translations/it_IT/process/submitting-patches.rst         | 2 +-
 Documentation/translations/sp_SP/process/2.Process.rst        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/it_IT/process/submitting-patches.rst b/Documentation/translations/it_IT/process/submitting-patches.rst
index 1cc480813..48ac4916d 100644
--- a/Documentation/translations/it_IT/process/submitting-patches.rst
+++ b/Documentation/translations/it_IT/process/submitting-patches.rst
@@ -280,7 +280,7 @@ https://subspace.kernel.org. Tuttavia, ci sono altre liste di discussione
 ospitate altrove.
 
 L'ultimo giudizio sull'integrazione delle modifiche accettate spetta a
-Linux Torvalds.  Il suo indirizzo e-mail è <torvalds@linux-foundation.org>.
+Linus Torvalds.  Il suo indirizzo e-mail è <torvalds@linux-foundation.org>.
 Riceve moltissime e-mail, e, a questo punto, solo poche patch passano
 direttamente attraverso il suo giudizio; quindi, dovreste fare del vostro
 meglio per -evitare di- inviargli e-mail.
diff --git a/Documentation/translations/sp_SP/process/2.Process.rst b/Documentation/translations/sp_SP/process/2.Process.rst
index c21b0134c..9e26eb8c6 100644
--- a/Documentation/translations/sp_SP/process/2.Process.rst
+++ b/Documentation/translations/sp_SP/process/2.Process.rst
@@ -56,7 +56,7 @@ y montados con anticipación. Como funciona ese proceso se describirá en
 detalle más adelante).
 
 La ventana de fusión dura aproximadamente dos semanas. Al final de este
-tiempo, Linux Torvalds declarará que la ventana está cerrada y publicará
+tiempo, Linus Torvalds declarará que la ventana está cerrada y publicará
 el primero de los kernels “rc”. Para el kernel destinado a ser 5.6, por
 ejemplo, el lanzamiento al final de la ventana de fusión se llamará
 5.6-rc1. El lanzamiento -rc1 señala que el tiempo para fusionar nuevas
@@ -202,7 +202,7 @@ Las etapas por las que pasa un parche son, generalmente:
    para su revisión y fusión.
 
  - Fusión en el mainline. Eventualmente, un parche exitoso se fusionará
-   en el repositorio mainline administrado por Linux Torvalds. Mas
+   en el repositorio mainline administrado por Linus Torvalds. Mas
    comentarios y/o problemas pueden surgir en este momento; es importante
    que el desarrollador responda a estos y solucione cualquier problema
    que surja.
-- 
2.54.0

