Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECAD299A84
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784167857; cv=none; b=j10enSCHJD4EmVqmad52viZ+Papc8Vp9xbSTJnDSvvTm58d31u1XS/1g0vS4G8OEwM07DxNDiMnafhBXdnAtatSgh99VY9wbGEgDUZk2ZO3WiDamMftrMGpCbnXNQuA+gxU3qd8jMeboJMeCCARI4eSBcUMes/7Lningj12gPNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784167857; c=relaxed/simple;
	bh=wwrpGqLqvyrqGth1JUbqHasN9GZQS45amQgf5HGAGx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C77mcmSL2CKDw/b9EP0A/YN9sJzT8ZeH7LckIgiV6NzXYEQ23cJ68GXZAk4pCPF3qipjtOZXmH1aAvPaWq7+CeWurrftRIEuTwwtP7fuurZMlQ0C3RCaUSv4q4roBMV2FOhJlmHjo5mZJmSmYcAyBwFUiDoUWGCPToP+HPcqU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsD1dDXB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsD1dDXB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so73055945ad.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 19:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784167855; x=1784772655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsOuyRsRWjH5ILHRhE4aFvnjFlJrXD9DjGR1zGFHT54=;
        b=BsD1dDXB0JBubikBGvJNUoNkm3rM66dC4E1qzsIoHSyMal1gB67wCIeNxe4D/srYyR
         +VTEApgyvD2LD3/jR9+07AwS9wr4H26RHiwbZF+j8TivT3yYn4e8OdCEeJpAF3FCAP2t
         O7EQ3+1B6lQu3bw97dkBZvVx5BwiY4UgirolfG8Zs0PyiuroBXgagBX/DFvV2/Q4meDx
         LRldLqZhi74t4Goz5R+RZsf0c46LC8C+ChJjfs4dIsEZWLu2iL25CaNgeGlpb+xA4kof
         5cBFDhSD9y9eY1sSRLe52jRBsV8y36Y9PEVdrJTuFgOTMZMUmHr9ofm2CnRcy79Aq+GF
         lFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784167855; x=1784772655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsOuyRsRWjH5ILHRhE4aFvnjFlJrXD9DjGR1zGFHT54=;
        b=jOm14wLU7aNoDmLOW52zC4IhZbGOtPxiAOr9i7eVQEhldge8Rxc4Q65bjttcrm8Ej0
         ngPnlMY+cu20RI32c9cWD3cH+ua9ZKZTZ65cjVrHHIxYBWNE11JJ+WZxzoO6hTHj9CUo
         IgfYERV9Mz5maoax4wl8HhSgl7mHkAz7ahjYWhPu60082oM9IuPBd12VmtAoMgaGDD5B
         xuzaXkWlIJYYqy264V6xTMDocT2GmMasasNz6YWLdcX/RmTlj6AjS06pyJaY02mDsx5G
         74Oa52GhVAYuetdjJhm4WpQhfKZnnkgriS8xAxvo0s4SBnHJ8MDW8Ge4Y1BifXP0lOIR
         Rkqg==
X-Gm-Message-State: AOJu0YzxlukkMUaWua8Uf1II6umSN8VRgr3/ZBFSMr52KSWESe16nNBp
	7dZAYvoIPP1qvwtWK/6hOvBs7+dhcQ3xVHUWhkN6/d6xkGBxWuo57k0M
X-Gm-Gg: AfdE7cle85aqGNwWpWG5NBPPYUqeMrqxy33aFVDhZaDbBmmSL4fKkuO6rzYiymGqA+B
	p5iUgTpY2RWLwKz1Ulb5CeAz8p8/xme3FNv0ABoGP8jXw4auFk47pyhm8kUpsRZNvVJBPf0SOCv
	gUw6wUoL+eRS4ZCTujH6vhqOP+NbTGRTYv/MJyux9loVZXCOg/Z4xBbVgmnYX7OtFyOWvQmZVWN
	hlyo89yyxYKq0KRUj9sMXX4/weIRyQ0DFwgZWsRmtczr5mjoRGRFFfqVLVyxkxmAJOXL5cUhh6F
	7HOolQDuO5GtzJqBUIsaRa0QqQW8iT5fr2yqr1mrUm5ZtRE3vD9Uh+ZdInoC52xnQzPltcbFo4H
	BXWOI5wHAx5oRNmBFv4kSw69zjbg78RVrhpoa4Mvj8kj0EOCDWh92O1JuDqsWnxAfL32EjIFJ3R
	hdBH0jMyincE+WOySOt9LECIJW8WG6kMtY7QIXrfDmBnTGIQeOZ4dRi6v6y/L0NDOxVauLi5czn
	Vas3XYHA+PfVG23ehKWp8Pe/K5PBJDVshPCt/oC
X-Received: by 2002:a05:6a21:60c6:b0:3bf:6acf:2939 with SMTP id adf61e73a8af0-3c36c0e2701mr6233581637.6.1784167855295;
        Wed, 15 Jul 2026 19:10:55 -0700 (PDT)
Received: from parrot.bbrouter ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd429cee1sm6979209c88.6.2026.07.15.19.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:10:54 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: 
Date: Wed, 15 Jul 2026 23:10:08 -0300
Message-ID: <20260716021013.48025-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: [PATCH 0/4] doc: pt_BR: Add translations for process and guidelines

Hello,

This patch series adds the Brazilian Portuguese (pt_BR) translations for
several essential files regarding community standards, submit checklists, and
best development practices. 

Specifically, this series translates:
1. The submit-checklist guide.
2. The Code of Conduct interpretation document.
3. The core Contributor Covenant Code of Conduct.
4. The deprecated interfaces, attributes, and language features guide.

All files have been formatted to respect the 80-character line limit and
the main index.rst has been updated accordingly. The Sphinx documentation build 
(make htmldocs) compiles successfully with no warnings or errors related to 
these new files.

Thanks!

Daniel Pereira (4):
  docs: pt_BR: Translate submit-checklist to Portuguese
  docs: pt_BR: Translate code-of-conduct-interpretation to Portuguese
  docs: pt_BR: Translate Code of Conduct to Portuguese
  docs: pt_BR: Translate deprecated interfaces guide to Portuguese

 Documentation/translations/pt_BR/index.rst    |   5 +
 .../code-of-conduct-interpretation.rst        | 257 +++++++++++
 .../pt_BR/process/code-of-conduct.rst         |  88 ++++
 .../translations/pt_BR/process/deprecated.rst | 422 ++++++++++++++++++
 .../pt_BR/process/submit-checklist.rst        | 145 ++++++
 5 files changed, 917 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/code-of-conduct-interpretation.rst
 create mode 100644 Documentation/translations/pt_BR/process/code-of-conduct.rst
 create mode 100644 Documentation/translations/pt_BR/process/deprecated.rst
 create mode 100644 Documentation/translations/pt_BR/process/submit-checklist.rst

-- 
2.47.3

