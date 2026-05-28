Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB7211A14
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779942016; cv=none; b=HiwLk03qNRI7oGI8H66QVTpcmgi/anNLKv+OczaG8OuKOefU7na0JUClXtkMk25urXcOp3nsiFYHsqCZgBEtutkW9vVbt/A2S5rhJJ1ZclQHehUOapxF1AeiTh2xtdMWwdEPpQvOZzhwsLudAIlLijWgwpI1i7i8Npf4ozrZJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779942016; c=relaxed/simple;
	bh=rglxEvxBKJzPGiOg68N5zvjhLBG0qxFYwATcm8qrnYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lAIsvKnXxeSZu6pOXAKBXXcPXteTr13s3GyZmId8rmr7hghGCZ4RZQxZHTFSSjeyS6P6nDcOC8y2x+U/RCmJ+eKqxTrbqlhGONFm5z72XdoOz2sFEcfCTKSck8Bsnn0KTnN7Q1zD5guiidaeATGDH7ztpv1mldNG+x9AxwcReOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdTkBA6I; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdTkBA6I"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-961780b0ba1so2339321241.1
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 21:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779942014; x=1780546814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5B99gqUcpqGOnbc+tK9eV3PVrvBTHn2nn5ctBUrsho8=;
        b=FdTkBA6IVyx5uMJCZGm8ZcWso0OYCQN7HScexTdXe4eVrcutTgL99d7MZozFgg6WZ0
         40N4GA3FcxNTNUhSGBUrYOZj+ve4f8GwjzWKTmNZ6xDBZ957sNea+7CKijmtpQ4iyLIR
         BxbI/l0fPW4QmJokQ0dHsXW+xPjcViVyk3znT3HGKE0f6mIIGTwB4HJJFO/Ii15azSr7
         uxM4IRDhf9LTlIAgc1xBg4ejTbgdpncL2PN/dxnPK+a7HdnMhJo8brJ671cTA67CWIuq
         MdORibt2ZQKjfPdrMBccBI7Ng+oZXboOdEUsQBX8mHPIrSCtXS9cIRAjKUJvRZVPg9f0
         EWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779942014; x=1780546814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5B99gqUcpqGOnbc+tK9eV3PVrvBTHn2nn5ctBUrsho8=;
        b=dzV5FKzsyBMojZB9pqQ6Ezc5t2hkBj/qN9OVXpcMF1iUPX0IWWHpo+jgWM+bMwtCWm
         6BFwIJOpvsh771mx0XanEeopOjZ522ttabAB1ze8dCfCVuDfOesKTpWCidsQU+sU2qXe
         jnEX6E9wTywETednB19D3+Ps0CGsNTXElPrPZw5Go0IMH3ViYVND0x+VO17ZcwgFmT/d
         YfhzW+JA/wy9BTcjNhQ+qDH5PzY3LKIP/NKzNLQE+0JrtFTBUQ8UqKJjUw99QiR/R0fz
         nfrdq2qjxjVxOCC4IatTsz92q/SkgGGRy/A/fUZte1D++ulmJ++LwXpJKkGtWUu+jnrs
         2Sqg==
X-Gm-Message-State: AOJu0Yz3tny9Q5Pa6uyIIkRn5tfZrBEKngEnfVLZkmE/PdFOK1oDWTfY
	NjOx3FsUv1pb9Po5RpN351dUPvWLj2lfSJ9FLSy5IQX9n58Bs1msAqg+
X-Gm-Gg: Acq92OEbW5QyhlD8dY3xf78U7YHuy0Li2N7yJ8U1WhBFG5c3uyanpWkjCGh89+pRo/A
	Pq0hPKER9La4pYfVEbEVzxIv/BmBIBz740t1hzm77GVqBU3HIXwQDgwzH+kaSEzdqOoET3ImtRD
	gixvqBuKYTyWkAYlwnJEiZys2kWjsvxC/ZYhA1zL5fWdTvyimzZgCoOPImAEL0rvGSEI3DG/A/A
	vKIgqd6HuEMG+pR3RzDokDqTxKjUrz/V3MtAUyOIjZth7KjnBQbX4GbXdyyae8bKE3vXdv3e0C7
	/aV5sezUIfezTNfJu3+xvEo+6HcsiuGyeVaEyLTprOZBVz11SbuwxzyP99qWs/Qv+vtsx7e0sxP
	v3h9OpeT8QPSj6yOONkWzVvV4uOlIxBCxg57/4q0BawcxlQVbqJlBgwlHrqNeEvq+OJB9ndLtVm
	x00rSmyHweAWJgGQkp6CtlCA5CMPVann4F
X-Received: by 2002:a05:6102:1621:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-67c74ec7d35mr13042030137.10.1779942014028;
        Wed, 27 May 2026 21:20:14 -0700 (PDT)
Received: from correa.local ([2804:7f0:3d7:1023:6dea:302a:b001:1717])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963903fd665sm1424094241.13.2026.05.27.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:20:13 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH v2] docs: pt_BR: update maintainer-handbooks
Date: Thu, 28 May 2026 01:19:58 -0300
Message-ID: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

