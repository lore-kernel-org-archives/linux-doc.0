Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D550B43A
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961129; cv=none; b=YecUhyvygA4kNjs9Keas9GU+5nQm5TLb5OAtk+vlUt/aNEUTd1cLgYcLoYwjDVjWGgsFlxXCRFXa7mcwA3cNdmUIGWAfIyaJvTlLQe7UX2qyD3plw9lK3JXKDoP/tn3CIc2SyqkwLPFLbOtUxFLzLdp67jDzdaNqxdPP6Qyl48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961129; c=relaxed/simple;
	bh=vaymtDF4QTN98nIR6gU5b5jDEdTpSUTJa+6j+g3Dy+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyVzk8evddlmnDVURMytEgD4Tv/q2VrIs8CiXYAFqQp7msSw8Bl4+FDxX6Y8e2KqPiM4N3LNQEeGUybqa/st2g9l6Oo7JYqbNbYlDhyH4llnt3aTZMTcBu+KPnvyDom6MgOVXUOg950MqLgulf3DrR1JtuH0vmTbgOltpk6/LSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRvW6O+h; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRvW6O+h"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5d82736af9fso992584e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961115; x=1791565915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/edGc268+iz4tpkQVK69RgBOxwtOo3BnOMEu7CwFNc=;
        b=eRvW6O+heTbdAVAR7OJ10ST20+fzUZnT2qlAEw5k2QqKfyH39YaN4DW6enAygHKeM9
         n30oIQVRoJFXLpL9to+7EGbwJw+MfGtCTOKYA7peCcNr4neLzo+ePFB0tpYyaauSTse9
         ckZ8zEtKxSrsF/mbX0xdCpm21GDKM/pXTJAqvVXMYbpoo/wJL449IialZQ7wIJERhetD
         B1mheomGTWFzZY5t/JoDwGKecu6/2iFALfj/YCRdABlFi1nsnJhH8Dh+gyJqPxJA1kHR
         ubl8EuQhF8wDgV9lpT4BykZRwTQz8H2fyEGahE3GyVIam/i5TQG0FXRhbAqmRQp9ZfI2
         +1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961115; x=1791565915;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/edGc268+iz4tpkQVK69RgBOxwtOo3BnOMEu7CwFNc=;
        b=PfVW6lP7VNCFbZ4JOw3Hip4IcKeC48osri8yvhmK75YTp+QZ7Nsvb7hILiVywyNoPV
         PZ5oLmhssO7IkXTfBeJqWK5tBqGf0jKZO1BVfO6Kx5BHi3T0F1breptJa3v84faGejxS
         uificIqEPk5tBU4uN+UiG9n3C9Pc1d65x5sA7lKW3k847seXAXgMUyZ4HUISby0lP3ha
         XmAwcv1JRY9IUxYDp3Lt0TPIx/HG6WOj+spL4oBsSvC2mdyK5pwKiBP7jBhSAf+r1y+0
         H/tgiG0Syx/3Ji7zyxmIMthJ+QOIeMwYbLo76EX3fS+P578w4hRNweeVMtveAOyq0hQQ
         a0nQ==
X-Gm-Message-State: AFq9FYLi6MMviqf1BruES3mdVd3jlojQ7rDeQR8yaPBax6y/11hWxVHx
	2bcPd2AE9y3bUQmbJjwC6g+8AhDVbHKT3TK2S41N83qR3jWhlFVvAYYSf4eIELJj
X-Gm-Gg: AYBFou3IBiIZmsJbjG6V642N2Z/W50Vg3xzxN9aR2n2ay2KD/wFhBbcEkD8HXJi61jf
	cyQ8vT1NavTScJISM6mn7ci7oPeRQk/+P98Fs4QkJkUxDi1YCep7/gTOt4FMWNczRI4rgHQS8+s
	T0XA7Nerafm1Hz/kuDNuhibfYFC2JSI+PmohQZQ12/u1L7OtrDg4lL3Tdiqsz84QDQhk66SehFm
	4tdsoo7vafbjPQJzoZMv6yNLgU40Z9T7aRAufyfwdVxT4PL5lQTJyKKA5vN4Q2bJiBAEFBBUU7I
	wk53QWSbM/bQRyznsNUgu01QeGZztf4WX+ZuxKgcattfexp4z95kpmeXk+2ONCd+g1umkX1RdIt
	dusrv2N4hRuVTwWC80/HF0MCVY2QdS8IvmFhq8H1aGp6kDP8z5Hs/sluMBGzhQWoJ8YSgvUjhlV
	1i7E5xoV0q3qLMAQNazn7PeYEQD0xiz9hQfr7nKwKTOWD++Aick8kE+KXbSjnlJqAW/ANPGmxEA
	I2GAk7vy613tRU0F7koCqQw6gfOiQ/eDteUE3/sip093Y4MGbrMdOi5mexaci14B+sJJmVEHKVf
	cCpSrsDUzuMv5/RVtuiE56w=
X-Received: by 2002:a05:6122:6c17:b0:5d0:e57f:add3 with SMTP id 71dfb90a1353d-5d7ad9b1a34mr2009362e0c.2.1790961114832;
        Fri, 02 Oct 2026 10:11:54 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:54 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 06/10] docs/translations/pt_BR: admin-guide: add LSM/index.rst
Date: Fri,  2 Oct 2026 14:11:29 -0300
Message-ID: <20261002171133.50969-7-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of LSM/index.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/admin-guide/LSM/index.rst           | 53 +++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |  2 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/LSM/index.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/LSM/index.rst b/Documentation/translations/pt_BR/admin-guide/LSM/index.rst
new file mode 100644
index 000000000..353ed472f
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/LSM/index.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================
+Uso dos Módulos de Segurança do Linux (LSM)
+===========================================
+
+O framework dos Módulos de Segurança do Linux (LSM - Linux Security Module)
+fornece um mecanismo para que várias verificações de segurança sejam interceptadas
+por novas extensões do kernel. O nome "módulo" é um pouco impróprio, já que essas
+extensões não são, na verdade, módulos carregáveis do kernel. Em vez disso, elas
+são selecionáveis em tempo de compilação via CONFIG_DEFAULT_SECURITY e podem ser
+substituídas em tempo de inicialização pelo argumento de linha de comando do
+kernel ``"security=..."``, no caso em que múltiplos LSMs foram compilados em um
+determinado kernel.
+
+Os principais usuários da interface LSM são as extensões de Controle de Acesso
+Obrigatório (MAC - Mandatory Access Control), que fornecem uma política de
+segurança abrangente. Os exemplos incluem SELinux, Smack, Tomoyo e AppArmor. Além
+das extensões MAC maiores, outras extensões podem ser construídas usando o LSM
+para fornecer alterações específicas na operação do sistema quando esses ajustes
+não estão disponíveis na funcionalidade principal do próprio Linux.
+
+Os módulos de capacidades do Linux sempre serão incluídos. Isso pode ser seguido
+por qualquer número de módulos "menores" (minor) e no máximo um módulo "maior"
+(major). Para obter mais detalhes sobre capacidades, consulte ``capabilities(7)``
+no projeto Linux man-pages.
+
+Uma lista dos módulos de segurança ativos pode ser encontrada lendo
+``/sys/kernel/security/lsm``. Esta é uma lista separada por vírgulas e sempre
+incluirá o módulo de capacidade. A lista reflete a ordem na qual as verificações
+são feitas. O módulo de capacidade sempre será o primeiro, seguido por quaisquer
+módulos "menores" (por exemplo, Yama) e depois pelo módulo "maior" (por exemplo,
+SELinux), se houver um configurado.
+
+Os atributos de processo associados aos módulos de segurança "maiores" devem ser
+acessados e mantidos usando os arquivos especiais em ``/proc/.../attr``. Um módulo
+de segurança pode manter um subdiretório específico do módulo lá, nomeado após o
+módulo. ``/proc/.../attr/smack`` é fornecido pelo módulo de segurança Smack e
+contém todos os seus arquivos especiais. Os arquivos diretamente em
+``/proc/.../attr`` permanecem como interfaces legadas para módulos que fornecem
+subdiretórios.
+
+Todolist:
+
+*   apparmor
+*   LoadPin
+*   SELinux
+*   Smack
+*   tomoyo
+*   Yama
+*   SafeSetID
+*   ipe
+*   landlock
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 9f7933c57..19678a358 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -49,10 +49,10 @@ Documentação relacionada à segurança:
    :maxdepth: 1
 
    hw-vuln/index
+   LSM/index
 
 Todolist:
 
-*   LSM/index
 *   perf-security
 
 Inicializando o kernel
-- 
2.47.3

