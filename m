Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABF28643A
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372860; cv=none; b=URR7ZrvOe+RkKCGaDVXgw35D0ljvosU02ECegBzRyWAhmzKdQ3nLKrx1I4Svahne1foirT0+hmxr27v1wOOMhRE8aOdjQlPqSS+nnHXqD0mdCoXGyyk09WNJWLiQhjbrebYxIC+X+rB9l2EumgkvFKwzNDdf6n21bk0cmBU3GQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372860; c=relaxed/simple;
	bh=pT0BBIKmbcPXkG7sV6eVcZ3l4mTGDLJtLRJbGAhkXAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpXL4qsIBcjk2kQQXq8JKffQ0u9EmXwT+FExOIU4hOUfSobETaMCzPJZsnSuri9HR8bAjNuAiTJEhJQlh2IKqbFJ4kSaIzd3ujoiaHkkN82mnZQpJFr7JhCCRQcgr+iNtfPIbzs8zRqleVIDyAt1kr3ckhaoOrXFHk3/WNgrIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvjKfWMf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvjKfWMf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4837907f535so30604335e9.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 05:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772372857; x=1772977657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esvkzYXNn4nXiFCukMLBnXNWbKvfxii0mY7yeWdZGFE=;
        b=QvjKfWMfwyhz7Yx1FwEmluzTsn/lb+yXRmY8lblwYQFJd0tvCGvrbuNVu9qiNfGMPa
         e9AmAAzLC0ixdr2S5MhuXEiv/uAg+GFsNyAcYfCjC+ti42KhaR4l5u8/3DMQagztKLGJ
         lPI/fgBKibL6MUMbrFuhZ5ffEokASIBmb4RHPrpIcdjO36UyHQxesND6wCsdhoPYFu7K
         YoZ9o/MQVOVzXo1SugNxw4BTs7TD1r5GmVyl88yoz46WhVHoA75Sge2wZPx5nEOBr2kA
         VFl9jO4dGx7Q/301tx3TENqYQl8XFDN0j16i7rUjq3ZJsffRloMBWFyQ0bULrlLiXzuj
         qDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372857; x=1772977657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=esvkzYXNn4nXiFCukMLBnXNWbKvfxii0mY7yeWdZGFE=;
        b=d8UXPr9nk0QhUNr2kwbwGP0ggV7Qun6YbhKz5HrPVAyyqE/tcePpktsZLEUYW/frmF
         nfIYuzQV8krJpxQNX5g/J9tZYnjes8jo5EkJM9RW4wypmyZGBfhgunJQOANSUQBorLwA
         JUEd2CfIBaQrZy1ECIBHiNyOAERS8FC8pEpBLQrTWnCTO9kTiV898hWCL6riCcNL0UPd
         K6eA16rnvcvoge7Irr89T+0TrKxyhvEeYGZLm/oFTg67wxgCTYOJzK7B0lVMZzfrBC6e
         5bk5Dmn1CX7Sq9cU6Krmkm7pVWYc7a+GEWrA+yZfdRm2edBzJURKAkD9EM3Oue2IZYiE
         6r5g==
X-Forwarded-Encrypted: i=1; AJvYcCUzG7LTW446yylaTRkszQpPcEp+vs1lUinCnm8rE5pOX+/NYtb65RX+d7vZKhl2m9vvJrRSeCZrtdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx93TZuWpUY9F+9OPiQCzlLgCmZjJtr/WDaKEyvViq7AdWsQ22
	gkNB6sk7EGJR7USACq8adC6S9fvLAqL1SEs/xpB1YNyMbxkqavFENoeovFJyvv+bP+Q=
X-Gm-Gg: ATEYQzxoFW572mgc2lndK6oC1hHxM6Pgnu9mLiuGyYek/CTBItdb0+9Q6dZmSx+Gw1N
	5KAOgko10hYCLVu4ee/slLYhXrqw4s2boNJ3OjJ+rJQuiXgybwqdRPGwPfg5qBWEWVyv4boyrxr
	ppzFNKP3NSGeyVVc9b0KnmDaZHTy3EwBHDUmsLZAJ4bsQ1hYdS9CZLLmR4x77MyaONuKmK4xw6N
	pQZamzq4hx2sLT2ld0cJ/n4Rvn1MfvczFW7n3KEMLikHY7o86kWGk7a4J27myDjLDCXvOCxhDM2
	rdiBx4wHWK72/Bsah4VFfnDVCDSWSHqaQmqdLamqFmOlTtu74A87ccBokU6sy8w/wo9oWEJjHgE
	rL8o9Kb+lDl8vEpqBdNE0BBHtJGI5L+ZRfsAV2cJbWYRUytuhIknRyFe2ACJl0kYjj8VwG3SINX
	pZiqjdn6QGATdtrHKM1lwY1S7fW+uKMPwBbyiX54/JrrqByOSrNTHDayAK8buJU6UNHBVkJiY5C
	cFUfnR2+9GzAhMKePIP1mOUCCs0GDGS7o07V4raJFVZKQ==
X-Received: by 2002:a05:600c:6217:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-483c9bc5c06mr149916985e9.29.1772372856905;
        Sun, 01 Mar 2026 05:47:36 -0800 (PST)
Received: from localhost.localdomain ([80.233.57.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750607sm341579375e9.10.2026.03.01.05.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Mar 2026 05:47:35 -0800 (PST)
From: Edwin Toribio <edwin.toribio.j@gmail.com>
To: carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	edwin.toribio.j@gmail.com
Subject: [PATCH 2/2] docs: sp_SP: Add Spanish translation for Rust general information
Date: Sun,  1 Mar 2026 13:47:25 +0000
Message-ID: <20260301134728.64695-3-edwin.toribio.j@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301134728.64695-1-edwin.toribio.j@gmail.com>
References: <20260301134728.64695-1-edwin.toribio.j@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>
---
 .../sp_SP/rust/general-information.rst        | 178 ++++++++++++++++++
 .../translations/sp_SP/rust/quick-start.rst   |  13 +-
 2 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst

diff --git a/Documentation/translations/sp_SP/rust/general-information.rst b/Documentation/translations/sp_SP/rust/general-information.rst
new file mode 100644
index 000000000000..da2479d1a4c3
--- /dev/null
+++ b/Documentation/translations/sp_SP/rust/general-information.rst
@@ -0,0 +1,178 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-sp.rst
+
+:Original: Documentation/rust/general-information.rst
+:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
+
+.. _sp_rust_general_information:
+
+Información general
+===================
+
+Este documento contiene información útil que conviene conocer cuando se trabaja
+con el soporte de Rust en el kernel.
+
+
+``no_std``
+----------
+
+El soporte de Rust en el kernel solo puede vincularse a `core <https://doc.rust-lang.org/core/>`_,
+pero no a `std <https://doc.rust-lang.org/std/>`_. Las cajas (crates) destinadas
+al uso en el kernel deben optar por este comportamiento utilizando el atributo
+``#![no_std]``.
+
+
+.. _sp_rust_code_documentation:
+
+Documentación del código
+------------------------
+
+El código Rust del kernel se documenta mediante ``rustdoc``, su generador de
+documentación integrado.
+
+Los documentos HTML generados incluyen búsqueda integrada, elementos enlazados
+(ej. tipos, funciones, constantes), código fuente, etc. Pueden leerse en:
+
+    https://rust.docs.kernel.org
+
+Para linux-next, consulte:
+
+    https://rust.docs.kernel.org/next/
+
+También existen etiquetas para cada lanzamiento principal, ej.:
+
+    https://rust.docs.kernel.org/6.10/
+
+La documentación también puede generarse y leerse fácilmente de forma local.
+Esto es bastante rápido (del mismo orden que compilar el código en sí) y no se
+necesitan herramientas ni entornos especiales. Esto tiene la ventaja añadida de
+que estará adaptada a la configuración particular del kernel utilizada. Para
+generarla, utilice el objetivo ``rustdoc`` con la misma invocación utilizada
+para la compilación, ej.::
+
+    make LLVM=1 rustdoc
+
+Para leer la documentación localmente en su navegador web, ejecute por ejemplo::
+
+    xdg-open Documentation/output/rust/rustdoc/kernel/index.html
+
+Para aprender cómo escribir la documentación, consulte coding-guidelines.rst.
+
+
+Lints adicionales
+-----------------
+
+Aunque ``rustc`` es un compilador muy útil, existen algunos lints y análisis
+adicionales disponibles a través de ``clippy``, un linter de Rust. Para
+habilitarlo, pase ``CLIPPY=1`` a la misma invocación utilizada para la
+compilación, ej.::
+
+    make LLVM=1 CLIPPY=1
+
+Tenga en cuenta que Clippy puede cambiar la generación de código, por lo que no
+debe habilitarse mientras se compila un kernel de producción.
+
+
+Abstracciones vs. vínculos (bindings)
+-------------------------------------
+
+Las abstracciones son código Rust que envuelve la funcionalidad del kernel desde
+el lado de C.
+
+Para poder utilizar funciones y tipos del lado de C, se crean vínculos
+(bindings). Los vínculos son las declaraciones para Rust de esas funciones y
+tipos del lado de C.
+
+Por ejemplo, se podría escribir una abstracción ``Mutex`` en Rust que envuelva
+un ``struct mutex`` del lado de C y llame a sus funciones a través de los
+vínculos.
+
+Las abstracciones no están disponibles para todas las API internas y conceptos
+del kernel, pero se pretende que la cobertura se amplíe con el tiempo. Los
+módulos hoja ("Leaf") (ej. controladores/drivers) no deben utilizar los vínculos de C
+directamente. En su lugar, los subsistemas deben proporcionar abstracciones tan
+seguras como sea posible según sea necesario.
+
+.. code-block::
+
+                                                    rust/bindings/
+                                                   (rust/helpers/)
+
+                                                       include/ -----+ <-+
+                                                                     |   |
+      drivers/              rust/kernel/              +----------+ <-+   |
+        fs/                                           | bindgen  |       |
+       .../            +-------------------+          +----------+ --+   |
+                       |    Abstracciones  |                         |   |
+    +---------+        | +------+ +------+ |          +----------+   |   |
+    | mi_foo  | -----> | | foo  | | bar  | | -------> | Vínculos | <-+   |
+    | driver  | Segura | | sub- | | sub- | | Insegura |(Bindings)|       |
+    +---------+        | |sist. | |sist. | |          |          |       |
+         |             | +------+ +------+ |          |  caja    | <-----+
+         |             |   caja del kernel |          | bindings |       |
+         |             +-------------------+          +----------+       |
+         |                                                               |
+         +------------------# PROHIBIDO #--------------------------------+
+
+La idea principal es encapsular toda interacción directa con las API de C del
+kernel en abstracciones cuidadosamente revisadas y documentadas. Entonces, los
+usuarios de estas abstracciones no podrán introducir un comportamiento
+indefinido (UB) siempre que:
+
+#. Las abstracciones sean correctas ("sound").
+#. Cualquier bloque ``unsafe`` respete el contrato de seguridad necesario para
+   llamar a las operaciones dentro del bloque. Del mismo modo, cualquier
+   implementación ``unsafe impl`` respete el contrato de seguridad necesario
+   para implementar el rasgo (trait).
+
+Vínculos (Bindings)
+~~~~~~~~~~~~~~~~~~~
+
+Al incluir una cabecera C de ``include/`` en
+``rust/bindings/bindings_helper.h``, la herramienta ``bindgen`` generará
+automáticamente los vínculos para el subsistema incluido. Tras la compilación,
+vea los archivos de salida ``*_generated.rs`` en el directorio
+``rust/bindings/``.
+
+Para las partes de la cabecera C que ``bindgen`` no genera automáticamente, ej.
+funciones ``inline`` de C o macros no triviales, es aceptable añadir una pequeña
+función de envoltura (wrapper) en ``rust/helpers/`` para que esté disponible
+también para el lado de Rust.
+
+Abstracciones
+~~~~~~~~~~~~~
+
+Las abstracciones son la capa entre los vínculos y los usuarios dentro del
+kernel. Se encuentran en ``rust/kernel/`` y su función es encapsular el acceso
+inseguro (unsafe) a los vínculos en una API lo más segura posible que exponen a
+sus usuarios. Los usuarios de las abstracciones incluyen elementos como
+controladores o sistemas de archivos escritos en Rust.
+
+Además del aspecto de la seguridad, se supone que las abstracciones deben ser
+"ergonómicas", en el sentido de que convierten las interfaces de C en código
+Rust "idiomático". Ejemplos básicos son convertir la adquisición y liberación
+de recursos de C en constructores y destructores de Rust, o los códigos de error
+enteros de C en los tipos ``Result`` de Rust.
+
+
+Compilación condicional
+-----------------------
+
+El código Rust tiene acceso a la compilación condicional basada en la
+configuración del kernel:
+
+.. code-block:: rust
+
+    #[cfg(CONFIG_X)]       // Habilitado              (`y` o `m`)
+    #[cfg(CONFIG_X="y")]   // Habilitado como integrado (`y`)
+    #[cfg(CONFIG_X="m")]   // Habilitado como módulo    (`m`)
+    #[cfg(not(CONFIG_X))]  // Deshabilitado
+
+Para otros predicados que el ``cfg`` de Rust no soporta, ej. expresiones con
+comparaciones numéricas, se puede definir un nuevo símbolo Kconfig:
+
+.. code-block:: kconfig
+
+    config RUSTC_VERSION_MIN_107900
+        def_bool y if RUSTC_VERSION >= 107900
\ No newline at end of file
diff --git a/Documentation/translations/sp_SP/rust/quick-start.rst b/Documentation/translations/sp_SP/rust/quick-start.rst
index a54de6386dee..6c1bba092210 100644
--- a/Documentation/translations/sp_SP/rust/quick-start.rst
+++ b/Documentation/translations/sp_SP/rust/quick-start.rst
@@ -371,4 +371,15 @@ Hacking
 
 Para profundizar más, eche un vistazo al código fuente de los ejemplos en
 ``samples/rust/``, al código de soporte de Rust bajo ``rust/`` y al menú
-``Rust hacking`` bajo ``Kernel hacking
\ No newline at end of file
+``Rust hacking`` bajo ``Kernel hacking``.
+
+Si se utiliza GDB/Binutils y los símbolos de Rust no se decodifican (demangle)
+correctamente, la razón es que el conjunto de herramientas aún no soporta el
+nuevo esquema de decoración de nombres (mangling) v0 de Rust. Hay algunas
+soluciones:
+
+- Instalar una versión más reciente (GDB >= 10.2, Binutils >= 2.36).
+
+- Algunas versiones de GDB (ej. GDB 10.1 estándar) pueden utilizar los nombres
+  pre-decodificados incrustados en la información de depuración
+  (``CONFIG_DEBUG_INFO``).
\ No newline at end of file
-- 
2.53.0

