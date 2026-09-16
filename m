Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C233C5013D4
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580537; cv=none; b=hRMX/jBACHRJGiBZWsFOWvsJLF9a7bWtrpwPf7no1m2o/l8qv0nh3wFd1gWJcg6XH9fJd8rD6B9zkjPMatYif7YUXuU8gtf4ZXRAOp4TACXbogFnDj6cS4QmIxcRARdg0zNQSw+tZh+yjYUFsI5mM3grBah3cxwGNlMLE9Ki7d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580537; c=relaxed/simple;
	bh=72yNXaU4MvsT8CvyOzD6k/TZ0SUzm7ZiLXm4cEdBmFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdNaqYVmr8x/FH+/YK4q/xKpROKd5OpxGbiakLTYs3vgLzJ1+5uLmgF9Iki7LqcMC2aOWB8bLC5EbjiiiyOqJ7DXquOYlWYkZG8aHWqDHVJWQr/IGrMzaDFKnFm3Ppbcm6pNaxHNbRlgUH6mfXm698ifIGr2YEq72yJVO19K1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpNZLZvV; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpNZLZvV"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso699537a34.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580509; x=1790185309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69HbaJXxjPxjqmCrYvJqfthhUoHU32Fh0ykwYeXZaHI=;
        b=HpNZLZvVOtO/0AyQO0BHOLN5514M9CR0yJfv26nfFsOAbxTre+J5Y9EiRr7YaumXvZ
         uVByajH5losFboMytB0uyQ6da809SLqoCIvMUUliFkG6N84/9af1r9LP4nZ1Ls44v+Y/
         B3XoZjh2l/GDiCLYuRS4Rm5BftO8asQ1R/9PIY15azu2dwOi7jBgnRW63EjV9sK3DCC9
         a4LC21d3YFj/xmHWebQ1R+Fq4OLBE9ycYY8FGahjvhEI0peDP0cg8aaOKb+LRqTkhFod
         wQnbHmH30vh8GjxEsBqXG0xpOIZP0c9tCPIMrO4zBLric5Ec52mLVr1/dQHMvtmMPDYs
         Jxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580509; x=1790185309;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69HbaJXxjPxjqmCrYvJqfthhUoHU32Fh0ykwYeXZaHI=;
        b=IYp4BPBIUXzbRxt0/jBNGYHDm5+VYUgGE8Rb9ppqbb/tr1LQpkTZtV21BkJM3f27vG
         PDK9n9mS1n8GQhvH0Xbstm8JOiLG9QnpkLfAJFkuwJCEXchshVSVW4z2kl/FYE1K3Ozy
         Pp7FUJI4dA2rxtCgxDs/8QUkJ/w0YGoJbWwe9iAuyBd6QO0EPMR+iM4Efz38RMWj325b
         3vedpP+n8ykBtkHwI30FaG4H1UbstG1v4OZaneCJmI/4g6Pkl7EvZFxEOr3pIYIrjunv
         lQdFY+h5tk7ELoUS0/QCRUv02t7o5/bsRkU8nN3hl6kEH9wcNptqGdOStrVynR0CkHvX
         G9zg==
X-Gm-Message-State: AFuF++kuXn0iEeIj+Tl6FlzTLoi7AzOjvk58iag8YrBreGo842YeUsxW
	/YGf/F/LT4cvpYWUiVCBXa7YJX7mD1fv5ym11MLhZOVFD0Z7inSJ3DtFElZx3RK7+n8=
X-Gm-Gg: AYBFou2DLhcHSzNKhCFp2n2+9xwwZQA7izIO5cgEyx2hkidBsoCN5nVwhIm+gQJn+4R
	+TnEWj5G85Qb/lRTvVLJQq/LnHxVVyL9KIlJYdbwc2A1bpWJpvg0awIZAsgtypc6mBzwIOv0798
	z/pG3If/K01yTRUgkA+CcY+plzKYXPZjoGk17/EtVHhkpTHhQS0N4tFY7z2nAMbqgoRYVZbBTzL
	9UI6Qlm0+WYSUEjZyhVt/ynBsZBYn21QDtrjP85CHr8RrujwzOnYoEyrm8MkxHjDRhh7ES2jpzt
	T1jdF/ktw0bv0ZR3c1aliXuc1oRZtMRkMVD6i0LqCDF4sE0TdJhoj1HKvDu5dzdxtlv4W9QgxUp
	2Z6wzACy7Qa0C7mXX5BsROQrtxZuYqGDHKX6U3mWmbczWtWLiT5R4izZFhuS6IroIISDLh9ZDUI
	CwXkRe9dnxhS2QLqW+T3SJkmPv7ocezAGYDhn0ranujtccMm8LDsrs/LMaOKcBtwTlqN9de2WPD
	kadSN53tplwwtsYADOubyxUBYftrnBm4xszDq58GFa7sMdMxZuobYBcEzObk30xskmRK8ShVXo+
	4IsTVA1mnpto2k6aBXLzN8FRrJX9l/82ddHr5LqvKfiYXIQ=
X-Received: by 2002:a05:6808:5190:b0:4b9:a829:f00b with SMTP id 5614622812f47-4ca4bc70415mr4185944b6e.23.1789580509141;
        Wed, 16 Sep 2026 10:41:49 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d9999e8sm360668b6e.17.2026.09.16.10.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:41:48 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 3/5] docs: translations: pt_BR: translate admin-guide/README.rst
Date: Wed, 16 Sep 2026 14:41:33 -0300
Message-ID: <20260916174136.48011-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916174136.48011-1-danielmaraboo@gmail.com>
References: <20260916174136.48011-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the kernel README into Brazilian Portuguese and move it from
the Todolist into the toctree of the admin-guide index.  References to
changes.rst and applying-patches.rst point at the pt_BR translations,
since both are already translated.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/admin-guide/README.rst | 382 ++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |   6 +-
 2 files changed, 387 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/README.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/README.rst b/Documentation/translations/pt_BR/admin-guide/README.rst
new file mode 100644
index 000000000..1843f89b1
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/README.rst
@@ -0,0 +1,382 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_readme:
+
+Versão 6.x do kernel Linux <http://kernel.org/>
+===============================================
+
+Estas são as notas de lançamento da versão 6 do Linux. Leia-as com atenção,
+pois elas dizem do que se trata tudo isso, explicam como instalar o kernel e
+o que fazer se algo der errado.
+
+O que é o Linux?
+----------------
+
+  O Linux é um clone do sistema operacional Unix, escrito do zero por Linus
+  Torvalds com a ajuda de uma equipe pouco organizada de hackers espalhados
+  pela Internet. Ele busca a conformidade com o POSIX e com a Single UNIX
+  Specification.
+
+  Possui todos os recursos que você esperaria de um Unix moderno e completo,
+  incluindo multitarefa real, memória virtual, bibliotecas compartilhadas,
+  carregamento sob demanda (demand loading), executáveis compartilhados com
+  cópia-na-escrita (copy-on-write), gerenciamento de memória adequado e rede
+  multipilha, incluindo IPv4 e IPv6.
+
+  É distribuído sob a GNU General Public License v2 --- veja o arquivo
+  COPYING que o acompanha para mais detalhes.
+
+Em qual hardware ele roda?
+--------------------------
+
+  Embora tenha sido originalmente desenvolvido primeiro para PCs de 32 bits
+  baseados em x86 (386 ou superior), hoje o Linux também roda (pelo menos)
+  nas arquiteturas Compaq Alpha AXP, Sun SPARC e UltraSPARC, Motorola 68000,
+  PowerPC, PowerPC64, ARM, Hitachi SuperH, Cell, IBM S/390, MIPS, HP PA-RISC,
+  Intel IA-64, DEC VAX, AMD x86-64 Xtensa e ARC.
+
+  O Linux é facilmente portável para a maioria das arquiteturas de propósito
+  geral de 32 ou 64 bits, desde que possuam uma unidade de gerenciamento de
+  memória paginada (PMMU) e um port do compilador C da GNU (gcc), parte da
+  GNU Compiler Collection (GCC). O Linux também já foi portado para diversas
+  arquiteturas sem PMMU, embora a funcionalidade fique, obviamente, um tanto
+  limitada.
+  O Linux também foi portado para si mesmo. Você pode agora executar o kernel
+  como uma aplicação de espaço de usuário --- isso se chama UserMode Linux
+  (UML).
+
+Documentação
+------------
+
+ - Há muita documentação disponível, tanto em formato eletrônico na Internet
+   quanto em livros, tanto específica do Linux quanto referente a questões
+   gerais do UNIX. Eu recomendaria procurar nos subdiretórios de documentação
+   de qualquer site FTP do Linux pelos livros do LDP (Linux Documentation
+   Project). Este README não pretende ser a documentação do sistema: existem
+   fontes muito melhores disponíveis.
+
+ - Existem vários arquivos README no subdiretório Documentation/: eles
+   normalmente contêm notas de instalação específicas do kernel para alguns
+   drivers, por exemplo. Por favor, leia o arquivo
+   Documentation/translations/pt_BR/process/changes.rst, pois ele contém
+   informações sobre os problemas que podem resultar da atualização do seu
+   kernel.
+
+Instalando o código-fonte do kernel
+-----------------------------------
+
+ - Se você instalar as fontes completas, coloque o tarball do kernel em um
+   diretório no qual você tenha permissões (por exemplo, o seu diretório
+   pessoal) e o descompacte::
+
+     xz -cd linux-6.x.tar.xz | tar xvf -
+
+   Substitua "X" pelo número da versão do kernel mais recente.
+
+   NÃO use a área /usr/src/linux! Essa área possui um conjunto (geralmente
+   incompleto) de cabeçalhos do kernel que são usados pelos arquivos de
+   cabeçalho da biblioteca. Eles devem corresponder à biblioteca, e não ser
+   bagunçados por qualquer que seja o kernel-do-dia.
+
+ - Você também pode atualizar entre versões 6.x aplicando patches. Os patches
+   são distribuídos no formato xz. Para instalar aplicando patches, obtenha
+   todos os arquivos de patch mais novos, entre no diretório de nível
+   superior do código-fonte do kernel (linux-6.x) e execute::
+
+     xz -cd ../patch-6.x.xz | patch -p1
+
+   Substitua "x" para todas as versões maiores que a versão "x" da sua árvore
+   de fontes atual, **em ordem**, e deve dar tudo certo. Talvez você queira
+   remover os arquivos de backup (algum-nome-de-arquivo~ ou
+   algum-nome-de-arquivo.orig) e certificar-se de que não há patches que
+   falharam (algum-nome-de-arquivo# ou algum-nome-de-arquivo.rej). Se
+   houver, ou você ou eu cometemos um erro.
+
+   Diferentemente dos patches para os kernels 6.x, os patches para os kernels
+   6.x.y (também conhecidos como kernels -stable) não são incrementais; em vez
+   disso, eles se aplicam diretamente ao kernel 6.x base. Por exemplo, se o
+   seu kernel base é o 6.0 e você quer aplicar o patch 6.0.3, você não deve
+   aplicar antes os patches 6.0.1 e 6.0.2. Da mesma forma, se você está
+   rodando a versão 6.0.2 do kernel e quer saltar para a 6.0.3, você deve
+   primeiro reverter o patch 6.0.2 (ou seja, patch -R) **antes** de aplicar o
+   patch 6.0.3. Você pode ler mais sobre isso em
+   Documentation/translations/pt_BR/process/applying-patches.rst.
+
+   Como alternativa, o script patch-kernel pode ser usado para automatizar
+   esse processo. Ele determina a versão atual do kernel e aplica quaisquer
+   patches encontrados::
+
+     linux/scripts/patch-kernel linux
+
+   O primeiro argumento no comando acima é a localização do código-fonte do
+   kernel. Os patches são aplicados a partir do diretório atual, mas um
+   diretório alternativo pode ser especificado como segundo argumento.
+
+ - Certifique-se de que não há arquivos .o e dependências obsoletos espalhados
+   por aí::
+
+     cd linux
+     make mrproper
+
+   Agora você deve ter as fontes instaladas corretamente.
+
+Requisitos de software
+----------------------
+
+   Compilar e executar os kernels 6.x exige versões atualizadas de vários
+   pacotes de software. Consulte
+   Documentation/translations/pt_BR/process/changes.rst para os números de
+   versão mínimos exigidos e como obter atualizações desses pacotes. Esteja
+   ciente de que usar versões excessivamente antigas desses pacotes pode
+   causar erros indiretos, muito difíceis de rastrear; portanto, não presuma
+   que basta atualizar os pacotes quando problemas óbvios surgirem durante a
+   compilação ou a execução.
+
+Diretório de compilação do kernel
+---------------------------------
+
+   Ao compilar o kernel, todos os arquivos de saída serão, por padrão,
+   armazenados junto com o código-fonte do kernel.
+   Usar a opção ``make O=output/dir`` permite especificar um local alternativo
+   para os arquivos de saída (incluindo o .config).
+   Exemplo::
+
+     código-fonte do kernel:    /usr/src/linux-6.x
+     diretório de compilação:   /home/nome/build/kernel
+
+   Para configurar e compilar o kernel, use::
+
+     cd /usr/src/linux-6.x
+     make O=/home/nome/build/kernel menuconfig
+     make O=/home/nome/build/kernel
+     sudo make O=/home/nome/build/kernel modules_install install
+
+   Observe: se a opção ``O=output/dir`` for usada, ela deve ser usada em todas
+   as invocações do make.
+
+Configurando o kernel
+---------------------
+
+   Não pule esta etapa, mesmo que você esteja atualizando apenas uma versão
+   menor. Novas opções de configuração são adicionadas a cada lançamento, e
+   problemas estranhos aparecerão se os arquivos de configuração não estiverem
+   preparados como esperado. Se você quiser levar a sua configuração existente
+   para uma nova versão com o mínimo de trabalho, use ``make oldconfig``, que
+   perguntará apenas as respostas para as novas questões.
+
+ - Comandos alternativos de configuração são::
+
+     "make config"      Interface em texto puro.
+
+     "make menuconfig"  Menus coloridos, listas de seleção e diálogos, em
+                        modo texto.
+
+     "make nconfig"     Menus coloridos aprimorados, em modo texto.
+
+     "make xconfig"     Ferramenta de configuração baseada em Qt.
+
+     "make gconfig"     Ferramenta de configuração baseada em GTK.
+
+     "make oldconfig"   Assume o padrão para todas as questões com base no
+                        conteúdo do seu arquivo ./.config existente e
+                        pergunta sobre os novos símbolos de configuração.
+
+     "make olddefconfig"
+                        Como o anterior, mas define os novos símbolos com
+                        seus valores padrão, sem perguntar.
+
+     "make defconfig"   Cria um arquivo ./.config usando os valores padrão
+                        dos símbolos, vindos de
+                        arch/$ARCH/configs/defconfig ou de
+                        arch/$ARCH/configs/${PLATFORM}_defconfig,
+                        dependendo da arquitetura.
+
+     "make ${PLATFORM}_defconfig"
+                        Cria um arquivo ./.config usando os valores padrão
+                        dos símbolos vindos de
+                        arch/$ARCH/configs/${PLATFORM}_defconfig.
+                        Use "make help" para obter uma lista de todas as
+                        plataformas disponíveis para a sua arquitetura.
+
+     "make allyesconfig"
+                        Cria um arquivo ./.config definindo os valores dos
+                        símbolos como 'y' sempre que possível.
+
+     "make allmodconfig"
+                        Cria um arquivo ./.config definindo os valores dos
+                        símbolos como 'm' sempre que possível.
+
+     "make allnoconfig" Cria um arquivo ./.config definindo os valores dos
+                        símbolos como 'n' sempre que possível.
+
+     "make randconfig"  Cria um arquivo ./.config definindo os valores dos
+                        símbolos aleatoriamente.
+
+     "make localmodconfig" Cria uma configuração baseada na configuração
+                           atual e nos módulos carregados (lsmod). Desativa
+                           qualquer opção de módulo que não seja necessária
+                           para os módulos carregados.
+
+                           Para criar um localmodconfig para outra máquina,
+                           armazene o lsmod daquela máquina em um arquivo e
+                           o passe como parâmetro LSMOD.
+
+                           Além disso, você pode preservar módulos em certas
+                           pastas ou arquivos kconfig especificando seus
+                           caminhos no parâmetro LMC_KEEP.
+
+                   alvo$ lsmod > /tmp/mylsmod
+                   alvo$ scp /tmp/mylsmod host:/tmp
+
+                   host$ make LSMOD=/tmp/mylsmod \
+                           LMC_KEEP="drivers/usb:drivers/gpu:fs" \
+                           localmodconfig
+
+                           O acima também funciona em compilação cruzada.
+
+     "make localyesconfig" Semelhante ao localmodconfig, exceto que converte
+                           todas as opções de módulo em opções embutidas
+                           (=y). Você também pode preservar módulos com o
+                           LMC_KEEP.
+
+     "make kvm_guest.config"   Habilita opções adicionais para suporte a
+                               kernel convidado do kvm.
+
+     "make xen.config"   Habilita opções adicionais para suporte a kernel
+                         convidado dom0 do xen.
+
+     "make tinyconfig"  Configura o menor kernel possível.
+
+   Você pode encontrar mais informações sobre o uso das ferramentas de
+   configuração do kernel Linux em Documentation/kbuild/kconfig.rst.
+
+ - NOTAS sobre o ``make config``:
+
+    - Ter drivers desnecessários deixará o kernel maior e, em algumas
+      circunstâncias, pode levar a problemas: sondar uma placa controladora
+      inexistente pode confundir as suas outras controladoras.
+
+    - Um kernel com emulação matemática compilada ainda usará o
+      coprocessador, se houver um presente: a emulação matemática
+      simplesmente nunca será usada nesse caso. O kernel ficará um pouco
+      maior, mas funcionará em máquinas diferentes, independentemente de
+      terem ou não um coprocessador matemático.
+
+    - Os detalhes de configuração de "kernel hacking" normalmente resultam em
+      um kernel maior ou mais lento (ou ambos), e podem até tornar o kernel
+      menos estável, ao configurar algumas rotinas para tentar ativamente
+      quebrar código ruim e encontrar problemas no kernel (kmalloc()).
+      Portanto, você provavelmente deve responder 'n' às questões sobre
+      recursos de "development", "experimental" ou "debugging".
+
+Compilando o kernel
+-------------------
+
+ - Certifique-se de ter pelo menos o gcc 8.1 disponível.
+   Para mais informações, consulte
+   Documentation/translations/pt_BR/process/changes.rst.
+
+ - Execute um ``make`` para criar uma imagem compactada do kernel. Também é
+   possível executar ``make install`` se você tiver o lilo instalado ou se a
+   sua distribuição possuir um script de instalação reconhecido pelo
+   instalador do kernel. A maioria das distribuições populares terá um script
+   de instalação reconhecido. Talvez você queira verificar antes a
+   configuração da sua distribuição.
+
+   Para fazer a instalação de fato, você precisa ser root, mas nada da
+   compilação normal deve exigir isso. Não tome o nome de root em vão.
+
+ - Se você configurou qualquer parte do kernel como ``modules``, também terá
+   que executar ``make modules_install``.
+
+ - Saída detalhada (verbose) da compilação do kernel:
+
+   Normalmente, o sistema de compilação do kernel roda em um modo bastante
+   silencioso (mas não totalmente). No entanto, às vezes você ou outros
+   desenvolvedores do kernel precisam ver os comandos de compilação, de
+   ligação (link) ou outros exatamente como são executados. Para isso, use o
+   modo de compilação "verbose". Isso é feito passando ``V=1`` ao comando
+   ``make``, por exemplo::
+
+     make V=1 all
+
+   Para que o sistema de compilação também informe o motivo da recompilação
+   de cada alvo, use ``V=2``. O padrão é ``V=0``.
+
+ - Mantenha um kernel de backup à mão, caso algo dê errado. Isso é
+   especialmente verdadeiro para as versões de desenvolvimento, já que cada
+   novo lançamento contém código novo que não foi depurado. Certifique-se de
+   manter também um backup dos módulos correspondentes àquele kernel. Se
+   você estiver instalando um novo kernel com o mesmo número de versão do seu
+   kernel em funcionamento, faça um backup do seu diretório de módulos antes
+   de executar um ``make modules_install``.
+
+   Como alternativa, antes de compilar, use a opção de configuração do kernel
+   "LOCALVERSION" para acrescentar um sufixo único à versão normal do kernel.
+   A LOCALVERSION pode ser definida no menu "General Setup".
+
+ - Para inicializar o seu novo kernel, você precisará copiar a imagem do
+   kernel (por exemplo, .../linux/arch/x86/boot/bzImage após a compilação)
+   para o local onde o seu kernel inicializável habitual se encontra.
+
+ - Inicializar um kernel diretamente de um dispositivo de armazenamento, sem
+   a ajuda de um gerenciador de inicialização como o LILO ou o GRUB, não é
+   mais suportado na BIOS (sistemas não EFI). Em sistemas UEFI/EFI, no
+   entanto, você pode usar o EFISTUB, que permite à placa-mãe inicializar
+   diretamente no kernel. Em estações de trabalho e desktops modernos,
+   geralmente recomenda-se usar um gerenciador de inicialização, pois podem
+   surgir dificuldades com múltiplos kernels e com o secure boot.
+   Para mais detalhes sobre o EFISTUB, veja
+   "Documentation/admin-guide/efi-stub.rst".
+
+ - É importante observar que, desde 2016, o LILO (LInux LOader) não está mais
+   em desenvolvimento ativo, embora, por ter sido extremamente popular,
+   apareça com frequência na documentação. Alternativas populares incluem
+   GRUB2, rEFInd, Syslinux, systemd-boot ou EFISTUB. Por diversas razões, não
+   é recomendável usar software que não esteja mais em desenvolvimento ativo.
+
+ - É provável que a sua distribuição inclua um script de instalação e que
+   executar ``make install`` seja tudo o que é necessário. Caso não seja
+   assim, você terá que identificar o seu gerenciador de inicialização e
+   consultar a documentação dele, ou configurar a sua EFI.
+
+Instruções legadas do LILO
+--------------------------
+
+
+ - Se você usa o LILO, as imagens do kernel são especificadas no arquivo
+   /etc/lilo.conf. O arquivo de imagem do kernel geralmente é /vmlinuz,
+   /boot/vmlinuz, /bzImage ou /boot/bzImage. Para usar o novo kernel, salve
+   uma cópia da imagem antiga e copie a nova imagem por cima da antiga.
+   Então, você DEVE EXECUTAR O LILO NOVAMENTE para atualizar o mapa de
+   carregamento! Se não fizer isso, não conseguirá inicializar a nova imagem
+   do kernel.
+
+ - Reinstalar o LILO geralmente é uma questão de executar /sbin/lilo. Talvez
+   você queira editar o /etc/lilo.conf para especificar uma entrada para a
+   sua imagem antiga do kernel (digamos, /vmlinux.old), caso a nova não
+   funcione. Veja a documentação do LILO para mais informações.
+
+ - Após reinstalar o LILO, deve estar tudo pronto. Desligue o sistema,
+   reinicie e aproveite!
+
+ - Se algum dia você precisar alterar o dispositivo raiz padrão, o modo de
+   vídeo, etc. na imagem do kernel, use as opções de inicialização do seu
+   gerenciador de inicialização onde for apropriado. Não é necessário
+   recompilar o kernel para alterar esses parâmetros.
+
+ - Reinicie com o novo kernel e aproveite.
+
+
+Se algo der errado
+------------------
+
+Se você tiver problemas que pareçam ser causados por bugs do kernel, por
+favor, siga as instruções em
+'Documentation/admin-guide/reporting-issues.rst'.
+
+Dicas sobre como entender os relatórios de bugs do kernel estão em
+'Documentation/admin-guide/bug-hunting.rst'. Mais sobre depuração do kernel
+com o gdb está em
+'Documentation/process/debugging/gdb-kernel-debugging.rst' e
+'Documentation/process/debugging/kgdb.rst'.
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index a5ad5baa3..716f6c1f7 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -21,9 +21,13 @@ Esta seção inicial contém informações gerais, incluindo o arquivo README qu
 descreve o kernel como um todo, documentação sobre os parâmetros do kernel,
 etc.
 
+.. toctree::
+   :maxdepth: 1
+
+   README
+
 Todolist:
 
-*   README
 *   devices
 *   features
 
-- 
2.47.3

