Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA6E254B18
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537905; cv=none; b=BH7yp792F/dcamxtjzlI8tT/3iLbcHPCg4AoKgwioXEzMAW0ZC+Qi9nb2nNgABk+kjpH5OmkKDp+tX6x4QbL41fHa8m/alGLrXS8jwoMnRjq64QquT8cTCpot1nGYj5wpbuX1q8Bucdg2fy4St3z3pMwZE6vKrev+evIWARQQfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537905; c=relaxed/simple;
	bh=CXI0qMvWqpeePDr4xBG9e2uqemr9IpjeVUqDleKN93I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sem86c/E0xWlZqn9X/1Zx9dCos3uaNEmbuWOEzjA/45N12+OPTrUy/nll9n6+zeDoGZMDmP6UBCRkdB+aMpz3VuawhvpRYdYgrTS77PVF+OdCPFu0mZygnwX/6AoFHWpSH2nyyqWp2UtbJQzhRtDhfMgrcAC4VoR/9YUNhUxYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/PmxhGW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/PmxhGW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-271d1305ad7so104080785ad.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537903; x=1761142703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOprrquoKlbkEreJojZ4KykFg8G0TswcVk79ghRz+Tk=;
        b=B/PmxhGW4USjX2YXd4ZukIPoqXuA90fULSmrq5rxT67yJShl4XIqibhEUVtGPwhFzO
         LN+xQ7/xaXSQZpakOu7fsyY2WVywH57LwnVqGH1l3Xg1AlYjmTI+hpO0xxxkEPSCS5dP
         hbiuSkNdc88c/KTt7abdO5MNcO/ahcESDoEOfRzkbRmGYXquGsyVVaVTVZaASZ+D8FTw
         qfwa0Z2+SoYpr6q8x0f3d+cVTS4q91SzPXC0I8tbIiSWiocp/laTNC7gUrW94UxwMqib
         /Uai3NzxDARFGDsp9J4CzvLvNP5De+rlVmeEfUWyuGtB98kdh2YF9PeL0QrJH3O/YLXm
         nQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537903; x=1761142703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOprrquoKlbkEreJojZ4KykFg8G0TswcVk79ghRz+Tk=;
        b=R/lEPw+zfh3uU0xymVWhwb2A2sWBaSqDkCssd7+h/IBIqFzDnRaAqd6StPGS4LW/iq
         VAQb5ZoH1wDoYTUj7QWZYKqJNZsTM5UuzCup6Lhd1Vg2XLy6MB/ZR6z4PiUBGNQwMBG3
         sK3ZFuvLxncZuCMBoZrvxZ0sWSt1SojsfFt3Gj+rqQ1OJw0j0e6n2n5LH0JF4AenWCx5
         mOPo+MejMDB/YvMrwJanipe0Jh299scEVz74/UuMVyE4TmIIMq4iW6kVLltrze6HC8Qx
         7lxZvNXf2S2Klrwj+n8AQFrL7GpskiEgRxntbaQkMl5vWLAdmYuL+6Md9DyH5z/oVvGw
         3Efg==
X-Forwarded-Encrypted: i=1; AJvYcCV5wOiViCoCg8cjvzWRGixgao1Jxc8N/yD4BCq499y1D/nf3AXQ4VM0OlpXEcq9ZqFN0sHaKWOeSTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGtA2egL0QL07c0fBl2tq8Sk2LUokSdQVvRvCrjHxhWNi9Q79
	B1wsX9V2mCQ403Tmt5cdhKhNcX0RGVYCaCbP+3uVny4A72bUSZ89Vi1Q
X-Gm-Gg: ASbGncuX1yKShCJ3Hti/hvPatjsX2GcfdhSWjvvEnkRsevWtBaO5dH8Qf9OBOYUDdWx
	AgeweW8zMsmPxL85deygVZ2IO8L+bY95TfnksE/X/SCJInP3lz1VJo1HQxZoua53Yb/xy/gE3Ba
	Q3y/soN4+l4jeAVlepsJoeNg9p4jj0/6eizCjtegjprPD9dwrxxmmdr+PKyELyGusNlRBYbnORh
	VPZMpA5Dq516BBbsxVA9Cs5VpBjf2ycTJ4LWL2fBUQu+SWd1BWp0wPB4ZVOvTSwSdnZeleIpmjG
	8iq2jErRFQqf+tbOwM6l/s0TxwTPOHl1w5uGBHhmn3Hyf2uTMTm95jFm/ZZ+09aek1yiTyb2mFN
	gVxF2a102E2Z6L6lHnG8dXrBmVwgeBz7lFVdqSD31jgtXQcG8GR+xfrLls773aU37LqhTxVDnvA
	J0+1/fOZRyknWKxdFF
X-Google-Smtp-Source: AGHT+IFbpJ/lHtUZtOELQrDFo7AxEZqNrS9hHE1/EnXHjZzMn0AR8tXrPtdpNdO0986Yh1aFevTgmQ==
X-Received: by 2002:a17:902:e78f:b0:24b:182b:7144 with SMTP id d9443c01a7336-290273565bdmr371321185ad.7.1760537903035;
        Wed, 15 Oct 2025 07:18:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1b80:80c6:cd21:3ff9:2bca:36d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f32d6fsm199561445ad.96.2025.10.15.07.18.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Oct 2025 07:18:21 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev,
	rdunlap@infradead.org
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [RFC PATCH v10 mm-new 6/9] bpf: mark mm->owner as __safe_rcu_or_null
Date: Wed, 15 Oct 2025 22:17:13 +0800
Message-Id: <20251015141716.887-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251015141716.887-1-laoar.shao@gmail.com>
References: <20251015141716.887-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_MEMCG is enabled, we can access mm->owner under RCU. The
owner can be NULL. With this change, BPF helpers can safely access
mm->owner to retrieve the associated task from the mm. We can then make
policy decision based on the task attribute.

The typical use case is as follows,

  bpf_rcu_read_lock(); // rcu lock must be held for rcu trusted field
  @owner = @mm->owner; // mm_struct::owner is rcu trusted or null
  if (!@owner)
      goto out;

  /* Do something based on the task attribute */

out:
  bpf_rcu_read_unlock();

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 kernel/bpf/verifier.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c4f69a9e9af6..d400e18ee31e 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7123,6 +7123,9 @@ BTF_TYPE_SAFE_RCU(struct cgroup_subsys_state) {
 /* RCU trusted: these fields are trusted in RCU CS and can be NULL */
 BTF_TYPE_SAFE_RCU_OR_NULL(struct mm_struct) {
 	struct file __rcu *exe_file;
+#ifdef CONFIG_MEMCG
+	struct task_struct __rcu *owner;
+#endif
 };
 
 /* skb->sk, req->sk are not RCU protected, but we mark them as such
-- 
2.47.3

