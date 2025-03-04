Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C75B18D65F
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075064; cv=none; b=T16wrJhUGLFpngiteNXnsp+a2PGHMKkWPBfFIYs6Ktt/fSeR9BluTmnWyuTFb9WjLokdmdnYJrgNQ8V6Zs53If9gFFz+YDSWmPDqBVDKzkFWVATyqQPYqrifxQH1Pkdmv9SqT5L8r4PvFNLnoZsFCDUipqfpg+CJ7tHnbrM93Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075064; c=relaxed/simple;
	bh=3pcG3ZRzpNtamp3x79emVoorXuyqJp+uR8v6dVZa9xg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qUKfDdtViE8uWCFvuMpALYnoVxRvIjr99qNpzaF8tSrpD58CyjlgOpGae1MBKbrqippx8GAKiEpMaW8F1BdxgyyVnXgiuATM0jf8EPz3WskXatnn3fQgWALJ8SikH/sEpuOPHsvSHq+5rDQr55uHasi5SkSKRjrdjqwtDaymr7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD0Q/+SU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD0Q/+SU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2feb96064e4so8411067a91.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 23:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741075062; x=1741679862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjw/hZaHmJX1nyoVS8uDJRNhX1MPxTIZt1xiqDcRzrY=;
        b=ZD0Q/+SUXzEP8pu+JdJYHpP/ZGbuQ6Rj4C/UCP3S2L0mwWn4DuRsy46vp18Dbe0fPe
         hNwJmm3q4RVYNLZThcfPAE/5KHgfYWtBwHOwhXq9BSyTkdBdP0u0zDmM+eZ//TjznwZR
         XC/QbDmyHOGLN0FBQ8J8ERRpsU24HHZ6J5TGacD+rtVH+KzC7xUh2s87XSyvlprKOzFB
         +dFqka5VdBU8AOd1b3mBTUWGy54q1InYnbaYIM1uadnRtl6hFQw5Deh/Kbrc3JnTHBM6
         MHW8h1ttsrPjUKy29dfqTM746FJnZHklzkIDQuJ0CkfvYuUDQqZvnYrWkll7rP7Wh0XO
         HEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075062; x=1741679862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjw/hZaHmJX1nyoVS8uDJRNhX1MPxTIZt1xiqDcRzrY=;
        b=qjwicR4SEPAOVzVZFDZolvCEPl5aoiFxWymdPKK78x9oCA8pbRaW1ox8fpynLGORxl
         X98FL7nzCqPSH1r69JX2v+dPpVjTa9zTcASM4MMyJGSGaIdxaXpSQDH2Z0WXNWz2xGkt
         oLldguyy7vucEaVWDzjXT9T6paZZjmmJZS985CAG42FUshENJX7nLddTm6o2PemNPhEx
         yPGilH+9QgIZ55JcCkJuLlgQWqAAohc3VgJNAk9dYp3SxDIzwmphTOoEG+eTD63R5HS1
         g6ZVnGvf1IC4qbvfbbWhdEb6oqU9k/FWBaeJRCLKKlPTBuiOfhTnDa5DtreAhEFFoefn
         tOwA==
X-Gm-Message-State: AOJu0YyR4adciLkUMlxeN7olA8Z0UQ9a42BkN3X+D/N26IAqqLgXetwp
	8rCAFipvSumpvlHIzgRFG38TQHHC5m8vDJIDsIsVH1myVyIHz5rJ
X-Gm-Gg: ASbGncspnGvGA/k49edqwrpPxOTt7gJwsOzAzj2g+CqGux1hlYpsjwtEzBoS0dGVeMG
	+ZzDTwv8FO3YkjjM734Udmim4swLW7nIGAs9lM2wtg+EH4GSsM1c4fjTP31mfSq3EO81kHifyFe
	c5CpOvhPwZpya1pOLEpgkvihs6MagQm9TEccu53jrpWc2OyBdr+cuPmg/WVhe167Rn1S+rMe8OV
	MT+KbiXasQaey8bVFNtoCduPDfMwQXauv+BZEZd9f+6M8C/U/ZHioctNvkikv4YS8Q32SrvCInm
	ZEB0YsaBOTSI64nVCUPnPh6ZAYoSukWgOcT984OKJEDEaPEBSwLNf/3fBhPnwlaNkwIrd9rtelz
	ZX3C6aUkhKppyAZlZ1A==
X-Google-Smtp-Source: AGHT+IFrkQn+ahVokjD+0dAE/5iqeMIf3rq/xILZ3sy5MG28XiFl6rt3ojM1DN/ZqsMl8BU5o5uOig==
X-Received: by 2002:a17:90b:2ec5:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2febab57021mr24623829a91.13.1741075062217;
        Mon, 03 Mar 2025 23:57:42 -0800 (PST)
Received: from ubuntu-2204.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7f12sm89532125ad.122.2025.03.03.23.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:57:41 -0800 (PST)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>
Subject: [PATCH] docs/.../submit-checklist: Use Documentation/admin-guide/abi.rst for cross-ref of README
Date: Tue,  4 Mar 2025 16:57:34 +0900
Message-Id: <20250304075734.56660-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit fb12098d8ee4 ("docs: submit-checklist: Allow creating
cross-references for ABI README") assumes that the path of
"Documentation/ABI/README" would be converted to a cross-ref to
the README.

However, as the README is included by the "kernel-abi" directive
at Documentation/admin-guide/abi.rst, the expected conversion
does not happen.

Instead, use the path where the "kernel-abi" directive exists for
the conversion to work.  Restore the original path of README in
inline-literal form as an additional note for readers of the .rst
file.

Apply the same changes for translations.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: fb12098d8ee4 ("docs: submit-checklist: Allow creating cross-references for ABI README")
Fixes: eb0c714120ba ("docs: translations: Allow creating cross-references for ABI README")
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: Avadhut Naik <avadhut.naik@amd.com>
---
Hi mauro,

Having failed to get a response to my question at:
    https://lore.kernel.org/b464e845-a83e-421b-aeeb-6a9ee36afbbf@gmail.com/    

    "Mauro, this change does not result in cross reference to the README page.
    Not only here, but the change in Documentation/process/submit-checklist.rst
    does not work either.

    What was your intention of commit fb12098d8ee4 ("docs: submit-checklist:
    Allow creating cross-references for ABI README")?"

, I have gone forward and prepared this "band-aid" update.

I don't think this is your original intention, so please feel free to
override this if you'd like to.

Note on zh_CN and zh_TW changes:

I intentionally used ascii "( )" so that inline literall is recognized
by Sphinx without extra spaces.
Another trick is the escaped space at end-of-sentence as in "...org\ 。",
which prevents unneeded white spaces from appearing in front of the
full stop in the html output.

        Thanks, Akira
--
 Documentation/process/submit-checklist.rst                 | 3 ++-
 .../translations/it_IT/process/submit-checklist.rst        | 7 ++++---
 .../translations/ja_JP/process/submit-checklist.rst        | 3 ++-
 .../translations/sp_SP/process/submit-checklist.rst        | 7 ++++---
 .../translations/zh_CN/process/submit-checklist.rst        | 4 ++--
 .../translations/zh_TW/process/submit-checklist.rst        | 4 ++--
 6 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index 2abf8831cf74..beb7f94279fd 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -52,7 +52,8 @@ Provide documentation
 4) All new module parameters are documented with ``MODULE_PARM_DESC()``
 
 5) All new userspace interfaces are documented in ``Documentation/ABI/``.
-   See Documentation/ABI/README for more information.
+   See Documentation/admin-guide/abi.rst (or ``Documentation/ABI/README``)
+   for more information.
    Patches that change userspace interfaces should be CCed to
    linux-api@vger.kernel.org.
 
diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
index 3308c3084c60..5bf1b4adebc1 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -58,9 +58,10 @@ Fornite documentazione
 4) Tutti i nuovi parametri dei moduli sono documentati con ``MODULE_PARM_DESC()``.
 
 5) Tutte le nuove interfacce verso lo spazio utente sono documentate in
-    ``Documentation/ABI/``.  Leggete Documentation/ABI/README per maggiori
-    informazioni.  Le patch che modificano le interfacce utente dovrebbero
-    essere inviate in copia anche a linux-api@vger.kernel.org.
+    ``Documentation/ABI/``.  Leggete Documentation/admin-guide/abi.rst
+    (o ``Documentation/ABI/README``) per maggiori informazioni.
+    Le patch che modificano le interfacce utente dovrebbero essere inviate
+    in copia anche a linux-api@vger.kernel.org.
 
 6) Se la patch aggiunge nuove chiamate ioctl, allora aggiornate
     ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
index 20a952cf82f9..fb3b9e3bd8ee 100644
--- a/Documentation/translations/ja_JP/process/submit-checklist.rst
+++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
@@ -76,7 +76,8 @@ Kconfig 変更のレビュー
    されている。
 
 5) 新規ユーザースペース・インターフェースが、すべて ``Documentaion/ABI/``
-   以下に記載されている。詳しくは、 ``Documentation/ABI/README`` を参照。
+   以下に記載されている。詳しくは、 Documentation/admin-guide/abi.rst
+   (もしくは ``Documentation/ABI/README``) を参照。
    ユーザースペース・インターフェースを変更するパッチは、
    linux-api@vger.kernel.org にも CC すべし。
 
diff --git a/Documentation/translations/sp_SP/process/submit-checklist.rst b/Documentation/translations/sp_SP/process/submit-checklist.rst
index 3087ba80e818..e7107cc97001 100644
--- a/Documentation/translations/sp_SP/process/submit-checklist.rst
+++ b/Documentation/translations/sp_SP/process/submit-checklist.rst
@@ -97,9 +97,10 @@ y en otros lugares con respecto al envío de parches del kernel de Linux.
     ``MODULE_PARM_DESC()``.
 
 18) Todas las nuevas interfaces de espacio de usuario están documentadas
-    en ``Documentation/ABI/``. Consulte Documentation/ABI/README para
-    obtener más información. Los parches que cambian las interfaces del
-    espacio de usuario deben ser CCed a linux-api@vger.kernel.org.
+    en ``Documentation/ABI/``. Consulte Documentation/admin-guide/abi.rst
+    (o ``Documentation/ABI/README``) para obtener más información.
+    Los parches que cambian las interfaces del espacio de usuario deben
+    ser CCed a linux-api@vger.kernel.org.
 
 19) Se ha comprobado con la inyección de al menos errores de asignación
     de slab y página. Consulte ``Documentation/fault-injection/``.
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 5c20a7f0936b..0e524f1c1af5 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -82,8 +82,8 @@ Linux内核补丁提交检查单
 17) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
 
 18) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
-    请参阅 Documentation/ABI/README 。更改用户空间接口的补丁应该抄送
-    linux-api@vger.kernel.org。
+    请参阅 Documentation/admin-guide/abi.rst (或 ``Documentation/ABI/README``)。
+    更改用户空间接口的补丁应该抄送 linux-api@vger.kernel.org\ 。
 
 19) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/`` 。
     如果新代码是实质性的，那么添加子系统特定的故障注入可能是合适的。
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index b09d29b0cc1b..a0cb91a6945f 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -85,8 +85,8 @@ Linux內核補丁提交檢查單
 17) 所有新的模塊參數都記錄在 ``MODULE_PARM_DESC()``
 
 18) 所有新的用戶空間接口都記錄在 ``Documentation/ABI/`` 中。有關詳細信息，
-    請參閱 Documentation/ABI/README 。更改用戶空間接口的補丁應該抄送
-    linux-api@vger.kernel.org。
+    請參閱 Documentation/admin-guide/abi.rst (或 ``Documentation/ABI/README``)。
+    更改用戶空間接口的補丁應該抄送 linux-api@vger.kernel.org\ 。
 
 19) 已通過至少注入slab和page分配失敗進行檢查。請參閱 ``Documentation/fault-injection/`` 。
     如果新代碼是實質性的，那麼添加子系統特定的故障注入可能是合適的。

base-commit: 76a6782284dff53a08b688fdead3e46f22236e71
-- 
2.34.1

