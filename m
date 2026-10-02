Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478150129B
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961127; cv=none; b=YGKcMitxHA+YPxU+viC02EHDfMAO9nTde3tgK9IbMkXNub3OmAFSF69KbJ/X5rViPVeTk2EFLK/08jZHc4zPpQ2HoBKFfgB8j1+DvXkuWG9tox0AcN3BQ9J1uGw3ElN3niqxpP/7pY4qBqEqlIv2sFB4gvCk1ZwRvQZTlvHhSzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961127; c=relaxed/simple;
	bh=yPOSLtMKK6xroPFFquxn5pvrVYYqB/gGw7/6n8YfDAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCrKvR49b8aZ5PI9c11VfECT8tZA4LSgEwhdaAzYckPHtrBJ2SUem8nN6JEEdNLOazqh2z9Qu/PHVmbKaIj3ZrNt3MNAKhovcvWSsD0zcghCmtKb04CFvFPynUv0R6FDvQt0axrgGCfnhm/d9qKlv2yc/atqoT+q1y9fUyPH03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXb6+i2F; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXb6+i2F"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cdb9cb7feeso2955858e0c.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961113; x=1791565913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Terqj6V3YCOhDH9GroSJ/QKq/dlU/BXbkJwIECKO0XA=;
        b=FXb6+i2FXauvIwSGQrt53C+sWSHb3UbgKy1+7dck2Nt2vrlSHDtNL4sSNa1SpauLEs
         8dD68Rs54vwthEYadd5KO5aCB/jGXUhI0FyM+KOcvyO8j06J3SkDgR/ZgHhhRHyLMLBP
         qyygK0h7vzcJBhe9x+YyghfQ+WBUTbQx+gyAynlhqXf/QeK1N3ZQ1oUcaZhGJwD/MQF1
         43paTnF4BcSKX0BU4BLBKmDs+3Hk7es4E9GcxpAsWN7V5c4M9CT4KyB8uge72BiEFbc/
         O0R5NJvCC0hxRYI6ETkwKyqc23yGlxYqWRzOG8ATV50PJxromgIFZlVgN9IGkU8coTSh
         +q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961113; x=1791565913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Terqj6V3YCOhDH9GroSJ/QKq/dlU/BXbkJwIECKO0XA=;
        b=ZGDHkWQk7x2AW42DI6ny/7xXExwoBJHYJjjgx/2nXvKztrQc7WkV1C5N5cz5quURvl
         ROv1AvH/XOorOyfBWS0ihRCJlYo+V+SxwSsAF+rqWSlnxM9UCvp+a+beuObE6TD+ypbF
         IBE+7bhSdTylEvzn9OvwCSUjfzL6/YQCWwyBBq6y2Ra2wTkH3z8dA/CeY5gexHzfC+pJ
         fuWaSYHRK1DsSfYY53htvkGbNb/5v0N+dkPYEgbMhrNk2phWKzfgZbS7cfzjq3XtcGwF
         VLOEJIovZA+kseuNBv08NtMnyoY3EeHqC/R6b2alcZbHqbaz9Kzv0uPYqJIKe6ZlA2Mf
         bjJw==
X-Gm-Message-State: AFq9FYJCaAVmgRXAQ2mXvlljSnHNJ8bSWLw2Sk3iRwibyLxx3aRPuD3e
	0Vqc/5FA4P2lH0QuBHn9YYtf+oCKAA/HDDB8sLaxpra+iN1C5FNngfTVdRYPr4m/
X-Gm-Gg: AYBFou1fk5qHqD3wyUnsS2GPKdJ0Oih4jTkZqOoH5PiTawSN/6fre+n4uc2o0iRT2Gq
	XPvs9m77zfjsqnVKWtYPxpW05Ba9rc9lAbgiMFN3qhQdsRc2Ud/Rcigs//jmGehHD7w0bm8/2RL
	FAML5afawK4jhSm4DrvibH+xhgF/jJ9uwAUNy5Ef1JdvJ1vdN8GDXF5wLapQN6YB6c+UuFB4Amh
	RKcaLEwn4qEOQZbANswRsgsGN1jca5yoCEPs49pmgcmOcZWkgn3VHPsZ/rIsrKM/6DPyHsk9imo
	W/ktH6BaKj5h57+z3FkGSyjKaLygOHJ7B2YkZjy2b6khtT43KkBkSRXvAA42aRWaJnhOMhMTuDb
	JJeHQ6FT02nmhQa5CN8A36l58Ekj4OyY59LCF9+9gs+g8e2Y9OnlvEK9SX7hvtbpuDgZfCl89LJ
	6mmpgAT7d0pqydfhNZxi58UkMZK6Ve57XTAx3SG+ZMRKc++JZTAiqylZ9upf+5q1jf1n///q4nF
	huJ8rCo9UEhiCXmu+P670FKggtMRMIALNRxBDJhQ6outSqPVbK65CnBiqYR9fWPPvLnfGoB9l3S
	AF5ejIgPETUpqTlrLNXexUg=
X-Received: by 2002:a05:6122:3d06:b0:5ce:76cf:fb2e with SMTP id 71dfb90a1353d-5dab0fb0543mr951882e0c.16.1790961113035;
        Fri, 02 Oct 2026 10:11:53 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:52 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 05/10] docs/translations/pt_BR: admin-guide: add hw-vuln/index.rst
Date: Fri,  2 Oct 2026 14:11:28 -0300
Message-ID: <20261002171133.50969-6-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
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

