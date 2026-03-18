Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01237881C
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873246; cv=none; b=D3NzjUuT/lLOTmOYTM//7shH0jBB0yhwC+hIDKcmBNqKvEDZo6J02NSOoX+Mil1TGUdvmM6kEcgHg1KBI8ygLiWdZbatTx2zKL9ya+2Nn74Y7FAS+hs5hCQveuiChSI/wGyHczzvf8yzFom6KuFx5BLvU96BvTP50/VPfI6A4Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873246; c=relaxed/simple;
	bh=FYVNLZUMc0LTCAKwSLU9BGSSMIeZWPfYv0yvPu64f+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYntk6HoYUGdY3WIZsepM2K2U6QRCoFp6PCueNV01Lm2ebGLgViFbrW45nWi76eCzc6Puq7SV4a+E/KLR1VNaQldXTV6blzOvluTPFI5Si1PmHcE4j5LBIrT9RdA5aQ41x8nQDqrkAm4Oeu4f3/TkKy5fJ10JREW6/T3z3YbayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPp0cIzD; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPp0cIzD"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5674d8be45eso116495e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873243; x=1774478043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpCt/pPcWmA5MPSVc8Gz3coTqdarW/hvlGKXUU+caRo=;
        b=jPp0cIzD9bMQ5uVjMLO4x7WcJUXlMmi1OkqWdjBdaYt3zKQHn0SUp4PeT6TVj8SG82
         bTn3830GSp9jc9GqCkWDi0rilBJsjH5PAPsUN1HwE/Yw+TtTMS5y0YwO2kAYu3rOntx/
         /XE13PzlUhNFVAflHfRWOmMw0c3ZFrlAEYmiFAmcih+/iYlPZacUZ5a1jTWtuPJDWyEr
         46Y5jPrhXzaL/KFlU1yZN4iLLtDT7sIfHe2GbM1JOfZMZCE2nE6SF+SNvWT0mtEtQZOJ
         1aeuIWHpar4RNo23MaCTjL6070gkeMlyriLVU1rRGxYZGG3q5P0/VknrSvnWx369VK1O
         HteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873243; x=1774478043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpCt/pPcWmA5MPSVc8Gz3coTqdarW/hvlGKXUU+caRo=;
        b=D+wqAzTsg8LEsR9/6r6YpP9cZQW81Q3w0U6Ymgcsmd/u5b6lbFurwydoSja26zbSC7
         +HeR3JoT5XSJM+n8lDBj6JHwFF0YIR+GCsm2rFcmPhlQYXzexnAJ/QaKrgXdkr3T/aTB
         qfIWWtHX189RZowi4T/6UMWBgRMMja1P2vBnpIpBgnr6fswqALF4v+qmn7N5T+a2fDj3
         rt631q/uKjt4I5JURXBGOOvIkEvFIxXgSIOAm2mMjLKmZCgqXvvIu2bWX4VfFfy70qoE
         wbeBYmDG9kui82qnUmtv3SjM1THQhJOArI4gd/zBEj0zj/08gcXf6Nwxd4XdHOYJCvgJ
         vP/g==
X-Gm-Message-State: AOJu0YwR6ySqW2r9I+fZQC3J+hPo+gnS3oKensyAuzW96NfZBxpCqLQH
	sbPKsn565zrFH7WBnortK/L3N6uo0tuH4WTwkkLImZAlVbT7p4Tg8NJ8Y/GwgfQg
X-Gm-Gg: ATEYQzxlD4bPuqfS5kGvvCWxIup3Mg3q5Dsf6R2HukMYHAjTqMZhMnvGzXNElkX5JOx
	+fWVXNb90VLTkcy1mOCs6Dn8ZGl+JQFgIMPRYI0+Y7bqzx23sMiilVV/BgGAIRUJFTKXnFuvBh8
	VtVSbjAxTlzal+7OPCIkTRlOXHCD7/z/ZH1gad/IrzWWpx1wIoznFi+M9kNpLv4gAKJVaDgVCgY
	7fuVlXTS2/MuRvorlQRvBDxquXVyFGO5JZb1DZc5vZskNmMfnLxdla0mLC5RzMs/9hnnomsu7DV
	y1Im+3YQ+eN1On2I74mLiCccn64JUXjP+i8Kw36oMxHtHo4FbEs/e2nPkc0OhtIlCrn/mvcoN2L
	1YAPZE8S40dGQ2K+lTt1Pji/g+HsDcxBnk7VGK0MKlAoqzKi/d2Vf9y7W7VLHSQj/3nV0yVgvrk
	Ria/8ckX1leUm24kPiYHt4UQ0tt0W7OIE8y1BYpztJxSVi/zXU/sTE5dRsBgFzh1D2Lpm2/ncrp
	C1DUTeONMEdROXz
X-Received: by 2002:a05:6123:41:b0:56b:72a9:2ce5 with SMTP id 71dfb90a1353d-56ba6dea7b1mr2348047e0c.0.1773873242841;
        Wed, 18 Mar 2026 15:34:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951032d062esm2044071241.7.2026.03.18.15.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:34:02 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 1/2] docs/pt_BR: translation of maintainer-soc.rst
Date: Wed, 18 Mar 2026 19:33:22 -0300
Message-ID: <20260318223325.386762-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318223325.386762-1-danielmaraboo@gmail.com>
References: <20260318223325.386762-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/maintainer-soc.rst into Portuguese.
This is part of the effort to localize the kernel documentation.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/maintainer-handbooks.rst    |   1 +
 .../pt_BR/process/maintainer-soc.rst          | 222 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-soc.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 8822e21cf..d6a28bc5a 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -70,3 +70,4 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
+   Processo do subsistema SoC <process/maintainer-soc>
diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index 20bb32490..71ea0b9d6 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -14,4 +14,5 @@ Conteúdos:
    :maxdepth: 2
 
    maintainer-netdev
+   maintainer-soc
 
diff --git a/Documentation/translations/pt_BR/process/maintainer-soc.rst b/Documentation/translations/pt_BR/process/maintainer-soc.rst
new file mode 100644
index 000000000..5a3ae213e
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-soc.rst
@@ -0,0 +1,222 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+Subsistema SoC
+==============
+
+Visão Geral
+-----------
+
+O subsistema SoC é um local de agregação para códigos específicos de SoC
+System on Chip). Os principais componentes do subsistema são:
+
+* Devicetrees (DTS) para ARM de 32 e 64 bits e RISC-V.
+* Arquivos de placa (board files) ARM de 32 bits (arch/arm/mach*).
+* Defconfigs ARM de 32 e 64 bits.
+* Drivers específicos de SoC em diversas arquiteturas, em particular para ARM de
+* 32 e 64 bits, RISC-V e Loongarch.
+
+Estes "drivers específicos de SoC" não incluem drivers de clock, GPIO, etc., que
+possuem outros mantenedores de alto nível. O diretório ``drivers/soc/`` é
+geralmente destinado a drivers internos do kernel que são usados por outros
+drivers para fornecer funcionalidades específicas do SoC, como identificar uma
+revisão do chip ou fazer a interface com domínios de energia.
+
+O subsistema SoC também serve como um local intermediário para alterações em
+``drivers/bus``, ``drivers/firmware``, ``drivers/reset`` e ``drivers/memory``.
+A adição de novas plataformas, ou a remoção de existentes, geralmente passa pela
+árvore SoC como um branch dedicado cobrindo múltiplos subsistemas.
+
+A árvore principal do SoC está hospedada no git.kernel.org:
+  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
+
+Mantenedores
+------------
+
+Claramente, esta é uma gama bastante ampla de tópicos, que nenhuma pessoa, ou
+mesmo um pequeno grupo de pessoas, é capaz de manter. Em vez disso, o
+subsistema SoC é composto por muitos submantenedores (mantenedores de
+plataforma), cada um cuidando de plataformas individuais e subdiretórios de
+drivers.
+
+Nesse sentido, "plataforma" geralmente se refere a uma série de SoCs de um
+determinado fornecedor, por exemplo, a série de SoCs Tegra da Nvidia. Muitos
+submantenedores operam em nível de fornecedor, sendo responsáveis por várias
+linhas de produtos. Por diversos motivos, incluindo aquisições ou diferentes
+unidades de negócios em uma empresa, as coisas variam significativamente aqui.
+Os diversos submantenedores estão documentados no arquivo ``MAINTAINERS``.
+
+A maioria desses submantenedores possui suas próprias árvores onde preparam os
+patches, enviando pull requests para a árvore SoC principal. Essas árvores são
+geralmente, mas nem sempre, listadas em ``MAINTAINERS``.
+
+O que a árvore SoC não é, contudo, é um local para alterações de código
+específicas da arquitetura. Cada arquitetura possui seus próprios mantenedores
+que são responsáveis pelos detalhes arquiteturais, erratas de CPU e afins.
+
+Submetendo Patches para um Determinado SoC
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Todos os patches típicos relacionados à plataforma devem ser enviados por meio
+dos submantenedores de SoC (mantenedores específicos da plataforma). Isso inclui
+também alterações em defconfigs por plataforma ou compartilhadas. Note que
+``scripts/get_maintainer.pl`` pode não fornecer os endereços corretos para a
+defconfig compartilhada; portanto, ignore sua saída e crie manualmente a lista
+de CC baseada no arquivo ``MAINTAINERS`` ou use algo como
+``scripts/get_maintainer.pl -f drivers/soc/FOO/``.
+
+Submetendo Patches para os Mantenedores Principais de SoC
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Os mantenedores principais de SoC podem ser contatados via o alias
+soc@kernel.org apenas nos seguintes casos:
+
+1. Não existem mantenedores específicos para a plataforma.
+
+2. Os mantenedores específicos da plataforma não respondem.
+
+3. Introdução de uma plataforma SoC completamente nova. Tal trabalho de novo SoC
+   deve ser enviado primeiro para as listas de discussão comuns, indicadas por
+   ``scripts/get_maintainer.pl``, para revisão da comunidade. Após uma revisão
+   positiva da comunidade, o trabalho deve ser enviado para soc@kernel.org em
+   um único conjunto de patches (*patchset*) contendo a nova entrada em
+   ``arch/foo/Kconfig``, arquivos DTS, entrada no arquivo ``MAINTAINERS`` e,
+   opcionalmente, drivers iniciais com seus respectivos bindings de Devicetree.
+   A entrada no arquivo ``MAINTAINERS`` deve listar os novos mantenedores
+   específicos da plataforma, que serão responsáveis por lidar com os patches
+   da plataforma de agora em diante.
+
+Note que o endereço soc@kernel.org geralmente não é o local para discutir os
+patches; portanto, o trabalho enviado para este endereço já deve ser
+considerado aceitável pela comunidade.
+
+Informações para (novos) Submantenedores
+----------------------------------------
+
+À medida que novas plataformas surgem, elas frequentemente trazem consigo novos
+submantenedores, muitos dos quais trabalham para o fornecedor do silício e podem
+não estar familiarizados com o processo.
+
+Estabilidade da ABI do Devicetree
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Talvez um dos pontos mais importantes a destacar é que os *dt-bindings*
+documentam a ABI entre o devicetree e o kernel. Por favor, leia
+``Documentation/devicetree/bindings/ABI.rst``.
+
+Se estiverem sendo feitas alterações em um DTS que sejam incompatíveis com
+kernels antigos, o patch do DTS não deve ser aplicado até que o driver seja, ou
+em um momento apropriado posterior. Mais importante ainda, quaisquer alterações
+incompatíveis devem ser claramente apontadas na descrição do patch e no pull
+request, juntamente com o impacto esperado nos usuários existentes, como
+bootloaders ou outros sistemas operacionais.
+
+Dependências de Branch de Driver
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Um problema comum é a sincronização de alterações entre drivers de dispositivos
+e arquivos de devicetree. Mesmo que uma alteração seja compatível em ambas as
+direções, isso pode exigir a coordenação de como as mudanças são mescladas
+através de diferentes árvores de mantenedores.
+
+Geralmente, o branch que inclui uma alteração de driver também incluirá a
+mudança correspondente na descrição do binding do devicetree, para garantir que
+sejam, de fato, compatíveis. Isso significa que o branch do devicetree pode
+acabar causando avisos na etapa ``make dtbs_check``. Se uma alteração de
+devicetree depender de adições ausentes em um arquivo de cabeçalho em
+``include/dt-bindings/``, ela falhará na etapa ``make dtbs`` e não será mesclada.
+
+Existem várias maneiras de lidar com isso:
+
+* Evite definir macros personalizadas em ``include/dt-bindings/`` para constantes
+  de hardware que podem ser derivadas de um datasheet -- macros de binding em
+  arquivos de cabeçalho devem ser usadas apenas como último recurso, se não
+  houver uma maneira natural de definir um binding.
+
+* Use valores literais no arquivo devicetree em vez de macros, mesmo quando um
+  cabeçalho for necessário, e altere-os para a representação nomeada em um
+  lançamento posterior.
+
+* Adie as alterações do devicetree para um lançamento após o binding e o driver
+  já terem sido mesclados.
+
+* Altere os bindings em um branch imutável compartilhado que seja usado como
+  base tanto para a alteração do driver quanto para as alterações do devicetree.
+
+* Adicione definições duplicadas no arquivo devicetree protegidas por uma seção
+  ``#ifndef``, removendo-as em um lançamento posterior.
+
+Convenção de Nomenclatura de Devicetree
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+O esquema geral de nomenclatura para arquivos de devicetree é o seguinte. Os
+aspectos de uma plataforma que são definidos no nível do SoC, como núcleos de
+CPU, são contidos em um arquivo nomeado ``$soc.dtsi``, por exemplo,
+``jh7100.dtsi``. Detalhes de integração, que variam de placa para placa, são
+descritos em ``$soc-$board.dts``. Um exemplo disso é
+``jh7100-beaglev-starlight.dts``. Frequentemente, muitas placas são variações
+de um mesmo tema, e é comum haver arquivos intermediários, como
+``jh7100-common.dtsi``, que ficam entre os arquivos ``$soc.dtsi`` e
+``$soc-$board.dts``, contendo as descrições de hardware comum.
+
+Algumas plataformas também possuem *System on Modules* (SoM), contendo um SoC,
+que são então integrados em diversas placas diferentes. Para essas plataformas,
+``$soc-$som.dtsi`` e ``$soc-$som-$board.dts`` são típicos.
+
+Os diretórios geralmente são nomeados após o fornecedor do SoC no momento de sua
+inclusão, o que leva a alguns nomes de diretórios históricos na árvore.
+
+Validando Arquivos de Devicetree
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+``make dtbs_check`` pode ser usado para validar se os arquivos de devicetree
+estão em conformidade com os *dt-bindings* que descrevem a ABI. Por favor, leia
+a seção "Running checks" de ``Documentation/devicetree/bindings/writing-schema.rst``
+para mais informações sobre a validação de devicetrees.
+
+Para novas plataformas, ou adições a plataformas existentes, ``make dtbs_check``
+não deve adicionar nenhum aviso (*warning*) novo. Para SoCs RISC-V e Samsung, é
+exigido que ``make dtbs_check W=1`` não adicione nenhum novo aviso.
+Se houver qualquer dúvida sobre uma alteração de devicetree, entre em contato
+com os mantenedores de devicetree.
+
+Branches e Pull Requests
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Assim como a árvore SoC principal possui vários branches, espera-se que os
+submantenedores façam o mesmo. Alterações de drivers, defconfig e devicetree
+devem ser todas divididas em branches separados e aparecer em pull requests
+distintos para os mantenedores de SoC. Cada branch deve ser utilizável por si só
+e evitar regressões originadas de dependências em outros branches.
+
+Pequenos conjuntos de patches também podem ser enviados como e-mails separados
+para soc@kernel.org, agrupados nas mesmas categorias.
+
+Se as alterações não se encaixarem nos padrões normais, pode haver branches de
+nível superior adicionais, por exemplo, para uma reformulação em toda a árvore
+(*treewide rework*) ou a adição de novas plataformas SoC, incluindo arquivos dts
+e drivers.
+
+Branches com muitas alterações podem se beneficiar ao serem divididos em
+branches de tópicos separados, mesmo que acabem sendo mesclados no mesmo branch
+da árvore SoC. Um exemplo aqui seria um branch para correções de avisos de
+devicetree, um para uma reformulação e um para placas recém-adicionadas.
+
+Outra forma comum de dividir as alterações é enviar um pull request antecipado
+com a maioria das mudanças em algum momento entre rc1 e rc4, seguido por um ou
+mais pull requests menores no final do ciclo, que podem adicionar alterações
+tardias ou resolver problemas identificados durante os testes do primeiro
+conjunto.
+
+Embora não haja um prazo limite para pull requests tardios, ajuda enviar apenas
+branches pequenos à medida que o tempo se aproxima da janela de mesclagem
+(*merge window*).
+
+Pull requests para correções de bugs (*bugfixes*) da versão atual podem ser
+enviados a qualquer momento, mas, novamente, ter múltiplos branches menores é
+melhor do que tentar combinar muitos patches em um único pull request.
+
+A linha de assunto de um pull request deve começar com "[GIT PULL]" e ser feita
+usando uma tag assinada, em vez de um branch. Esta tag deve conter uma breve
+descrição resumindo as alterações no pull request. Para mais detalhes sobre o
+envio de pull requests, consulte ``Documentation/maintainer/pull-requests.rst``.
-- 
2.47.3

