Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848145;
	b=4YyU+POL0H1B4qaeANj95tEQFYPFVngo1Ksdv6AM7NGu/hP91yC4c6NtpagQnd54vnI/
	 WovmAio+sv21pVHEW/VN5TztixOmMCMLx/wuMGs3ZO52MehMjQBdr1Cw4jfZCHXfek6iY
	 4x3kuwcAHT3u+V6BeKwxrLDVenPZA+skpYJq+as/dBdWRsJ5oVRtRJtBtKuVlhQ4SpQXk
	 ihx47AvKPZ6D8yXkB5GgMMdM79fjr+b2V14shAbp63QLuaiSKvAYZEzRe/nMQPZFQDeEF
	 MICBtEzKJDbw3gDrAwHHvkPNkQ2rYhKmO4Dda3pl3JX9rKidOQiPuWzlxeNIi72uy4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nD2fbQ3rmeQI23nAFeIIj5Yx/nfhE743cgOmZlWeGGM=;
	b=s8lRvWYFJN71n1cVR9GqmVzgswnehhJB/eT2BJunm9p/A0h8Krmkrq77ZVkS7iA2zZ9T
	 FzkqGKCvm93GUU7nC7sfmu847JXpspUaI59PQ4+xv4FElq5KEsnx6mIk0g1wb5Rnc5CEo
	 Zz4+PbmzAsKjd20U/qVEbyO0eHehx1p8CVfre0K0t2+lZGq8u4YYVzflQ69NkJr9ZOAKt
	 8371wr9WswKUTY5VeQS4c/sRGlK8VIt82r5e0MpGJGMsPb8zyb/ZiVNBrDELZR/nG9aQF
	 dRf6Wk+AxO77Jn6lzQQjQfcTD5ppj8R6b2dVAaJV48RsEC2WQPSh7agFnSGmLJR6JFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="WV/Npt1B";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E69606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E69606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WV/Npt1B
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso2650561eec.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848141; x=1793452941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nD2fbQ3rmeQI23nAFeIIj5Yx/nfhE743cgOmZlWeGGM=;
        b=WV/Npt1BapYnn4qMLoFJ1DaNw75n/hHEjjWdJjirl2fpMJgAgzpFgYWPmz06ZAwcPf
         q2rYWx3VZMfsKw4vyRhxpLCbgg5EnUG42H+k+zF6SvmX7F4RQnu/rtQNm+8EUY3bd87F
         wua+MvzFIETi29sgpaf1Jut8doKOP5rUXreA7201bfP6cWaH4S9hmMldC/OQoZNxLpPV
         FMiDpW5kfsdPkyP6a0ZedCuVD9xM3EjaansREAGZc/VRaZlxhXo4WXYl5fBq9L4irNTA
         tiNM5GytVCpzohuHlz18MqMLyoTu4s+1w/563ySs5Ruiw51J3mBYKjBC+bRil1vzBzLw
         3x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848141; x=1793452941;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD2fbQ3rmeQI23nAFeIIj5Yx/nfhE743cgOmZlWeGGM=;
        b=Viwwk5T7+fD+ECMTOlxC+dEyEdGqLMXM7Oawy4Lt72AKbESoZEFWFOv6DejYOcMtCD
         ASqGtMW8nW10bV4nU9cCXOzeu8Q3So/fyj0f8R09yv+vbzpmus/sLOZBTH/n6NN8ByJU
         ZbGCmGIFhFpvfwqfOUe0zvvS4czozGXqLI6q8MEhW4ysUl7nxNGQYcQEKSd57nPuMALg
         wrsFNf2fcpwYgY5RC7EVeJ8st7xOHLjmwwPGdGtn5T19SPDYIlimC9y7xjariJiV+MVC
         hEkEmihOMC0CyV4n55k4TpiYyxDFEXVh0X2HWGNot/yyQs2oYeVAxYgKSKPgUBrOue/q
         zJtg==
X-Forwarded-Encrypted: i=1; AKwUvBzALLu45rOudSrYKTqI4CMaL9Zfw2mvuS9yxCEvuIpQ2qLx/KakKu4oNABx8PlWWM169iztlaUvH+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBMwJ/eHxWODDh34aVzCCoyDWuFt1ehl/vV84GlkDhSrCGq33N
	zlUmPIoDLGLJFEMFw39YT4uujGrQE3xKbul4aRXRG1+tCK/ZdPAvtdD+jdLkU5hN
X-Gm-Gg: AYBFou38dqY5vW2OH/Bh95Ski12FPvzPNfcrpkJ7PnQAG7EpBvuyYQjgIaY+nc5tD8s
	u83a5Y6+580HyKoDBNqvh8mSu7UmLGdkxGxha6uqnH+GYoxiHC8Pgp4ua1XhNtp7npnAi+VyxIT
	RG3N+iVRkhJODvEMgszNPGMRCwxgcMAJxiuc+0V1vbB7SEYaBsLpqJ8MQ+HM7ev9Gd1oj9/asEn
	dJKSdXfONphPYNcWqAwpqmtkAR897u1urXiL+mNqQ9WjU4ddTZzce209XwlG3y8HXIzopOIgIGB
	470WcsKwBmB5hVQdYraLnADj6kJYQG7/jFHZ3H6apcQ16ONed5ZPFrF9DjDPPBRoBEdSkgUXbUR
	0AXjlLv+lk1qecNFbQgrheCOxo70UhuwMsJ8IEoJ424ucNQMf/xaq7qjtb9y/FlOviIZ5beKCX/
	QfRoTihB7eec25IFCi4cl5As/K1w9WNkhggT8stzcFdy+PY0ag024FuFuCu+Rv+pwilrRJNw2oI
	0Xsrkwj4oGxDPEbBslc/3a9JiUjFqaxT6yuN1t49BaYvGDMEfbFw0lyCKbqbzioqrBAGGXncSRi
	Kc1ZsOGRdejG+dqmGlB05NrHfHtKmstczMobD0BhOeKkYsJ9MN1hPEpLwMeQT1KFKIK6iLJJYnR
	hwkFaSNkkkwJWxcgiDLGkr3qDTq257Rw=
X-Received: by 2002:a05:693c:66d4:10b0:35f:227b:f8bc with SMTP id 5a478bee46e88-369e84936cfmr3071199eec.11.1792848140233;
        Sat, 24 Oct 2026 06:22:20 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:19 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 09/11] docs/translations/pt_BR: process: fix cross-references and list markup
Date: Sat, 24 Oct 2026 10:21:56 -0300
Message-ID: <20261024132158.39493-10-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
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

Several :ref: links in the pt_BR documents pointed to the English labels
even though the target document is translated. Point them to the pt_BR
labels, adding pt_BR_submitchecklist, pt_BR_email_clients and
pt_BR_stable_api_nonsense, which mirror the English labels.

While at it, fix markup that renders differently from the English
version: an unindented paragraph in howto.rst that broke the definition
list, a sub-item in email-clients.rst nested one level too deep, a book
title in 8.Conclusion.rst indented differently from its neighbours, and
a literal around the ABI document path in submit-checklist.rst that kept
it from being linked. Also update the Coccinelle URL in 4.Coding.rst,
which changed in the original.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/4.Coding.rst   |  6 +++--
 .../translations/pt_BR/process/5.Posting.rst  | 22 +++++++++++--------
 .../pt_BR/process/8.Conclusion.rst            |  7 +++---
 .../pt_BR/process/email-clients.rst           | 12 +++++-----
 .../process/embargoed-hardware-issues.rst     |  2 +-
 .../translations/pt_BR/process/howto.rst      |  4 ++--
 .../pt_BR/process/stable-api-nonsense.rst     |  2 ++
 .../pt_BR/process/submit-checklist.rst        |  4 +++-
 8 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/4.Coding.rst b/Documentation/translations/pt_BR/process/4.Coding.rst
index 914a3d4c5..9c40f5468 100644
--- a/Documentation/translations/pt_BR/process/4.Coding.rst
+++ b/Documentation/translations/pt_BR/process/4.Coding.rst
@@ -24,7 +24,8 @@ Estilo de Codificação
 *********************
 
 O kernel há muito possui um estilo de codificação padrão, descrito em
-:ref:`Documentation/process/coding-style.rst <codingstyle>`. Por grande parte
+:ref:`Documentation/process/coding-style.rst
+<pt_BR_codingstyle>`. Por grande parte
 desse tempo, as políticas descritas naquele arquivo eram consideradas, no
 máximo, como recomendações. Como resultado, há uma quantidade substancial
 de código no kernel que não cumpre as diretrizes de estilo de codificação.
@@ -324,7 +325,8 @@ https://sparse.wiki.kernel.org/index.php/Main_Page se a sua distribuição não
 incluir como pacote); ele pode então ser executado no código adicionando "C=1"
 ao seu comando make.
 
-A ferramenta "Coccinelle" (http://coccinelle.lip6.fr/) é capaz de encontrar uma
+A ferramenta "Coccinelle"
+(https://coccinelle.gitlabpages.inria.fr/website) é capaz de encontrar uma
 ampla variedade de potenciais problemas de codificação; ela também pode propor
 correções para esses problemas. Uma quantidade considerável de "patches
 semânticos" para o kernel foi empacotada sob o diretório scripts/coccinelle;
diff --git a/Documentation/translations/pt_BR/process/5.Posting.rst b/Documentation/translations/pt_BR/process/5.Posting.rst
index 60e12c1ee..cace3051c 100644
--- a/Documentation/translations/pt_BR/process/5.Posting.rst
+++ b/Documentation/translations/pt_BR/process/5.Posting.rst
@@ -12,8 +12,8 @@ conjunto de convenções e procedimentos que são usados no envio de patches;
 segui-los tornará a vida muito mais fácil para todos os envolvidos. Este
 documento tentará cobrir essas expectativas em detalhes razoáveis; mais
 informações também podem ser encontradas nos arquivos
-:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
-e :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`.
+:ref:`Documentation/process/submitting-patches.rst <pt_BR_submittingpatches>`
+e :ref:`Documentation/process/submit-checklist.rst <pt_BR_submitchecklist>`.
 
 
 Quando enviar
@@ -203,7 +203,8 @@ a alteração em um sistema de controle de versão. Ele será seguido por:
 
 Os marcadores (tags) já mencionados brevemente acima são usados para fornecer
 informações sobre como o patch surgiu. Eles são descritos em detalhes no
-documento :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`;
+documento :ref:`Documentation/process/submitting-patches.rst
+<pt_BR_submittingpatches>`;
 o que se segue aqui é um breve resumo.
 
 Um marcador é usado para se referir a commits anteriores que introduziram os
@@ -242,15 +243,17 @@ Os marcadores de uso comum são:
    tem o direito de enviar o patch para inclusão no kernel. É um acordo com o
    Developer's Certificate of Origin (Certificado de Origem do Desenvolvedor),
    cujo texto completo pode ser encontrado em
-   :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+   :ref:`Documentation/process/submitting-patches.rst
+   <pt_BR_submittingpatches>`.
    Códigos sem um signoff adequado não podem ser mesclados (merged) no mainline.
 
  - Co-developed-by: afirma que o patch foi criado em coautoria por vários
    desenvolvedores; é usado para dar atribuição aos coautores (além do autor
    atribuído pelo marcador From:) quando várias pessoas trabalham em um único
-   patch. Cada Co-developed-by: deve ser imediatamente seguido por um
-   Signed-off-by: do coautor associado. Detalhes e exemplos podem ser encontrados
-   em :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+   patch. Cada Co-developed-by: deve ser imediatamente seguido por
+   um Signed-off-by: do coautor associado. Detalhes e exemplos podem ser
+   encontrados em :ref:`Documentation/process/submitting-patches.rst
+   <pt_BR_submittingpatches>`.
 
  - Acked-by: indica o acordo de outro desenvolvedor (frequentemente um
    mantenedor do código relevante) de que o patch é apropriado para inclusão
@@ -261,7 +264,7 @@ Os marcadores de uso comum são:
 
  - Reviewed-by: o desenvolvedor nomeado revisou o patch para verificar sua
    correção; veja a declaração do revisor em
-   :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+   :ref:`Documentation/process/submitting-patches.rst <pt_BR_submittingpatches>`
    para mais detalhes.
 
  - Reported-by: nomeia um usuário que relatou o problema que é corrigido por este
@@ -302,7 +305,8 @@ você deve se preocupar:
    e, frequentemente, não serão examinados em detalhes. Se houver qualquer
    dúvida, envie o patch para você mesmo e certifique-se de que ele chegue intacto.
 
-   O documento :ref:`Documentation/process/email-clients.rst <email_clients>`
+   O documento :ref:`Documentation/process/email-clients.rst
+   <pt_BR_email_clients>`
    possui algumas dicas úteis sobre como fazer clientes de e-mail específicos
    funcionarem para o envio de patches.
 
diff --git a/Documentation/translations/pt_BR/process/8.Conclusion.rst b/Documentation/translations/pt_BR/process/8.Conclusion.rst
index 6691627b2..09d6b350d 100644
--- a/Documentation/translations/pt_BR/process/8.Conclusion.rst
+++ b/Documentation/translations/pt_BR/process/8.Conclusion.rst
@@ -8,8 +8,9 @@ Para mais informações
 Há inúmeras fontes de informação sobre o desenvolvimento do kernel Linux e
 tópicos relacionados. A primeira delas sempre será o diretório Documentation
 encontrado na distribuição do código-fonte do kernel. Comece com o arquivo de
-nível superior :ref:`process/howto.rst <process_howto>`; leia também
-:ref:`process/submitting-patches.rst <submittingpatches>`. Muitas APIs internas
+nível superior :ref:`process/howto.rst <pt_process_howto>`; leia também
+:ref:`process/submitting-patches.rst
+<pt_BR_submittingpatches>`. Muitas APIs internas
 do kernel são documentadas usando o mecanismo kerneldoc; "make htmldocs" ou
 "make pdfdocs" podem ser usados para gerar esses documentos em formato HTML ou
 PDF (embora a versão do TeX fornecida por algumas distribuições esbarre em
@@ -37,7 +38,7 @@ Há uma série de livros sobre o desenvolvimento do kernel:
 
 	Linux Kernel Development (Robert Love).
 
-    Understanding the Linux Kernel (Daniel Bovet and Marco Cesati).
+	Understanding the Linux Kernel (Daniel Bovet and Marco Cesati).
 
 Todos esses livros, no entanto, sofrem de um defeito comum: eles tendem a estar
 um pouco obsoletos quando chegam às prateleiras, e já estão nelas há algum
diff --git a/Documentation/translations/pt_BR/process/email-clients.rst b/Documentation/translations/pt_BR/process/email-clients.rst
index ed8c810d3..962d8d7a0 100644
--- a/Documentation/translations/pt_BR/process/email-clients.rst
+++ b/Documentation/translations/pt_BR/process/email-clients.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_email_clients:
+
 Informações sobre clientes de email para Linux
 ==============================================
 
@@ -321,14 +323,14 @@ Para colocar juízo no editor interno, faça o seguinte:
 
   - Defina ``mailnews.send_plaintext_flowed`` como ``false``
 
-    - Altere ``mailnews.wraplength`` de ``72`` para ``0`` **ou** instale a
-      extensão "Toggle Line Wrap"
+  - Altere ``mailnews.wraplength`` de ``72`` para ``0`` **ou** instale a
+    extensão "Toggle Line Wrap"
 
-      https://github.com/jan-kiszka/togglelinewrap
+    https://github.com/jan-kiszka/togglelinewrap
 
-      https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
+    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
 
-      para controlar esse registro dinamicamente.
+    para controlar esse registro dinamicamente.
 
 - Não escreva mensagens em HTML! Vá até a janela principal
   :menuselection:`Menu Principal-->Configurações da Conta-->suaconta@servidor.algo-->Composição e Endereçamento`!
diff --git a/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst b/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
index ae1fda088..2d13b335b 100644
--- a/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
@@ -29,7 +29,7 @@ A equipe lida apenas com o desenvolvimento de correções para problemas de
 segurança de hardware sob embargo. Relatos de bugs de segurança de software puro
 no kernel Linux não são tratados por esta equipe, e o autor do relato será
 orientado a contatar a equipe regular de segurança do kernel Linux
-(:ref:`Documentation/admin-guide/ <securitybugs>`) em vez disso.
+(:ref:`Documentation/admin-guide/ <pt_BR_securitybugs>`) em vez disso.
 
 A equipe pode ser contatada por e-mail em <hardware-security@kernel.org>. Esta
 é uma lista privada de oficiais de segurança que ajudarão você a coordenar uma
diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documentation/translations/pt_BR/process/howto.rst
index 54ea7fad8..518e62d37 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -124,7 +124,7 @@ que são de leitura obrigatória:
     estão sujeitos a um escrutínio de conteúdo e estilo), mas não segui-las
     quase sempre o impedirá.
 
-Outras excelentes descrições de como criar patches adequadamente são:
+    Outras excelentes descrições de como criar patches adequadamente são:
 
 	"O Patch Perfeito"
 		https://www.ozlabs.org/~akpm/stuff/tpp.txt
@@ -132,7 +132,7 @@ Outras excelentes descrições de como criar patches adequadamente são:
 	"Formato de Submissão de Patch do Kernel Linux"
 		https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html
 
-  :ref:`Documentation/process/stable-api-nonsense.rst <stable_api_nonsense>`
+  :ref:`Documentation/translations/pt_BR/process/stable-api-nonsense.rst <pt_BR_stable_api_nonsense>`
     Este arquivo descreve a justificativa por trás da decisão consciente de
     não ter uma API estável dentro do kernel, incluindo pontos como:
 
diff --git a/Documentation/translations/pt_BR/process/stable-api-nonsense.rst b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
index c5d0e643e..4912048f4 100644
--- a/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
+++ b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_stable_api_nonsense:
+
 A interface de drivers do kernel Linux
 =======================================
 
diff --git a/Documentation/translations/pt_BR/process/submit-checklist.rst b/Documentation/translations/pt_BR/process/submit-checklist.rst
index 3e0ee38b9..d5706bfe2 100644
--- a/Documentation/translations/pt_BR/process/submit-checklist.rst
+++ b/Documentation/translations/pt_BR/process/submit-checklist.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _pt_BR_submitchecklist:
+
 ==============================================================
 Lista de verificação para submissão de patches do kernel Linux
 ==============================================================
@@ -59,7 +61,7 @@ Forneça documentação
 
 5) Todas as novas interfaces com o espaço de usuário (userspace) devem ser
    documentadas em ``Documentation/ABI/``. Consulte
-   ``Documentation/admin-guide/abi.rst`` (ou ``Documentation/ABI/README``)
+   Documentation/admin-guide/abi.rst (ou ``Documentation/ABI/README``)
    para obter mais informações. Patches que alteram interfaces de espaço
    de usuário devem incluir em cópia (CC) linux-api@vger.kernel.org.
 
-- 
2.47.3

