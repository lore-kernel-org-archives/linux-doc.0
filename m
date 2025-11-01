Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574472D3A72
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990488; cv=none; b=Z/SWZnwUNUti2G80CiyK6EwZ+ZAt+NF9I3ykWDsG2TaO2RBERkzzOuL5wQ/xBgNgFaHjYK+aWg1jUbYRifxvS9P/laXIyUXJ7G8FOIp0Neypx/lB1flg7bbTXPDqw1IlVaYswYQ5IOx9RaWQvJuJ2Y7TciIjwXS21j/NkT7J/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990488; c=relaxed/simple;
	bh=3OG2wiKH22RCfvC+iceoRBKIWpDNYuCgxZ/0fv2vRj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qj8MNe+sd06a87KCT/r+vn+/Rl0r5eofvsKwRLQN2ACucGC1OchyFwCH0/doCve6n3BF4eNcaWipbGO3GuwluCTKHkoRKnxXr3LMO/dK1bafNN1R75LRyKf9WGnRS35ZQIz7DYNjUuTTRBoae5PxmRD1cBG+o7lJbzFOtve3hrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLcbzdl9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLcbzdl9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso3062433b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761990483; x=1762595283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WH5O/8nAx5rVFTEi7/lXcZZ45r+c3Q9ZyuJj8snlwgs=;
        b=nLcbzdl9dR0X3krcX6dwvdW2QSYs+p3GtfBlu3l2dEIINpLVz700FoeUkEvGq/kuiM
         mk6ObxRygf8sG5V1QlH6k4Mcyvz1+hqXbgoHbLL4iSUDAsJBd3NezgbCsDNRfCO6vUam
         1gHzIn8UzOm80YSQ2UudACKO0iPJL0qltaCF35gEgjPA66GkaAwnF090QE3HHc4Owide
         rhNUk0bgSFS4z5qXDpLw4pfbqO8zWLbrTY+tZQcMttGe/jyLRHd6wHn35gMD7BsGnaXY
         hx9lfmc3PXqDRYEMexP11+x7I75c8HWOUAxYihyjjhEjoH65atsT2Ncpb+Gyhn8a9zmZ
         bhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761990483; x=1762595283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WH5O/8nAx5rVFTEi7/lXcZZ45r+c3Q9ZyuJj8snlwgs=;
        b=pQnjnLGR4D0AK0wCoTp9YEszLFRZ4LkcmM6yAb04hFzafv7CkVHCG8LlYl1mpbYCyG
         K97piX3+VExuni6BHWDadalssED7CzoaoSKPhafMpJzXyb0wKm4WYuxKZfws6Hb7OKE6
         MoZW6QUxURLogmvraxOiAvp1wWlU7WKjyvOoTq0UHHBHTuIpiTA4vYQCBZTBfo0i42jn
         LEwT9A5TZu2VKyvAWatjpdpFxhwrUF+bBrr6FDwXhy22IsFJ6kuSULEnOMuC/gDi+gV1
         8su1EEm8Mwe+DUXTaeVNCnU6UUMWPBdpYo4XGagNtPt3w0rhWtTkIsPy2yrMIpLlhIWb
         Yylg==
X-Forwarded-Encrypted: i=1; AJvYcCXLifs2Zi5+C6NYiFBG3gccqqdM8FnYeos6EYkuIJFyLsx884MAfCgwGyhjXGcNoxvKp5n7oQKzGcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfKsOVdQiPIJ6Be3KNLdWKqAwv4x0OvqOBnivqpgLLvkWsfSk
	eG+w8HE1fiH8DN540246qnWSu9pkoofkORYznXyl/ixlL4SXF4eH2IDR
X-Gm-Gg: ASbGncsKpKD9ICIakR5CrWYYq45u7E1AyX2fmZNq6uYdK0FNbXLxURzKGj4U98yQ0F3
	7d/HGViRVK/s44lAHXjljxlBe3qSyNTQ1Cb3fJDz6gbtlhCsUXtVo1nRAk+YAbvcJhelxZvdAN0
	pPCpP+Lq6c/e1Q5gjutV+kpaU68Yv0P+e0hCLVFCjQl8Pc4a/mG+h7HB1jLV+NRkVQxM7+GjF9V
	w9Q5Nh8BuNP+sLnJMqr+gO11E1bs9NmYXbMvBJ3fLzcKBT50hB23QekCG+Ar7piXczv5uU0CLoL
	c0TOWbiamIBgwct4q5X+3SIRXnzqbcKRuqrj17Hqa7eez7g/ROhd/dGO9v+SeK+HJ874XJ9B4zI
	RxkOcAR8/TVNVqB0ojbigr2KurPPd+Wl1HRZd3kIGbWn7fg79cKr1BfSLguDUWshIaZdcFH2szz
	7U
X-Google-Smtp-Source: AGHT+IFkkEhMNFBtz799ZVmYFsXMsu0ozafr7JzI6vs8a+fPrI8GNOdanKuJbIbpaRMf1whMNOYWqw==
X-Received: by 2002:aa7:8883:0:b0:7a2:70f5:c83f with SMTP id d2e1a72fcca58-7a77747a497mr7159153b3a.10.1761990483399;
        Sat, 01 Nov 2025 02:48:03 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d72733sm4804521b3a.21.2025.11.01.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:48:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5228C4209E50; Sat, 01 Nov 2025 16:47:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next v2 0/8] xfrm docs update
Date: Sat,  1 Nov 2025 16:47:36 +0700
Message-ID: <20251101094744.46932-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=bagasdotme@gmail.com; h=from:subject; bh=3OG2wiKH22RCfvC+iceoRBKIWpDNYuCgxZ/0fv2vRj4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJms1zJm651g7L3+4YxH5x0enzdfmeoZHySvdDr6TVHpz yZ3ETmXjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEyk8jQjw9QJLtFbJZYwFVpE udzYf1lR8dq8NYLW9cc3buHV4OUT9mBkuKZv0dzqV/Ji39eN699+4thtcO6Q6M1FJ1+U6PzQnLj ajBEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are xfrm documentation patches. Patches [1-6/8] are formatting polishing;
[7/8] groups the docs and [8/8] adds MAINTAINERS entries for them.

Enjoy!

Changes since v1 [1]:

  - Also polish xfrm_sync section headings (Randy)
  - Apply review trailers (Randy)

[1]: https://lore.kernel.org/lkml/20251029082615.39518-1-bagasdotme@gmail.com/

Bagas Sanjaya (8):
  Documentation: xfrm_device: Wrap iproute2 snippets in literal code
    block
  Documentation: xfrm_device: Use numbered list for offloading steps
  Documentation: xfrm_device: Separate hardware offload sublists
  Documentation: xfrm_sync: Properly reindent list text
  Documentation: xfrm_sync: Trim excess section heading characters
  Documentation: xfrm_sync: Number the fifth section
  net: Move XFRM documentation into its own subdirectory
  MAINTAINERS: Add entry for XFRM documentation

 Documentation/networking/index.rst            |  5 +-
 Documentation/networking/xfrm/index.rst       | 13 +++
 .../networking/{ => xfrm}/xfrm_device.rst     | 20 ++--
 .../networking/{ => xfrm}/xfrm_proc.rst       |  0
 .../networking/{ => xfrm}/xfrm_sync.rst       | 97 ++++++++++---------
 .../networking/{ => xfrm}/xfrm_sysctl.rst     |  0
 MAINTAINERS                                   |  1 +
 7 files changed, 77 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/networking/xfrm/index.rst
 rename Documentation/networking/{ => xfrm}/xfrm_device.rst (95%)
 rename Documentation/networking/{ => xfrm}/xfrm_proc.rst (100%)
 rename Documentation/networking/{ => xfrm}/xfrm_sync.rst (64%)
 rename Documentation/networking/{ => xfrm}/xfrm_sysctl.rst (100%)


base-commit: 01cc760632b875c4ad0d8fec0b0c01896b8a36d4
-- 
An old man doll... just what I always wanted! - Clara

