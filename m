Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838662F12B3
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777824275; cv=none; b=ARqBGpsiANVgD0m63lEkyomOO+vGjZx40jlyM3xltvSq1inPEcRRxl4N8MV/4sT8ZzoRCtqS8TextilAm3SvZPP5IU66R6LoWi9NFpiatPgLFr2UbkVhsLofidNxQSf59H0+I901CRY75gurmD6jjkN7uW7rdRPgLN8DrhlarNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777824275; c=relaxed/simple;
	bh=WRZmx0kHOAYOybVO0ESNOts3ILRcgieeum80GDm4tJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FGD4SRNjp2BPy/9WQC1ksLQypmhf2u5dnPJmMyFhVHPDA6n5e00WBuKKOA7/sD2AQo0jiIUpenbx4/4OsGoygHKc1j2stxJow4to+RJFXOW4orynWWFalacPxrxP7C8lfUPn2xvUYmWDa1zimvFen034TlkMzFq6JUPvJg+OZ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sT0YF+Uy; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sT0YF+Uy"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso7602592c88.0
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777824272; x=1778429072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMwCPnBS7KtwJu47xXY0FmBRY4LiJsbsxHFEvz/TWmg=;
        b=sT0YF+UyBqZRWAw98IayU41qnquyEzkZWonduCp8Keb6zc7QYuHOcwjnFji4/kAfsk
         fiBwKkCz38qXj38+T2204OO71z4CW9oP1F+krVN1LI9lj68+6uv4qvTa7tVaESV3y7/v
         WFyyjHGlVd8B9EAfk8o2LptyxHtmM8PW6ObEqaNhI9ibPPMdbjGSfvRoBs6DKyKs2epy
         y1E0QaB3T0hwXDiJ2tj43qDagMY7CVHh5NQaLlTN/uN0qxBeycxHP3rNOK7cKF5N4mM+
         R3YO+Q5IBVOUgB4xkjVw2IyCaQUdSYvj8jC0DvTr+2NiBdM8gxIbCWCZfbQy9Ia+yTl4
         Ak6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777824272; x=1778429072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMwCPnBS7KtwJu47xXY0FmBRY4LiJsbsxHFEvz/TWmg=;
        b=kHc8csXdumoM+EXFyBTEXiU7HiCkYrGKhyuTiXPuIvXVpycBnqKEUKJdn0f4LnIfZB
         zT3xpn2bF3SbS8pvAE1hrl1/qxnpkLQVwPL03P8aajHsFme/6VDqX+3gmuY4ELDPYKGU
         nAl1DQ9S8ulQZjJWC++mAzBHg6eNgU9m+4erHJnPKdL398YQuvijmGInoGMR4bwweH/R
         Sd4SYUHgeCENaHG4ZsmQTO0CijVpVNqiqgNMOP1s8xEk13GanTniXhkcg9tMqTPzQQAz
         t+P2U7wAEWUgSS+2o0e+dY4VLlTl25CkkX6NHjO+vJhMgb9cE8bM5/xMrOfnfiXUyZX7
         saZg==
X-Gm-Message-State: AOJu0YzSpXeDRC/ughwr6sYeQJ79uilgi3r52odIcPu2LcKsarq3pOrY
	ZHi/MlJjMU1S0ZSAHC0Qdc0VTPFxESG7ClCNqOINd28ryDsve84cZiJd8xTHYw==
X-Gm-Gg: AeBDieuHVPyNnOBZIFe/b0dA9TGT5gHUmQHUvkcBbHqyoGFQ5bfRfzgwORadAalyVgM
	zLjdDCE2nRvrWvpY0FTLspQRO7LlkD/AofAJJ2zselZxM33S/Y5B7/M8XdiS7K7tvLonamD0Zev
	lgVrEQBArR1sZPUL7t0UWBE4h/PcrEO93SJnEC60bfo6eeOdYYsorBAlkkiZnwbHNfbaMQJeXY3
	zNYgCCZJAMT1ab8ioJv5K8kkhqA3oNAecPHlrsQhv9vv/HVhx5emNi7pLxtzFUuO3k5IlFCe7AO
	rfol685QDbSGPt2JsXPqcVJDUwu4D9fKH7dwFMwnXPKuid4US/lTKaD3SzuVr7pDSwpJ/TH55Xk
	ZYTodPi4ziUI0qGsLVDnLWhfFs2o7w4KrgHUkiUj5vWcxwAZ29Ke/RgtMsFxt0weHtGzhjNw8um
	HcWU4NiNHLHB7BRD9zpkiC8/f8y57rV1KLYVdYN5goVm4FQrqJd3xrPsFV1HgRbfdfOH/5zQJJf
	dPGz5jgtPY67/lu
X-Received: by 2002:a05:7022:1288:b0:12d:ea4f:989f with SMTP id a92af1059eb24-12dfd87b4famr3306769c88.41.1777824271643;
        Sun, 03 May 2026 09:04:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:41bd:9c31:9999:f077:a3ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df845e220sm13299700c88.15.2026.05.03.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:04:31 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2] docs: pt_BR: translate process/license-rules.rst
Date: Sun,  3 May 2026 13:03:50 -0300
Message-ID: <20260503160352.160135-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the license-rules.rst document into Brazilian Portuguese.
This document provides guidelines on how licenses should be identified
and handled within the kernel source code.

Additionally, update the pt_BR/process/index.rst to include the new
translation in the documentation tree.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

---
v2:
  - Fixed docutils warning: "Line block ends without a blank line" on line 72.
  - Removed stray '|' character from the translation file to fix the build.
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/license-rules.rst           | 483 ++++++++++++++++++
 2 files changed, 484 insertions(+)
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
index 000000000..1e395dfea
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/license-rules.rst
@@ -0,0 +1,483 @@
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

