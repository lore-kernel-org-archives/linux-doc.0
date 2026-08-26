Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD607298991
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 02:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787711477; cv=none; b=q3tRwFDmpDwn2dYj14am2l3enU6r8SgYmDmwQMFaq9uvj94JdQk74ULWQWCe8BcQDrX6KIQGQ1Gcb6I9TEoZ5vU/wX7WtncJd80aL5iEtMHsbqF4FLHHEj2w1sG9+u1YW/BouvlIK+cqMuDatWzVTcfqG5CJIC4xOreg1cN4++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787711477; c=relaxed/simple;
	bh=STqpY2lARG60P9jYZVvV94WcCI2VAj6mEIcMHSGYc/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S5Nw9MyczOcknOEodc9t30KVfWHVKXDOKXKPmo/cRIYPbhm5rtU3O43b9jHUmC8NC8XrUm2N/IAjm2cbuQ057IDJCW2gahlevZedfYmnejG3ADb6uAnhqkSvlahiCvrd+KGuLanmTCZwoxLES8sORHT+ciTdcTu+AIc+LpXQkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGnCSguV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGnCSguV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1001676a91.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 19:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787711475; x=1788316275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJkbKNB+kDXTUsnGtZlmkeb9P1JDtuvt1cqycbDNXOs=;
        b=lGnCSguVtv4+wYLAf2jLykwyiDrq1ehelQd5uIn7lKJG1GZHw6JMrLTQy6hKgq5dab
         IGU0MHzk7c9837imldeXfxmHh8sE4rrEI8PH5J0wERI8fGt8C2MWaEWdNKtaCRZtuBjv
         B1qvdvtrc1HvTJ+Itm3OhJnj8uSXiW4lSMkz8y76MSusrR4cynKfbeISdc9ZqZmW0fB4
         1Fblba3mJMIZZ74wAHu6km2KrhoZS50xCxD6gloPgDaaLfatXHbRSofgyny7SJ27VqQO
         7h4Clvox5CbzdZhXwMWA/jIyrAsndelDFp3k8l6pqa3IG45g55Z6z4GrKWihW0fZZ4Uh
         qC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787711475; x=1788316275;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cJkbKNB+kDXTUsnGtZlmkeb9P1JDtuvt1cqycbDNXOs=;
        b=o4ZrcH3RZcAhFl5wMBX9YTOSB+ta1fzwbActjoiIeYlxUtHzUSl2zvSA/w4yTqSf7n
         ZrAv1lm1Jn5M7kA9muroTKAECrjItI8GZEzpt/7EpcvSIO2vjBk5hLYn/rmkYhsfzLQ3
         avZW6IRaDr1mS+rC0Q0gP3jd+kbfJkDn0TJ2iseaFEB6/eYNQfCoop5Yw+2f/zR+AX7H
         TXvO1b8swE5vlW400Cr1yofklC9XcQKnllWXSA/84MR4StnnNwxccWIF+dN84e9AukuH
         1q6TiMZXPoqp+0Y0YuRoWO+kwzsXFRuyMura2ZjqXJv43eAXVOwr4QnwMP6e5QwF9hve
         cfrw==
X-Forwarded-Encrypted: i=1; AHgh+RrWqFgy3jIP9eWJdlLaxdW9GK3nBBe1bYgmGJf/HX3C1xLH58PDrsMCinDOaSSlflhbkSbapEH8AyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kMBaHAXrfOKz6CKbniRfqp/ZSx6wrBeG2n6Z3AtzsMvxgOLwGI
	HxGwXWvK4g4c8a+x0simFcy2W1Uj0vkV+eRtj8NbBbW5cgC2p02tgMVM
X-Gm-Gg: AR+sD13maIUjkP957j693oRqeuOGcxJzWptsIFLCGoWSg5yxKs7JugUYBoG82I4VUST
	slzrrMX8Z2fCZxi9Be+q5h4hQwRhrW9tLS6rws6qdhQX5nofwsCMxRXU5ixoZzcnKNFaE4s+7l9
	/HjjNwu6lSomHUG/3VdOUCo09OJV/oGobCSrgG3+l3nM6P3a1AR3JnLuCQzPBhIidN6UU/yWcle
	kPYae8ZDg850XdoUhhV4GEVUc/io+RI71l4Hn7aJqNi3p1MSJYG2dNiiHEPnm5PdUMIVEjk1vIL
	Pdyv4xh8JmT80fFGjTUuq/r5oTie624I08qIu7ijDBd7XWZ0deXLIY0pvsSWeDssBN+FePFwE04
	L8yHU4fb9zOsCQWTYbzUC2y4bFJhELash+004EvfcS5et4OGBMxathi5eNeqh5ftvJy5vOKtsaz
	OBKVVzL30yEtHvv0RAKlb45XGQ54mN7BlvduHpF278GKixrpqXzfDEJtgy6pNPzKxiZCqW
X-Received: by 2002:a17:90b:3949:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3966cde3f0amr7450148a91.0.1787711474714;
        Tue, 25 Aug 2026 19:31:14 -0700 (PDT)
Received: from x-wing ([177.181.5.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d769d81sm3420736eec.13.2026.08.25.19.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:31:13 -0700 (PDT)
From: Fabio Pereira da Silva <silvapfabio@gmail.com>
To: danielmaraboo@gmail.com
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: pt_BR: process: Translate development process and programming language
Date: Tue, 25 Aug 2026 23:31:07 -0300
Message-ID: <20260826023107.15130-1-silvapfabio@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the development process overview and programming language
documentation for Brazilian Portuguese readers. Add both documents to the
pt_BR process index.

Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |  2 +
 .../pt_BR/process/development-process.rst     | 29 +++++++++
 .../pt_BR/process/programming-language.rst    | 62 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/development-process.rst
 create mode 100644 Documentation/translations/pt_BR/process/programming-language.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 71eb024fbec8..ce2ed7a0387a 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -73,6 +73,8 @@ kernel e sobre como ver seu trabalho integrado.
    Requisitos mínimos <process/changes>
    CVEs <process/cve>
    Lista de verificação para patches <process/submit-checklist>
+   Processo de desenvolvimento <process/development-process>
+   Linguagem de programação <process/programming-language>
    Interface de drivers do kernel Linux <process/stable-api-nonsense>
    Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/development-process.rst b/Documentation/translations/pt_BR/process/development-process.rst
new file mode 100644
index 000000000000..dda7fc1850b4
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/development-process.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _development_process_main:
+
+Um guia do processo de desenvolvimento do kernel
+================================================
+
+O objetivo deste documento é ajudar os desenvolvedores (e seus gerentes) a
+trabalhar com a comunidade de desenvolvimento com o mínimo de frustração. É
+uma tentativa de documentar como essa comunidade funciona de uma maneira
+acessível para quem não está intimamente familiarizado com o desenvolvimento
+do kernel Linux (ou, de fato, com o desenvolvimento de software livre em
+geral). Embora haja algum material técnico aqui, esta é uma discussão muito
+orientada ao processo e não exige conhecimento profundo de programação do
+kernel para ser compreendida.
+
+.. toctree::
+   :caption: Conteúdo
+   :numbered:
+   :maxdepth: 2
+
+   1.Intro
+   2.Process
+   3.Early-stage
+   4.Coding
+   5.Posting
+   6.Followthrough
+   7.AdvancedTopics
+   8.Conclusion
diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..5fdda01742d0
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _programming_language:
+
+Linguagem de programação
+=========================
+
+O kernel Linux é escrito na linguagem de programação C [c-language]_. Mais
+precisamente, ele normalmente é compilado com ``gcc`` [gcc]_ usando
+``-std=gnu11`` [gcc-c-dialect-options]_: o dialeto GNU da ISO C11. ``clang``
+[clang]_ também é compatível; consulte a documentação sobre :ref:`Compilar o
+Linux com Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém muitas extensões da linguagem [gnu-extensions]_, e muitas
+delas são usadas normalmente dentro do kernel.
+
+Atributos
+---------
+
+Uma das extensões comuns usadas em todo o kernel são os atributos
+[gcc-attribute-syntax]_. Os atributos permitem introduzir semântica definida
+pela implementação em entidades da linguagem (como variáveis, funções ou
+tipos) sem precisar fazer alterações sintáticas significativas na linguagem
+(por exemplo, adicionar uma nova palavra-chave) [n2049]_.
+
+Em alguns casos, os atributos são opcionais (isto é, um compilador que não os
+suporte ainda deve produzir código correto, mesmo que ele seja mais lento ou
+não faça tantas verificações/diagnósticos em tempo de compilação).
+
+O kernel define pseudo-palavras-chave (por exemplo, ``__pure``) em vez de usar
+diretamente a sintaxe de atributos do GNU (por exemplo,
+``__attribute__((__pure__))``), a fim de detectar quais podem ser usados e/ou
+encurtar o código.
+
+Consulte ``include/linux/compiler_attributes.h`` para obter mais informações.
+
+Rust
+----
+
+O kernel oferece suporte à linguagem de programação Rust [rust-language]_ com
+``CONFIG_RUST``. Ela é compilada com ``rustc`` [rustc]_ usando
+``--edition=2021`` [rust-editions]_. As edições são uma forma de introduzir
+pequenas alterações na linguagem que não são compatíveis com versões
+anteriores.
+
+Além disso, alguns recursos instáveis [rust-unstable-features]_ são usados no
+kernel. Recursos instáveis podem mudar no futuro; portanto, alcançar um ponto
+em que apenas recursos estáveis sejam usados é um objetivo importante.
+
+Consulte Documentation/rust/index.rst para obter mais informações.
+
+.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [gcc] https://gcc.gnu.org
+.. [clang] https://clang.llvm.org
+.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [rust-language] https://www.rust-lang.org
+.. [rustc] https://doc.rust-lang.org/rustc/
+.. [rust-editions] https://doc.rust-lang.org/edition-guide/editions/
+.. [rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2
-- 
2.55.0.windows.2

