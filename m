Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848128;
	b=Sr8W1LlVOT0ypGEFzK0CEvldgeXqqzUFThhKD7JX6NILWTYSuAXUAlDL8tmhfrLRrUkl
	 UYumuK8IMEG51yPcxeW1RT74djXCmLu+x4uWyuKkQL3PR2l4/zmJYe+pD2yaC3we5RcAl
	 ea4cIoXqTxAzSQZ1FyoP74hdeWH2zkRQt37xkt1idV5WnWpoH1nEK2OTRApSoYILepzQI
	 E5/1npfl0DKP+pOL+/14gsZzdn0c4amkbixFueJAddG45uK4DVBZGeOdQaAJOl+JLt6VF
	 mTkR504FkDFsjqQP2tj9nkayuMx9xsy5Z3m4XXx+Cepi6WREU1JTwpuSbKvMm63vBMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lIDpQ/pGiLYDI48Cm5y1INPLWR+S4Bm0G5FeDEtFc24=;
	b=naIRajFWkIeM966DSdqtPANqUMBkN980kKrrtgmK+gi8YxZ8nbzxqoLjuOYaTVtVySvr
	 EOXWR52wJQf0JfSnqNa2Ou3jaqG6XCZ553tz+NsWIDKaFx4PwnHt+BsuXz6G6FvCt5tpE
	 T0Zor5bTox2D1qiejB738ZmRsxJ3dMuJEPPq9VoIg8Bs23dEAmS4Rc2Mtybwb9am8Pdur
	 yRr/vEdoDk+D4hSVoL1rYgvSlk5+QaJ4rI/yJsPsHpEBAA7oQ/AZK6r9yIA5ZTrP54Cl4
	 Q+Php44szpZTxs8b7q94/+t+ltbo/8/lGsAOgypvnLAs8dbeBJoqeLsgsh+oFJjZfQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWlmnXpo;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F61606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWlmnXpo
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36661f953e4so3053362eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848127; x=1793452927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIDpQ/pGiLYDI48Cm5y1INPLWR+S4Bm0G5FeDEtFc24=;
        b=VWlmnXpoLGoJTjCF7/ud80ixDnsiwPDDQ/OH9rqUyArwr8YXN8RVKN6q3A7IUY5Ak9
         GiAjLYdcIbnRxLmdt0v9ezBIxYpBw0lup4hUl2A+YR4OJYEiAx40xIe+AxMN1lfHJpW3
         JfWaif/PScK2K1RNvdcfEPk6iqmBbtu5l6jK9KHqKOOwN3yRkKz57HJtN5X8vy3Nd/QH
         iQxEUkdimbkNjNxhZ5YBbc+xr282CUNWlsF3bPwIYn8IAuoXnROkNypLH2OuYC6h31R1
         efbnG4B7t4rghmUsxuxZSYus2xE3x0HEIGM/0PMJKVzgMPmFCjOdCahhrjJh0hp5wHTo
         C+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848127; x=1793452927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIDpQ/pGiLYDI48Cm5y1INPLWR+S4Bm0G5FeDEtFc24=;
        b=AvGQ00lLubL2gkimYQIZF53pO3ED8wF4tiQnZ0JHGd1I8MnzcM1sw8/lvOgiFdnL90
         OT4S1FKl2Q2WewzUIYFWrOKFafLyCVuElEl8Ppv9LHEVTO1KSzMXs0EZRdfc00ma5pA1
         i73YqIxfsEQFfaD53DgJk7HQqbGHTcwNCeiy9iPDULzQAsyzOXaL6bIUNiPof/MUsKpO
         52KS1RMO97TXYtRrfUEdE8EllX0Nl02q/LU+MBiFj8GCxlssLNhxurA3smeoWBUPvozI
         CvAVZ2Qug58sQ0i5EjBDqzPqXscuJTyQjTYYJEjKiPTVqRieS5ioeodFKjyON1N1KSm3
         xhXw==
X-Forwarded-Encrypted: i=1; AKwUvBzvcHb69wS/S9Yig0Eg66syaLvNjlodty1B9QjJqmavXeBEe04eisClfZe8J6VUO+1pwdvT0uHHCS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZE9wSD2nWcvON1nsOYtqaKxFeQGxEjB44gJlJzWFjvNqKmOGw
	sXmSmafAkg6Rdci07kMgaaKj6Qjo2mowe0egNx96uyLtmzYB7+Rgvtcj80CtREEp
X-Gm-Gg: AYBFou1bDbM28xFMjbznbrmHfRw/HElTjyRrNqTg8XYuI0VL4ioYJ3EoOxWF+iKOcpR
	LKM/oEdtSO3br7iaNo5vornEEAnL2jZRK9btTY2jx9ft32gXSieLTdxmUv2hY0H3GKNoIVWRLLl
	FNTwXyuYw9/t3hmnUXHmo0fYIPcizZSFLEpFpZMrSS7OZNWtyXxq2U06Zbu+lYlyDtl1DkTWDm6
	9Z6v/xG7M/Zy16YwY8iQiy5G41yUN7go1XL6pP6kyeTUWcG+tnmMthNRPw6zg01/XQg0fKBZaXe
	j7ytdWHGpnGA2h/AnNH0KLV1rBBani6w57SBQBGYCj+mxsSfHcB1ZRZCdJWbfV+dm57ytWxf6ZY
	0/eT8YLi66r0xruftxl5y76tUqVpDP82vhmEGXII4xeCgCJLxbqr8/zoum6j5XsI3Xq+1w+4YD4
	RlIRXarfAIJeRt9dwibcReGoV5DJjMjBr89Xa1n1SFRVRHdkuct214YwSMdbziHR8SkOhViFA6L
	MlhyieTNzMtz1nntgloHrlJtBg6OKoxSf8Irf373wSCVoxhIf9mU8v8jsTBV9z5Yqsb6dkLDNUj
	Trnk0m7D8kM5n+66FMZP2hRLc4McQmAECMbP6oXO7Y3xrtrAXWKX3PZuroqjQulf1xW5XBznxDT
	mUCFispUJ
X-Received: by 2002:a05:693c:69d1:b0:368:2548:c07b with SMTP id 5a478bee46e88-369e8495612mr2963053eec.13.1792848126940;
        Sat, 24 Oct 2026 06:22:06 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:06 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 02/11] docs/translations/pt_BR: process: coding-assistants.rst: add bug procedure
Date: Sat, 24 Oct 2026 10:21:49 -0300
Message-ID: <20261024132158.39493-3-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sync with the English version: translate the new "Procedure for
finding and fixing bugs" section, which lists the steps an AI assistant
must follow when finding and fixing bugs.

Also fix two translation errors: "GPL-2.0-only" is the license
identifier, not "only GPL-2.0", and the generated-content.rst pointer is
about guidelines on content generated by AI assistants, not only about
code.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/coding-assistants.rst       | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/coding-assistants.rst b/Documentation/translations/pt_BR/process/coding-assistants.rst
index f6062b22a..906dc880e 100644
--- a/Documentation/translations/pt_BR/process/coding-assistants.rst
+++ b/Documentation/translations/pt_BR/process/coding-assistants.rst
@@ -13,7 +13,7 @@ padrões de desenvolvimento do kernel:
 * Documentation/process/coding-style.rst
 * Documentation/process/submitting-patches.rst
 
-Para guias e conteúdo sobre códigos gerados por assistentes de IA veja:
+Para diretrizes sobre conteúdo gerado por assistentes de IA, veja:
 
 * Documentation/process/generated-content.rst
 
@@ -23,7 +23,7 @@ Licenças e Requisitos Legais
 Todas as contribuições devem estar de acordo com os requisitos de licença do
 kernel:
 
-* Todo código deve ser compatível apenas com GPL-2.0
+* Todo código deve ser compatível com GPL-2.0-only
 * Use identificadores SPDX de licença apropriados
 * Veja Documentation/process/license-rules.rst para mais detalhes
 
@@ -38,3 +38,44 @@ A pessoa que envia é responsável por:
 * Garantir conformidade com os requisitos de licença
 * Acrescentar sua própria tag Signed-off-by para certificar o DCO
 * Assumir toda responsabilidade pela contribuição
+
+Procedimento para encontrar e corrigir bugs
+===========================================
+
+Quando um assistente de IA é usado para encontrar e corrigir bugs, ele **DEVE**
+seguir pelo menos estes passos:
+
+1. Antes de começar, leia toda a documentação do processo listada acima, bem
+   como qualquer outro documento mencionado na solicitação. Não confie em
+   trechos isolados encontrados por busca de palavras-chave.
+2. Anote o ID do commit e localize um bug conforme instruído.
+3. Para qualquer bug encontrado que não seja trivial, verifique se ele parece
+   real tentando criar um reprodutor que o demonstre. A falta dele pode fazer
+   com que o relatório seja ignorado, já que muitos relatórios de bugs não
+   verificados enviados aos mantenedores acabam sendo inválidos. Pare aqui se,
+   no fim, ele parecer equivocado.
+4. Escreva uma correção para o bug. Esta parte não é opcional: exceto em
+   alguns poucos casos muito raros, um assistente de IA capaz de encontrar um
+   bug é capaz de corrigi-lo. Note que correções escritas na mesma sessão
+   usada para encontrar o bug geralmente resultam em correções melhores e mais
+   precisas, pois o contexto de raciocínio do LLM continua presente.
+5. Compile e verifique se a correção funciona, usando o reprodutor ou
+   executando novamente uma análise completa; descarte qualquer correção que
+   não funcione e tente outra. A correção não deve adicionar avisos de
+   compilação e deve passar nas verificações do checkpatch.pl (veja
+   submitting-patches.rst).
+6. Faça o commit da correção que funciona com uma mensagem detalhada
+   descrevendo o problema, a solução e uma tag Fixes. Não adicione uma tag
+   Signed-off-by.
+7. Identifique os mantenedores e as listas usando scripts/get_maintainer.pl.
+   Documentation/process/security-bugs.rst mostra como fazer isso.
+8. Indique o que não pôde ser feito. Se a correção não pôde ser compilada ou
+   testada, ou se não foi possível produzir um reprodutor, diga isso
+   explicitamente: atualmente os mantenedores perdem tempo demais analisando
+   relatórios não verificados e correções não testadas.
+9. Leia Documentation/process/threat-model.rst para determinar se o bug é uma
+   vulnerabilidade ou um bug comum, e deixe o resultado para a revisão do
+   relator (o assistente nunca deve enviar nada por conta própria). Bugs
+   comuns são enviados conforme descrito em
+   Documentation/process/submitting-patches.rst, e vulnerabilidades conforme
+   descrito em Documentation/process/security-bugs.rst.
-- 
2.47.3

