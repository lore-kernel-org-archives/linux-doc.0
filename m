Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4673806AF
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481074; cv=none; b=LKLKaDAi7JCXdH6A0z6Hifo6kB8Leed6EpInyRD2krLdCo9c4mBIGbTJMUVjokWKWph/UOkg/1gLVycxQlTu0NqA+/4m9v+3tptyrubbjIlT6GT5GnhOL23NBw7To4wsGtUpsgbEyk5mw2qJs5EP1ltiDDaR2Z2HSyOw7Oq3U7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481074; c=relaxed/simple;
	bh=cxjsSAMsiLePo+WGGzI4VrHJrx5rMzzh/Mz+f59TvLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzxZokxabC+QHBXHv0bM3covu7X8ynFcT9tmEaTVmR42+o6VaJWhPugjLCWoDmuJYfjNRoL0n6Y4E1lGIIyqfNNC3EUx6UacsuNhdys9D9L7rKMLFW6KTIiP3khQ9h0mqOW7vobQ8n7uPgsfnMysYwqR1lvBhXxuKfUn0NmTD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isUG/4Rm; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isUG/4Rm"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59ebcbfb2b0so952973e0c.2
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781481071; x=1782085871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndtUvin992hCKM8WZVe178maHaaYARyrrmx9R/Tk6z4=;
        b=isUG/4RmqxJ8RTBKbhhmkMPcBetNqIeULL5+5ySnUS6r4cX56quGzVRqZaWmGTf31i
         Qj3+3ZJduLe/KM+bJxgry2m8uhk6VD3mbrGCY3YG9GTrrO3QV7kokiqoGwSME7JTSImA
         2R+2G6uJszJPwz+aXXG0xKyfmz454O1VNljrWGX6zH6xtuvj8w+92ZJ6jfEMv2FgfgS1
         1OQ7vp+tiC5bFPJOmmdydwe6kw2cSDwK9JZdN9ihbiriC46lyKWYR49TcdxBKFr4x7Pu
         +RotrJrsWvNlWikvVAif9Ansg645HUQbF1uSxjf76a8ObH5bZ5/QGX74Ry5MJdNGzwYE
         2ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781481071; x=1782085871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ndtUvin992hCKM8WZVe178maHaaYARyrrmx9R/Tk6z4=;
        b=KwyVUb7z1cJAmzh+BoICWPvw2lMSo//9wJPEi8+LV9cGpCgynj5elZBA65dlQbM3tL
         duyvBooNGOmFdtFzKQCWJHwQoLauVgAFnw8C0nSMS6xK6lGgdSjDadyQJxOyJpKwDaj5
         ztB7S4f38SMBH+pR+HrX4GLLb/HOc8wNU8iY7nznq/1+3q+CMatcxpJ6gz/x2ZTHHhx/
         wqQswzpGiKsDhC2CRLqvnRF44JfM2JG05aJk+x4aND+QOm3z8ouZT2F8HrMnbhC/89r+
         8pBvxynWjJillDcn8O7qHStBrosBVY5LWWJG0P02o0py8oa5+hB0VEy/QFkWgmbi5Z6z
         rCxQ==
X-Gm-Message-State: AOJu0YwFe2AUXoJlaY+HnSD+MW0xXp4TFhPe4AmMh1zXyRfCC5DBak49
	0wMWvn1cHsEKA72ZO/tSYBCAyOF2u1//3xLysharg8OXki6ZAav4ce6t
X-Gm-Gg: Acq92OGu9+j/kUkzAEGqZ0ptHcFo0DhwbxEiHBB3ihqql6/GEd8UQzzUir9MYYcsPiN
	JcD/Buq4tCkJ9Hl43eARIPmGO7HuhbxdA7fALJs1QRqeDo1y1QycH7+gd4sw+vhaDpk50TBlX+7
	CPqZ+DXp6nZKqJy9ZyXCUgAWUyjKhQTEfXdf2eLKmK5A5l231HYxsMJK5vKJK8W//yH5/QWxX6Z
	lb2kdOtZzRL1DE3z01pjQUkAcuL4OjId0WHTDRdi0zDZZ2SfwVSWtPW8ovr52bVyhr9JW1FUoi5
	nkHOT3uV9a/AhF9V18nAkxQOaa5u/7iF+GLOBu1/9TJOfsZl3/efTCJJ+rkys3Qr4Zx3ybFQuZF
	ME+/5Y3iz545NsrRI0/uBEYvwTBfXSxB4bPlPDfsLo/4bnxIm5Ow7yakv1nVqwtLliP7tP90U/x
	Mjp7scZqlmljv2v0xYFu0+0K7yOjkRnSlcl89ftWp5AHjTzUu/sNBygrpRxFqCbvU5u3sSGBA=
X-Received: by 2002:a05:6102:32c4:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-71f60e0fc5bmr4874937137.23.1781481070963;
        Sun, 14 Jun 2026 16:51:10 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7208788587esm1630195137.10.2026.06.14.16.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 16:51:10 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 2/2] docs: pt_BR: Translate patch posting documentation
Date: Sun, 14 Jun 2026 20:50:41 -0300
Message-ID: <20260614235044.42810-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260614235044.42810-1-danielmaraboo@gmail.com>
References: <20260614235044.42810-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the chapter regarding the process of formatting and sending
patches ("5.Posting.rst") into Brazilian Portuguese.

Also, update the main index in "development-process.rst" to include
the newly translated document into the documentation tree.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/5.Posting.rst  | 376 ++++++++++++++++++
 .../pt_BR/process/development-process.rst     |   2 +-
 2 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/5.Posting.rst

diff --git a/Documentation/translations/pt_BR/process/5.Posting.rst b/Documentation/translations/pt_BR/process/5.Posting.rst
new file mode 100644
index 000000000..820a56b66
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/5.Posting.rst
@@ -0,0 +1,376 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Enviando patches
+================
+
+Cedo ou tarde, chega o momento em que seu trabalho está pronto para ser
+apresentado à comunidade para revisão e, eventualmente, inclusão no kernel
+mainline. Sem surpresa, a comunidade de desenvolvimento do kernel evoluiu um
+conjunto de convenções e procedimentos que são usados no envio de patches;
+segui-los tornará a vida muito mais fácil para todos os envolvidos. Este
+documento tentará cobrir essas expectativas em detalhes razoáveis; mais
+informações também podem ser encontradas nos arquivos
+:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+e :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`.
+
+
+Quando enviar
+-------------
+
+Existe uma tentação constante de evitar o envio de patches antes que eles
+estejam completamente "prontos". Para patches simples, isso não é um problema.
+No entanto, se o trabalho que está sendo feito for complexo, há muito a se
+ganhar obtendo feedback da comunidade antes que o trabalho esteja concluído.
+Portanto, você deve considerar o envio de trabalhos em andamento, ou até mesmo
+disponibilizar uma árvore git para que os desenvolvedores interessados possam
+acompanhar o seu trabalho a qualquer momento.
+
+Ao enviar um código que ainda não é considerado pronto para inclusão, é uma boa
+ideia dizer isso no próprio envio. Mencione também qualquer trabalho importante
+que ainda precise ser feito e quaisquer problemas conhecidos. Menos pessoas vão
+olhar para patches que sabidamente estão "meio cozidos" (half-baked), mas aqueles
+que o fizerem virão com a ideia de que podem ajudá-lo a conduzir o trabalho na
+direção certa.
+
+
+Antes de criar patches
+----------------------
+
+Há uma série de coisas que devem ser feitas antes de você considerar o envio
+de patches para la comunidade de desenvolvimento. Elas incluem:
+
+ - Teste o código tanto quanto puder. Faça uso das ferramentas de depuração
+   do kernel, garanta que o kernel seja compilado com todas as combinações
+   razoáveis de opções de configuração, use compiladores cruzados (cross-
+   compilers) para compilar para diferentes arquiteturas, etc. Adicione testes,
+   provavelmente usando um framework de testes existente como o KUnit, e
+   inclua-os como um membro separado da sua série (veja a próxima seção para
+   mais informações sobre séries de patches). Note que isso pode ser
+   obrigatório ao afetar alguns subsistemas. Por exemplo, funções de biblioteca
+   (localizadas sob lib/) são amplamente utilizadas em quase todos os lugares e
+   espera-se que sejam testadas adequadamente.
+
+ - Certifique-se de que seu código esteja em conformidade com as diretrizes de
+   estilo de codificação do kernel.
+
+ - Sua alteração tem implicações no desempenho? Se sim, você deve executar
+   benchmarks mostrando qual é o impacto (ou benefício) da sua mudança; um
+   resumo dos resultados deve ser incluído junto ao patch.
+
+ - Tenha certeza de que você tem o direito de enviar o código. Se este
+   trabalho foi feito para um empregador, o empregador provavelmente tem direito
+   sobre o trabalho e deve estar de acordo com a sua liberação sob a GPL.
+
+Como regra geral, dedicar um pouco de reflexão extra antes de enviar o código
+quase sempre compensa o esforço em pouco tempo.
+
+
+Preparação de patches
+---------------------
+
+A preparação de patches para envio pode dar uma quantidade surpreendente de
+trabalho, mas, mais uma vez, tentar economizar tempo aqui geralmente não é
+aconselhável, mesmo a curto prazo.
+
+Os patches devem ser preparados contra uma versão específica do kernel. Como
+regra geral, um patch deve ser baseado no mainline atual encontrado na árvore
+git do Linus. Ao basear-se no mainline, comece a partir de um ponto de
+lançamento bem conhecido — um release estável ou -rc —, em vez de criar uma
+bifurcação (branch) a partir do mainline em um ponto arbitrário.
+
+No entanto, pode tornar-se necessário criar versões contra a árvore -mm,
+linux-next ou a árvore de um subsistema, para facilitar testes e revisões mais
+amplos. Dependendo da área do seu patch e do que está acontecendo em outros
+lugares, basear um patch contra essas outras árvores pode exigir uma quantidade
+significativa de trabalho para resolver conflitos e lidar com mudanças de API.
+
+Apenas as alterações mais simples devem ser formatadas como um único patch; tudo
+o mais deve ser feito como uma série lógica de mudanças. Dividir patches é uma
+arte; alguns desenvolvedores passam muito tempo descobrindo como fazer isso da
+maneira que a comunidade espera. Existem algumas regras práticas, no entanto,
+que podem ajudar consideravelmente:
+
+ - A série de patches que você envia quase certamente não será a série de
+   alterações encontrada no seu sistema de controle de versão de trabalho. Em
+   vez disso, as mudanças que você fez precisam ser consideradas em sua forma
+   final e, então, divididas de maneiras que façam sentido. Os desenvolvedores
+   estão interessados em alterações discretas e autocontidas, não no caminho
+   que você percorreu para chegar a essas alterações.
+
+ - Cada alteração logicamente independente deve ser formatada como um patch separado.
+   Essas alterações podem ser pequenas ("adicionar um campo a esta estrutura") ou
+   grandes (adicionar um driver totalmente novo, por exemplo), mas devem ser
+   conceitualmente pequenas e passíveis de uma descrição de uma única linha. Cada
+   patch deve fazer uma alteração específica que possa ser revisada por si só e
+   verificada para garantir que faz o que diz fazer.
+
+ - Como uma forma de reafirmar a diretriz acima: não misture diferentes tipos de
+   alterações no mesmo patch. Se um único patch corrige uma falha crítica de
+   segurança, reorganiza algumas estruturas e reformatará o código, há uma grande
+   chance de que ele seja ignorado e a correção importante seja perdida.
+
+ - Cada patch deve resultar em um kernel que compile e funcione corretamente; se
+   sua série de patches for interrompida no meio, o resultado ainda deve ser um
+   kernel funcional. A aplicação parcial de uma série de patches é um cenário
+   comum quando a ferramenta "git bisect" é usada para encontrar regressões; se o
+   resultado for um kernel quebrado, você tornará a vida mais difícil para os
+   desenvolvedores e usuários que estão engajados no nobre trabalho de rastrear
+   problemas.
+
+ - No entanto, não exagere. Certa vez, um desenvolvedor enviou um conjunto de
+   edições em um único arquivo como 500 patches separados — um ato que não o
+   tornou a pessoa mais popular na lista de discussão do kernel. Um único patch
+   pode ser razoavelmente grande, desde que ainda contenha uma única alteração
+   *lógica*.
+
+ - Pode ser tentador adicionar toda uma nova infraestrutura com uma série de
+   patches, mas deixar essa infraestrutura sem uso até que o patch final da série
+   ative tudo. Essa tentação deve ser evitada, se possível; se essa série
+   adicionar regressões, a bisseção (bisection) apontará o último patch como aquele
+   que causou o problema, mesmo que o bug real esteja em outro lugar. Sempre que
+   possível, um patch que adiciona código novo deve tornar esse código ativo
+   imediatamente.
+
+Trabalhar para criar a série de patches perfeita pode ser um processo
+frustrante, que exige bastante tempo e reflexão após o "trabalho real" ter sido
+concluído. Quando feito corretamente, no entanto, é um tempo bem gasto.
+
+
+Formatação de patches e logs de alterações
+------------------------------------------
+
+Então agora você tem uma série perfeita de patches para enviar, mas o trabalho
+ainda não terminou. Cada patch precisa ser formatado em uma mensagem que comunique
+de forma rápida e clara o seu propósito para o resto do mundo. Para esse fim,
+cada patch será composto pelo seguinte:
+
+ - Uma linha "From" opcional que nomeia o autor do patch. Esta linha só é
+   necessária se você estiver repassando o patch de outra pessoa via e-mail,
+   mas nunca é demais adicioná-la em caso de dúvida.
+
+ - Uma descrição de uma única linha sobre o que o patch faz. Esta mensagem deve
+   ser suficiente para que um leitor que a veja sem outro contexto consiga
+   compreender o escopo do patch; esta é a linha que aparecerá nos logs de
+   alterações (changelogs) de "forma curta". Esta mensagem geralmente é formatada
+   com o nome do subsistema relevante primeiro, seguido pelo propósito do patch.
+   Por exemplo:
+
+   ::
+
+     gpio: fix build on CONFIG_GPIO_SYSFS=n
+
+ - Uma linha em branco seguida por uma descrição detalhada do conteúdo do
+   patch. Esta descrição pode ser tão longa quanto necessário; ela deve dizer
+   o que o patch faz e por que ele deve ser aplicado ao kernel.
+
+ - Uma ou mais linhas de marcadores (tags) com, no mínimo, uma linha
+   "Signed-off-by:" do autor do patch. Os marcadores serão descritos em mais
+   detalhes abaixo.
+
+Os itens acima, juntos, formam o log de alterações (changelog) do patch. Escrever
+bons changelogs é uma arte crucial, mas frequentemente negligenciada; vale a
+pena dedicar mais um momento para discutir esse assunto. Ao escrever um
+changelog, você deve ter em mente que várias pessoas diferentes lerão suas
+palavras. Elas incluem mantenedores de subsistemas e revisores que precisam
+decidir se o patch deve ser incluído, distribuidores e outros mantenedores
+tentando decidir se um patch deve ser retroportado (backported) para outros
+kernels, caçadores de bugs se perguntando se o patch é responsável por um
+problema que estão perseguindo, usuários que querem saber como o kernel mudou e
+muito mais. Um bom changelog transmite a informação necessária para todas essas
+pessoas da maneira mais direta e concisa possível.
+
+Para esse fim, a linha de resumo deve descrever os efeitos e a motivação da
+alteração o melhor possível, dada a restrição de uma única linha. A descrição
+detalhada pode então ampliar esses tópicos e fornecer qualquer informação
+adicional necessária. Se o patch corrige um bug, cite o commit que introduziu o
+bug, se possível (e, por favor, forneça tanto o ID do commit quanto o título ao
+citar commits). Se um problema estiver associado a uma saída específica de log
+ou do compilador, inclua essa saída para ajudar outras pessoas que buscam uma
+solução para o mesmo problema. Se a mudança tem o objetivo de dar suporte a
+outras alterações que virão em um patch posterior, informe isso. Se as APIs
+internas forem alteradas, detalhe essas mudanças e como outros desenvolvedores
+devem reagir. Em geral, quanto mais você puder se colocar no lugar de todos que
+lerão seu changelog, melhor será esse changelog (e o kernel como um todo).
+
+Desnecessário dizer que o changelog deve ser o texto usado ao submeter (commit)
+a alteração em um sistema de controle de versão. Ele será seguido por:
+
+ - O patch em si, no formato de patch unificado ("-u"). O uso da opção "-p" no
+   diff associará os nomes das funções às alterações, tornando o patch resultante
+   mais fácil de ser lido por outras pessoas.
+
+As tags  já mencionadas brevemente acima são usados para fornecer
+informações sobre como o patch surgiu. Eles são descritos em detalhes no
+documento :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`;
+o que se segue aqui é um breve resumo.
+
+Um marcador é usado para se referir a commits anteriores que introduziram os
+problemas corrigidos pelo patch::
+
+	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
+
+Outro marcador é usado para vincular páginas da web com contextos ou detalhes
+adicionais, por exemplo, uma discussão anterior que levou ao patch ou um
+documento com uma especificação implementada pelo patch::
+
+  Link: https://example.com/somewhere.html  optional-other-stuff
+
+De acordo com as orientações do Pinguim-Chefe, um marcador Link
+só deve ser adicionado a um commit se ele levar a informações úteis que não
+são encontradas no próprio commit.
+
+Se a URL apontar para um relatório de bug público que está sendo corrigido pelo
+patch, use o marcador "Closes:" em seu lugar::
+
+	Closes: https://example.com/issues/1234  optional-other-stuff
+
+Alguns rastreadores de bugs têm a capacidade de fechar problemas de forma
+automática quando um commit com tal marcador é aplicado. Alguns bots que
+monitoram listas de discussão também podem rastrear esses marcadores e tomar certas
+ações. Rastreadores de bugs privados e URLs inválidas são proibidos.
+
+Outro tipo de marcador é usado para documentar quem esteve envolvido no
+desenvolvimento do patch. Cada um deles usa este formato::
+
+  tag: Full Name <email address>  optional-other-stuff
+
+Os marcadores de uso comum são:
+
+ - Signed-off-by: esta é uma certificação do desenvolvedor de que ele ou ela
+   tem o direito de enviar o patch para inclusão no kernel. É um acordo com o
+   Developer's Certificate of Origin (Certificado de Origem do Desenvolvedor),
+   cujo texto completo pode ser encontrado em
+   :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+   Códigos sem um signoff adequado não podem ser mesclados (merged) no mainline.
+
+ - Co-developed-by: afirma que o patch foi criado em coautoria por vários
+   desenvolvedores; é usado para dar atribuição aos coautores (além do autor
+   atribuído pelo marcador From:) quando várias pessoas trabalham em um único
+   patch. Cada Co-developed-by: deve ser imediatamente seguido por um
+   Signed-off-by: do coautor associado. Detalhes e exemplos podem ser encontrados
+   em :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
+
+ - Acked-by: indica o acordo de outro desenvolvedor (frequentemente um
+   mantenedor do código relevante) de que o patch é apropriado para inclusão
+   no kernel.
+
+ - Tested-by: afirma que a pessoa nomeada testou o patch e verificou que ele
+   funciona.
+
+ - Reviewed-by: o desenvolvedor nomeado revisou o patch para verificar sua
+   correção; veja a declaração do revisor em
+   :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
+   para mais detalhes.
+
+ - Reported-by: nomeia um usuário que relatou o problema que é corrigido por este
+   patch; este marcador é usado para dar crédito às pessoas (frequentemente sub-
+   valorizadas) que testam nosso código e nos informam quando as coisas não
+   funcionam corretamente. Nota: este marcador deve ser seguido por um marcador
+   Closes: apontando para o relato, a menos que o relato não esteja disponível na
+   web. O marcador Link: pode ser usado em vez de Closes: se o patch corrigir
+   apenas uma parte do(s) problema(s) relatado(s).
+
+ - A Suggested-by: este marcador indica que a ideia do patch foi sugerida pela
+   pessoa nomeada e garante o crédito a ela pela ideia. Isso, espera-se, irá
+   inspirá-la a nos ajudar novamente no futuro.
+
+ - Cc: a pessoa nomeada recebeu uma cópia do patch e teve a oportunidade de
+   comentar sobre ele.
+
+Tenha cuidado ao adicionar os marcadores mencionados acima aos seus patches, pois
+todos, exceto Cc:, Reported-by: e Suggested-by:, precisam de permissão explícita
+fontes da pessoa nomeada. Para esses três, a permissão implícita é suficiente se
+a pessoa contribuiu para o kernel Linux usando esse nome e endereço de e-mail de
+acordo com os arquivos do lore ou o histórico de commits — e, no caso de
+Reported-by: e Suggested-by:, se fizeram o relato ou a sugestão publicamente.
+Nota: o bugzilla.kernel.org é um local público nesse sentido, mas os endereços
+de e-mail usados lá são privados; portanto, não os exponha em marcadores, a menos
+que a pessoa os tenha usado em contribuições anteriores.
+
+
+Enviando o patch
+-----------------
+
+Antes de enviar seus patches por e-mail, há algumas outras coisas com as quais
+você deve se preocupar:
+
+ - Você tem certeza de que seu cliente de e-mail não vai corromper os patches?
+   Patches que sofreram alterações desnecessárias de espaço em branco ou quebra
+   de linha causadas pelo cliente de e-mail não serão aplicados na outra ponta
+   e, frequentemente, não serão examinados em detalhes. Se houver qualquer
+   dúvida, envie o patch para você mesmo e certifique-se de que ele chegue intacto.
+
+   O documento :ref:`Documentation/process/email-clients.rst <email_clients>`
+   possui algumas dicas úteis sobre como fazer clientes de e-mail específicos
+   funcionarem para o envio de patches.
+
+ - Você tem certeza de que seu patch está livre de erros bobos? Você deve sempre
+   passar os patches pelo scripts/checkpatch.pl e corrigir as reclamações que
+   ele apresentar. Por favor, tenha em mente que o checkpatch.pl, embora seja a
+   personificação de uma quantidade razoável de reflexão sobre como os patches do
+   kernel devem parecer, não é mais inteligente que você. Se corrigir uma
+   reclamação do checkpatch.pl piorar o código, não o faça.
+
+Os patches devem sempre ser enviados como texto simples (plain text). Por favor,
+não os envie como anexos; isso torna muito mais difícil para os revisores citarem
+trechos do patch em suas respostas. Em vez disso, coloque o patch diretamente no
+corpo da sua mensagem.
+
+Ao enviar patches por e-mail, é importante enviar cópias para qualquer pessoa
+que possa estar interessada neles. Ao contrário de alguns outros projetos, o
+kernel incentiva as pessoas a pecarem pelo excesso, enviando cópias demais; não
+assuma que as pessoas relevantes verão sua publicação nas listas de discussão. Em
+particular, as cópias devem ir para:
+
+- O(s) mantenedor(es) do(s) subsistema(s) afetado(s). Como descrito antes, o
+   arquivo MAINTAINERS é o primeiro lugar para procurar por essas pessoas.
+
+ - Outros desenvolvedores que estiveram trabalhando na mesma área — especialmente
+   aqueles que possam estar trabalhando lá agora. Usar o git para ver quem mais
+   modificou os arquivos nos quais você está trabalhando pode ser útil.
+
+ - Se você estiver respondendo a um relato de bug ou a uma solicitação de recurso
+   (feature request), envie uma cópia também para o autor original.
+
+ - Envie uma cópia para a lista de discussão relevante ou, se nada mais se
+   aplicar, para a lista linux-kernel.
+
+ - Se você estiver corrigindo um bug, pense se a correção deve ir para a próxima
+   atualização estável (stable update). Se sim, stable@vger.kernel.org deve
+   receber uma cópia do patch. Adicione também um "Cc: stable@vger.kernel.org"
+   aos marcadores (tags) dentro do próprio patch; isso fará com que a equipe do
+   stable receba uma notificação quando sua correção for integrada ao mainline.
+
+Ao selecionar os destinatários para um patch, é bom ter uma ideia de quem você
+acha que eventualmente aceitará o patch e fará a mesclagem (merge). Embora seja
+possível enviar patches diretamente para Linus Torvalds e fazer com que ele os
+mescle, as coisas normalmente não são feitas dessa forma. Linus está ocupado, e
+existem mantenedores de subsistemas que vigiam partes específicas do kernel. Em
+geral, você desejará que esse mantenedor mescle seus patches. Se não houver um
+mantenedor óbvio, Andrew Morton costuma ser o destino de patch de último recurso.
+
+Os patches precisam de boas linhas de assunto (subject lines). O formato canônico
+para a linha de um patch é algo como:
+
+::
+
+
+  [PATCH nn/mm] subsys: descrição de uma linha do patch
+
+onde "nn" é o número ordinal do patch, "mm" é o número total de patches na
+série, e "subsys" é o nome do subsistema afetado. Claramente, nn/mm pode ser
+omitido no caso de um patch único e isolado (standalone).
+
+Se você tiver uma série significativa de patches, é costumeiro enviar uma
+descrição introdutória como a parte zero. Essa convenção não é seguida
+universalmente, no entanto; se você a utilizar, lembre-se de que as informações
+da introdução não entram nos changelogs do kernel. Portanto, certifique-se de
+que os patches, em si, possuam informações completas em seus changelogs.
+
+Em geral, a segunda parte e as subsequentes de um patch de múltiplas partes devem
+ser enviadas como uma resposta à primeira parte, de modo que todas formem uma
+única linha de discussão (thread) na ponta receptora. Ferramentas como o git e o
+quilt possuem comandos para enviar por e-mail um conjunto de patches com o
+encadeamento correto. Se você tiver uma série longa, contudo, e estiver usando o
+git, por favor, evite a opção --chain-reply-to para não criar um aninhamento
+excepcionalmente profundo.
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
index 71f151f36..e9f04df62 100644
--- a/Documentation/translations/pt_BR/process/development-process.rst
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -21,4 +21,4 @@ conhecimento profundo de programação de kernel para ser compreendida.
    2.Process
    3.Early-stage
    4.Coding
-   
+   5.Posting
-- 
2.47.3

