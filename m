Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E438DC5F
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 23:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787267573; cv=none; b=ejZB9sNrrkLjKd5wpOef0AIAFgrj7k0SU3Fb+jkD36ZuNTK2SrOEftEcRCs6mjxEEqGErlzFqd4mXneFODRKGGb2dk98WxXQPdNEf4THOIdX6W/vTPGXMV7KWsKykE1cGJf0kej/2LMpIPBhCAZRT8nd3lBIj2xpyARQg7UD7ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787267573; c=relaxed/simple;
	bh=24NYxPeWqQmRT0v+q2u/XbxwBG9JeipjwM4mT00PYTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g9P+X/REY37Xe8xpOROo0DdRijBAXBg/Wt22xuvaA1XXsMvSTi/7QQk0abOcPtB9zdKwFBW8AvQOxSefL3GkK82AvIaNw7HcowK4Tailp3wJtjJ6qscLBi3d0+iO+ggXW06FIf28U703ltAWQaGwPw5uxjgpkTLnrYe7n4LAftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JykDsCZO; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JykDsCZO"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7542a2ee156so278202137.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 16:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787267569; x=1787872369; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sKQ6DBFkwJNCPzIGxLWry2KzNG21hL3BRh0DyOKG/pA=;
        b=JykDsCZOCqlyFsuzgtVSqZAqwN69EDv5oMLqjJ86sNC26Xfo7M61WG24PJNkw+ff0A
         OT2kBdzCSg8muYF8BdM+hKKpF+OeLAbhMGQvE/mlncnBr3Z5sq6m5ir3nnvRK9txkgPb
         msGOHOY1oYqmqSPYHF7ffQz00Rrldbz+wma2Sg+IeTuwB5HB2YaJxnvltDC2wfiGIixv
         ydhmpHWcH0TrffRlPsx+zuFEM8JyFbmmh3KC/xqNjAEy2eJ1/P2VvjIeUFbyRYsV4LFx
         1+qf7iEpIN+sMxkiYOiCjzUYWjxpcdBATWgF6jFCbqk8ZKLdxRZRLxI+hvdAFoQrxcc5
         HYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787267569; x=1787872369;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sKQ6DBFkwJNCPzIGxLWry2KzNG21hL3BRh0DyOKG/pA=;
        b=qEkTGH29WB/RCvYBwFY+XDhZYI1E3Fx0EL6DTiKLit/MbYzeVO+m1U7Vd1iBLExcPw
         1jYpyoJPtKYZ/xajJy0NG1O9RBsK2kJmAx9oDv95HfaKsNsqST+AD0pTPvIRiS3g5VZ7
         Q6iZrGRe9XBhMw71oyAeWH7fHObKLRSYvPgbcy58YxQjP1T0telESq9wEaGpZuexFcyk
         DfCwq2c0Evec9K8IHFgSTnr1RfNr3P0/CBQpFYVmODeohHFKxWR7F+C2zSJzdLujFCT4
         vgIqVbcfxO8ZEdJo8pCE5bpnAdPobXRAlpry7koHym7MSyhx3jL2pTGCj3PSavhRUlvx
         H4aQ==
X-Gm-Message-State: AFuF++keUPg50IpATDNiAothL55uUGbDA4Nf/66Dp+GKbVhvQjLMN+fO
	WHIsSlqFydbowtUwEgh7HCdqHa1klXC5ocA+QMcarWVKEv9VJhNKn9tj
X-Gm-Gg: AR+sD13OGnQgefAq97fc5vF0S6S317TSi0q+8ZXHakiUMJ/X5gXjIgcszgJXTNI153D
	oKnbY+dmH55cD6C4rX/HN95ILCLD4yu6ODqcN9ok/yPDkjpRPuGkinsOVnrr+5Emb3Bs/pSGArC
	5D77og1M9jwBMd6+z5uAOd/MnVyFOeZ+bT94jfcG54NiGCKiK1HwcwxOLPg7FfiOLrEiDf1FR9h
	JXePaUGijeHWE2HJi9DKqnGV2+e63uV/IlK4Zpok0HqnF3DhE+I7t8tj2OqCtgx7J1y2qUu+AnH
	wB+KarPGVzRKwwiJtk4Rzu49BboRhOfwaqMMzPqs91/ADMTHG3v7cTsNYV/ZoTj89uiqm/JRyr0
	VoDK6vAPL2Cej+AplS3xQApM2qrYji9TLEjmOq3VjDmVu0iVQmYJHQPbZ124jdDzAxVdPGqUs2i
	FKaUe0Bjftkg5eE+FV6fawDOQZgEIXuuvYweh5z54YjrdtLh4AxklVghaWzPCpVlzDk9zwzkh2n
	SNuWEIQKA==
X-Received: by 2002:a05:6102:3f9f:b0:778:9429:d51f with SMTP id ada2fe7eead31-77a64a6ab62mr1039163137.14.1787267569309;
        Thu, 20 Aug 2026 16:12:49 -0700 (PDT)
Received: from [10.112.196.110] ([187.9.129.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777ddc7edfasm7692560137.12.2026.08.20.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 16:12:48 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Date: Thu, 20 Aug 2026 20:12:34 -0300
Subject: [PATCH] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G9C6oH5FPEQbNSC1NCKC9O8WY
 S5zmHlBOQgrDNkLgW9ROV2SMs9g2cltjGKTgylMW3Rlj/6aA+pF88FIXtCdTjmBS11ZUzdEa9N
 Dyn3gVZ5/PU4xfkG3xK1qAAAA
X-Change-ID: 20260819-ptbr-stable-api-nonsense-c43d245aaf59
To: Daniel Pereira <danielmaraboo@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lucas Adryell Ramalho <lucasadramalho@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787267565; l=13157;
 i=lucasadramalho@gmail.com; h=from:subject:message-id;
 bh=24NYxPeWqQmRT0v+q2u/XbxwBG9JeipjwM4mT00PYTg=;
 b=U068mOlixVO2CiVy2CARiJ4dcVoMKdgPLb2wZi++6/3rR4Tm6n/5OhuqgQMSZjgLldNKrm2/G
 NHoMBbEHwf2BxH0V9CYCjniY5oFoWSShY10MvklIK5niJEU36LgE2x0
X-Developer-Key: i=lucasadramalho@gmail.com; a=ed25519;
 pk=m3TQ0mH3ARCg0EdGRQWOTlBoFnDen6VWMNGjXW+W4NM=

Translate Documentation/process/stable-api-nonsense.rst into Brazilian
Portuguese.

Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../pt_BR/process/stable-api-nonsense.rst          | 218 +++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..1fb2f325f 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -58,6 +58,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   A interface de drivers do kernel Linux <stable-api-nonsense>
    Estilo de gerenciamento do kernel Linux <management-style>
    Conclave (Continuidade do projeto) <conclave>
 
diff --git a/Documentation/translations/pt_BR/process/stable-api-nonsense.rst b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
new file mode 100644
index 000000000..dd3dc3e8a
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
@@ -0,0 +1,218 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _stable_api_nonsense:
+
+A interface de drivers do kernel Linux
+=======================================
+
+(todas as suas perguntas respondidas e mais algumas)
+
+Greg Kroah-Hartman <greg@kroah.com>
+
+Este texto foi escrito para tentar explicar por que o Linux **não possui uma
+interface binária do kernel nem uma interface estável do kernel**.
+
+.. note::
+
+   Observe que este artigo descreve as interfaces **internas do kernel**, e não
+   as interfaces entre o kernel e o espaço de usuário.
+
+   A interface entre o kernel e o espaço de usuário é aquela utilizada pelos
+   aplicativos: a interface de chamadas de sistema (syscalls). Essa
+   interface é **muito** estável ao longo do tempo e não será quebrada. Tenho
+   programas antigos, compilados em uma versão do kernel anterior à 0.9 e alguma
+   coisa, que ainda funcionam perfeitamente na versão mais recente do kernel
+   2.6. Essa é a interface cuja estabilidade os usuários e desenvolvedores de
+   aplicativos podem considerar garantida.
+
+
+Resumo executivo
+----------------
+
+Você acha que quer uma interface estável do kernel, mas, na verdade, não quer,
+e nem sabe disso. O que você realmente quer é um driver que continue
+funcionando de maneira estável, e isso só é possível se o seu driver estiver
+na árvore principal do kernel. Você também obtém muitos outros benefícios se
+o seu driver fizer parte da árvore principal do kernel. São esses benefícios
+que ajudaram a tornar o Linux um sistema operacional tão robusto, estável e
+maduro — justamente a razão pela qual você o está usando.
+
+
+Introdução
+----------
+
+Apenas quem escreve drivers para o kernel precisa se preocupar com as mudanças
+nas interfaces internas do kernel. Para a grande maioria das pessoas, essas
+interfaces nem sequer são visíveis e tampouco são motivo de preocupação.
+
+Antes de mais nada, não abordarei **nenhuma** questão jurídica relacionada a
+código-fonte fechado, código-fonte oculto, blobs binários, wrappers de
+código-fonte ou qualquer outro termo usado para descrever drivers do kernel
+cujo código-fonte não seja disponibilizado sob a GPL. Consulte um advogado
+caso tenha alguma dúvida jurídica. Sou programador e, portanto, descreverei
+aqui apenas as questões técnicas (isso não significa que as questões
+jurídicas sejam pouco importantes; elas são reais e você precisa estar sempre
+ciente delas).
+
+Portanto, há dois tópicos principais: interfaces binárias do kernel e
+interfaces estáveis de código-fonte do kernel. Ambos dependem um do outro,
+mas discutiremos primeiro a parte referente às interfaces binárias para
+deixá-la de lado.
+
+
+Interface binária do kernel
+---------------------------
+
+Supondo que tivéssemos uma interface estável de código-fonte para o kernel,
+uma interface binária surgiria naturalmente também, certo? Errado. Considere
+os seguintes fatos sobre o kernel Linux:
+
+  - Dependendo da versão do compilador C utilizada, diferentes estruturas de
+    dados do kernel terão diferentes alinhamentos e poderão até mesmo incluir
+    funções de maneiras distintas (por exemplo, tornando determinadas funções
+    inline ou não). A organização das funções individuais não é tão importante,
+    mas as diferenças no preenchimento das estruturas de dados são muito
+    importantes.
+
+  - Dependendo das opções selecionadas durante a compilação do kernel, uma
+    grande variedade de comportamentos pode ser assumida pelo kernel:
+
+      - diferentes estruturas podem conter campos diferentes;
+      - algumas funções podem nem sequer ser implementadas (por exemplo,
+        determinados bloqueios são completamente eliminados durante a
+        compilação em kernels sem SMP);
+      - a memória dentro do kernel pode ser alinhada de maneiras diferentes,
+        dependendo das opções de compilação.
+
+  - O Linux é executado em uma grande variedade de arquiteturas de
+    processadores. Não há como drivers binários compilados para uma arquitetura
+    funcionarem corretamente em outra.
+
+Vários desses problemas podem ser contornados simplesmente compilando o módulo
+para uma configuração específica e exata do kernel, utilizando exatamente o
+mesmo compilador C empregado na compilação do kernel. Isso é suficiente caso
+você queira fornecer um módulo para uma determinada versão de uma distribuição
+Linux específica. Porém, multiplique essa única compilação pelo número de
+distribuições Linux existentes e pelo número de versões suportadas de cada
+distribuição e você rapidamente terá um pesadelo de diferentes opções de
+compilação em diferentes versões. Além disso, cada versão de uma distribuição
+Linux contém vários kernels, cada um ajustado para diferentes tipos de
+hardware (diferentes tipos de processadores e diferentes opções). Portanto,
+mesmo para uma única versão, você precisará criar várias versões do seu módulo.
+
+Acredite em mim: com o tempo, você enlouquecerá se tentar oferecer suporte a
+esse tipo de distribuição. Aprendi isso da maneira mais difícil há muito
+tempo...
+
+Interfaces estáveis de código-fonte do kernel
+----------------------------------------------
+
+Esse é um tópico um pouco mais "volátil" se você conversar com alguém que está
+tentando manter atualizado, ao longo do tempo, um driver do kernel Linux que
+não está na árvore principal do kernel.
+
+O desenvolvimento do kernel Linux é contínuo e ocorre em ritmo acelerado,
+sem desacelerar. Por isso, os desenvolvedores do kernel encontram bugs nas
+interfaces existentes ou descobrem maneiras melhores de fazer as coisas.
+Quando isso acontece, eles corrigem as interfaces atuais para que funcionem
+melhor. Nesse processo, nomes de funções podem mudar, estruturas podem crescer
+ou diminuir e parâmetros de funções podem ser reformulados. Quando isso
+acontece, todos os locais dentro do kernel que utilizam essa interface são
+corrigidos ao mesmo tempo, garantindo que tudo continue funcionando
+corretamente.
+
+Como exemplos específicos disso, as interfaces USB internas do kernel
+passaram por pelo menos três reformulações diferentes ao longo da existência
+desse subsistema. Essas reformulações foram feitas para resolver diversos
+problemas:
+
+  - Uma mudança de um modelo síncrono de fluxos de dados para um modelo
+    assíncrono. Isso reduziu a complexidade de vários drivers e aumentou a
+    taxa de transferência de todos os drivers USB, de modo que atualmente
+    executamos quase todos os dispositivos USB na maior velocidade possível.
+
+  - Foi feita uma mudança na maneira como os pacotes de dados eram alocados
+    pelos drivers USB a partir do núcleo USB, de modo que todos os drivers
+    passaram a precisar fornecer mais informações ao núcleo USB, corrigindo
+    diversos deadlocks documentados.
+
+Isso contrasta fortemente com vários sistemas operacionais de código fechado,
+que tiveram de manter suas interfaces USB antigas ao longo do tempo. Isso
+permite que novos desenvolvedores utilizem acidentalmente interfaces antigas
+e façam as coisas de maneira inadequada, prejudicando a estabilidade do
+sistema operacional.
+
+Em ambos os casos, todos os desenvolvedores concordaram que essas eram
+mudanças importantes que precisavam ser feitas, e elas foram realizadas com
+relativamente pouco esforço. Se o Linux tivesse de garantir a preservação de
+uma interface de código-fonte estável, uma nova interface teria de ser criada,
+enquanto a interface antiga e defeituosa teria de continuar sendo mantida ao
+longo do tempo, resultando em trabalho adicional para os desenvolvedores USB.
+Como todos os desenvolvedores USB do Linux realizam esse trabalho em seu
+próprio tempo, pedir que programadores façam trabalho extra, sem nenhum
+benefício e gratuitamente, não é uma possibilidade.
+
+Questões de segurança também são muito importantes para o Linux. Quando um
+problema de segurança é encontrado, ele é corrigido em um período muito curto.
+Em diversas ocasiões, isso fez com que interfaces internas do kernel fossem
+reformuladas para impedir que o problema de segurança ocorresse. Quando isso
+acontece, todos os drivers que utilizam essas interfaces também são corrigidos
+ao mesmo tempo, garantindo que o problema de segurança seja resolvido e não
+possa reaparecer acidentalmente no futuro. Se as interfaces internas não
+pudessem ser alteradas, não seria possível corrigir esse tipo de problema de
+segurança e garantir que ele não voltasse a ocorrer.
+
+As interfaces do kernel são aprimoradas ao longo do tempo. Se ninguém estiver
+utilizando uma determinada interface, ela é removida. Isso garante que o
+kernel permaneça o menor possível e que todas as interfaces existentes possam
+ser testadas da melhor maneira possível (é praticamente impossível testar
+adequadamente a validade de interfaces que não são utilizadas).
+
+
+O que fazer
+-----------
+
+Então, se você possui um driver do kernel Linux que não está na árvore
+principal do kernel, o que você, como desenvolvedor, deve fazer? Distribuir
+um driver binário para cada versão diferente do kernel em cada distribuição
+é um pesadelo, e tentar acompanhar uma interface do kernel que está em
+constante mudança também é uma tarefa difícil.
+
+Simples: coloque seu driver na árvore principal do kernel (lembre-se de que
+estamos falando aqui de drivers distribuídos sob uma licença compatível com
+a GPL; se seu código não se enquadra nessa categoria, boa sorte, você está
+por conta própria aqui, seu parasita). Se seu driver estiver na árvore e uma
+interface do kernel mudar, ele será corrigido pela própria pessoa que realizou
+a alteração no kernel. Isso garante que seu driver continue sempre compilável
+e funcionando ao longo do tempo, exigindo muito pouco esforço de sua parte.
+
+Os excelentes efeitos colaterais de ter seu driver na árvore principal do
+kernel são:
+
+  - A qualidade do driver aumentará, enquanto os custos de manutenção
+    (para o desenvolvedor original) diminuirão.
+
+  - Outros desenvolvedores adicionarão funcionalidades ao seu driver.
+
+  - Outras pessoas encontrarão e corrigirão bugs no seu driver.
+
+  - Outras pessoas encontrarão oportunidades de otimização no seu driver.
+
+  - Outras pessoas atualizarão o driver para você quando mudanças em
+    interfaces externas exigirem isso.
+
+  - O driver será automaticamente distribuído por todas as distribuições
+    Linux, sem que seja necessário pedir às distribuições que o adicionem.
+
+Como o Linux oferece suporte, "pronto para uso", a um número maior de
+dispositivos diferentes do que qualquer outro sistema operacional, e oferece
+suporte a esses dispositivos em mais arquiteturas de processadores diferentes
+do que qualquer outro sistema operacional, esse modelo comprovado de
+desenvolvimento deve estar fazendo alguma coisa certa :)
+
+
+------
+
+Agradecimentos a Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
+Robert Love e Nishanth Aravamudan pela revisão e pelos comentários sobre
+este documento.

---
base-commit: 791e420360669d55b7f90ca0c6d61b10e4992aec
change-id: 20260819-ptbr-stable-api-nonsense-c43d245aaf59

Best regards,
-- 
Lucas Adryell Ramalho <lucasadramalho@gmail.com>

