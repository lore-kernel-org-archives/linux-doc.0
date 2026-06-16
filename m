Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E411DE8AE
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571173; cv=none; b=HXMac5sVcxWAmKhtnAEb0EEo0RbsAqEWnLm8btekSIXSzzPU0TgVAVUS9gsQqqIjtUTzXjJbcduAFxBZKkUS9tLlQFIB/ErYPW5ew6uucDtN4HWIrm/jeD13t7MaSQgBY3vDj+rhPl2fWIlaocafZeNbZekGVZszbx4L1iLVOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571173; c=relaxed/simple;
	bh=hYM4JDORW6bTXsgbaG4uUbN3zasKifJGQLfyuowo2rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UkW+vB1OJvIgjYi7UEM4aoBQJyheap1UHEcdqKLXc+551w8AB1/ljy6d57Pa4E41CF5pyqWuMoP3TpQPNmE9y5aWy0rooJ8HJCdk7lIKSrWkchDCLAxKgZiqAQnD0EcilCYL7Etfpg6ddkh7504JwZg2n5TnoTYkZcUOiJghcQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6VWhbe6; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6VWhbe6"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9667fa9a3e1so1223754241.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 17:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781571168; x=1782175968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9AOoD9YDFvzjEazmYA+K7Nx1hWhq2yBMfYSmYmmIRI=;
        b=m6VWhbe6ZOk6+nBNJpa+FtuAWAdqMzdog/4dmFPRTCB1QObdb3FkqRyx7cYiA/Aj7H
         BBUKB/duReLVzmYC08R/gSTzlaJmG9wKNcvYFQPLp3tURav+IC04+pX3/LTm6wFGRWoM
         iYzR5l7mk0gxWfRbx5y+elLB4PXzMFE2DvAk3xosUMzpCGG7npwutIJViIPkrGfrWay5
         1IQYaDn3wnL5KwkIePheR4awHfPyGdhECR9UGAlNg0hvwDBQO8AttJGruO2nSA9ldJyf
         mumtqvhnKIjhjja4SWxR0Bif1hDkqaSpsAkAHgfHCRAshQTjQhu7++DqoIQ36EL2jYba
         nu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571168; x=1782175968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9AOoD9YDFvzjEazmYA+K7Nx1hWhq2yBMfYSmYmmIRI=;
        b=YLO00CM4zn4+VwU7QBemVWTQyGGP+8eURXHZ2M136U/VRughhNJ6inpo8P4wqqyRns
         2aMx1INyaMcisx+yBz6+j1IGbqXV1ZIWAZ/+Dc8cXiI9SKCiKFGKCGB5hmp7gfblPF2G
         B8CylgTXVzHvYhEVtd6w+rgA3CUYyf0DWtruv+f/0fXc37lqoocSdV3y9Io98ig69CFt
         Jrp34rjDgKHYsCXiHCSyZYmPTImqCfq58fzTQKVA0dUd4uSlYv6bsdwXrzO7YotYlL37
         MqHFL05nq9Yn7hvy5CA1nER1qXo2i6cqgdEqYLjVxbBYsN/LKs5VigJfzIMoLQqs/OgO
         HTIA==
X-Forwarded-Encrypted: i=1; AFNElJ8DboXOmMiduWwferWiJeuTzNv4nD8UWJzg9AK0Qf5cBBvifyf4OisIFfET4riv57k+Tw84bpi+SJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFQDmboBmevI2f9jih5RAZdkfke+Mqdhjt6jmoaYnXWNRDIqH
	rPi8xy/6FP1yAg1AMswyzlLQ+NyhNXiiXyLqB3dtPJmtxafxoB9OYCi5
X-Gm-Gg: Acq92OH2LfT+TIz2FGp0MOrS4kho+FmGduZ4ziF5sxBYZsr+2RPGO0/VaZuoXtNs8CG
	SW0B85K8To/KacrCcj7D6GFpKWnsbhGZ8MJ6tkgCSy37bUZXYCy3dchKHM8FqYg8WRKZyxoHDZp
	bvldpFBoGRbc8Suybnl8aIHVLq1eWghERpvV1WQ6+CtlBeAcWr0/GCbvv1+5ccQr+lwhH9jvA5h
	XE8YICVr/kFOCzx/fyJVwcQ160rnAf4ibPfzNWEV1dEhEJaxxtBmahOgpvGK0ty3+qCNN81kher
	I5tSp2kIDgt0lnk+/cPPuW73oi5+hN5KCSGVmRtZ0MjeQn8D9+NoqrS6/XMu9Xrc0byt7zh3eFe
	8g3dmyUS0qCYWqTryayfY7p6Ayrp2muv1DQ1lZPXgvRrXmNZXz8m/VhlB+ZGVDVWtsOOZVU7a+A
	+YxYv00Z2FJzmkAB7FNPYBfsYHe6QMbbRp
X-Received: by 2002:a05:6102:3e91:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-722d7e61cb7mr908712137.2.1781571168493;
        Mon, 15 Jun 2026 17:52:48 -0700 (PDT)
Received: from localhost ([2804:7f0:3d7:1d78:c15d:57e0:8f5f:23e4])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a05a6cb6sm4478636241.8.2026.06.15.17.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:52:47 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH] docs: pt_BR: update netdevsim section in maintainer-netdev.rst
Date: Mon, 15 Jun 2026 21:52:34 -0300
Message-ID: <20260616005234.11036-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Brazilian Portuguese translation of maintainer-netdev.rst
to align with the latest English version.

    Key changes include:
    - Updated the netdevsim section to reflect upstream changes
    - Added guidance on netdevsim-based API testing
    - Fixed minor spacing and formatting issues

Signed-off-by: Amanda Corrêa <amandacorreasilvax@gmail.com>
---
 .../pt_BR/process/maintainer-netdev.rst       | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-netdev.rst b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
index 5de282804..e9bb998c7 100644
--- a/Documentation/translations/pt_BR/process/maintainer-netdev.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
@@ -22,11 +22,11 @@ netdev
 ------
 A **netdev** é a lista de discussão para todos os assuntos do Linux relacionados
 a rede. Isso inclui qualquer item encontrado em ``net/`` (ex: código principal
-como IPv6) e  em ``drivers/net`` (ex: drivers específicos de hardware) na árvore
+como IPv6) e em ``drivers/net`` (ex: drivers específicos de hardware) na árvore
 de diretórios do Linux.
 
 Note que alguns subsistemas (ex: drivers de rede sem fio/wireless), que possuem
-um  alto volume de tráfego, possuem suas próprias listas de discussão e árvores
+um alto volume de tráfego, possuem suas próprias listas de discussão e árvores
 específicas.
 
 Como muitas outras listas de discussão do Linux, a lista netdev é hospedada no
@@ -34,7 +34,7 @@ Como muitas outras listas de discussão do Linux, a lista netdev é hospedada no
 https://lore.kernel.org/netdev/.
 
 À exceção dos subsistemas mencionados anteriormente, todo o desenvolvimento de
-rede  do Linux (ex: RFCs, revisões, comentários, etc.) ocorre na **netdev**.
+rede do Linux (ex: RFCs, revisões, comentários, etc.) ocorre na **netdev**.
 
 Ciclo de Desenvolvimento
 ------------------------
@@ -506,8 +506,14 @@ netdevsim
 
 O ``netdevsim`` é um driver de teste que pode ser usado para exercitar APIs de
 configuração de driver sem a necessidade de hardware compatível. Mock-ups e
-testes baseados no ``netdevsim`` são fortemente encorajados ao adicionar novas
-APIs, mas o ``netdevsim`` em si **não** é considerado um caso de uso/usuário.
+testes baseados no ``netdevsim`` são encorajados ao adicionar novas APIs com
+lógica complexa na pilha. Os testes devem ser escritos de forma que possam ser
+executados tanto contra o ``netdevsim`` quanto contra um dispositivo real
+(veja ``tools/testing/selftests/drivers/net/README.rst``). Testes exclusivos
+para o ``netdevsim`` devem se concentrar em testar casos extremos e caminhos de
+falha no núcleo que são difíceis de exercitar com um driver real.
+
+``netdevsim`` em si **não** é considerado um caso de uso/usuário.
 Você também deve implementar as novas APIs em um driver real.
 
 Não damos garantias de que o ``netdevsim`` mudará no futuro de uma forma que
@@ -577,8 +583,11 @@ independentemente do nível de experiência. Para orientações gerais e dicas
 
 É seguro assumir que os mantenedores da netdev conhecem a comunidade e o nível
 de experiência dos revisores. Os revisores não devem se preocupar com o fato de
-seus comentários impedirem ou desviarem o fluxo de patches. Revisores menos
-experientes são fortemente incentivados a fazer uma revisão mais aprofundada das
+seus comentários impedirem ou desviarem o fluxo de patches. Uma tag Reviewed-by
+é entendida como "Eu revisei este código da melhor maneira possível" em vez de
+"Posso atestar que este código está correto".
+
+Revisores são fortemente incentivados a fazer uma revisão mais aprofundada das
 submissões e não focar exclusivamente em questões triviais ou subjetivas, como
 formatação de código, tags, etc.
 
-- 
2.43.0

