Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254DA38885B
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658032; cv=none; b=TqB5fvLF29hA7KVCWbBanVdXKpm6NayySP0jiSKZ/jvdv5HLBpMnv4Pb/5MlEU8wIGkfg0N1vuOVhKntbOalG/XItrUBNcsV9ZDmEbytQR6yeAT04zYxMaJ+6v0QLT55lmuEUcG5jYgaJyjbhQWDumV3XdDEp0YyvgcmqBT1rI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658032; c=relaxed/simple;
	bh=OUdXvIgQGePP5Q6sq+e/5luOIOFKvG6T65ZUfTwyRJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ARI4lH4zvSoOsywOyulznhn16zk0L1kzK+bYFBVl0Yko1sTOPF0hKEF0tZvDj6eGgjDpD1pxQDA5m2PhDFuMYzZIVkXsoJHRAmiAKhR0Bi3CjbD3uNdD2ygzLGzz6C9xIuET/7V8jVYPB6eeP0k6nC2kJSvTGX4++Y9dfJs6OOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui/ZRkve; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui/ZRkve"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-126ea4b77adso5040547c88.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770658031; x=1771262831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi0Bvo8gqEROSF89r+0kzym862IvCVWlPMYnVF5zygo=;
        b=Ui/ZRkvevLCJb8Imz3c7VuY/hXOJl6Xp9eKqFg2LMUUHPP1GsTjQwJ1boUEgpWGmaO
         gK3Rnj0iwIhxppgGhZ3Igb9YXRRLew0mlZBksYXWa+4SkzRP/TFOMRkDG8r9aT83ydIV
         lTuA5+fSuWpAe+ADKZsewL1jgrZ5Vi1WquLPVwzI7ZJkfHZQRtkWSchLOvkmJewu1KC9
         qyRIxf0+Wzsx9xOH35xR5x9Oa4EpAwdXO2SwH+fstIT7G+K1dZExnVD6tiYDJiJHrv3M
         xRusu+8Bb5qkfeB9hBdQb6PV+n2TC2s1q6TGO/e3ERLrLNYCsFmW9LofVlTzrZVciG0+
         yhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770658031; x=1771262831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi0Bvo8gqEROSF89r+0kzym862IvCVWlPMYnVF5zygo=;
        b=Zx800gO77QpNsic4g5K5sHrLiAbrNBIXeLtduY0QO0b80/k77zKZDqHwDvdkm7jNZP
         CilYL1wBVJ7yOxg56qyOvxyWQBpImf2DqS8D25S2qHqhBusKEsuHvxnyeAiSOC+W2ys8
         cPA1lePdGjhqHemUc3+UFA4jrMG7w/WmrgZclTBrfszZchbgtluhc02Yq8jmPyGFDNRH
         akUvFq+5ZOen2QfSmbt2gnqgW3q0AitoxrfCSVc0uSpyY3hx51in1JwzfUPLKyBfXO06
         GjLR58yVzzz5Gqv5pGBBs/Rfxs1IUjjBY4wnlRiFERQlr/RINYNvlIrFaPgcv56AwmmM
         sJAQ==
X-Gm-Message-State: AOJu0YwNjVnYjXOGWg3BNC4eY2J8Mq7OJAyTB1idjuFL1V4qibO+kA14
	Yxk0aKs3dXm0FbrJRcRgJEW2KltfNBUQUM+2Y6ip4GtVEPU01uDi+s8BzzUAc1lQ
X-Gm-Gg: AZuq6aKgkVY2V8+hj2MK7CrJ8vs7oj+nrfvwS6C4pH65U8zEGyfyzVotpMB3JMZKgbn
	4rMptOjL2KvpJJjuLYgYBCGnkGrxKDgSZv7qBSDJvUX6h4TCCXDMA7Iz8SQTKf3tzeeOZPQz9F+
	Sfe3AFT/pYx1IkXg0foNjzLt30KzLhxb0IDnUcLL5im0ZzCWrNv1AB2PDEnIjhbAP8WeFEuHs7q
	Gkii/iRbZk1PRVcRrj/GiqPDVTtmRNGvMC7eO/SMQ+mqqr7oG+glPtYGcTVMcWvLYXFB44LQFf0
	PyTkzpeevxktjqIEFXmEuRCn3K85gQjPGGepQRd9k/G0r+1kN4wdh4GylWD/dyq8mcoIHBAYGVx
	5vQ5kVFtNRHe/SPwedaOwnV5hHk6GQgSmZqE1bCQIsFFJ28sujnndhi862pkWDnzc3L/4GuZerB
	aYfYfqw1+6RhQ1EYR7tEO3SGqqZ39ymyDmOU0FJapMvvHTaJvO4p47OJOD6SWwdAl6OUs42JZ1G
	rdgUqsi/LpuTCX3+A==
X-Received: by 2002:a05:7022:41a1:b0:122:2f4:b251 with SMTP id a92af1059eb24-12703f9890emr6179615c88.21.1770658030602;
        Mon, 09 Feb 2026 09:27:10 -0800 (PST)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12715c4dd76sm5257229c88.10.2026.02.09.09.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 09:27:10 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs: pt_BR: translate process/changes.rst
Date: Mon,  9 Feb 2026 14:26:20 -0300
Message-ID: <20260209172621.11330-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the Documentation/process/changes.rst file into Portuguese.
This document provides the list of minimum software requirements
necessary to compile and run the Linux kernel.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
Note: This patch depends on the previous work:
"[PATCH v5] docs: pt_BR: Add initial Portuguese translation"
if the pt_BR translation directory is not yet present in the tree.

 Documentation/translations/index.rst          |   4 +-
 Documentation/translations/pt_BR/index.rst    |   5 +-
 .../translations/pt_BR/process/changes.rst    | 540 ++++++++++++++++++
 .../translations/pt_BR/process/howto.rst      |   2 +-
 4 files changed, 546 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/changes.rst

diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
index b6d24f6f1..03b146e24 100644
--- a/Documentation/translations/index.rst
+++ b/Documentation/translations/index.rst
@@ -28,9 +28,9 @@ Translation's purpose is to ease reading and understanding in languages other
 than English. Its aim is to help people who do not understand English or have
 doubts about its interpretation. Additionally, some people prefer to read
 documentation in their native language, but please bear in mind that the
-*only* official documentation is the English one: :ref:`linux_doc`.
+*only* official documentation is the English one: :doc:`../index`.
 
-It is very unlikely that an update to :ref:`linux_doc` will be propagated
+It is very unlikely that an update to :doc:`../index` will be propagated
 immediately to all translations.  Translations' maintainers - and
 contributors - follow the evolution of the official documentation and they
 maintain translations aligned as much as they can.  For this reason there is
diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 44fafb3c7..fb804c3b3 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -32,9 +32,9 @@ Avisos
 O objetivo desta tradução é facilitar a leitura e compreensão para aqueles que
 não dominam o inglês ou têm dúvidas sobre sua interpretação, ou simplesmente
 para quem prefere ler em sua língua nativa. No entanto, tenha em mente que a
-*única* documentação oficial é a em língua inglesa: :ref:`linux_doc`
+*única* documentação oficial é a em língua inglesa: :doc:`../../index`
 
-A propagação simultânea de uma alteração em :ref:`linux_doc` para todas as
+A propagação simultânea de uma alteração em :doc:`../../index` para todas as
 traduções é altamente improvável. Os mantenedores das traduções — e seus
 contribuidores — acompanham a evolução da documentação oficial e tentam manter
 as respectivas traduções alinhadas na medida do possível. Por este motivo, não
@@ -67,3 +67,4 @@ kernel e sobre como ver seu trabalho integrado.
    :maxdepth: 1
 
    Como começar <process/howto>
+   Requisitos mínimos <process/changes>
diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
new file mode 100644
index 000000000..11c430be9
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@ -0,0 +1,540 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _changes:
+
+Requisitos mínimos para compilar o Kernel
+++++++++++++++++++++++++++++++++++++++++++
+
+Introdução
+===========
+
+Este documento foi projetado para fornecer uma lista das versões mínimas
+de software necessárias para executar a versão atual do kernel.
+
+Este documento é originalmente baseado no meu arquivo 'Changes' para os kernels 2.0.x e
+portanto, deve créditos às mesmas pessoas que aquele arquivo (Jared Mauch, Axel Boldt,
+Alessandro Sigala e inúmeros outros usuários em toda a rede).
+
+Requisitos Mínimos Atuais
+****************************
+
+Atualize para pelo menos estas revisões de software antes de pensar que encontrou um bug!
+Se não tiver certeza de qual versão está executando atualmente, o comando sugerido deve lhe
+informar.
+
+Novamente, tenha em mente que esta lista pressupõe que você já possui um kernel Linux em execução
+funcional. Além disso, nem todas as ferramentas são necessárias em todos os sistemas; obviamente,
+se você não possui nenhum hardware PC Card, por exemplo, provavelmente não precisará se preocupar
+com o pcmciautils.
+
+====================== ===============  ========================================
+        Programa        Versão mínima       Comando para verificar a versão
+====================== ===============  ========================================
+GNU C                  8.1              gcc --version
+Clang/LLVM (optional)  15.0.0           clang --version
+Rust (optional)        1.78.0           rustc --version
+bindgen (optional)     0.65.1           bindgen --version
+GNU make               4.0              make --version
+bash                   4.2              bash --version
+binutils               2.30             ld -v
+flex                   2.5.35           flex --version
+bison                  2.0              bison --version
+pahole                 1.16             pahole --version
+util-linux             2.10o            mount --version
+kmod                   13               depmod -V
+e2fsprogs              1.41.4           e2fsck -V
+jfsutils               1.1.3            fsck.jfs -V
+xfsprogs               2.6.0            xfs_db -V
+squashfs-tools         4.0              mksquashfs -version
+btrfs-progs            0.18             btrfs --version
+pcmciautils            004              pccardctl -V
+quota-tools            3.09             quota -V
+PPP                    2.4.0            pppd --version
+nfs-utils              1.0.5            showmount --version
+procps                 3.2.0            ps --version
+udev                   081              udevd --version
+grub                   0.93             grub --version || grub-install --version
+mcelog                 0.6              mcelog --version
+iptables               1.4.2            iptables -V
+openssl & libcrypto    1.0.0            openssl version
+bc                     1.06.95          bc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+GNU tar                1.28             tar --version
+gtags (opcional)       6.6.5            gtags --version
+mkimage (opcional)     2017.01          mkimage --version
+Python                 3.9.x            python3 --version
+GNU AWK (opcional)     5.1.0            gawk --version
+====================== ===============  ========================================
+
+.. [#f1] O Sphinx é necessário apenas para gerar a documentação do Kernel.
+
+Compilação do Kernel
+*********************
+
+GCC
+---
+
+Os requisitos da versão do gcc podem variar dependendo do tipo de CPU
+do seu computador.
+
+Clang/LLVM (opcional)
+---------------------
+
+A versão formal mais recente do clang e dos utilitários LLVM (de acordo com
+releases.llvm.org <https://releases.llvm.org>_) é suportada para a compilação
+de kernels. Versões anteriores não têm funcionamento garantido, e poderemos remover
+do kernel soluções de contorno (workarounds) que eram utilizadas para suportar versões
+mais antigas. Por favor, veja a documentação adicional em:
+ref:Building Linux with Clang/LLVM <kbuild_llvm>.
+
+Rust (opcional)
+---------------
+
+É necessária uma versão recente do compilador Rust.
+
+Por favor, consulte Documentation/rust/quick-start.rst para obter instruções sobre como atender
+aos requisitos de compilação do suporte a Rust. Em particular, o alvo (target) rustavailable do
+Makefile é útil para verificar por que a cadeia de ferramentas (toolchain) Rust pode não estar sendo
+detectada.
+
+bindgen (opcional)
+------------------
+
+O ``bindgen`` é utilizado para gerar os vínculos (bindings) Rust para o lado C do kernel. Ele
+depende da ``libclang``.
+
+Make
+----
+
+Você precisará do GNU make 4.0 ou superior para compilar o kernel.
+
+Bash
+----
+
+Alguns scripts bash são usados para a compilação do kernel.
+É necessário o Bash 4.2 ou mais recente.
+
+Binutils
+--------
+
+O binutils 2.30 ou mais recente é necessário para compilar o kernel.
+
+pkg-config
+----------
+
+O sistema de compilação, a partir da versão 4.18, requer o pkg-config para
+verificar as ferramentas kconfig instaladas e para determinar as configurações
+de flags para uso em make {g,x}config. Anteriormente, o pkg-config já era utilizado,
+mas não era verificado nem documentado.
+
+Flex
+----
+
+Desde o Linux 4.16, o sistema de compilação gera analisadores léxicos durante a compilação.
+Isso requer o flex 2.5.35 ou superior.
+
+
+Bison
+-----
+
+Desde o Linux 4.16, o sistema de compilação gera analisadores sintáticos durante a compilação.
+Isso requer o bison 2.0 ou superior
+
+pahole
+------
+
+Desde o Linux 5.2, se CONFIG_DEBUG_INFO_BTF estiver selecionado, o sistema de compilação gera BTF
+(BPF Type Format) a partir do DWARF no vmlinux, e um pouco depois para os módulos do kernel também.
+Isso requer o pahole v1.16 ou superior.
+
+Ele pode ser encontrado nos pacotes ``dwarves`` ou ``pahole`` das
+distribuições, ou em https://fedorapeople.org/~acme/dwarves/.
+
+Perl
+----
+
+Você precisará do perl 5 e dos seguintes módulos: Getopt::Long,
+Getopt::Std, File::Basename e File::Find para compilar o kernel.
+
+Python
+------
+
+Várias opções de configuração o exigem: ele é necessário para as configurações padrão (defconfigs)
+de arm/arm64, CONFIG_LTO_CLANG, algumas configurações opcionais de DRM, a ferramenta kernel-doc e a
+geração da documentação (Sphinx), entre outros.
+
+BC
+--
+
+Você precisará do bc para compilar kernels 3.10 ou superior.
+
+
+OpenSSL
+-------
+
+A assinatura de módulos e a manipulação de certificados externos utilizam o programa OpenSSL e a biblioteca
+de criptografia para realizar a criação de chaves e a geração de assinaturas.
+
+Você precisará do openssl para compilar kernels 3.7 e superiores se a assinatura de módulos estiver habilitada.
+Você também precisará dos pacotes de desenvolvimento do openssl para compilar kernels 4.3 e superiores.
+
+Tar
+---
+
+O GNU tar é necessário caso você deseje habilitar o acesso aos cabeçalhos do kernel via sysfs (CONFIG_IKHEADERS).
+
+gtags / GNU GLOBAL (optional)
+-----------------------------
+
+A compilação do kernel requer o GNU GLOBAL versão 6.6.5 ou superior para gerar arquivos de tags através de make
+gtags. Isso se deve ao uso da flag -C (--directory) pelo gtags.
+
+mkimage
+-------
+
+Esta ferramenta é utilizada ao gerar uma Flat Image Tree (FIT), comumente usada em plataformas ARM. A ferramenta
+está disponível através do pacote u-boot-tools ou pode ser compilada a partir do código-fonte do U-Boot. Veja as
+instruções em https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
+
+GNU AWK
+-------
+
+O GNU AWK é necessário caso você deseje que a compilação do kernel gere dados de intervalo de endereços para
+módulos integrados (CONFIG_BUILTIN_MODULE_RANGES).
+
+Utilitários de sistema
+***********************
+
+Mudanças de arquitetura
+------------------------
+
+O DevFS tornou-se obsoleto em favor do udev (https://www.kernel.org/pub/linux/utils/kernel/hotplug/)
+
+O suporte a UIDs de 32 bits já está implementado. Divirta-se!
+
+A documentação das funções do Linux está migrando para a documentação embutida (inline), por meio de comentários
+com formatação especial próximos às suas definições no código-fonte. Esses comentários podem ser combinados com
+arquivos ReST no diretório Documentation/ para criar uma documentação enriquecida, que pode então ser convertida
+para arquivos PostScript, HTML, LaTeX, ePUB e PDF. Para converter do formato ReST para o formato de sua escolha,
+você precisará do Sphinx.
+
+Util-linux
+----------
+
+Novas versões do util-linux oferecem suporte no fdisk para discos maiores, suporte a novas opções para o mount,
+reconhecimento de mais tipos de partição e outras funcionalidades interessantes. Você provavelmente vai querer atualizar.
+
+Ksymoops
+--------
+
+Se o impensável acontecer e o seu kernel sofrer um oops, você pode precisar da ferramenta ksymoops para decodificá-lo, mas
+na maioria dos casos, não será necessário. É geralmente preferível compilar o kernel com CONFIG_KALLSYMS para que ele produza
+dumps legíveis que possam ser usados no estado em que se encontram (isso também gera uma saída melhor do que a do ksymoops).
+Se por algum motivo o seu kernel não for compilado com CONFIG_KALLSYMS e você não tiver como recompilar e reproduzir o oops
+com essa opção, você ainda poderá decodificá-lo com o ksymoops.
+
+Mkinitrd
+--------
+
+Estas mudanças no layout da árvore de arquivos /lib/modules também exigem que o mkinitrd seja atualizado.
+
+E2fsprogs
+---------
+
+A versão mais recente do e2fsprogs corrige diversos bugs no fsck e no debugfs. Obviamente, é uma boa ideia atualizar.
+
+JFSutils
+--------
+
+O pacote jfsutils contém os utilitários para o sistema de arquivos. Os seguintes utilitários estão disponíveis:
+
+- ``fsck.jfs`` - inicia a reprodução (replay) do log de transações, além de verificar e reparar uma partição formatada em JFS.
+
+- ``mkfs.jfs`` - cria uma partição formatada em JFS.
+
+- Para o seu arquivo changes.rst, a tradução técnica adequada é:
+
+Outros utilitários de sistema de arquivos também estão disponíveis neste pacote.
+
+Xfsprogs
+--------
+
+A versão mais recente do ``xfsprogs`` contém os utilitários ``mkfs.xfs``, ``xfs_db`` e ``xfs_repair``, entre outros, para o sistema
+de arquivos XFS. Ele é independente de arquitetura e qualquer versão a partir da 2.0.0 deve funcionar corretamente com esta versão
+do código do kernel XFS (recomenda-se a versão 2.6.0 ou posterior, devido a algumas melhorias significativas).
+
+PCMCIAutils
+-----------
+
+O PCMCIAutils substitui o pcmcia-cs. Ele configura corretamente os sockets PCMCIA na inicialização do sistema e carrega os módulos
+apropriados para dispositivos PCMCIA de 16 bits, caso o kernel esteja modularizado e o subsistema de hotplug seja utilizado.
+
+Quota-tools
+-----------
+
+O suporte a UIDs e GIDs de 32 bits é necessário caso você deseje utilizar o formato de cota versão 2 mais recente. O quota-tools
+versão 3.07 e superiores possuem esse suporte. Utilize a versão recomendada ou superior da tabela acima.
+
+Intel IA32 microcode
+--------------------
+
+Um driver foi adicionado para permitir a atualização do microcódigo Intel IA32, acessível como um dispositivo de caracteres comum (misc).
+Se você não estiver usando o udev, você poderá precisar de::
+
+  mkdir /dev/cpu
+  mknod /dev/cpu/microcode c 10 184
+  chmod 0644 /dev/cpu/microcode
+
+Se você não estiver usando o udev, você poderá precisar executar os comandos acima como root antes de poder usar isso. Você provavelmente
+também desejará obter o utilitário de espaço de usuário ``microcode_ctl`` para utilizar em conjunto com este driver.
+
+udev
+----
+
+O udev é uma aplicação de espaço de usuário para popular o diretório /dev dinamicamente, apenas com entradas para dispositivos de fato
+presentes no sistema. O udev substitui a funcionalidade básica do devfs, permitindo ao mesmo tempo a nomeação persistente de dispositivos.
+
+FUSE
+----
+
+Necessita do libfuse 2.4.0 ou posterior. O mínimo absoluto é a versão 2.3.0, mas as opções de montagem direct_io e kernel_cache
+não funcionarão.
+
+Redes
+******
+
+Mudanças gerais
+----------------
+
+Caso você tenha necessidades avançadas de configuração de rede, você deve provavelmente considerar o uso das ferramentas de rede
+do iproute2.
+
+Filtro de Pacotes / NAT
+------------------------
+
+O código de filtragem de pacotes e NAT utiliza as mesmas ferramentas da série anterior de kernels 2.4.x (iptables). Ele ainda
+inclui módulos de retrocompatibilidade para o ipchains (estilo 2.2.x) e o ipfwadm (estilo 2.0.x).
+
+PPP
+---
+
+O driver PPP foi reestruturado para suportar multilink e permitir que opere sobre diversas camadas de mídia. Se você utiliza PPP,
+atualize o pppd para, no mínimo, a versão 2.4.0.
+
+Se você não estiver usando o udev, você deve possuir o arquivo de dispositivo ``/dev/ppp``, o qual pode ser criado por::
+
+  mknod /dev/ppp c 108 0
+
+como root.
+
+NFS-utils
+---------
+
+Em kernels antigos (2.4 e anteriores), o servidor NFS precisava conhecer qualquer cliente que pretendesse acessar
+arquivos via NFS. Essa informação era fornecida ao kernel pelo mountd quando o cliente montava o sistema de
+arquivos, ou pelo exportfs na inicialização do sistema. O exportfs obtinha informações sobre clientes ativos a partir
+de /var/lib/nfs/rmtab.
+
+Esta abordagem é bastante frágil, pois depende da integridade do rmtab, o que nem sempre é fácil, particularmente ao
+tentar implementar fail-over. Mesmo quando o sistema está funcionando bem, o rmtab sofre com o acúmulo de muitas
+entradas antigas que nunca são removidas.
+
+Com kernels modernos, temos a opção de fazer o kernel informar ao mountd quando recebe uma requisição de um host
+desconhecido, permitindo que o mountd forneça as informações de exportação apropriadas ao kernel. Isso remove a
+dependência do rmtab e significa que o kernel só precisa conhecer os clientes ativos no momento.
+
+Para habilitar esta nova funcionalidade, você precisa::
+
+  mount -t nfsd nfsd /proc/fs/nfsd
+
+antes de executar o exportfs ou o mountd. Recomenda-se que todos os serviços NFS sejam protegidos da internet em
+geral por um firewall, sempre que possível.
+
+mcelog
+------
+
+Em kernels x86, o utilitário mcelog é necessário para processar e registrar eventos de machine check quando a
+opção CONFIG_X86_MCE está ativada. Eventos de machine check são erros relatados pela CPU. O processamento desses
+eventos é fortemente recomendado.
+
+Documentação do Kernel
+***********************
+
+Sphinx
+------
+
+Por favor, consulte :ref:`sphinx_install` em :ref:`Documentation/doc-guide/sphinx.rst` <sphinxdoc> para detalhes
+sobre os requisitos do Sphinx.
+
+rustdoc
+-------
+
+O rustdoc é utilizado para gerar a documentação para código Rust. Por favor, consulte Documentation/rust/general-information.rst
+para mais informações.
+
+Obtendo software atualizado
+============================
+
+Compilação do kernel
+**********************
+
+gcc
+---
+
+- <ftp://ftp.gnu.org/gnu/gcc/>
+
+Clang/LLVM
+----------
+
+- :ref:`Getting LLVM <getting_llvm>`.
+
+Rust
+----
+
+- Documentation/rust/quick-start.rst.
+
+bindgen
+-------
+
+- Documentation/rust/quick-start.rst.
+
+Make
+----
+
+- <ftp://ftp.gnu.org/gnu/make/>
+
+Bash
+----
+
+- <ftp://ftp.gnu.org/gnu/bash/>
+
+Binutils
+--------
+
+- <https://www.kernel.org/pub/linux/devel/binutils/>
+
+Flex
+----
+
+- <https://github.com/westes/flex/releases>
+
+Bison
+-----
+
+- <ftp://ftp.gnu.org/gnu/bison/>
+
+OpenSSL
+-------
+
+- <https://www.openssl.org/>
+
+System utilities
+****************
+
+Util-linux
+----------
+
+- <https://www.kernel.org/pub/linux/utils/util-linux/>
+
+Kmod
+----
+
+- <https://www.kernel.org/pub/linux/utils/kernel/kmod/>
+- <https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git>
+
+Ksymoops
+--------
+
+- <https://www.kernel.org/pub/linux/utils/kernel/ksymoops/v2.4/>
+
+Mkinitrd
+--------
+
+- <https://code.launchpad.net/initrd-tools/main>
+
+E2fsprogs
+---------
+
+- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
+- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>
+
+JFSutils
+--------
+
+- <https://jfs.sourceforge.net/>
+
+Xfsprogs
+--------
+
+- <https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git>
+- <https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/>
+
+Pcmciautils
+-----------
+
+- <https://www.kernel.org/pub/linux/utils/kernel/pcmcia/>
+
+Quota-tools
+-----------
+
+- <https://sourceforge.net/projects/linuxquota/>
+
+
+Intel P6 microcode
+------------------
+
+- <https://downloadcenter.intel.com/>
+
+udev
+----
+
+- <https://www.freedesktop.org/software/systemd/man/udev.html>
+
+FUSE
+----
+
+- <https://github.com/libfuse/libfuse/releases>
+
+mcelog
+------
+
+- <https://www.mcelog.org/>
+
+Redes
+******
+
+PPP
+---
+
+- <https://download.samba.org/pub/ppp/>
+- <https://git.ozlabs.org/?p=ppp.git>
+- <https://github.com/paulusmack/ppp/>
+
+NFS-utils
+---------
+
+- <https://sourceforge.net/project/showfiles.php?group_id=14>
+- <https://nfs.sourceforge.net/>
+
+Iptables
+--------
+
+- <https://netfilter.org/projects/iptables/index.html>
+
+Ip-route2
+---------
+
+- <https://www.kernel.org/pub/linux/utils/net/iproute2/>
+
+OProfile
+--------
+
+- <https://oprofile.sf.net/download/>
+
+Kernel documentation
+********************
+
+Sphinx
+------
+
+- <https://www.sphinx-doc.org/>
diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documentation/translations/pt_BR/process/howto.rst
index 8ed780aa1..849b302bb 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -99,7 +99,7 @@ que são de leitura obrigatória:
     o que é necessário fazer para configurar e compilar o kernel. Pessoas
     que são novas no kernel devem começar por aqui.
 
-  :ref:`Documentation/process/changes.rst <changes>`
+  :ref:`Documentation/translations/pt_BR/changes.rst <changes>`
     Este arquivo fornece uma lista das versões mínimas de vários pacotes de
     software que são necessários para compilar e executar o kernel com
     sucesso.
-- 
2.47.3

