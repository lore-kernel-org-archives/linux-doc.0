Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116D509EE2
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566429; cv=none; b=j+FvMi4UQmzU6wl5Vi2b4/GsbvkDSkSrM6nCcL26teJP8PCtrErMqkHW06syDCCZeYRoPj76ARWatn8SYyNfWcsJm8hLVezlxGcMMtX79qsRSbElVTFris7BR4xhghmX+Vkmq2o2dSElXtfmHCDAZ1AgMhc024GBl9iNPhSNBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566429; c=relaxed/simple;
	bh=q2MfE8fZqZKi+axKsVZEfQnx8mD9rMOHxGOWTSRWUQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Us6V/odpiBaaXzfEK1c1AxmxCGRbUrEYTTyL+A3XqtGQ0Bl3N+yghXxz3KEGPsU19xbP9V+4Azs/RWPk8bRyBWjHhI0802kvDgpZeAZ0hM1rtubs609bV71HAS36cstT0Sb1y1MztIn55RvR/xYejDfpvRRVcDJwxtPSK/ID41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jevcf4CK; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jevcf4CK"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-795a0ab5227so303284137.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789566421; x=1790171221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+3Jj7cpp/cVunwqo7Vx/u+kyap4pULeHcjbBhPp4VQ=;
        b=jevcf4CKB01Y57BySuUsLjw/UXdK4IoGKn1eP/s77na+dTrh+iRyd0WTDrS8v+MJVd
         UFpakBpBWpdikzswYUhazTu3KWBz0o+DQ13hHmd30nvlgr4i/AJ0F5hElW/wFTix3zMX
         /ub6rS713JOM0YAuBpDFtFILXciYtgYsHq7H/GLLwbWpzVB/e9ipCjmoH/eEMy9SdK3u
         nFtKkh552Y/n1CFxshw7srIhxQdi3HTIe78n2UjI0+Uv7h0NdxrqetDRsYndGTI1rJtC
         qsaHItm8tvthPKdn48msWIeKZM0dCuNcHqyj1ujBqtomgi9vtgKFG+FPEHNqpw+WEgkG
         3Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566421; x=1790171221;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+3Jj7cpp/cVunwqo7Vx/u+kyap4pULeHcjbBhPp4VQ=;
        b=eMAD47Mx72wBg3jm8rwmnV35tcvCYKCL6kDW/D3AVRd6oEaAHFq3KGUx/jMt61e49l
         4j6xiBY444hA0t3UjWzteAzwd5xFUTEYUSReNhFOY+opEdJIpxuUwldA9XDLX9MEKHCm
         dhdM+iLjJ4vaycHG20dB9q9SfG0Vgcd9DIW0DzqfGSC9O5kgv5MGfuGcauUPMh47m8p2
         PSiDpHRFv3UQU0YceQTf2VtpJ4s0ej/9JPEPcbGtA7qMruDGllSq9RsOPUJxs2SxS8Gn
         mQsMERipbwgfudGkhqSqw4kWq7b68ElOk3F4fJC7kBnyfZ40jsIogFrT9ViNLGu4TZLZ
         seZA==
X-Forwarded-Encrypted: i=1; AKwUvBx5g2EtuRe7xXEMr7CEfGkfoFR5dWc+sauZE7tOR7zcvz3xohfRT31I8e9/svXQWBghJkG9vT8ZoZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++nQPmDl5NhLXBNTe6RUK2xMfdqjYTvWSD6HcSJ7p1eq1TC4MOwL
	oWbDLOPTpZjXs0fVRd1PukIN+vVuJorKoT1nP7hPM5O4weHH7p+/jwxA
X-Gm-Gg: AYBFou3lXwMXBqfqVo/qFpyR7/NSq6S7sc4/N3psE/qlGPZdyguFfkORZ23t4iUYkgY
	GcS0hODRy6npZmguo4UP0e+3afa8JzMcSMFmUrVX7peTD19VGbEWjR3ArO7ehCW9wTyrO4F07mT
	0WKFY0KYlLk3wkKID95AhN5bFQ47Jw+9hM67lhPEsBLyVIDq52c0pXEpcGrKbMHqTo3Cwsh4gOs
	Awr4QGXqP+4uZsrtOwS7Ahohm1bpfUT0c60/fJljYvqggpnkWLJpTm9VJQpKKdUFoi7taHaDWwb
	iqC2dWccfQOsyYRmp4N/IN668HJcTBqYI1EPODMpTqHIeYFYykOXO3nnIOJ9LW7FoY09KpDEBnc
	UI7SXQmMbwQUB+nMUBDZ15UkLVnsQC9UWhySCZAHM5p8NusyeCQPojEoHgKY44U0ngJsKPTureh
	sZewH/XmKUUIU4wdFQTsIqFrF6TBB3ChtQ8DfXJdQlWqZofURlY4B9X7YA7wi0qG4eYE8+
X-Received: by 2002:a05:6102:5247:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-7a0250c1000mr2583083137.1.1789566420409;
        Wed, 16 Sep 2026 06:47:00 -0700 (PDT)
Received: from fedora ([206.42.51.82])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb2fd68f7sm3005118137.12.2026.09.16.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:46:59 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate maintainer-devicetree.rst
Date: Wed, 16 Sep 2026 10:46:34 -0300
Message-ID: <20260916134637.216062-1-lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate maintainer-devicetree.rst to brazilian portuguese.

Assisted-by: LLM
Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../translations/pt_BR/process/index.rst      |  1 +
 .../pt_BR/process/maintainer-devicetree.rst   | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-devicetree.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..a00fa52cd 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -88,6 +88,7 @@ mantenedores de subsistemas.
    Processo do subsistema SoC <maintainer-soc>
    Conformidade de DTS para SoC <maintainer-soc-clean-dts>
    Processo do subsistema KVM x86 <maintainer-kvm-x86>
+   Subsistema de Devicetree e Open Firmware <maintainer-devicetree>
 
 Outros materiais
 ----------------
diff --git a/Documentation/translations/pt_BR/process/maintainer-devicetree.rst b/Documentation/translations/pt_BR/process/maintainer-devicetree.rst
new file mode 100644
index 000000000..be26d89de
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-devicetree.rst
@@ -0,0 +1,76 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Subsistema de Devicetree e Open Firmware
+=========================================
+
+Outros documentos sobre o processo
+----------------------------------
+
+Consulte os documentos em Documentation/devicetree/bindings/ para saber como
+escrever bindings de Devicetree corretamente e como enviar patches.
+
+Revisão e tratamento de patches
+-------------------------------
+
+Os patches sob responsabilidade dos mantenedores de Devicetree são processados
+de formas distintas, conforme o tipo de patch:
+
+1. Código central de drivers OF, por exemplo, drivers/of/:
+   os patches são revisados e aplicados pelos mantenedores de DT.
+
+2. Bindings de Devicetree:
+   os patches são revisados pelos mantenedores de DT, mas devem ser aplicados
+   pelos mantenedores do subsistema, exceto em alguns casos. Consulte também
+   *Para mantenedores do kernel* em
+   Documentation/devicetree/bindings/submitting-patches.rst.
+
+3. DTS e drivers:
+   os mantenedores de DT podem fazer comentários, mas, em geral, não se espera
+   uma revisão. Os DTS devem passar nas verificações de esquema
+   (dtbs_check) ou, ao menos, não gerar novos avisos.
+
+Patchwork
+~~~~~~~~~
+
+Os mantenedores de Devicetree revisam patches usando o Patchwork; portanto, o
+status atual de um patch pode ser consultado por lá. Em submissões típicas de
+drivers, o Patchwork recebe toda a série de patches, mas normalmente apenas
+alguns patches são bindings de Devicetree e, assim, revisados pelos
+mantenedores de DT.
+
+Explicação dos status do Patchwork:
+
+ - **New**: ainda não processado pelo conjunto de ferramentas de automação.
+ - **Needs ACK**: aguardando revisão dos mantenedores de DT.
+ - **Handled Elsewhere**: patch não relacionado a DT; não será revisado aqui.
+ - **RFC**: o patch provavelmente foi ignorado por ser um RFC incompleto.
+ - **Changes Requested**: o patch foi revisado e os mantenedores de DT esperam
+   alterações.
+ - **Accepted**: o patch foi revisado e aplicado pelos mantenedores de DT em
+   sua árvore.
+ - **Not Applicable**: o patch foi revisado e provavelmente está em boas
+   condições, com uma tag *Reviewed-by* ou *Acked-by* fornecida, mas os
+   mantenedores de DT esperam que outra pessoa o aplique.
+
+Nova revisão e pings de patches
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Devido ao alto volume de e-mails, os mantenedores de Devicetree não leem todas
+as mensagens que recebem; em vez disso, eles dependem do Patchwork durante o
+processo de revisão. Além disso, muitas vezes deixam de lado patches que já
+foram revisados.
+
+Como resultado, os mantenedores podem não perceber:
+
+1. Perguntas sobre patches já revisados.
+2. Pings, por exemplo, quando um patch foi revisado pelos mantenedores de DT,
+   mas ainda não foi aplicado pelos mantenedores do subsistema.
+
+Esses casos podem ser tratados das seguintes formas:
+
+1. Enviando um ping aos mantenedores de DT no canal de IRC.
+2. Removendo a tag *Acked-by* ou *Reviewed-by* do mantenedor de DT ao enviar
+   uma nova versão da série de patches, junto com uma explicação no changelog
+   do patch sobre o motivo da remoção da tag e o que se espera dos mantenedores
+   de DT.
-- 
2.55.0

