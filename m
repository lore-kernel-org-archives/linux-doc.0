Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FA4156C5
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529084; cv=none; b=jHKRMtKvAQM3u+ehKLMDxhGuc7rrXK8MQN66vT97xH4B9RjbREx2bWsa/5+17XCIgk4OFUm60bXF1BtZn1YGERuDvIt2OM2i6cUkAHUw/B6nPWHOk5EtRnEt4UIIqTypi4s82wgzxBD6uMknZiotJG9DGDVqmvFPlnCjcky3O3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529084; c=relaxed/simple;
	bh=qDTWo32iEis5B5EikwCAmCw2XSqTDoKs39jdS5gj1yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/HS8K+NzQ9vbR5Ea4QMaEeoCFkWdBnCVB92R1U+PeXfxUnee7nX/5nxo26IJ++f16zVuH0LnKUIa/LfvTNsfMfYNCTrpDj1NUO0C4QK6YMg4xJqDrjSynMnBimC6xZyZZLwQMe6d7Ma9wI34NVgTluDK01PA7ye/4c19/qBCTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuN0Pu9K; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuN0Pu9K"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf433a99so677070a12.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529082; x=1787133882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1Amz75UuSYEUv3v4aAO3alBAyuVKiTqpSzrEm2VkvA=;
        b=PuN0Pu9K/a+lP1hnYJrvtBltPTMf/6HU75lPwNXGWkKqDoTb84Sf2CAyvvLTZuLIeJ
         ImAV/1w90XtEyITZt4/ko7R18hFgbiGznnE8u5Q8ZCs3B69iZRm5vODh/QnIiNIeVvws
         NRZkBlGNPlwAh5SsB5DgNHCLC+DrV1OFYfwyiiew808XKfijRqJl+DejtMWIRl+Jc0pf
         X/p5lXOTf0WAD2Q5xP1jZTMiT82yGFy7bgEChiKDcRPsV+eyS0L+3yMfrOtQ53U9XiZs
         FkUOP3cXdOc9dmWXfCmxAQw9z6QLnE/y8WaeR+eHu1MAKE+H3vWfisQGDR8h4MIkk5aP
         fX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529082; x=1787133882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1Amz75UuSYEUv3v4aAO3alBAyuVKiTqpSzrEm2VkvA=;
        b=bGMT0vgvQnwaCs3szllyoJYYjLyOf4Sw4CKJRU5+lC5z40dUnPmb3K8gQMv1UAS5Y1
         QfG63pAA6BzsIKOpW4SZMKPMlc7VNXGrA0reZ+gNtay0UN2kaOnwYJ065ggCevC16i2Y
         6gAY6Z68lfkntKpaFfgRjgVWeeIxozEICrZ3dr0+QRy131c2JauBhzaIY8na4tQa6Arj
         6nZLT8OpNIsn0lhL9paKqIsj0u8tABWF84b6vPexbFb5YxG4czymhtGmnZzLk+8r0Psr
         jx6OgaLWQnEKIC/NdDFjPEzYgIGEpeuTk75Dhdr8WHM5wSrT6JCKVCN63kZBPstnSha1
         FUfA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+mbAr4Q7Od8SI9Hm+1aZ2LGWlKDVXSDdrH1Fkz3JozrzztSDQj2LXLTi3dGzDaJKbAMgrIY7URj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2yU4/J7YifeW1NAPmZs40pr2Ilm0lxG477+PyWFP88m4yCyF
	vItlHNbtc3/fbt96ttJgykM2XZRDu6Np/dKiiSrr6gDMdj4zxv5heWsY
X-Gm-Gg: AR+sD13UkNgkZz7LzGslEGWgX+1UaiNgN/rNdMQaPpT6aU6ZZuqEayLpwT2OuZuM5+T
	6R4jSLL/BW62Uv38XuYJNG4o85t0YEaJZ0Dx195LLNdVJAIZkYJ2sdGRExl3O280EMdXa+8D/vQ
	coTJ0NtyOMquCIvxheAgeChh7HMgK8A2qQ9pUVpF3a06eroFedy5VT2XQ7hUC1bOlJBlR1cqQ8B
	6H6Z0lOFvN9J91qvT9HhD55cjhxnoTSuwWY4TLwpP3LcrnbIwqO7C6WAX9W8/IGKelQlnmit7wk
	Som1L7ar7k2wADmvvagzI6VrusJ1aZYdHeu/OxKgpL921hx6rUZ9+csCvvuBTJ0NDNTwEQOZQVt
	Azcyn0WbM/Zd/QncKJRgIzbLP+8+6ILLPbQTWk/+p0YYtvH3t4D6NhmGvaLSwyaQf1Kmju+CVCe
	Dq7baJcOlpUfDh19xc1dPO2Ug017W/klZIsGGefob11HhfTUV8YolOo6scD5wXbLPfZrV21IbdT
	ujZl0915K03FrSi1N0ZcFzToQ==
X-Received: by 2002:a05:6a21:9104:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cc3f7fecf9mr4939767637.34.1786529082230;
        Wed, 12 Aug 2026 03:04:42 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124454d3csm8821247c88.2.2026.08.12.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:04:41 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH 0/3] docs/mm/damon/design: add explanation of nr_snapshots
Date: Wed, 12 Aug 2026 18:04:30 +0800
Message-ID: <20260812100433.6288-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an explanation of nr_snapshots to avoid misunderstandings.

Changes from v1:
- v1: https://lore.kernel.org/damon/20260811101841.804596-1-aethernet65535@gmail.com
- Patch 1 word order adjustment: Repositioned "completely" ("tried to be
  completely applied" -> "completely tried to be applied").
- Patch 2: Use two spaces between sentences.
- Patch 3: Add the "Reviewed-by:" of SJ, because he added this in v1.

Liew Rui Yan (3):
  docs/mm/damon/design: accurate semantics of nr_snapshots
  docs/mm/damon/design: difference between watermarks and nr_snapshots
  docs/mm/damon/design: fix typo of max_nr_snapshots

 Documentation/mm/damon/design.rst | 7 ++++---
 include/linux/damon.h             | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.55.0

