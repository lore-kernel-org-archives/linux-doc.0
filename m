Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C06A3C6A21
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 17:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285924; cv=none; b=bj0BiefuS4ilIiiIkeiNYLLtNqQcrcpY2uAbD3ujftx0bK5rNpHxpG0cEAYVZUaEi+7JN8Re2WRBQxgb3KPXfDiqp28bXY0l1LBIPRnF8zuxT/1wticujhSugjbIRaWc+lYdsam+eaOZ461Japm9+U8oONqe/rwXnup6Xaona5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285924; c=relaxed/simple;
	bh=FpZm/llMTc0l0PrioU5iza6ypggWVRYru+XZ9161Xaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WDrxXxLNynkYTfSVVKC/MeKK7FmZGQHMitQVIRD1NnzxcgNY7vt31tbqsCCXVFofuJ3a+wERA9aLOTPC0kZ/zyQHI5LKnbSsUnULZWawnRrj3hMkSGaQLEBpsWzhvpj+dZqm9A7BCBmEKZNoQqXU+1WqQFcbDIFJhZLeDuoaFM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKtAdm5q; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKtAdm5q"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ffe6887e29so271467137.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774285922; x=1774890722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ap6ZhUEA26TMDksk4cBN6Hca/v2BYwWTeQbjHirR9Pw=;
        b=hKtAdm5qyzdrKtXNTiZ3oP1OPA/MWDUyA8J410ZqCz59nReCQImBLRrclkoFaEb0pH
         VvVRfEJg2iyCWXVfGSxTbFDAN0XVD0/Sx35WEpCHR+A0X/CObJS5hEQx8Bfbbkb8irnE
         xCtyMwLxKdaOPfac8z7aQG8lHNcNRG7aM8A/LRLxYyHGRHFu1BJfipqvIm0QnRGLN1I6
         ChqPvqGEBiyKZvcMph6sFZzNZmSHgKNwJ1iArv2kqyMEVU6XgYBpkEnfn1C6p+A8/SZO
         wxmfwv1b+Ql0UWfXZntBQ0hefg153L0ONHleHevVuCu89Z0W6QbiMRuyAhF0aH4raZre
         UtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285922; x=1774890722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ap6ZhUEA26TMDksk4cBN6Hca/v2BYwWTeQbjHirR9Pw=;
        b=l1Yad59eW5Rk1+YCAZ0WXKFneBbcq8SaiM8oBsfdu2Y0sDD3v2Tf6BbxUaCQuQ/B6B
         yFJfd36W4Q74A+T7CpJCEhNulrVx8evLn4BzMcBR6OMETFDP1rNcI9Bf3aIpTG2lrhBo
         xwxKoLOK4JLbui1xpzuuXviI4xV4oGtACebkuxHQiLENCzmtnkJy/iljCPYKX0bLNC1E
         RMyRsuxT7AYn3frl8AHdcxC65K8r2IbSrl+DT2l81d++bN4UstQoLiibgpr4M/fThzZB
         OvuvIq5kolNO/OmhH0csMvb70Oa3d/pC06qzP7Vas3yitZq5+y90qxbpPPkuwM+SX88k
         VxuQ==
X-Gm-Message-State: AOJu0Yzdr0+TKQ3ZpO7osg+f5av73uUl6epynGjSggkHGpSaP8ctnK+v
	+nOr4XzIKY+7yfkQ6LimO7RKcdUiX91uo/UtS/HE0KeR1Wr47WGOfKOw
X-Gm-Gg: ATEYQzwe7uYCnLkBnlH+4HBVjkAAj/pyltZlQnQ3SFIg+aN7Kl0mDbluKeReojedmkY
	GlAqC06A4s+l+Q5DxMDuiaNXTBpYSXksLdeVIfnoR3jIICa/Kdv3fF3rviaDo4k/YyiDoSTYpI4
	+tERxdYacG7+s22f1cJd/aOv5jYd+mIHqkNDyY55akJpiA9vr0iVfUu76osAYyE2XQQaGAjnTpN
	99tlIi7jOKZBw99hQ9YrjP7BqqYZBA5jgC11lUSdetfYd2lGPJGfGHxdNBUg9HUb97UdVvbe4QG
	pvhzZZRJOAHiyWe9eJUlhR9SuTOH8t8OFm7X7Tg7NYzz/R5PrHRSPSvdgvX8vAuagYEuyMf694P
	+aPomccicSw9QK5mKEc/sDgbxqow9rT5jsK1Ar+TV0TcStBLHei5YYEF60+IazkOhEHf2B3RQVG
	0UkVImt0V5QYjwKHAQ9EZOphmlpfouNbzDzYBgdl4r9xpzr5lojnb85bEhQweiO4uPCRXhYDcsr
	g==
X-Received: by 2002:a05:6102:80aa:b0:5fe:f14:e701 with SMTP id ada2fe7eead31-602aecd5abdmr6170914137.24.1774285921992;
        Mon, 23 Mar 2026 10:12:01 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bb0901sm9507306241.4.2026.03.23.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:12:01 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 1/2] docs: pt_BR: Add translation for process/conclave.rst
Date: Mon, 23 Mar 2026 14:11:31 -0300
Message-ID: <20260323171133.88074-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323171133.88074-1-danielmaraboo@gmail.com>
References: <20260323171133.88074-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Translate the Linux kernel project continuity documentation (conclave.rst)
into Portuguese (pt_BR). Also, update the main pt_BR index to include
the link to the new translation.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst    |  1 +
 .../translations/pt_BR/process/conclave.rst   | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/conclave.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index a89837aef..efe6a4a3f 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -69,6 +69,7 @@ kernel e sobre como ver seu trabalho integrado.
    Introdução <process/1.Intro>
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
+   Conclave (Continuidade do projeto) <process/conclave>
    Manuais dos mantenedores <process/maintainer-handbooks>
    Processo do subsistema de rede (netdev) <process/maintainer-netdev>
    Processo do subsistema SoC <process/maintainer-soc>
diff --git a/Documentation/translations/pt_BR/process/conclave.rst b/Documentation/translations/pt_BR/process/conclave.rst
new file mode 100644
index 000000000..9071b5a39
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/conclave.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Continuidade do projeto do kernel Linux
+=======================================
+
+O projeto de desenvolvimento do kernel Linux é amplamente distribuído, com mais de
+100 mantenedores, cada um trabalhando para manter as mudanças fluindo através de
+seus próprios repositórios. A etapa final, no entanto, é centralizada, onde as
+mudanças são puxadas para o repositório mainline. Isso é normalmente feito por
+Linus Torvalds mas, como foi demonstrado pelo lançamento da versão 4.19 em 2018,
+existem outros que podem realizar esse trabalho quando surge a necessidade.
+
+Caso os mantenedores desse repositório se tornem indispostos ou incapazes de
+realizar esse trabalho daqui em diante (incluindo a facilitação de uma transição),
+o projeto precisará encontrar um ou mais substitutos sem demora. O processo pelo
+qual isso será feito está listado abaixo. O $ORGANIZER é o último organizador do
+Maintainer Summit ou o atual presidente do Conselho Consultivo Técnico (TAB) da
+Linux Foundation (LF) como reserva.
+
+- Em até 72 horas, o $ORGANIZER abrirá uma discussão com os convidados do
+  Maintainer Summit concluído mais recentemente. Uma reunião desses convidados e
+  do TAB, seja online ou presencial, será agendada o mais rápido possível de uma
+  forma que maximize o número de pessoas que possam participar.
+
+- Se não houver ocorrido um Maintainer Summit nos últimos 15 meses, o conjunto de
+  convidados para esta reunião será determinado pelo TAB.
+
+- Os convidados para esta reunião podem trazer outros mantenedores conforme
+  necessário.
+
+- Esta reunião, presidida pelo $ORGANIZER, considerará opções para a gestão
+  contínua do repositório de nível superior do kernel, de forma consistente com
+  a expectativa de maximizar a saúde a longo prazo do projeto e de sua comunidade.
+
+- Em até duas semanas, um representante deste grupo comunicará à comunidade em
+  geral, utilizando a lista de discussão ksummit@lists.linux.dev, quais serão os
+  próximos passos.
+
+A Linux Foundation, conforme orientada pelo TAB, tomará as medidas necessárias
+para apoiar e implementar este plano.
-- 
2.47.3

