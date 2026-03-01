Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227421B424F
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772406364; cv=none; b=UMJiyFIGo4YQz5/6OBvlYT3eLADWr3p0Xq7wAiGRznMU/A3n8cgOPJoLSRd5WzcSUZ5YK4iDoC8xIV7AnLubakF7dr/JMzmhybzj5lsQq0JU2uppTzM3BRJlh58eXxHykL+CX7uoBxNxCTvzuRhDOEJygpQRKNoFhpyruXCjA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772406364; c=relaxed/simple;
	bh=pOIUKDTUjUbpyPU3O+HIMnYH6Zq8V7KhqtaeAqv/VUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZiBClhGEg47aRFo4VCwYLqgNhDXwF+yKNaKeIlmElddcE/8uXVdplH491tVFEhLgb5W6FEn22uCag7z5k9CzehcgNacjq98uifXSnSA0sEedfmm/5j1cVzFveA7FBC8loxvANHe4yG4tT6ejBJOWCnT/2aryjRMyoT10v3XeBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD/o3MX0; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD/o3MX0"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-126ea4b77adso4852747c88.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 15:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772406362; x=1773011162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlmvLRatHGF+0gDvGgxFwo8OQAFPUVNw5CKGVXrBMNY=;
        b=gD/o3MX0LLnnQv1i9wVh4mYRp5+aRG+b316avdhftXajMIsc55uVjTxDGrXXNtA5Mr
         +wfipGBtC644MhuSNsrkJ0rd3DWPBTzM1jnEuoEeOXaeSjd03Om1065xa0At9+EUZTEM
         /j+J1+oUnyeSU/+OeiH2Hjq5J/Z70XIgY7dxqzki4mZ5axdMFXA+xfF8pyju82rr0zHh
         7Y4XZY6hwzbH4cUNUJlYYisA72gmmDTL7dCXZDWTqGbYjpREEom2oMyqMRgULdYvIJq3
         RoiDFcqMb3yNLBT4Nyo/L+bgIY7TtJn2en6jOr4DqCZMZ3tWAU7H2AGwNXJJkqcn+mXV
         knJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772406362; x=1773011162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlmvLRatHGF+0gDvGgxFwo8OQAFPUVNw5CKGVXrBMNY=;
        b=ItfeJQs7ZPP51JxvIEdxYo3VQr6BNzXMqKkc/OoV8OTI9rkYCEVKZcECGe2+/5lyOC
         i4WveE4h+2lum8pMEx7WhKNgsazS7lJNpxlAYlBNfRqdr1KZbUmf3SvspSekyepHeZbV
         lZv09EhDeWwx8kKPho7eJjZmbLm5DbkqF1uSyjgPCTP8AYX1bRUmSXZPrsgSPmbIwko6
         rauvEs28cSZPcikfRFZNygH/T9NYXZ496lOnIxYjc0nO9BoIc4Sq+A9DHOMeoeqNUfgk
         TyUsqhVd00On7kjOGe4+uJkqBt9YBeKlr8BPtexw3H9GSQwd6kUDtfKbAV0C+xkWrch9
         Fmhw==
X-Forwarded-Encrypted: i=1; AJvYcCWkv718O3QjlKlSGzMuElU/5RdtnzqMX+fz0rW2VE9AtCQ2DLH1CDSCx0mFSPf4UU18OMf6e3V8C4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXb0Gc3WjYCRVeRZdvjDvDMF2iEVusP3wVjl3A+Yq2FsfVOJNb
	QALQDpdH9+YuuWXJ3gFPSHUSgh5NgfiyRvrqqdGgRh5b//p+AwWmli1N2401Dw==
X-Gm-Gg: ATEYQzxq0KM8eimvmctsdhCnmf/h4GexiL5pXQHjLfJ/9FTsEqxFeMNBWBC2B1rXqaI
	hTbJQBsuUe7GlFHvzM3HUWi/D/GxvH2Gk+8W1q/pigvqCkkcFznWk0CXU/xHrQjsJ2Rr/TAwudp
	t9StRmf9oz77MWCFI7o/ws9IaROjfBpRNq7RjPJ0XYX5eS8kG+ud6QvrGciN2FNpllxKVZuHF8K
	hzk2ApPex/qut3Laau1QURzPcCDkl1yuWNrBFwLM0UTvgHMoGP0P9mkFq1KYqnMwd02TQI5bkWf
	ZMJ9CXOfIHvfrLw1XtFk3C+xSYz7MENXhMlXSNoIovvs+vQrfsI2GbBnTpPMEIhzcDo0zxywRQp
	RLKBspPpxp3Mz/TS0LBfatbomxVJ+44lsubVs10j9L3Jh+yNY3RQ/JgnkNjveZdzsclq6RH6xHt
	sht5nw4b/o7U1ON2yPjy9MSK+9aVkM9i1gySSlFFsTwTm35y34Vw==
X-Received: by 2002:a05:7022:4591:b0:123:3488:89a3 with SMTP id a92af1059eb24-1278fc24c3amr3384702c88.24.1772406362023;
        Sun, 01 Mar 2026 15:06:02 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899df391sm13781054c88.5.2026.03.01.15.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 15:06:01 -0800 (PST)
Message-ID: <4246f180-466d-4421-9d90-7f3adb44f757@gmail.com>
Date: Sun, 1 Mar 2026 15:05:59 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: sp_SP: Add Spanish translation for Rust
 quick-start
To: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260301134728.64695-1-edwin.toribio.j@gmail.com>
 <20260301134728.64695-2-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260301134728.64695-2-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Edwin,

On 3/1/26 05:47, Edwin Toribio wrote:
> Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>
> ---
>   .../translations/sp_SP/rust/quick-start.rst   | 374 ++++++++++++++++++
>   1 file changed, 374 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst
>
> diff --git a/Documentation/translations/sp_SP/rust/quick-start.rst b/Documentation/translations/sp_SP/rust/quick-start.rst
> new file mode 100644
> index 000000000000..a54de6386dee
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/rust/quick-start.rst
> @@ -0,0 +1,374 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-sp.rst
> +
> +:Original: Documentation/rust/quick-start.rst
> +:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
> +
> +.. _sp_rust_quick_start:
> +
> +Guía de inicio rápido
> +=====================
> +
> +Este documento describe cómo empezar con el desarrollo del kernel en Rust.
> +
> +Existen varias formas de instalar el conjunto de herramientas (toolchain) de Rust
> +necesario para el desarrollo del kernel. Una forma sencilla es utilizar los
> +paquetes de su distribución de Linux si son adecuados; la primera sección a
> +continuación explica este enfoque. Una ventaja de este método es que,
> +normalmente, la distribución hará coincidir el LLVM utilizado por Rust y Clang.
> +
> +Otra forma es utilizar las versiones estables precompiladas de LLVM+Rust
> +proporcionadas en `kernel.org <https://kernel.org/pub/tools/llvm/rust/>`_.
> +Estas son las mismas herramientas de LLVM ligeras y rápidas de
> +:ref:`Obtener LLVM <getting_llvm>` con versiones de Rust añadidas que son
> +compatibles con Rust para Linux. Se proporcionan dos conjuntos: el "LLVM más
> +reciente" (latest LLVM) y el "LLVM coincidente" (matching LLVM) (consulte el
> +enlace para más información).
> +
> +Alternativamente, las dos secciones siguientes de "Requisitos" explican cada
> +componente y cómo instalarlos a través de ``rustup``, los instaladores
> +independientes de Rust y/o compilándolos.
> +
> +El resto del documento explica otros aspectos sobre cómo empezar.
> +
> +
> +Distribuciones
> +--------------
> +
> +Arch Linux
> +**********
> +
> +Arch Linux proporciona versiones recientes de Rust y, por lo tanto, debería
> +funcionar directamente, ej.::
> +
> +    pacman -S rust rust-src rust-bindgen
> +
> +
> +Debian
> +******
> +
> +Debian 13 (Trixie), así como Testing y Debian Unstable (Sid) proporcionan
> +versiones recientes de Rust y, por lo tanto, deberían funcionar directamente, ej.::
> +
> +    apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +
> +Fedora Linux
> +************
> +
> +Fedora Linux proporciona versiones recientes de Rust y, por lo tanto, debería
> +funcionar directamente, ej.::
> +
> +    dnf install rust rust-src bindgen-cli rustfmt clippy
> +
> +
> +Gentoo Linux
> +************
> +
> +Gentoo Linux (y especialmente la rama de pruebas) proporciona versiones
> +recientes de Rust y, por lo tanto, debería funcionar directamente, ej.::
> +
> +    USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
> +
> +Es posible que sea necesario configurar ``LIBCLANG_PATH``.
> +
> +
> +Nix
> +***
> +
> +Nix (canal unstable) proporciona versiones recientes de Rust y, por lo tanto,
> +debería funcionar directamente, ej.::
> +
> +    { pkgs ? import <nixpkgs> {} }:
> +    pkgs.mkShell {
> +      nativeBuildInputs = with pkgs; [ rustc rust-bindgen rustfmt clippy ];
> +      RUST_LIB_SRC = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
> +    }
> +
> +
> +openSUSE
> +********
> +
> +openSUSE Slowroll y openSUSE Tumbleweed proporcionan versiones recientes de Rust
> +y, por lo tanto, deberían funcionar directamente, ej.::
> +
> +    zypper install rust rust1.79-src rust-bindgen clang
> +
> +
> +Ubuntu
> +******
> +
> +25.04
> +~~~~~
> +
> +Las versiones más recientes de Ubuntu proporcionan versiones recientes de Rust
> +y, por lo tanto, deberían funcionar directamente, ej.::
> +
> +    apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +Además, es necesario configurar ``RUST_LIB_SRC``, ej.::
> +
> +    RUST_LIB_SRC=/usr/src/rustc-$(rustc --version | cut -d' ' -f2)/library
> +
> +Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
> +
> +
> +24.04 LTS y anteriores
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Aunque Ubuntu 24.04 LTS y versiones anteriores todavía proporcionan versiones
> +recientes de Rust, requieren que se establezca alguna configuración adicional,
> +utilizando los paquetes con versión, ej.::
> +
> +    apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
> +        rust-1.80-clippy
> +    ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
> +    ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
> +
> +Ninguno de estos paquetes establece sus herramientas como predeterminadas; por
> +lo tanto, deben especificarse explícitamente, ej.::
> +
> +    make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
> +        CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
> +
> +Alternativamente, modifique la variable ``PATH`` para colocar los binarios de
> +Rust 1.80 primero y establezca ``bindgen`` como predeterminado, ej.::
> +
> +    PATH=/usr/lib/rust-1.80/bin:$PATH
> +    update-alternatives --install /usr/bin/bindgen bindgen \
> +        /usr/bin/bindgen-0.65 100
> +    update-alternatives --set bindgen /usr/bin/bindgen-0.65
> +
> +``RUST_LIB_SRC`` debe configurarse cuando se usan los paquetes con versión, ej.::
> +
> +    RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
> +
> +Para mayor comodidad, ``RUST_LIB_SRC`` puede exportarse al entorno global.
> +
> +Además, ``bindgen-0.65`` está disponible en versiones más nuevas (24.04 LTS y
> +24.10), pero puede no estar disponible en las más antiguas (20.04 LTS y 22.04 LTS),
> +por lo que es posible que sea necesario compilar ``bindgen`` manualmente
> +(consulte más abajo).
> +
> +
> +Requisitos: Compilación
> +-----------------------
> +
> +Esta sección explica cómo obtener las herramientas necesarias para la compilación.
> +
> +Para comprobar fácilmente si se cumplen los requisitos, se puede utilizar el
> +siguiente objetivo (target)::
> +
> +    make LLVM=1 rustavailable
> +
> +Esto activa la misma lógica utilizada por Kconfig para determinar si debe
> +habilitarse ``RUST_IS_AVAILABLE``; pero también explica por qué no en caso
> +de que así sea.
> +
> +
> +rustc
> +*****
> +
> +Se requiere una versión reciente del compilador de Rust.
> +
> +Si se está utilizando ``rustup``, entre en el directorio de compilación del
> +kernel (o use el argumento ``--path=<build-dir>`` para el subcomando ``set``)
> +y ejecute, por ejemplo::
> +
> +    rustup override set stable
> +
> +Esto configurará su directorio de trabajo para usar la versión dada de
> +``rustc`` sin afectar a su conjunto de herramientas predeterminado.
> +
> +Tenga en cuenta que la anulación (override) se aplica al directorio de trabajo
> +actual (y sus subdirectorios).
> +
> +Si no está utilizando ``rustup``, obtenga un instalador independiente de:
> +
> +    https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
> +
> +
> +Código fuente de la biblioteca estándar de Rust
> +***********************************************
> +
> +Se requiere el código fuente de la biblioteca estándar de Rust porque el sistema
> +de compilación compilará de forma cruzada ``core``.
> +
> +Si se está utilizando ``rustup``, ejecute::
> +
> +    rustup component add rust-src
> +
> +Los componentes se instalan por conjunto de herramientas, por lo que actualizar
> +la versión del compilador de Rust más adelante requiere volver a añadir el
> +componente.
> +
> +De lo contrario, si se utiliza un instalador independiente, el árbol de fuentes
> +de Rust puede descargarse en la carpeta de instalación del conjunto de
> +herramientas::
> +
> +    curl -L "https://static.rust-lang.org/dist/rust-src-$(rustc --version | cut -d' ' -f2).tar.gz" |
> +        tar -xzf - -C "$(rustc --print sysroot)/lib" \
> +        "rust-src-$(rustc --version | cut -d' ' -f2)/rust-src/lib/" \
> +        --strip-components=3
> +
> +En este caso, actualizar la versión del compilador de Rust más adelante requiere
> +actualizar manualmente el árbol de fuentes (esto se puede hacer eliminando
> +``$(rustc --print sysroot)/lib/rustlib/src/rust`` y volviendo a ejecutar el
> +comando anterior).
> +
> +
> +libclang
> +********
> +
> +``libclang`` (parte de LLVM) es utilizado por ``bindgen`` para entender el
> +código C en el kernel, lo que significa que LLVM debe estar instalado; al igual
> +que cuando el kernel se compila con ``LLVM=1``.
> +
> +Es probable que las distribuciones de Linux tengan una adecuada disponible, por
> +lo que es mejor comprobarlo primero.
> +
> +También hay algunos binarios para varios sistemas y arquitecturas subidos a:
> +
> +    https://releases.llvm.org/download.html
> +
> +De lo contrario, compilar LLVM lleva bastante tiempo, pero no es un proceso
> +complejo:
> +
> +    https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
> +
> +Consulte Documentation/kbuild/llvm.rst para obtener más información y otras
> +formas de obtener versiones precompiladas y paquetes de distribuciones.
> +
> +
> +bindgen
> +*******
> +
> +Los vínculos (bindings) con la parte de C del kernel se generan en tiempo de
> +compilación utilizando la herramienta ``bindgen``.
> +
> +Instálela, por ejemplo, mediante (tenga en cuenta que esto descargará y
> +compilará la herramienta desde el código fuente)::
> +
> +    cargo install --locked bindgen-cli
> +
> +``bindgen`` utiliza la caja (crate) ``clang-sys`` para encontrar un
> +``libclang`` adecuado (que puede estar vinculado estáticamente, dinámicamente
> +o cargado en tiempo de ejecución). Por defecto, el comando ``cargo`` anterior
> +producirá un binario ``bindgen`` que cargará ``libclang`` en tiempo de
> +ejecución. Si no se encuentra (o si se debe usar un ``libclang`` diferente al
> +encontrado), el proceso se puede ajustar, ej. utilizando la variable de entorno
> +``LIBCLANG_PATH``. Para más detalles, consulte la documentación de
> +``clang-sys`` en:
> +
> +    https://github.com/KyleMayes/clang-sys#linking
> +
> +    https://github.com/KyleMayes/clang-sys#environment-variables
> +
> +
> +Requisitos: Desarrollo
> +----------------------
> +
> +Esta sección explica cómo obtener las herramientas necesarias para el
> +desarrollo. Es decir, no son necesarias cuando solo se compila el kernel.
> +
> +
> +rustfmt
> +*******
> +
> +La herramienta ``rustfmt`` se utiliza para formatear automáticamente todo el
> +código Rust del kernel, incluyendo los vínculos de C generados (para más
> +detalles, consulte coding-guidelines.rst).
> +
> +Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
> +lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
> +puede instalarse manualmente::
> +
> +    rustup component add rustfmt
> +
> +Los instaladores independientes también vienen con ``rustfmt``.
> +
> +
> +clippy
> +******
> +
> +``clippy`` es un linter de Rust. Ejecutarlo proporciona advertencias
> +adicionales para el código Rust. Se puede ejecutar pasando ``CLIPPY=1`` a
> +``make`` (para más detalles, consulte general-information.rst).
> +
> +Si se utiliza ``rustup``, su perfil ``default`` ya instala la herramienta, por
> +lo que no es necesario hacer nada. Si se utiliza otro perfil, el componente
> +puede instalarse manualmente::
> +
> +    rustup component add clippy
> +
> +Los instaladores independientes también vienen con ``clippy``.
> +
> +
> +rustdoc
> +*******
> +
> +``rustdoc`` es la herramienta de documentación para Rust. Genera una atractiva
> +documentación en HTML para el código Rust (para más detalles, consulte
> +general-information.rst).
> +
> +``rustdoc`` también se utiliza para probar los ejemplos proporcionados en el
> +código Rust documentado (llamados doctests o pruebas de documentación). El
> +objetivo de Make ``rusttest`` utiliza esta función.
> +
> +Si se utiliza ``rustup``, todos los perfiles ya instalan la herramienta, por
> +lo que no es necesario hacer nada.
> +
> +Los instaladores independientes también vienen con ``rustdoc``.
> +
> +
> +rust-analyzer
> +*************
> +
> +El servidor de lenguaje `rust-analyzer <https://rust-analyzer.github.io/>`_
> +puede utilizarse con muchos editores para habilitar el resaltado de sintaxis,
> +el completado, el salto a la definición y otras funciones.
> +
> +``rust-analyzer`` necesita un archivo de configuración, ``rust-project.json``,
> +que puede generarse mediante el objetivo de Make ``rust-analyzer``::
> +
> +    make LLVM=1 rust-analyzer
> +
> +
> +Configuración
> +-------------
> +
> +El ``Rust support`` (``CONFIG_RUST``) debe habilitarse en el menú
> +``General setup``. La opción solo se muestra si se encuentra un conjunto de
> +herramientas de Rust adecuado (véase arriba), siempre que se cumplan los demás
> +requisitos. A su vez, esto hará visibles el resto de las opciones que
> +dependen de Rust.
> +
> +A continuación, vaya a::
> +
> +    Kernel hacking
> +        -> Sample kernel code
> +            -> Rust samples
> +
> +Y habilite algunos módulos de ejemplo, ya sea como integrados (built-in) o
> +como cargables.
> +
> +
> +Compilación
> +-----------
> +
> +Compilar un kernel con un conjunto de herramientas LLVM completo es la
> +configuración mejor soportada en este momento. Es decir::
> +
> +    make LLVM=1
> +
> +El uso de GCC también funciona para algunas configuraciones, pero es muy
> +experimental en este momento.
> +
> +
> +Hacking
> +-------
> +
> +Para profundizar más, eche un vistazo al código fuente de los ejemplos en
> +``samples/rust/``, al código de soporte de Rust bajo ``rust/`` y al menú
> +``Rust hacking`` bajo ``Kernel hacking


Thanks so much for taking care of this! It looks very well overall.

One small issue: it looks like this patch was truncated at the end of the
Hacking section. That part is added in the current Patch 2/2. Could you
please fix that detail in a v2?

Muchas gracias!

Carlos

> \ No newline at end of file
