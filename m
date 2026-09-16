Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329D5013C5
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580544; cv=none; b=TwoFjh9ImuAv4w2Bqwj0b6i00NFk1AIjZh1hlqUEfu5ndXBikAlPwv8EvPMl7Zrfpvy2HLggXPRHpHe/VfTA0OgZHmSgyR8uWhbmOYv7gHI/3qf4IKuLDp1gk8raJjrdZ3tN+w4IBLqVlR1eqAQEAXtlKbyFp6QSZTfOYxiskEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580544; c=relaxed/simple;
	bh=i5ulD/n5x5TjwK1qcPC334AH/DKNsbv6RUiQSbyiqgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKSP0WtqLZDuvf3UiwxKxzMK5q+eIy0sMa3nuFWSvBFGTkyDVfg4XxtAy+HBtuiVIPl4rE44w4sz6UO7kofdWuB8QjotdfLrixyVGPgDUrG794wz5NPQJF1a7syyWHjj1BA8O3krQk3JGgT6x+we+iWKT7j4LO3gZ+X15lrBet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6V1jF87; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6V1jF87"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso854328a34.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580511; x=1790185311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YWwDewGm1rmxsnOyclXvg333hU0FqGVrx1tJULl5So=;
        b=R6V1jF87N4Z+RZxwc4TD5RShtsWrfFq6CAlKpf8x0StBAU2sZzlhIgu1w85FJPPQxg
         DfpuecEqBz1pcKqExuCW/j39BIwgU2ZgrRhu2N535byC+q3LIhshc7sZJnZgXlhF5B3e
         bvU7kthcS9yF2720KUR4WD7fdRddu6xow4Zp/zi76i3Jqe0DOOwr481txRPigWZqDZzb
         vYuLLYbqNBNX4x4mGJbSVoDD10QLkw8ZYvgYv1RZ7Rw7hp8AooUvhZPmCGeMV9fwij9N
         CYa+ESNYhaefOrSjChr8g99ez6FisEbLM+JNions64DFeMWJd2Z1IPK4V/9KL1nDsQa9
         U8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580511; x=1790185311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YWwDewGm1rmxsnOyclXvg333hU0FqGVrx1tJULl5So=;
        b=uZPxejaiQPmLPeECVJ4v3soMqKjSye+sCndYa0fFPcnQJdgDkqiv4HPbmj6q9J998B
         yKPAIxHY+rjeJO0PWTChYZiHSBf9z2s75qd51LsSBOxW0jUFaRy5P4i9Tjp8VX2Kxs8J
         VPazgaSkS0UoYVRvWFH/RiGE7xk6SvbhrKkQh01l/XQ9B9IbnACoRdwzCqTh3fQPhhyp
         5794tH5Xrf6RyO1rPGsAWzw47UCLwt9zXHsvpH6XvcAq9JxQ2uz7teZIHecAlqPkRsVn
         wXbEYpxCLerrddNJUzNQTBgV/eEQlaH6/G2yJYZ3SukrlCCoMzBwq94Knx2pfIe406Qy
         sWzg==
X-Gm-Message-State: AFuF++nHPQWtAC+koqEcX2spnG/H0YQQY/+s0GBTX9FYxhA8hqSW7YkX
	fbOiAyNzuamZVyrh1zP+BJPBzVibK2v0+ZDUYRXDiLyZJTSY86VEiYvXotESV66M/eU=
X-Gm-Gg: AYBFou02tPVZx3FZr/RP00LHcJY3rRdpKkW1sZ/PYDL8dgkuDu2n8zIxAPfaGRQKHFs
	C/6GULvLPn+EvgrXpvIwbyNBgibMf7mysGg/qWX/9ySTP48zQ2Q8nscoVCL//yUyVYeH6B/A4tU
	iAmGEgo0abmQhOzV31Qt3bePsHgCDEGNtpLSnYUAdlfzpsahJ0hTC8Pb5gnRwR1Rg+v9E9aSzH5
	nEDV22igArYcNRl+pb5AcUSgibHFKCKu17PORd7UD/9qInKJz5mQ+IDQ8UvvPxePrXtsDm9dvCL
	OQQoqyZIOiwNE3iim8noQCs1ZDrVMfZF3fdeFMvEUX/Y8iEyw70IEpPKl7gjYDpLkFYCy9IWr/2
	ZMT+vyqvc43NThV6p30kVzpL+Xij18lPhsndm00Ip8/XOWHakznv9qFZPPXV3i0EqALuKHfoJpU
	E3URFboCUHg3IXB1dNfOIJnQoaFjrzfbgSwg619gnQrvR6CMLVDi6F+46P9KA3ZiJKnoU/ICLNs
	khkbDLsk008fRmJNTzzFMW86g9BuT3BU9ziNry22JSlJTNAhXjQDZ8X2c50u45Eo9+sdV1p4VzZ
	iyViCB2csfOOixCOOJEvbl2wjub4bF2l1y7L13KTQYUwhDg=
X-Received: by 2002:a05:6808:1242:b0:4c5:a75f:c5e1 with SMTP id 5614622812f47-4ca4bf7b68fmr5899289b6e.13.1789580511236;
        Wed, 16 Sep 2026 10:41:51 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d9999e8sm360668b6e.17.2026.09.16.10.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:41:50 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 4/5] docs: translations: pt_BR: translate admin-guide/devices.rst
Date: Wed, 16 Sep 2026 14:41:34 -0300
Message-ID: <20260916174136.48011-5-danielmaraboo@gmail.com>
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

Translate the Linux Device List document into Brazilian Portuguese and
move it from the Todolist into the toctree of the admin-guide index.  The
device registry itself is pulled in with a literal include of the
original devices.txt, so the numbers stay in a single place.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/admin-guide/devices.rst             | 278 ++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |   2 +-
 2 files changed, 279 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/devices.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/devices.rst b/Documentation/translations/pt_BR/admin-guide/devices.rst
new file mode 100644
index 000000000..614a32c33
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/devices.rst
@@ -0,0 +1,278 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_admin_devices:
+
+Dispositivos alocados no Linux (versão 4.x+)
+============================================
+
+Esta lista é a Linux Device List, o registro oficial dos números de
+dispositivo alocados e dos nós do diretório ``/dev`` para o sistema
+operacional Linux.
+
+A versão deste documento em lanana.org não é mais mantida. Esta versão, no
+kernel Linux mainline, é o documento mestre. Atualizações devem ser enviadas
+como patches aos mantenedores do kernel (veja o documento
+:ref:`Documentation/translations/pt_BR/process/submitting-patches.rst <pt_BR_submittingpatches>`).
+Explore especificamente as seções intituladas "CHAR and MISC DRIVERS" e
+"BLOCK LAYER" no arquivo MAINTAINERS para encontrar os mantenedores certos
+a envolver para dispositivos de caractere e de bloco.
+
+Este documento é incluído por referência no Filesystem Hierarchy Standard
+(FHS). O FHS está disponível em https://www.pathname.com/fhs/.
+
+Alocações marcadas com (68k/Amiga) aplicam-se somente ao Linux/68k na
+plataforma Amiga. Alocações marcadas com (68k/Atari) aplicam-se somente ao
+Linux/68k na plataforma Atari.
+
+Este documento está em domínio público. Os autores solicitam, no entanto,
+que versões semanticamente alteradas não sejam distribuídas sem permissão
+dos autores, presumindo-se que os autores possam ser contatados sem um
+esforço desarrazoado.
+
+
+.. attention::
+
+  AUTORES DE DRIVERS DE DISPOSITIVO, POR FAVOR LEIAM ISTO
+
+  O Linux agora possui amplo suporte à alocação dinâmica de numeração de
+  dispositivos e pode usar ``sysfs`` e ``udev`` (``systemd``) para lidar com
+  as necessidades de nomenclatura. Ainda existem algumas exceções na área de
+  dispositivos seriais e de inicialização. Antes de pedir um número de
+  dispositivo, certifique-se de que você realmente precisa de um.
+
+  Para ter um número maior (major) alocado, ou um número menor (minor) nas
+  situações em que isso se aplica (por exemplo, busmice), por favor envie um
+  patch aos autores conforme indicado acima.
+
+  Mantenha a descrição do dispositivo *no mesmo formato desta lista*. A razão
+  para isso é que essa é a única maneira que encontramos de garantir que
+  temos todas as informações necessárias para publicar o seu dispositivo e
+  evitar conflitos.
+
+  Por fim, às vezes temos que bancar a "polícia do espaço de nomes". Por
+  favor, não se ofenda. Frequentemente recebemos submissões de nomes em
+  ``/dev`` que fatalmente causariam conflitos no futuro. Estamos tentando
+  evitar chegar a uma situação em que teríamos que sofrer uma mudança
+  incompatível para a frente. Portanto, por favor, consulte-nos **antes** de
+  tornar públicos, de qualquer forma, os nomes e números do seu dispositivo
+  --- pelo menos até o ponto em que seria minimamente difícil alterá-los.
+
+  Sua cooperação é apreciada.
+
+.. include:: ../../../admin-guide/devices.txt
+   :literal:
+
+Entradas adicionais do diretório ``/dev/``
+------------------------------------------
+
+Esta seção detalha as entradas adicionais que devem ou podem existir no
+diretório /dev. É preferível que os links simbólicos usem a mesma forma
+(absoluta ou relativa) indicada aqui. Os links são classificados como
+"físicos" (hard) ou "simbólicos", dependendo do tipo de link preferido; se
+possível, o tipo de link indicado deve ser usado.
+
+Links obrigatórios
+++++++++++++++++++
+
+Estes links devem existir em todos os sistemas:
+
+=============== =============== =============== ==============================
+/dev/fd         /proc/self/fd   simbólico       Descritores de arquivo
+/dev/stdin      fd/0            simbólico       Descritor de arquivo da stdin
+/dev/stdout     fd/1            simbólico       Descritor de arquivo da stdout
+/dev/stderr     fd/2            simbólico       Descritor de arquivo da stderr
+/dev/nfsd       socksys         simbólico       Exigido pelo iBCS-2
+/dev/X0R        null            simbólico       Exigido pelo iBCS-2
+=============== =============== =============== ==============================
+
+Observação: ``/dev/X0R`` é <letra X>-<dígito 0>-<letra R>.
+
+Links recomendados
+++++++++++++++++++
+
+Recomenda-se que estes links existam em todos os sistemas:
+
+
+=============== =============== =============== ==========================
+/dev/core       /proc/kcore     simbólico       Compatibilidade retroativa
+/dev/ramdisk    ram0            simbólico       Compatibilidade retroativa
+/dev/ftape      qft0            simbólico       Compatibilidade retroativa
+/dev/bttv0      video0          simbólico       Compatibilidade retroativa
+/dev/radio      radio0          simbólico       Compatibilidade retroativa
+/dev/i2o*       /dev/i2o/*      simbólico       Compatibilidade retroativa
+=============== =============== =============== ==========================
+
+Os nomes alternativos ``/dev/scd?``, sugeridos anteriormente para os
+``/dev/sr?`` de CD-ROM e outras unidades ópticas (que usam comandos SCSI),
+foram removidos na versão 174 do ``udev``, lançada em 2011.
+
+Links definidos localmente
+++++++++++++++++++++++++++
+
+Os links a seguir podem ser estabelecidos localmente para se adequar à
+configuração do sistema. Isto é meramente uma tabulação da prática
+existente, e não constitui uma recomendação. No entanto, se existirem, eles
+devem ter os seguintes usos.
+
+=============== ================= =============== ==============================
+/dev/mouse      porta de mouse    simbólico       Dispositivo de mouse atual
+/dev/tape       unidade de fita   simbólico       Dispositivo de fita atual
+/dev/cdrom      unidade de CD-ROM simbólico       Dispositivo de CD-ROM atual
+/dev/scanner    scanner           simbólico       Scanner atual
+/dev/modem      porta de modem    simbólico       Dispositivo de discagem atual
+/dev/root       dispositivo raiz  simbólico       Sistema de arquivos raiz atual
+/dev/swap       área de swap      simbólico       Dispositivo de swap atual
+=============== ================= =============== ==============================
+
+O ``/dev/modem`` não deve ser usado para um modem que suporte tanto discagem
+de entrada quanto de saída, pois isso tende a causar problemas com arquivos
+de trava (lock). Se existir, o ``/dev/modem`` deve apontar para o
+dispositivo TTY primário apropriado (o uso dos dispositivos alternativos de
+saída é obsoleto).
+
+Para dispositivos SCSI, o ``/dev/tape`` e o ``/dev/cdrom`` devem apontar
+para os dispositivos *cozidos* (*cooked*) (``/dev/st*`` e ``/dev/sr*``,
+respectivamente), enquanto o ``/dev/scanner`` deve apontar para o
+dispositivo SCSI genérico apropriado (``/dev/sg*``).
+
+O ``/dev/mouse`` pode apontar para um dispositivo TTY serial primário, um
+dispositivo de mouse em hardware, ou um socket para um programa de driver de
+mouse (por exemplo, ``/dev/gpmdata``).
+
+Sockets e pipes
++++++++++++++++
+
+Sockets e pipes nomeados não transitórios podem existir em /dev. As entradas
+comuns são:
+
+=============== ======== =============================
+/dev/printer    socket   socket local do lpd
+/dev/log        socket   socket local do syslog
+/dev/gpmdata    socket   multiplexador de mouse do gpm
+=============== ======== =============================
+
+Pontos de montagem
+++++++++++++++++++
+
+Os nomes a seguir são reservados para a montagem de sistemas de arquivos
+especiais sob /dev. Esses sistemas de arquivos especiais fornecem interfaces
+do kernel que não podem ser fornecidas com nós de dispositivo padrão.
+
+=============== ======== ==================================================
+/dev/pts        devpts   Sistema de arquivos de escravos PTY
+/dev/shm        tmpfs    Acesso de manutenção à memória compartilhada POSIX
+=============== ======== ==================================================
+
+Dispositivos de terminal
+------------------------
+
+Dispositivos de terminal, ou TTY, são uma classe especial de dispositivos de
+caractere. Um dispositivo de terminal é qualquer dispositivo que possa atuar
+como terminal de controle de uma sessão; isso inclui consoles virtuais,
+portas seriais e pseudoterminais (PTYs).
+
+Todos os dispositivos de terminal compartilham um conjunto comum de
+capacidades conhecidas como disciplinas de linha (line disciplines); estas
+incluem a disciplina de linha de terminal comum, bem como os modos SLIP e
+PPP.
+
+Todos os dispositivos de terminal são nomeados de forma semelhante; esta
+seção explica a nomenclatura e o uso dos vários tipos de TTY. Observe que as
+convenções de nomenclatura incluem várias verrugas históricas; algumas delas
+são específicas do Linux, algumas foram herdadas de outros sistemas, e
+algumas refletem o Linux tendo superado uma convenção emprestada.
+
+Um sinal de cerquilha (``#``) em um nome de dispositivo é usado aqui para
+indicar um número decimal sem zeros à esquerda.
+
+Consoles virtuais e o dispositivo de console
+++++++++++++++++++++++++++++++++++++++++++++
+
+Consoles virtuais são telas de terminal em tela cheia no monitor de vídeo do
+sistema. Consoles virtuais são nomeados ``/dev/tty#``, com a numeração
+começando em ``/dev/tty1``; o ``/dev/tty0`` é o console virtual atual.
+O ``/dev/tty0`` é o dispositivo que deve ser usado para acessar a placa de
+vídeo do sistema naquelas arquiteturas para as quais os dispositivos de
+frame buffer (``/dev/fb*``) não são aplicáveis. Não use o ``/dev/console``
+para esse fim.
+
+O dispositivo de console, ``/dev/console``, é o dispositivo para o qual as
+mensagens do sistema devem ser enviadas, e no qual os logins devem ser
+permitidos em modo monousuário. A partir do Linux 2.1.71, o ``/dev/console``
+é gerenciado pelo kernel; para versões anteriores, ele deve ser um link
+simbólico para o ``/dev/tty0``, para um console virtual específico como o
+``/dev/tty1``, ou para um dispositivo primário de porta serial (``tty*``,
+não ``cu*``), dependendo da configuração do sistema.
+
+Portas seriais
+++++++++++++++
+
+Portas seriais são portas seriais RS-232 e qualquer dispositivo que simule
+uma, seja em hardware (como modems internos) ou em software (como o driver
+ISDN). No Linux, cada porta serial possui dois nomes de dispositivo: o
+primário, ou de chamada de entrada (callin), e o alternativo, ou de chamada
+de saída (callout). Cada tipo de dispositivo é indicado por uma letra
+diferente. Para qualquer letra X, os nomes dos dispositivos são
+``/dev/ttyX#`` e ``/dev/cux#``, respectivamente; por razões históricas, o
+``/dev/ttyS#`` e o ``/dev/ttyC#`` correspondem ao ``/dev/cua#`` e ao
+``/dev/cub#``. No futuro, deve-se esperar que múltiplas letras sejam usadas;
+todas as letras serão maiúsculas para o dispositivo "tty" (por exemplo,
+``/dev/ttyDP#``) e minúsculas para o dispositivo "cu" (por exemplo,
+``/dev/cudp#``).
+
+Os nomes ``/dev/ttyQ#`` e ``/dev/cuq#`` são reservados para uso local.
+
+Os dispositivos alternativos provêem exclusão baseada no kernel e padrões um
+tanto diferentes dos dispositivos primários. Seu principal propósito é
+permitir o uso de portas seriais com programas sem suporte inerente a portas
+seriais, ou com suporte defeituoso. Seu uso é obsoleto, e eles podem ser
+removidos em uma versão futura do Linux.
+
+A arbitragem de portas seriais é provida pelo uso de arquivos de trava com
+os nomes ``/var/lock/LCK..ttyX#``. O conteúdo do arquivo de trava deve ser o
+PID do processo que está travando, como um número ASCII.
+
+É prática comum instalar links como /dev/modem, que apontam para portas
+seriais. Para garantir o travamento adequado na presença desses links,
+recomenda-se que o software persiga os links simbólicos e trave todos os
+nomes possíveis; adicionalmente, recomenda-se que um arquivo de trava seja
+instalado com o dispositivo alternativo correspondente. Para evitar
+impasses (deadlocks), recomenda-se que as travas sejam adquiridas na
+seguinte ordem, e liberadas na ordem inversa:
+
+        1. O nome do link simbólico, se houver (``/var/lock/LCK..modem``)
+        2. O nome "tty" (``/var/lock/LCK..ttyS2``)
+        3. O nome do dispositivo alternativo (``/var/lock/LCK..cua2``)
+
+No caso de links simbólicos aninhados, os arquivos de trava devem ser
+instalados na ordem em que os links simbólicos são resolvidos.
+
+Sob nenhuma circunstância uma aplicação deve manter uma trava enquanto
+espera que outra seja liberada. Além disso, aplicações que tentam criar
+arquivos de trava para os nomes de dispositivo alternativos correspondentes
+devem levar em conta a possibilidade de serem usadas em um TTY que não seja
+de porta serial, para o qual nenhum dispositivo alternativo existiria.
+
+Pseudoterminais (PTYs)
+++++++++++++++++++++++
+
+Pseudoterminais, ou PTYs, são usados para criar sessões de login ou para
+prover outras capacidades que exijam uma disciplina de linha TTY (incluindo
+capacidade de SLIP ou PPP) a processos arbitrários geradores de dados. Cada
+PTY tem um lado mestre, nomeado ``/dev/pty[p-za-e][0-9a-f]``, e um lado
+escravo, nomeado ``/dev/tty[p-za-e][0-9a-f]``. O kernel arbitra o uso dos
+PTYs permitindo que cada lado mestre seja aberto apenas uma vez.
+
+Uma vez que o lado mestre tenha sido aberto, o dispositivo escravo
+correspondente pode ser usado da mesma maneira que qualquer dispositivo TTY.
+Os dispositivos mestre e escravo são conectados pelo kernel, gerando o
+equivalente a um pipe bidirecional com capacidades de TTY.
+
+Versões recentes dos kernels Linux e da GNU libc contêm suporte ao esquema
+de nomenclatura System V/Unix98 para PTYs, que atribui um dispositivo comum,
+``/dev/ptmx``, a todos os mestres (abri-lo lhe dará automaticamente um PTY
+não atribuído anteriormente) e um subdiretório, ``/dev/pts``, para os
+escravos; os escravos são nomeados com inteiros decimais (``/dev/pts/#`` em
+nossa notação). Isso remove o problema de esgotar o espaço de nomes e
+permite que o kernel crie automaticamente os nós de dispositivo para os
+escravos sob demanda, usando o sistema de arquivos "devpts".
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 716f6c1f7..471b76f00 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -25,10 +25,10 @@ etc.
    :maxdepth: 1
 
    README
+   devices
 
 Todolist:
 
-*   devices
 *   features
 
 Uma grande parte da interface administrativa do kernel são os sistemas de
-- 
2.47.3

