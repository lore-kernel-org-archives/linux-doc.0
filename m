Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26856296BD3
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777613472; cv=none; b=EqQ1uvc49DKUx22csOIsu9kkKaVGgBcRf/sM8yrANj0dP35NoLh6DjqEyvH2S+FJKu6+cVxHFRGeywNuPbpgZboz0Jb/NGWKo6WH6ex/ZH3AXDYbQ/pABeISUAuhIklfj9MA4KAcw0ERlU5p7V0E8r43SOUQOiWxbzuhdi4/7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777613472; c=relaxed/simple;
	bh=DHFuz9Y5gefIPkGS/JwzrKHRUS7tkbxl54T1FybZWec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gA0jzoUxacaTcEkUJ3E8M3KhwQeX896pP/qjq2/yJXv9r3kbqNT11qkkcxDixq2OU+UXzGQ6YqaP3OAOwQBdNk2hgpStRouRRLe1kp7ltdrksUrvv9hFBklkSoNL9rPDm5TyRh91dJf4XINSwXy/14knkLoCZ4OAoAp0hpl1jfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JplIsWUT; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JplIsWUT"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ee1054627bso810219eec.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777613469; x=1778218269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ+hMJZAifHvrH5mX7+WHR00okQCT8O9i5X+3a8pv8c=;
        b=JplIsWUT5dXuqAUqpF+XBxg3CSbsk+sZZR2RcS1tO0TVFEpKf5dfVWECXJUdwsctZb
         zP+83jKiUeLIgQ6TFJGPSarSBmkcVJbCL/dFpl/xWOEe9Gb4qZtVv4uwtkrwwJlffxdU
         N+4Bv2sM3fKyiYl20RabZpk0xiKz7RRQ/Y0o7/AXIdhQWLhsk+YKwU4grzhTj+2wUivm
         wECxIuxyB6i5Ku2IuswqOUcIjA2/33qgjMDwHuy/HBYKDlTPXt9rGZhWQTiWhxlaRPeE
         x0tQauZXpHEkZUcElfPkD5ZXJ2Hi3e+VPfZQgOnyJPTfPr23QrZIOSi76DgGaSPSzK2e
         XfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777613469; x=1778218269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ+hMJZAifHvrH5mX7+WHR00okQCT8O9i5X+3a8pv8c=;
        b=BN1kz1LEZDz/Ku9m1RUYKKPdfpvviVGZFHDOSeLuIjlFea0xzoy3+uBFlL0lLzvBGC
         l77gC6PPLJ8puaImzgx/YjdOBuhKHUffaDUWtbWve0ZAv1/i5NEVD/mvZlNRi4dExNRv
         6J23a7dIyi704UTAoTNVn3dana/NODAuNqrqdPZqfRqHPnvnhgyTLDsbuSejfJ64mNz/
         3YzVwfEN4EKon4uc+msyB+ftJGHVFTEXdlsfuLSjv8FUrI8xfd0NI0bNiZ6kpoOi1lY0
         Fpl0OVi82mGbVDHY3I8hqRhe7dAMN0aJagtoegK3NLR+LzhqLJFNCCe6V3pXtirjI6JV
         7Qow==
X-Gm-Message-State: AOJu0Yw/datZsNT8kpKVfJw46yuxXhG17qODGNG6Y/ZytDrHoEoiTWUG
	942X8PsiPPxxnXhif41LHOLqf1SICajEhfE0WATE+yP0+cBGPMFOalOnAi/3ww==
X-Gm-Gg: AeBDiesw000Tz0adOrzT+xGkBZzc/+sNHSOpinf/j+QmqyF8VVPEaBGGpYGBs4PjXo2
	RV58yUzkgQhfA4UgzmxMvb1jZjWEyCKnTPp/8loRuocusItunIjPjeVEvOalL1W2VBV8aFvj/GY
	y1t+CGHh0lbNjhxA0dARkIYtkBOxlPBZ3RumQmU5vb5jTt/Bw1PfnxipKalngWyhP73vvOV25fc
	59pYBiJJlYR72YSHs3KBay3KKO6eKTnilL1auW7JG/HgyhKYbRxngcRINVTiZH8IWlTzH7pBTSF
	/6wI1bG+I7fqDkhC46aIbd5sTcNOSNDpuSJFCV3BVg0R8bYKhF6ouaTUgTGAnpzaEiLfWjCDJj8
	p/fAF3Whq4mN8uQ5PViMzk7spnT65pe2hDL3u3lqtUwV3jUtvlnnMJpeP6ezU2VKTxPxurBB4yq
	bBKatrVyAsGK4cmjLtYqLOhJIQzLa7ajC4ZI4lMlOsPHLlavgr3FMbLaPSOIysrcLMJ13wty6+m
	IwVGq/uzOPmADgn
X-Received: by 2002:a05:7301:608b:b0:2df:498e:811b with SMTP id 5a478bee46e88-2ed4dcf17f4mr2294738eec.7.1777613468646;
        Thu, 30 Apr 2026 22:31:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:41bd:9c31:9999:f077:a3ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3c24e738sm3041927eec.31.2026.04.30.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 22:31:07 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs: pt_BR: translate process/license-rules.rst
Date: Fri,  1 May 2026 02:30:43 -0300
Message-ID: <20260501053046.666628-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the license-rules.rst document into Brazilian Portuguese.
This document provides guidelines on how licenses should be identified
and handled within the kernel source code.

Additionally, update the pt_BR/process/index.rst to include the new
translation in the documentation tree.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/license-rules.rst           | 484 ++++++++++++++++++
 2 files changed, 485 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/license-rules.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 4a094d8b7..77c1a1cdc 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -67,6 +67,7 @@ kernel e sobre como ver seu trabalho integrado.
    :maxdepth: 1
 
    Introdução <process/1.Intro>
+   Regras de licenciamento <process/license-rules>
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
    Conclave (Continuidade do projeto) <process/conclave>
diff --git a/Documentation/translations/pt_BR/process/license-rules.rst b/Documentation/translations/pt_BR/process/license-rules.rst
new file mode 100644
index 000000000..93ecc57f3
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/license-rules.rst
@@ -0,0 +1,484 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Regras de licenciamento do kernel Linux
+=======================================
+
+O Kernel Linux é fornecido apenas sob os termos da licença GNU General Public
+License versão 2 (GPL-2.0), conforme estabelecido em LICENSES/preferred/GPL-2.0,
+com uma exceção explícita para syscalls descrita em
+LICENSES/exceptions/Linux-syscall-note, conforme descrito no arquivo COPYING.
+
+Este arquivo de documentação fornece uma descrição de como cada arquivo-fonte
+deve ser anotado para tornar sua licença clara e inequívoca. Ele não substitui
+a licença do Kernel.
+
+A licença descrita no arquivo COPYING aplica-se ao código-fonte do kernel como
+um todo, embora arquivos-fonte individuais possam ter uma licença diferente, a
+qual deve ser obrigatoriamente compatível com a GPL-2.0::
+
+    GPL-1.0+  :  GNU General Public License v1.0 ou posterior
+    GPL-2.0+  :  GNU General Public License v2.0 ou posterior
+    LGPL-2.0  :  GNU Library General Public License v2 apenas
+    LGPL-2.0+ :  GNU Library General Public License v2 ou posterior
+    LGPL-2.1  :  GNU Lesser General Public License v2.1 apenas
+    LGPL-2.1+ :  GNU Lesser General Public License v2.1 ou posterior
+
+Além disso, arquivos individuais podem ser fornecidos sob uma licença dupla
+(dual license), por exemplo, uma das variantes GPL compatíveis e,
+alternativamente, sob uma licença permissiva como BSD, MIT, etc.
+
+Os arquivos de cabeçalho da API do espaço do usuário (UAPI), que descrevem a
+interface dos programas do espaço do usuário com o kernel, são um caso especial.
+De acordo com a nota no arquivo COPYING do kernel, a interface de syscall é um
+limite claro, que não estende os requisitos da GPL a qualquer software que a
+utilize para se comunicar com o kernel. Como os cabeçalhos UAPI devem ser
+passíveis de inclusão em quaisquer arquivos-fonte que criem um executável
+executado no kernel Linux, a exceção deve ser documentada por uma expressão de
+licença especial.
+
+A forma comum de expressar a licença de um arquivo-fonte é adicionar o texto
+padrão (boilerplate) correspondente no comentário inicial do arquivo. Devido a
+variações de formatação, erros de digitação, etc., esses "textos padrão" são
+difíceis de validar por ferramentas usadas no contexto de conformidade de
+licença.
+
+Uma alternativa aos textos padrão é o uso de identificadores de licença
+Software Package Data Exchange (SPDX) em cada arquivo-fonte. Os identificadores
+de licença SPDX são abreviações precisas e analisáveis por máquina para a
+licença sob a qual o conteúdo do arquivo é contribuído. Os identificadores de
+licença SPDX são gerenciados pelo Grupo de Trabalho SPDX na Linux Foundation e
+foram acordados por parceiros em toda a indústria, fornecedores de ferramentas
+e equipes jurídicas. Para mais informações, consulte https://spdx.org/
+
+O kernel Linux exige o identificador SPDX preciso em todos os arquivos-fonte.
+Os identificadores válidos usados no kernel são explicados na seção
+`Identificadores de Licença`_ e foram obtidos da lista de licenças
+oficial do  SPDX em https://spdx.org/licenses/ junto com os textos das licenças.
+
+Sintaxe do identificador de licença
+-----------------------------------
+
+1. Posicionamento:
+
+   O identificador de licença SPDX em arquivos do kernel deve ser adicionado na
+   primeira linha possível do arquivo que possa conter um comentário. Para a
+   maioria dos arquivos, esta é a primeira linha, exceto para scripts que
+   requerem o '#!CAMINHO_PARA_INTERPRETADOR' na primeira linha. Para esses
+   scripts, o identificador de licença SPDX deve ser colocado na segunda linha.
+
+   A linha do identificador de licença pode então ser seguida por uma ou
+   múltiplas linhas de SPDX-FileCopyrightText, se desejado.
+
+|
+2. Estilo:
+
+   O identificador de licença SPDX é adicionado na forma de um comentário. O
+   estilo do comentário depende do tipo de arquivo::
+
+      Fonte C:    // SPDX-License-Identifier: <Expressão de Licença SPDX>
+      Cabeçalho C:/* SPDX-License-Identifier: <Expressão de Licença SPDX> */
+      ASM:        /* SPDX-License-Identifier: <Expressão de Licença SPDX> */
+      scripts:    # SPDX-License-Identifier: <Expressão de Licença SPDX>
+      .rst:       .. SPDX-License-Identifier: <Expressão de Licença SPDX>
+      .dts{i}:    // SPDX-License-Identifier: <Expressão de Licença SPDX>
+
+   Se uma ferramenta específica não conseguir lidar com o estilo de comentário
+   padrão, então deve ser utilizado o mecanismo de comentário apropriado que a
+   ferramenta aceite. Este é o motivo para ter o comentário no estilo ``/* */``
+   em arquivos de cabeçalho C. Foi observada uma quebra de build com arquivos
+   .lds gerados, onde o 'ld' falhou ao analisar o comentário C++. Isso já foi
+   corrigido, mas ainda existem ferramentas de assembler mais antigas que não
+   conseguem lidar com comentários no estilo C++.
+
+3. Sintaxe:
+
+   Uma <Expressão de Licença SPDX> pode ser um identificador SPDX simplificado
+   encontrado na Lista de Licenças SPDX, ou a combinação de dois desses
+   identificadores separados por "WITH", caso uma exceção de licença se aplique.
+   Quando múltiplas licenças são aplicáveis, a expressão utiliza as palavras-chave
+   "AND" ou "OR" para separar as sub-expressões, que devem ser delimitadas
+   por parênteses "(", ")".
+
+   Para licenças como [L]GPL, utiliza-se o sufixo "+" para indicar a opção
+   'ou posterior'::
+
+      // SPDX-License-Identifier: GPL-2.0+
+      // SPDX-License-Identifier: LGPL-2.1+
+
+   O termo "WITH" deve ser usado sempre que houver um modificador necessário
+   para a licença. Por exemplo, os arquivos UAPI do kernel Linux utilizam a
+   expressão::
+
+      // SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+      // SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note
+
+   Outros exemplos de uso da cláusula "WITH" para exceções no kernel são::
+
+      // SPDX-License-Identifier: GPL-2.0 WITH mif-exception
+      // SPDX-License-Identifier: GPL-2.0+ WITH GCC-exception-2.0
+
+   As exceções só podem ser aplicadas a identificadores de licença específicos.
+   Os identificadores válidos estão listados nas tags do arquivo de texto de
+   cada exceção. Para detalhes, veja o ponto `Exceções`_ no capítulo
+   `Identificadores de Licença`_.
+
+   O termo "OR" deve ser usado se o arquivo possuir licenciamento duplo (dual
+   licensed) e apenas uma das licenças puder ser selecionada. Por exemplo,
+   alguns arquivos dtsi estão disponíveis sob licença dupla::
+
+      // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+   Exemplos de expressões para arquivos com licenciamento duplo no kernel::
+
+      // SPDX-License-Identifier: GPL-2.0 OR MIT
+      // SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+      // SPDX-License-Identifier: GPL-2.0 OR Apache-2.0
+      // SPDX-License-Identifier: GPL-2.0 OR MPL-1.1
+      // SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT
+      // SPDX-License-Identifier: GPL-1.0+ OR BSD-3-Clause OR OpenSSL
+
+   O termo "AND" deve ser usado se o arquivo possuir múltiplas licenças cujos
+   termos devem ser aplicados simultaneamente. Por exemplo, se um código herdado
+   de outro projeto foi incorporado ao kernel, mas os termos da licença original
+   ainda precisam ser respeitados::
+
+      // SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) AND MIT
+
+   Outro exemplo onde ambos os conjuntos de termos devem ser cumpridos é::
+
+      // SPDX-License-Identifier: GPL-1.0+ AND LGPL-2.1+
+
+Identificadores de Licença
+--------------------------
+
+As licenças atualmente em uso, bem como as licenças para código adicionado ao
+kernel, podem ser divididas em:
+
+4. _`Licenças preferenciais`:
+
+   Sempre que possível, estas licenças devem ser utilizadas, pois são conhecidas
+   por serem totalmente compatíveis e amplamente usadas. Estas licenças estão
+   disponíveis no diretório::
+
+      LICENSES/preferred/
+
+   na árvore de diretórios do código-fonte do kernel.
+
+   Os arquivos neste diretório contêm o texto completo da licença e as
+   `Metatags`_. Os nomes dos arquivos são idênticos ao identificador de licença
+   SPDX que deve ser utilizado para a licença nos arquivos-fonte.
+
+   Exemplos::
+
+      LICENSES/preferred/GPL-2.0
+
+   Contém o texto da licença GPL versão 2 e as metatags obrigatórias::
+
+      LICENSES/preferred/MIT
+
+   Contém o texto da licença MIT e as metatags obrigatórias.
+
+   _`Metatags`:
+
+   As seguintes metatags devem estar presentes em um arquivo de licença:
+
+   - Valid-License-Identifier:
+
+     Uma ou mais linhas que declaram quais Identificadores de Licença são válidos
+     dentro do projeto para referenciar este texto de licença específico.
+     Geralmente, trata-se de um único identificador válido, mas, por exemplo,
+     para licenças com as opções 'ou posterior' (or later), dois identificadores
+     são válidos.
+
+   - SPDX-URL:
+
+     A URL da página SPDX que contém informações adicionais relacionadas à licença.
+
+   - Usage-Guidance:
+
+     Texto livre para conselhos de uso. O texto deve incluir exemplos corretos
+     para os identificadores de licença SPDX, conforme eles devem ser colocados
+     nos arquivos-fonte de acordo com as diretrizes de
+     `Sintaxe do identificador de licença`_.
+
+   - License-Text:
+
+     Todo o texto após esta tag é tratado como o texto original da licença.
+
+   Exemplos de formato de arquivo::
+
+      Valid-License-Identifier: GPL-2.0
+      Valid-License-Identifier: GPL-2.0+
+      SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
+      Usage-Guide:
+        Para usar esta licença no código-fonte, coloque um dos seguintes pares
+        SPDX tag/valor em um comentário, de acordo com as diretrizes de
+        posicionamento na documentação das regras de licenciamento.
+        Para 'GNU General Public License (GPL) version 2 only', use:
+          SPDX-License-Identifier: GPL-2.0
+        Para 'GNU General Public License (GPL) version 2 or any later version', use:
+          SPDX-License-Identifier: GPL-2.0+
+      License-Text:
+        Texto completo da licença
+
+   ::
+
+      Valid-License-Identifier: MIT
+      SPDX-URL: https://spdx.org/licenses/MIT.html
+      Usage-Guide:
+        Para usar esta licença no código-fonte, coloque o seguinte par SPDX
+        tag/valor em um comentário, de acordo com as diretrizes de
+        posicionamento na documentação das regras de licenciamento.
+          SPDX-License-Identifier: MIT
+      License-Text:
+        Texto completo da licença
+
+5. Licenças obsoletas:
+
+   Estas licenças devem ser utilizadas apenas para código já existente ou para
+   a importação de código de outros projetos. Estas licenças estão disponíveis
+   no diretório::
+
+      LICENSES/deprecated/
+
+   na árvore de fontes do kernel.
+
+   Os arquivos neste diretório contêm o texto completo da licença e as
+   `Metatags`_. Os nomes dos arquivos são idênticos ao identificador de
+   licença SPDX que deve ser utilizado para a licença nos arquivos fonte.
+
+   Exemplos::
+
+      LICENSES/deprecated/ISC
+
+   Contém o texto da licença *Internet Systems Consortium* e as metatags
+   necessárias::
+
+      LICENSES/deprecated/GPL-1.0
+
+   Contém o texto da licença GPL versão 1 e as metatags necessárias.
+
+   Metatags:
+
+   Os requisitos de metatags para "outras" licenças são idênticos aos
+   requisitos das `Licenças preferenciais`_.
+
+   Exemplo de formato de arquivo::
+
+      Valid-License-Identifier: ISC
+      SPDX-URL: https://spdx.org/licenses/ISC.html
+      Usage-Guide:
+        O uso desta licença no kernel para novos códigos é desencorajado
+        e deve ser utilizada exclusivamente para importar código de um
+        projeto já existente.
+        Para usar esta licença no código-fonte, coloque o seguinte par
+        tag/valor SPDX em um comentário, seguindo as diretrizes de
+        posicionamento na documentação das regras de licenciamento.
+          SPDX-License-Identifier: ISC
+      License-Text:
+        Texto completo da licença
+
+6. Apenas Licenciamento Duplo
+
+   Estas licenças devem ser usadas apenas para o licenciamento duplo de código
+   com outra licença, além de uma licença preferencial. Estas licenças estão
+   disponíveis no diretório::
+
+      LICENSES/dual/
+
+   No código-fonte do kernel.
+
+   Os arquivos neste diretório contêm o texto completo da licença e as
+   `Metatags`_. Os nomes dos arquivos são idênticos ao identificador de licença
+   SPDX que deve ser usado para a licença nos arquivos fonte.
+
+   Exemplos::
+
+      LICENSES/dual/MPL-1.1
+
+   Contém o texto da licença Mozilla Public License versão 1.1 e as metatags
+   necessárias::
+
+      LICENSES/dual/Apache-2.0
+
+   Contém o texto da licença Apache License versão 2.0 e as metatags
+   necessárias.
+
+   Metatags:
+
+   Os requisitos de metatags para 'outras' licenças são idênticos aos
+   requisitos das `Licenças preferenciais`_.
+
+   Exemplo de formato de arquivo::
+
+      Valid-License-Identifier: MPL-1.1
+      SPDX-URL: https://spdx.org/licenses/MPL-1.1.html
+      Usage-Guide:
+        NÃO use. A licença MPL-1.1 não é compatível com a GPL2. Ela só pode ser
+        usada para arquivos com licenciamento duplo onde a outra licença seja
+        compatível com a GPL2.
+        Se você acabar utilizando-a, ela DEVE ser usada em conjunto com uma
+        licença compatível com a GPL2 utilizando "OR".
+        Para usar a Mozilla Public License versão 1.1, coloque o seguinte par
+        tag/valor SPDX em um comentário, de acordo com as diretrizes de
+        posicionamento na documentação das regras de licenciamento:
+      SPDX-License-Identifier: MPL-1.1
+      License-Text:
+        Texto completo da licença
+
+|
+
+7. _`Exceções`:
+
+Algumas licenças podem ser alteradas com exceções que concedem certos direitos
+   que a licença original não concede. Estas exceções estão disponíveis no
+   diretório::
+
+      LICENSES/exceptions/
+
+   no código-fonte do kernel. Os arquivos neste diretório contêm o texto completo
+   da exceção e as `Metatags de Exceção`_ necessárias.
+
+   Exemplos::
+
+      LICENSES/exceptions/Linux-syscall-note
+
+   Contém a exceção de syscall do Linux, conforme documentado no arquivo COPYING
+   do kernel Linux, que é usada para arquivos de cabeçalho UAPI.
+   ex: /\* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note \*/::
+
+      LICENSES/exceptions/GCC-exception-2.0
+
+   Contém a 'exceção de vinculação' do GCC, que permite
+   vincular qualquer binário, independente de sua licença, à versão compilada
+   de um arquivo marcado com esta exceção. Isso é necessário para criar
+   executáveis funcionais a partir de código-fonte que não seja compatível
+   com a GPL.
+
+   _`Metatags de Exceção`:
+
+   As seguintes meta tags devem estar disponíveis em um arquivo de exceção:
+
+   - SPDX-Exception-Identifier:
+
+     Um identificador de exceção que pode ser usado com identificadores de
+     licença SPDX.
+
+   - SPDX-URL:
+
+     A URL da página SPDX que contém informações adicionais relacionadas
+     à exceção.
+
+   - SPDX-Licenses:
+
+     Uma lista separada por vírgulas de identificadores de licença SPDX para os
+     quais a exceção pode ser usada.
+
+   - Usage-Guidance:
+
+     Texto de formato livre para conselhos de uso. O texto deve ser seguido por
+     exemplos corretos para os identificadores de licença SPDX, conforme devem
+     ser colocados nos arquivos fonte de acordo com as diretrizes de
+     `Sintaxe do identificador de licença`_.
+
+   - Exception-Text:
+
+     Todo o texto após esta tag é tratado como o texto original da exceção.
+
+   Exemplos de formato de arquivo::
+
+      SPDX-Exception-Identifier: Linux-syscall-note
+      SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
+      SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, LGPL-2.1, LGPL-2.1+
+      Usage-Guidance:
+        Esta exceção é usada em conjunto com uma das SPDX-Licenses acima para
+        marcar arquivos de cabeçalho de API do espaço do usuário (uapi), para que
+        possam ser incluídos em código de aplicativo de espaço do usuário que não
+        esteja em conformidade com a GPL.
+        Para usar esta exceção, adicione-a com a palavra-chave WITH a um dos
+        identificadores na tag SPDX-Licenses:
+          SPDX-License-Identifier: <SPDX-License> WITH Linux-syscall-note
+      Exception-Text:
+        Texto completo da exceção
+
+Exemplos de formato de arquivo::
+
+      SPDX-Exception-Identifier: GCC-exception-2.0
+      SPDX-URL: https://spdx.org/licenses/GCC-exception-2.0.html
+      SPDX-Licenses: GPL-2.0, GPL-2.0+
+      Usage-Guidance:
+        A "GCC Runtime Library exception 2.0" é usada em conjunto com uma das
+        SPDX-Licenses acima para código importado da biblioteca de tempo de
+        execução (runtime) do GCC.
+        Para usar esta exceção, adicione-a com a palavra-chave WITH a um dos
+        identificadores na tag SPDX-Licenses:
+          SPDX-License-Identifier: <SPDX-License> WITH GCC-exception-2.0
+      Exception-Text:
+        Texto completo da exceção
+
+Todos os identificadores de licença e exceções SPDX devem ter um arquivo
+correspondente nos subdiretórios LICENSES. Isso é necessário para permitir a
+verificação por ferramentas (ex: checkpatch.pl) e para que as licenças estejam
+prontas para leitura e extração diretamente da fonte, o que é recomendado por
+várias organizações de FOSS (Software Livre e de Código Aberto), como a
+`iniciativa REUSE da FSFE <https://reuse.software/>`_.
+
+_`MODULE_LICENSE`
+-----------------
+
+   Módulos carregáveis do kernel também exigem uma tag MODULE_LICENSE(). Esta tag
+   não substitui as informações adequadas de licença do código-fonte
+   (SPDX-License-Identifier), nem é de forma alguma relevante para expressar ou
+   determinar a licença exata sob a qual o código-fonte do módulo é fornecido.
+
+   O único propósito desta tag é fornecer informações suficientes ao carregador
+   de módulos do kernel e às ferramentas de espaço do usuário sobre o módulo ser
+   software livre ou proprietário.
+
+   As strings de licença válidas para MODULE_LICENSE() são::
+
+      ============================= =============================================
+      "GPL"                         O módulo está licenciado sob a GPL versão 2.
+                                    Isso não expressa nenhuma distinção entre
+                                    GPL-2.0-only ou GPL-2.0-or-later. A informação
+                                    exata da licença só pode ser determinada por
+                                    meio das informações de licença nos arquivos
+                                    fonte correspondentes.
+
+      "GPL v2"                      O mesmo que "GPL". Existe por razões
+                                    históricas.
+
+      "GPL and additional rights"   Variante histórica para expressar que o fonte
+                                    do módulo possui licenciamento duplo sob uma
+                                    variante da GPL v2 e a licença MIT. Por favor,
+                                    não use em códigos novos.
+
+      "Dual MIT/GPL"                A maneira correta de expressar que o módulo
+                                    possui licenciamento duplo sob uma escolha de
+                                    variante GPL v2 ou licença MIT.
+
+      "Dual BSD/GPL"                O módulo possui licenciamento duplo sob uma
+                                    escolha de variante GPL v2 ou licença BSD. A
+                                    variante exata da licença BSD só pode ser
+                                    determinada por meio das informações de
+                                    licença nos arquivos fonte correspondentes.
+
+      "Dual MPL/GPL"                O módulo possui licenciamento duplo sob uma
+                                    escolha de variante GPL v2 ou Mozilla Public
+                                    License (MPL). A variante exata da licença
+                                    MPL só pode ser determinada por meio das
+                                    informações de licença nos arquivos fonte
+                                    correspondentes.
+
+      "Proprietary"                 O módulo está sob uma licença proprietária.
+                                    "Proprietary" deve ser entendido apenas como
+                                    "A licença não é compatível com GPLv2". Esta
+                                    string é exclusiva para módulos de terceiros
+                                    não compatíveis com GPL2 e não pode ser usada
+                                    para módulos que tenham seu código-fonte na
+                                    árvore do kernel. Módulos marcados dessa forma
+                                    contaminam (tainting) o kernel com a flag 'P'
+                                    quando carregados, e o carregador de módulos
+                                    recusa-se a vincular tais módulos a símbolos
+                                    exportados com EXPORT_SYMBOL_GPL().
+      ============================= =============================================
\ No newline at end of file
-- 
2.47.3

