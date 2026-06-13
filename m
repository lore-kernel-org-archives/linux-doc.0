Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9015428488F
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 21:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781385185; cv=none; b=n4+rX067SjoojvAnBfuzjOlxzofgF+XE6klH3Hmuu0d89qCbtwRjWDUwmTH+roKnJYeEl67fXw0o01llhU0Wk//NQd8Yo1n2EnsP2twFEjnUnNnzHzO24KWP0/Nqg/OKgTDBpAFS0X1li4ktPibDsU2mjfArYwBJY8UDyNAkibA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781385185; c=relaxed/simple;
	bh=EzzVltL/LmjdOe0I51oqd7QcT+bRrUdvqgUK3BEEqow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E0BOzWAdoM6cyo/GJVcuBjOZb+y8hPHjIkwX34zAzJ7S4tS90s9B+IEuB59aNry0slgvYHOA3wKTT48PG79N2rSJnaYCSzPgmHO4qShqiW/EfQrz9M1p3m1MDBQctxFqZs0DW+AEU1UNIW4C4jdhz+U9VSD7ukvF9na3Mrclcd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GA/yZ8b8; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA/yZ8b8"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-30759632453so1827383eec.1
        for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 14:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781385183; x=1781989983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ic14bEmNJXh3dWJzI7qlm145jrlZV8rI87fn83LKCWU=;
        b=GA/yZ8b8l876L/uMziPvxOwNod1CCasg2JNVVeRsYVFjqymX2jcaeIMGc9oyJVFy4y
         dsONspI4mj7pdQwqWkJ97JEy4srLLjbOz7FxnQzYpd/H58/G6feHPDBg/Zs3/bJ7akyp
         Qn0fXzRIRyPRzAADICH7wOREdHohxu/nRdys32UdKVDye5jihmhxTBqZ2RwPsWF6C6dx
         FC6rLPa8tddufIw5vV3KzPjbLsdgYpCzry4ZGGldLVCC8YGAAPi6FkITtxpUx5eQVJCX
         pF7P+cOr/QcfCm6npGUhbLTrngdXfY94Xrr7liwjI1uUofMpuSwNjREY73tLyXl4hBEn
         8rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781385183; x=1781989983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ic14bEmNJXh3dWJzI7qlm145jrlZV8rI87fn83LKCWU=;
        b=XYTwfQ5WFKphgV2/G7lEjbggMXjVt7PDiYMNvvU48C+5E++kOTA5jB54/uXrT1YBYv
         r2cSL8zdkH8guSE0pel+AN5OfGgFK8HOoBUQrsHpCkIlQBpd7GMgFgFgV9YvddGSmbM8
         YLmuJNbJQq96VGHO2/HApSvE1vQSG9Q2AcHRl8TU2dmxLeeXxMeR1vVKRshgETAXukKG
         HSMnznOcPziRUdjLbPvbV8MkVdL7GVqmdi7uxt4g8s+JA45PWz/EdFkIHwwfRbcaJYsH
         6rDU3yUfwjJQ4jVrtGlDS9qMEBLbhkUoirp/fEw+6CdD6tKqdllYk83asqRivp9H4H5J
         w7kw==
X-Forwarded-Encrypted: i=1; AFNElJ++aXTL15Sdt9BVOI15eNnR4txBFc5XWhWUgcg9x4zine7TpW12PARusiKr2pNuABIfFQ1BVoUSHIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIbKq0RPic94JuagTOEPaLTWBO8I0y9v+AagJlLqlkKLqk9jf
	P3KNyTypVly+KNeBSsBLbTb+AL+Mex/rLsgoca3204EKtAsVhth1zCPS
X-Gm-Gg: Acq92OFCIEwuQWssoqaRtdtP/fLHce+tpW9I3+ggqYoaGcOpy/3bB2hZ2vc1RbjZ1dz
	WKP+jN53CzhnHWhkI/SELZbyUscYRilSvyYjQ/TksWnPxod5K47xUK5HKLtyHq4mJkLbYwCb7tA
	dE0U4Vto3STSdiuHCK2uw2TJ4D8zQGEgkoGVvGm9DtioRlFq+gJdVUzM3mlqXTLqTksyy297uRS
	npxD+Jdz2BFl/Gel261t/Hl0i3E2OP+O9FXDKMuqkwH/Tj3Hu5pdJSd9TQrkP/NwcJaLQnbeq6z
	fM/ci4XfVEi2T+rEGx4LLyT338CE3hlwwwGTHb+viOu2OPeqyG1bUUWHhH67U/3HtQfad55xYbW
	hIfV8aCkUwKCIjrF4hrK7M2gYxOmsHvKTFFaPFM4Lbf7ffy3NaOrEwxNxfMkBlO/SpIpvPSdtgM
	DFjBtmm0JdarrrR/l8obJKeWfKhyW+4E511HTRqaBXU9Bg/eN6I38dLagKHCJ6vV0wOpR8GENYl
	H5w6p+EbkafuKJdw9W+y8F+nm/1IEpY3VCHhWr2T/6SLWp4sUHEyqi0OYPUhFcBo5XSXzIGHozc
	MFci6hHSKibPKLErTw==
X-Received: by 2002:a05:693c:2b01:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3081ff64a9amr4625571eec.2.1781385183487;
        Sat, 13 Jun 2026 14:13:03 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0849sm9829979eec.7.2026.06.13.14.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 14:13:03 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs/zh_CN: fix CONFIG_CGROUP typo for CONFIG_CGROUPS
Date: Sat, 13 Jun 2026 14:12:56 -0700
Message-ID: <20260613211300.86016-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Simplified Chinese translation of accounting/psi.rst
contains a typo CONFIG_CGROUP for CONFIG_CGROUPS. Fix it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/translations/zh_CN/accounting/psi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/accounting/psi.rst b/Documentation/translations/zh_CN/accounting/psi.rst
index a0ddb7bd257c..703bc81ff9be 100644
--- a/Documentation/translations/zh_CN/accounting/psi.rst
+++ b/Documentation/translations/zh_CN/accounting/psi.rst
@@ -148,7 +148,7 @@ psi接口提供的均值即可。
 Cgroup2接口
 ===========
 
-对于CONFIG_CGROUP=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
+对于CONFIG_CGROUPS=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
 此场景下cgroupfs挂载点的子目录包含cpu.pressure、memory.pressure、io.pressure文件，
 内容格式与/proc/pressure/下的文件相同。
 
-- 
2.43.0

