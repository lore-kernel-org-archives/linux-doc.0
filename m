Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830188;
	b=ygDI8UIGg5RP/3F1S51Y+ghR4CTtoKDJh3x4xk1nEjsiB5mlNuyCi1ZvEuh6dM7RFvrQ
	 7YCtUzVrFS54i/EbUAUAOll4731pWL/1CjeWsUknPrp3F4rCSO7ocv3DgSijH6Ap0Lbt6
	 Wx8xwDW5wzY4w7zQu/RXjv+82c6wp1qK/nA/9mS8/pTGiBRHYVqU3rgKjdfYLiiQ8RLLB
	 oylz6xxzcPVZ2QJ0M1Ht4mFfLazGy4nJ6QiRvx3rc0zY0EWBWZTKGVvT4DKbMVwggUXqp
	 QyQqFQn1GIJonPC7EqTMVMWTb66paWFscXyipYx9n8yEcw/fpJ1ARJf2oP7R3ITKCVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Me3ww9u4H6A4jsSBpe8oTXsU+OE3eeLa3AtvmDhwzo0=;
	b=F6H4EcqYpwcvwAaIZI8Bbj/gR1FRO8x8POzY5066H7IdoQj3sf4jfFJ9R4FSHetl9dz6
	 /9zROud5vPnU68Tyyri+mM8h9Z3vLyZYBNWH8n+OH5XmI4+5AD4v6qMQaK8kCzNK3tQfy
	 WU+L44BugC8KCTD5mMCHK9ZTZcAjbSnBWy5ArZMm5enwnf87Aiz+u2FHHtu9XhyaFt7fL
	 9N5+1eeS4q2F3oHWqVwC6qPOYsE8GZoEtZqr8AshG3PVKrMU2NrrxexzuRFyJzhBMMJu/
	 kGxhiwarNKi9qH/k5SUiV7o8GEhmqZ1dcOOiO8dL1RIsitngMRUFMKanT2BsgBZu7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyPeVURF;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA118606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA118606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyPeVURF
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b2d14968c9so32216547b3.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830187; x=1795434987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Me3ww9u4H6A4jsSBpe8oTXsU+OE3eeLa3AtvmDhwzo0=;
        b=WyPeVURFT+v5E5oEpei7JPNmLL97eHWk5gMVW5NAOSQkzqjEvIHURlOgEGUtuj9pMG
         jrgudS8UeAAWswpcltoLdSf1G+BaTQDwvxH0jdL3B9oAKcBtF1NW04y2qr3Jf1Cd9Tjf
         s5d2+sIxMpNk52Iif6pOvkwEE0At70/7/+wusKrlNYBA6u14oabGK82aWwpHc+yJVQZn
         dFc0bwoEEudptq6bno/EzzrvfkaxqabMQi1MYt3426aM79ZySAn5drbO7rjIAE2Zj9YZ
         qBAWNdawkMiR4C3zo3CMe+3XTvnbaO4xdeOMmULudc0JSlMV4kAq4NtLgsApLTwi+2Zy
         QFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830187; x=1795434987;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me3ww9u4H6A4jsSBpe8oTXsU+OE3eeLa3AtvmDhwzo0=;
        b=LhR0a3OZt11FAl/pz/7C78x1BRqF1aCBWLGsddLll5QC9cbpn4sPZS6990Gctk2WDC
         2rBC3CBR89iaM5eDuiF6SeFW8kE3Z1axksYT39KH5gGIX9VgYYy/GV8QOvuzP4Z8t+hE
         saPTrlbRRM/ANNriBn9WbJZyY6nlxbuYqZy/bna2C0xIAMtfipbAj3/8AeScx0bD9oPX
         0GvX0rgWlFB1mKT5LokCFmxvc17KrwIjJPRDiwFlIatMKsII3c8e64fgqnpkBaZ+39a1
         ZXXISrv7edVLry+BgB34FOum4/cp1sVERWu8AKa2oJ42v5CEJCoq7tPqYggJhBQornEj
         MKQQ==
X-Gm-Message-State: APuU4Z94UVuOpoL/mfyXwR6qoRuWGrRWFu0e+/Mk49GWMi562UW6qRoG
	LdmhB+dnlXTV1DLzEbhgkoeDWvihrEd7UX47oYDKzzlk5gXMFRYATLmE
X-Gm-Gg: AZFdTZdNjMoBIZRWUNT2/I1Zr5vdbqJ8aiwnspRefI50eAjkwfx9751BClIFHc9em+d
	rC+nTyjGKy7b+tXRu/B8bSH8mNvMdJZZVdZ0p28ySQeQkgIXXTccsACm0IBQhnk59ssMLkR4Mv2
	eXhJ8H3GFE3NEUGThc7d/F8qWfB2Q2+KZNaPZRoHzfEzE6k/CjUCWQYKJ7RvUV2SHa5M11750Kw
	XEulh+e+G4h5OGNj8+BsIDf7wW+AIDelBmS4nq7OMtmettLZglYkENpF5F4gNL1IUcMS3tzXesv
	bjdi9JCigY/60LaePABBv5s65D7g0X0sAkFKOm81tpl4l8yfiWfjMr/1gRupqxKeD5Q4GJXhWGM
	PCDl3pts1w/BlrNlSCPIMIfZ52TKQHCZE4xsOxvSU6UzPk1nZtmU2tjjVzj4xcuiuTS5VvkoDOB
	0wRWP3qmDCJsZaGy+AF9IbPb8WrmOURpjUz/4fuTdHuPvfy373D9h71LNEipwb95fzGOyqqOk1a
	QWCF6/+KsxVDOlesogLJBr8prHIit9XWEsnhbZ1e8aJvzjxUO7hnJt3zsPIG/PfRkaRcO/oRIEP
	NEneoqfMBc6MrKGfdyH7q99rydRhgjE0xnoCD8BFclR/NYYWjL5IKqLNtZvcACPoasZTJ/gC/Oq
	AmNpTYVTh+g1Nm7pQRPm65ofGwdnIIZTEZ3r8qu+Zv382Fb9phtIcH9oe2a3YpjCAXgmBKN0pKz
	AsSEWawfhv/G8=
X-Received: by 2002:a05:690c:6989:b0:8b4:e10f:bef6 with SMTP id 00721157ae682-8b4e10fc856mr6228317b3.43.1794830186350;
        Mon, 16 Nov 2026 03:56:26 -0800 (PST)
Received: from Daniel ([187.45.177.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm84198817b3.36.2026.11.16.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:25 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v1 1/3] docs: translations: pt_BR: fix wording in index, disclaimer and howto
Date: Mon, 16 Nov 2026 08:56:03 -0300
Message-ID: <20261116115605.174735-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116115605.174735-1-danielmaraboo@gmail.com>
References: <20261116115605.174735-1-danielmaraboo@gmail.com>
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

- disclaimer: "foi traduzida" -> "está sendo traduzida", since the
  translation is still incomplete.
- index: "As guias" -> "Os guias" (wrong gender).
- index, howto: replace em dashes with commas, and fix the commas
  around "e seus contribuidores" and "se puder".

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/disclaimer-pt_BR.rst | 2 +-
 Documentation/translations/pt_BR/index.rst            | 8 ++++----
 Documentation/translations/pt_BR/process/howto.rst    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/pt_BR/disclaimer-pt_BR.rst b/Documentation/translations/pt_BR/disclaimer-pt_BR.rst
index 3cae22c13..33fbc6ca0 100644
--- a/Documentation/translations/pt_BR/disclaimer-pt_BR.rst
+++ b/Documentation/translations/pt_BR/disclaimer-pt_BR.rst
@@ -5,7 +5,7 @@
 Aviso sobre traduções para português
 ====================================
 
-Esta documentação foi traduzida para português brasileiro por voluntários.
+Esta documentação está sendo traduzida para português brasileiro por voluntários.
 Em caso de qualquer divergência entre esta tradução e o documento original
 em inglês, a versão em inglês (encontrada no diretório Documentation/)
 deve ser considerada a única fonte de verdade.
diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 5557c5e4e..ee9316b90 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -35,12 +35,12 @@ para quem prefere ler em sua língua nativa. No entanto, tenha em mente que a
 *única* documentação oficial é a em língua inglesa: :ref:`linux_doc`
 
 A propagação simultânea de uma alteração em :ref:`linux_doc` para todas as
-traduções é altamente improvável. Os mantenedores das traduções — e seus
-contribuidores — acompanham a evolução da documentação oficial e tentam manter
+traduções é altamente improvável. Os mantenedores das traduções e seus
+contribuidores acompanham a evolução da documentação oficial e tentam manter
 as respectivas traduções alinhadas na medida do possível. Por este motivo, não
 há garantia de que uma tradução esteja atualizada com a última modificação.
 Se o que você ler em uma tradução não corresponder ao que ler no código,
-informe o mantenedor da tradução e — se puder — verifique também a
+informe o mantenedor da tradução e, se puder, verifique também a
 documentação em inglês.
 
 Uma tradução não é um *fork* da documentação oficial; portanto, os usuários não
@@ -60,7 +60,7 @@ encontrar algumas diferenças de forma, mas que transmitem a mensagem original.
 Trabalhando com a comunidade de desenvolvimento
 ===============================================
 
-As guias fundamentais para a interação com a comunidade de desenvolvimento do
+Os guias fundamentais para a interação com a comunidade de desenvolvimento do
 kernel e sobre como ver seu trabalho integrado.
 
 .. toctree::
diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documentation/translations/pt_BR/process/howto.rst
index 518e62d37..6f0b3cd9d 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -316,8 +316,8 @@ a árvore -stable e como o processo de lançamento funciona.
 Árvores específicas de subsistemas
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Os mantenedores dos vários subsistemas do kernel — e também muitos
-desenvolvedores de subsistemas do kernel — expõem seu estado atual de
+Os mantenedores dos vários subsistemas do kernel, e também muitos
+desenvolvedores de subsistemas do kernel, expõem seu estado atual de
 desenvolvimento em repositórios de código-fonte. Dessa forma, outros
 podem ver o que está acontecendo nas diferentes áreas do kernel. Em
 áreas onde o desenvolvimento é rápido, um desenvolvedor pode ser
-- 
2.56.0

