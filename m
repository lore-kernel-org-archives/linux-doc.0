Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848144;
	b=zsd2nnZqkFHtM8LeWfdEg5kaUskajVDb5rldHl0Pm+qMDJS0GXvfTgmlDSHiyoSedDvj
	 IQSBdIS1LRlkXaIMGmx6ko4cEyyO5zOEr4mgNDWYBnEXgbUUnh7bY2x4LeiwD3yjQUuIl
	 Ge9RDE1hD8o+e+Ao4Xs2ciO8GWpTnQAS2xzcCwRo22lI00iM02rd/JkH4JbeYOSy4mQ0Y
	 eKM/N62OUU8HHzg4NkycxGt6mJc4txCRWe82vhzOB857yWHBdBASwhlEzuF0r7RqRscMm
	 dnOh0uTVrmQOn2L/ii7nWXMNi8iCUxhnNlu2MJ6FtnFQeu5249zQe9xbKb9gK8Cm2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FYOyINUN0nzYm4br9InZiyPrKS5d0PxHzi/Y5XHZcNE=;
	b=o5Q61QFpOSg7QDH8JFX284YY1QGsL1UPvE6tixsDpA6/C4R3AIxtEJxn1WFcjqmF9gO3
	 eCAM42P+7WEBtck8qaT3DaXVBW3/1Q5qF8MKjO6V0kERtrdwN0TulCkTsN6slJY3FpF0r
	 chtDscE47osM6tOfGIOZWiuWJRjKDy6lxVoYMzOHA3nfkcPsagJbG8hXD9P9iSBoHoTZ7
	 UCPWSt9ejkkURQGB3rEw31V42zH5t61Daj7v0CsSYLFO81Qlq5n6e10C1A9LJvkJmZcrZ
	 kTPlOeC/MNbU9NAUmOD7LnPLjyZDbHF786QMYg2e0OWNT9RsZ5l5R7lgeNGDfFt6xNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c5WHsRr7;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A1606A31B
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23A1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c5WHsRr7
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f036b17easo3598684eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848143; x=1793452943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYOyINUN0nzYm4br9InZiyPrKS5d0PxHzi/Y5XHZcNE=;
        b=c5WHsRr7YsQbECoto2KqDIPimGElx0MkFE3UNS2Fh69YdcqvovfldLpZQwrKu1CmiA
         jYVa0eMUP8VYpnnlWqH8JoglnGp4FVRg/L0F3rJY6Sf89Mq5fGzJeKVKzQfboA3Fl2h+
         hbTZ5wqRKulGldCVuCDFT7LuwD9nJPjbtceWJ9XJAhFy84QuYMOX3+eiA5/YB499LnS3
         iyu61IgiCB4Sfq87Ln8pJTr6fBuTsv3KowVO8YsVRrExOH/XnKDEYaqyeVOn5n+6ggAe
         yFDigQVxpTVR2O5ravaPw6p5bgn2r3Jc8XQHL3n+VT5KwblkXMydoMNfkgNGiiHfU5x9
         T5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848143; x=1793452943;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYOyINUN0nzYm4br9InZiyPrKS5d0PxHzi/Y5XHZcNE=;
        b=yka8jItdLe7y4Y+MIWLU/rU8Ex2EWIv2aNGX7J+IhYwfC76dU78sPLOTDflnPB2bdH
         ZGcSaQcdid8px2a63zqfoxK1ba0jtbmutNNvGNUjPp4JqOO0fLUfkGWu8mvEHgUXailT
         rodbO8O/kZurPl+CzS0tIH5lnFs8DnkgS3JJj8obZXEhNgAuxAtwPQRA0SV+yshAdvYr
         dxISf+2YdkCNsAyDNv/4K3aIQmfoqcErTP1EcpbsX6iv0NtRsDV47mI1HP3UNfCP4w58
         zUuauiYYIxvMsNYaO6dYess0rzUdj6QLr7zwkg3APkwU2SV1PSotZ+39NloYRlNjDZR+
         gdlg==
X-Forwarded-Encrypted: i=1; AKwUvBwdHcOe0amPxk3xghwc9Mr52EulZgRQodyNqitDWFe7Z1NYWbI2f34uwXddlC50nq2HgNsFYFW+480=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAOFktAVpd1+NIRM9qSk8Qsbe8aWG1yv7MWUKJZzEz03Hu1cKE
	DsX/vKIdT7skea+t37KIFn5YQfYMevXwBY8Ri8H9j8myIL1D0gohvnqZ39fd2FUc
X-Gm-Gg: AYBFou0/zEXjDXYNSFru/6r7EpB4RMh4jy3JqFDBDzfcVqYxgbIO8glfKOLbhi4wgdX
	MaOP4tKtoM8bnTEqNxse7Nv97OOGuT2Srfrvpj2gF/84YGr2sGddpUejFcti58efQA126Yms1hP
	Fa+vPuCIcrZn8ScIY54bNkj2jkzlescoM+xT2EXfM3Wc6I6G6t6oKhintpfWFplum87WETGI8u+
	qW28t4ct7L6krOVOLlXzk7sSRsWxEPNxtZDAryMT+4S66qL/JUQaagjAdLk5WDNoTN6vazwE7yb
	POu0iGaRp1gNnOoxQMqSOJpS+4F64U0i17RFS2yr6GWtZxEfsYDZsqJIbDN6oQuIY11SPqUzIM0
	SjF2ATGfwl6xT+0OKbbFEW+CGIS0eNqcRwhgIezm+13IAipq+1UIthvKL97+sGXTD85Lytey//e
	H23wyHBOeq4DZ2OCTaNgCylWR4JaiBkJsLse6h6wcunqyzRkkcajfF0tIbDSi1yaCt9xF0EJDsN
	ys0SiGNiDfdaDH/cv4SwClhiFWyGwzHqPcnU8M3DO+cm8mcigBcKazby98lh3bK/9JZEh594iPC
	zT51M5lIFxA0RpNkhzeEM+/DfDKuRGY5ZdoUWCCzIUCH+QTWTBXGuLS8guuBVNATKPguf8Z+thd
	mWMycamu/
X-Received: by 2002:a05:7301:7d01:b0:366:c497:610c with SMTP id 5a478bee46e88-369e8610133mr2705067eec.33.1792848142440;
        Sat, 24 Oct 2026 06:22:22 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:21 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 10/11] docs/translations/pt_BR: process: restore links, emphasis and headings
Date: Sat, 24 Oct 2026 10:21:57 -0300
Message-ID: <20261024132158.39493-11-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix markup that differs from the English version:

- coding-style.rst: function names wrapped in literals were not turned
  into links as in the original, and a literal closed in the middle of
  a word ("typedef``s") rendered with visible backquotes;
- maintainer-kvm-x86.rst: "Timeline" was a section instead of a
  subsection;
- management-style.rst and backporting.rst: restore the emphasis
  dropped in five places.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/backporting.rst     |  6 +++---
 .../translations/pt_BR/process/coding-style.rst    | 14 +++++++-------
 .../pt_BR/process/maintainer-kvm-x86.rst           |  2 +-
 .../pt_BR/process/management-style.rst             |  6 +++---
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/backporting.rst b/Documentation/translations/pt_BR/process/backporting.rst
index afcff7085..85128c1ee 100644
--- a/Documentation/translations/pt_BR/process/backporting.rst
+++ b/Documentation/translations/pt_BR/process/backporting.rst
@@ -93,7 +93,7 @@ O que fazer agora?
 
 Em geral, os conflitos aparecem quando o contexto do patch (ou seja, as linhas
 que estão sendo alteradas e/ou as linhas que cercam as alterações) não
-corresponde ao que está na árvore à qual você está tentando aplicar o patch.
+corresponde ao que está na árvore *à qual* você está tentando aplicar o patch.
 
 No caso de backports, o que provavelmente aconteceu foi que a ramificação
 (branch) a partir da qual você está fazendo o backport contém patches que não
@@ -137,8 +137,8 @@ Patches pré-requisitos
 ----------------------
 
 A maioria dos conflitos acontece porque a ramificação para a qual você está
-fazendo o backport não possui alguns patches em comparação com a ramificação a
-partir da qual você está fazendo o backport. No caso mais geral (como a
+fazendo o backport não possui alguns patches em comparação com a ramificação
+*a partir da qual* você está fazendo o backport. No caso mais geral (como a
 mesclagem de duas ramificações independentes), o desenvolvimento poderia ter
 ocorrido em qualquer uma das ramificações, ou as ramificações simplesmente
 divergiram -- talvez a sua ramificação mais antiga tenha recebido alguns outros
diff --git a/Documentation/translations/pt_BR/process/coding-style.rst b/Documentation/translations/pt_BR/process/coding-style.rst
index ac9bf0a71..af4124f57 100644
--- a/Documentation/translations/pt_BR/process/coding-style.rst
+++ b/Documentation/translations/pt_BR/process/coding-style.rst
@@ -384,7 +384,7 @@ Em contraste, se diz
 
 você consegue dizer o que ``a`` é.
 
-Muitas pessoas pensam que ``typedef``s ``ajudam na legibilidade``. Não é bem
+Muitas pessoas pensam que typedefs ``ajudam na legibilidade``. Não é bem
 assim. Eles são úteis apenas para:
 
  (a) objetos totalmente opacos (onde o ``typedef`` é usado ativamente para
@@ -926,7 +926,7 @@ que você deve usar para garantir que as mensagens sejam correspondidas ao
 dispositivo e driver corretos e sejam marcadas com o nível certo: ``dev_err()``,
 ``dev_warn()``, ``dev_info()`` e assim por diante. Para mensagens que não
 estão associadas a um device específico, <linux/printk.h> define
-``pr_notice()``, ``pr_info()``, ``pr_warn()``, ``pr_err()`` etc. Quando os
+pr_notice(), pr_info(), pr_warn(), pr_err() etc. Quando os
 drivers funcionam corretamente, eles ficam silenciosos, então prefira usar
 ``dev_dbg``/``pr_debug`` a menos que algo esteja errado.
 
@@ -934,7 +934,7 @@ Encontrar boas mensagens de depuração pode ser um desafio; e, uma vez que
 você tenha essas mensagens, elas podem ajudar bastante para solução de
 problemas remota. No entanto, a impressão de mensagens de depuração é tratada
 diferentemente da impressão de outras mensagens não de depuração. Enquanto as
-outras funções ``pr_XXX()`` imprimem incondicionalmente, ``pr_debug()`` não;
+outras funções ``pr_XXX()`` imprimem incondicionalmente, pr_debug() não;
 ela é compilada fora por padrão, a menos que ``DEBUG`` seja definido ou
 ``CONFIG_DYNAMIC_DEBUG`` esteja configurado. Isso também vale para
 ``dev_dbg()``, e uma convenção relacionada usa ``VERBOSE_DEBUG`` para adicionar
@@ -951,8 +951,8 @@ incondicionalmente, por exemplo, se ela já estiver dentro de uma seção
 --------------------
 
 O kernel fornece os seguintes alocadores de memória de uso geral:
-``kmalloc()``, ``kzalloc()``, ``kmalloc_objs()``, ``kzalloc_objs()``,
-``vmalloc()`` e ``vzalloc()``. Consulte a documentação da API para obter mais
+kmalloc(), kzalloc(), kmalloc_objs(), kzalloc_objs(),
+vmalloc() e vzalloc(). Consulte a documentação da API para obter mais
 informações sobre eles. :ref:`Documentation/core-api/memory-allocation.rst
 <memory_allocation>`
 
@@ -1008,7 +1008,7 @@ linhas de código. Uma exceção a essa regra são os casos em que um parâmetro
 conhecido como uma constante em tempo de compilação, e como resultado dessa
 constância você *sabe* que o compilador será capaz de otimizar grande parte da
 sua função em tempo de compilação. Para um bom exemplo desse caso posterior,
-veja a função inline ``kmalloc()``.
+veja a função inline kmalloc().
 
 Muitas pessoas argumentam que adicionar ``inline`` a funções ``static`` usadas
 apenas uma vez é sempre uma vantagem, porque não há custo de espaço. Embora
@@ -1037,7 +1037,7 @@ ajudar a evitar esses bugs, siga sempre esta convenção::
 
 Por exemplo, ``add work`` é um comando, e a função ``add_work()`` retorna 0
 para sucesso ou -EBUSY para falha. Da mesma forma, ``PCI device present`` é um
-predicado, e a função ``pci_dev_present()`` retorna 1 se encontrar um device
+predicado, e a função pci_dev_present() retorna 1 se encontrar um device
 correspondente ou 0 se não encontrar.
 
 Todas as funções ``EXPORT`` devem respeitar esta convenção, e assim também
diff --git a/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst b/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst
index ef133d32c..60712b9e9 100644
--- a/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst
@@ -69,7 +69,7 @@ A árvore do KVM x86 não possui sua própria janela de merge oficial, mas há u
 acima para correções destinadas ao lançamento atual).
 
 Cronograma
-----------
+~~~~~~~~~~
 As submissões são normalmente revisadas e aplicadas em ordem FIFO (primeiro a
 entrar, primeiro a sair), com alguma margem de manobra para o tamanho de uma
 série, patches que estão "cache hot", etc. Correções (fixes), especialmente para
diff --git a/Documentation/translations/pt_BR/process/management-style.rst b/Documentation/translations/pt_BR/process/management-style.rst
index 9d067e046..cd12ddca5 100644
--- a/Documentation/translations/pt_BR/process/management-style.rst
+++ b/Documentation/translations/pt_BR/process/management-style.rst
@@ -97,7 +97,7 @@ de antemão que você não tem a menor ideia, e dizendo às pessoas antes do fat
 que sua decisão é puramente preliminar, e pode ser a coisa errada. Você deve
 sempre reservar o direito de mudar de ideia, e fazer com que as pessoas estejam
 muito **cientes** disso. E é muito mais fácil admitir que você é estúpido quando
-você ainda não fez a coisa realmente estúpida.
+você **ainda** não fez a coisa realmente estúpida.
 
 Então, quando realmente se revela estúpido, as pessoas apenas reviram os olhos
 e dizem "Ops, não de novo".
@@ -149,7 +149,7 @@ um imbecil" de milhões de maneiras diferentes [#f2]_, às vezes sem nem percebe
 e quase sempre com uma convicção ardente de que você está certo.
 
 E quanto mais convencido você estiver de que está certo (e vamos encarar, você
-pode chamar praticamente qualquer pessoa de imbecil, e muitas vezes você **vai**
+pode chamar praticamente **qualquer pessoa** de imbecil, e muitas vezes você **vai**
 estar certo), mais difícil acaba sendo se desculpar depois.
 
 Para resolver esse problema, você realmente só tem duas opções:
@@ -230,7 +230,7 @@ desculpar, o segundo você realmente não terá a chance. Eles provavelmente nã
 estarão mais ouvindo, mesmo que você faça um bom trabalho de outra forma.
 
 Todos nós pensamos que somos melhores do que qualquer outra pessoa, o que significa
-que quando alguém posa de superior, isso realmente nos irrita. Você pode ser moral
+que quando alguém posa de superior, isso **realmente** nos irrita. Você pode ser moral
 e intelectualmente superior a todos ao seu redor, mas não tente tornar isso muito
 óbvio, a menos que você realmente **pretenda** irritar alguém [#f3]_.
 
-- 
2.47.3

