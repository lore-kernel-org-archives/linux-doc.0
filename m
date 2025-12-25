Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C7C1D5178
	for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766664898; cv=none; b=qmim3PHB0MVbJAGMT6vG2KrUxgXqe0wJzqTZkHfVCFAQ0v527XmbUq2p8Q4JTbP6zgwsHKt5JofBbMYkhxGCBTnaAleYUYUDcOZexc+sJagE40oFBAyeDHCl8sAFp+i/rDvIYH5LVtb6BgrnQHZEyyEmPkiSe8Qv9xiW6adpYaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766664898; c=relaxed/simple;
	bh=ogN1j6zNKnujI0ap/EcVb13j7lu/EzCDuSoUkANw7rk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p7F5Lnehmcz9ibQqrqHk1JX1KdB9ThKl3SodQ9fRwAvuM6PHmWo6+0kw7NQBX7ygn/iha+DSYHfBF1htaEDDmTM1nCUPB6954+Hem+eatuSxMt2RTs6usuzhZwTjy8kDfN1lIfNEn4yv7kALvq8NG5Nz3twpf7y+Txg/l1WLEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LZg5NehN; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LZg5NehN"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo7480547b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 04:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766664894; x=1767269694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GqN0b2P6kGFb2fnLTzBisLdASA6e4aR/dIStpGmalyY=;
        b=LZg5NehNhuB05+Zx4mmQkoYVC1ya3VJ6+oPb3zIJ8PPacU66urFJ/gJcrnMVMADF7x
         wvDhPwYUI+ebDSo4VwKRiR3lKxSt/sAVkKANrFRwzKH4mkalRdHz1gLZiujGm3AWSMxL
         eN+e/Kjmi8CNsbhP/IlS9Z/G7gQZMiJvTo9vfl5SBm+ITpBbwTFcsNWZQasr6G18+uhf
         Qf1eYMLJZYT/Ar8Bl4Um98Upst5cwW7XCVulxQX4nBXCvw4XiGlIpHLmme5FN9/vmEqj
         GnIgEFQ4HYVduN/NMXNF9sNVKkO/iijrKdwEMrKRmWxHkaH31ofaVHEMRmfds12/6JpM
         aUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766664894; x=1767269694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqN0b2P6kGFb2fnLTzBisLdASA6e4aR/dIStpGmalyY=;
        b=Z1/SX4NrsQJj2QKFvc44jo500h+GpliffEcr8YCy3gq2A131+ClAwOqtwFAvT5QCh3
         wvOMSkGdhd9H1D2ixT6cYePnRbj1M6os4aGnEppBSNR6cbMXJuHGkpwyFzuEBiv9cjhx
         6bEdInrUfWgFXrRonSnjbR5Mhonon1+VEUBQ15BCz6203T2rk10lhVWCaZzhaGvmCxLF
         SRr8DZgCdBcVmgDEU5Mwby1BPDWDxMpXkOWROlsmkc0FD/yDII64Iaf2uWBW0d6r3kB2
         ft/RBw9wrRkVFa0F/jcTXiVEIdUFf4DYYuUFF8fxe16MdLjngDNt1XkZQHHeobwdqi1O
         Xezg==
X-Gm-Message-State: AOJu0YyqqDMCx5WFQOIqylWYUMmGt0CSK88VHBPWkDwcUzEQsggGd0Fq
	r7BSQO11mbevbUzQpCBQ+1lETRwquYEpFeMrrX7Zieynu4MO0AWK4XMoR5+laVqIT+U=
X-Gm-Gg: AY/fxX7BKT90QNNEWPZl3RW0sCYeg7/LI88k8z9JbmTcHpezJFGSBsKa8nZZlakhHAM
	vuFBbMrMHuieqHAdGJFx0JM16/infDEcnBJn2MCldjwWSds4N9r934h1jYoE5tHmTR/4Ck3j6Be
	GsU2et3AdtEydRFSh0iFLe1UNlCNz2WznBvoO3yMUbrweL3RZTv+9rY3IEklIUqWWKjgNuUc9is
	Gh3I3S65yz8BW9bNjhWYAcV+KxI5EKwmXWvTxTcOErRH+bNjdn9G3Y2HUgaDZ7a7qTGiAZUXz7N
	NsE8qSrtFrR9QDzLXLosLRtOAyCHMMj3W8aXS54RaJKI0AHjdqIpP+AHYWqXAOeU3w89glquHCL
	syqp6t5mJCRBiFkiryUGi4pDAd60kxIyjVtgV4EiKhQX5kzT14iKnTSVfar8/d1nxFa7dKYh2l+
	Ef95oXNL22sfv9msm0sjeZLo1RSVkJm4YanKGYDNMNtc8=
X-Google-Smtp-Source: AGHT+IEr7Vi6KBxIytVa/95KrZ53GceDRDUdanfm+fU4fph99xX6XVwQeJgkOt/6SwrJmzwP7EQsWA==
X-Received: by 2002:aa7:8dc3:0:b0:7ff:b07d:d4fa with SMTP id d2e1a72fcca58-7ffb07dd6d6mr14955775b3a.56.1766664894494;
        Thu, 25 Dec 2025 04:14:54 -0800 (PST)
Received: from L5Q2QGKG1V.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197f9asm19017442b3a.43.2025.12.25.04.14.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Dec 2025 04:14:54 -0800 (PST)
From: Yu Liao <liaoyu.ly@bytedance.com>
To: bp@alien8.de,
	linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	x86@kernel.org,
	corbet@lwn.net,
	wangsiqi.3@bytedance.com,
	liaoyu.ly@bytedance.com
Subject: [PATCH] Documentation/kernel-parameters: Add tsa under mitigations=off
Date: Thu, 25 Dec 2025 20:14:38 +0800
Message-Id: <20251225121438.38427-1-liaoyu.ly@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On X86 AMD systems, mitigations=off also disables the Transient
Scheduler Attacks (TSA) mitigation. Add it to the list.

Signed-off-by: Yu Liao <liaoyu.ly@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..f4a2bf906bf3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3998,6 +3998,7 @@ Kernel parameters
 					       spectre_v2_user=off [X86]
 					       srbds=off [X86,INTEL]
 					       ssbd=force-off [ARM64]
+					       tsa=off [X86,AMD]
 					       tsx_async_abort=off [X86]
 					       vmscape=off [X86]
 
-- 
2.39.5

