Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F773783BB
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 23:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771890380; cv=none; b=jPibWTNydPdVjNwnHvx/aLCHHKYm9rwMlzsfIXbtGRfYX1e43wtoAelU9T5JvDgoji7HORpMvqTProMgfr9PT4oB+X9N4P3WQK9oirpPPSv7yIrxoYlZKyw5P+QKDxYx2+3NKsjZxOdSvPcSfJFrLNk3IASADgV3aKRoOy+fFRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771890380; c=relaxed/simple;
	bh=VjnTU+i0Xh2sjXtti+EK5Nk+LTNsw9U11rUflnlWlAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rh+AjE9wUVXtaDkU2bli6aHqtqxeEEcaVi44gvuhwRBj4EqbPxXoM2S2Mn4Ko3kSwOvc017JaQl+cGlTh6x9POmNHjyoE1cCkoKu9+KR5QNbjLis1E6dqblQDPbAm9LrzO+w1sXrprzvblaac4cUvP21YMEkP1g7u3Gfioddz3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5O6f085; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5O6f085"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5fa3f2b8f7dso2818120137.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 15:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771890377; x=1772495177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBkzawZU5mhdgOTeJO+3Sy5Emd/URMF58YFBlJI8kOM=;
        b=l5O6f085TCw2xi+JxvhObP5tbE7UoPzh+BbzLlAGMPSxiqtmhrUQ8C6Lr8u/TpC2Sw
         fHTgUHSx6LI76OYv5oDWYSE1AmbcaigKcIIEE+RaFCeM0iD+mreFye7EA2MufqWz7Pz6
         2TliQo5IZdi8c0VFoY4CdPDhqqzaQVPXU2mYG5muqEvSS0PZQvPXr3KozTedlQokbsqQ
         3+P7htZUVVt3L/wtvrDyIC2fXopH7voXuuFLjO26AKdm1XAcUAlPKkS8Hx0rkecW1/t4
         RNIqHmGqXQZPHzQTSpdDpQUHnXe1BFBugN3XLlcViyGnk6XAjDVLVn17FvEp20G/Z/NC
         PQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771890377; x=1772495177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBkzawZU5mhdgOTeJO+3Sy5Emd/URMF58YFBlJI8kOM=;
        b=UjiMMJO8HGuLSKWDgFYLVFyLwYRgfpBVm5ouvoQxetkmt0Ws1IWJx+y4hz5XRHuD7i
         Rl8h5mN3WTW9w2mSgfBTrs7pyPHcjo7Yl1Irj4BLIWQ4/sNQYooY483BB8Ws+cWKm2d4
         Rv9NM5EOyJQnXLpInSn4OKZs+EqF9Ea0Gsn4coG4wMT2qE3Trlp4iog6/tUo+Hw1r0sE
         lRBEA6zEHrXlonkC5gm3+MQ0tu+O+1YUBC3Nlpb9PS/UuCWA9GQb77lkSRcY4q3gYsqN
         JsQiokY5nZWOfJv5MPLjULRwCjZj1AdyUd0bFsmDc6+kDHsONbMyx2pULBtb4GKGr6Hv
         nuEw==
X-Gm-Message-State: AOJu0YzIeW0/cwF5XJF1ookInIXWOrHmr+mh/L9p6Fhy8FA5fthfvTBd
	gXvjT6Dsei4dPH/poKsfDsGBTxEpMCE3kjIqVRntsApIXRoFo3wEZeuS/qvn6U8H
X-Gm-Gg: ATEYQzxanz1D83sBqxOwpKgHPf0SG/rAWTmHIxAVX0wGfrD1S4MVW1+120CmqzR0g+i
	/y0qyCcRYW03sSIQcxpBPz8YDUu3kwtser628LRVYApnbm2LWH2zTkuXxH746BrffqI+tISmpM2
	0OXXPi0T408LKiU60HfipamGt8WD2TLUGJNQTtWvkGH+OxStGBDAY/PFz1lq93L3kybG+DjNB6K
	NPO95cRlSNRYdlfFdZW6k3Ekcl/xqRoKZjMv714jLH7/cSd0Wx7dIA3msVwtbp37Lhv4EPhf/U7
	SQrkq1ich9cl4y9F5vq20uLdetm8PJv5Eg72xqxPzRrqKaifay31s/Q0qFKXrMRizvxaBHRZG6R
	h2dc9njhLH1sbegEDyK4JAiCn396niHRdjuY1LQO/r7+2sXA/7LtlaEuVQAov97filAu/dmnCUO
	PN4s95s9/FE5CvFINjoT5skLa5a99d5ju3AgPRKBgvg4y7UPpdzp693APZSrBOdbXvdAcnWxpc0
	02Nrl16YTLe6eXg
X-Received: by 2002:a05:6102:e0e:b0:5f9:3ae9:8564 with SMTP id ada2fe7eead31-5feb38ebf39mr5313518137.19.1771890376525;
        Mon, 23 Feb 2026 15:46:16 -0800 (PST)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5feb648582fsm9309884137.12.2026.02.23.15.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:46:16 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v4] docs: pt_BR: translate process/changes.rst
Date: Mon, 23 Feb 2026 20:45:21 -0300
Message-ID: <20260223234523.50960-1-danielmaraboo@gmail.com>
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
v4:
  - Fixed line wrapping to respect the 80-column limit.
  - Fixed Sphinx reference by removing :ref: tags and using the file path 
    directly to resolve build warnings.

v3:
  - Fixed directory structure for pt_BR locale.
  - Added pt_BR support to the documentation build script.

Note: This patch depends on "docs: pt_BR: Add initial Portuguese (Brazilian) 
translation" being applied first, as it establishes the directory structure.

 Documentation/translations/pt_BR/index.rst    |   1 +
 .../translations/pt_BR/process/changes.rst    | 576 ++++++++++++++++++
 .../translations/pt_BR/process/howto.rst      |   2 +-
 3 files changed, 578 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/changes.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 44fafb3c7..55f9f377e 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -67,3 +67,4 @@ kernel e sobre como ver seu trabalho integrado.
    :maxdepth: 1
 
    Como começar <process/howto>
+   Requisitos mínimos <process/changes>
diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
new file mode 100644
index 000000000..cab246eef
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@ -0,0 +1,576 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+
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
+Este documento é originalmente baseado no meu arquivo 'Changes' para os kernels 
+2.0.x e portanto, deve créditos às mesmas pessoas que aquele arquivo (Jared 
+Mauch, Axel Boldt, Alessandro Sigala e inúmeros outros usuários em toda a rede).
+
+Requisitos Mínimos Atuais
+****************************
+
+Atualize para pelo menos estas revisões de software antes de pensar que 
+encontrou um bug! Se não tiver certeza de qual versão está executando atualmente
+, o comando sugerido deve lhe informar.
+
+Novamente, tenha em mente que esta lista pressupõe que você já possui um kernel 
+Linux em execução funcional. Além disso, nem todas as ferramentas são 
+necessárias em todos os sistemas; obviamente, se você não possui nenhum hardware
+PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautils.
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
+de kernels. Versões anteriores não têm funcionamento garantido, e poderemos 
+remover do kernel soluções de contorno (workarounds) que eram utilizadas para 
+suportar versões mais antigas. Por favor, veja a documentação adicional em:
+ref:Building Linux with Clang/LLVM <kbuild_llvm>.
+
+Rust (opcional)
+---------------
+
+É necessária uma versão recente do compilador Rust.
+
+Por favor, consulte Documentation/rust/quick-start.rst para obter instruções 
+sobre como atender aos requisitos de compilação do suporte a Rust. Em 
+particular, o alvo (target) rustavailable do Makefile é útil para verificar por 
+que a cadeia de ferramentas (toolchain) Rust pode não estar sendo detectada.
+
+bindgen (opcional)
+------------------
+
+O ``bindgen`` é utilizado para gerar os vínculos (bindings) Rust para o lado C 
+do kernel. Ele depende da ``libclang``.
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
+de flags para uso em make {g,x}config. Anteriormente, o pkg-config já era 
+utilizado, mas não era verificado nem documentado.
+
+Flex
+----
+
+Desde o Linux 4.16, o sistema de compilação gera analisadores léxicos durante a 
+compilação. Isso requer o flex 2.5.35 ou superior.
+
+
+Bison
+-----
+
+Desde o Linux 4.16, o sistema de compilação gera analisadores sintáticos durante 
+a compilação. Isso requer o bison 2.0 ou superior
+
+pahole
+------
+
+Desde o Linux 5.2, se CONFIG_DEBUG_INFO_BTF estiver selecionado, o sistema de 
+compilação gera BTF (BPF Type Format) a partir do DWARF no vmlinux, e um pouco 
+depois para os módulos do kernel também. Isso requer o pahole v1.16 ou superior.
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
+Várias opções de configuração o exigem: ele é necessário para as configurações 
+padrão (defconfigs) de arm/arm64, CONFIG_LTO_CLANG, algumas configurações 
+opcionais de DRM, a ferramenta kernel-doc e a geração da documentação (Sphinx), 
+entre outros.
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
+A assinatura de módulos e a manipulação de certificados externos utilizam o 
+programa OpenSSL e a biblioteca de criptografia para realizar a criação de 
+chaves e a geração de assinaturas.
+
+Você precisará do openssl para compilar kernels 3.7 e superiores se a assinatura 
+de módulos estiver habilitada. Você também precisará dos pacotes de 
+desenvolvimento do openssl para compilar kernels 4.3 e superiores.
+
+Tar
+---
+
+O GNU tar é necessário caso você deseje habilitar o acesso aos cabeçalhos do 
+kernel via sysfs (CONFIG_IKHEADERS).
+
+gtags / GNU GLOBAL (optional)
+-----------------------------
+
+A compilação do kernel requer o GNU GLOBAL versão 6.6.5 ou superior para gerar 
+arquivos de tags através de make gtags. Isso se deve ao uso da flag -C 
+(--directory) pelo gtags.
+
+mkimage
+-------
+
+Esta ferramenta é utilizada ao gerar uma Flat Image Tree (FIT), comumente usada 
+em plataformas ARM. A ferramenta está disponível através do pacote u-boot-tools 
+ou pode ser compilada a partir do código-fonte do U-Boot. Veja as instruções em 
+https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
+
+GNU AWK
+-------
+
+O GNU AWK é necessário caso você deseje que a compilação do kernel gere dados de
+intervalo de endereços para
+módulos integrados (CONFIG_BUILTIN_MODULE_RANGES).
+
+Utilitários de sistema
+***********************
+
+Mudanças de arquitetura
+------------------------
+
+O DevFS tornou-se obsoleto em favor do udev 
+(https://www.kernel.org/pub/linux/utils/kernel/hotplug/)
+
+O suporte a UIDs de 32 bits já está implementado. Divirta-se!
+
+A documentação das funções do Linux está migrando para a documentação embutida 
+(inline), por meio de comentários com formatação especial próximos às suas 
+definições no código-fonte. Esses comentários podem ser combinados com arquivos 
+ReST no diretório Documentation/ para criar uma documentação enriquecida, que 
+pode então ser convertida para arquivos PostScript, HTML, LaTeX, ePUB e PDF. 
+Para converter do formato ReST para o formato de sua escolha,você precisará do 
+Sphinx.
+
+Util-linux
+----------
+
+Novas versões do util-linux oferecem suporte no fdisk para discos maiores, 
+suporte a novas opções para o mount, reconhecimento de mais tipos de partição e 
+outras funcionalidades interessantes. Você provavelmente vai querer atualizar.
+
+Ksymoops
+--------
+
+Se o impensável acontecer e o seu kernel sofrer um oops, você pode precisar da 
+ferramenta ksymoops para decodificá-lo, mas na maioria dos casos, não será 
+necessário. É geralmente preferível compilar o kernel com CONFIG_KALLSYMS para 
+que ele produza dumps legíveis que possam ser usados no estado em que se 
+encontram (isso também gera uma saída melhor do que a do ksymoops).
+Se por algum motivo o seu kernel não for compilado com CONFIG_KALLSYMS e você 
+não tiver como recompilar e reproduzir o oops com essa opção, você ainda poderá 
+decodificá-lo com o ksymoops.
+
+Mkinitrd
+--------
+
+Estas mudanças no layout da árvore de arquivos /lib/modules também exigem que o 
+mkinitrd seja atualizado.
+
+E2fsprogs
+---------
+
+A versão mais recente do e2fsprogs corrige diversos bugs no fsck e no debugfs. 
+Obviamente, é uma boa ideia atualizar.
+
+JFSutils
+--------
+
+O pacote jfsutils contém os utilitários para o sistema de arquivos. Os seguintes 
+utilitários estão disponíveis:
+
+- ``fsck.jfs`` - inicia a reprodução (replay) do log de transações, além de 
+  verificar e reparar uma partição formatada em JFS.
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
+A versão mais recente do ``xfsprogs`` contém os utilitários ``mkfs.xfs``, 
+``xfs_db`` e ``xfs_repair``, entre outros, para o sistema de arquivos XFS. Ele é 
+independente de arquitetura e qualquer versão a partir da 2.0.0 deve funcionar 
+corretamente com esta versão do código do kernel XFS (recomenda-se a 
+versão 2.6.0 ou posterior, devido a algumas melhorias significativas).
+
+PCMCIAutils
+-----------
+
+O PCMCIAutils substitui o pcmcia-cs. Ele configura corretamente os sockets 
+PCMCIA na inicialização do sistema e carrega os módulos apropriados para 
+dispositivos PCMCIA de 16 bits, caso o kernel esteja modularizado e o subsistema 
+de hotplug seja utilizado.
+
+Quota-tools
+-----------
+
+O suporte a UIDs e GIDs de 32 bits é necessário caso você deseje utilizar o 
+formato de cota versão 2 mais recente. O quota-tools versão 3.07 e superiores 
+possuem esse suporte. Utilize a versão recomendada ou superior da tabela acima.
+
+Intel IA32 microcode
+--------------------
+
+Um driver foi adicionado para permitir a atualização do microcódigo Intel IA32, 
+acessível como um dispositivo de caracteres comum (misc). Se você não estiver 
+usando o udev, você poderá precisar de::
+
+  mkdir /dev/cpu
+  mknod /dev/cpu/microcode c 10 184
+  chmod 0644 /dev/cpu/microcode
+
+Se você não estiver usando o udev, você poderá precisar executar os comandos 
+acima como root antes de poder usar isso. Você provavelmente também desejará 
+obter o utilitário de espaço de usuário ``microcode_ctl`` para utilizar em 
+conjunto com este driver.
+
+udev
+----
+
+O udev é uma aplicação de espaço de usuário para popular o diretório /dev 
+dinamicamente, apenas com entradas para dispositivos de fat presentes no 
+sistema. O udev substitui a funcionalidade básica do devfs, permitindo ao mesmo 
+tempo a nomeação persistente de dispositivos.
+
+FUSE
+----
+
+Necessita do libfuse 2.4.0 ou posterior. O mínimo absoluto é a versão 2.3.0, 
+mas as opções de montagem direct_io e kernel_cache não funcionarão.
+
+Redes
+******
+
+Mudanças gerais
+----------------
+
+Caso você tenha necessidades avançadas de configuração de rede, você deve 
+provavelmente considerar o uso das ferramentas de rede do iproute2.
+
+Filtro de Pacotes / NAT
+------------------------
+
+O código de filtragem de pacotes e NAT utiliza as mesmas ferramentas da série 
+anterior de kernels 2.4.x (iptables). Ele ainda inclui módulos de 
+retrocompatibilidade para o ipchains (estilo 2.2.x) e o ipfwadm (estilo 2.0.x).
+
+PPP
+---
+
+O driver PPP foi reestruturado para suportar multilink e permitir que opere 
+sobre diversas camadas de mídia. Se você utiliza PPP, atualize o pppd para, no 
+mínimo, a versão 2.4.0.
+
+Se você não estiver usando o udev, você deve possuir o arquivo de dispositivo 
+``/dev/ppp``, o qual pode ser criado por::
+
+  mknod /dev/ppp c 108 0
+
+como root.
+
+NFS-utils
+---------
+
+Em kernels antigos (2.4 e anteriores), o servidor NFS precisava conhecer 
+qualquer cliente que pretendesse acessar arquivos via NFS. Essa informação era 
+fornecida ao kernel pelo mountd quando o cliente montava o sistema de arquivos, 
+ou pelo exportfs na inicialização do sistema. O exportfs obtinha informações 
+sobre clientes ativos a partir de /var/lib/nfs/rmtab.
+
+Esta abordagem é bastante frágil, pois depende da integridade do rmtab, o que 
+nem sempre é fácil, particularmente ao tentar implementar fail-over. Mesmo 
+quando o sistema está funcionando bem, o rmtab sofre com o acúmulo de muitas
+entradas antigas que nunca são removidas.
+
+Com kernels modernos, temos a opção de fazer o kernel informar ao mountd quando 
+recebe uma requisição de um host desconhecido, permitindo que o mountd forneça 
+as informações de exportação apropriadas ao kernel. Isso remove a dependência do 
+rmtab e significa que o kernel só precisa conhecer os clientes ativos no 
+momento.
+
+Para habilitar esta nova funcionalidade, você precisa::
+
+  mount -t nfsd nfsd /proc/fs/nfsd
+
+antes de executar o exportfs ou o mountd. Recomenda-se que todos os serviços NFS 
+sejam protegidos da internet em geral por um firewall, sempre que possível.
+
+mcelog
+------
+
+Em kernels x86, o utilitário mcelog é necessário para processar e registrar 
+eventos de machine check quando opção CONFIG_X86_MCE está ativada. Eventos de 
+machine check são erros relatados pela CPU. O processamento desses eventos é 
+fortemente recomendado.
+
+Documentação do Kernel
+***********************
+
+Sphinx
+------
+
+Por favor, consulte Documentation/doc-guide/sphinx.rst para detalhes sobre os
+requisitos do Sphinx.
+
+rustdoc
+-------
+
+O rustdoc é utilizado para gerar a documentação para código Rust. Por favor, 
+consulte Documentation/rust/general-information.rst para mais informações.
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
index 8ed780aa1..e8ccee6b9 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -99,7 +99,7 @@ que são de leitura obrigatória:
     o que é necessário fazer para configurar e compilar o kernel. Pessoas
     que são novas no kernel devem começar por aqui.
 
-  :ref:`Documentation/process/changes.rst <changes>`
+  :doc:`changes`
     Este arquivo fornece uma lista das versões mínimas de vários pacotes de
     software que são necessários para compilar e executar o kernel com
     sucesso.
-- 
2.47.3

