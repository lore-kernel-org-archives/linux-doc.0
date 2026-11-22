Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795358046;
	b=FyH82FuoEspeMCoQK2sKamPURCJp5RAm1Wmx19f/0RjAgzxDe+8Gb/+pyzSZifD+p8/e
	 5Vu92lmdo4YewPTG53iskp1Qs9KlwH6b+1MU0C1FN1RhnOebDGDJbEc25VG4N5beEyRu4
	 U/hZiWcKSJPWw+2glowF9AWv4NJvKu4MCv4TM2xZrnYhjLY7uz5E+icYJSyGt/nAD2flw
	 GqNkIxV3eMy9HADZYs2sqVNl7djnaGmsFdIZYsQwfIoYjfydvbf2ls9/+KaCmrr1emgGN
	 g+nHziCZTV6ikuWPiHsC4ggXRjfUlqrTDHTO/M0N3QvLfJrBvMS000w023K7UCVPVKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358046;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RRDNCFYEyS6IcK9i7xXeRmOQnS/b+iqLZzZVuL8mMnA=;
	b=VNzKJVE7NJnc+6sITH8+G33i16AP1JPfWbVd80JPbEacnxy+99TdZtvmJVSG4IQNkHyq
	 AP8nzJhcl4x/omwA2RkePVnou3gLHi1WcVZINi5BjyIjINJxlvPMRrfJztCfKovYEi9Nm
	 eMVaIvq7psTsvDt2xbxdTfIMBtBra3W1OHWGaEQYsAAwcT4PPVaQAZQBDNQcWp0c442nz
	 lMYtPIzN3kmIbrIZadWUypHuM6BsjSkn9A0Rd/zcfDABDEefWNyw5JdrzyNeQRiywMEhr
	 EVHfObiJt9QPR5VOKCZAS1V3LveC9id/k52y1TjDSNOMc3tdV2V0EnPLEKf0LhT3sZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S/4xi36n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C928D606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S/4xi36n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795358045;
	b=J3agH9MVPdjYXKegaHgRPJclICNtlu7oKtb+cc9wfZz/KQwsPMM9Ap1zUcfMK8W/wdIH
	 Lsi23pBjOiQJVX/LLEskTkM2o9329KHt4YpVMV3JiWfCUucpCf+MCLAT7l0Iifdn06aYK
	 ipDDX4N7fhvtMXgcFz++5LrmJlmN6Gf16ej2OEM95JWn4GOrNBANXwhr20bCUaUOdl+bO
	 JLPnwV/C9pck86EZs7soVafCYOh7TemsTpARxD2Po8XT0txPgFW4m8e9SoxKh7ITwOQlH
	 Jw7n9DpuWscTpmRF6803ARoBVN5cU7fRXdmr4UY4Zev6DeYH4Keh3pog5Q5X17Jln0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795358045;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RRDNCFYEyS6IcK9i7xXeRmOQnS/b+iqLZzZVuL8mMnA=;
	b=iJliY+0tkrPVAvMk22Hj/Q04kWUOQ9j9Awwvj8c6nG7bdBSgG1Wh/ikNmDCr7uWIo2PF
	 4QXZopCFZUws9NvxFG6pAg7Vl5T4uGRrrBcG3iURj/nLa76Kr8PlqRSiTGGxziSiCq8Pw
	 FwxzHZdyme4yLk8m0pj8yCD/PFtvfvDJjYQ/v4I5Bw0p87Fxddr5Kjnuk2/ej8oky5izq
	 vRUX/8x0+i0A4VsbAM/jgAn037PTTZMUY0l2ruZYLvhPD8sZyzR8P/eoEwykwz7BBEeFA
	 H+EZA68PWW9oR6MXpN++6e6jia9/p+AKxfU7fkrOYUX3xQfmFqg+VJUTWI/CAbljdUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F68C1F000C6;
	Sun, 22 Nov 2026 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795358045;
	bh=RRDNCFYEyS6IcK9i7xXeRmOQnS/b+iqLZzZVuL8mMnA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=S/4xi36nnyi6I1Wu3aJ1TD8vDCWVVRLC7vpFGI6d2w277Bc2aHYvaMGubfImoeXDf
	 UcILOsHZyfY25FTTewasbGVvABPzLm5hoHPHKAdaDG6feP1rXbjKuZBpzJKgnwSNMZ
	 t0QSUFiWFz3ZNlxbIe8J8Q79o2orJW3hRSgPXwm5C/V70yBKuvjXMLFYdTge3DeM8i
	 slLaHraD18UO6m6bLSVfsMrL6u+xw5IfGRDeF/+zmHxIiY0PNOhIMXL1Gj2r0jOihS
	 jPPNniyUTRLBV7dnBgfI6i56G0joYyj6pXG748gOqTjSSlhUiqR0mW34yorcfRGIyu
	 WVTbKjPGMrVuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09EB74C0ED;
	Sun, 22 Nov 2026 14:34:00 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:34:00 -0300
Subject: [PATCH] docs/translations/pt_BR: process: add
 programming-language.rst
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
Message-Id: <20261122-programming-language-pt-br-v1-1-a48a23d365ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBdYw/SwVxk7tDZ2GbOWVGUgv
 rtxO37w829QWYUr3JsNlFepMmWDuzTQv3xOjBLNQFfqnCPColNSP46SE34sWLw1ZcagOHiK5EN
 sb10LNijKg3x/88fz77qEN/fzeYR9PwCAU92PfgAAAA==
X-Change-ID: 20261122-programming-language-pt-br-fa2d2abd5465
To: linux-doc@vger.kernel.org
Cc: skhan@linuxfoundation.org, corbet@lwn.net, danielmaraboo@gmail.com, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795358039; l=4721;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=6WWYvKMSz1hBySp2gMR28ODo3vXl8sMA6fas4axl2Do=;
 b=3YYkUCci88Krd9Fa+NIWK3IpM6za2OowvhhfIIXOyUDz0oixJOcXC8BlfyJ3CeEJGzDc0JbTF
 Fxw1QS0sP6yBn05pN+Jtg1R4DxkWJ6WWa7wZ/m/30CXigm1wjayTJkx
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Add the Brazilian Portuguese translation of
Documentation/process/programming-language.rst, which documents the C
dialect used by the kernel and the attributes conventions, plus the Rust
support under CONFIG_RUST.

All eleven footnote definitions and their URLs are kept verbatim, as they
are what makes the references resolve.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
 Documentation/translations/pt_BR/process/index.rst |  1 +
 .../pt_BR/process/programming-language.rst         | 62 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index d072f7e46767..4a6037182473 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -46,6 +46,7 @@ devem estar familiarizados.
    Adicionando uma nova chamada de Sistema <adding-syscalls>
    Por que a classe de tipo "volatile" não deve ser usada <volatile-considered-harmful>
    Como não Deixar as ioctls malfeitas <botching-up-ioctls>
+   Linguagem de programação <programming-language>
 
 Guias de políticas e declarações de desenvolvedores
 ---------------------------------------------------
diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000000..4a909ef577e9
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _programming_language:
+
+Linguagem de programação
+========================
+
+O kernel Linux é escrito na linguagem de programação C [c-language]_. Mais
+precisamente, ele é tipicamente compilado com ``gcc`` [gcc]_ sob
+``-std=gnu11`` [gcc-c-dialect-options]_: o dialeto GNU do ISO C11.
+``clang`` [clang]_ também é suportado; veja a documentação em
+:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém muitas extensões à linguagem [gnu-extensions]_, e muitas
+delas são usadas dentro do kernel como algo corriqueiro.
+
+Atributos
+----------
+
+Uma das extensões comuns usadas em todo o kernel são os atributos
+[gcc-attribute-syntax]_. Atributos permitem introduzir semântica definida
+pela implementação a entidades da linguagem (como variáveis, funções ou
+tipos) sem precisar fazer mudanças sintáticas significativas na linguagem
+(por exemplo, adicionar uma nova palavra-chave) [n2049]_.
+
+Em alguns casos, os atributos são opcionais (ou seja, um compilador que não
+os suporte ainda deve produzir código adequado, mesmo que seja mais lento ou
+que não faça tantas verificações e diagnósticos em tempo de compilação).
+
+O kernel define pseudopalavras-chave (por exemplo, ``__pure``) em vez de usar
+diretamente a sintaxe de atributos do GNU (por exemplo,
+``__attribute__((__pure__))``) para detectar quais podem ser usados e/ou para
+encurtar o código.
+
+Consulte ``include/linux/compiler_attributes.h`` para mais informações.
+
+Rust
+----
+
+O kernel tem suporte à linguagem de programação Rust [rust-language]_ sob
+``CONFIG_RUST``. O código Rust é compilado com ``rustc`` [rustc]_ sob
+``--edition=2021`` [rust-editions]_. Edições são uma forma de introduzir
+pequenas mudanças na linguagem que não são compatíveis com versões
+anteriores.
+
+Além disso, alguns recursos instáveis [rust-unstable-features]_ são usados no
+kernel. Recursos instáveis podem mudar no futuro, portanto é uma meta
+importante chegar a um ponto em que apenas recursos estáveis sejam usados.
+
+Consulte Documentation/rust/index.rst para mais informações.
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

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-programming-language-pt-br-fa2d2abd5465

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


