Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD62E7369
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123614; cv=none; b=XRJp2y6hE4mM/j12Lod+UbNeJOUgILE3Ii8rZouX7NfQONLsWNaYKhIxXJ1/BKBt6F9EFfgmyKXeFx2gktN5tM9Kb5Fsf7AYsx0dumeBPNMQp+3I1dBsEjejsZnAT1SKF5WKuxSmqAmp6DkPC06LScgHLhz6qGaBJC3Q2uJj6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123614; c=relaxed/simple;
	bh=dTQd0a3FfgXA6mGn/3Gacd4vgFSrf7Cx7vyrDSL0JaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q3VQwnmEBh0bZmdbbobunI/9V6gqmX39Sd20LaN1UrmHLUM0VIrkx0UwAiwCf/3ymL4gHFRqSVKKOgclCwaPFUiZ3anBYHAeUXgFP+zzh/4NqRyDhHanTdB5fdc0sn5+9nJEdkj0RBsbhR2ONaG/VBgL8kSP6nSdJCgrPTSQ0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsAkQBVB; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsAkQBVB"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97e9adae64cso138526241.3
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123611; x=1788728411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRAi9/lQJXt/ffKyESe5yze9eqhu+vTZPPaC1V8tycw=;
        b=JsAkQBVBncf+oeDPP/vq2DXcLjNDzycbcv/ifys69Y5chz2DSZI3HaJFs/0DMy420R
         Hqksjg5mL8URN9AWV/V4MVH2jFT9X2vbpt03e/xpKSFUqCWlBkYtLX/FCIpblhc7ubAr
         mmRpomHhXnEuuGW8bovDSjGe2yu/Cg0NfZxBmndDpu1tfVyQqvjHU3vD1UqS/oVUgoec
         6JCaloVeZZuM06B/eDo+POAr+sFYZAV146KWEmFV4BSwhkbkP+TrDcBBymNOxj05ltrN
         tRGdGYuEr+/3snQ5jozU0E5kHxHZJ6P7BZrVViTAdzU3yEreCFD7L6Y43VTth1fCCwW8
         30hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123611; x=1788728411;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRAi9/lQJXt/ffKyESe5yze9eqhu+vTZPPaC1V8tycw=;
        b=sWhdQTOFIopd38joDb4b7/7HWVcAt203eDATrcxNdM7T8W48dtnKJF4icqprCUCzhK
         mFbAR3xw3kj2nRYfpc/3C0OJL43ZwDSrtXGLlcjtOe2cl9h2ibl4rwUW8Q9dwx98y4HO
         hIbKhrLcMbW96Ont69e6e1otDZWF2Oo5oe4cuOemOOrSRG6U4DluRceyKLFD208Zvj3u
         cu6YYernAMYKZ4oQXLtiZb8RKkPN4fTov0wuwvZEOWcDXWmSR5AJ7oE+i02eQJ2Cvh+W
         qeApzXbuCK+2GZrOiT4M98VxrBjdu3dqycnoev6zDcXNClEIWYjsn91dtQqJCgzTvbY8
         /xIw==
X-Gm-Message-State: AFuF++mJO3hSltvWvo8ftNbBizgLLy8KBs5w8UvNlTHHDBMzjDANVNXQ
	hSpnB/oAQCl+vje+jM6GJGPweKNYp+1+Jd0btLIoFI8sO/jMvVNlua42LODsMTnFcq8=
X-Gm-Gg: AR+sD129ZX5Lnrzm906/6sQj6g9q/EQJISRCBQb3tSxXu/C70rTYbg7VCezfQU2XFWG
	+yl/YzsJqaXsxljizZH305gzfcoktFCYu9JglW5LWUHfB2JHudMN8YPOXPCfNwvbFdJ3NziJ6AQ
	yunJKwv3Xkkvlp6u0wMMOkqunnbZb/8LuUv3xfU8nlx4eutvYZMOgWYaH9bf7G8V7ty2zUEPrvq
	l4ALSgqcyDzhk61/A9il+x6KkNFHtrHjl83d7p21gPnM5K2V98HnXaOdFcC+rmuiiSpuxgEMmDF
	Cc5kmUExA/RDVD7yzIt8aTYGNRC6bI/vDlP+UpBZb16Omsulp0W5ly9mSWjkYXNXrZvQYGEqHKN
	WUi00nlKiGAC0lA7yyxCSYUsVmGrRO2U8xO60nUDmlHOVz4E9UGUjNpSybv37nmuBPGmfHSiqk+
	b9t7jpEpvEDwT1GmVKnAdyY5+X0pYBCvx4hTNED5wk4FsP2hSkuYy3O5Y6IosFcA==
X-Received: by 2002:a05:6102:8084:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-7859802053amr6135376137.7.1788123611142;
        Sun, 30 Aug 2026 14:00:11 -0700 (PDT)
Received: from fedora ([2804:14c:daa2:8daa:6ae6:9714:ed29:7594])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f5a2ce07sm5448468137.6.2026.08.30.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:00:10 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate volatile-considered-harmful.rst
Date: Sun, 30 Aug 2026 17:59:12 -0300
Message-ID: <20260830205912.478358-1-lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate volatile-considered-harmful.rst into Brazilian Portuguese and
add it to the pt_BR process documentation index.

Assisted-by: ChatGPT:GPT-5.5
Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../translations/pt_BR/process/index.rst      |   1 +
 .../process/volatile-considered-harmful.rst   | 130 ++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/volatile-considered-harmful.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..d72483720 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -42,6 +42,7 @@ devem estar familiarizados.
    Como aplicar patches <applying-patches>
    Backporting e resolução de conflitos <backporting>
    Adicionando uma nova chamada de Sistema <adding-syscalls>
+   Por que a classe de tipo "volatile" não deve ser usada <volatile-considered-harmful>
    Como não Deixar as ioctls malfeitas <botching-up-ioctls>
 
 Guias de políticas e declarações de desenvolvedores
diff --git a/Documentation/translations/pt_BR/process/volatile-considered-harmful.rst b/Documentation/translations/pt_BR/process/volatile-considered-harmful.rst
new file mode 100644
index 000000000..b8774c0ba
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/volatile-considered-harmful.rst
@@ -0,0 +1,130 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Por que a classe de tipo "volatile" não deve ser usada
+--------------------------------------------------------
+
+Programadores C frequentemente interpretam volatile como uma indicação de
+que uma variável pode ser alterada fora da thread de execução atual; como
+resultado, às vezes são tentados a usá-la no código do kernel quando
+estruturas de dados compartilhadas estão sendo utilizadas. Em outras
+palavras, há quem trate tipos volatile como uma espécie de variável
+atômica simplificada, mas não são. O uso de volatile no código do
+kernel quase nunca é correto; este documento explica o porquê.
+
+O ponto-chave a entender sobre volatile é que seu propósito é suprimir
+otimizações, o que quase nunca é o que realmente se deseja fazer. No kernel,
+é necessário proteger estruturas de dados compartilhadas contra acessos
+concorrentes indesejados, o que é uma tarefa bastante diferente. O processo
+de proteção contra concorrência indesejada também evita, de forma mais
+eficiente, quase todos os problemas relacionados a otimizações.
+
+Assim como volatile, as primitivas do kernel que tornam seguro o acesso
+concorrente a dados (spinlocks, mutexes, barreiras de memória etc.) são
+projetadas para evitar otimizações indesejadas. Se forem usadas
+corretamente, também não haverá necessidade de usar volatile. Se
+volatile ainda for necessário, quase certamente há algum bug no código.
+Em código de kernel corretamente escrito, volatile só serve para deixar
+as coisas mais lentas.
+
+Considere um bloco típico de código do kernel::
+
+    spin_lock(&the_lock);
+    do_something_on(&shared_data);
+    do_something_else_with(&shared_data);
+    spin_unlock(&the_lock);
+
+Se todo o código seguir as regras de bloqueio, o valor de shared_data não
+poderá mudar inesperadamente enquanto the_lock estiver mantido. Qualquer
+outro código que queira manipular esses dados estará aguardando o bloqueio.
+As primitivas de spinlock atuam como barreiras de memória (são escritas
+explicitamente para isso), o que significa que os acessos aos dados não
+serão otimizados de forma a atravessar essas barreiras. Assim, o compilador
+até pode achar que sabe qual será o valor de shared_data, mas a chamada a
+spin_lock(), por atuar como barreira de memória, o forçará a esquecer tudo
+o que sabia. Não haverá problemas de otimização nos acessos a esses dados.
+
+Se shared_data fosse declarada volatile, o bloqueio ainda seria
+necessário. No entanto, o compilador também seria impedido de otimizar o
+acesso a shared_data _dentro_ da seção crítica, justamente quando sabemos
+que ninguém mais pode estar manipulando esses dados. Enquanto o bloqueio
+estiver mantido, shared_data não é volatile. Ao lidar com dados
+compartilhados, um bloqueio adequado torna volatile desnecessário e
+potencialmente prejudicial.
+
+A classe de armazenamento volatile foi originalmente concebida para
+registradores de E/S mapeados em memória. No kernel, os acessos a esses
+registradores também devem ser protegidos por bloqueios, mas também não se
+deseja que o compilador "otimize" esses acessos dentro de uma seção crítica.
+Contudo, no kernel, os acessos à memória de E/S são sempre feitos por meio de
+funções de acesso; acessar diretamente a memória de E/S via ponteiros é
+desencorajado e não funciona em todas as arquiteturas. Essas funções de
+acesso são implementadas de modo a impedir otimizações indesejadas e,
+portanto, mais uma vez, volatile é desnecessário.
+
+Outra situação em que se pode ser tentado a usar volatile é quando o
+processador fica em espera ocupada pelo valor de uma variável. A forma
+correta de realizar essa espera ocupada é::
+
+    while (my_variable != what_i_want)
+        cpu_relax();
+
+A chamada a cpu_relax() pode reduzir o consumo de energia da CPU ou ceder
+recursos a um processador lógico gêmeo hyperthreaded; ela também atua
+como barreira para o compilador e, portanto, mais uma vez, volatile é
+desnecessário. Naturalmente, a espera ocupada já é, por si só, uma prática
+geralmente antissocial.
+
+Ainda existem algumas situações raras em que volatile faz sentido no
+kernel:
+
+  - As funções de acesso mencionadas acima podem usar volatile em
+    arquiteturas nas quais o acesso direto à memória de E/S funciona.
+    Essencialmente, cada chamada a uma função de acesso torna-se uma
+    pequena seção crítica por si só e garante que o acesso ocorra conforme
+    esperado pelo programador.
+  - Código assembly inline que modifica memória, mas não tem outros
+    efeitos colaterais visíveis, corre o risco de ser removido pelo GCC.
+    Adicionar a palavra-chave volatile às instruções asm impede essa
+    remoção.
+  - A variável jiffies é especial, pois pode ter um valor diferente a cada
+    vez que é referenciada, mas pode ser lida sem qualquer bloqueio
+    especial. Portanto, jiffies pode ser volatile, mas a adição de
+    outras variáveis desse tipo é fortemente desencorajada. Nesse
+    sentido, jiffies é considerada um problema de "legado idiota" (nas
+    palavras de Linus); corrigi-la daria mais trabalho do que valeria a
+    pena.
+  - Ponteiros para estruturas de dados em memória coerente que possam ser
+    modificadas por dispositivos de E/S podem, às vezes, ser
+    legitimamente volatile. Um buffer circular usado por um adaptador
+    de rede, no qual esse adaptador altera ponteiros para indicar quais
+    descritores já foram processados, é um exemplo desse tipo de
+    situação.
+
+Na maior parte do código, nenhuma das justificativas acima para o uso de
+volatile se aplica. Como resultado, o uso de volatile provavelmente
+será considerado um bug e fará com que o código seja submetido a uma análise
+mais rigorosa. Desenvolvedores que se sintam tentados a usar volatile devem
+dar um passo atrás e pensar no que realmente estão tentando alcançar.
+
+Patches para remover variáveis volatile são, em geral, bem-vindos, desde
+que venham acompanhados de uma justificativa que demonstre que as questões
+de concorrência foram devidamente analisadas.
+
+
+Referências
+===========
+
+[1] https://lwn.net/Articles/233481/
+
+[2] https://lwn.net/Articles/233482/
+
+Créditos
+========
+
+Motivação original e pesquisa por Randy Dunlap
+
+Escrito por Jonathan Corbet
+
+Melhorias a partir de comentários de Satyam Sharma, Johannes Stezenbach,
+Jesper Juhl, Heikki Orsila, H. Peter Anvin, Philipp Hahn e Stefan
+Richter.
-- 
2.55.0

