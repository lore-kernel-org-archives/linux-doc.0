Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF02116F6
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 06:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763188550; cv=none; b=YkZbo9qPflLo7sje3lSi6kU8Z3sTml0GJxQJvISZ3XZcUtGnqW/hP3Xd6ObXMcdGuqgzbRy0OiScjqBWkjyqxv0IF6ZaYjut2b2BunkkYln13hnm4wICA4LHfh92KV14OvBOAP9qhjucioVNFdwN5IeZ7cp26wEAxw1AdFHRlUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763188550; c=relaxed/simple;
	bh=uqaism/QJbclragkxlE4HR4kpiXL6LTLzjMt2F4uKf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFig+M96OqpmoRWgerFgJtzX9skQzhrmMxrZslvBqxxgr2HeE+hrl9Bv1GdaxfIR92Jy/4AEBuODXas3yoFr23OUwEM7M3NVrJrSsVMniLhsmTj4gy+Jxg0iUhPlhjVirYb7FNC6+eZAkVhvyQpVtG+AAWoi6OZAzvpdg5MKH60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auA50SrN; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auA50SrN"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1885112a12.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 22:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763188546; x=1763793346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AGui+AdzM7aan5lAJ1kcgBs7yX90mlPwYwEf2onMajU=;
        b=auA50SrNxph5I6CjYSYB63UIbOYXYe4BPzZ0gK1yM/aimi5oY20AF108YAHbTV0OHz
         GVgNrmh4ycmY7WPMXDLUvApu1V2K91v7iIRLlwbYElzRBNeZoqymC8+IQ6lOvSp63vHG
         2OMJrxv9a6yL8LYy5nlUVvq0wp3xgZuA5cK87QWH9Q/LyShoHAvR1sGkZ16rvjhw4X5B
         aopSTcKvQSFBJJN1hLLrNWvwKg7u0u8MYnmdKIK6Q3OKxTdI5I7HKsa+4S2DnfiKN2yJ
         958PdsJtqAMZUZR/jcqNJXLH/LOLYZBhmACWuoOhvk9F4/ygkWD7niB4tsAEsLX+hajn
         rqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763188546; x=1763793346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGui+AdzM7aan5lAJ1kcgBs7yX90mlPwYwEf2onMajU=;
        b=plQ+DqVKVUCfW+AbIAx2qRtkjfsXhCNFVQPoz9/lNMUnVw3SgfQMpyHp/Pwqz0+gC9
         GbizhUMV8bhWCzo1AORJyAdZ4f7g/MZZ0FuAWL8l8+h00qgrTH5FqfcppqMAjkYfmMHB
         ewnctxsNhZtdru4LavwUUl7K+v+L+J8mdYwT0I4epDytoYmAXRHwC+45v1JUt6jeTi/1
         g8EU9N69POzYOxyZqy5osPsZtwTYsmIvUaR9vT5RrAjOLzHFNaJj5d5hCJ0PKf1lRuUj
         2ll3/Pm8IGfbSdEO3OjS+CQme6alFTJyRQ2uywFNnAB4gyl8v44V2eFsbXHbivWGLIKf
         Xj0A==
X-Forwarded-Encrypted: i=1; AJvYcCUvhjFW7/EUiAowS5RtD9rZIqyY361gCUkw0mjYoTfQB2wIW7MmRiQA0DRJgy/SNme+apqhi4AqOiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGe3BUT33o0tQK/FokNTzBQ0spxjJFcP2bvCEejt45msQ+WaLt
	3rksBIYwTkcfLuk497+yQNzoQzyCpFFZGSMQknE3wMunEX+2J225HFtx
X-Gm-Gg: ASbGncsFXGlborUUU3wVGtVpvs4uGe3cmXbppueyXbUx7xXLzR/CGx2WbXhxXHuHTPt
	j7NPNq09HP/fn7qXfN6HmFzJ+GnKB+aTNLc+LgvH+/iSvgt2rSRpmf4xtzsOGs2lAC04Izz3gTs
	NRRZHsdcIeS/xiLTTDoTXkzoRZvULJCse5RLjneJK8HlviBBOZmEFfPUgpv9f9pH6KD0vge1TyS
	52pA3+VYqqu1WyMz2Wcn6we+1u1ljkgaAV24PWaFa0rKLVMLVHjABa3pk4BrrlEUWwfqY/Qy/fL
	gIXjdVtUEHbtsrAm++3PkUiozWNiOUQdq2AMnX+64GKaYaUYt7twOdE5fpre6Fi/JDHWIumGtjU
	2yKn1/SuqpRvZsiUKIJaqgo1i2DxiahDbG9vhneb305Nk9t1oz/G+muUdLsAHzvGE7EGWYUV9wS
	MQ6o2JmA9HJqU=
X-Google-Smtp-Source: AGHT+IH+R922UmhrzHHqhEhIc4l+mUYiBtLGewqFO+dYoCs3UdZ2ghbwO/7KvLaGEanZEaAkyDOAxQ==
X-Received: by 2002:a05:7300:d80d:b0:2a4:3593:c7d4 with SMTP id 5a478bee46e88-2a4abb32dfdmr1994874eec.20.1763188546369;
        Fri, 14 Nov 2025 22:35:46 -0800 (PST)
Received: from fedora ([172.59.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49da0662dsm19056274eec.2.2025.11.14.22.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 22:35:46 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	corbet@lwn.net
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH bpf-next v1] docs: bpf: map_array: specify BPF_MAP_TYPE_PERCPU_ARRAY value size limit
Date: Fri, 14 Nov 2025 22:35:31 -0800
Message-ID: <20251115063531.2302903-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify value size limit for BPF_MAP_TYPE_PERCPU_ARRAY which
is PCPU_MIN_UNIT_SIZE (32 kb). In percpu allocator (mm: percpu), 
any request with a size greater than PCPU_MIN_UNIT_SIZE is rejected. 

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 Documentation/bpf/map_array.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/map_array.rst b/Documentation/bpf/map_array.rst
index f2f51a53e8ae..fa56ff75190c 100644
--- a/Documentation/bpf/map_array.rst
+++ b/Documentation/bpf/map_array.rst
@@ -15,8 +15,9 @@ of constant size. The size of the array is defined in ``max_entries`` at
 creation time. All array elements are pre-allocated and zero initialized when
 created. ``BPF_MAP_TYPE_PERCPU_ARRAY`` uses a different memory region for each
 CPU whereas ``BPF_MAP_TYPE_ARRAY`` uses the same memory region. The value
-stored can be of any size, however, all array elements are aligned to 8
-bytes.
+stored can be of any size for ``BPF_MAP_TYPE_ARRAY`` and not more than
+``PCPU_MIN_UNIT_SIZE`` (32 kB) for ``BPF_MAP_TYPE_PERCPU_ARRAY``. All
+array elements are aligned to 8 bytes.
 
 Since kernel 5.5, memory mapping may be enabled for ``BPF_MAP_TYPE_ARRAY`` by
 setting the flag ``BPF_F_MMAPABLE``. The map definition is page-aligned and
-- 
2.51.0

