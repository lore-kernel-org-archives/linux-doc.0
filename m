Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C211DC1AB
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772406494; cv=none; b=PMpmYgjfPTzdusfceGNGO9cwIE3Lk7ImbD0JbYvNscKGi1fYtGp3XuGbJuSVx8I45AZM/qqyFTXVnOBivyrHkyUwGFFb9umfgO4eR0zqJCkG/ru9Ivh9jSDOVrKTDRCcfvDeJqENo+Nh2S6Lhpt4XNZlP4czRfG2SHkJetjD7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772406494; c=relaxed/simple;
	bh=xtFioME0P3/vEy5TpTfQB2cy0zJzGL90WlY1stlFu7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4zMxGfP2TIWdbL1kNKmHQ4FkN0R9F1RoBrg/b54/LtwBLRhtdSBLaIK/ArE1M0p0oKHM/WeJfVso6se2VzWtDpJsEaBmSKbJYl7pbIWtYmjlY46yy/8FhX2lwjq/8vUWS0isKqCPS/EOXR1IjheNWmSVjD0AbwUM1xXxnCPhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+7sbTUH; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+7sbTUH"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso2148884eec.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 15:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772406492; x=1773011292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJRTExkyK8eA1+OiwSOi7BJnxn5DCBFmHR0/4O0PmVc=;
        b=T+7sbTUH39obIEYwI+NyR4Z9JgEIAdhlZDgYQj3DO/1ZA45FQaKCH5OtgZAurWavvL
         czUmkf/NkYGbRYb8c7zoPBVmuhyqzppfoJPVUD0ItnCN5y1e5m9EE3ZD0OZY+WU5yrA+
         ybJwpOm6QPGSHFgHd+sY1cp6apX2Tt9yFPqEHxb+e1v/6sVyJJvUQ37Tvb4If9QigqmL
         R/r9IpW9MAdWfautnWQyYZosmMs5NBY3cVuM0Mx9GDBbH/+Z6jSpSERXSDUI6Bk4y6Zv
         fKU+AUpOeLO2D3rFE2rs6LbKuglquIfcfH6whUYwqNGzKyPEKVnAMo0qC6wx/iZznr69
         4SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772406492; x=1773011292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJRTExkyK8eA1+OiwSOi7BJnxn5DCBFmHR0/4O0PmVc=;
        b=Wmg2YeJw6T9xf9r+Y8qhNF+aMK4DVY+3bMa8D4kylxfYAZz3niEJG7BshEBTOxK+Lf
         euIeQHHQbjBj5futFoXrirwQ82seMnCjGeXC+zW3Euj+nVv3vE12+C1D3OJ4W+H7wVd7
         8mCo+MuHX8CCd0dgpk6N8mxRRIS4XbGk+8N/t5JyDW2V50ZiOdHRLU0ECd3O8xf28NhQ
         veb6Dj0SsvJDkqDxHrvT9IT+0ExmVt7An1EJ7Pz6PobOCzqzQJbolhT4n69D9SdfmY39
         SuB0EyEYuCL8OPyZmEePKYzYL0eNHTDmjkUhxZGjJ1ZAa0IaWyu6FQrgfEO6KfafVzVS
         FEcw==
X-Forwarded-Encrypted: i=1; AJvYcCWifka6QQlOXhL4dKaeVrHkAC+6wmAsJrzlntnfJswLwO9KbjIyIFbFp9m2ZKtZ+R1LDpBnkyr9AqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuoqQfUirSTNpxhVh+DT3fcwJGQyPgv/tAirRTUNArLOwK9p3
	DQXm6prE83ORTwUvQVJbHzA54FF25rkthG0+LxMtnjlWlPLKnMCMXeMq
X-Gm-Gg: ATEYQzwKRmSZim3L0+TBrXyj+yAm0MgptjByTcLcNChatCL3RSXgNs43256CkJB+NgM
	/2PSMM3You+19vvtSKTtsM4mZCwsTAiUYeOkJmN3nnbc4VuNhWSJEfJhK2obelDZxW5b6jq9xbp
	UYuy3wwLH5llv3i6W96aTrNLJHoxbYZrxv0bZpkcDxV1uIMm+NkMWdA5BR5CKIn4alWxaJutMsl
	0I8Y/FwYBjM1rPEDTt6nbGpTV/1jUf6CtAisynjBXQkwLiyOxqe8YKK0WUbrVvAnwfZsYFREZWt
	Ypj+Z6abIUELff9lS2LW9L4tuW1qQfTdlCg24JPjaQHOzfs6/JlYSFZtmppx/SGd+i02Tc/NT7f
	1CTGSGjV0ksliDFfxuG1LeZ3fN27RE/A6gjrjw8Lew6Nb2B4IABc7e85Hox1uCYBmKb7Jklr+S3
	CPhSwdIjsttjC446yEnFRxrjLIY5xvYiuuWPSyNNA=
X-Received: by 2002:a05:693c:60c1:b0:2be:12ca:b33a with SMTP id 5a478bee46e88-2be12cab6e9mr283729eec.13.1772406492203;
        Sun, 01 Mar 2026 15:08:12 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be0dcfbf08sm1786985eec.31.2026.03.01.15.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 15:08:11 -0800 (PST)
Message-ID: <26c76e65-b83a-412e-9b61-5daa79b42245@gmail.com>
Date: Sun, 1 Mar 2026 15:08:09 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: sp_SP: Add Spanish translation for Rust general
 information
To: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260301134728.64695-1-edwin.toribio.j@gmail.com>
 <20260301134728.64695-3-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260301134728.64695-3-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 3/1/26 05:47, Edwin Toribio wrote:
> Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>
> ---
>   .../sp_SP/rust/general-information.rst        | 178 ++++++++++++++++++
>   .../translations/sp_SP/rust/quick-start.rst   |  13 +-
>   2 files changed, 190 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
>
> diff --git a/Documentation/translations/sp_SP/rust/general-information.rst b/Documentation/translations/sp_SP/rust/general-information.rst
> new file mode 100644
> index 000000000000..da2479d1a4c3
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
> +(ej. tipos, funciones, constantes), código fuente, etc. Pueden leerse en:


One very small detail, “p. ej.” (por ejemplo) is the standard and
recommended abbreviation.


> +
> +    https://rust.docs.kernel.org
> +
> +Para linux-next, consulte:
> +
> +    https://rust.docs.kernel.org/next/
> +
> +También existen etiquetas para cada lanzamiento principal, ej.:
> +
> +    https://rust.docs.kernel.org/6.10/
> +
> +La documentación también puede generarse y leerse fácilmente de forma local.
> +Esto es bastante rápido (del mismo orden que compilar el código en sí) y no se
> +necesitan herramientas ni entornos especiales. Esto tiene la ventaja añadida de
> +que estará adaptada a la configuración particular del kernel utilizada. Para
> +generarla, utilice el objetivo ``rustdoc`` con la misma invocación utilizada
> +para la compilación, ej.::
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
> +compilación, ej.::
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
> +módulos hoja ("Leaf") (ej. controladores/drivers) no deben utilizar los vínculos de C
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
> +Para las partes de la cabecera C que ``bindgen`` no genera automáticamente, ej.
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
> +Para otros predicados que el ``cfg`` de Rust no soporta, ej. expresiones con
> +comparaciones numéricas, se puede definir un nuevo símbolo Kconfig:
> +
> +.. code-block:: kconfig
> +
> +    config RUSTC_VERSION_MIN_107900
> +        def_bool y if RUSTC_VERSION >= 107900
> \ No newline at end of file
> diff --git a/Documentation/translations/sp_SP/rust/quick-start.rst b/Documentation/translations/sp_SP/rust/quick-start.rst
> index a54de6386dee..6c1bba092210 100644
> --- a/Documentation/translations/sp_SP/rust/quick-start.rst
> +++ b/Documentation/translations/sp_SP/rust/quick-start.rst
> @@ -371,4 +371,15 @@ Hacking
>   
>   Para profundizar más, eche un vistazo al código fuente de los ejemplos en
>   ``samples/rust/``, al código de soporte de Rust bajo ``rust/`` y al menú
> -``Rust hacking`` bajo ``Kernel hacking
> \ No newline at end of file
> +``Rust hacking`` bajo ``Kernel hacking``.
> +
> +Si se utiliza GDB/Binutils y los símbolos de Rust no se decodifican (demangle)
> +correctamente, la razón es que el conjunto de herramientas aún no soporta el
> +nuevo esquema de decoración de nombres (mangling) v0 de Rust. Hay algunas
> +soluciones:
> +
> +- Instalar una versión más reciente (GDB >= 10.2, Binutils >= 2.36).
> +
> +- Algunas versiones de GDB (ej. GDB 10.1 estándar) pueden utilizar los nombres
> +  pre-decodificados incrustados en la información de depuración
> +  (``CONFIG_DEBUG_INFO``).
> \ No newline at end of file


Thanks,

Carlos

