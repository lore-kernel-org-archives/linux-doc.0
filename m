Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036006;
	b=nmmkK4ysA4PeE/srviMtxy4qaFuYU/HLGhS5XoTVXEVXFcYy1Z5b9hFDSGw1tgh4yCtG
	 V6l8bqCizKP9870PS/SGcDlDUhJ4WPHrSMUodRABTaCGSWmMzzT0PlhkaG8gzDk/GDKOE
	 4WB/yVzmH96nv0rilMro/qJ8aDQfZXwXCIdM9/oNjK0ml9ngnqUqHZAkMnwq9jlmdSmEA
	 vcHo0URWUrO+GTtjUP+VuJqdOjEb8GYsNLfPPBa2pBkzt3mokEMMBl+VFa+eeADDPuBW0
	 RvMVXAFgh8tzsD6jQPj0LJqjiQ5OOvSEU3Ygfsm4gh9h/QmowMx/dbFzmrezf9uY5Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Z2EvmeuWVweg+6QWuz9lHs8aPNlPx3bx/ZhKvecgZoY=;
	b=BFcyV8qpa7bN/vyIXAu0i7bg0BbI6pT61lA4lHhf2QxxwXLG9qyjqAST0BC288susTnW
	 9arY/Y49ouuXCCiA2ZaDzahcP+HxJRPf+TlGQkjGcssDir5vGyltFadJd/rv3Ogd+8N94
	 paAS8FwwEJKu0j6iQAc5k7RCao/IW50lxcPC5Tk6KynGbqLmhJDwtSldWImwz8ILh+wy2
	 EfbjRhBTve3M1ShaEapz0fu6VvmvG4GguSWDLB0j20AdkyYeJ1aSOmBGIdYniSj3AamqO
	 beOg42nhhINRkp3A2w9vdhtJ2I6yw2TxFbxWh+RbMiq8zsMwAhrVfq2PJIKAwLmxtUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upoH019F;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2509606A332
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2509606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upoH019F
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99e0db26c4bso434280241.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036005; x=1795640805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2EvmeuWVweg+6QWuz9lHs8aPNlPx3bx/ZhKvecgZoY=;
        b=upoH019FEi3MLRg5+pZN6wxRxPiYbkUZBH/N3CL1eZalLogULyCF35oSwEfXBZ9+Ms
         hBzGQph4nTgHTmVnlf+si20un2mlM+N5yIPD6specndCtIOD3Bhvi8zL8KVb1tG7PR8K
         aDHt81KGzxW6g5kAwRvrz5QqAkeaKHBPHZmW80F2U516JR+yUwvYCpDu1GnrvHyH5tRp
         nW7UA+GZsaj0lVg2892ERCDL4AN2tVxiuu5N5CLOXzeWpaO/2c9Yh+f1Soe/fbRuAhix
         gbqD7cXr8HqWW56KNfh1m6HbcFg9gB10VcDDqcQqy/NRnfX7voTCbf/D49am9lvKVTh/
         JXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036005; x=1795640805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2EvmeuWVweg+6QWuz9lHs8aPNlPx3bx/ZhKvecgZoY=;
        b=u0SK8yZKqcS0DRhZ1z2psXu73qNo2tffWstzQIT/eX4FeaceI+SO+FRtM6gKqCYgts
         zDqikFlsz7bSUsGByBKu5IBVRgemKj23F2/xZkV2ajcnIZhknL3pjta50fxkr+4QKq3j
         YuVA5FXcIjUGUWWCDGZKuW4y4CqwXMfrQC5MgOqDRS2hUr8tnPcxhsdXAga6R2vxu6c+
         IIabp+dSSTi3OB1WnrrUyc1W5AWiU993bUUvYt5f7fghiQKX6TVi2JYBw4kre4MLFRzi
         8BsVGiJlZ+u44d5elB787Uk+d//dmY7daXfsoUzmPNtxz//5bOzRliGhff8OvYbRkwPr
         Nfcw==
X-Forwarded-Encrypted: i=1; AL+hErH1BGm4w2Dok768NLu0gYSSrkKfGpJ8UJymSSlNDahMJHujgdtfLaU9EsEyUKqZpkQqYj5AuOR+CxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y6699P3sRUuFJOHdx84CHHWtRGUnZiNgPu8ocXK0r3n/12kc6
	kbmkEeVFipqQIGCcZRVDspvjJilNhZA2kaXZGEzLydSEI+Z2HyxH2QXZ
X-Gm-Gg: AYBFou1PEnHQYZBZ/b/alQB9MGSVd5HfReTQU9CQc0mQRFqEP9WCZBGMaYj00Zcacg2
	UAY6yFKBuYmQen6+f7kRu1s81DqRY5zK9cCAVqVvHKlmdoGI2Wg4thLA79Pb17TCgx+lqvJuW4j
	WfCKR/9cmOiTarFUGii08hRV+wOLl2bMEMl9gNRzf4r37TTIsNblM/sEYKX5Y5p3jGhZsJW8wM9
	sF49AEjlmFztzipEVT24u+UPAcXKB1FUqdSv+ge6uVqN7O84w5oK9F9o6gOdzg4BvyvhOosZ6+K
	G8b+5VxCrX54Vwvfzllj1BB+jMOX4CKTcYZ4/k8e20y5aUTG/KXzfPvcm6m9Row0dvwrvenXOme
	7W59Ti4542yMWO+e8T33zO7kcqgPjmQH2W9t5s2hndmqJqgtni2nXdZcxGr6zukL+urV/7ZnhKB
	oxLLOB7je+MUqysnUg6Co2h9nByoC5hfUoWUycx6/BAfwjye6VnW8AApTYU99SVwZbNNmWOi3YI
	1qHGH2r/2yr//T7hIXYDOFxdbzOoI4crFv9QZEOjpQYvqy/u+4mjfle5Hj0bH9eTaojdK4DxpBK
	SSM8ADewyhZRL+epy+0AAzSKyvJMZ81MVpUZzofV5Akb241vWGWgki4PvGTje1af8PRWsyKXwvp
	wiZlC+3dwtUa8IoJaaz1rHR2p3PTLHsxCiMNVhxk4CuAzRvZjvV8idZsK/tzOwW2MmX8NCw==
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr1333937137.19.1795036004713;
        Wed, 18 Nov 2026 13:06:44 -0800 (PST)
Received: from nixos ([2804:14c:a8:965f:176b:a846:d400:c7cc])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1c34cesm2985855241.4.2026.11.18.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:06:44 -0800 (PST)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v2 2/2] docs: pt_BR: process: debugging: point references to translated driver guide
Date: Wed, 18 Nov 2026 18:06:23 -0300
Message-ID: <20261118210623.111428-3-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118210623.111428-1-igorgphotoarte@gmail.com>
References: <20261118210623.111428-1-igorgphotoarte@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the driver development debugging guide has a pt_BR
translation, update the references in the pt_BR debugging index and
in the userspace debugging guide so they point to the translated
document instead of the English original.

Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
---
 Documentation/translations/pt_BR/process/debugging/index.rst  | 2 +-
 .../pt_BR/process/debugging/userspace_debugging_guide.rst     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index db083a501d1..89a7770b11d 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -57,7 +57,7 @@ kernel?
 
 Nesse caso, sua gama de ferramentas disponíveis é muito maior. Você
 pode encontrar as ferramentas
-no :doc:`/process/debugging/driver_development_debugging_guide`.
+no :doc:`driver_development_debugging_guide`.
 
 A temporização é um fator?
 --------------------------
diff --git a/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst b/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
index 8c161921347..44f1b048cca 100644
--- a/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
+++ b/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
@@ -7,7 +7,7 @@ Conselhos de depuração a partir do espaço de usuário
 Este documento fornece uma breve visão geral das ferramentas mais comuns
 para depurar o kernel Linux a partir do espaço de usuário.
 Para conselhos de depuração voltados a desenvolvedores de drivers, veja
-:doc:`aqui </process/debugging/driver_development_debugging_guide>`.
+:doc:`aqui <driver_development_debugging_guide>`.
 Para conselhos gerais de depuração, veja o :doc:`documento de conselhos
 gerais <index>`.
 
@@ -95,7 +95,7 @@ Para a documentação completa do Ftrace, veja :doc:`/trace/ftrace`
 Você também pode rastrear eventos específicos :ref:`usando o rastreamento
 de eventos <trace/events:2. using event tracing>`, que pode ser definido
 conforme descrito aqui: :ref:`Criando um tracepoint customizado do Ftrace
-<process/debugging/driver_development_debugging_guide:ftrace>`.
+<translations/pt_BR/process/debugging/driver_development_debugging_guide:ftrace>`.
 
 Para a documentação completa do rastreamento de eventos do Ftrace, veja
 :doc:`/trace/events`
-- 
2.54.0

