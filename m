Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19874EB43
	for <linux-doc@vger.kernel.org>; Fri,  8 Mar 2024 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883709; cv=none; b=PU8sTcId7zboOf9tIYOgH33IkzPnSgMoSfPs2h4PmRGbYYyGX6uiJTmXmR5TohaG5gH7Ro4xiWzhwxYOw7d+YHbGEgiNy7kgliktA5iGQwk6MmX0UpZ/gWybhhj70tuRtlZ7GATysIilTANh8tO6RIq6IggsIZkFaz0/f1wxW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883709; c=relaxed/simple;
	bh=+R4zqfvDXz1j1mAPPXaLdyah10qZozdlVhXba9egWSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VCMAiokeX8G9KUo+mdGqEEu+yyvwVP1RMfijU+NdXrEHKyAXwp7RRlbQJGPyWRNypJ8IfeTvIMxI50D5+m2eVPCBoNufCX8jXWhNlfD5uJIjfumkmTlg5nv/XGdkbGhWDjece5sNKZTbfsm0FImSHGmxJF3Re5M0TVyXqXqJq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=O4qArRQV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="O4qArRQV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dd10ae77d8so15326265ad.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2024 23:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1709883707; x=1710488507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejo1DP06QndXFhb2tUzQ47YbSnlncVEgbITYqnJDttA=;
        b=O4qArRQVKXOXDoBcxsEER5AcHI42yfUAV/7kSP86danE/4IpxAwvqzX9IgElbNCyBy
         M3ZnSCnEAJBWCIyhHTvHaVGVbOApJNlPt2l7DIJLan3zwoyQE4BaipdR1aHrzCmPkJU+
         SkJTM7Pi5qdYxZzHEOtuQuCkVAj47dAcxG5M+SR0qBesZ+sVBib4yLbkLpJI1VU5tdPt
         2s2Eqp9Q3tiKbQXZNoIm8lMlB5WyTE+ctnqJceoTrkC2GZnuzxbbSDsXLksBmEE5PosZ
         +455u7QUwhzVKJlAGK5OmIoKlnOernfED8YWH+zTTs4myNsdy6sH7DArHclF4FUvc1YU
         tQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883707; x=1710488507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejo1DP06QndXFhb2tUzQ47YbSnlncVEgbITYqnJDttA=;
        b=rMK7V2tKppnZiZGzjPdeX8M36uD0pRkoPLmF2k8t9Y77PcIeqIRfTE9iPokNJb5OmN
         kiCCBX7H04zkUtgf8soHTUV6hWdoxW3ZKq4evCCwZoIJeV9Z5AzNp/Evp4BLuwft51yZ
         +DO0fYbTOPIvp9VGJg05C5BewQyABkMsoioRPlCt76XGPuBf69bm7A3ADYOsSIIe4/wD
         ZVdEb6CSmMeV2ME5bW5PWNA/1FPXEwWv+Zns7KVSds9dBeyLeDBSBZS71HG9c1TbwXC3
         f2EwYifr9R+2qU0eDOUYbTtxvuqozyZ6r7z8DvYF6+2uhRYyx9idwZ3cEZrIBIxwiDAH
         fsrg==
X-Forwarded-Encrypted: i=1; AJvYcCWtlmOFH08bqsGTDR+D6carpK1T8m+1picRNLrbFVmilOf1Pwqflf/qfRNz6UUrBJJyTW3vDDo/6Xe0OffJytxXUvtkaP5zUR4J
X-Gm-Message-State: AOJu0YwsNN9A/rin5IYzsCs+YtQCv+rLtIKlJwTSOyuP2BAkx3341UC+
	5XdIrniME/Oo3XJMQ+moU1zAY2lWkXSCV/659BE5GEcDYyB6I95VWcKh4wBi9DE=
X-Google-Smtp-Source: AGHT+IFQT8WkRLqLnhKN8/bn4t8FlGl1LA5A6ykRCASv6ih9Yemptcezn6U+0vguV6V45SIqSFkZdQ==
X-Received: by 2002:a17:902:900c:b0:1dc:a397:f7a5 with SMTP id a12-20020a170902900c00b001dca397f7a5mr9993344plp.52.1709883706955;
        Thu, 07 Mar 2024 23:41:46 -0800 (PST)
Received: from seacloud.vm ([143.92.64.18])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902ce8600b001db45bae92dsm15769210plg.74.2024.03.07.23.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 23:41:46 -0800 (PST)
From: Haifeng Xu <haifeng.xu@shopee.com>
To: reinette.chatre@intel.com,
	james.morse@arm.com
Cc: fenghua.yu@intel.com,
	babu.moger@amd.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	peternewman@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Haifeng Xu <haifeng.xu@shopee.com>
Subject: [PATCH v5 0/2] x86/resctrl: Track llc_occupancy of RMIDs in limbo list
Date: Fri,  8 Mar 2024 15:41:30 +0800
Message-Id: <20240308074132.409107-1-haifeng.xu@shopee.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing a monitor group, its RMID may not be freed immediately
unless its llc_occupancy is less than the re-allocation threshold. If
turning up the threshold, the RMID can be reused. In order to know how
much the threshold should be, it's necessary to acquire the llc_occupancy.

The patch series provides a new tracepoint to track the llc_occupancy.

Changes since v1:
- Rename pseudo_lock_event.h instead of creating a new header file.
- Modify names used in the tracepoint.
- Update changelog.

Changes since v2:
- Fix typo and use the x86/resctrl subject prefix in the cover letter.
- Track both CLOSID and RMID in the tracepoint.
- Remove the details on how perf can be used in patch2's changelog.

Changes since v3:
- Put the tracepoint in the 'else' section of the if/else after
  resctrl_arch_rmid_read().
- Modify names used in the tracepoint.
- Document the properties of the tracepoint.

Changes since v4:
- Add Reviewed-by tags.
- Include more maintainers in the submission.

Haifeng Xu (2):
  x86/resctrl: Rename pseudo_lock_event.h to trace.h
  x86/resctrl: Add tracepoint for llc_occupancy tracking

 Documentation/arch/x86/resctrl.rst            |  8 +++++++
 arch/x86/kernel/cpu/resctrl/monitor.c         |  9 ++++++++
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  2 +-
 .../resctrl/{pseudo_lock_event.h => trace.h}  | 22 ++++++++++++++++---
 4 files changed, 37 insertions(+), 4 deletions(-)
 rename arch/x86/kernel/cpu/resctrl/{pseudo_lock_event.h => trace.h} (57%)

-- 
2.25.1

