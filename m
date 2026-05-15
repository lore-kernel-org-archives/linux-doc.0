Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23D30C158
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869379; cv=none; b=SfIYnFq0Ln+4B8VKKi1CRWFQ4gdqV1DnGrKc8lWvyM3ihiSp4Fkg4HaAxe6+R9KBXhjAI7OshmdD3o50Sio0/6RLOoKfGP52w6vdxIhV/dofih7gaDIAdw5nUYpcwo2Rhj8/V46/mdD/npQh8svR97B6hzd2WaoOfFAiUVsP5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869379; c=relaxed/simple;
	bh=AE4RDJJbkyEk45O/Q6LsIlgES6T1sgbRtoQlfRyML7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FR4W1kfdGOt/2C56FE1gZq+7gWG2JM6eqyNGoXUOkQZNNsKPJTzzbMqO18EW591Wtpky1183SQYg5W+8nqa/mOPfRKkKIdtfeJ22TvUQF/YUoVf8Mv613+ojR3/GgHktEq7RGoAy2/z/Lws8YQOSJ/OJHu/2yNPfFE4KD8r4+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmM060fl; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmM060fl"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-90caad2e944so21300485a.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778869373; x=1779474173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj5mI3Mx778GtcV+Q3J9aeQjCFA456wQkqXqD1o0Cbg=;
        b=CmM060flRiqBm0KdaC4R+pvhZfbvOjrReDrY+P7e6WFOc8KvUknvdthfvD+SAS3qon
         MhJzdKO7Rtf6UEiviDQR7QE40uCO0gc/yaqPuYFtzqJEjb0D+0wsnq3pX2I1HlQHP+9u
         OIB+o1W0gGcrJNu3yNqvgbgKVo54n3j/ZoFbTqKk15ThNd1IcR30kiBTnxTnt0zg15is
         W9mWXMCJwiwMyoprTUfndDuo5lrRmdluaZY/vu0GnL5AU1zF/nHeivwEYAEHRgmjwjWA
         DkeIA5nRaXYQrdF6WcJXMUb6d6q9if8txvQtALgHkXGu9xU2sedX3DyDb3R4kIN50haj
         VUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778869373; x=1779474173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj5mI3Mx778GtcV+Q3J9aeQjCFA456wQkqXqD1o0Cbg=;
        b=R609TVl8rJyuLk5VqDMq9PMUvkgOQzVzBWOUDgTfM+Yxg5/nXaYtm6qg4stkH1a8SJ
         5PBvNv+WaWt/bEjeQVFP/wWgBV8rsSxx4U4xFjTMlMjbPFnbYyMa6tBRlNyqm0ZFMccl
         qcQWvO+HAe5GuTPT2z3iUIcoWn41sTlKhNmDpYXzxUMTsYMH5MwPQdqsixKmUYWiyN85
         ZeynLR56Z68fhaslqHV8aUE5nBLcgr7yC0GsmUS9A0K231R9q3cxiQ0SrtVrEd0Tvhoy
         lwhd9P1ezyXzzJrYr9+fk5jxIvLg+QnUZOg8WMYnYJB3X8TnfIlww5eS1ArWaF39z8ru
         OKCA==
X-Gm-Message-State: AOJu0Yy+rVW4KPV9/uLjbJPgtOKL3DZ6V5U9NU8AXZ058egEMZNZ58H9
	VUChTe//Jz2hBKoSFAtKK1JePpPEXOz0ggJwNAsk9tLU7uiPesGQ0tPC
X-Gm-Gg: Acq92OGAmFdn/8WqoY5xg7TtnpUWNngaSpTPgwNmbAMfB2XNQiQdAymgBDQEOhFByqA
	dXeunLqHJb+mbilXvj5JsSk76onSxBLlO6H3KHfHVwaiR2JhitLvMaYD2Lw15OLL0uZnWFzOGd7
	OzRefSfEfqlVUg3YS3balX032/Qe7klIvl2lq0ZUS3LHXE5PTZ9D/Q1Eek6QQrlQ0D7jPabGMvd
	fkRKNkx8ypJ45h4NxO/jhjxhdwmQYyD/oOpQh7VKtCyq1VPKKB3SyJtqQ/5s3aXF4pod6LCrWkN
	rTagSFDYD4seLlfsQ0iiZSyz5DXOwMwP43g3M9PC+jRyNhoRAXQveQhNcsforpx0/TPPaWB047E
	IxXwCUamtd6fNN1u+MiNDcJIDVZ+NahKqGvXz1rNKbz0S6TVEVdP75u5pzrLVrewnpTIUdgdfqN
	5fnUCFu+kD3Ti1D+xbasn4L4WYqWzznD7infqtdS9RBW7hzO5+1jSmAwTSWVbDq/6JYAg6fxZrJ
	WvaHHnxhjWm5baVZTTe
X-Received: by 2002:a05:620a:3188:b0:8cf:c272:9721 with SMTP id af79cd13be357-911ccd8b9d3mr823286785a.6.1778869373141;
        Fri, 15 May 2026 11:22:53 -0700 (PDT)
Received: from parrot.admin.dimenoc.com ([2804:29b8:512d:48d6:8193:5de2:2987:3476])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e638sm618586985a.9.2026.05.15.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:22:52 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2] docs: pt_BR: update minimal software requirements in changes.rst
Date: Fri, 15 May 2026 15:21:58 -0300
Message-ID: <20260515182200.654324-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Update the Brazilian Portuguese translation of changes.rst to align with
the latest English version.

Key changes include:
- Updated minimum versions for Rust (1.85.0), bindgen (0.71.1), and
  pahole (1.22).
- Fixed ReST syntax for internal references (:ref:) and external links.
- Corrected formatting for tool names and config options using inline
  code backticks.
- Synchronized technical descriptions for udev, kmod, and NFS-utils.

v2:
- Fix alignment in the minimal software requirements table that broke the build.
- Fix Sphinx footnote syntax.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/changes.rst    | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
index 1964c1c93..a105581dc 100644
--- a/Documentation/translations/pt_BR/process/changes.rst
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@ -20,7 +20,8 @@ Requisitos Mínimos Atuais
 
 Atualize para pelo menos estas revisões de software antes de pensar que
 encontrou um bug! Se não tiver certeza de qual versão está executando atualmente
-, o comando sugerido deve lhe informar.
+, o comando sugerido deve lhe informar. Para uma lista dos programas em seu
+sistema, incluindo as versões, execute ./scripts/ver_linux.
 
 Novamente, tenha em mente que esta lista pressupõe que você já possui um kernel
 Linux em execução funcional. Além disso, nem todas as ferramentas são
@@ -28,20 +29,21 @@ necessárias em todos os sistemas; obviamente, se você não possui nenhum hardw
 PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautils.
 
 ====================== ===============  ========================================
-        Programa        Versão mínima       Comando para verificar a versão
+Programa               Versão mínima    Comando para verificar a versão
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.78.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
+Rust (optional)        1.85.0           rustc --version
+bindgen (optional)     0.71.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
 binutils               2.30             ld -v
 flex                   2.5.35           flex --version
+gdb                    7.2              gdb --version
 bison                  2.0              bison --version
-pahole                 1.16             pahole --version
+pahole                 1.22             pahole --version
 util-linux             2.10o            mount --version
-kmod                   13               depmod -V
+kmod                   13               kmod -V
 e2fsprogs              1.41.4           e2fsck -V
 jfsutils               1.1.3            fsck.jfs -V
 xfsprogs               2.6.0            xfs_db -V
@@ -52,13 +54,13 @@ quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
 nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevd --version
+udev                   081              udevadm --version
 grub                   0.93             grub --version || grub-install --version
 mcelog                 0.6              mcelog --version
 iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+Sphinx [#f1]_          3.4.3            sphinx-build --version
 GNU tar                1.28             tar --version
 gtags (opcional)       6.6.5            gtags --version
 mkimage (opcional)     2017.01          mkimage --version
@@ -81,11 +83,11 @@ Clang/LLVM (opcional)
 ---------------------
 
 A versão formal mais recente do clang e dos utilitários LLVM (de acordo com
-releases.llvm.org <https://releases.llvm.org>_) é suportada para a compilação
+`releases.llvm.org <https://releases.llvm.org>`_) é suportada para a compilação
 de kernels. Versões anteriores não têm funcionamento garantido, e poderemos
 remover do kernel soluções de contorno (workarounds) que eram utilizadas para
-suportar versões mais antigas. Por favor, veja a documentação adicional em:
-ref:Building Linux with Clang/LLVM <kbuild_llvm>.
+suportar versões mais antigas. Por favor, veja a documentação adicional em
+:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
 
 Rust (opcional)
 ---------------
@@ -124,7 +126,7 @@ pkg-config
 
 O sistema de compilação, a partir da versão 4.18, requer o pkg-config para
 verificar as ferramentas kconfig instaladas e para determinar as configurações
-de flags para uso em make {g,x}config. Anteriormente, o pkg-config já era
+de flags para uso em 'make {g,x}config'. Anteriormente, o pkg-config já era
 utilizado, mas não era verificado nem documentado.
 
 Flex
@@ -145,7 +147,7 @@ pahole
 
 Desde o Linux 5.2, se CONFIG_DEBUG_INFO_BTF estiver selecionado, o sistema de
 compilação gera BTF (BPF Type Format) a partir do DWARF no vmlinux, e um pouco
-depois para os módulos do kernel também. Isso requer o pahole v1.16 ou superior.
+depois para os módulos do kernel também. Isso requer o pahole v1.22 ou superior.
 
 Ele pode ser encontrado nos pacotes ``dwarves`` ou ``pahole`` das
 distribuições, ou em https://fedorapeople.org/~acme/dwarves/.
@@ -153,8 +155,8 @@ distribuições, ou em https://fedorapeople.org/~acme/dwarves/.
 Perl
 ----
 
-Você precisará do perl 5 e dos seguintes módulos: Getopt::Long,
-Getopt::Std, File::Basename e File::Find para compilar o kernel.
+Você precisará do perl 5 e dos seguintes módulos: ``Getopt::Long``,
+``Getopt::Std``, ``File::Basename`` e ``File::Find`` para compilar o kernel.
 
 Python
 ------
@@ -191,14 +193,14 @@ gtags / GNU GLOBAL (optional)
 -----------------------------
 
 A compilação do kernel requer o GNU GLOBAL versão 6.6.5 ou superior para gerar
-arquivos de tags através de make gtags. Isso se deve ao uso da flag -C
-(--directory) pelo gtags.
+arquivos de tags através de make gtags. Isso se deve ao uso da flag ``-C
+(--directory)`` pelo ``gtags``.
 
 mkimage
 -------
 
 Esta ferramenta é utilizada ao gerar uma Flat Image Tree (FIT), comumente usada
-em plataformas ARM. A ferramenta está disponível através do pacote u-boot-tools
+em plataformas ARM. A ferramenta está disponível através do pacote ``u-boot-tools``
 ou pode ser compilada a partir do código-fonte do U-Boot. Veja as instruções em
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
@@ -225,13 +227,13 @@ A documentação das funções do Linux está migrando para a documentação emb
 definições no código-fonte. Esses comentários podem ser combinados com arquivos
 ReST no diretório Documentation/ para criar uma documentação enriquecida, que
 pode então ser convertida para arquivos PostScript, HTML, LaTeX, ePUB e PDF.
-Para converter do formato ReST para o formato de sua escolha,você precisará do
+Para converter do formato ReST para o formato de sua escolha, você precisará do
 Sphinx.
 
 Util-linux
 ----------
 
-Novas versões do util-linux oferecem suporte no fdisk para discos maiores,
+Novas versões do util-linux oferecem suporte no ``fdisk`` para discos maiores,
 suporte a novas opções para o mount, reconhecimento de mais tipos de partição e
 outras funcionalidades interessantes. Você provavelmente vai querer atualizar.
 
@@ -240,23 +242,23 @@ Ksymoops
 
 Se o impensável acontecer e o seu kernel sofrer um oops, você pode precisar da
 ferramenta ksymoops para decodificá-lo, mas na maioria dos casos, não será
-necessário. É geralmente preferível compilar o kernel com CONFIG_KALLSYMS para
+necessário. É geralmente preferível compilar o kernel com ``CONFIG_KALLSYMS`` para
 que ele produza dumps legíveis que possam ser usados no estado em que se
 encontram (isso também gera uma saída melhor do que a do ksymoops).
-Se por algum motivo o seu kernel não for compilado com CONFIG_KALLSYMS e você
+Se por algum motivo o seu kernel não for compilado com ``CONFIG_KALLSYMS`` e você
 não tiver como recompilar e reproduzir o oops com essa opção, você ainda poderá
 decodificá-lo com o ksymoops.
 
 Mkinitrd
 --------
 
-Estas mudanças no layout da árvore de arquivos /lib/modules também exigem que o
+Estas mudanças no layout da árvore de arquivos ``/lib/modules`` também exigem que o
 mkinitrd seja atualizado.
 
 E2fsprogs
 ---------
 
-A versão mais recente do e2fsprogs corrige diversos bugs no fsck e no debugfs.
+A versão mais recente do ``e2fsprogs`` corrige diversos bugs no fsck e no debugfs.
 Obviamente, é uma boa ideia atualizar.
 
 JFSutils
@@ -270,8 +272,6 @@ utilitários estão disponíveis:
 
 - ``mkfs.jfs`` - cria uma partição formatada em JFS.
 
-- Para o seu arquivo changes.rst, a tradução técnica adequada é:
-
 Outros utilitários de sistema de arquivos também estão disponíveis neste pacote.
 
 Xfsprogs
@@ -309,7 +309,7 @@ usando o udev, você poderá precisar de::
   mknod /dev/cpu/microcode c 10 184
   chmod 0644 /dev/cpu/microcode
 
-Se você não estiver usando o udev, você poderá precisar executar os comandos
+você poderá precisar executar os comandos
 acima como root antes de poder usar isso. Você provavelmente também desejará
 obter o utilitário de espaço de usuário ``microcode_ctl`` para utilizar em
 conjunto com este driver.
@@ -318,7 +318,7 @@ udev
 ----
 
 O udev é uma aplicação de espaço de usuário para popular o diretório /dev
-dinamicamente, apenas com entradas para dispositivos de fat presentes no
+dinamicamente, apenas com entradas para dispositivos de fato presentes no
 sistema. O udev substitui a funcionalidade básica do devfs, permitindo ao mesmo
 tempo a nomeação persistente de dispositivos.
 
-- 
2.47.3

