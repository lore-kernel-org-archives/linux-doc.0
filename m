Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2624409
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733764993; cv=none; b=I7MGdVW818YyYdo3MZVXuCwJL/NYbYd3KHqtgLucxfq4gGLhjmcCxBSvAnO+pnRu1A2wop9CXDtFQA8aZhqcKfs/XMmBRY0cqa2x8VsA0XhA346sQTM17KhbJtAJUXvkXK72qCR2z18pBhWc9P7H78USA99od+mNIoXJgFf8z1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733764993; c=relaxed/simple;
	bh=6WuUUwH3gHhkqL6Geg5HTcFT90fV2BNuVfb02BCAuMU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bqOqDL0PbQ0ERF/Z6AZUNxWY84jox2B6HfuwGZmyGxOCaCO6l0vcOstoF0N5kpwH1ee9BJzWBNpPMEcTZ0GZTy+Z408r1ktj77zE7kCUusyBW7lBc4eKlAV9q05zjhpmBqcrtMbK50LqpVXIv+H7FUjMPQIJ5h49GfLjJXI9+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VIi/dOMg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VIi/dOMg"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efc4196ca0so783104a91.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 09:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733764990; x=1734369790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vcu7R+0hVbbFouwgTRPW+Y/QQCHn4WyI0pgnS95JVB4=;
        b=VIi/dOMggdouhd7pSoAH5rVjV2sIeBUP2niuZUI6fqERAK6cT2sA153eE3+YHneIdY
         VIU24VyxVzNq/zipsfMYNIZMm7VOFk5kySBsbZi1eF4Rwz6O2Njm9NL51iZIiPw6RxXR
         j8V1KPaiJWUOdgeq68/PAgem9g+MZrDIpue0ctdx4jlbFAJzaFCr3SH4WkCFrMGbL1rM
         Aacpsp2EbnySCueoABjn6Qmn2OpkXTrV4sUItjI1Ap8li5eXrzKPoNwTFHSPloUYuncT
         yk7/beYLGG/3JFx4zygwTppxlB9H5ocnkq4u88TmgZT+SkAPwL/uu6BMHuIwnLANAkFW
         Fogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733764990; x=1734369790;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vcu7R+0hVbbFouwgTRPW+Y/QQCHn4WyI0pgnS95JVB4=;
        b=QMY83vN1rTImbR3VDmKX43hNXlJEckXqI2I0GNOQdyFZRvQQbyf/q7t9mt4VMSBqsY
         VpFUpGjiGvM+txStloQ3pll2O+iBK8s3OlW/tOZVu7U+SfpSMz0mtelpCKwdip+PIYPx
         ZzCZ8uypbNk05hTSPTC51sz2K5fOfQSj2fC+qn8gXMnzoczrjYwM3YhdfEKi06KE51E6
         YVJy8k8/QCKH7oyHbcHcn3RXgomhiwjjAZth+4FRgkHImRmmqDUEI25FUmfkOB5DmP6U
         oAVafjjv+BLJUcVDiljJJnFbgGgpG/E/d5515SlB9n+UL8vvSWn7Z2j1u4D/lgSLIG0j
         It9g==
X-Forwarded-Encrypted: i=1; AJvYcCW4Bx0yCQzirqn8Nf0dQdvo2a+tcRBQijqZqwgnMUkh2HrhmJGX5R5t0EYkHKVfiO87E5Ou1YoYEB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnRvp0tbwXGXMSh7VFs1USqwrKJqhe4wYmTAN/SfsUZibADuD7
	K6bdGR8WjmmHqghSXbu3dE3z2lXoC4YGRcfQCJXRCLWYxcu2Gyp9afdHodvqLgFLSo6FdQ1l3I6
	obHAT21HI0qM2BbMp/+mhbA==
X-Google-Smtp-Source: AGHT+IHwFdgtaA5CQfgLnW5VETq5BsceGrsp8a1IVqplrBkmkNvV7iaPoDLphNxXb40d3+EXo1QIWhIXC3RmqoXH/w==
X-Received: from pjb16.prod.google.com ([2002:a17:90b:2f10:b0:2e5:8726:a956])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:380c:b0:2ee:4b8f:a5ac with SMTP id 98e67ed59e1d1-2ef6aad12b5mr17501893a91.26.1733764990550;
 Mon, 09 Dec 2024 09:23:10 -0800 (PST)
Date: Mon,  9 Dec 2024 17:23:03 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241209172308.1212819-1-almasrymina@google.com>
Subject: [PATCH net-next v3 0/5] devmem TCP fixes
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Couple unrelated devmem TCP fixes bundled in a series for some
convenience.

- fix naming and provide page_pool_alloc_netmem for fragged
netmem.

- fix issues with dma-buf dma addresses being potentially
passed to dma_sync_for_* helpers.

---

v3:
- Add documentation patch for memory providers. (Jakub)
- Drop netmem_prefetch helper (Jakub)

v2:
- Fork off the syzbot fixes to net tree, resubmit the rest here.


Mina Almasry (4):
  net: page_pool: rename page_pool_alloc_netmem to *_netmems
  net: page_pool: create page_pool_alloc_netmem
  page_pool: disable sync for cpu for dmabuf memory provider
  net: Document memory provider driver support

Samiullah Khawaja (1):
  page_pool: Set `dma_sync` to false for devmem memory provider

 Documentation/networking/index.rst           |  1 +
 Documentation/networking/memory-provider.rst | 52 ++++++++++++++++++++
 include/net/page_pool/helpers.h              | 50 +++++++++++++------
 include/net/page_pool/types.h                |  2 +-
 net/core/devmem.c                            |  9 ++--
 net/core/page_pool.c                         | 11 +++--
 6 files changed, 100 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/networking/memory-provider.rst

-- 
2.47.0.338.g60cca15819-goog

