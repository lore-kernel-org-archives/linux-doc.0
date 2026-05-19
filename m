Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3B4E377F;
	Tue, 19 May 2026 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195446; cv=none; b=m2twZt3iR4HWaBGOXTHnbvwsziVRGc8eQwuLZvfCcPiWdM7fY3mUbbbGTiPObubq/a4FPABgQqoZc0s65YuwjVJoYUobTsJylNYw/mqcEGHTYccZ0gO9gBNU/GMCA6kfueyjUGLuzLolDfhAOVn5fiPXMjuS78mHW5QzAUD1rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195446; c=relaxed/simple;
	bh=HC1/e9/u1l1OXJ6bpfGCNdxZ1DzqRMlRzmJrhTUILDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THlt7E7Uu41KPS+G440VHZFjO5s+7BfOnd7Dd3rZx9bx4YWJrobdg+NDQva89loV10eOaG05Czz5Lebm4FA0+XJqd52guM25O45TTLio+i9wnoqbSXE+T46OoVRsPTOWBGNvj1Pvanx+nPqZJQH1sJ4wkDcHabIlwGQXX+PJDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV62geia; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV62geia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEB0C2BCB3;
	Tue, 19 May 2026 12:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195445;
	bh=HC1/e9/u1l1OXJ6bpfGCNdxZ1DzqRMlRzmJrhTUILDw=;
	h=From:To:Cc:Subject:Date:From;
	b=nV62geiazNK8jvcc4zegkSeOYrEDb4mhGiLHkQdNmbhcX4xGL+vae8+JL2QAfdi3x
	 /Sz9pGx+hFxQyWtOwVMKIOpVyHln/bXxUw7efSTrDaypFHmNF4QX+ijYXPwLDES2Ev
	 fERZD/7vPl/+hboWadRnGktRQ7iysFumhdKprpOGBVsCb02D5hVwre6QTNgfRcFj4a
	 VSCGPJ6gz0zwC86sGqxfhqsgjttSJxS/kOiZwkl5GpXclr/sex8dOaRRzC2wWcTVYF
	 Awpr4JiwT9V6mXjQwbgpnpfauq22vYDC9WMLHHwQlmH5v6s457tkJqNuIsy5Vz47z9
	 1DfaAAA9aatKQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] liveupdate: document liveupdate=on
Date: Tue, 19 May 2026 14:57:06 +0200
Message-ID: <20260519125714.2435640-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

While the liveupdate= parameter is documented in kernel-parameters.txt,
it is not listed in LUO's user facing documentation. This can make it
hard for users to figure out how to enable the subsystem, since enabling
just the config isn't enough.

Note the need for the kernel parameter in LUO core documentation, which
gets exported to Documentation/core-api/liveupdate.rst.

Suggested-by: Luca Boccassi <luca.boccassi@gmail.com>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---

Notes:
    I think we should take this patch through the liveupdate/fixes branch.

 kernel/liveupdate/luo_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 803f51c84275..5d5827ced73c 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -36,6 +36,10 @@
  *
  * LUO uses Kexec Handover to transfer memory state from the current kernel to
  * the next kernel. For more details see Documentation/core-api/kho/index.rst.
+ *
+ * .. note::
+ *     To enable LUO, boot the kernel with the ``liveupdate=on`` command line
+ *     parameter.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

base-commit: b1378127003b61930ce30064328640503ad3ef6d
-- 
2.54.0.563.g4f69b47b94-goog

