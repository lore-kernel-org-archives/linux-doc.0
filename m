Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2BC3FFD
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784167866; cv=none; b=PXNL4JkxMk1HuyEzj9tM3o+hPjU+XFRnNWKOkxnvmYI/+LeTQ/SXavW9TJz8FyI1x/560B78siCqpahpBAwJEpbf9JDpV/WQjC5BWQlY1YdJvV0ZAD6P+oo/ZEO93pkIF9vX3OS9UvAaFZtOnFKYszqGu3q2K5NAxo5MWLKCq7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784167866; c=relaxed/simple;
	bh=JAnAa7N/w8u3TKRL7ZOG/mFjVmSUOSDvub85w3LJ3xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LdGfigQdYp66VM/OclTsqxBERbv5hQUt0/eYQggqT8he51dZLfQ7rpXwQMDitxMgt2hBLVOnvuCL8SjJGfxD95xqa6sYWOdLOPOg7fOgEhARY6HsxR5P1DQMs+Rof19g4NVpdC6Gg+g3jqGDf1IyziCiDEg1wtElTMkA4bjMpXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUPmEMoR; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUPmEMoR"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso4400782a12.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 19:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784167864; x=1784772664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+4pQFumQXGgug/WBzV3esz5K7cf+rNU7AFF21zZKRk=;
        b=DUPmEMoRM3aPGy3J2rd8uYj8KJxJ1L3qMLY7Bgw0j35edj50HyyLPeP/CYqFp2SdA9
         35WLJLunlEU3siXpTs+rBKX1KI+KNFKd9j4hcwneKEOe80AS/XxKrsJG6ts67n925gR/
         U48Bn8KWGSG2d+Br65Od2Q5e0K7NtNzelnWJ/CM8zZHv2VkSEMnyC1CkQhpaoOBE9VwU
         TV1smDfKD/z262+4OWlddsBP/i0nPKHtr/KCEZRG+Pc+2m0xwVBo0zuOGFlvVRXsXfXa
         X5S1hUXEFYYDVwdAzxHvoRE6FI3as4nrRAb20uxg+HfsdeAkAyaJwzzlWuj5rvA3rdzp
         mrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784167864; x=1784772664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+4pQFumQXGgug/WBzV3esz5K7cf+rNU7AFF21zZKRk=;
        b=BDUx1zWoVmDLK6Cwv7HJvmbo54rBh7wC16bBr99OHKQMHf51InMXzrpUbsUsKc4HHQ
         eIjtRLNT+GMn+cuBGbxIph0S/J1rh+iAj2hEt++MbxvWVsO2SCjJNjJe4urhk6jX9xsY
         toTYNiy27DXiWcIWqsjXABr2lgENy2h0MPkrmYC6xSOCggwWyzkgZx67RFftGwdiwzHv
         xktAamUIe7jw8l8YXcRxr/gpIKdep/+HDEPQn1jLjWYfwoQvx1Gx7iprCK2G8eBp2PvW
         lH8fbE2c9RalwOUtmbpGvaL40isZU1txnxh2LMA7RjlybKyAGNl8eEFPO+/PlY56MSr5
         NjvQ==
X-Gm-Message-State: AOJu0Yx6KxIxHvi7GlxDRTGX5ttKV7c3902UixG2o1aGU3z36G6M0m2P
	HiD/JNNNLIPpnLSkQSMS8FMzk3W1YAuAuGsaANKyGtY0K+fi+mNDmCt3
X-Gm-Gg: AfdE7cn4Fwz+iw0k2Wdw7iKIxFd6AF85E4peCxakbFg1qrwrunbGrmAi0C2ryhE0UtE
	dzL6Y2Pp/bP4fqvR8oMnhMhlSxogOR96JO3JbuHELEH9lG4m3kbKac525F+30LdjISCM2Jnsmb0
	v7syHNOmIz+uYiY/gsgqS/S4Zu+qnlSFteDIrhLko0eFyv72/XzqvSLgwTDP5/w/O4tksMiKI2x
	0qyir4kf1gU1oyMKbl7HT1IcEIc7wPWdJWlmJ02+iYwXpZKKYj78JrOJwIP2JopyppBc2sQ1CGX
	A9K2aw6K+T0xuSriNOrIbIoGHzqCYwSxppmKWnkDWN8MhY97ldKMh25gEAtp1RgJem/c10BxxSX
	DEMLOrsacWMsKiTPmjaj9FXuz6xVfG1JGIc15+Q4E4/l1pKbSC3g60J7F2hb39KUaKrTrYWDjYL
	99VsFB+WnONweJQ2N4xEqk7w5754YK7g0FvqhlzGtVhv8bSE+v1CMcyxNZqsJjEg9fRGoxvDZqh
	LejaOlMYMkL43bCKKrMt7wJ2YUAww==
X-Received: by 2002:a05:6a20:da1a:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c35731bc6emr10277391637.6.1784167863691;
        Wed, 15 Jul 2026 19:11:03 -0700 (PDT)
Received: from parrot.bbrouter ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd429cee1sm6979209c88.6.2026.07.15.19.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:11:03 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 3/4] docs: pt_BR: Translate Code of Conduct to Portuguese
Date: Wed, 15 Jul 2026 23:10:11 -0300
Message-ID: <20260716021013.48025-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716021013.48025-1-danielmaraboo@gmail.com>
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the Contributor Covenant Code of Conduct document from
Documentation/process/code-of-conduct.rst to Portuguese (pt_BR)
to ensure the community guidelines are accessible in the local
language.

Also, add the newly translated file to the main index in the pt_BR
translation directory to ensure it compiles correctly within the
Sphinx build.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |  3 +
 .../pt_BR/process/code-of-conduct.rst         | 88 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/code-of-conduct.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index d9276a8dc..5911442f6 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -85,3 +85,6 @@ kernel e sobre como ver seu trabalho integrado.
    Adicionando uma nova chamada de Sistema <process/adding-syscalls>
    Lista de verificação para submissão de patches do kernel Linux <process/submit-checklist>
    Interpretação do Código de Conduta do Kernel Linux <process/code-of-conduct-interpretation>
+   Código de Conduta de Compromisso do Colaborador <process/code-of-conduct>
+
+
diff --git a/Documentation/translations/pt_BR/process/code-of-conduct.rst b/Documentation/translations/pt_BR/process/code-of-conduct.rst
new file mode 100644
index 000000000..1ab171bf2
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/code-of-conduct.rst
@@ -0,0 +1,88 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_code_of_conduct:
+
+Código de Conduta de Compromisso do Colaborador
++++++++++++++++++++++++++++++++++++++++++++++++
+
+Nosso Compromisso
+=================
+
+No interesse de promover um ambiente aberto e acolhedor, nós, como colaboradores
+e mantenedores, nos comprometemos a tornar a participação em nosso projeto e em
+nossa comunidade uma experiência livre de assédio para todos, independentemente
+da idade, tamanho corporal, deficiência, etnia, características sexuais,
+identidade e expressão de gênero, nível de experiência, educação, status
+socioeconômico, nacionalidade, aparência pessoal, raça, religião ou identidade
+e orientação sexual.
+
+Nossos Padrões
+==============
+
+Exemplos de comportamentos que contribuem para a criação de um ambiente positivo
+incluem:
+
+* Utilizar linguagem acolhedora e inclusiva
+* Respeitar pontos de vista e experiências divergentes
+* Aceitar críticas construtivas de forma cortês
+* Focar no que é melhor para a comunidade
+* Demonstrar empatia para com outros membros da comunidade
+
+Exemplos de comportamentos inaceitáveis por parte dos participantes incluem:
+
+* O uso de linguagem ou imagens de teor sexual, bem como atenção ou avanços
+  sexuais indesejados
+* Provocações (*trolling*), comentários insultuosos/depreciativos e ataques
+  pessoais ou políticos
+* Assédio público ou privado
+* Publicar informações privadas de terceiros, como endereço físico ou eletrônico,
+  sem permissão explícita
+* Qualquer outra conduta que possa ser razoavelmente considerada inadequada em um
+  ambiente profissional
+
+Nossas Responsabilidades
+========================
+
+Os mantenedores são responsáveis por esclarecer os padrões de comportamento
+aceitável e devem tomar medidas corretivas apropriadas e justas em resposta a
+quaisquer casos de comportamento inaceitável.
+
+Os mantenedores têm o direito e a responsabilidade de remover, editar ou rejeitar
+comentários, commits, código, edições em wiki, issues e outras contribuições que
+não estejam alinhadas a este Código de Conduta, ou de banir temporária ou
+permanentemente qualquer colaborador por outros comportamentos que considerem
+inadequados, ameaçadores, ofensivos ou prejudiciais.
+
+Escopo
+======
+
+Este Código de Conduta se aplica tanto dentro dos espaços do projeto quanto em
+espaços públicos quando um indivíduo estiver representando o projeto ou sua
+comunidade. Exemplos de representação do projeto ou comunidade incluem o uso de um
+endereço de e-mail oficial do projeto, publicações por meio de uma conta oficial
+em redes sociais ou atuar como um representante nomeado em um evento online ou
+presencial. A representação de um projeto pode ser detalhada e esclarecida de forma
+adicional pelos mantenedores do projeto.
+
+Aplicação
+=========
+
+Casos de comportamento abusivo, de assédio ou inaceitável sob qualquer outro aspecto
+podem ser relatados entrando em contato com o Comitê do Código de Conduta pelo e-mail
+<conduct@kernel.org>. Todas as reclamações serão revisadas e investigadas, resultando
+em uma resposta considerada necessária e adequada às circunstâncias. O Comitê do
+Código de Conduta é obrigado a manter a confidencialidade em relação ao denunciante
+de um incidente. Detalhes adicionais sobre políticas de aplicação específicas podem
+ser publicados separadamente.
+
+Atribuição
+==========
+
+Este Código de Conduta foi adaptado do Contributor Covenant, versão 1.4,
+disponível em https://www.contributor-covenant.org/version/1/4/code-of-conduct.html
+
+Interpretação
+=============
+
+Consulte o documento :ref:`code_of_conduct_interpretation` para entender como a
+comunidade do kernel Linux interpretará este documento.
-- 
2.47.3

