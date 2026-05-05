Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5D48BD2F
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010125; cv=none; b=P2FABEdZOjvT2B/xrN2yEUDTdW7/IL2GRHj0jaqTYSOlEpKXWMvDLrng6WEwcS5j5DtnvElYSDA511X5DSFirpitWdlQ8NmFLUhProbWz2vFrD36MC3zZ8xEdsNnE+skCsEmRtQYpGZqpxJ/7fPlj146ZPDdNVTFJN8DtsvJapo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010125; c=relaxed/simple;
	bh=Y9JgvQxdRngSs1TC6SxsuaWkhig2RN92XRFvVk87CZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pv2MuUUr2Aa8g6ZfWo4ComjG4VfuObWKrLdEAXZ3HJNfUWXHOmplTuzpDYT4Wesm3FlBHKwHRWD0TL/qLNbSVdlRuUtl2N5355bHy9wkhF23wa+jnI/ws40mo2FwzI57Exw1XLL21vcs68lDHL1gZycXIWTolxuW4mnRaMr9JCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4vZ/zGR; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4vZ/zGR"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-130a4aae5ccso265727c88.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 12:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778010123; x=1778614923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UH2ZIVaOflpnb+Mra29WUYXBGysWccM/zeyVwZ6O86g=;
        b=W4vZ/zGR6NJK1aY73FEcfskqSjkVJYyhV9HH0haK9c1MV4nktgCG9DMY5fbyxltkxg
         MpaE9zTPOhntBG+qWHlNaNgFUH1ApQWGoeuA4CP2hwaxbeVcvYBJpBU7mh4z9XOIqVj1
         iIhFCktzFfXWekljynf3e5RQTrM/HARCwknwDs01fMxGeuKYhAiPGi5NtyEo7vZPBthZ
         OkIEE09Bq4+w5AvgoOZzZ1x0H+9+bgOpk+pJL9tCW4ErbKp8BSMmGA4fsdR/b5NQRSzV
         0g7XaNbDaWS7iOFtISLjbEw3uQlb/db9ec3iilcorM+ySKO4/YR5eOoUA7/f/laf5GzG
         6WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778010123; x=1778614923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UH2ZIVaOflpnb+Mra29WUYXBGysWccM/zeyVwZ6O86g=;
        b=UJQbEeNNBLU5OxvsS13BPIV+9w97RExCjDsjUzgT/NL6Lmo7uXAaXK0ZuieOvSJgxI
         wNAHjesniPdr027EZhJyyAhgUkj7vWuZPKa0T2h639bMZfKJv2OB7CGZOJWJqS7Zrzbh
         Qj5H03cjlmUUKpiIQl7KG5w/wLQEJ+DdzuBBkaK9R/WdYmGjf2aSiaif7bef3+/MEQhv
         Etqp7CVhgoF9ByeBAvcxB3pOrq7G5PjbTeNIUzTDkCz9maFdTvCR+5inHdP7O/P9m53F
         Ukbm4bz4ILbZRdy1gEjWZaLXBQsOyZbuD7vooC9FsWrYrUMQxM8LzccB+5cN5NqcAtrm
         BGnQ==
X-Gm-Message-State: AOJu0YxlKsYh4egExYEc8MoOlyAaUzbskd++i7pFZz8PTHM4czjEgZvs
	uUk3ptpz5olSk7UMCuhIyEDAUcpaVtkq9ucjE17fcyUpRXl9kaH1nibZ
X-Gm-Gg: AeBDietAYAcv7NZH53Wj3wCyEtfrtgCsRFndoO5flvMFQFRVK3VjFxHth8DBlnfgmxJ
	OYJ3rP2DFXI0HND17u8gU8v7HC02FL2S6gk+SuI4AAs57+m9xkNFB9a3Dd8oMMsKDsZGl6Ji90P
	Ds5nFQn4LzSo3eoJhPJaRZtPkJnnh9Nor7P3mti8dPEzO3CoSJUa2cdA47ANEdAKSpeOeFL2waz
	50ytBTufyXFgFYhTHvV55FVGm0jGsMlGC+UL9SFgt+ibAvcBBILk62ILTUfLw5XgWt8O7K9iI0X
	GCRzn77VJz4BQztG9INroBttNiLu4HX/i6dskj7PNSZJ+Ispmp/vlRsPk9Rf0OSjXCpAIE1Li2w
	aY28yKdz5Oohq8n6iRrhQgyx9jHiwJtIK6DGmdOq5M785qjqkwTI1yy/18tAIVP7wZ8JXhhD+9/
	CGKYpNGDxjGJ+Fm42wtJEDgf6Hk/iRlxB1zEyolpMKphpBKLTquv7f5D9y9K8zZ8QZ9dbXiVtt1
	yWjN8Nk9wtWoAHYzY6BAnM=
X-Received: by 2002:a05:7022:4184:b0:12d:de3e:86a6 with SMTP id a92af1059eb24-131964aa313mr341168c88.36.1778010122381;
        Tue, 05 May 2026 12:42:02 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:50a2:bcf0:da41:36d1:b2c3:d440])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-131f9686bd0sm171342c88.4.2026.05.05.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 12:42:01 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs: pt_BR: update minimal software requirements in changes.rst
Date: Tue,  5 May 2026 16:41:41 -0300
Message-ID: <20260505194143.32009-1-danielmaraboo@gmail.com>
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

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/changes.rst    | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
index 1964c1c93..642927bba 100644
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
@@ -32,16 +33,17 @@ PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautil
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.78.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
+Rust (optional)        1.85.0           rustc --version
+bindgen (optional)     0.71.1          bindgen --version
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
@@ -52,7 +54,7 @@ quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
 nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevd --version
+udev                   081              udevadm --version
 grub                   0.93             grub --version || grub-install --version
 mcelog                 0.6              mcelog --version
 iptables               1.4.2            iptables -V
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

