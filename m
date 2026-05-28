Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D786CA4E
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 04:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941846; cv=none; b=pK9SyG8ayo2d9ybo+Nj9XMqqOgGI39ybjwB4JpyhvUHp1jt1C4kTkbExnksE4iDG+0pgsHM/8ypua0t6rhPijTvEDOiJhmkgBnj3eQUbARkNkLn2hXlvi1Tm9pxvGCjKkWbbFjR7wNfxXpxU/weSo5iwXcDe9kpQMEzdswZKrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941846; c=relaxed/simple;
	bh=MhSzoD3evOykvl9FBEHmhfN/m5AmfdKrGJjxlKCAtso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JEBY/Npt3A80dzfZa6ZzoHTZwrS0UB60qEPUF+LL6gZBA/wo//1jtavapu8SlJvCfII/keG34CG3inil+5za9wBzy9A3hOSuOPYvSIGqmcr6kBOh5Wr1nZQCpdk13uzO0StFy5BSjvzevG42J0sEHNfbNCpbvKo/lH8wdJiu+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1BN0Lej; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1BN0Lej"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-516d61baff3so67777761cf.0
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779941844; x=1780546644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBIU4pejQVJuZPSwFcPMbw0vmEehE5ot0lb6KUcJpyQ=;
        b=U1BN0LejU0b97GsUcXHIuiRU5Hju5ucKagdRWO4dMk/wzSXdfnayIPSIAqtPPFhm0r
         IEYocJDwNI4ZtStPB+7qsyrgEi138OEnx9hgPr6lQWiJ4RJFzB8qXw0AgOzwoqjnbFMi
         Bb+x4/8HeSKPHC9ZGKCU+4mLcU+apjCZdJrumreN/GT9mOSVdLdV4WxH2dzgBa6FmPMT
         OgOUndjyZM2gdFLrNAh8Rqd1rsPJtkdMSMSNrVQ8mKXonroM5jADPqg4Lao3Rjj2J6d5
         vBMtURT3pyUiOdAZlS+jepF2y1vKraOVAq8BhiJf4TKjfpdmM5VvRn+Lwz1wzBxRE5j8
         iGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779941844; x=1780546644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBIU4pejQVJuZPSwFcPMbw0vmEehE5ot0lb6KUcJpyQ=;
        b=e+TsQ14xI8zSVSOKnt9AZuQmowdC/DFRAlb2Dgk1RtSxqM40VhP24KVGOwhoLNxfpO
         +cN9590JPgVodC19shOQrrwlbg14lPtFwgVbl0lk05HacZtbpMIrUywwihO8PHAWg+oy
         AfUMg1vJDset7nMeS06iiHrSuGV78Cs9Nb+3cf3N4ncFVAbsTB6p5ewzSlcZADZ+og9j
         Iy4lmbCa+p5/XMdLJ9Qa5nEryU+hVK8SSM/0Xc63INTy4E64i40/dBttoIlARLgAV126
         pvhJtbbsnANzq0OTKwAoPK1PRjIsXw6KdMA/ByMcUlGoVe4g1skIAex52m/Yh4A8pM5p
         7BxQ==
X-Gm-Message-State: AOJu0YztvCiBnnokimG8AML5QN+2bvomUQBs4NcDROdZOu63f0s3RDzV
	4Olv9Fy97zMxndoq8pzd9LdW2m9qPjbgIpT1jsDfvv0dhwGO2fxRZ2M0
X-Gm-Gg: Acq92OGacn4lYPl2PifuNDnDZVmJc/T69CV9+WEPkUGG1e2MjRQjzIbDlxBnoVzniWL
	HRckBRhbjh/+O2vLTVDuMHNIssKOMkLO0LCVvPODCEF0m2Py9MMZsqCPFxaAYDE/zTOCFk9ZaRs
	yIED4ye0QR2n9ynVEt0YSCsnMG86NpZXKr8BDUG36APqcoM7a/raEC4VIiV3nV9v2T8J7e1s7TV
	+qj2GxSX033Cvo0umsrn2RgyIg3jILQPfwywkTWqWNWBHyL9Y10CeT/nT/bciA7KBmuABKmnqLe
	fFxa/kaSKD10Lhkdt8uSdr/LFxvJ5czob4C9XgELNRIfL4NeiidK0i+9IjZ/uNoK5piB3roO0SX
	mbUc4/90yshjw4uspkM2CF20YXGOz0in+RH2LlKPNBmlD2hl78FfPI9psvG2StBIicHM9m569lc
	OTxrNFp6E+YDnRrXjFZSrvK9OXRyHIKUmvzGCMQGBcNg==
X-Received: by 2002:ac8:5a45:0:b0:517:146c:c869 with SMTP id d75a77b69052e-517146cebebmr64620731cf.31.1779941844125;
        Wed, 27 May 2026 21:17:24 -0700 (PDT)
Received: from correa.local ([2804:7f0:3d7:1023:6dea:302a:b001:1717])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517069f2464sm62401221cf.2.2026.05.27.21.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:17:23 -0700 (PDT)
From: "=?UTF-8?q?Amanda=20Corr=C3=AAa?=" <amandacorreasilvax@gmail.com>
X-Google-Original-From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreades@hotmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH v2] docs: pt_BR: update maintainer-handbooks
Date: Thu, 28 May 2026 01:17:00 -0300
Message-ID: <20260528041701.57133-1-amandacorreades@hotmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amanda Corrêa <amandacorreasilvax@gmail.com>

Update the content of the maintainer-handbooks documentation
to Brazilian Portuguese.

v2: Update maintainer-handbooks documentation based on the actual latest version of the English
documentation. Prior version was based on an older version of the English documentation, which caused
some inconsistencies between the two versions.
This update ensures that the Brazilian Portuguese documentation is in sync with the latest English
version, providing accurate and up-to-date information.

Signed-off-by: Amanda Corrêa <amandacorreasilvax@gmail.com>
---
 .../pt_BR/process/maintainer-handbooks.rst    | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index bf7a38147..b7aab788f 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -6,14 +6,17 @@ Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
 O propósito deste documento é fornecer informações específicas de
 subsistemas que são suplementares ao manual geral do processo de
 desenvolvimento.
+:ref:`Documentation/process <development_process_main>`.
 
-Conteúdos:
+Para desenvolvedores, veja abaixo todos os guias específicos de
+subsistemas conhecidos. Se o subsistema para o qual você está
+contribuindo não tiver um guia listado aqui, é recomendável buscar
+esclarecimentos sobre as questões levantadas em
+Documentation/maintainer/maintainer-entry-profile.rst.
 
-.. toctree::
-   :numbered:
-   :maxdepth: 2
+Para mantenedores, considere documentar requisitos adicionais e
+expectativas caso as submissões frequentemente deixem de atender
+a critérios específicos de submissão. Veja
+Documentation/maintainer/maintainer-entry-profile.rst.
 
-   maintainer-netdev
-   maintainer-soc
-   maintainer-soc-clean-dts
-   maintainer-kvm-x86
+.. maintainers-profile-toc::
-- 
2.43.0

