Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1B2417E0
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994687; cv=none; b=Tijx5fXlI3L7DQgadoYxqBs75yc1OCdncjK5gF0UA9HMSH4kCeEspXHGCepq1EZSH0iZaWN+gNMAW9pbrK+A1ypFIWBJFwhYtv/D5AxHe9Nz/60RNiMdrGy1/eJ9DJX006Ceg7CprBx2iUauB4EJEVc3v4E1xcJFrOSG6iYbG2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994687; c=relaxed/simple;
	bh=RXn5/RQyN57hHBNRboHJAha4cxgA0urfTS27SZmFcRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Txh/hN1ajl+ZHj/2xny7q3lNaQ6qvKh6/W9IceZIq7WdBjMoXgaANWX4n3fTJMa2O2SYcj+YxCi5Oe93OP8fygJHIt4v3zw3UjGvzWupt9mvcJpGYmZLP65xgtWH4QTxPRWsmb/GMBwGYwIDknEiE3dTwEyL2VpEz/859PmnYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3YE11Zd; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3YE11Zd"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so9245958eec.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772994685; x=1773599485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5t1AI6uKXfTggdHZqBXQPVDouEZyCrKF4p7zOoJm6s=;
        b=W3YE11ZdEYmta3lyvqBCMxrWet8YKdawv7RiDrccjKaPMI6jL8mSkj+6Wy2YMitsqr
         xhS69UojzJmkhndAJZzWc+RWBCHicrP8O3Uwp/KRlEVA80c79FbyY/2D+/pSmpgTOQ9s
         mUOkzePZy9EAWthc1RhuwtvqEUP9VDu5gj0CXKXiS0oZDUJXxU47dCs+GDKd6JpNxWUd
         tEENSK1H1/8c0ch4YxOhs2Ms4jOP1xqSAQ0rogzrJ4iZaw6NZFczpZ96QC/UkQCZ9SJ6
         NWvhqju8dLzcRZYqrsgIBPKVR/ZPZFc3MXgja+j0ZoO9LQ08CETRlL+OEbSU9tZFIjmy
         TV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772994685; x=1773599485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5t1AI6uKXfTggdHZqBXQPVDouEZyCrKF4p7zOoJm6s=;
        b=paP4N2W0I0ehd3ULEU3cUYJBLvBzs7AkpznZcNlc89gA13ZXpA4g6JkaS2D4L2v/cq
         SuXA2aljcBjbGVZ6QlpUO0MV9eU6eH/CS7JBVjsHp3OzPBICQfN1lYscPzUy+g+pvozV
         A3xQ5TaApx+NEinb24XuxLg5zg+qAsvKj1fe9SzmrM59OujDVKCyMBQ0/3fNeC3KRp11
         oM2EX5dyjaQRpMmPi3hjhrQjh6UiJQBCTNGQEvF4ENYWW8PW8QkOsy7/fxDdswxVx8pY
         16PuO26xHY7DI1yQVVpJtABpZpaoxE7Gx75sXgA9zovpH51xEJogXKyXNsB6UubGvrew
         bnNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIzwUWqNT7em415uwnLI1BVaZAxpT0ef0+cUxBPQI5UwdAQ9Nf5rtK7YI/pYMJelsiz6c9821L5ls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xwYQYUeNKesfGMkXEY4AuVehm6gOM16pbauaE+V9/yP0Haje
	5JuTDcXRXMkucObSd2l0O5gxbbvV46IEdJI1UOffFjzLhmK4qNVSSXrE
X-Gm-Gg: ATEYQzzjfXXnNMCMcHBIRDZAbfnOU8aVAvJ2DSMN15MKjypTnKAz1pV0uE/P4FTYpVP
	4ha1Atxx1zjdmSvUIX7gEnBiCpL1DP6jpMA98zNszCtzC0gKQrkYhWQk7BdgA2lWwESUk8zw6Ei
	0MgaLRo3v/EGhksaVeclpkEnQRczVWbkbzRVQTWUjaWL9U97E5EXZa21BaOjZ6cytZBOj2bZjWQ
	+0/d7QvTj3+NvXFXybPbciLYCPwPoSh/MldVNMsknf4iJbe4NXYmXZcLCdI4fpFmtlWESBwnYki
	Ya83xONF5U6Z3IG2RJ0NMaDIB5cXkeeZ+g4kPE7bA5eK2MGQRBJsus49Q4iXeyWq4Ll/PJUqz7C
	+a4sqCGcGkhi8wMsFiTJgh3Wr1ndGGkMO1EYEUR00a0xDWZquLbuZkyWnW+yL3DqdZgWIFKyM7L
	fL2uW/dYh22kWYlZ979WRtxHGB+nU8jpK5mRAjQXZ2
X-Received: by 2002:a05:7301:1010:b0:2be:1f58:32a6 with SMTP id 5a478bee46e88-2be4e08fbeamr3065968eec.33.1772994685162;
        Sun, 08 Mar 2026 11:31:25 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984cf5sm6828820eec.33.2026.03.08.11.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:31:24 -0700 (PDT)
Message-ID: <5581533d-5a8d-464e-b347-33024060bf71@gmail.com>
Date: Sun, 8 Mar 2026 11:31:24 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs: sp_SP: Add Spanish translation for Rust
 general information
To: Edwin Toribio <edwin.toribio.j@gmail.com>
Cc: carlos.bilbao@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-3-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260304200715.76360-3-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 12:07, Edwin Toribio wrote:

> Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>


  Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   .../sp_SP/rust/general-information.rst        | 178 ++++++++++++++++++
>   1 file changed, 178 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
>
> diff --git a/Documentation/translations/sp_SP/rust/general-information.rst b/Documentation/translations/sp_SP/rust/general-information.rst
> new file mode 100644
> index 000000000..5b7b0225d
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/rust/general-information.rst
> @@ -0,0 +1,178 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-sp.rst
> +
> +:Original: Documentation/rust/general-information.rst
> +:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
> +
> +.. _sp_rust_general_information:
> +
> +Información general
> +===================
> +
> +Este documento contiene información útil que conviene conocer cuando se trabaja
> +con el soporte de Rust en el kernel.
> +
> +
> +``no_std``
> +----------
> +
> +El soporte de Rust en el kernel solo puede vincularse a `core <https://doc.rust-lang.org/core/>`_,
> +pero no a `std <https://doc.rust-lang.org/std/>`_. Las cajas (crates) destinadas
> +al uso en el kernel deben optar por este comportamiento utilizando el atributo
> +``#![no_std]``.
> +
> +
> +.. _sp_rust_code_documentation:
> +
> +Documentación del código
> +------------------------
> +
> +El código Rust del kernel se documenta mediante ``rustdoc``, su generador de
> +documentación integrado.
> +
> +Los documentos HTML generados incluyen búsqueda integrada, elementos enlazados
> +(p. ej. tipos, funciones, constantes), código fuente, etc. Pueden leerse en:
> +
> +    https://rust.docs.kernel.org
> +
> +Para linux-next, consulte:
> +
> +    https://rust.docs.kernel.org/next/
> +
> +También existen etiquetas para cada lanzamiento principal, p. ej.:
> +
> +    https://rust.docs.kernel.org/6.10/
> +
> +La documentación también puede generarse y leerse fácilmente de forma local.
> +Esto es bastante rápido (del mismo orden que compilar el código en sí) y no se
> +necesitan herramientas ni entornos especiales. Esto tiene la ventaja añadida de
> +que estará adaptada a la configuración particular del kernel utilizada. Para
> +generarla, utilice el objetivo ``rustdoc`` con la misma invocación utilizada
> +para la compilación, p. ej.::
> +
> +    make LLVM=1 rustdoc
> +
> +Para leer la documentación localmente en su navegador web, ejecute por ejemplo::
> +
> +    xdg-open Documentation/output/rust/rustdoc/kernel/index.html
> +
> +Para aprender cómo escribir la documentación, consulte coding-guidelines.rst.
> +
> +
> +Lints adicionales
> +-----------------
> +
> +Aunque ``rustc`` es un compilador muy útil, existen algunos lints y análisis
> +adicionales disponibles a través de ``clippy``, un linter de Rust. Para
> +habilitarlo, pase ``CLIPPY=1`` a la misma invocación utilizada para la
> +compilación, p. ej.::
> +
> +    make LLVM=1 CLIPPY=1
> +
> +Tenga en cuenta que Clippy puede cambiar la generación de código, por lo que no
> +debe habilitarse mientras se compila un kernel de producción.
> +
> +
> +Abstracciones vs. vínculos (bindings)
> +-------------------------------------
> +
> +Las abstracciones son código Rust que envuelve la funcionalidad del kernel desde
> +el lado de C.
> +
> +Para poder utilizar funciones y tipos del lado de C, se crean vínculos
> +(bindings). Los vínculos son las declaraciones para Rust de esas funciones y
> +tipos del lado de C.
> +
> +Por ejemplo, se podría escribir una abstracción ``Mutex`` en Rust que envuelva
> +un ``struct mutex`` del lado de C y llame a sus funciones a través de los
> +vínculos.
> +
> +Las abstracciones no están disponibles para todas las API internas y conceptos
> +del kernel, pero se pretende que la cobertura se amplíe con el tiempo. Los
> +módulos hoja ("Leaf") (p. ej. controladores/drivers) no deben utilizar los vínculos de C
> +directamente. En su lugar, los subsistemas deben proporcionar abstracciones tan
> +seguras como sea posible según sea necesario.
> +
> +.. code-block::
> +
> +                                                    rust/bindings/
> +                                                   (rust/helpers/)
> +
> +                                                       include/ -----+ <-+
> +                                                                     |   |
> +      drivers/              rust/kernel/              +----------+ <-+   |
> +        fs/                                           | bindgen  |       |
> +       .../            +-------------------+          +----------+ --+   |
> +                       |    Abstracciones  |                         |   |
> +    +---------+        | +------+ +------+ |          +----------+   |   |
> +    | mi_foo  | -----> | | foo  | | bar  | | -------> | Vínculos | <-+   |
> +    | driver  | Segura | | sub- | | sub- | | Insegura |(Bindings)|       |
> +    +---------+        | |sist. | |sist. | |          |          |       |
> +         |             | +------+ +------+ |          |  caja    | <-----+
> +         |             |   caja del kernel |          | bindings |       |
> +         |             +-------------------+          +----------+       |
> +         |                                                               |
> +         +------------------# PROHIBIDO #--------------------------------+
> +
> +La idea principal es encapsular toda interacción directa con las API de C del
> +kernel en abstracciones cuidadosamente revisadas y documentadas. Entonces, los
> +usuarios de estas abstracciones no podrán introducir un comportamiento
> +indefinido (UB) siempre que:
> +
> +#. Las abstracciones sean correctas ("sound").
> +#. Cualquier bloque ``unsafe`` respete el contrato de seguridad necesario para
> +   llamar a las operaciones dentro del bloque. Del mismo modo, cualquier
> +   implementación ``unsafe impl`` respete el contrato de seguridad necesario
> +   para implementar el rasgo (trait).
> +
> +Vínculos (Bindings)
> +~~~~~~~~~~~~~~~~~~~
> +
> +Al incluir una cabecera C de ``include/`` en
> +``rust/bindings/bindings_helper.h``, la herramienta ``bindgen`` generará
> +automáticamente los vínculos para el subsistema incluido. Tras la compilación,
> +vea los archivos de salida ``*_generated.rs`` en el directorio
> +``rust/bindings/``.
> +
> +Para las partes de la cabecera C que ``bindgen`` no genera automáticamente, p. ej.
> +funciones ``inline`` de C o macros no triviales, es aceptable añadir una pequeña
> +función de envoltura (wrapper) en ``rust/helpers/`` para que esté disponible
> +también para el lado de Rust.
> +
> +Abstracciones
> +~~~~~~~~~~~~~
> +
> +Las abstracciones son la capa entre los vínculos y los usuarios dentro del
> +kernel. Se encuentran en ``rust/kernel/`` y su función es encapsular el acceso
> +inseguro (unsafe) a los vínculos en una API lo más segura posible que exponen a
> +sus usuarios. Los usuarios de las abstracciones incluyen elementos como
> +controladores o sistemas de archivos escritos en Rust.
> +
> +Además del aspecto de la seguridad, se supone que las abstracciones deben ser
> +"ergonómicas", en el sentido de que convierten las interfaces de C en código
> +Rust "idiomático". Ejemplos básicos son convertir la adquisición y liberación
> +de recursos de C en constructores y destructores de Rust, o los códigos de error
> +enteros de C en los tipos ``Result`` de Rust.
> +
> +
> +Compilación condicional
> +-----------------------
> +
> +El código Rust tiene acceso a la compilación condicional basada en la
> +configuración del kernel:
> +
> +.. code-block:: rust
> +
> +    #[cfg(CONFIG_X)]       // Habilitado              (`y` o `m`)
> +    #[cfg(CONFIG_X="y")]   // Habilitado como integrado (`y`)
> +    #[cfg(CONFIG_X="m")]   // Habilitado como módulo    (`m`)
> +    #[cfg(not(CONFIG_X))]  // Deshabilitado
> +
> +Para otros predicados que el ``cfg`` de Rust no soporta, p. ej. expresiones con
> +comparaciones numéricas, se puede definir un nuevo símbolo Kconfig:
> +
> +.. code-block:: kconfig
> +
> +    config RUSTC_VERSION_MIN_107900
> +        def_bool y if RUSTC_VERSION >= 107900
> \ No newline at end of file
