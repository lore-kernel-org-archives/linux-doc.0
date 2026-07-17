Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02108344D92
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307564; cv=none; b=dBOqL4WfMpm6xUXgCB0g7FS1IBJ9KUSHiSTHtGoaHTpTMUVEUhyo5l3E2V6iN+A8VPB6KkkU26BuEj+rNMRptTV1A4m2Xey7n3kmSmmmrZtTzKnHnCjJAsAyyuUsgcvahIaktsOdNg2ptwXKfmsmK03QocQJVmLtFzmDWWGQI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307564; c=relaxed/simple;
	bh=PWRCyTvaV4xfUrhwJCzv9lugqUBht6wdVWr2cxNYSAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ggrFBTWADQZ/c3Xf05wkM01YBEFOPTGDlQfgPrX6lR2w2Kuo9uU36VK31Xsq8xCtkiu7S5hSWajGmjXkkpan7Pgxom2Awg3G2kWgwXwA9ZFIdY+9kpgdUmDgSn2lxW1xNdFMEtwesj4tPnMEvxGEfztySSlLGWXRO68hPfI5HXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn7AiFmL; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn7AiFmL"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81ee2c048acso26234027b3.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784307562; x=1784912362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbtWlGzkRjnOeLQ+s9OpbfhJXjCy7QHdSKSEF5Q6GQs=;
        b=Vn7AiFmLIuhYhH2k7dazzg3WDzYC4/78s2wnG6hDGhGBV8ZO0nWFv1IrNNbGzDefcF
         rHd7B1retivqzd9HYn4UMldnxNH91uCexcR8bUz7IsGGO3006m+Y0V05HlR94GLQkDHR
         Is3klAMblrTYnXUswdKzrrJG48XvP9DZzLPkNBhICoQgawVCOZ8Z8xErYQHQoQ55YvN9
         An6/g3gfR5aA8hWsQnxTVqEpYtNHnf75ahID8YhX439BGDocqRxzrffxl1hbL8dhyvSM
         KngFrRFU6yYoqNiBvbWLsJB5k2b+LUDeXwBfiOh7eqkuJcSy5EyapnwlxdCzIi0J7+AY
         tvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307562; x=1784912362;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kbtWlGzkRjnOeLQ+s9OpbfhJXjCy7QHdSKSEF5Q6GQs=;
        b=KeSEbllPbZhFlgcny+q+oyxzk4zh/VLShzNi9dJicKj0ErEP1+gS/5SSM1THNo7yBL
         wPoiw2KkRy4XaCpoWjteCUxsvO7HYrDl9z6roRYnXk7V9Q5UINdxy/dpOaYfGk8zXpzm
         ehU3R/3oRjWlEnNHqjy6X6vXGoPLQE0D487HcoAvanzBbMta4YUDiusjs0XxEZcqnuMz
         aMWrbYA2xC/vW9ApIQGyFYzKRwudZzxzmQBfgfhAsHVu3sFlqhrR0dvl0dS9cFO4cBHp
         HFvfre5SKMIqNBcFwDvRyboe0YHWjwtCNzw0SzEiRxpo1gW61UjgKx1QqbkrJ395ENmN
         fyQw==
X-Gm-Message-State: AOJu0YxR0piKZTbl7LQWsCvDrC495ZZWMQEaqPdG7gX2JkF21pFKakLH
	sbAB2KoEmqCnB+JBS2atJNSKccYFF5BbDF4cZQkmzFlKI9NZSCqRUqIb4GvcV+xooqc=
X-Gm-Gg: AfdE7ckxwF5lvU1y4FQrATDuJf7ckHLRYz6DQ0ppLTZedcIgaNeUTBkbPxYF3UAA6M4
	Dl8LZMeFAZDVUrrvMZ99T6jm3eVrlus1hV5FzLhACs6+5rI6HolXMceOAxJOxRZAVRVxx6MzlQY
	Uq4lVt/t1H4xi4aCX+feZOHKuXAswqZM368UOSL3QXHHdjIEoqMgkSreBqIBk9vwx9td16Gue7j
	QGZWbTB68L8d//me5Y9lq8bxgR1iOzxUR5NE+SSKMdlhBOUsjMJB4dNVLDQfjh34cr9odAmhc6W
	L5SXEVLwBXJAlqCR9M7aeBOT6jrYo40NNqZOCNHFNi9IMwHsvzhPGgaCNVY2e+3PkUcAd2VlYL3
	1cP3suzHswXvSy8uYsFvVNXvT8PjKKAFmVSmE4pPs1Q2hq693Egg6GlYSJQ52AWYo0kd533+zZj
	DfZUc=
X-Received: by 2002:a05:690c:c1c:b0:81e:1b3c:9e4 with SMTP id 00721157ae682-81ef25a16cemr11595527b3.14.1784307561861;
        Fri, 17 Jul 2026 09:59:21 -0700 (PDT)
Received: from ASUS.. ([187.65.135.28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42e5b93sm14725417b3.43.2026.07.17.09.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:59:21 -0700 (PDT)
From: Abel Philippe <le590616@gmail.com>
To: danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Abel Philippe <le590616@gmail.com>
Subject: [PATCH v2] docs: pt_BR: process: Translate programming-language
Date: Fri, 17 Jul 2026 13:59:07 -0300
Message-ID: <20260717165908.1040053-1-le590616@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the programming language documentation into Brazilian Portuguese.

Signed-off-by: Abel Philippe <le590616@gmail.com>
---
 pt_BR/index.rst                        |  2 +-
 pt_BR/process/programming-language.rst | 58 ++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 pt_BR/process/programming-language.rst

diff --git a/pt_BR/index.rst b/pt_BR/index.rst
index 5b8b60cf930f..0b9748e8b986 100644
--- a/pt_BR/index.rst
+++ b/pt_BR/index.rst
@@ -83,4 +83,4 @@ kernel e sobre como ver seu trabalho integrado.
    Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
    Adicionando uma Nova Chamada de Sistema <process/adding-syscalls>
-
+   Linguagem de progamação <process/programming-language>
diff --git a/pt_BR/process/programming-language.rst b/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..1fc0a6be7f65
--- /dev/null
+++ b/pt_BR/process/programming-language.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linguagem de programação 
+========================
+
+O kernel Linux é escrito na linguagem de programação C [c-language]_.
+Mais precisamente, ele é normalmente compilado com ``gcc`` [gcc]_
+sob ``-std=gnu11`` [gcc-c-dialect-options]_, o dialeto GNU da ISO C11.
+O compilador ``clang`` [clang]_ também é suportado; consulte a documentação em
+:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém diversas extensões da linguagem [gnu-extensions]_,
+e muitas delas são utilizadas rotineiramente no kernel.
+
+Atributos
+---------
+
+Uma das extensões mais comuns utilizadas em todo o kernel são os atributos
+[gcc-attribute-syntax]_. Os atributos permitem introduzir
+semânticas definidas pela implementação em entidades da linguagem (como variáveis,
+funções ou tipos) sem a necessidade de realizar mudanças sintáticas
+significativas na linguagem (por exemplo, adicionando uma nova palavra-chave) [n2049]_.
+
+Em alguns casos, os atributos são opcionais (isto é, um compilador que não os
+suporte ainda deve produzir código correto, mesmo que ele seja mais lento ou
+não execute tantas verificações e diagnósticos durante a compilação).
+
+O kernel define pseudopalavras-chave (por exemplo, ``__pure``) em vez de usar
+diretamente a sintaxe de atributos do GNU (por exemplo, ``__attribute__((__pure__))``)
+para detectar quais deles podem ser utilizados e/ou para encurtar o código.
+
+Por favor, consulte ``include/linux/compiler_attributes.h`` para mais informações.
+
+Rust
+----
+
+O kernel tem suporte para a linguagem de programação Rust.
+[rust-language]_ sob ``CONFIG_RUST``. É compilado com o ``rustc`` [rustc]_ ``rustc`` [rustc]_
+sob ``--edition=2021`` [rust-editions]_. As edições são uma maneira de introduzir
+pequenas alterações na linguagem que não são retrocompatíveis.
+
+Além disso, alguns recursos instáveis ​​[rust-unstable-features]_ são utilizados no
+kernel. Recursos instáveis ​​podem sofrer alterações no futuro; portanto, é um
+objetivo importante chegar a um ponto em que apenas recursos estáveis ​​sejam utilizados.
+
+Consulte ``Documentation/rust/index.rst`` para obter mais informações.
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
2.43.0

