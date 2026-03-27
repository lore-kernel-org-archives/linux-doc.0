Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C583BA224
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616172; cv=none; b=Vj42cOGYg9RH0LliQb5NxAmGSynYQ0xEBo0HGh1XXsQzZmihDbqbcVlBh42xE7ruGSp08irOvAL5aAexxcar6wnHi8ySzTJ78t7orfRqqR/fhFNtqbaqrFL5+DIq9SZDUNCC5wHZhjz/zPOcpJFXw80SgA5yzyx4kT9b9pJ8Yq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616172; c=relaxed/simple;
	bh=halkSlRhlLJ1NSvKUwca1p/N62zePEVNNeHX5CtEDX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JezyLhUF5ZWsVPGd7ceenS0uW/V1iiDP3k1u/U6R4CzInDZNQT8LZetIAJRvnlNqtWUAAwYjtN6E1XV7HQawvG+vlNqYUUA7jjsBP4tcU+mOXPQ7/zhJCumykO5207XA9b0/diK3K53c0bB4/7RAWib1Efgy9IU7P8g8lQ/Bk0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lv3iXti6; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv3iXti6"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so688667137.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774616171; x=1775220971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4tSQA+KxtAfLxrXVNO7xwB0Cx2WNGXy/J6suzTmYdGQ=;
        b=Lv3iXti62IAbWeZdZ8WqIYuLsQinSeF7wCckYkhG6aR0YkfJ6UXCh3aUcArqsXvmrw
         UzZ28D7Yrr9wVoDDxZQy5iGavMQKr45Qyr9BlRHeptWvmaJFFOMwcfSrX9fB7GHlin1Q
         AOwXCuW6r/kQPFqMAJUQN4FoyPxCGRKMqUudQ2dNwrzr3ajxmASAM0P+bnxXgjahRZG9
         y5mf77rHWIdhUN4xCNT/yMWBAZ/jW837gDgRf7AkcgYJR29ns5nUhzsvBpJgjwyL0TRe
         AWXFwvdkILI/TH/FOlKfVGCNLNKvortu/d/uwJKHP/gyKYaiJJ+J6nP6EP+Mxk9lUA0x
         zqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616171; x=1775220971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tSQA+KxtAfLxrXVNO7xwB0Cx2WNGXy/J6suzTmYdGQ=;
        b=YkauCwuXs1nt0mVNJ5o6HiyQnecHnQjFQ8IAMbBQouj8gWzkO464Onrjj96Loylr+V
         d/kda6IvMQvVz73LfcV7HmGIT38CwBWjT0+zaMe3Upgr03VoTBnH60GE6tXvVp5CLxIm
         LrF59lN2kJNWE9g9kQvdMX2FQeCdlsTphy3hU9xrtNngVAFHH0dXGXI1hWHqTLhtXf9C
         ce4g8/RXvhPAj5UK+m7WC8PCd3CDw0+1DAjwUUOPoSOzUxLBpL8VPVdPQuBcSxzx2AkJ
         h+J/lK8rxqJ5uS1rOAc9wdbZslmdBX968q+z2DVPn4xQap6Dv0H4OkkYxThbBKg7lMnd
         Wmig==
X-Gm-Message-State: AOJu0Yw9GrNffndUK0zzGUrOK6N6h9G7K4G8JAeS+nyoNwYgVvuCLudS
	78ASmq5EXlwR1uAg6H/kG94UlU0rp04mxnnsvh9YUqBpLU7YTcousCfg9VX5egw4
X-Gm-Gg: ATEYQzzL5q9fqz8Sse1vTOJr0JABYOGDrcWD9CKehpNYwlwNap2HkN1gbPM33iOISHy
	MGzRpCMvnfzgYK48rHgptiB9O0fkZ+Y6anC8AF3Dju0097k6A6U/qoUQmYNvQ2iwm+aQ6S8mJMm
	ABUvlOxgHHdrsTTZp55hxPfLpTSkGrFskKPCROd0MKmvbxRQe9W761dpkTMLQLjtod6tuUA4xI8
	0SoKTjntvVy1bP8PlvQ7hSo4DW1nmms5Af17ZNWrD9xD0F6MLEO7FasAO9l8Ph9MZafhshunM8A
	5SV4B75sdNKSxZAq344y2XHnH3pyzb3jLzMJjIVi3ZqqduN2/HcGc9BrtzzmAmT5oGAPw8A63Wh
	/r/kaTvB6O2KpUO88C6BbTeTBKortB7nJG3PDZqej3g1dQoLnx7qJ4ZlPz6b78DOZwJqTPcsqvU
	SCKncbgzLdRyexbhtjF686+f5H65r2KQnGmOVcFbJw7vTaySEL8ABTbKsc6X/KGncdBODpS1fRi
	Q==
X-Received: by 2002:a05:6102:e09:b0:604:f849:462e with SMTP id ada2fe7eead31-604f92e88camr926603137.25.1774616170476;
        Fri, 27 Mar 2026 05:56:10 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm6259318137.5.2026.03.27.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:56:09 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/5] docs: pt_BR: Complete PGP maintainer guide translation
Date: Fri, 27 Mar 2026 09:55:31 -0300
Message-ID: <20260327125538.581064-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series provides the complete Brazilian Portuguese (pt_BR) translation 
of the Maintainer PGP guide. The translation was performed in stages to 
ensure technical consistency and proper review of cryptographic terminology.

In addition to the translation, the first patch includes a minor update 
to the maintainer-handbooks index to properly include the KVM x86 
subsystem development process notes.

Key highlights of this series:
- Complete translation of the GnuPG setup, smartcard usage, and 
  Git/Patatt integration.
- Sphinx labels were updated with the '_pt' suffix to ensure unique 
  namespaces and avoid warnings during the HTML documentation build.
- Adherence to the 80-column line limit for better readability in 
  plain text.
- Verified with checkpatch.pl (0 errors, 0 warnings).
- Verified with 'make htmldocs' to ensure a clean build.

Daniel Pereira (5):
  docs: add maintainer-kvm-x86 to maintainer-handbooks index
  docs: pt_BR: start translation of the PGP maintainer guide
  docs: pt_BR: continue PGP guide translation
  docs: pt_BR: continue PGP guide: Git and maintenance
  docs: pt_BR: complete PGP guide translation

 Documentation/translations/pt_BR/index.rst    |   1 +
 .../pt_BR/process/maintainer-handbooks.rst    |   1 +
 .../pt_BR/process/maintainer-pgp-guide.rst    | 913 ++++++++++++++++++
 3 files changed, 915 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst

-- 
2.47.3

