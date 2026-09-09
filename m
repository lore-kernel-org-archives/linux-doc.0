Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7C3AEB2C
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958167; cv=none; b=MDAHEMG6Qk8f5jcs7MOc/kRxKvuBrTgbd95meQsmnK/IDedWTqBAhr3b0fFgXm+4EWzipQeNfJLSeOothe5d4EUOhs9a+O4BQEsqPnNSutOCJqb5XVcQZaliCBS1xyVnnAKJGvVIuZWEYehK0yu1Gos5rFgBSTYSI6sd6ae2k/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958167; c=relaxed/simple;
	bh=SWQFaSjUquKBFqulET1iTe3jl87/15W0LTLiRcZleAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVF6h3v7VdHKeazPuLtLcldCn9XM3SyhlXfz38qu9/MbNndsxnByum1kKq4ZIUFA8Qaid4jJ6ByUkWQ4BFjc2YgNU3FRtMllJjlawT6r2oXRJ1wNsFiOLr9IXAXgqmcM6BgN7jzqR2gLa+e0MYsK8a73m2TbN9+KQf4QoXu+4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVVy8f5L; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVVy8f5L"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292faso378021e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958164; x=1789562964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AEs+4rLOjCtcu/1YAcfD8L53Okq8ZUNZ7zt2ATWBtg=;
        b=FVVy8f5LqpZ5qDTfLRe5nHGytk6b+YmzrBiqyUSwAChewuBnJtxhM5wTu78XZ0ZP4F
         JOIXT7PExqDczS9hLIARDYlm8xvjQZkSsOR/OQRmySHcSsck1OOM5DGrL1+tvWBFGiFk
         MYEhP0pUZRz23uzINM9IQf3vozNvIX1Jfu2C9pBzmfsY+eBS3FNPh+SaZr72mYH4hi+2
         6gqsi1A/zp7NXhKV7MMXscSrEKsrfpS1i8jfGeDiaLAaSqRfVFw1TunipFmHG5xti1Nm
         hsEzeeqRfuFdTQEpJFXgce8aGFW4Cig1VwrWuClFyM/rf8XJ2f/FdCNB0rvlny9kQ+LA
         8eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958164; x=1789562964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AEs+4rLOjCtcu/1YAcfD8L53Okq8ZUNZ7zt2ATWBtg=;
        b=fpPAJIRfK7jjXDGg78UG66n0xi03o7YD6gMK8gv198K+81/aA04eJqyKIKiLmFZNaZ
         MHF03qO6tdwDtI+XwHK3ZA5syJ6D03RO16ihrJY9XGN1s35nQAodJooj3UJaf9y9Ie6M
         sfLfO098SN9aP0v7OOSF7R18WvGIhRbK5A5hEulOLfgp5thnPq5c2TOM1rwFdOObXHWw
         GfNNSNpiJKz3hgdmCHCaHcGp5vznMmhonG7qbrdKZrqech7PRYkhrlF6b3UggjqpYgIP
         GKMlXGKxVVOlnntxfd0J1mYhNVWRzu6Zh0xYhiiT7Q0xjBRW0IJ/nEHf+sIKCkqV8YX4
         sgJg==
X-Gm-Message-State: AFuF++mwI767HAOC/50X9lEQDZmJuQKgm4THU+zLgT9h55Kr5LzoCq2r
	rPRLWJDoXdjwlaJ1H5J74De0qRuXGqFfnXxgqc9UXaAhFubx4BGiT/+6
X-Gm-Gg: AYBFou0EzFR325dMTHZNIXgK1vo9w8kVzfjBL2pY9us/IeQ8eFqI0I+ii27tTfvOdE5
	iLyd2gG3DJy2fJ3HUtIrdbSOm9Lb0CseJrKzCe73SGz7yhIQOz0Sf3TAnyiQUYSfNWYRvLOZQwQ
	xLQFcGczF86wPQlak2bbeU+PmCwcZl7MffwSNS1dOYKDclHPbiTOGBm7g9i6h7JJYed0l2LoPGw
	q7Oa7ZD1an+4N8G98bbnoaPTmZu5xHi1b6ITTy+xddWgy9viEhNf0DS7ulNn1efTbdt2KWLV6KK
	UAj/pGLX7AuKlyz9y5EEyS5Cuc0kUBIJK9f+/L5mls2ikVMCpuGdV+ho+2+vmtpEe9PBn2bvR2a
	rGpbDOSUAbYUZoRO7nEc+3u5BfycDpZPPRUwA0Xyn/5f2pNwmxvks5qGsmIoJmiV7bSlTh5nPb6
	rQJ6egkdEMVbSTeo3/yfCVNyp9Wu8c/PI48NbzEC1gjEc4Zhjkr7m3yYQRbqfiw+pwUjKFeYtLH
	yuhQQT9XByfPkkmFR9E3/PxSFmTdnGPM1oQXE6oZNaxYJS99XONEjaacpaFQubpKxpnsRRSFmfG
	xKrO7u75JcU4SEAts/0D8l+FG4aXMfFnnkFUF2/Y95u3JTM=
X-Received: by 2002:a05:6122:218d:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c828781f00mr2877402e0c.3.1788958159521;
        Wed, 09 Sep 2026 05:49:19 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm11993742e0c.10.2026.09.09.05.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:49:17 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 2/4] docs: pt_BR: translate kernel-enforcement-statement.rst
Date: Wed,  9 Sep 2026 09:48:45 -0300
Message-ID: <20260909124905.6156-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909124905.6156-1-danielmaraboo@gmail.com>
References: <20260909124905.6156-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/kernel-enforcement-statement.rst into
Brazilian Portuguese and add it to the pt_BR process documentation index.

This document outlines the Linux kernel developers' statement regarding
how the license for the software is enforced and compliance expectations.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/index.rst      |   1 +
 .../process/kernel-enforcement-statement.rst  | 163 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 38150e566..63282b053 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -59,6 +59,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Código de Conduta de Compromisso do Colaborador <code-of-conduct>
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
+   Declaração de Aplicação do Kernel Linux <kernel-enforcement-statement>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    Estilo de gerenciamento do kernel Linux <management-style>
    Assistentes de código <coding-assistants>
diff --git a/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst b/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst
new file mode 100644
index 000000000..3833c433c
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst
@@ -0,0 +1,163 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Declaração de Aplicação do Kernel Linux
+---------------------------------------
+
+Como desenvolvedores do kernel Linux, temos um grande interesse em como nosso
+software é usado e como a licença do nosso software é aplicada. A conformidade
+com as obrigações de compartilhamento recíproco da GPL-2.0 é crítica para a
+sustentabilidade a longo prazo do nosso software e da nossa comunidade.
+
+Embora exista o direito de aplicar os interesses de direitos autorais separados nas
+contribuições feitas à nossa comunidade, compartilhamos o interesse em garantir
+que ações de aplicação individuais sejam conduzidas de uma maneira que beneficie
+nossa comunidade e não tenham um impacto negativo não intencional na saúde e no
+crescimento do nosso ecossistema de software. A fim de deter ações de aplicação
+inúteis, concordamos que é do melhor interesse da nossa comunidade de
+desenvolvimento assumir o seguinte compromisso com os usuários do kernel Linux,
+em nosso nome e em nome de quaisquer sucessores dos nossos interesses de
+direitos autorais:
+
+    Não obstante as disposições de rescisão da GPL-2.0, concordamos que
+    é do melhor interesse da nossa comunidade de desenvolvimento adotar as
+    seguintes disposições da GPL-3.0 como permissões adicionais sob nossa
+    licença com relação a qualquer reivindicação não defensiva de direitos sob a
+    licença.
+
+	No entanto, se você cessar toda violação desta Licença, sua licença
+	de um detentor de direitos autorais específico será restabelecida (a)
+	provisoriamente, a menos e até que o detentor de direitos autorais encerre
+	explícita e definitivamente sua licença, e (b) permanentemente, se o
+	detentor de direitos autorais não notificar você sobre a violação por
+	algum meio razoável antes de 60 dias após a cessação.
+
+	Além disso, sua licença de um detentor de direitos autorais específico é
+	restabelecida permanentemente se o detentor de direitos autorais
+	notificá-lo da violação por algum meio razoável, se esta for a primeira
+	vez que você recebe um aviso de violação desta Licença (para qualquer
+	trabalho) daquele detentor de direitos autorais, e você sanar a violação
+	antes de 30 dias após o recebimento do aviso.
+
+Nossa intenção ao fornecer essas garantias é incentivar um maior uso do
+software. Queremos que empresas e indivíduos usem, modifiquem e distribuam
+este software. Queremos trabalhar com os usuários de forma aberta e transparente
+para eliminar qualquer incerteza sobre nossas expectativas em relação à
+conformidade ou aplicação que possa limitar a adoção do nosso software. Vemos
+a ação judicial como um último recurso, a ser iniciada apenas quando outros
+esforços da comunidade falharem em resolver o problema.
+
+Por fim, uma vez que um problema de não conformidade seja resolvido, esperamos
+que o usuário se sinta bem-vindo para se juntar a nós em nossos esforços neste
+projeto. Trabalhando juntos, seremos mais fortes.
+
+Exceto onde indicado abaixo, falamos apenas por nós mesmos, e não por qualquer
+empresa para a qual possamos trabalhar hoje, no passado ou no futuro.
+
+  - Bjorn Andersson (Linaro)
+  - Andrea Arcangeli
+  - Neil Armstrong
+  - Jens Axboe
+  - Pablo Neira Ayuso
+  - Khalid Aziz
+  - Ralf Baechle
+  - Felipe Balbi
+  - Arnd Bergmann
+  - Ard Biesheuvel
+  - Tim Bird
+  - Paolo Bonzini
+  - Christian Borntraeger
+  - Mark Brown (Linaro)
+  - Paul Burton
+  - Javier Martinez Canillas
+  - Rob Clark
+  - Kees Cook (Google)
+  - Jonathan Corbet
+  - Dennis Dalessandro
+  - Vivien Didelot (Savoir-faire Linux)
+  - Hans de Goede
+  - Mel Gorman (SUSE)
+  - Sven Eckelmann
+  - Alex Elder (Linaro)
+  - Fabio Estevam
+  - Larry Finger
+  - Bhumika Goyal
+  - Andy Gross
+  - Juergen Gross
+  - Shawn Guo
+  - Ulf Hansson
+  - Stephen Hemminger (Microsoft)
+  - Tejun Heo
+  - Rob Herring
+  - Masami Hiramatsu
+  - Michal Hocko
+  - Simon Horman
+  - Johan Hovold (Hovold Consulting AB)
+  - Christophe JAILLET
+  - Olof Johansson
+  - Lee Jones (Linaro)
+  - Heiner Kallweit
+  - Srinivas Kandagatla
+  - Jan Kara
+  - Shuah Khan (Samsung)
+  - David Kershner
+  - Jaegeuk Kim
+  - Namhyung Kim
+  - Colin Ian King
+  - Jeff Kirsher
+  - Greg Kroah-Hartman (Linux Foundation)
+  - Christian König
+  - Vinod Koul
+  - Krzysztof Kozlowski
+  - Viresh Kumar
+  - Aneesh Kumar K.V
+  - Julia Lawall
+  - Doug Ledford
+  - Chuck Lever (Oracle)
+  - Daniel Lezcano
+  - Shaohua Li
+  - Xin Long
+  - Tony Luck
+  - Catalin Marinas (Arm Ltd)
+  - Mike Marshall
+  - Chris Mason
+  - Paul E. McKenney
+  - Arnaldo Carvalho de Melo
+  - David S. Miller
+  - Ingo Molnar
+  - Kuninori Morimoto
+  - Trond Myklebust
+  - Martin K. Petersen (Oracle)
+  - Borislav Petkov
+  - Jiri Pirko
+  - Josh Poimboeuf
+  - Sebastian Reichel (Collabora)
+  - Guenter Roeck
+  - Joerg Roedel
+  - Leon Romanovsky
+  - Steven Rostedt (VMware)
+  - Frank Rowand
+  - Ivan Safonov
+  - Anna Schumaker
+  - Jes Sorensen
+  - K.Y. Srinivasan
+  - David Sterba (SUSE)
+  - Heiko Stuebner
+  - Jiri Kosina (SUSE)
+  - Willy Tarreau
+  - Dmitry Torokhov
+  - Linus Torvalds
+  - Thierry Reding
+  - Rik van Riel
+  - Luis R. Rodriguez
+  - Geert Uytterhoeven (Glider bvba)
+  - Eduardo Valentin (Amazon.com)
+  - Daniel Vetter
+  - Linus Walleij
+  - Richard Weinberger
+  - Dan Williams
+  - Rafael J. Wysocki
+  - Arvind Yadav
+  - Masahiro Yamada
+  - Wei Yongjun
+  - Lv Zheng
+  - Marc Zyngier (Arm Ltd)
-- 
2.47.3

