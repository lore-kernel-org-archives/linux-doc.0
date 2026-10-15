Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03467519DF1
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064076; cv=none; b=V/FNzVTxSde5h8jd8xzZN0nucTgwOeKDfrkbeCK9JOkQJSIi/0DEg9rP7+lCwdFjjbqG1rd6prN1DP+en4AH2VSzfDs7XOaoK+AGjScK1b1ZyofP6zhpHgAXli3PouO6Qp5KpiQ8Mm/cthY4/dLdmx7b8gkX88UHv4MTcxGtBC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064076; c=relaxed/simple;
	bh=yPOSLtMKK6xroPFFquxn5pvrVYYqB/gGw7/6n8YfDAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QrbTCDQKlQ6VzT69MFLh9jHh4L+eYMWVtnoES8gFb23Sb9VDRGKDmIdJruocWFPtbkfN1WPwbYLZQzo+LeDkc36b/u27Hvp9EA8DyDBUbWau+DGb6Bsx1guY9obImMeA/3PvWHoM4Nmr30JMLdSNK8/+qlSLWG2YVVy25VN8gn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYefhMUi; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYefhMUi"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so12067697eec.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064067; x=1792668867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Terqj6V3YCOhDH9GroSJ/QKq/dlU/BXbkJwIECKO0XA=;
        b=SYefhMUiN++tLrGqd35TaMvNXAhoy0+Kdxswcfae9VdPDdsU4DHh00nbg9pQ4YLFq6
         VJ4xpOOL5nC0VqfIiLVxifh23apO1DElxJ1dBoDkLV7icfltZsVk3VPwSoChJXU1izwE
         yyFpj0kC+dIa5Zcc9l3eEJkS22I44zC0VCoIgdxGoXVdzWxt4BMuKVsX5t2Ne9fwVPUQ
         w7A8kWbAov9phv8FN1eYn6e31f6EXIIRTMZW/+/vGR54vpXEdZ7MCoAmnWKNfSxX2oJM
         s4qjxx4fGKM9GxgBnkUDxZW9/2JwRlEKpC3kehUOioJMK0azAkK+ZPCrtjD9tHgaPcr4
         gegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064067; x=1792668867;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Terqj6V3YCOhDH9GroSJ/QKq/dlU/BXbkJwIECKO0XA=;
        b=qgUpOPCgYpKRFEAzKe3JE46dZUonBLCwuqlEiikDjLWXZBIvQ5bxiUL6a1gNpw1Gpy
         dVLuPuuxFOsGes1iyyZw3k/ZMc2VRo7FahCJPwY03Eb9rSWl2gnZQ2ZdHMDQigfpkYXc
         MrahEMaUi+2OZcR+qKFlWay+TqZySHmHaOW5kHkGjLsxmJfxo6p+anZ+BlcPstBPcYV2
         PL1upLuJCzhww3f07QFMp6gqUvSNRPT29o4N4Q96sc0keg3uoNSZmdjImRvdzdPqTn5K
         eoBUfoT/qf6Cf/G5B7bJK4jxJCjiUcoWWqNR5X0g+jBBu6GH+AEFSNsC2NuUUl/VH8AL
         6clQ==
X-Gm-Message-State: AFq9FYKVRXXZ7tTOSVNP/qaQFEaxc5VtIePMPGkhI/4ijytytI53OzO3
	Dzy6p1x8b1jaofVpVl+EAN+yLKdD5BAy5pgGKIc3siTQxHwwCH2gea+O3j4m7m62
X-Gm-Gg: AYBFou3pSsTMza0EfZTuysGoBKRCq0auBPJfpQNut/N5E+rC4C56GXuTnFELuctC2pf
	ZLega1awJJHOsRYeIJvYQ7BuRkR3wDayV53yNfUA+hXYpV78mRnOQQV6cch4WIKcu0sRmg2ao68
	ingMUNPrR2vBGpW4SZs54DStvweJlBVUmw+7h/GrEKLkhsoev4F7EE6H9vpz4BqlTpSSX9r/kex
	LlRk1bY6tsHGhR5fa8Q9RWmL0Y6S6au91GSDnlOPpPUSmHJFSc0Y0ZTRYXyDy0K/a0RVr5qmwgX
	kTXI/SpQGFJyFv7HvVG39pE+sK+3t9U0XyB1i4FvGmPoZ5FEKGKwHmd32+NzhyRXiJ1ZGzhANey
	rzXADMkYauOkDp+eQF3nZEbH43kty+DB3E/iyugeUhxkaR8MrkpNV2B9Y2om78dZLadpdnJbY/2
	GBf+VAcncf4RCd9QSX62sBaerdAJ2MLVMIIqB8+KEcQvqdZePf5fHVp5FZO3VL86mWRg1XRsi4b
	BXVaz6aYANajw3TOEpjdTSpNtrazLo3H4zyZZe8JaWHT3ln6dj3SlDkCuGejwBFP6uuOukDo1G4
	anlHIxBXG1uL+pj0AVp3+K/y
X-Received: by 2002:a05:7300:e510:b0:35d:e9b1:1c6f with SMTP id 5a478bee46e88-35de9b11d74mr6235580eec.0.1792064066367;
        Thu, 15 Oct 2026 04:34:26 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:26 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 05/10] docs/translations/pt_BR: admin-guide: add hw-vuln/index.rst
Date: Thu, 15 Oct 2026 08:31:13 -0300
Message-ID: <20261015113121.4550-6-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of hw-vuln/index.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/admin-guide/hw-vuln/index.rst       | 30 +++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |  6 +++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/hw-vuln/index.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/hw-vuln/index.rst b/Documentation/translations/pt_BR/admin-guide/hw-vuln/index.rst
new file mode 100644
index 000000000..46cdf7ebb
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/hw-vuln/index.rst
@@ -0,0 +1,30 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================
+Vulnerabilidades de hardware
+============================
+
+Esta seção descreve vulnerabilidades de CPU e fornece uma visão geral das
+possíveis mitigações, juntamente com orientações para a seleção de mitigações,
+caso sejam configuráveis em tempo de compilação, inicialização ou execução.
+
+Todolist:
+
+*   attack_vector_controls
+*   spectre
+*   l1tf
+*   mds
+*   tsx_async_abort
+*   multihit
+*   special-register-buffer-data-sampling
+*   core-scheduling
+*   l1d_flush
+*   processor_mmio_stale_data
+*   cross-thread-rsb
+*   srso
+*   gather_data_sampling
+*   reg-file-data-sampling
+*   rsb
+*   old_microcode
+*   indirect-target-selection
+*   vmscape
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index c574515c2..9f7933c57 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -45,9 +45,13 @@ Todolist:
 
 Documentação relacionada à segurança:
 
+.. toctree::
+   :maxdepth: 1
+
+   hw-vuln/index
+
 Todolist:
 
-*   hw-vuln/index
 *   LSM/index
 *   perf-security
 
-- 
2.47.3

