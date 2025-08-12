Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88412F0694
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029734; cv=none; b=en0gTnQNn/iFGfNmgXIzXfCF3Xit5OhDd7lCkG+1H1NUYWJl3YObeDNghUHuY08NJBn9T/1L3n63qMp+X5hWMzZ13UASdu0dsZdp/ccx/qdrk+FOKWqWLsyt+nTkwbVdyzbm5yS+0diUlA/G8Cumo8QhmAf8VIqIg0bXCAeHXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029734; c=relaxed/simple;
	bh=/6wrBiHZoDySXBiNZWAnkDSHetXLjHa1RjPY4LPJ7gs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P/HaBOjfBk4ZEFQY9XX+QKUCfxbLsvmw5YlA4MTyyCZDRDQpJVI6GBxamw5WPC+D8cGGTfrDS8PQoecN6MPPPyQa4HP5S+ArIa/FjjrhcjsJ3YQe6GwvZs+MyERdobawPflTPtqDv2Fpc5nSHFrERTdXaSpWFZsU6ZMhKxM87mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2WwgpSH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2WwgpSH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bd9d723bfso5158592b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029731; x=1755634531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8fxYZ+iI4vioxjOd5nfalSbq4oqADYhi86soSGuwZU=;
        b=h2WwgpSH5TBXpZ0tpplJVnN4QHPQU9/uXx9mgefg3B8HFdoWzyP5S94hiV4mEQ6TvC
         35yF2apjxF6NEYsNR5L5dq8w8RkoJiN+fCQgdZpLY65jvghXTUzn+jiyF8e85BSdu/qi
         LJmB9yjz1XbubamjJVHOG+QgPTJKCn6rviI39QXmwd4IisCAZ+qGW4iwKm5/mKBd5JQd
         niNeEU4QGuUX3NIddJqX94vnW3ukzoVT9barbueGmIMqnOumvOKKRNfrZfmyFtRYBiRh
         d0uNajwSACi6lLRNYZZ1My6kNCa05/V2mRx9P4lmgug9s+u8lmz1YX3rZeAJHX2YnAyi
         RZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029731; x=1755634531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8fxYZ+iI4vioxjOd5nfalSbq4oqADYhi86soSGuwZU=;
        b=gxGFsJsujFXBBK3mdTdaNvFx2rVPPilZNi2i60jMzOYfzsFcPEOIT6DjCRBzHX/EKI
         tXsizlT6hK96eoRG4fU7pKoer+1NHwCCY19xqYmkFLsq8ytv9owtOnqhhy8k2/6Zi+/w
         EpcptkdNnK5T7dwGDxcb3FoIF1eg3cVrn+ozcpEqPwP+jY9cGHXX7xN9HTvg8ZCbtnj3
         jsaiUofz73wSRDTmQxYrAY/8Kw1S/KXnDw+/8lxwKSc0ZOx6R5lQ8VewUcudkKmOvnjU
         kFhg43WN+WFiKdLagKUJ8QFfup/ngwZzm2nuXo2x7S9N/a5seJdAJLhdgibvvJPc7RJL
         5UZg==
X-Gm-Message-State: AOJu0YzoSiQ0TVUGKPAX2pCtN30jEvXvbet5kp6zyQFe7pS4BbIbHDGh
	33M0TAJnkrHhpzcqknoGMmUINEzCglccGdFBBe1fXlCuQq2EQDp2QNAPiJu9K/ld+UE=
X-Gm-Gg: ASbGncuAk5E8sJI+XlaTt/oQ4VZMgSrjXM4DzE91dOQ/rLcgUnOo7KXpovaZD/Chc13
	wIhaPnifHLlpG+60Z9lfaOmeBhhRck0IwjuJ8dffWsmUa3Wahj9Tu9FbmnB2lYNkcqB5N6nesUv
	Q1Y4DgLjJBiuI3cWQ66nDgaJF4V+iPEE9At1LlwOJayXgPeYcJqK8+Vxm+vF1muQs5Bs8GTZ8At
	BObxSEKde6IObrhBCeZqc850NbQdJ5VC1Vbv3KoJPzLNTFWzSCWENwuZ0rcXM68IkBP6RiPQmgv
	XE2Mn7vTMjilmCpVt3+CPpkNQvXkA9UIOEPuLHA7BTLfA/8bpYis26Eniv9CdIZx9Zykyzg77J4
	CqOmZOF9rXzZpP6b6YC5wB3Y11Z8banw=
X-Google-Smtp-Source: AGHT+IHAJYrDKGOQS863t+gW8IOB7hcD3SOjRzQ59UOorndQDXfv6kC7FAgnpDEdtxjzwqxFQ0i7TA==
X-Received: by 2002:a05:6a00:3cc7:b0:76c:3751:dfbe with SMTP id d2e1a72fcca58-76e20fc51a5mr770241b3a.24.1755029731367;
        Tue, 12 Aug 2025 13:15:31 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f48fsm30198046b3a.40.2025.08.12.13.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:15:30 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH v2 0/9] docs: fix spelling mistakes across multiple directories
Date: Wed, 13 Aug 2025 01:45:14 +0530
Message-Id: <20250812201523.69221-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Used codespell to detect spelling mistakes across multiple directories
and fixed various simple typos found after manually filtering out the
abbreviations, names, and non-english words.

These changes were split by subsystem as requested during review of v1.

---

Specific changes:

> deivces -> devices
> substracting -> subtracting

in `Documentation/ABI/testing/sysfs-fs-f2fs`

> conventioanl -> conventional
> directoy -> directory

in `Documentation/admin-guide/blockdev/zoned_loop.rst`

> Availablity -> Availability

in `Documentation/admin-guide/cgroup-v2.rst`

> flushs -> flushes
> explicitely -> explicitly

in `Documentation/admin-guide/device-mapper/delay.rst`

> approriate -> appropriate

in `Documentation/admin-guide/device-mapper/vdo-design.rst`

> aproximate -> approximate

in `Documentation/admin-guide/laptops/alienware-wmi.rst`

> directores -> directories

in `Documentation/admin-guide/mm/damon/usage.rst`

> multipled -> multiplied

in `Documentation/mm/damon/design.rst`.

> entension -> extension

in `Documentation/arch/loongarch/irq-chip-model.rst`

> userpace -> userspace

in `Documentation/admin-guide/tainted-kernels.rst`

> whoes -> whose

in `Documentation/core-api/symbol-namespaces.rst`

---

Changes since v1:
 - Split into multiple patches per subsystem
 - Adjusted heading underline lengths where necessary to avoid build warnings

---

Soham Metha (9):
  docs: f2fs: fixed spelling mistakes in documentation
  docs: zoned_loop: fixed spelling mistakes in documentation
  docs: cgroup: fixed spelling mistakes in documentation
  docs: device-mapper: fixed spelling mistakes in documentation
  docs: alienware-wmi: fixed spelling mistake in admin guide
  docs: damon: fixed spelling mistakes in documentation
  docs: loongarch: fixed spelling mistake in documentation
  docs: admin-guide: tainted-kernels: fixed spelling mistake in
    documentation
  docs: symbol-namespaces: fixed spelling mistake in documentation

 Documentation/ABI/testing/sysfs-fs-f2fs                | 6 +++---
 Documentation/admin-guide/blockdev/zoned_loop.rst      | 4 ++--
 Documentation/admin-guide/cgroup-v2.rst                | 4 ++--
 Documentation/admin-guide/device-mapper/delay.rst      | 8 ++++----
 Documentation/admin-guide/device-mapper/vdo-design.rst | 2 +-
 Documentation/admin-guide/laptops/alienware-wmi.rst    | 2 +-
 Documentation/admin-guide/mm/damon/usage.rst           | 2 +-
 Documentation/admin-guide/tainted-kernels.rst          | 2 +-
 Documentation/arch/loongarch/irq-chip-model.rst        | 2 +-
 Documentation/core-api/symbol-namespaces.rst           | 2 +-
 Documentation/mm/damon/design.rst                      | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.34.1

