Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE9274B53
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144512; cv=none; b=hi+N9zMGG9i+gg5w/MevVCP77He8zE3rXNmZRIS7zGqyhumAAIyB7ZswzrqyCb1uPNiG+F3g5uC55mgdc3NDPEdeFfTrU0iuVHYYbAxEOjP8noVA4DctV2350TS6bi1iNb/tG9NOBX9q3VwJuLBnT3NmCDtWLq7ycIL+1xoyz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144512; c=relaxed/simple;
	bh=hsqr68Oc9vX8/voUHFbFnAFPuLsn0bL7K2WG4/BGRRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KzjJYJI2d8KCBt++WZJTF1+vqSOGz4Q/TZcxUIAIyyvt4UMAXukm84sO5bCGL5cUTb6/hT04epI6dB/xbi0LlWEhA8uUlyAa6skuW0f8jh8GGgGjwGBlrwff7/vLfJ1lK2+1qyN7SNjrEm9e8b5QIHEH6aosNKf+MVEonc3SeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BMyrQNof; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BMyrQNof"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471191ac79dso24609285e9.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763144507; x=1763749307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtWFceKwF1EAqIZt5xjQ7BMpYVptXpAtK9rrD1k8iuk=;
        b=BMyrQNofdgcx2ZeiF4SmQDMGdPZPc3yfmYV+jPRiSxJSkQW1S8xndh1odPDqhzXKIE
         MDaebUWyYUePVT78WYkbwAyVyXdiBUTdyQ8JcASFYfhpXuWgCGNXI3AbGA8BMu2nhhih
         AlO+znMqhdUx3pGW81IxnNCZt5y5GRCBM1zbb55mWRFV3ne8OfNoEGlh5+TGKiEkarZL
         215ST8PWVEUaeX9g1iVNotiYZ0vm/WKoYGcD45fG8RAW20i5Des1Bh6QgVOLeBGnDj5K
         Xw9iVyoygfV5cfgOR5BjL+m0FpX/PoM5f9wIasBB+CgB5eeOvzNOLF+ZJUG8L+MLL4Gk
         w3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763144507; x=1763749307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtWFceKwF1EAqIZt5xjQ7BMpYVptXpAtK9rrD1k8iuk=;
        b=bJO3i7lHgyHZQLl3iKRfNu8QNrdefwwGaRhlKEh38Aetquw/Nj8Y9Qd3Bx6R5AN0wP
         R/8UBFDoUtM8v8uiMOsHRk4xXsMN2XW+z7q7t8uRXpSHZyXWcGBzuLAKN8sWJ1jgXSuT
         lVeLK3lzqw+9fntatro646s8G0ldybsdNBv4rtogdZJybMRJXsBwQ+YpO3TEz3JZP3pv
         nRV4f4W0EFv9TmB2WAtbEge/MHj10r4bdcQLCakwAkIrIal+QvnuUYaqqqF2KTwi/sEJ
         iBV48X4fwuGqKEfNqYwUiB8XhjxLqznguIb8s5tBKd6weuEtZsQGB3Bn2Mxe1C1btMiR
         KKjw==
X-Forwarded-Encrypted: i=1; AJvYcCUbxFjdAFnxhngl5AUpeXcRI20ByBmrV2D6UWfHgw316f1Tpq+znAr3zva262NrAsINd51RujV66Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhmjYbySaAlQ23Tshh7CatGW2JXU2pUS7AbMgBfjBBz9ajP2Q
	e3LeLZDHppTsWrtGmTHOTOiqCW0Tzp9vgGo8ALVW4b1OsFQrk8O6qrqQOaoFMxtc7Jw=
X-Gm-Gg: ASbGncv+A8eG8ws9yet9DMMxUXcfHXAnOCGc1T4S4SknbaWTcZ9yiUzL53JWcK0UvM6
	SctOE3eW9FlHhgJl6aKwQVwqGISsTFjJDI2X5bh/PaFxp+U6xrm1nwUIReHXiQQLB6t0h/XvQQa
	DzYANPri/tJ96ncpqtWSf6DTlDRRkBWIneHl7Wz8xWAMIbiSJ+MptXFnkly3bfZE5oUhRZRymAh
	eGnNLJ3WEF8FXWgqZCFg9/kBRjDs4ud2XHJKPkIk3XmwFAQbe2thyLIWAzPETPY3VprbMX/kNWq
	jsixaBuKGa4k0g/7ae5C6NbMA3vbgG0uxH1cO/GGaprJyPsHfHxFzUk7R44iTNv4IqDc3p+aKbG
	iks5pumyz9dBdYPHmtCsywVnn644yd6ler1znuBwdVtBr5uVMJuSzLPuLtj2kmiDyRuDVeGn/xO
	lVGorXW88HazhS27NQ/VKa
X-Google-Smtp-Source: AGHT+IEcs/T48J7wTe4MWRcUWjdNfsWJ5f6070GgChLsF9nfWT5BV7gXI0SadHc5N88QrXzkYcnJ9g==
X-Received: by 2002:a05:600c:1382:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-4778fe9b394mr41688645e9.19.1763144507606;
        Fri, 14 Nov 2025 10:21:47 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm163601805e9.3.2025.11.14.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:21:47 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH v2 0/3] Memory reclaim documentation fixes
Date: Fri, 14 Nov 2025 19:21:24 +0100
Message-ID: <20251114182130.1549832-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I think the reclaim target is a concept that is not just an
implementation detail and hence it should be documented how it applies
to protection configuration (the first patch). Second patch is a "best
practice" bit of information, it may be squashed with the first one. The
last patch just makes docs indefinite until the idea is implemented.

Originally sent in [1], this is rebased and resent since I still think
it'd be good to have the concept somewhere documented. (E.g. for the
guys who are implementing protection for the dmem controller [2] to
arrive at similar behavior.)

[1] https://lore.kernel.org/lkml/20200729140537.13345-1-mkoutny@suse.com/
[2] https://lore.kernel.org/r/20251110-dmemcg-aggressive-protect-v3-5-219ffcfc54e9@gmx.de

v2:
- diagram syntax (Jonathan)

v1 (https://lore.kernel.org/r/20251110193638.623208-1-mkoutny@suse.com/)

Michal Koutný (3):
  docs: cgroup: Explain reclaim protection target
  docs: cgroup: Note about sibling relative reclaim protection
  docs: cgroup: No special handling of unpopulated memcgs

 Documentation/admin-guide/cgroup-v2.rst | 31 ++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)


base-commit: 1c353dc8d962de652bc7ad2ba2e63f553331391c
-- 
2.51.1

