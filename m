Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFA36D4F1
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 01:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993429; cv=none; b=NSySUleUuBjhI7W52bHlNA1ELrL1/YsoQvpCpj8MffKOouA9YmqSXHdTyf7TrwCXpSShdXeWH47B+NjyXS3+gz74k4vXBU/KBFdxHbMNezYPia4aWttDQcmdueGwEDg+xMGtusQgUHo6iQkhkDVxJrTTXV54SQMULARDac7hpI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993429; c=relaxed/simple;
	bh=dKZHmZi+xVQS5CbSi+LMf6D5ukNa65oK0aZqGSLgxrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlVOjm2f3zQbp4damHmlztVV3SgiZQy2+nX407q/fu8C9b0uTTv3n6wqFNDmt9f0xE8QmAymRFVNxLDq5t7YVhiGxtxD0jTtnmSF/au2B5R18JEZIpLmht/6RyysXdbtBwQH9A6I+2W0glJOTWU7Mlu7dIQeBlnpQsnRXY6PrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luRz8Es4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luRz8Es4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1676765a91.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 18:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783993424; x=1784598224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCQhDpUBQaP5eNAOavkcbS3PiRS94B5qHHxRvZHqb+U=;
        b=luRz8Es4fOKbrp/4HFzYfKSnxm53ZrBxqtDxxKYmYtXXRQywvuJbL9cXxvcQKgrTFH
         KtX/NF8TY8cQjqfs//DzIfNU4XDfHIm4XGxd6PfDLfOkGJbsw2CFfbypHwkC6gmS3Xv6
         D64JsDeP9EtFZD9/ev87S1a7oCFyPOX/f4X8CHe9Usfo2MGNxoInQTXvpHlB1ZUsvOwS
         rcVmGXlwl2+iDuKEzYa9MJlg5xqWQErU3aKfg+62YBsqMw8Va19hdKRwA9+9n3y3RfTg
         0OWer+IiKB8n7b8PH9JVRBX6ee9XpvU5HpXV9VBhsW8B0aA+nGbeH/Q7ij4YMeV+JuXX
         5G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783993424; x=1784598224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCQhDpUBQaP5eNAOavkcbS3PiRS94B5qHHxRvZHqb+U=;
        b=I4w5NXHbWwF4ysNdNE1vGnT1XYsLfKLhhxnZk6B+uIm9PzisBsu4coV5ps3VODh+hw
         jGgeVwZf8HqPfvrzf2SKuBR6w5BNC2DZoWHmFoDF4FSvuuBBGY8HW59x7OoU0yHp+DbP
         ufi9eZUfMQvsSLORRbBH9Hl89gRg67nnEfAFrRpfbvxUGGAQkE0RL2jkQuIxgLR+CaeW
         LSgOP/dHYJBzHDGj2pCX/7lFxMRza8PdwsQUtSOiqtRuODH32saui+U1EgchP27g2CER
         rwWwpWTttbPG2rpX5sfN/nx1AUL7BD4/7JCFcK+KnuZakSMaqz6uaUVi7yRilw+O7LHe
         9TpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFh9OgQJWnQWDW6qLniBCONwJ1kVZGVV9yMF+MpIDxGAxR2P+2k+iYC2sUZ9zhE+5rbtKK0gIcAiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHbWFk0vDPy5MhMHunKfoJqTAJ74EL1Izp8jk6ULXFY+HDdKMA
	AAqmZwuXRQ7YFaEe8lj7ayUWlgJK7xq9YQoQ3P1C4O8mxH2vsDHPBKx2
X-Gm-Gg: AfdE7ckqp+khjZL1u+LJ4h1ICFWzUWgRjoG4FonutJ6ANyq1uZZwsMUGmufL48M0Bfl
	jXVSNRioGgE0vW0rUIJb0axb15QX+0h+ypvjmorR0j2m2QZebP2IdvLeLWcw4TeTtDuioobCcR+
	FbaknhUk6NH69AaKxIrFa1q0+n6TvtC9E3D4u2udBrlrInZpcnFXJtZzKSU5QkB73oPc4ZSDYjP
	WjsRMm7FEhOScHbxBuXPWBSUzFKmNLSIA1YFk5o6mR3wWywt71bV8G+3e4GBhot3GpCVvZM16Pg
	6bZVMA2K8IMV39vW6ZY/SNg8nVxTISbSj/Rd84GUOXSlTi9HYGiTo5NTNpLUi/tphnuKEW3+SBK
	Ln2BrE13PiaQw6T4On4VE8rLtS9GdtDO+Ni3cTZtlj+QQOBnAQ7Bk7/5rYzUYoMmQ0ULI+U1di4
	npgqdM0eowFg==
X-Received: by 2002:a05:6a21:730c:b0:3c0:9c19:65b7 with SMTP id adf61e73a8af0-3c110a207ebmr13095048637.63.1783993424197;
        Mon, 13 Jul 2026 18:43:44 -0700 (PDT)
Received: from sleipnir ([2804:d45:3612:3b00:32a3:79f0:cdff:a04a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm59675775c88.1.2026.07.13.18.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:43:43 -0700 (PDT)
From: Lincoln Wallace <locnnil0@gmail.com>
To: paul@paul-moore.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	penguin-kernel@I-love.SAKURA.ne.jp,
	rdunlap@infradead.org,
	Lincoln Wallace <locnnil0@gmail.com>
Subject: [PATCH 0/2] doc: LSM: update usage document for current LSM stacking
Date: Mon, 13 Jul 2026 22:38:30 -0300
Message-ID: <20260714013832.977443-1-locnnil0@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LSM usage document (Documentation/admin-guide/LSM/index.rst) has
not kept up with the LSM stacking infrastructure. It still describes
CONFIG_DEFAULT_SECURITY, which no longer exists, and its description
of the module ordering in /sys/kernel/security/lsm does not match
what the framework actually does.

Patch 1 updates the selection mechanism description to CONFIG_LSM and
the "lsm=" parameter, keeping "security=" documented as the deprecated
legacy option. This revisits an earlier attempt by Randy Dunlap [1]
that was rejected for treating the two parameters as equivalent; the
new text keeps them distinct.

Patch 2 fixes the ordering description: lockdown precedes capability
when CONFIG_SECURITY_LOCKDOWN_LSM_EARLY is enabled, the integrity
modules are always placed at the end of the list, and the remaining
modules follow the order given by CONFIG_LSM or "lsm=".

[1] https://lore.kernel.org/r/20250114225156.10458-1-rdunlap@infradead.org

Lincoln Wallace (2):
  doc: LSM: describe CONFIG_LSM and lsm= as the selection mechanism
  doc: LSM: fix module ordering description for /sys/kernel/security/lsm

 Documentation/admin-guide/LSM/index.rst | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

-- 
2.53.0

