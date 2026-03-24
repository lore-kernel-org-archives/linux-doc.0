Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FD33B894D
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774378046; cv=none; b=Sr7k5LL13IrX8+dTLI84te2NYiGBvO0LO+oomt0j53C2RY57Kw7Qj83AdmiOYzBfrivG+N91UUa7DJUg/dd/Vnf1tmCicFtdBSq4YA6MO2IFYyDjTeliM94dLXnh1/6nLjzi152DMVk1AByZOae92yFGz3YX7fU5JszKdHSKtlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774378046; c=relaxed/simple;
	bh=53FtnsCuM4e6/5F3bf619l1FA5IlHw/iDpC6DaQWCI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bH+XIJMufwnAzPGTJatav2Xb3YZtA2mOfDFT4DHrgtsBAwPSPuU1KhijJBnzjAvcptxP+J3DAL9oQXjqItW4QtppBU/kOvIdyMTR/jSvK1kPvlRJotJfyflJg2p9Ur4MwPbAOYJ/h9OIY6q9r2BODtyJzZIYicYqybFfOSJCpss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozTA+Dht; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozTA+Dht"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2adff872068so19842835ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774378044; x=1774982844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EEDLAzRE9U1qCNYBdZlpQSbdmAzEh2YrqmR/0ul8nw=;
        b=ozTA+DhtlLLiqEwYoxl6OOqJ8PdTG6/M4Tw1JdPkrAWKXWBqMw3u78nfakPHlA+v6U
         D8naOwk1ALlyfmNt96IkiL0hiMg7Z9Hy9VeWJTPQ2QeAtkWbsYJ297CIw8RcRVrd56st
         Jm6DEwa1s8ZVM/hnRfMOJ30+V2zC5WmO8ZAbRuEnh6W95AL99yYkMwGYcaQ8xEW83Jtg
         MwWeLQm1MnzVlSOAL+QGDKFQyB9yWLCsFHEnu/QiV+IvieMFoq1avjEqxtqwZkqgLBWK
         QsLQffHFnbbU2mVbjuARZOW5fJOsLbXJ5Ekuw743VQE3FwmSp3wkz8EGoL17jKp0koa4
         BvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774378044; x=1774982844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+EEDLAzRE9U1qCNYBdZlpQSbdmAzEh2YrqmR/0ul8nw=;
        b=PCZKi1C2qhsbNFz+Ti9Q7MsNXsjDKmrJFo0U+USBX+TYa4s448P6RKzSXeDw5IwIGG
         j7FUvCar5Lxa7H7JKGE7J8r7p5FbAQ33w//NQoYZC/zLjjeE/cowx4obHAvf7Ok0fx4+
         low2pr8O7itBpb68GGAQIZ4bwo2ufJHNYkcAGT+G5tf4O/lihDk6E6hFj4p/TMg68il+
         CBRUhVrFzcR+velFFxVcszgb1wi/9qSVRNGGlegqa90vti70xgn1sSAgc4Q0QbQXhZ+y
         NVz+S9JdkuCQUgWawZ65fEt+5N3LiZeG9TXOnpzjUEaIjPDHvlP94SUCqfeYVCTV4nMi
         GtbA==
X-Gm-Message-State: AOJu0YxEUT8HzQNN0qP6uf1isitHll+XTkQrMnYsfPqqjPffu/06ZNe/
	XUOL7MVfULGR4VdQ0Gt/49PuKCME2mYTHXOqNV+TI5XlTmIMTh85fp7pOSHBsw==
X-Gm-Gg: ATEYQzxLON/vufrxhfHRBhIj++wWuyJEWNhIX6BLwjRR4bJ0kj6OOsxBAfgKXdex35T
	HVjucgJZ3eE81CFHtX3K6fcIuIZZL9yvyzj3zzbfTrWvdvh0wqJe9xFAh8fSeeyYM4KZXdwTdKS
	SjkFjQEKCZaodbWYNI3gnYxVwkNbCkjOVri7N9ftbUGKlCZK0szMkWzco5ACiRX2yZRwbEsB/ht
	THiTrSV+TFRervaGjjZV4bL7Mm/C6aRU8HOyZxwXaCoLu87oJGPuOBvIJa4095ob3HY+eTTJaW6
	/PquIwojshcjJ0rgHmUde0mQMADHZAxGCtkzV/J6w4fkvC4Eqt7GI+f1AZVrLJa4ReClPzK/YOC
	w9ONdFbhBQC/urwiMCsPPlxJtiXQc/TtdSLVWHFYwK/kU2WoPc2rD2rHPWlffNEBzjQCrAPC1gt
	rNiXW2EyHHjPGdphrQ5ZVS+ZYSZRDb6XsrZy2GFd1leR0Kn4F5iJWUlRfIeD+/RmolGSBmkOOxt
	Js=
X-Received: by 2002:a17:902:f651:b0:2b0:6ce3:8f7 with SMTP id d9443c01a7336-2b0b0aead53mr6237685ad.43.1774378043889;
        Tue, 24 Mar 2026 11:47:23 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0a9801748sm36732975ad.17.2026.03.24.11.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:47:23 -0700 (PDT)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	tj@kernel.org,
	zhidao su <suzhidao@xiaomi.com>
Subject: [PATCH] docs: Raise minimum pahole version to 1.26 for KF_IMPLICIT_ARGS kfuncs
Date: Wed, 25 Mar 2026 02:47:18 +0800
Message-ID: <20260324184718.3747428-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAADnVQLbtuD=7mtGZFR25ULhjZ-3ifBpkyRcqu9jPSd2Mt3fBw@mail.gmail.com>
References: <CAADnVQLbtuD=7mtGZFR25ULhjZ-3ifBpkyRcqu9jPSd2Mt3fBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole
v1.26 or later.  Without it, such kfuncs will have incorrect BTF
prototypes in vmlinux, causing BPF programs to fail to load with a
"func_proto incompatible with vmlinux" error.  Many sched_ext kfuncs
are affected (e.g. scx_bpf_create_dsq, scx_bpf_kick_cpu).

The root cause: scripts/Makefile.btf passes --btf_features=decl_tag_kfuncs
to pahole only when pahole >= 1.26.  Without that flag, pahole emits no
DECL_TAG BTF entries for __bpf_kfunc-annotated functions.  As a result,
resolve_btfids/main.c::collect_kfuncs() finds no bpf_kfunc DECL_TAGs,
short-circuits at line 1002, and btf2btf() never creates the _impl
variants or strips the implicit 'aux' argument from the visible proto.
The vmlinux BTF retains the 3-param prototype while BPF programs declare
the 2-param version, triggering the mismatch.

Raise the minimum version in the requirements table from 1.22 to 1.26
and add a note explaining the failure mode, so users understand why
their BPF programs fail on distributions shipping pahole v1.25 (e.g.
Ubuntu 24.04 LTS).

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: zhidao su <suzhidao@xiaomi.com>
---
 Documentation/process/changes.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..02068d72a101 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -38,7 +38,7 @@ bash                   4.2              bash --version
 binutils               2.30             ld -v
 flex                   2.5.35           flex --version
 bison                  2.0              bison --version
-pahole                 1.22             pahole --version
+pahole                 1.26             pahole --version
 util-linux             2.10o            mount --version
 kmod                   13               depmod -V
 e2fsprogs              1.41.4           e2fsck -V
@@ -145,6 +145,11 @@ Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
 generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
 modules as well.  This requires pahole v1.22 or later.
 
+Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.26
+or later.  Without it, such kfuncs will have incorrect BTF prototypes in
+vmlinux, causing BPF programs to fail to load with a "func_proto incompatible
+with vmlinux" error.  Many sched_ext kfuncs are affected.
+
 It is found in the 'dwarves' or 'pahole' distro packages or from
 https://fedorapeople.org/~acme/dwarves/.
 
-- 
2.43.0

