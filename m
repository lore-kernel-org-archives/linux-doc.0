Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A644BD360
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064070; cv=none; b=nMaz25wQI5niFINXiXZu4l3gvfUawQt+jFIM8QdvwF3eGDPfczsUALRz2I7TQdux4zrvFE2TcbvCr7Fld+MHG8PwnCoO1k7efHr2Pqf/5EMpndvzJX3fx5w8Z7HOte3LocgaE2+4maJ76jvUGwyH7FWsQXLzpaHopi5lwD+5rfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064070; c=relaxed/simple;
	bh=oUrBRWVkRT1EOVjzThcVg0GqFMG0xgykJknd61hft7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTcW1gt38w41s7pEoGxQ8rxBaNCtGY0ORgN3BehNCMMlxiJvtzspwOo/0sBr2yvq92yRTYCVM2na3zRw8ZsXK0maLvWF0uSKI6WZzdXi6C8tOGAVSCp3UGtpfF7rHSAE+kaMmO0wD1xU90py8yadvRUoSmoKiAg3mSUkb0cyg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLifv0I0; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLifv0I0"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-156cbe59622so400515c88.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064061; x=1792668861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5kuwLe9tSv85hnm9yJCiNNzgikBIWx2N3U4UDJLTtk=;
        b=sLifv0I05IMFMAlzqfb1a8p20fotHyuHFvtyIX3Gr2MzdB0RHhtvm8uY1KmEF4tqFs
         gP4OIhXB6q0HZZOuZgKNMOidX2VPi7yyZeJAv6vu7kH8FG84gWu9L75aTFXjof27JuTk
         p3W3sSn2GskHVpBAxw7meje1WiGSXdwNVNFC7NOyd9/UUEzMIZhesSpJsPwCrZFnN5M1
         WL7cvwpdiQWQEbKNcoJdA27/FdKgPV0mMNE1MMRR7/KMdKzmKRU8EpZgVU6h10N+s9O2
         aFhrHds9uyH+AP8ZDDdg3fWuyiwrH7a2/pJ0tn52KrZSlUcZFKPe0ZvAqeY2ydy1v0+/
         p30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064061; x=1792668861;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5kuwLe9tSv85hnm9yJCiNNzgikBIWx2N3U4UDJLTtk=;
        b=r3ZfR6uImN2SJkymQOMk0RxY6bNAHLMYYcPaaMiauynJs2GFl3KLjrkhWPisIy9Mqt
         NN6FZEuUr7TT936vfvnKHc3/84Yd62NIeidi58IkI5wOZrFeJHCLx9S8pDz+vPq5NRsg
         Q/UM9HmDjWGzunKRNYq0Q0oy2LVtgoxnj1oWapyyJXZGs2IDXPa0g+UHox0vC/KUck7c
         W5BXmRO/4+GuR603Fkl9LrDxi1kN1AWGOReXFyDy6EmdDygGxH7s+Kso76Df+yRi8qcH
         +yUsi8+2Wy1V31Mis0vk1RQ8o2877e5ZpOILKwC8hTpnnrtIiZLpzYHjzTVStI+i80zV
         hZsQ==
X-Gm-Message-State: AFq9FYJkV/5GhCPJFbECPBqWGoCnlQqzaAjUtUQ2IieKZ986YjWhrClM
	b2pzjRFNSsOmj+xbRwtY97RtiyCrqT4f3bCKieasPV/75p7kUMKrrR2D3myf2z+F
X-Gm-Gg: AYBFou1BB4lYjfdIHqxb0ouYCcfxNyIx/bhuLGmUbCIiNIeXAxmRX0b1mfgq+Rg6Czp
	Xa0rsSjviHWJMKZgEkEVJxa3kuguveDds/BehVcUoyIdiu7ZupxICHNWSSrMfOadSJ99SfKFY1S
	Ewu16H1DlUEHOwi+PiLu+swdW/IV5WAoS6F2+FK8dFgioRLK3mUH1OBKI9YzSOxDehqT/Xma4IU
	wY/wHTkXbAMqXPFtCRcHxCvTUfZakEKR6DCtJ0JUBBQ1ckN/VAWPjguMaq2S7Lj3y9IayVIFcKt
	ccUKwsWw6fbCIftRoZ9H9fxiT1DnQoz9+Ox4g9CXiw+tAVsNRBEqazYmifSnlIO98+gEQbJklIt
	+Q22StRrpaGB97TZdgX7y21/MTtmasXu1kG7WPM0B8Qyjs00jmJYMfopfDOgqaUMj2kPub+PtDn
	hKtHhqEo2dAcrL1QvG+uA2j5zt1d1xGd9VYE8/Hclw1soXaBmO/U21MOSlm3bz/WFWOOTN52yLS
	S2Y1nlMH5txhJ9twKFGHZIcE/zGvi2fxM7lSgQUGV+3ngL56MvJKTAZZwK5CgRIxi2YHci2i6fv
	7eEYSdipCT6uEq/HtFGOY3E=
X-Received: by 2002:a05:7022:f51c:b0:160:90a3:ca8c with SMTP id a92af1059eb24-16a5fe7bebfmr21160879c88.7.1792064060639;
        Thu, 15 Oct 2026 04:34:20 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:20 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 02/10] docs/translations/pt_BR: admin-guide: add sysfs-rules.rst
Date: Thu, 15 Oct 2026 08:31:10 -0300
Message-ID: <20261015113121.4550-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of sysfs-rules.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/admin-guide/index.rst  |   6 +-
 .../pt_BR/admin-guide/sysfs-rules.rst         | 195 ++++++++++++++++++
 2 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/sysfs-rules.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 2db14d3b4..90f536bdb 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -32,9 +32,13 @@ Uma grande parte da interface administrativa do kernel são os sistemas de
 arquivos virtuais /proc e sysfs; estes documentos descrevem como interagir
 com eles.
 
+.. toctree::
+   :maxdepth: 1
+
+   sysfs-rules
+
 Todolist:
 
-*   sysfs-rules
 *   sysctl/index
 *   cputopology
 *   abi
diff --git a/Documentation/translations/pt_BR/admin-guide/sysfs-rules.rst b/Documentation/translations/pt_BR/admin-guide/sysfs-rules.rst
new file mode 100644
index 000000000..97459a9a0
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/sysfs-rules.rst
@@ -0,0 +1,195 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Regras sobre como acessar informações no sysfs
+==============================================
+
+O sysfs exportado pelo kernel expõe detalhes internos de implementação do
+kernel e depende de estruturas e do leiaute internos do kernel. Há um consenso
+entre os desenvolvedores do kernel de que o kernel Linux não fornece uma API
+interna estável. Portanto, existem aspectos da interface do sysfs que podem
+não ser estáveis entre lançamentos do kernel.
+
+Para minimizar o risco de quebrar os usuários do sysfs — que, na maioria dos
+casos, são aplicações de espaço de usuário de baixo nível — a cada novo
+lançamento do kernel, os usuários do sysfs devem seguir algumas regras para usar
+uma forma o mais abstrata possível de acessar esse sistema de arquivos. Os
+programas udev e HAL atuais já implementam isso, e os usuários são incentivados
+a se conectar, se possível, às abstrações que esses programas fornecem em vez de
+acessar o sysfs diretamente.
+
+Mas, se você realmente quer ou precisa acessar o sysfs diretamente, siga as
+seguintes regras e, assim, seus programas deverão funcionar com versões
+futuras da interface do sysfs.
+
+- Não use a libsysfs
+    Ela faz suposições sobre o sysfs que não são verdadeiras. Sua API não
+    oferece nenhuma abstração; ela expõe todos os detalhes de implementação do
+    driver-core do kernel em sua própria API. Portanto, ela não é melhor do que
+    ler diretórios e abrir os próprios arquivos.
+    Além disso, ela não é mantida ativamente no sentido de refletir o
+    desenvolvimento atual do kernel. O objetivo de fornecer uma interface
+    estável para o sysfs falhou; ela causa mais problemas do que resolve. Ela
+    viola muitas das regras deste documento.
+
+- sysfs está sempre em ``/sys``
+    Analisar ``/proc/mounts`` é perda de tempo. Outros pontos de montagem são um
+    bug de configuração do sistema que você não deve tentar contornar. Para
+    casos de teste, talvez ofereça suporte a uma variável de ambiente
+    ``SYSFS_PATH`` para sobrescrever o comportamento da aplicação, mas nunca
+    tente procurar pelo sysfs. Nunca tente montá-lo, a menos que você seja um
+    script de inicialização inicial (early boot).
+
+- Dispositivos são apenas "dispositivos"
+    Não existe algo como dispositivos de classe, de barramento, físicos,
+    interfaces e afins com os quais você possa contar no espaço de usuário.
+    Tudo é simplesmente um "dispositivo". Tipos como classe, barramento,
+    físico... são apenas detalhes de implementação do kernel que não devem ser
+    esperados por aplicações que procuram dispositivos no sysfs.
+
+    As propriedades de um dispositivo são:
+
+    - devpath (``/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0``)
+
+      - idêntico ao valor de DEVPATH no evento enviado pelo kernel na criação e
+        remoção do dispositivo
+      - a chave única para o dispositivo naquele momento
+      - o caminho do kernel para o diretório do dispositivo sem o ``/sys`` inicial,
+        e sempre começando com uma barra
+      - todos os elementos de um devpath devem ser diretórios reais. Links
+        simbólicos apontando para /sys/devices devem ser sempre resolvidos para o
+        seu alvo real e o caminho do alvo deve ser usado para acessar o dispositivo.
+        Dessa forma, o devpath para o dispositivo corresponde ao devpath do kernel
+        usado no momento do evento.
+      - usar ou expor valores de symlinks como elementos em uma string de devpath
+        é um bug na aplicação
+
+    - nome do kernel (``sda``, ``tty``, ``0000:00:1f.2``, ...)
+
+      - um nome de diretório, idêntico ao último elemento do devpath
+      - as aplicações precisam lidar com espaços e caracteres como ``!`` no
+        nome
+
+    - subsistema (``block``, ``tty``, ``pci``, ...)
+
+      - string simples, nunca um caminho ou um link
+      - recuperado através da leitura do link "subsystem" e usando apenas o
+        último elemento do caminho de destino
+
+    - driver (``tg3``, ``ata_piix``, ``uhci_hcd``)
+
+      - uma string simples, que pode conter espaços, nunca um caminho ou um
+        link
+      - é recuperado pela leitura do link "driver" e usando apenas o último
+        elemento do caminho de destino
+      - dispositivos que não possuem o link "driver" simplesmente não possuem um
+        driver; copiar o valor do driver no contexto de um dispositivo filho é
+        um bug na aplicação
+
+    - atributos
+
+      - os arquivos no diretório do dispositivo ou arquivos abaixo de subdiretórios
+        do mesmo diretório de dispositivo
+      - acessar atributos alcançados por um symlink apontando para outro dispositivo,
+        como o link "device", é um bug na aplicação
+
+    Tudo o mais é apenas um detalhe de implementação do driver-core do kernel
+    que não deve ser presumido como estável entre lançamentos do kernel.
+
+- Propriedades de dispositivos pais nunca pertencem a um dispositivo filho.
+    Sempre olhe para os próprios dispositivos pais para determinar as propriedades
+    de contexto do dispositivo. Se o dispositivo ``eth0`` ou ``sda`` não tiver
+    um link "driver", então esse dispositivo não possui um driver. Seu valor é vazio.
+    Nunca copie nenhuma propriedade do dispositivo pai para um dispositivo filho.
+    As propriedades do dispositivo pai podem mudar dinamicamente sem qualquer aviso
+    para o dispositivo filho.
+
+- Hierarquia em uma única árvore de dispositivos
+    Há apenas um lugar válido no sysfs onde a hierarquia pode ser examinada
+    e este é abaixo de: ``/sys/devices.``
+    Está planejado que todos os diretórios de dispositivos terminarão na árvore
+    abaixo deste diretório.
+
+- Classificação por subsistema
+    Atualmente, existem três locais para classificação de dispositivos:
+    ``/sys/block,`` ``/sys/class`` e ``/sys/bus.`` Está planejado que estes não
+    conterão diretórios de dispositivos em si, mas apenas listas planas de
+    symlinks apontando para a árvore unificada ``/sys/devices``.
+    Todos os três locais têm regras completamente diferentes sobre como acessar
+    informações de dispositivos. Está planejado fundir todos os três diretórios de
+    classificação em um único local em ``/sys/subsystem``, seguindo o leiaute dos
+    diretórios de barramentos. Todos os barramentos e classes, incluindo o
+    subsistema de blocos convertido, aparecerão lá.
+    Os dispositivos pertencentes a um subsistema criarão um symlink no diretório
+    "devices" em ``/sys/subsystem/<name>/devices``,
+
+    Se ``/sys/subsystem`` existir, ``/sys/bus``, ``/sys/class`` e ``/sys/block``
+    podem ser ignorados. Se ele não existir, você sempre terá que varrer todos os
+    três locais, já que o kernel é livre para mover um subsistema de um local para
+    o outro, desde que os dispositivos ainda sejam acessíveis pelo mesmo nome de
+    subsistema.
+
+    Presumir que ``/sys/class/<subsystem>`` e ``/sys/bus/<subsystem>``, ou
+    ``/sys/block`` e ``/sys/class/block`` não são intercambiáveis é um bug na
+    aplicação.
+
+- Bloco
+    O subsistema de blocos convertido em ``/sys/class/block`` ou
+    ``/sys/subsystem/block`` conterá os links para discos e partições no mesmo
+    nível, nunca em uma hierarquia. Presumir que o subsistema de blocos contém
+    apenas discos e não dispositivos de partição na mesma lista plana é um bug
+    na aplicação.
+
+- Link "device" e links <subsystem>:<kernel name>
+    Nunca dependa do link "device". O link "device" é uma solução alternativa
+    para o leiaute antigo, onde dispositivos de classe não são criados em
+    ``/sys/devices/`` como os dispositivos de barramento. Se a resolução de links
+    de um diretório de dispositivo não terminar em ``/sys/devices/``, você pode
+    usar o link "device" para encontrar os dispositivos pais em ``/sys/devices/``;
+    esse é o único uso válido do link "device"; ele nunca deve aparecer em nenhum
+    caminho como um elemento. Presumir a existência do link "device" para um
+    dispositivo em ``/sys/devices/`` é um bug na aplicação.
+    Acessar ``/sys/class/net/eth0/device`` é um bug na aplicação.
+
+    Nunca dependa dos links específicos de classe de volta para o diretório
+    ``/sys/class``. Esses links também são uma solução paliativa para o erro de
+    projeto no qual dispositivos de classe não são criados em ``/sys/devices.``
+    Se um diretório de dispositivo não contiver diretórios para dispositivos
+    filhos, esses links podem ser usados para encontrar os dispositivos filhos em
+    ``/sys/class.`` Esse é o único uso válido desses links; eles nunca devem
+    aparecer em nenhum caminho como um elemento. Presumir a existência desses links
+    para dispositivos que são diretórios reais de dispositivos filhos na árvore
+    ``/sys/devices`` é um bug na aplicação.
+
+    Está planejado remover todos esses links quando todos os diretórios de
+    dispositivos de classe residirem em ``/sys/devices.``
+
+- A posição dos dispositivos ao longo da cadeia de dispositivos pode mudar.
+    Nunca dependa de uma posição específica do dispositivo pai no devpath,
+    ou da cadeia de dispositivos pais. O kernel é livre para inserir dispositivos
+    na cadeia. Você deve sempre requisitar o dispositivo pai que procura pelo
+    valor do seu subsistema. Você precisa percorrer a cadeia para cima até
+    encontrar o dispositivo correspondente ao subsistema esperado. Depender de
+    uma posição específica de um dispositivo pai ou expor caminhos relativos
+    usando ``../`` para acessar a cadeia de pais é um bug na aplicação.
+
+- Ao ler e gravar arquivos de atributos de dispositivo do sysfs, evite a dependência
+    de códigos de erro específicos sempre que possível. Isso minimiza o acoplamento
+    com a implementação do tratamento de erros dentro do kernel.
+
+    Em geral, falhas ao ler ou gravar atributos de dispositivos no sysfs devem
+    propagar erros sempre que possível. Erros comuns incluem, mas não estão
+    limitados a:
+
+	``-EIO``: A operação de leitura ou gravação não é suportada, tipicamente
+	retornada pelo próprio sistema sysfs se o ponteiro de leitura ou gravação
+	for ``NULL``.
+
+	``-ENXIO``: A operação de leitura ou gravação falhou
+
+    Os códigos de erro não serão alterados sem um bom motivo, e caso uma alteração
+    nos códigos de erro resulte em quebra no espaço de usuário, ela será corrigida,
+    ou a alteração causadora será revertida.
+
+    As aplicações do espaço de usuário podem, no entanto, esperar que o formato e
+    o conteúdo dos arquivos de atributos permaneçam consistentes na ausência de uma
+    mudança no atributo de versão no contexto de um determinado atributo.
-- 
2.47.3

