Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848145;
	b=K94Wo350HFojkjcSt6cjEjfGzqkRjKTMVMoz2hsibG12GfJjOez6ilE/qseNODGc3OZs
	 1XRkO1VJnbdLtBigJlOFmTy0SRcH+uZTYAESEOy/11axWoZBkMhOokD/GII7Sz4/hoWe+
	 bWkro9lV2Amh7OabmR4YlCYM0H6NKEi9W94tCr2HlBjU6tIO/KoZk5FxbCPXIQeZpPavF
	 5uKq5/iCHNrz+B2jaRdmPDiAXvInL3mZzxCFR4wLupHjqj9jIJs5e6f6BAqFKSnrtfEjx
	 /QP1LF/SArDFx1QPx4X3BamFtgDjoM+TPyG2YR8AM7qPVmfZfYMtVEpV1N2cGOeTJqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pNJaZanDi5DUl9Gp9zAMKNFIE6uhFapqzz2pA5N8Sdo=;
	b=eSLRxem7dtj5kFHgrUZkAn4S8w59QQdnd4FvPrrIOTc6aBq8zCdYMo0iZ7Wb8LRlurXi
	 yEaQ3Zvg00aSZhm3NbTuPHQMjszVXZoTtycnHTMkEeaMKXXRK3uFFIMQ9ppjpDUxX4tv3
	 c+KoyR5GgDS+70xQky3Oo2A6AcEJTdhqxvsVCapeYCeGGUBNJDvANWovaFmO2bTil3Jqk
	 rLYhajj38v3yfYEbqv8z0xj2oWckuVmFpF+K/WyQhuKXFi1tIDpbQFyXghczp4apWucBK
	 bb7XTVvcHDB8qIn5XuEmQgGUXK64jL9iHyuaRN47BHjoDmislhu2WgepqQTt0pqk/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pr21QunK;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC2606A31B
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pr21QunK
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so3053626eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848144; x=1793452944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNJaZanDi5DUl9Gp9zAMKNFIE6uhFapqzz2pA5N8Sdo=;
        b=Pr21QunKNJ7JUJTFGzU4G7cSLKn9VsFQER85f5mUlk+yDwEIWqrv7NQI9DuOY+0K+G
         O/TRWcNukS+A5J2DFo5QGuQb/vkxjsy1ChpoNQOW627zQGxKTJpKL45rjpzPqB1xitUq
         dfN7opjywtqg4w2A33tv6k+lyUiLNmS/Za2JkFtQD29TUPFMPIF/oK2GsW+08mKX8qRD
         VmLH/PaAsYR4QYeTHvA5QNZEOXFVs/kQRcMqm2ybcgmIm3rcHEOsyh65yEsJXtSEGvI6
         oXGv7v70QrYe8Fgfd2/qwMCjtprmdCLUTJef1bCM+L3IY1vdPX2o4Bd48sFQer7wMJ7D
         DGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848144; x=1793452944;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNJaZanDi5DUl9Gp9zAMKNFIE6uhFapqzz2pA5N8Sdo=;
        b=nqOrQK3U4jC+L4EV6R490mmYE4LkVzYiSgWNk09jHXjr3YfpKRbTWtULv8mGhJezbA
         eaWXMl49edwVg2Z3fpZ5lF/lJaLmRdy9YDNX5jsXKRmvVHeI2WlUxvc9JUwWoq0jmA+Z
         YnBpTj2eTvLi4RMDGTQYoMfI3uu7J7zFx/XcZkMv+S+B1bKyLL+4MjnX8fUgdVxmMGK7
         kI4U46nih8nXcrSEqy8W91k9vQG79WigHWB5xUM9hbp/GK4PyFMa1xg0imwTxjaY2IJj
         JEgJw2CvTcxhHlULbfvmfxdD6K9uzYn5FHLq+h6B3V1nWY+BzvqljJpOE8NqkPc2RUvx
         LOSA==
X-Forwarded-Encrypted: i=1; AKwUvBxKyrm21sZFqvMbRPPaL3SrJNV2TKXClVBlVMU4wO9+FH+d+j9BrG+7RvWcY2zudIRej/BsNcaBBWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKORgv87JJYnb597eeBrj0o6vh0TngVvCK0tkfQzUsmLX3xqbLI
	8WCIXSoRPisSKqpgSAl+Y6BRqfBPFvq0NNXq8W2sndR54pGwgD10lCEvZQYEm6AX
X-Gm-Gg: AYBFou3gf0IRFUPsWIwWDNuLx08LZTaPVgD1kMWwv/FaLVveC2r/OlBszCyMBSQdWug
	yahtXUCpZbgFzymtAufBIHOa/r4PRGQwSLOsSo2NWKkFd+duXsXQyRFaXYkKIlqGdZj1G30d9IJ
	Yw+gru80dTFSUppfuoKJAeC2exlrOD/jzddpd3sTVwZIVZbYnbvxgHYGBbkr8R6Pza8+ZC8Sm4w
	3oDOIRq/Ab6LgIyZjYCyD2Jb7tau68l4lN33v3LmjjuabZLX86xyVUpjvjz7znqajD2BszyuWgx
	JyeVgUyZfzUhTbszk73uhdX19zjEkpTMH49xRwkMAdWtxfo8i+uOl6m+l2hTyDXpxA8qRIrt/gA
	MGohcJBqhacEEESRbxyO/i3ODawkhc4lsH1mLWdRIjrC6Lu4eAUuJOA5kFDAB/K/j/hcBUFn51P
	yl+tCsBNmC72fz+rtABpQhQBZel8tnyIryPVxZkgQZKzDKV2lk0Wzl+Dv6+6QA3UwgvgITHIa0p
	4Abrpg1cgufwzdA11RVnH/5wI2WVv8ICinhOQS9BuYxml/kKfXiu5Bi9ySKMUi7y4L8tz6jHLhb
	Y9KVAjxQ6ix2GUz30LjG6cZEz9SySi1sYe5A7D2EzfzCxm6AxKlsv4HGF13p4zQMasfw8oGJowo
	cX3txAGy8
X-Received: by 2002:a05:693c:60d1:b0:35b:fe88:d053 with SMTP id 5a478bee46e88-369e84e48d2mr3468237eec.23.1792848144197;
        Sat, 24 Oct 2026 06:22:24 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:23 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 11/11] docs/translations/pt_BR: process: fix kernel-docs and enforcement statement
Date: Sat, 24 Oct 2026 10:21:58 -0300
Message-ID: <20261024132158.39493-12-danielmaraboo@gmail.com>
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

- kernel-docs.rst: "pre-order" was translated as "resale", a missing
  colon turned a field name into "Descrição Do site", and six book
  entries still had their "Title:" label in English;
- kernel-enforcement-statement.rst: add Laura Abbott, the first
  signatory, who was missing from the list.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/kernel-docs.rst   | 16 ++++++++--------
 .../process/kernel-enforcement-statement.rst     |  1 +
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/kernel-docs.rst b/Documentation/translations/pt_BR/process/kernel-docs.rst
index 6235b1e7b..dd204430f 100644
--- a/Documentation/translations/pt_BR/process/kernel-docs.rst
+++ b/Documentation/translations/pt_BR/process/kernel-docs.rst
@@ -78,7 +78,7 @@ Documentação on-line
 Livros Publicados
 -----------------
 
-    * Title: **The Linux Memory Manager**
+    * Título: **The Linux Memory Manager**
 
       :Autor: Lorenzo Stoakes
       :Editora: No Starch Press
@@ -86,11 +86,11 @@ Livros Publicados
       :Páginas: 1300
       :ISBN: 978-1718504462
       :Notas: Gerenciamento de memória. Rascunho completo disponível como acesso
-        antecipado para ré-venda, lançamento completo agendado para o
+        antecipado para pré-venda, lançamento completo agendado para o
         outono de 2025. Veja https://nostarch.com/linux-memory-manager
         para mais informações.
 
-    * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**
+    * Título: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**
 
       :Autor: Kenneth Hess
       :Editora: O'Reilly Media
@@ -99,7 +99,7 @@ Livros Publicados
       :ISBN: 978-1098109035
       :Notas: Administração de sistemas
 
-    * Title: **Linux Kernel Debugging: Leverage proven tools and advanced techniques to effectively debug Linux kernels and kernel modules**
+    * Título: **Linux Kernel Debugging: Leverage proven tools and advanced techniques to effectively debug Linux kernels and kernel modules**
 
       :Autor: Kaiwan N Billimoria
       :Editora: Packt Publishing Ltd
@@ -108,7 +108,7 @@ Livros Publicados
       :ISBN: 978-1801075039
       :Notas: Livro sobre depuração (debugging)
 
-    * Title: **Linux Kernel Programming: A Comprehensive Guide to Kernel Internals, Writing Kernel Modules, and Kernel Synchronization**
+    * Título: **Linux Kernel Programming: A Comprehensive Guide to Kernel Internals, Writing Kernel Modules, and Kernel Synchronization**
 
       :Autor: Kaiwan N Billimoria
       :Editora: Packt Publishing Ltd
@@ -116,7 +116,7 @@ Livros Publicados
       :Páginas: 754
       :ISBN: 978-1789953435 (O ISBN da segunda edição é 978-1803232225)
 
-    * Title: **Linux Kernel Programming Part 2 - Char Device Drivers and Kernel Synchronization: Create user-kernel interfaces, work with peripheral I/O, and handle hardware interrupts**
+    * Título: **Linux Kernel Programming Part 2 - Char Device Drivers and Kernel Synchronization: Create user-kernel interfaces, work with peripheral I/O, and handle hardware interrupts**
 
       :Autor: Kaiwan N Billimoria
       :Editora: Packt Publishing Ltd
@@ -124,7 +124,7 @@ Livros Publicados
       :Páginas: 452
       :ISBN: 978-1801079518
 
-    * Title: **Linux System Programming: Talking Directly to the Kernel and C Library**
+    * Título: **Linux System Programming: Talking Directly to the Kernel and C Library**
 
       :Autor: Robert Love
       :Editora: O'Reilly Media
@@ -231,7 +231,7 @@ Rust
       :URL: https://rust-for-linux.com/
       :Data: versão contínua (rolling)
       :Palavras-chave: glossário, termos, linux-kernel, rust.
-      :Descrição Do site: "Rust for Linux é o projeto que adiciona suporte à
+      :Descrição: Do site: "Rust for Linux é o projeto que adiciona suporte à
         linguagem Rust ao kernel Linux. Este site pretende ser um hub de links,
         documentação e recursos relacionados ao projeto".
 
diff --git a/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst b/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst
index 3833c433c..c2e7dd2f2 100644
--- a/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst
@@ -53,6 +53,7 @@ projeto. Trabalhando juntos, seremos mais fortes.
 Exceto onde indicado abaixo, falamos apenas por nós mesmos, e não por qualquer
 empresa para a qual possamos trabalhar hoje, no passado ou no futuro.
 
+  - Laura Abbott
   - Bjorn Andersson (Linaro)
   - Andrea Arcangeli
   - Neil Armstrong
-- 
2.47.3

