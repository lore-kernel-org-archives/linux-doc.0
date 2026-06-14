Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7221B9F6
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781480670; cv=none; b=r06hJG8bF4JOZJpDMI73jqvMywd6GSXyUQJ0hwng2MwgfkAMOgHeR35ML/zEbHL5aZeZe2ZzXdVfeNyTjkvQ69fUqX2jtkp3cSiwpCdkgGwCFSatCuDg9ga6AeMTOlGTAO/QP3n3s4JDBeNdUGdVK+DjxdNiVnXyukO5UhO6Bjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781480670; c=relaxed/simple;
	bh=iZVMkonuw5+KwP7CudYB58877voDloFwWZW9kLVLZWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rLKzmJAcHeSjnKEiHpZlqsSt1GTzZof5aR4oJj4dx3Fzy7ZOSXEG+icdIQ9T1YPABStmsIwbUb2Tn0Tq7cxkfa3Wr7uWZvLdDoHKluXEtKuOcB/8qQEq7OF7la6jvnH/7NAf1B3jHtUrsBYMsYsHHAu08gBgoWlzAwFpD09b+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJmVNQia; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJmVNQia"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9667fd8e4ccso472983241.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781480668; x=1782085468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYQv8aVovJIRNeb5HJWUq2CdtSsesHyiKgKSRdQsRRc=;
        b=cJmVNQiaQ+K/MIQeqD3aLfUR6WcNKDGxo1H50ogzNAvfiteEnejOkXft55mDhb9UBd
         6UIZGNBqpkb/9lRdZUxYqUPFcbEegm02b6OlOKRLtODv5rqdwIW24W/m4jqv69t5g9I4
         owl/It+uTRLO5xahDHzXVzvZH/vTx7gdgZrIHI+ulJfeI5d3sV3Os0ys6rVQTQhdqbq3
         DmaLgKJoU71dyGvJgIUqtCfh2PJLPxVZKHcD0w5kfcsSxZ9CfXdUzOSxW6nlCJFriI3o
         lsNGqzVFMfLM4JGwTAECluGlT9uMV+u7UUskDBgLD5Ci3xfVT1dSi4MDqOwyN2IZFjQy
         C2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781480668; x=1782085468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYQv8aVovJIRNeb5HJWUq2CdtSsesHyiKgKSRdQsRRc=;
        b=dzooNDO7dpmeId84ZFXHQpoNAK2v2vbKnSgiPzY5JSX4iMhg9AgdLuEsIO1FJOi5Mg
         7giO0x8h4W0lpfCNNwfkZRC007pbf/BwPAgXbGLovlogQGqIcC7mG1sNpo/vh/E4Y69w
         dpOA1lAFl9P64JTJUuMoGI4HDWkv2jws8CasPTerJQH20mE7V1eTlCjeRJfTcsVEzoPm
         stgWHLesn8As8PyO0xRi6JAWO+sRkupWHWjoqM6CAhGmSoQqZVUolyi+EoNeqwJ5uEIW
         8Bnq/kMeFepEBDUBuKWKEHycjeJUdKaf+IbASXtA86dkg5/WZbwZ8vHsjO7dedYjO3tZ
         dvQA==
X-Forwarded-Encrypted: i=1; AFNElJ/fZ4brUGV1mpUs+GgMq5zTaGf1b29RYXyE9vD01xGTfqgEYdngiJBYNyS4/Lx+BAvUadUK5c7tu2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSCH/37PTabEXLOUGvUuINzc1SiBjhz/3yAjQdUPN0kEqovws
	6qSrEH6CjVk0A409F8sB388mU3tCjYJHkO8KejOVE5aT/80kepoaHHoyBygrutVT
X-Gm-Gg: Acq92OEXQzx6vaBsrxIXJWhmyAg+Nl2AnCv881S6C6wT0Ej6/KUxx97i5Nh62zMuj6+
	49zYAIIHYnntjR0BhNWRnZh4D7WzXpa1vdGgh1pvmw7vmkZNID4DBmbjW+MIZEzJ94E+U5MbDgI
	GD1VtgRnx8un02uo2jpyEyuW9anuKIK7PHN/VvorfHj5Goll8X56IZBlf5kKBQd3OkoL4YYGnW0
	SwdPYI1Qm3ua00bny9ddCVQla0wcIwNvFI68UYU8IehvJx7QGIwMS5IfRHuVMwyrT+N7gwcIaRT
	xd5HqxQbHWJ1dCFeifmNb/6PDhZpBzr3tKc36bthftEksA8OinOv1WoLRbT9XgO65XsU60C43fD
	zu6sKEYS0eF2ARrDL/bBYozTzoVMvaTXX5caTHyx1xltg8ps79cEYRUZylsmlE3P6Kl3DmzsBb4
	hrREfg7eXoY8fBL5ODxYHE+ngOSipi+x4+
X-Received: by 2002:a05:6102:f13:b0:631:2cb0:bf8d with SMTP id ada2fe7eead31-71f5e1f25d4mr3721476137.6.1781480668298;
        Sun, 14 Jun 2026 16:44:28 -0700 (PDT)
Received: from localhost ([2804:7f0:3d7:1d78:3649:b282:5771:857f])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a03d975fsm1954407241.6.2026.06.14.16.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 16:44:27 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH] docs: pt_BR: update minimal software requirement for pahole in changes.rst
Date: Sun, 14 Jun 2026 20:43:20 -0300
Message-ID: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Brazilian Portuguese translation of changes.rst to align with
the latest English version.

    Key changes include:
    - Updated minimum version for pahole (1.26)
    - Added note about kfuncs annotated with KF_IMPLICIT_ARGS
    requiring pahole v1.26 or later
    - Changed "optional" to "opcional" in the software requirements
    table

Signed-off-by: Amanda Corrêa <amandacorreasilvax@gmail.com>
---
 .../translations/pt_BR/process/changes.rst        | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
index a105581dc..49b7f7450 100644
--- a/Documentation/translations/pt_BR/process/changes.rst
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@ -32,16 +32,16 @@ PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautil
 Programa               Versão mínima    Comando para verificar a versão
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.85.0           rustc --version
-bindgen (optional)     0.71.1           bindgen --version
+Clang/LLVM (opcional)  15.0.0           clang --version
+Rust (opcional)        1.85.0           rustc --version
+bindgen (opcional)     0.71.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
 binutils               2.30             ld -v
 flex                   2.5.35           flex --version
 gdb                    7.2              gdb --version
 bison                  2.0              bison --version
-pahole                 1.22             pahole --version
+pahole                 1.26             pahole --version
 util-linux             2.10o            mount --version
 kmod                   13               kmod -V
 e2fsprogs              1.41.4           e2fsck -V
@@ -149,6 +149,11 @@ Desde o Linux 5.2, se CONFIG_DEBUG_INFO_BTF estiver selecionado, o sistema de
 compilação gera BTF (BPF Type Format) a partir do DWARF no vmlinux, e um pouco
 depois para os módulos do kernel também. Isso requer o pahole v1.22 ou superior.
 
+Desde o Linux 7.0, kfuncs anotados com KF_IMPLICIT_ARGS exigem o pahole v1.26
+ou posterior. Sem ele, tais kfuncs terão protótipos BTF incorretos em vmlinux,
+fazendo com que os programas BPF falhem ao carregar com um erro "func_proto
+incompatible with vmlinux". Muitos kfuncs sched_ext são afetados.
+
 Ele pode ser encontrado nos pacotes ``dwarves`` ou ``pahole`` das
 distribuições, ou em https://fedorapeople.org/~acme/dwarves/.
 
@@ -189,7 +194,7 @@ Tar
 O GNU tar é necessário caso você deseje habilitar o acesso aos cabeçalhos do
 kernel via sysfs (CONFIG_IKHEADERS).
 
-gtags / GNU GLOBAL (optional)
+gtags / GNU GLOBAL (opcional)
 -----------------------------
 
 A compilação do kernel requer o GNU GLOBAL versão 6.6.5 ou superior para gerar
-- 
2.43.0

