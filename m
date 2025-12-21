Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974051EBA19
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766300453; cv=none; b=ps/mOrEeLLWAmYjY/SfWyWy3g4mIxog/5m9TAPZFY8XoWhUbltyiKg9qNx/gSUafOvf1lTzP4G/uy2kuaaOYZ9eDCo6/Jyd2KQaqVZCWTpX3fcj3PdwREkrZDN0LL0V/jMHnoVn4yTUI24YSmUWq7KaFK/pM8H7y1DCQbXVO0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766300453; c=relaxed/simple;
	bh=yGU327kh4Bf6zZy2Yagp8yzrreRNuA+F+B6N0rpT9oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEUwlycLQdRL829Z4jMhW5NEsSnytk+UMFHeEC0s9+DsxZldsPxfY+7yYWeSKdPo81KxXQrizp7gJ+JiGpW39LDzrVDJIN6bKda7WEiEl11/IA/ldpArWoRGHCzyev+DSwsFwfYXhAabnnAg5ltDmVUWAtadeFv+DBBwMmqLamI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Id6jsMCQ; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Id6jsMCQ"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so1560884a91.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 23:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766300451; x=1766905251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wm4lYrd1UEAfe1OMJYAL+6fR/c/Hp392vfi3YhuFblk=;
        b=Id6jsMCQCHx2Et3K0SiD6f92fLTrqr1aePvpJy/Z3hIVDdvfc7nmDjg7tJhSRbLgy9
         fWSqTfPsQWvRd4jyaHGlrwFTRDKg6uFXwhuAteyiqTWKjlTiN4WMcBSVAzXSpbVnzSoC
         FJQeAzldJKr8hoAA5sYn4uqUU771ISD39mpcbBLiLguVrkVaANEdV+M5PePfSsCQpWg4
         vvLafpGoy5fUavjr7QVv/ofX4yfMiMwgPZmdhazvIo8Oo4NBOqrY2KxsddlReEWZJ9Mg
         7eFZ8l515ooTfOV+MplZnWmjqp8JYR+uyl2eT6SrY0NZzhzsPf+9D/VtDJkr5bcmHy8T
         JHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766300451; x=1766905251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wm4lYrd1UEAfe1OMJYAL+6fR/c/Hp392vfi3YhuFblk=;
        b=kx1xlXur5YNbOmuN8i1p1Hl8lZYIkD+Oc5tcwgTLKyAJP/ieugM516MpOof56WPhfR
         4pQFaT1CFB0Rozk0J12aep4+YjGKZ7kkPd2SuJnEz47dvsFujOAafxBW1S7J++U0mk+U
         mv3bxnIh8jcqzcqTySWsY9a1nIVVT9r9lfJ4u1q2YBHnBpwJvzi3jY99da0WRIsccm/s
         MO1Yy2kAcgTPn4Qwazh/0T8HQL8DSzwvv3C4iC182qs1ZJGI8XJBAgTJPQ8shyAqsN24
         VPgyENbz//wJr6N9/B30YfrmyXPCair3QFngT88WqE4bEkSVZblKBvLKIm5HusS4FsTz
         KsLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQP2UBTWIztuoPdYthTn1UdGSwBJh/+TVGtjTrcoJVFSNcug4+03oeEuPS+m2mOBPZwqNKia0TpfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YymG/gmkds00Z7uhkPlM8o3AzGbkOP0M+ZDVORWqz7fQmCRojo5
	53xn2fl1DztC+VHvp7h6h6HNHeU8VTkko+CYMvTiJGaATUHYFAWLMlcJ
X-Gm-Gg: AY/fxX7dt5o/JB6nz3sHywpggovvEiWPmfyPP+Iw59iDY2P8nVMXZKoElOzLufvyD1+
	0dzoz/EjUPZ2IK6NDf2nWIuiKGiu0XMK8fbpBB/EjQjNMVIuMtOgHDWTEDKJuqEWevgqhvm0U71
	iAHJHhoVZLTkNFLqNqrq9vKs+JYGKJExK6mrTII7xQkuwu1Rt0cgEQHZVV4Tv/eip9b/gI90Ef/
	QHrcFcUazYt+6WmySqiCxrXfh2hZV4ALKKywbE9PMA4kFQs+vcUQ/Zs+osK/OotJ2OoBXth7Ael
	xkjBFJpTQsOGnVr7lixPMBZmg1f9bVF57flsgeA6LPXVmpquSe5RgQXe9xnlZYGFLbKiki/wdnf
	OpuJNVps9k66WoBEIi5b/eTkHOWQnXotnozPpvnGNGDjAC8TnD483lRaC9yr6yWDQoAe60NW1MR
	xDR6uMSMiY0jPjgbRnnGk777FsST5BqQuvsMCyQc16mrRaGQDvlqkWJbANnh2LkSt54w==
X-Google-Smtp-Source: AGHT+IEVTyoizp72hHa2oRLjdKpOv2xTmjBKmKZHtuDvcFdYNCRlNJ1HgycXM39JHS+fOnG6zZbWAg==
X-Received: by 2002:a17:90b:4b0b:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34e71e09fecmr9309489a91.10.1766300450888;
        Sat, 20 Dec 2025 23:00:50 -0800 (PST)
Received: from cncf-development.local (90.106.216.35.bc.googleusercontent.com. [35.216.106.90])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34ebeac8623sm652843a91.1.2025.12.20.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 23:00:49 -0800 (PST)
From: SungRock Jung <tjdfkr2421@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alexei Starovoitov <ast@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SungRock Jung <tjdfkr2421@gmail.com>
Subject: [PATCH] Documentation/bpf: Update PROG_TYPE for BPF_PROG_RUN
Date: Sun, 21 Dec 2025 07:00:41 +0000
Message-ID: <20251221070041.26592-1-tjdfkr2421@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LWT_SEG6LOCAL no longer supports test_run starting from v6.11
so remove it from the list of program types supported by BPF_PROG_RUN.

Add TRACING and NETFILTER to reflect the
current set of program types that implement test_run support.

Signed-off-by: SungRock Jung <tjdfkr2421@gmail.com>
---
 Documentation/bpf/bpf_prog_run.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/bpf/bpf_prog_run.rst b/Documentation/bpf/bpf_prog_run.rst
index 4868c909d..81ef768c7 100644
--- a/Documentation/bpf/bpf_prog_run.rst
+++ b/Documentation/bpf/bpf_prog_run.rst
@@ -34,11 +34,12 @@ following types:
 - ``BPF_PROG_TYPE_LWT_IN``
 - ``BPF_PROG_TYPE_LWT_OUT``
 - ``BPF_PROG_TYPE_LWT_XMIT``
-- ``BPF_PROG_TYPE_LWT_SEG6LOCAL``
 - ``BPF_PROG_TYPE_FLOW_DISSECTOR``
 - ``BPF_PROG_TYPE_STRUCT_OPS``
 - ``BPF_PROG_TYPE_RAW_TRACEPOINT``
 - ``BPF_PROG_TYPE_SYSCALL``
+- ``BPF_PROG_TYPE_TRACING``
+- ``BPF_PROG_TYPE_NETFILTER``
 
 When using the ``BPF_PROG_RUN`` command, userspace supplies an input context
 object and (for program types operating on network packets) a buffer containing
-- 
2.48.1

