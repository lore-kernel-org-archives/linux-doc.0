Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C8B501291
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961135; cv=none; b=gpjiCj5u6yodU+lHeR8avGbRB0E96uubT0MaLEvnCZmnORjwLo6jITDJbcsXK9yL4r8NCWSE8vu3Xy50bo5Irmx69wqWV0kwbom+WzSX4tC4doBVGidhXuyz7hsMz4l4HEG41Kg7fjw9XTcEnxgstdOlYF9nrEcaLWLJIxAbHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961135; c=relaxed/simple;
	bh=ba0mY5inJOmpBRwHHRs0PUHO6DuUx86G4kH00QLn0dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCm/m4e381ks6S8PwEvESsWYPJS/s54/WqpDP/nVfjzcyrH6qM+JQJNQitDMjeU1LL82Rn1NWfxDQO0cCjRiRztEdrWvGGO3f0emGxZSycd8ime9SuqSgs9xDBZxmoh8Xg+ozToK4QVuHK0zUhkxQsoimmGsy/DGQpPqzgUwN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl4mOwpJ; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl4mOwpJ"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so2778375e0c.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961123; x=1791565923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QaUcGfbk1g26E8pVP2hsNZMSdLfRyykfzPNG+bvArbg=;
        b=dl4mOwpJksGThBa8y31/gI9NZJkFwQFDue1mhMWb6O+M/3wIsctt8iGwdWexH4YaHZ
         uJRji7SegH7/vWJMHZxjCne9UHxMfheTCRH6uDWhnDtXHjWLIH6YrBhzHzCq6Z+CGSwM
         34ZE99PCXx3t6Ceo8xN7Oy6LxQRBz+19MrZgQsIzu09S4HUB37Y13p0D+16FjffiG/+M
         mqvOfbJvew64o5PXWQxzrA7EgMTiXqbylCfE+/2fnNnQGVNWknnrzAuNO682gVlsaVfa
         9bycS9knCW7P9EUvNbfDkFsuKvcdpKrVCJUSdzxpNgAi4WVCZUl8XN+Ozv/k7wPJW2QN
         1+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961123; x=1791565923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaUcGfbk1g26E8pVP2hsNZMSdLfRyykfzPNG+bvArbg=;
        b=X8RPayTeuS7+wbjYZ47KwNr3Tz7iA1QwcWq2UAecb5bLrg3Xi76bOC1tcHNgfLTKVL
         Pq6zMR4PW9Nmk/51pvpUXE8AG5J+cDMfu2rb5i1S8slMflIWRJbyGnEKgoPkjJzVBmus
         mhvjOIMqy2YfbxsHRmr38mh2DyIJijfBxMZdrPVvWbdExKTM4o8JDGbMBV36kqUIEjl5
         HjEd2Ev8q/c8AyKsYXcDW9PrV8vQCRe6LP7YY3Eqvkxm4Z0wuptjx2BzlEFrTp5btJ+6
         z4s4q+axfZJVd9ew+DQTUoTUe25EapUtnHXBlGLPHvXgDAG8XpTn/BdYdVwCEtQnYUZ0
         jzeA==
X-Gm-Message-State: AFq9FYIoraZyVOVUXv5J63h+e2dDjsrZ5pu+Fn4s3OE5fGi6deR01A7c
	XSneqhQ3euwuoo4mTwb1b19I8ezbkoMZ2n0UKlXqjS4EsZ5fSpuBxfc7vWn5P9xM
X-Gm-Gg: AYBFou2WtS63fkiyjSYwKSoOo8dSRrIcIH5AmUvzJRjvO4tOh6gTIlB1CQJ8fcdwOyb
	BgxKr+a04YwoW45OchrOxuVRqFgZsr1kslvptvZWCvLTq6LU5e9pXlhqMUtxrNb4GTNpTAWz9Wa
	elZbqXGvDZQT+U65g0ZehN41WB1hLICBOwSMjY6yVRTxMUXXemP8nB83VT2+XX3eOHqHaqp2fJp
	bFFOzdzuogNdtNJK0MhflPv6ihnNW2SZVE113dE1tctiuC2mx6XQ5kS4Xggs6mIms1Z2Mxf2xrU
	yUpM+yqDMfLme1SOCMrTd9aKZ+JsYOkf4SW9hId8Z4+yN20x8YvyETolU9wbg/FSOBbO3CCysUl
	tWEsQRMdF/toqWl8a+U4yK+nMGWdjLpTOPFDIVADBJpH8xjggND2wUAoIPC5c99KWcp/6jSeZmj
	eY/qnGrPy45EOuXEiISL6m98FKs7mDbP3iO5Sz1t2496gDODfyXYNqyBZmyfYxAWp47MAmyOOmb
	2dZJ7uDPttBMsy/Dklqme4CD7zgcuKQlAhAhLAOTEF8LVdFPck0zORpI67jWnSTyb+k63u+/2AU
	C6fN/zzSsP1B5NCxwKRAZSA=
X-Received: by 2002:a05:6122:3381:b0:5c9:a60b:e5d0 with SMTP id 71dfb90a1353d-5dab08e7fbemr1046267e0c.10.1790961122482;
        Fri, 02 Oct 2026 10:12:02 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:12:02 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 10/10] docs/translations/pt_BR: admin-guide: add efi-stub.rst
Date: Fri,  2 Oct 2026 14:11:33 -0300
Message-ID: <20261002171133.50969-11-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of efi-stub.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/admin-guide/efi-stub.rst            | 102 ++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |   2 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/efi-stub.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/efi-stub.rst b/Documentation/translations/pt_BR/admin-guide/efi-stub.rst
new file mode 100644
index 000000000..d21f134ab
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/efi-stub.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+O EFI Boot Stub
+=================
+
+Nas plataformas x86 e ARM, uma zImage/bzImage do kernel pode se passar por
+uma imagem PE/COFF, convencendo assim os carregadores de firmware EFI a
+carregá-la como um executável EFI. O código que modifica o cabeçalho da bzImage,
+juntamente com o ponto de entrada específico do EFI para o qual o carregador de
+firmware salta, são conhecidos coletivamente como o "EFI boot stub", e residem
+em arch/x86/boot/header.S e drivers/firmware/efi/libstub/x86-stub.c, respectivamente.
+Para ARM, o stub EFI é implementado em arch/arm/boot/compressed/efi-header.S e
+drivers/firmware/efi/libstub/arm32-stub.c. O código do stub EFI compartilhado
+entre arquiteturas está em drivers/firmware/efi/libstub.
+
+Para arm64, não há suporte a kernel compactado, portanto a própria Imagem se
+passa por uma imagem PE/COFF e o stub EFI é vinculado diretamente ao kernel. O
+stub EFI para arm64 reside em drivers/firmware/efi/libstub/arm64.c e
+drivers/firmware/efi/libstub/arm64-stub.c.
+
+Ao usar o EFI boot stub, é possível inicializar um kernel Linux sem o uso de um
+carregador de boot EFI convencional, como o grub ou elilo. Como o EFI boot stub
+desempenha as tarefas de um carregador de inicialização, em certo sentido ele *É*
+o carregador de inicialização.
+
+O EFI boot stub é ativado com a opção de kernel CONFIG_EFI_STUB.
+
+
+Como instalar bzImage.efi
+-------------------------
+
+A bzImage localizada em arch/x86/boot/bzImage deve ser copiada para a Partição
+de Sistema EFI (ESP - EFI System Partition) e renomeada com a extensão ".efi".
+Sem a extensão, o carregador de firmware EFI se recusará a executá-la. Não é
+possível executar bzImage.efi a partir dos sistemas de arquivos normais do Linux
+porque o firmware EFI não possui suporte para eles. Para ARM, a
+arch/arm/boot/zImage deve ser copiada para a partição de sistema e pode não
+precisar ser renomeada. Da mesma forma, para arm64, arch/arm64/boot/Image deve
+ser copiada, mas não necessariamente renomeada.
+
+
+Passando parâmetros do kernel a partir do shell EFI
+---------------------------------------------------
+
+Argumentos para o kernel podem ser passados após bzImage.efi, por exemplo::
+
+	fs0:> bzImage.efi console=ttyS0 root=/dev/sda4
+
+A opção "initrd="
+-----------------
+
+Como a maioria dos carregadores de inicialização, o stub EFI permite que o
+usuário especifique múltiplos arquivos initrd usando a opção "initrd=". Este é
+o único parâmetro de linha de comando específico do stub EFI; tudo o mais é
+passado para o kernel quando ele inicializa.
+
+O caminho para o arquivo initrd deve ser um caminho absoluto a partir do início
+da ESP; nomes de caminhos relativos não funcionam. Além disso, o caminho é no
+estilo EFI e os elementos de diretório devem ser separados com barras invertidas
+(\). Por exemplo, dada a seguinte estrutura de diretórios::
+
+  fs0:>
+	Kernels\
+			bzImage.efi
+			initrd-large.img
+
+	Ramdisks\
+			initrd-small.img
+			initrd-medium.img
+
+para inicializar com o arquivo initrd-large.img se o diretório de trabalho atual
+for fs0:\Kernels, o seguinte comando deve ser usado::
+
+	fs0:\Kernels> bzImage.efi initrd=\Kernels\initrd-large.img
+
+Observe como bzImage.efi pode ser especificado com um caminho relativo. Isso ocorre
+porque a imagem que estamos executando é interpretada pelo shell EFI, que entende
+caminhos relativos, enquanto o restante da linha de comando é passado para bzImage.efi.
+
+.. hint::
+   Também é possível fornecer um initrd usando um protocolo UEFI específico do
+   Linux no momento da inicialização. Consulte :ref:`pe-coff-entry-point` para
+   obter detalhes.
+
+A opção "dtb="
+--------------
+
+Para as arquiteturas ARM e arm64, uma árvore de dispositivos (device tree) deve ser
+fornecida ao kernel. Normalmente, o firmware deve fornecer a árvore de dispositivos
+através da EFI CONFIGURATION TABLE. No entanto, a opção de linha de comando "dtb="
+pode ser usada para sobrescrever a árvore de dispositivos fornecida pelo firmware
+ou para fornecer uma quando o firmware não puder fazê-lo.
+
+Observe: O firmware adiciona informações de configuração em tempo de execução à
+árvore de dispositivos antes de inicializar o kernel. Se dtb= for usado para
+sobrescrever a árvore de dispositivos, quaisquer dados em tempo de execução
+fornecidos pelo firmware serão perdidos. A opção dtb= deve ser usada apenas como
+uma ferramenta de depuração ou como último recurso quando uma árvore de dispositivos
+não for fornecida na EFI CONFIGURATION TABLE.
+
+"dtb=" é processado da mesma maneira que a opção "initrd=" descrita acima.
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 40397ef77..f0f096a74 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -60,10 +60,10 @@ Inicializando o kernel
 
    bootconfig
    kernel-parameters
+   efi-stub
 
 Todolist:
 
-*   efi-stub
 *   initrd
 
 Rastreando e identificando problemas
-- 
2.47.3

