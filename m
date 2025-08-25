Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1043002AD;
	Mon, 25 Aug 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139449; cv=none; b=sp4QXu5oWsQ0jpLk97YtMjbKiEAy2jZYaW+tXP5cKk5x7NXkhlB3ghm5lJDZ+XSp9dc5xAKnVsp35jHnURV+F/VrckrReZaVYttvYdRRAjDQaKaOxhOOs4xU+TjGRrPkiRg7n+xSujdtuIZf+I9bDG7v8xJz03NAUqalgE7tNEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139449; c=relaxed/simple;
	bh=q5NJvNQyCP9iSlId/hbG6e0du+t6sh6fZ2TXKRoeDBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikCEbGUvHUX74mzlKAQkxaGeZ/2AcLNLA94a488MjdVEkkJzwovg8OWnqudAx3v7MXLCb2O4y41bNmecEgzfB08a2ClXC5eawzJnsbxEodEiAF8WZFUHpCuG9KTId8hFx1DjJ4uViYSBj90RDpV7RbDD4WwOU72heGvSxBpdIhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fzele6Xx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fzele6Xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3103AC19424;
	Mon, 25 Aug 2025 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756139449;
	bh=q5NJvNQyCP9iSlId/hbG6e0du+t6sh6fZ2TXKRoeDBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fzele6XxKhjb0c37JX4A0urG5aPmRpkxgKm1o51xLME/jBz6iujImtF1LPvGO89sR
	 aMpfJ3LB+Ce9VMjP8upQBSPC9u6EsXQJHF54owlRLE1K2E5Rh8d3XM+NSmjTxJ40Uo
	 tAx+dLWuHR/n0DqdHIdZwcH11wdU1Jfc/k/L99UOnHKwEgQGQkxQjG+SYDQLQWyWVy
	 8oKH+txSLFRuxGS0j6gy4cSw6fRdB9H6N0rxsMByJBssWC4j0gV3icpRa7JIGQyQE4
	 itLA1Emf31X/mj0/m/QGKnoLrL32qlR4O7aA+jp5fOR5ZaHf8B9xRHDCauVprZDUAE
	 6uHBt9XkiLYLw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uqa5n-0000000HALs-1h7I;
	Mon, 25 Aug 2025 18:30:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] docs: Makefile: document latex/PDF PAPER= parameter
Date: Mon, 25 Aug 2025 18:30:37 +0200
Message-ID: <565ceecafde7345153f5b7aeb1483e6cb22fec73.1756138805.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756138805.git.mchehab+huawei@kernel.org>
References: <cover.1756138805.git.mchehab+huawei@kernel.org>
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
index 2b0ed8cd5ea8..3e1cb44a5fbb 100644
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

