Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DD351AED4
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064088; cv=none; b=K0XnkCVGtKg7flMhV+X8wSi6K6qh19UxqFfFHqsEEDqFUCS//RPH1bHflADjzLMfcjK0wjPWepZ4dVcIuGo1WBraiHUm55lPCl/+BUcb0ET3RwgaGTnIJOVblWWgqUG2WFBBE8F7oquVod8MMoeRPG/dKgeStqz0rh6HT8o19lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064088; c=relaxed/simple;
	bh=ba0mY5inJOmpBRwHHRs0PUHO6DuUx86G4kH00QLn0dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfMFg+IuIL6bq2mOJ1hmjM636TP1k/TbKjfMka5oVSehvT/ybOuL3koA39PSYn61pbjZFe+GT06m5Z+ZHZj0CY95Bw2wc6Z87FtghYidrk93tL0kiwQ2/ykUDPWCobwU6gT2O4MJNlTkJX38ERdzIuqczOp994j2zCEBlYuNlrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbahHwr5; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbahHwr5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f1f76ea84so1239750eec.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064078; x=1792668878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QaUcGfbk1g26E8pVP2hsNZMSdLfRyykfzPNG+bvArbg=;
        b=VbahHwr5+HY4YeUrAVc1fTmINvW0qqJuMi5D8Xr2MCrxTfPP4ZRLFzku+Y/cQnq3At
         W/2Q99fmYf4IPGedK1teCt2DJncy+p9Tlc37FJqZwg4bbULAPODSw2a2eQt1iHuB8bxT
         JOqnlvARCGMnK8mjYXikjpsh+XRlyFx3bzmSy0psNOsM/FoAMcZf1x2fh2A7221Tna/y
         cpRHT/qxbyr7gt7VlhoE05uDqKOGfrLsvVuviI1nughJlW+FHE21/PGHTWwK7lAxwR61
         za+QDZlXbIF/w1Z5Vd6uMh3Whluyl4jSezgTwykoy/TpPGKMjD0kgcxCqC8hNi5O+f3B
         O0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064078; x=1792668878;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaUcGfbk1g26E8pVP2hsNZMSdLfRyykfzPNG+bvArbg=;
        b=O04MtokC62yOqOqQRUHkyYycIgVp0dNV+XS1rb3pL4Eadl5Ks+SrYFQHNjMms2reVE
         LGWjoKXZ04a/UezDYc/nfrfTZQjipcpV6hAmRjXTHERpKZhYRdk+D11/asGxdf+jopzg
         Pr3pOLmi2ZLQo/ZH4pcM87OkcbEAWqB6dzEfiEDS1oiLlwmmXkHxvrEGmPv8gG6wbC8+
         jEMcoWVP5zrx8qHPJ78MLYZwqhOLxEiwcyXvbW8eNnIQJXKaY2ETPw2ZnS0NtJlTyMKQ
         CCqLU4TM2lqyESAK1N6HD/CNPWv7dLCMQMRq2g8RywauVGJkdDkxDPm79Aq805M7bwjE
         oFOw==
X-Gm-Message-State: AFq9FYK+1Qmeq0OVOFmeEWfdUFK85JcU4nSqngqSNAROp9XqDq/LqoXW
	J2SAglRvvP//EfIiJu5bTvPx0TwtXnvnfEaZHj1blZ7hxexCw40eQd6oUZ32wY3z
X-Gm-Gg: AYBFou0KpCin84DWKInkLXX9T+44yc4jbo31/7Q7GABimxyenYJVBdM5SJiFrmSJFjY
	GNtI2XwZpsAR9P8x+n/dBPOKIV1AYbN6cjsa15ejg4WpH54DnVexLsCGR+IBdDvqPsjORrEsgl3
	gYlD9GY6u37MLRa+4xkGf49DC/QiCldi7Lcv/KjXalchoaoskO4hMYsMn7oxwHR1HZ4VWEDpMU+
	uYEs1WT4X92B277Rw5h9SIQ1M9mR3Drn5PQ271m2lX5igaoywnfhzNNxs5q0RjLbz75l8Qg4dWk
	JcuzpqcAcnPO75ueGOPGqwLzeiWDYXHjJxI06B4+tKFqf30RcnTcSDEao4bbFVnpGajS1cJ3u4A
	GVsKhRDm9A4cKSRQD4ao1HVlj3w3QqMbbDlKV3NY9kGRWSILUeNHAvN5fRkNGGXoezPcvv1lp6G
	wnfRBZ35g0YzYPzxqIh8xBaWSeZliRKW5t0n8eblHs34MorWhFMHvE1IaJbyLE+yl9wVmQTUggk
	ZiDnPCqS6q8TvHkm31libMQXf5cfR8YE7MA4IWiU0ub6qV8rj42j0tqBFlwWi2stIKE8lDWOrfg
	bNhSkdXvUaFFAO9VjpSK2as=
X-Received: by 2002:a05:7300:ae10:b0:35e:3727:5412 with SMTP id 5a478bee46e88-35e37275518mr4907859eec.9.1792064077671;
        Thu, 15 Oct 2026 04:34:37 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:37 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 10/10] docs/translations/pt_BR: admin-guide: add efi-stub.rst
Date: Thu, 15 Oct 2026 08:31:18 -0300
Message-ID: <20261015113121.4550-11-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
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

