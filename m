Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5D303C91;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=Ru9ZSLecemwLAYg54SHNbRsCed+3gpZrbV3O7QMwwZ5BaX4Zb02/kID8Z/u3ZPVkCb5GViL9thLeYb2F3DnRV3ggXAthRF8vAbwT5ZOicdomiQ2jQbIka+aYCleoo9w8FxOuhZ+tLi1PesI5+n4hhfCbxAVBf29nxJDmgZYiM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=0ypUcNGg9z6BJTKB3g3MJi0xHG6c16cyioz2ve+I/iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keEcZZUEJQy+oTKeD6FFBz5O1S9Z4+1Ez3PC1ZuVAqyDiArClrOer6lAnz99ES7Qz9lbTdJiIArm5ML4Cr4P9N28Sj8uNjB5sDf+tRJr2pYmq25iClgnjft+NUre9aDrA/FVhOU6E05H7sWVUFB6h2cpFf3+7lA9Jn0z9ljstVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHE6ZxU0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHE6ZxU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909ADC4CEF7;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=0ypUcNGg9z6BJTKB3g3MJi0xHG6c16cyioz2ve+I/iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BHE6ZxU0ddOMfUSS863CWmDMeaG8NkUrH4b3PsnEGakWddytqBwbfVQrAfm7BMhN9
	 wYC1DsoZxoo9jOVuegwKI152o7S5GRzjiyXB8yMnrVuAk4gFuBkBE+lW9v3skYFXcq
	 iOa37fd13wY7/QlXFAlmfWKpQiYrYEm21WqgbZVXg87nEXa510nXVtu/uD98jZWA9H
	 gMl6lm5Sm8Q52Main/EuLZhwTme5ThMbXUspQjV/InMcAVuTdQ4IKgQG9Q5t467P0B
	 hVinEnxyBXp9qQpc2MDeSAhdV/Z8m0/WCn+k9vwkBg+1ed8PfXjFvoEgwcFOmtmgVb
	 e7gVik1SPIqSQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000Crrk-0Twq;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 13/24] docs: Makefile: document latex/PDF PAPER= parameter
Date: Thu, 18 Sep 2025 13:54:47 +0200
Message-ID: <9c7b34db18642081d22c36a4203f341c1100341e.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the build system supports this for a long time, this was
never documented. Add a documentation for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 380284026c13..a52b311cdadc 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -124,4 +124,6 @@ dochelp:
 	@echo
 	@echo  '  make DOCS_CSS={a .css file} adds a DOCS_CSS override file for html/epub output.'
 	@echo
+	@echo  '  make PAPER={a4|letter} Specifies the paper size used for LaTeX/PDF output.'
+	@echo
 	@echo  '  Default location for the generated documents is Documentation/output'
-- 
2.51.0

