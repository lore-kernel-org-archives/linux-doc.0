Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE2D4086A
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372858; cv=none; b=b0TOfTbMLzc20ASHFPERydmqs4918YVCfIvihlf5dU9bsCgBcRUJCNNNYCieZw/lsz0U1XeK9dwnZwsAH8KZ3HKFbisvpYHiIxTzYsMP9q1bqqayO5h8Lm7k9bTIfzAhBV990dMxPjNUePLqePqx5Km/++viR2L8FjZmEfR67xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372858; c=relaxed/simple;
	bh=iQCRDYrTqyJ9dVtn9aAhMYUxsgQvTn+HtPE2VYQLY3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHmAhMbiphKpPYAmwesRrG5h8c6iQwn5IG1F/qDnPSvtUaAcfDro/Q0OtjVICeTIA2G5eyrAySZdilvAGIuay2JDHSBbsBnch4Rv+tLA8YxMyVCBD6xjwKJAdzWN9qcYLiKMgufKpCwydRnxmZK5x9keijRBRebzINF+Dp2Nhss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfOHDFLx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfOHDFLx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso29809865e9.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772372855; x=1772977655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pHKbYkDyllRlzo7s96/OTdpZ82J0lDlaN8a5DW3OVo=;
        b=NfOHDFLx+12nw+iD0KD+ihJwJ2y1g78IcgskeM0RT45z8VP2RoswJr7K8m93QasErO
         UmeCdp7i+ePyeP8kGlPFJOTBfYWp/E80SIK5glKNAhqn943bPBfcOyc7K+++gEl4UM+i
         4LmBJbRd50+09DYPisKfqJNE8SCkukYo+7baUQI49RkeIHvdRzGwwHb7CbpwiYFGS7mn
         9VL3LoxQLY5mIrwYmWxBbVchiQOHmrB9N0wpVqkjQrZ+Ao3mgCTZ1ZgdcE1flTCcxmAl
         TloQgKtWZziM/JmvmiXUknErtNEj/aWONgfkmD4zoGbAEOcDsQ29EtVU7jH/h5tj7NPi
         rGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372855; x=1772977655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9pHKbYkDyllRlzo7s96/OTdpZ82J0lDlaN8a5DW3OVo=;
        b=CZvZc2ZfcL7FSSa00DsZ8dlU8awW3CqsQ3ocQF5g3wwT7KWH2WXAPoEr5KIl3E3gB2
         W4oB1nlx3uIn8SmNHtpLD9Th9z7BOAq3wsqM11ICCFS3SpXrCRrekLBD2xGF2qkyrr5z
         Cm/lTG0DriaiuR5wutTL5H+Zrdm4Lv215wvez6IPUjiH6b+02bVDxdXPXPY+OR8VvJv+
         HNiF2USmEIoEfRfN1/v4prGbNMe66aQrZL0DapgEFhHv3EkvstMq2eIQs0MJXfF5SO9j
         ZWLmS+1c87UFyIz6HWFFUsT8I6/NxEd8daD2iy7e1sHJOgNySDtdHDbDoBJHC/EivCeN
         Xk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdwjhkVH09JYYHuB4A/9qcDijQGfI3v121YAhOVv1lLKAejbQSA2m43cjtXQ9kLNctS1M9aUstxmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzttxQbEYPGocOzEkx3rQ0ZqVjY9hugf4mkqegEZoJUB5LUd80t
	6L0d+6zPsNBvUvDhYYC2n6dGJ9JNvAuSzwDmmKgsaH3/sZO7Ct/a7jeG
X-Gm-Gg: ATEYQzzrsw2Sl5GydFiF31PBKQX9QIiMUfa/2SK5DAv7VKfu1CSA9zF3PHE0+mQF8Si
	7xOlEpL/hqrzNHI4oDBQfMX2w3tCYucsAK2MGa/bc9gD66iKt2wt+kjmX0xkYWdFGxXliLojboZ
	yzcHWd956QM5cB4Yi2VbmTKT7D+KiFLMpm2iOGOwpSwhkqCS8hVBCD8788W9ypvTuuDnU2BRvaZ
	KD0wBnH8MDSEy6LLyQmIfW/lwRIk64uo44q/IhbphEJXgXCTiYJLzKABArlRPK2qktFhQmkHAML
	0ohHlKJ90IF+31Qby8kAxqzh09FNrKE1ULzC3j1zvvUFzf4SE8QKCbaqELgezBo8U3vGtbndw9w
	/Td7CuHnvOUL9dgEdC/4uADzNKTsIKEEmOC08VWiawLjAQ1em/vU+/71QajsoYiozwQM0d+RsD5
	B2ydla/Hq69VOP3MdR+du7rafPQYbk0LLz/D6RdBr/akmOnuBEGMEEg+vKBV8v1qJoBx8fJOk0t
	DEgacTY+5DHlnTlH+8EWlbujRJrxuqCtqNIO4eX1lW2rA==
X-Received: by 2002:a05:600c:6085:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483c9bb4ce4mr165861415e9.15.1772372855081;
        Sun, 01 Mar 2026 05:47:35 -0800 (PST)
Received: from localhost.localdomain ([80.233.57.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750607sm341579375e9.10.2026.03.01.05.47.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Mar 2026 05:47:34 -0800 (PST)
From: Edwin Toribio <edwin.toribio.j@gmail.com>
To: carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	edwin.toribio.j@gmail.com
Subject: [PATCH 1/2] docs: sp_SP: Add Spanish translation for Rust quick-start
Date: Sun,  1 Mar 2026 13:47:24 +0000
Message-ID: <20260301134728.64695-2-edwin.toribio.j@gmail.com>
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
 .../translations/sp_SP/rust/quick-start.rst   | 374 ++++++++++++++++++
 1 file changed, 374 insertions(+)
 create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst

diff --git a/Documentation/translations/sp_SP/rust/quick-start.rst b/Documentation/translations/sp_SP/rust/quick-start.rst
new file mode 100644
index 000000000000..a54de6386dee
--- /dev/null
+++ b/Documentation/translations/sp_SP/rust/quick-start.rst
@@ -0,0 +1,374 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-sp.rst
+
+:Original: Documentation/rust/quick-start.rst
+:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
+
+.. _sp_rust_quick_start:
+
+Guía de inicio rápido
+=====================
+
+Este documento describe cómo empezar con el desarrollo del kernel en Rust.
+
+Existen varias formas de instalar el conjunto de herramientas (toolchain) de Rust
+necesario para el desarrollo del kernel. Una forma sencilla es utilizar los
+paquetes de su distribución de Linux si son adecuados; la primera sección a
+continuación explica este enfoque. Una ventaja de este método es que,
+normalmente, la distribución hará coincidir el LLVM utilizado por Rust y Clang.
+
+Otra forma es utilizar las versiones estables precompiladas de LLVM+Rust
+proporcionadas en `kernel.org <https://kernel.org/pub/tools/llvm/rust/>`_.
+Estas son las mismas herramientas de LLVM ligeras y rápidas de
+:ref:`Obtener LLVM <getting_llvm>` con versiones de Rust añadidas que son
+compatibles con Rust para Linux. Se proporcionan dos conjuntos: el "LLVM más
+reciente" (latest LLVM) y el "LLVM coincidente" (matching LLVM) (consulte el
+enlace para más información).
+
+Alternativamente, las dos secciones siguientes de "Requisitos" explican cada
+componente y cómo instalarlos a través de ``rustup``, los instaladores
+independientes de Rust y/o compilándolos.
+
+El resto del documento explica otros aspectos sobre cómo empezar.
+
+
+Distribuciones
+--------------
+
+Arch Linux
+**********
+
+Arch Linux proporciona versiones recientes de Rust y, por lo tanto, debería
+funcionar directamente, ej.::
+
+    pacman -S rust rust-src rust-bindgen
+
+
+Debian
+******
+
+Debian 13 (Trixie), así como Testing y Debian Unstable (Sid) proporcionan
+versiones recientes de Rust y, por lo tanto, deberían funcionar directamente, ej.::
+
+    apt install rustc rust-src bindgen rustfmt rust-clippy
+
+
+Fedora Linux
+************
+
+Fedora Linux proporciona versiones recientes de Rust y, por lo tanto, debería
+funcionar directamente, ej.::
+
+    dnf install rust rust-src bindgen-cli rustfmt clippy
+
+
+Gentoo Linux
+************
+
+Gentoo Linux (y especialmente la rama de pruebas) proporciona versiones
+recientes de Rust y, por lo tanto, debería funcionar directamente, ej.::
+
+    USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
+
+Es posible que sea necesario configurar ``LIBCLANG_PATH``.
+
+
+Nix
+***
+
+Nix (canal unstable) proporciona versiones recientes de Rust y, por lo tanto,
+debería funcionar directamente, ej.::
+
+    { pkgs ? import <nixpkgs> {} }:
+    pkgs.mkShell {
+      nativeBuildInputs = with pkgs; [ rustc rust-bindgen rustfmt clippy ];
+      RUST_LIB_SRC = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
+    }
+
+
+openSUSE
+********
+
+openSUSE Slowroll y openSUSE Tumbleweed proporcionan versiones recientes de Rust
+y, por lo tanto, deberían funcionar directamente, ej.::
+
+    zypper install rust rust1.79-src rust-bindgen clang
+
+
+Ubuntu
+******
+
+25.04
+~~~~~
+
+Las versiones más recientes de Ubuntu proporcionan versiones recientes de Rust
+y, por lo tanto, deberían funcionar directamente, ej.::
+
+    apt install rustc rust-src bindgen rustfmt rust-clippy
+
+Además, es necesario configurar ``RUST_LIB_SRC``, ej.::
+
+    RUST_LIB_SRC=/usr/src/rustc-$(rustc --version | cut -d' ' -f2)/library
+
+Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
+
+
+24.04 LTS y anteriores
+~~~~~~~~~~~~~~~~~~~~~~
+
+Aunque Ubuntu 24.04 LTS y versiones anteriores todavía proporcionan versiones
+recientes de Rust, requieren que se establezca alguna configuración adicional,
+utilizando los paquetes con versión, ej.::
+
+    apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
+        rust-1.80-clippy
+    ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
+    ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
+
+Ninguno de estos paquetes establece sus herramientas como predeterminadas; por
+lo tanto, deben especificarse explícitamente, ej.::
+
+    make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
+        CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
+
+Alternativamente, modifique la variable ``PATH`` para colocar los binarios de
+Rust 1.80 primero y establezca ``bindgen`` como predeterminado, ej.::
+
+    PATH=/usr/lib/rust-1.80/bin:$PATH
+    update-alternatives --install /usr/bin/bindgen bindgen \
+        /usr/bin/bindgen-0.65 100
+    update-alternatives --set bindgen /usr/bin/bindgen-0.65
+
+``RUST_LIB_SRC`` debe configurarse cuando se usan los paquetes con versión, ej.::
+
+    RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
+
+Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
+
+Además, ``bindgen-0.65`` está disponible en versiones más nuevas (24.04 LTS y
+24.10), pero puede no estar disponible en las más antiguas (20.04 LTS y 22.04 LTS),
+por lo que es posible que sea necesario compilar ``bindgen`` manualmente
+(consulte más abajo).
+
+
+Requisitos: Compilación
+-----------------------
+
+Esta sección explica cómo obtener las herramientas necesarias para la compilación.
+
+Para comprobar fácilmente si se cumplen los requisitos, se puede utilizar el
+siguiente objetivo (target)::
+
+    make LLVM=1 rustavailable
+
+Esto activa la misma lógica utilizada por Kconfig para determinar si debe
+habilitarse ``RUST_IS_AVAILABLE``; pero también explica por qué no en caso
+de que así sea.
+
+
+rustc
+*****
+
+Se requiere una versión reciente del compilador de Rust.
+
+Si se está utilizando ``rustup``, entre en el directorio de compilación del
+kernel (o use el argumento ``--path=<build-dir>`` para el subcomando ``set``)
+y ejecute, por ejemplo::
+
+    rustup override set stable
+
+Esto configurará su directorio de trabajo para usar la versión dada de
+``rustc`` sin afectar a su conjunto de herramientas predeterminado.
+
+Tenga en cuenta que la anulación (override) se aplica al directorio de trabajo
+actual (y sus subdirectorios).
+
+Si no está utilizando ``rustup``, obtenga un instalador independiente de:
+
+    https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
+
+
+Código fuente de la biblioteca estándar de Rust
+***********************************************
+
+Se requiere el código fuente de la biblioteca estándar de Rust porque el sistema
+de compilación compilará de forma cruzada ``core``.
+
+Si se está utilizando ``rustup``, ejecute::
+
+    rustup component add rust-src
+
+Los componentes se instalan por conjunto de herramientas, por lo que actualizar
+la versión del compilador de Rust más adelante requiere volver a añadir el
+componente.
+
+De lo contrario, si se utiliza un instalador independiente, el árbol de fuentes
+de Rust puede descargarse en la carpeta de instalación del conjunto de
+herramientas::
+
+    curl -L "https://static.rust-lang.org/dist/rust-src-$(rustc --version | cut -d' ' -f2).tar.gz" |
+        tar -xzf - -C "$(rustc --print sysroot)/lib" \
+        "rust-src-$(rustc --version | cut -d' ' -f2)/rust-src/lib/" \
+        --strip-components=3
+
+En este caso, actualizar la versión del compilador de Rust más adelante requiere
+actualizar manualmente el árbol de fuentes (esto se puede hacer eliminando
+``$(rustc --print sysroot)/lib/rustlib/src/rust`` y volviendo a ejecutar el
+comando anterior).
+
+
+libclang
+********
+
+``libclang`` (parte de LLVM) es utilizado por ``bindgen`` para entender el
+código C en el kernel, lo que significa que LLVM debe estar instalado; al igual
+que cuando el kernel se compila con ``LLVM=1``.
+
+Es probable que las distribuciones de Linux tengan una adecuada disponible, por
+lo que es mejor comprobarlo primero.
+
+También hay algunos binarios para varios sistemas y arquitecturas subidos a:
+
+    https://releases.llvm.org/download.html
+
+De lo contrario, compilar LLVM lleva bastante tiempo, pero no es un proceso
+complejo:
+
+    https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
+
+Consulte Documentation/kbuild/llvm.rst para obtener más información y otras
+formas de obtener versiones precompiladas y paquetes de distribuciones.
+
+
+bindgen
+*******
+
+Los vínculos (bindings) con la parte de C del kernel se generan en tiempo de
+compilación utilizando la herramienta ``bindgen``.
+
+Instálela, por ejemplo, mediante (tenga en cuenta que esto descargará y
+compilará la herramienta desde el código fuente)::
+
+    cargo install --locked bindgen-cli
+
+``bindgen`` utiliza la caja (crate) ``clang-sys`` para encontrar un
+``libclang`` adecuado (que puede estar vinculado estáticamente, dinámicamente
+o cargado en tiempo de ejecución). Por defecto, el comando ``cargo`` anterior
+producirá un binario ``bindgen`` que cargará ``libclang`` en tiempo de
+ejecución. Si no se encuentra (o si se debe usar un ``libclang`` diferente al
+encontrado), el proceso se puede ajustar, ej. utilizando la variable de entorno
+``LIBCLANG_PATH``. Para más detalles, consulte la documentación de
+``clang-sys`` en:
+
+    https://github.com/KyleMayes/clang-sys#linking
+
+    https://github.com/KyleMayes/clang-sys#environment-variables
+
+
+Requisitos: Desarrollo
+----------------------
+
+Esta sección explica cómo obtener las herramientas necesarias para el
+desarrollo. Es decir, no son necesarias cuando solo se compila el kernel.
+
+
+rustfmt
+*******
+
+La herramienta ``rustfmt`` se utiliza para formatear automáticamente todo el
+código Rust del kernel, incluyendo los vínculos de C generados (para más
+detalles, consulte coding-guidelines.rst).
+
+Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
+lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
+puede instalarse manualmente::
+
+    rustup component add rustfmt
+
+Los instaladores independientes también vienen con ``rustfmt``.
+
+
+clippy
+******
+
+``clippy`` es un linter de Rust. Ejecutarlo proporciona advertencias
+adicionales para el código Rust. Se puede ejecutar pasando ``CLIPPY=1`` a
+``make`` (para más detalles, consulte general-information.rst).
+
+Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
+lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
+puede instalarse manualmente::
+
+    rustup component add clippy
+
+Los instaladores independientes también vienen con ``clippy``.
+
+
+rustdoc
+*******
+
+``rustdoc`` es la herramienta de documentación para Rust. Genera una atractiva
+documentación en HTML para el código Rust (para más detalles, consulte
+general-information.rst).
+
+``rustdoc`` también se utiliza para probar los ejemplos proporcionados en el
+código Rust documentado (llamados doctests o pruebas de documentación). El
+objetivo de Make ``rusttest`` utiliza esta función.
+
+Si se utiliza ``rustup``, todos los perfiles ya instalan la herramienta, por
+lo que no es necesario hacer nada.
+
+Los instaladores independientes también vienen con ``rustdoc``.
+
+
+rust-analyzer
+*************
+
+El servidor de lenguaje `rust-analyzer <https://rust-analyzer.github.io/>`_
+puede utilizarse con muchos editores para habilitar el resaltado de sintaxis,
+el completado, el salto a la definición y otras funciones.
+
+``rust-analyzer`` necesita un archivo de configuración, ``rust-project.json``,
+que puede generarse mediante el objetivo de Make ``rust-analyzer``::
+
+    make LLVM=1 rust-analyzer
+
+
+Configuración
+-------------
+
+El ``Rust support`` (``CONFIG_RUST``) debe habilitarse en el menú
+``General setup``. La opción solo se muestra si se encuentra un conjunto de
+herramientas de Rust adecuado (véase arriba), siempre que se cumplan los demás
+requisitos. A su vez, esto hará visibles el resto de las opciones que
+dependen de Rust.
+
+A continuación, vaya a::
+
+    Kernel hacking
+        -> Sample kernel code
+            -> Rust samples
+
+Y habilite algunos módulos de ejemplo, ya sea como integrados (built-in) o
+como cargables.
+
+
+Compilación
+-----------
+
+Compilar un kernel con un conjunto de herramientas LLVM completo es la
+configuración mejor soportada en este momento. Es decir::
+
+    make LLVM=1
+
+El uso de GCC también funciona para algunas configuraciones, pero es muy
+experimental en este momento.
+
+
+Hacking
+-------
+
+Para profundizar más, eche un vistazo al código fuente de los ejemplos en
+``samples/rust/``, al código de soporte de Rust bajo ``rust/`` y al menú
+``Rust hacking`` bajo ``Kernel hacking
\ No newline at end of file
-- 
2.53.0

