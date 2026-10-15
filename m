Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947851A748
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064080; cv=none; b=gFr7Qg1ZWp0+AQIHYOuLOBfGdY9MsslBG8+M3FqvdQ6mSCkRYw3Hgt29XJxxKMA+Xhkuu9pZscgzDpq/a95vqVMLQM2g1jKFTOc721YRtY7zvzc4GqBqTSGYoA8MYgkMm8anLab/SjvwoQmxQgLTF0zDN0MfNB2zbEjqiTwNx9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064080; c=relaxed/simple;
	bh=vaymtDF4QTN98nIR6gU5b5jDEdTpSUTJa+6j+g3Dy+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8j0CemqXmTeRx/x/EDdDRi5nyHeNpcLoPy6wn4a0Hrdn8kNOPLy4rtjK8fP6lJnFHP/XQbvXj/4AUkC6+abH9VGbHrufMdxNoI7ayzy/XHsFhOkdeFQdezrd24S6XmREPhZZwyU4rPOacP24+Myz8twDWME+CdT/PqS2cIF+gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC2XCjSO; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC2XCjSO"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35d7fa491deso1523638eec.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064068; x=1792668868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/edGc268+iz4tpkQVK69RgBOxwtOo3BnOMEu7CwFNc=;
        b=fC2XCjSOIITGryAS17s3lq2Ig7z3maLHgGU57T4schRqeVSObXOMw/f164lyHReCKD
         ZwZyjk1qytaxwKkhQeDLU2FvXdtYIiNB/tvsQG82DCyUUdfznC/RSOO86U5Tr3MQkgYY
         3noXm+i9bu/Y7Zhrd/L1YD1SRvfXymXEJDhN6Zeljkmk2O7/k0T+h458ZYvUZTjBynMI
         TvtGH3T4T4l9h/UQ1b1GUSbGwLagNb0QtdMozqHltAyu4o+85ZuJ5cX+6URyhBx9CphZ
         UCe9ks+rZKubXBfnAPoWGtNSgAFbOvxfOHkfONlQh7SZkae0lRXV4Cj55a8knDdy8zht
         jGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064068; x=1792668868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/edGc268+iz4tpkQVK69RgBOxwtOo3BnOMEu7CwFNc=;
        b=koPsYK7oa41y/ikbpFsfXjLlX8Imq00OUM/BquAJjwbwC9PqH9Ks0mYdFo0PnEor2s
         EbN+gm2J2vNEhsLSl1X5dpLfE/pe0H0yE0FMyW//qD++QFpemXhvte03vc4WXXqxpFn3
         XQuqq48b5/mtylu3X78WmpcxDg3z8q8Vvt47f7ZccqHHMHm0OFEEExNSZgt3gkV2uKft
         sPP347G07950KVKjL1e0h7rLpErlFy5EZVo+aZFt6UIjfkfVVXiL91Uw63yHxwe36P+J
         mRPBD/thWOhSX+rHfwqm+d/7mM5F6vMDdufKBQGLAgDY+uc3vewsZFfkTcdvSC1kAmKC
         DjZw==
X-Gm-Message-State: AFq9FYKAmtuZfzkxkXvEDloT7+24HpwAOCkJfbgS0I3iNofiwtBBiR/j
	HYSND3VO0VtXWINTk2kezsR/oRxYfSk+XbELv/by+Z4B2XJeg9rfVxiX
X-Gm-Gg: AYBFou0hK1P3wEPthA+mzudg2wmDdLbJhLALrVKMdub/Pat5KfdpbUV9gCyL9Y/GkKt
	A9tKvF2BVOBW5ETZPj7W9SnVED4T7oRApVZo7HWaqO8sK0/9wGTPnIC8sSx+XtjkBLSZ/hL5tXp
	sWMlWbaRYUrsypr5XNvlBYGJu3Mo7hEQ5HH+vtuSAJYR36NGgBiNwHYMwsJChwVdQOJ1JVNKmUD
	0g1/Zx2qbXZGMcGGDDGjHHYfKdx4cKCvf/ATob/87vbRwNVnbNDlR1Ri7KcUVzZ/XochqaiMiK/
	qXLNxlEFJYeVT6/S+qFSihigcddSCrtslrSwi2CVzVIM/3M/TUp4uqCWpYNW4ZTeTgGwfbOhFD9
	AEz+liSYiBPafEIUBBVfzhr4Fur2QC1w21woZnzBMVFunwCYW6+m5t36/tGgoFGK1RC65xRjgcV
	Ckvwh1Cy8b4vviV+RaCWsRw++1gtCsBLRKqotRrQx8VxRajYI0JMjPhYhCDaY4sKEjAjZTTykMl
	rGoUR/wUejggdV1D0yyxzA8bMCbFVxba0HFL2G9dLODRmvUUou09xV+JL14dl3z6MCdzqFRo8Sf
	0Vl+spD1hcOUo+vyYPb4wqHsBI7CN28dGQ==
X-Received: by 2002:a05:7301:241c:b0:353:7f47:8168 with SMTP id 5a478bee46e88-3537f479117mr27541405eec.17.1792064068155;
        Thu, 15 Oct 2026 04:34:28 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:27 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 06/10] docs/translations/pt_BR: admin-guide: add LSM/index.rst
Date: Thu, 15 Oct 2026 08:31:14 -0300
Message-ID: <20261015113121.4550-7-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
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

