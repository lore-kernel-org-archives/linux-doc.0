Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD03590CA
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073480; cv=none; b=ZT5KcSGfnqPs2cgZK6TVxa98UyvmgAgbYMg+IK7+TWdzUtkRTRFnEO3HkWZM+9KpDs1mqToKjj2149rULm0kJziK0r61R8aoWCYiVpliCNwK6DW3pME1w7sRB5FAebbGnAZ8aPAphF5dQFzXHoDSPoUJ7qTf92IqoWPtydZp4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073480; c=relaxed/simple;
	bh=VzEaVcASMsFMqv1AuDj8UetVCxiGUolN+IBtp1q2Rzw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uYwvVtdhjgb3WZbW1unay0jXJBCS5YwBhmFXKoAfB5OgUUb56lMi2C6Z+jIB6wcfGbMenSmwNnmwUclmgl5Rigk8TqjZwuBhOck87xey33IKp6GRYI8MnvCnjMZNNoLVQ6vGQZpccbwBFjJDCb8h1+hWdInutxpdgp7nR5t7Fa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Y/eneUwN; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Y/eneUwN"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-642fcb38f35so622744d50.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766073477; x=1766678277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2oiypo8dpeBkdndpT2cWTlc28Jh3eCPkCjXq1HsH22A=;
        b=Y/eneUwNH/wn1rXSumY0doBTfcwQkJkmW8XmeglpBki8x9NTimpHEK6uwXcL19HXlM
         DUTi+prVShCQ1cnRGLQD3PDLzJdMR/qWQKPIWksqTG0CrffVv6eKwIrMQ7nCCAqqEeBf
         HRDK2Ncx3ctZuMLWURA4/sK8TDZ+nAYw6pbbeoyTRxYssQoDa4xTXTphV3bTdC6DAHKm
         qDF6TP/6JfbECxDhIENXs9oA/jUYXcPoNZ2uJoUTXPEl3lxcdArUyFQICxIqmXm+LV1W
         DM4OQI3wVWCZvQQm9p2oWzK19HkmQHTCriLT5oJb95QXtMT13k8mmP9ykbisgOvO6apQ
         Hqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073477; x=1766678277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oiypo8dpeBkdndpT2cWTlc28Jh3eCPkCjXq1HsH22A=;
        b=f1U3qs+YmnZOEvUeFKB5xyC1SBY0W0pUt2Oc2rgLMfeqhORWzZzodkLxvu4nIgKBE/
         YyvmLcYp6ofqoboBAGz66ujoRgtV1FOKeXmIHpAfa0pSr9G/7lLuG98AUT6HQ4nkAb5a
         nXOy4/TwYXqyFugy2KhVr7ncdbGZMz2eBpeXV1gfMrB83UPbTZ1GTcihv8I/lUpKBXDO
         OJcjAHbtwDS37b19bPaOcMVptb8GaRQs7uJaUm3djwt4dLO6SnddyWhDPo0XKPa/X6Ym
         IkslEAtJYV9Y+NKferQtMJaT7WF1f4X7BAwps79CLsfF6ZTSirOxy0fBuqnQtp0UAHFc
         TfdA==
X-Forwarded-Encrypted: i=1; AJvYcCWzsWr0/J3n9P0vjtddGZdZt3Am3bCITpZKvsHmGOwGbNK6hs0qbp8/1Lm9zxDH2JG8pKAC1t/0744=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMHCfHpSdElEDSou1dYZQZxSlECO7GSKtaLNM7gY0NdOtWZNBX
	BL9CmZSBzKKCdHAH3L+P6RZlmgtQ7b/0G1f6XSLCFOrc99m55AenzId01hysdL22CdM=
X-Gm-Gg: AY/fxX5W8z9KOJK21sgUtB21SEUF+gpeBpDLvlWpp4luTHHtA0AcXeLdYL2xcgVh0PF
	IkIIU7Pvd3mKRg/eiM8g6mxTlU5z9dEwQfv7QvjgBTwBmXJiVcC0eIr5LD1Y56Q2FH2I4WIyhan
	+hKtz5PdM7NsbDSyhIIvOvYzLKSOvhVXVa3QeW2BDh98feR/keFXiO97Qd7u/JqAnQgZePX8+oG
	hQqnD3QnRym0ukNvA9nbBbQEzazu0mKsqRuY3fu46KoT/pny6rB3C7mmyqVn7rzxO3H70AdOp8i
	dnrfEQNsbN0c8cGOYLpv1+H6sy+/B4tL7c+B6Od4sZu1j2Y4ljKRcOdgB9sPvlL96JLvWY1jPjB
	ejHoJfDP0v+jnn9VFnR8ICQQVqHWt8NAtPXQefoIfJ9jN4ZpxrOfsLhkJ81gfo7FqpXsJXcWHtE
	JmOh1XCvx9+23xyPEIXTHYcDjam1IFnjdEPhwDEBsQWRLufLWc2HOTwtaJmmfhV7KdBKQcWU90M
	aFR9w+mR00CKZlvcBqKnmPp1L/v+ckyMznsag==
X-Google-Smtp-Source: AGHT+IFaXYKuK/o0seYGysCGZslKaAXs8Fo4Uc83ADSlGAU0k2LMTIhpIrTp2Em3aaNMRjw8OZtwJw==
X-Received: by 2002:a05:690e:1384:b0:645:561a:4c68 with SMTP id 956f58d0204a3-645561a6017mr15590217d50.66.1766073477343;
        Thu, 18 Dec 2025 07:57:57 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa6f52bb2sm9348467b3.16.2025.12.18.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:57:56 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	skhawaja@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	tamird@gmail.com,
	raemoar63@gmail.com,
	graf@amazon.com
Subject: [PATCH v2 0/5] list private v2 & luo flb v9
Date: Thu, 18 Dec 2025 10:57:47 -0500
Message-ID: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.313.g674ac2bdf7-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series includes two separate workstreams. This is because FLB
should be applied on top of list_private, as it uses some of its
interfaces.

1. List private v2 (first 3 patches) Previous version:
https://lore.kernel.org/all/20251126185725.4164769-1-pasha.tatashin@soleen.com
For details, please read the cover letter from the previous submission.

v2 Changelog:
- Added a Reviewed-by from David Gow.

2. LUO FLB v9 (last 2 patches) Previous version:
https://lore.kernel.org/all/20251125225006.3722394-2-pasha.tatashin@soleen.com

v9 Changelog:
- Addressed suggestions from David Matlack and Pratyush Yadav: added
  booleans to track if an object was retrieved and/or finished.
- Modified the patches to use the list_private interfaces.

Pasha Tatashin (5):
  list: add primitives for private list manipulations
  list: add kunit test for private list primitives
  liveupdate: luo_file: Use private list
  liveupdate: luo_flb: Introduce File-Lifecycle-Bound global state
  tests/liveupdate: Add in-kernel liveupdate test

 Documentation/core-api/list.rst       |   9 +
 Documentation/core-api/liveupdate.rst |  11 +
 MAINTAINERS                           |   1 +
 include/linux/kho/abi/luo.h           |  81 ++++
 include/linux/list_private.h          | 256 ++++++++++
 include/linux/liveupdate.h            | 147 ++++++
 kernel/liveupdate/Makefile            |   1 +
 kernel/liveupdate/luo_core.c          |   7 +-
 kernel/liveupdate/luo_file.c          |  39 +-
 kernel/liveupdate/luo_flb.c           | 654 ++++++++++++++++++++++++++
 kernel/liveupdate/luo_internal.h      |  22 +-
 lib/Kconfig.debug                     |  37 ++
 lib/tests/Makefile                    |   2 +
 lib/tests/list-private-test.c         |  76 +++
 lib/tests/liveupdate.c                | 158 +++++++
 15 files changed, 1487 insertions(+), 14 deletions(-)
 create mode 100644 include/linux/list_private.h
 create mode 100644 kernel/liveupdate/luo_flb.c
 create mode 100644 lib/tests/list-private-test.c
 create mode 100644 lib/tests/liveupdate.c


base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.52.0.313.g674ac2bdf7-goog

