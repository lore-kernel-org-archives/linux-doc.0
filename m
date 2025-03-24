Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C3E25EFA7
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834805; cv=none; b=UN20x6SIyybkVpdH4WHUBCxsOw2aLOORWon/XpQXWBsZSye4+3QwvME6MafBXtSJ5wnvVFHWshpxHxEqPFXU9S4ZBBtRNS5xz304Y1/C935Ev0D+WDXSl3f6kxBPGpzykiS3qXaJw20wjiCJV3VDkv1O3xb7FsgENiYsKJPjhwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834805; c=relaxed/simple;
	bh=oM1nTZR0YPys7KYdFrAmLvaeev/fI884tyB92cEcs9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BqpIP/HpusRxGqz6FrKYEqViIOPOtzeOh8fxK1Db6wURHeYLdr+q5D+/r8Yj9L03e/VsFVnZukIPVM1/iniThfXRAWaKhCW9ALipAdulnuLQDJJurRBntxzbgq7cVeRfQRvsaa0+/+CwgYzK5Y9RAYT6G+TFw3waxflcbI6rjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBF3ZmFt; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBF3ZmFt"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e60cab0f287so3257878276.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834800; x=1743439600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGUOo4Avg6cO5Orqf/NRJe8cNTcq1zX8N5PrEUl5k34=;
        b=OBF3ZmFtUiJaPUalAGY/UyYzvCEh3I/IVqhI8kxqlq6RHWcw/WfUAei2fKi1LXgY2Y
         tnSDkPuRj5QDKsgWM6BnlapbK2Pp8GUIgTthRu7U6qIe752/kJXZdlO85FJCGh+i8Es1
         MEVRuPY6KsVfMJHlDbnH2PtwvUG0OaSnVQw3cvuZqISdOIElopeNZwR2GToi/FxQi/w6
         jKCD4cmbVL3xcDWWl8BrG2LhcnthxblRvqllTw2nJude5bF5bOnuB6UVJTNutcLbmGkI
         Yxkl4m5SkejLjrxxWhLa2wRvCHyausb/6zgQAlVkqTjaQnUeW8bBUSZGloLWUchTxT7Q
         KQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834800; x=1743439600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGUOo4Avg6cO5Orqf/NRJe8cNTcq1zX8N5PrEUl5k34=;
        b=HZQB4cNgPdFQBZvDFHsugvX93ppsglcDljheI94vj8uKRl4FIjQD1NR6DDRb2KGdYC
         jv7Yau3MZftKlOBdFRJecWD+ars18duhJx2sJe98iUAJIUgf3ZDPR27Z3AYf1G70dzHo
         sqhFJJDaDLT3d3MopO11rM+BKqmPqaPXP/B9BDdIzj87QaeI/uh2kT0+ermpBQ0D9rpH
         boXOSduC96QyBcEKBQ8FVp3SBqDO+Fqr6ARaODyk94Q4RvqYUTPXHBiPM2cv/POXeAA4
         gNfz3+QNikA1YY0Z7boQoPAViwwhrnqFHOU0+FD6yhqbYrLXX1plox0clk9KJOxqvavY
         mmKA==
X-Forwarded-Encrypted: i=1; AJvYcCXS8Mr+QNJ9TBpwdYWBmqSiFUZx0f0pz42O66Cen6UDh2MHqduptVKLgR/7qwGsZVtdE2qGvVmqfgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJB7w9Tj/1T5fCLgK8zM7aYtX34xjIDcd+T+XXQSYNtifTQFRx
	CK6Zby3Ei2aR5GtU5J3nwDXokEYUGPq4S4y1Tk/noHPVXitRWjcK
X-Gm-Gg: ASbGncshYOoYEbcZfYbS/w4wgXTJtFx+mJmx8mFv5MKZinj9j3LGQs0vxARcbj9ddgZ
	vEsyWak5BWVGepzxxiw7NznNBNzHXCRVJihLrwf1n1nLfT9ONkIdIUzCGEXztwX7K2o2/qnlqjv
	3hHvnYJxJ1l93PFtlHG+IG1nLu5iSKguw7v8fRQqbDLnCdNsMS8rLmX/m+YQ+bvp1PUxkCm+qm5
	urGS7Rsvl/owHKJxbeUeZFKsWZAgt56SNfggq9Z2EUM2nb+/BM3hrnzOuUxkxd2G6I1VDXXsIQ2
	KJtvcYflsccebzVFiQ0WkoWzWn/g+X4lCdjtIeZxad43uw==
X-Google-Smtp-Source: AGHT+IFA9rwep5PHQvm91xvv0JKu/rB2VF301e3Ic6Jp8P3UFvod1F76pO2Nl5bUNhcGAcz609rCNQ==
X-Received: by 2002:a05:6902:2188:b0:e60:aae8:1efd with SMTP id 3f1490d57ef6-e66a4d3e50amr16719528276.4.1742834799980;
        Mon, 24 Mar 2025 09:46:39 -0700 (PDT)
Received: from velo.. ([191.104.150.128])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e66a442e19esm1665961276.36.2025.03.24.09.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:46:39 -0700 (PDT)
From: Andres Urian Florez <andres.emb.sys@gmail.com>
To: carlos.bilbao@kernel.org,
	avadhut.naik@amd.com,
	corbet@lwn.net
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/sp_SP: fix links to mailing list services
Date: Mon, 24 Mar 2025 11:45:58 -0500
Message-ID: <20250324164613.12639-1-andres.emb.sys@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the changes in the way mailing lists are hostet at kernel.org, there
is a need to sync the Spanish documentation to:

1. fix links that are pointing at the outdated resources
2. remove an outdated patchbomb admonition

Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
---
 .../translations/sp_SP/process/2.Process.rst        | 11 ++++++-----
 Documentation/translations/sp_SP/process/howto.rst  | 10 +++++-----
 .../translations/sp_SP/process/kernel-docs.rst      |  5 ++---
 .../sp_SP/process/submitting-patches.rst            | 13 +++++--------
 4 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/Documentation/translations/sp_SP/process/2.Process.rst b/Documentation/translations/sp_SP/process/2.Process.rst
index 5993eed71563..c21b0134cfa1 100644
--- a/Documentation/translations/sp_SP/process/2.Process.rst
+++ b/Documentation/translations/sp_SP/process/2.Process.rst
@@ -428,13 +428,14 @@ los desarrolladores, que corren el riesgo de quedar enterrados bajo una
 carga de correo electrónico, incumplir las convenciones utilizadas en las
 listas de Linux, o ambas cosas.
 
-La mayoría de las listas de correo del kernel se ejecutan en
-vger.kernel.org; la lista principal se puede encontrar en:
+La mayoría de las listas de correo del kernel se alojan en kernel.org; la
+lista principal se puede encontrar en:
 
-	http://vger.kernel.org/vger-lists.html
+	https://subspace.kernel.org
 
-Sim embargo, hay listas alojadas en otros lugares; varios de ellos se
-encuentran en redhat.com/mailman/listinfo.
+Sin embargo, hay listas alojadas en otros lugares; consulte el archivo
+MAINTAINERS para obtener la lista relevante para cualquier subsistema en
+particular.
 
 La lista de correo principal para el desarrollo del kernel es, por
 supuesto, linux-kernel. Esta lista es un lugar intimidante; el volumen
diff --git a/Documentation/translations/sp_SP/process/howto.rst b/Documentation/translations/sp_SP/process/howto.rst
index 72ea855ac9dc..e1a6e6a52ae4 100644
--- a/Documentation/translations/sp_SP/process/howto.rst
+++ b/Documentation/translations/sp_SP/process/howto.rst
@@ -334,7 +334,7 @@ con el árbol principal, necesitan probar su integración. Para ello, existe
 un repositorio especial de pruebas en el que se encuentran casi todos los
 árboles de subsistema, actualizado casi a diario:
 
-	https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
+	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 
 De esta manera, linux-next ofrece una perspectiva resumida de lo que se
 espera que entre en el kernel principal en el próximo período de "merge"
@@ -378,13 +378,13 @@ desarrolladores del kernel participan en la lista de correo del kernel de
 Linux. Detalles sobre cómo para suscribirse y darse de baja de la lista se
 pueden encontrar en:
 
-	http://vger.kernel.org/vger-lists.html#linux-kernel
+	https://subspace.kernel.org/subscribing.html
 
 Existen archivos de la lista de correo en la web en muchos lugares
 distintos. Utilice un motor de búsqueda para encontrar estos archivos. Por
 ejemplo:
 
-	http://dir.gmane.org/gmane.linux.kernel
+	https://lore.kernel.org/linux-kernel/
 
 Es muy recomendable que busque en los archivos sobre el tema que desea
 tratar, antes de publicarlo en la lista. Un montón de cosas ya discutidas
@@ -398,13 +398,13 @@ los diferentes grupos.
 Muchas de las listas están alojadas en kernel.org. La información sobre
 estas puede ser encontrada en:
 
-	http://vger.kernel.org/vger-lists.html
+	https://subspace.kernel.org
 
 Recuerde mantener buenos hábitos de comportamiento al usar las listas.
 Aunque un poco cursi, la siguiente URL tiene algunas pautas simples para
 interactuar con la lista (o cualquier lista):
 
-	http://www.albion.com/netiquette/
+	https://subspace.kernel.org/etiquette.html
 
 Si varias personas responden a su correo, el CC (lista de destinatarios)
 puede hacerse bastante grande. No elimine a nadie de la lista CC: sin una
diff --git a/Documentation/translations/sp_SP/process/kernel-docs.rst b/Documentation/translations/sp_SP/process/kernel-docs.rst
index a62c6854f59b..b9e0ca4be324 100644
--- a/Documentation/translations/sp_SP/process/kernel-docs.rst
+++ b/Documentation/translations/sp_SP/process/kernel-docs.rst
@@ -170,9 +170,8 @@ Recursos varios
 
     * Título: **linux-kernel mailing list archives and search engines**
 
-      :URL: http://vger.kernel.org/vger-lists.html
-      :URL: http://www.uwsg.indiana.edu/hypermail/linux/kernel/index.html
-      :URL: http://groups.google.com/group/mlist.linux.kernel
+      :URL: https://subspace.kernel.org
+      :URL: https://lore.kernel.org
       :Palabras Clave: linux-kernel, archives, buscar, search, archivos.
       :Descripción: Algunos de los archivadores de listas de correo del
         kernel de Linux. Si usted tiene uno mejor/otro, por favor hágamelo
diff --git a/Documentation/translations/sp_SP/process/submitting-patches.rst b/Documentation/translations/sp_SP/process/submitting-patches.rst
index 328ec80bd61d..ecb08b14c2c0 100644
--- a/Documentation/translations/sp_SP/process/submitting-patches.rst
+++ b/Documentation/translations/sp_SP/process/submitting-patches.rst
@@ -136,11 +136,11 @@ algo documentado en la web, referencie esto.
 
 Cuando se vincule a archivos de listas de correo, preferiblemente use el
 servicio de archivador de mensajes lore.kernel.org. Para crear la URL del
-enlace, utilice el contenido del encabezado ("header") ``Message-Id`` del
+enlace, utilice el contenido del encabezado ("header") ``Message-ID`` del
 mensaje sin los corchetes angulares que lo rodean.
 Por ejemplo::
 
-    Link: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
+    Link: https://lore.kernel.org/30th.anniversary.repost@klaava.Helsinki.FI
 
 Verifique el enlace para asegurarse de que realmente funciona y apunta al
 mensaje correspondiente.
@@ -257,10 +257,10 @@ archivo MAINTAINERS una lista específica de los subsistemas; su parche
 probablemente recibirá más atención allí. Sin embargo, no envíe spam a
 listas no relacionadas.
 
-Muchas listas relacionadas con el kernel están alojadas en vger.kernel.org;
+Muchas listas relacionadas con el kernel están alojadas en kernel.org;
 puedes encontrar un listado de estas en
-http://vger.kernel.org/vger-lists.html. Existen listas relacionadas con el
-kernel alojadas en otros lugares, no obstante.
+https://subspace.kernel.org. Existen listas relacionadas con el kernel
+alojadas en otros lugares, no obstante.
 
 ¡No envíe más de 15 parches a la vez a las listas de correo de vger!
 
@@ -907,9 +907,6 @@ Referencias
 
   <http://www.kroah.com/log/linux/maintainer-06.html>
 
-NO!!!! Gente, no mas bombas enormes de parches a linux-kernel@vger.kernel.org!
-  <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
-
 Kernel Documentation/process/coding-style.rst
 
 Email de Linus Torvalds sobre la forma canónica de los parches:
-- 
2.43.0

