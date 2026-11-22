Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795356401;
	b=ln3UjCrghsVKlVHyy5rmoMHma+UGtjWZNYoBbzLzRJidFLOIv8+W9swtWtJhoPN0crGg
	 7e/TqrzXHHls2UuH0MX+9RPgg8dC2uKirqRM5JqI2dK4jer/ieDYsTl3aXm5JL7RMDWGb
	 PaAegFyJ2Btaet7nC7GHqpyois5Jr7gCKnIoK5tVn5t3PMomZZHhyhVgdjnpGN0Cv2wPi
	 s2+sEDzJZXLN3Bw/thle2bqdxbjsaitVGf+rrjMCB2S9YxKK/tvj08FdfABFee+PO0nPz
	 lTSvzUqcWXp0dm0qTGwimvUls8uqAYO4rYS8OamwGrQCRYX8C9yH5N+gvMLyNDD2tBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356401;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xr9IAsJqsnfrABVAwVW9H+Jb56knlyhaKuW8lj86Kzo=;
	b=Pk2EO9irjItkjqmsv+RVoCoOOPTHh55HmhrqpWonB8AqXU66wyLwZYnho9TUX1uDlgCp
	 vHqaJc73nrLoV3OualdG0mKN2Hcbi+oQY8MO8Gth+a1DdOzC5XWMNA5j5cMP+igcUXUdY
	 CHYzw/jT4Fv0EryfsMTBpx0wYX2dNXsW3krQKuQkbD20qyacd0LN+Yo/s2l2Q/+YFBoe1
	 LoyODHmnmTHwz6SOgua5rqoT38uCRWPDlZoPgOjfGWuhOVO4ew6jQ7KZToIyfIE2q9g6/
	 fFuQCDiF9cS/8A0otvnbHGHx3ld5HY4klvL3Gpk3r+QZLRl/GdKZ6NyaQFznFkyit6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTkUy5kc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A9606A331
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTkUy5kc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795356400;
	b=OEO9b5rTy0qEhM+na4Vairxf073I+0q+wYaWqLY/lW9R9ioQn0OvGDB2iHfwpdapWh2O
	 OQ2asp4XAf80Gm2iUpgAfpJeD+dKaN/XFxEDEdw6K0LzGGi1wsvydtNr4c7Z3Ux3mVbKL
	 seDgWNSDCgRYiu2Wb1wAbcVp/3jxbY3et4TXGz5gDRTviHL3m7BUD63ipWOkvK+klcSem
	 nCEhjbBIxCKkLezIXQNQrnKOxxE9SusIedTQCA++gNUSNW/AV5h2bBWElFJEsOpFJF++f
	 8lRXMnGujKBcySupDRCRHJoMHbfGJX+3JHIIXEluI4Rnit9f9n20E+3pDAoqaSIVbnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795356400;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xr9IAsJqsnfrABVAwVW9H+Jb56knlyhaKuW8lj86Kzo=;
	b=Az8YUVMymOA5JdquqnZJb2UYVDXVkn+WC3Mpr4iXJiFAke0eP0e9ig1xB0GLVqUthj0f
	 shtqTpGxbx+qlymRO7HCLzTYHtjxlOqKFo7XZPiunQgKuJIxJKZjxcHyma0JX5tRBLd8A
	 +C/z1YlSmTUNAjzZ6C6QuGtrLKKvsuS1ykMCbfVb+V63BuEQYWhNa4TvnL9pwXkIgqVMc
	 /7lYj0wSkZmqotkpbHNYkMqqh9U5ivrplshnRg17kAboWxMpUhwgwH+v+ju5tAX2dfTNf
	 QMyxTaNN/z5Tmx5TMWtjx7SrsXnz7MoOPsTxOCaDqJqbG272JIxyEpVjE8H5nLdIW/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E11E1F000C6;
	Sun, 22 Nov 2026 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795356400;
	bh=Xr9IAsJqsnfrABVAwVW9H+Jb56knlyhaKuW8lj86Kzo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XTkUy5kcrnbTvzcBX8BWZzDbPgNvfKTnrozIOZHiAMZeFvMZ3kjRFKw9zZ2cSBeTf
	 tMD2ZaZoO72ut5LM1DX9z5yGKuXIyFg4ZByzasBf0Dw8kCzz/hqP3j8Z7w72ZkSXeJ
	 GTbr4/SZEew9M6Dwxttcd9og4qvw+HDNSeQmxViNwlWuGsnLeHu7dzRg8NSBem4fB/
	 sc/ohzXA823MMAEA0K4K6hmCUoVr1utC32UIi+E49ZmvF4uA4l/XYyjOHT6YH+ZPys
	 MNQGBG/tQzQOjZfF3dwq3V47vabSQadmexb6d4j9HfTxAEZ7ETuZjkHfj2WJJLqlrW
	 UvLZ5Di9PQKQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F2B7F4C0DF;
	Sun, 22 Nov 2026 14:06:31 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:06:32 -0300
Subject: [PATCH] docs/translations/pt_BR: process: add threat-model.rst
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-threat-model-pt-br-v1-1-cebfe5cf4b79@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQTEHBq4iLJP1rR7Qtk1SE0
 rs31eW3eG+lDFNkujYrGT6adRor/KmhNITxAdaumsTJ2XsRLoMhFH5PHV48F47GuETnUmhD3wr
 VcDb0+v1Nb/e/8xKfSOU40bbtLJjbcXYAAAA=
X-Change-ID: 20261122-threat-model-pt-br-e7b00ca3af32
To: linux-doc@vger.kernel.org
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org, 
 danielmaraboo@gmail.com, corbet@lwn.net, 
 Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795356391; l=16039;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=uktY7zQskvnvt0q83VpPq5GK1i8x2e/Yo5X8tUripiw=;
 b=92Hp2Duj9o0ygfk52ktYUlqPCAT1p0GTzJK3Ze2iaV06CNHBKDcZLwsnPf33BbZYdCKx3ryVy
 JQJARuVTWFPAN5fBjVGYhZnT17PluOvGlEJigjHfp0uwCSJhqgZOCQ3
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Add the Brazilian Portuguese translation of
Documentation/process/threat-model.rst, which describes what the kernel
does and does not protect against, and which classes of problems are
not considered vulnerabilities.

The translation follows the English original as last changed by commit
fdd100ee60a0 ("docs: process: use gender-neutral pronouns") and
preserves its structure: section levels, the two :doc: references, the
code spans, the emphasis markers and all 40 list items.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../translations/pt_BR/process/threat-model.rst    | 259 +++++++++++++++++++++
 2 files changed, 260 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index d072f7e46767..b7b505cd5143 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -46,6 +46,7 @@ devem estar familiarizados.
    Adicionando uma nova chamada de Sistema <adding-syscalls>
    Por que a classe de tipo "volatile" não deve ser usada <volatile-considered-harmful>
    Como não Deixar as ioctls malfeitas <botching-up-ioctls>
+   Modelo de ameaças do kernel Linux <threat-model>
 
 Guias de políticas e declarações de desenvolvedores
 ---------------------------------------------------
diff --git a/Documentation/translations/pt_BR/process/threat-model.rst b/Documentation/translations/pt_BR/process/threat-model.rst
new file mode 100644
index 000000000000..438a5c852b5a
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/threat-model.rst
@@ -0,0 +1,259 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Modelo de ameaças do kernel Linux
+=================================
+
+Há muitas premissas contra o que o kernel protege e não protege. Essas
+premissas costumam causar confusão em relatos de bug (:doc:`os relacionados à
+segurança <security-bugs>` versus :doc:`os que não são
+<../admin-guide/reporting-issues>`) e podem complicar a aplicação de
+segurança quando as responsabilidades por algumas fronteiras não estão claras
+entre o kernel, as distros, os administradores e os usuários.
+
+Este documento procura esclarecer as responsabilidades do kernel nesse
+domínio.
+
+As responsabilidades do kernel
+-------------------------------
+
+O kernel abstrai o acesso a recursos de hardware locais e a sistemas remotos
+de forma que permite a vários usuários locais obter uma fatia justa dos
+recursos disponíveis concedidos a eles e, quando o hardware subjacente
+permitir, atribuir um nível de confidencialidade às suas comunicações e aos
+dados que processam ou armazenam.
+
+O kernel pressupõe que o hardware subjacente se comporta conforme as suas
+especificações. Isso inclui a integridade do conjunto de instruções da CPU, a
+transparência da unidade de predição de desvios e das unidades de cache, a
+consistência da Unidade de Gerenciamento de Memória (MMU), o isolamento de
+periféricos capazes de DMA (por exemplo, via IOMMU), as transições de estado
+em controladores, as faixas de valores lidos de registradores, o respeito às
+limitações de hardware documentadas etc.
+
+Quando o hardware falha em manter o isolamento especificado (por exemplo,
+bugs de CPU, canais laterais, resposta do hardware a entradas inesperadas), o
+kernel normalmente tentará implementar mitigações razoáveis. São medidas de
+melhor esforço, destinadas a reduzir a superfície de ataque ou a elevar o
+custo de um ataque dentro dos limites das capacidades do hardware; elas não
+constituem uma garantia de segurança fornecida pelo kernel.
+
+Os usuários sempre realizam as suas atividades sob a autoridade de um
+administrador, que pode conceder ou negar vários tipos de permissão que
+podem afetar como os usuários se beneficiam dos recursos disponíveis, ou o
+nível de confidencialidade das suas atividades. Os administradores também
+podem delegar todas ou parte das suas próprias permissões a alguns usuários,
+particularmente via capabilities, mas não só. Tudo isso é feito por meio de
+configuração (sysctl, permissões de sistema de arquivos etc.).
+
+O kernel Linux aplica um certo conjunto de configurações padrão que
+correspondem ao seu modelo de ameaças. As distros têm o seu próprio modelo de
+ameaças e vêm com os seus próprios presets de configuração, que o
+administrador pode precisar ajustar para melhor atender às suas expectativas
+(relaxar ou restringir).
+
+Por padrão, o kernel Linux garante as seguintes proteções quando executado em
+processadores comuns que oferecem níveis de privilégio e unidades de
+gerenciamento de memória:
+
+* **Isolamento baseado em usuário**: um usuário sem privilégios pode
+  restringir o acesso aos seus próprios dados por outros usuários sem
+  privilégios que operam no mesmo sistema. Isso inclui:
+
+  * dados armazenados, via permissões de sistema de arquivos
+  * dados em memória (páginas não são acessíveis por padrão a outros
+    usuários)
+  * atividade de processos (ptrace não é permitido a outros usuários)
+  * comunicação entre processos (outros usuários não podem observar dados
+    trocados via sockets de domínio UNIX ou outros mecanismos de IPC)
+  * comunicações de rede dentro do mesmo sistema ou com outros sistemas
+
+* **Proteção baseada em capabilities**:
+
+  * usuários sem capabilities elevadas (incluindo, mas não se limitando a
+    CAP_SYS_ADMIN) não podem alterar a configuração, a memória nem o estado
+    do kernel, mudar a visão de outros usuários sobre o layout do sistema de
+    arquivos, conceder a qualquer usuário capabilities que não possuem, nem
+    afetar a disponibilidade do sistema (desligar, reiniciar, entrar em
+    panic, travar, ou deixar o sistema sem resposta por esgotamento
+    ilimitado de recursos).
+  * usuários sem a capability ``CAP_NET_ADMIN`` não podem alterar a
+    configuração de rede, interceptar nem falsificar comunicações de rede de
+    outros usuários ou sistemas.
+  * usuários sem ``CAP_SYS_PTRACE`` não podem observar a atividade dos
+    processos de outros usuários.
+
+Quando ``CONFIG_USER_NS`` está definido, o kernel também permite que
+usuários sem privilégios criem o seu próprio user namespace, no qual têm
+todas as capabilities, mas com uma série de restrições (não podem executar
+ações que tenham impacto no user namespace inicial, como alterar o horário,
+carregar módulos ou montar dispositivos de bloco). Consulte
+``user_namespaces(7)`` para mais detalhes; as possibilidades dos user
+namespaces não são cobertas neste documento.
+
+O kernel também oferece muitos recursos de diagnóstico e depuração, que podem
+constituir vetores de ataque quando caem em mãos erradas. Embora alguns sejam
+projetados para serem acessíveis a usuários locais comuns com baixo risco
+(por exemplo, logs do kernel via ``/dev/kmsg``), alguns exporiam informação
+suficiente para representar risco na maioria dos lugares, e a decisão de
+expô-los cabe ao administrador (eventos perf, traces), e
+outros não são projetados para serem acessados por usuários sem privilégios
+(por exemplo, debugfs). O acesso a esses recursos por um usuário que recebeu
+permissão explícita de um administrador não constitui violação de segurança.
+
+Bugs que permitem violar os princípios acima constituem violações de
+segurança. Porém, bugs que permitem uma violação somente depois que outra já
+foi alcançada são apenas fraquezas. O kernel aplica uma série de medidas de
+autoproteção cujo propósito é evitar cruzar uma fronteira de segurança quando
+certas classes de bugs são encontradas, mas uma falha dessas proteções extras
+não constitui uma vulnerabilidade por si só.
+
+Que classes de problemas não são consideradas vulnerabilidades
+---------------------------------------------------------------
+
+No modelo de ameaças do kernel Linux, as classes de problemas a seguir **NÃO**
+são consideradas vulnerabilidades do kernel Linux. No entanto, quando se
+acredita que o kernel poderia fazer melhor, elas devem ser relatadas, para
+que possam ser revisadas e corrigidas onde for razoavelmente possível, mas
+serão tratadas como qualquer bug comum:
+
+* **Configuração**:
+
+  * kernels desatualizados e, em especial, ramos em fim de vida estão fora do
+    escopo do modelo de ameaças do kernel: os administradores são
+    responsáveis por manter o seu sistema atualizado. Para que um bug se
+    qualifique como vulnerabilidade, é preciso demonstrar que ele afeta
+    versões ativamente mantidas.
+
+  * no nível de compilação: mudanças na configuração do kernel
+    explicitamente documentadas como redutoras do nível de segurança (por
+    exemplo, ``CONFIG_NOMMU``), ou destinadas apenas a desenvolvedores.
+
+  * no nível do sistema operacional: mudanças em parâmetros de linha de
+    comando, sysctls, permissões de sistema de arquivos, capabilities de
+    usuário, exposição de interfaces privilegiadas, que explicitamente
+    aumentam a exposição, seja oferecendo acesso não padrão a usuários sem
+    privilégios, seja reduzindo a capacidade do kernel de aplicar algumas
+    proteções ou mitigações. Exemplo: acesso de escrita a procfs ou debugfs.
+
+  * problemas disparados apenas ao usar recursos destinados a desenvolvimento
+    ou depuração (por exemplo, LOCKDEP, KASAN, FAULT_INJECTION): esses
+    recursos são conhecidos por introduzir sobrecarga e potencial
+    instabilidade, e não são destinados a uso em produção.
+
+  * problemas que afetam drivers expostos sob CONFIG_STAGING, bem como
+    recursos marcados como EXPERIMENTAL na configuração.
+
+  * carregamento de módulos explicitamente inseguros, quebrados ou de
+    staging, e, de modo geral, o uso de qualquer subsistema marcado como
+    experimental ou não destinado a uso em produção.
+
+  * execução de módulos fora da árvore de código-fonte ou de forks não
+    oficiais do kernel;
+    esses devem ser relatados ao fornecedor correspondente.
+
+* **Excesso de privilégios iniciais**:
+
+  * ações executadas por um usuário que já possui os privilégios necessários
+    para executar aquela ação ou modificar aquele estado (por exemplo,
+    ``CAP_SYS_ADMIN``, ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``,
+    ``CAP_SYS_MODULE``, sem que nenhuma outra fronteira seja cruzada).
+
+  * ações executadas em user namespace que não contornam as restrições
+    impostas ao usuário inicial (por exemplo, uso de ptrace, entrega de
+    sinais, uso de recursos, acesso a FS/dispositivo/sysctl/memória, bind de
+    rede, configuração de sistema/rede etc.).
+
+  * qualquer coisa executada pelo usuário root no namespace inicial (por
+    exemplo, oops do kernel ao escrever em um dispositivo privilegiado).
+
+* **Fora do ambiente de produção**:
+
+  Isso cobre ataques teóricos/probabilísticos que dependem de condições de
+  laboratório com ruído zero no sistema, ou aqueles que exigem um número
+  irrealista de tentativas (por exemplo, bilhões de tentativas) e que seriam
+  detectados por monitoramento padrão do sistema muito antes do sucesso, tais
+  como:
+
+  * previsão de números aleatórios que só funciona em um ambiente totalmente
+    silencioso (como IP ID, portas TCP ou números de sequência que só podem
+    ser adivinhados em laboratório).
+
+  * observação de atividade e vazamentos de informação baseados em abordagens
+    probabilísticas sujeitas a ruído de medição e não reproduzíveis de forma
+    realista em um sistema de produção.
+
+  * problemas que só podem ser disparados por ataques pesados (por exemplo,
+    força bruta) cujo impacto no sistema torna improvável ou impossível
+    permanecerem sem ser detectados antes do sucesso (por exemplo, consumir
+    toda a memória antes de ter sucesso).
+
+  * problemas vistos apenas em simuladores de desenvolvimento, emuladores ou
+    combinações que não existem em sistemas reais no momento do relato
+    (problemas envolvendo dezenas de milhões de threads, dezenas de milhares
+    de CPUs, frequências de CPU, tamanhos de RAM ou capacidades de disco
+    irreais, velocidades de rede irreais).
+
+  * bem como problemas que podem ser disparados a um custo ordens de grandeza
+    maior que os benefícios esperados (por exemplo, um emulador de teclado
+    totalmente funcional apenas para recuperar 7 bytes não inicializados em
+    uma estrutura, ou um método de força bruta com milhões de tentativas de
+    conexão para adivinhar um número de porta).
+
+* **Falhas de hardening**:
+
+  * capacidade de contornar algumas das medidas de hardening do kernel sem
+    caminho de exploração demonstrável (por exemplo, contorno de ASLR,
+    medição temporal de eventos ou sondagem sem consequência demonstrável). São
+    apenas fraquezas, não vulnerabilidades.
+
+  * falta de verificação de argumentos e falha em relatar certos erros sem
+    consequência imediata.
+
+* **Vazamentos aleatórios de informação**:
+
+  Isto diz respeito a vazamentos de pequenas partes de dados que por acaso
+  estão ali e que não podem ser escolhidas pelo atacante, ou que enfrentam
+  restrições de acesso:
+
+  * padding de estruturas reportado por syscalls ou outras interfaces.
+
+  * identificadores, dados parciais, strings não terminadas reportados em
+    mensagens de erro.
+
+  * vazamentos de endereços/ponteiros de memória do kernel não constituem
+    vetor imediatamente explorável e não são vulnerabilidades, embora devam
+    ser relatados e corrigidos.
+
+* **Dispositivos e mídias não conformes**:
+
+  Drivers são implementados segundo uma especificação. Quando um dispositivo
+  ou uma mídia de armazenamento viola a especificação segundo a qual o seu
+  driver foi escrito, o comportamento incorreto resultante é um bug comum a
+  ser corrigido, não uma vulnerabilidade, a menos que o driver esteja
+  especificamente documentado como protegido por hardening contra entradas
+  hostis. Assim, os casos a seguir não são considerados vulnerabilidades:
+
+  * bugs disparados ao montar uma imagem de sistema de arquivos corrompida ou
+    construída maliciosamente: montar um dispositivo de bloco é uma operação
+    privilegiada (veja acima), e o administrador é responsável pela mídia que
+    monta. Isso inclui problemas resolvidos, mitigados ou detectados ao rodar
+    uma verificação de consistência do sistema de arquivos (fsck) na imagem
+    antes de montá-la.
+
+  * bugs cuja reprodução exige modificação ou emulação de hardware, incluindo
+    dispositivos USB falsos que se passam por outro, ou dispositivos que
+    reportam valores fora das faixas documentadas.
+
+* **Acesso físico**:
+
+  Problemas que exigem acesso físico à máquina, modificação de hardware ou o
+  uso de hardware especializado (por exemplo, analisadores lógicos,
+  ferramentas de ataque por DMA sobre PCI-E/Thunderbolt) estão fora do
+  escopo, a menos que o sistema esteja explicitamente configurado com
+  tecnologias destinadas a proteger o sistema contra tais ataques (por
+  exemplo, IOMMU).
+
+* **Regressões funcionais e de desempenho**:
+
+  Qualquer problema que possa ser mitigado definindo permissões e limites
+  adequados não se qualifica como vulnerabilidade.

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-threat-model-pt-br-e7b00ca3af32

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


