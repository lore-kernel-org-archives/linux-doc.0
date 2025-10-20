Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625B1E3762
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930242; cv=none; b=r0qUS6PA9+Tb7M6f2sbHEZop4pcWsDuLoIa3IP5lj4R6sw/Q6xaCnAOvZUzZnFUNJuARqZiehH4sg8TIj843sSWXRPf3lbP/tOoHrxC1dZem6kgQ0TjxNkEgGJionGDObZX3AwOSQKE03QCPAPHDJQch9Xga+aWJ1hfqUE3OXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930242; c=relaxed/simple;
	bh=sTyjq4lpHpE1Tag4v7BrWtTUyfVl+9Yq5BWJCJuucZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gg1ruFwMTAKEiWaH39PN3WvQYQOnEN6GJHbEYRAci/nEM+c0miVDlL0QuWbqHLGqCn+vDNn1mSAr0I8Jk8ysW6Qn6zr3GuF11OH+NmpJf3ayd6GZAzSd2ZGSFv/zDFabp4I98OaswyzOvqF4lHgrazOKoNiUgF/cMY/eTqjiuzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awt91vO4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awt91vO4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27c369f898fso56791115ad.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760930239; x=1761535039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYdtRER+63D5fwP+dPFGkrD4tSBc+ZR0Nj1GwO3r8rs=;
        b=awt91vO4bDyg6BC107x/vOpmB4wLxzVF5dNdNwcXwB124WZfBJizAS5Aaj/gJT9JiS
         YVQ1nsRzSgPSdnMK88ewCrWVir/xYtIsBAuyjylfWLakwJGz+p1LiEAj0jgx3ABX5xbW
         bfatyQq/Xcldh5nDu3Nb6n6PPiShCwNJ8oxfLQ7gViOcUtAMAHQd2xBHJfzvG2wTTDme
         0NxGKsf3S4h2vQQRRekqtt+ceS4jpUVbBW7p0odDSzTZQgaHS0+pS5ikSvCF6v7xN1lA
         Mdo2I3LMlgv2riILDHWoAdSi7pg51rPn6JGdtFu4dzRRkANHgq3VmqbpMIpTFw9FB/8I
         eNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930239; x=1761535039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYdtRER+63D5fwP+dPFGkrD4tSBc+ZR0Nj1GwO3r8rs=;
        b=PX90RXNvkjJk1Mc6gheC6JTC7OnyqrWLt37dMY8kYJ+F22Qx3MWlIzG3cY/Ef/tmtb
         TLtUlXrbKkNCDXD+rTSMiC93/7NCM/XrfZVRUUAy3iyiE7A/lf15rL/CljrSYKLmnHdo
         i00DQWIKSz19MqkW1hVPFrvfL9HcYOCGTWCa0JP2SL8VxFtsxVRErAbovZj4YTvLwmuW
         9KAh6mdMZA6uXu9gdeck1a+Qkmg9x12cEqKDGgBBmGaNdbOhs5qmXY6fdjsO+eB4zvT7
         +VfZYeK76yozp1F6h8sl/KpbyGyXnZITdtfdsoBxNy+B6eh1fycNTlsj6aft4IEy33gr
         Rpdg==
X-Forwarded-Encrypted: i=1; AJvYcCXXDS9vs1aO8eYSNFhETWjCgjlInWMmZecdrSxfycvbjXUxmOEngYRcuL5lT+ZmgNIwZbfsrBleK5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/Tmj4VEPoXJFvWUF5mtqXSbS9MrH5XJA1EuXJLX/CgkXUVN+
	NywZDK/0v0aNZZMf/5UH2IrbnPHLSynd4OsmiowkSWkWJ6aBpaDVGUDs
X-Gm-Gg: ASbGncuhWycczzzYN51dImJzTbztJePc1YfPAIDyy8BvkFoDSEP4dCoOy7HVfEkdqeQ
	5stj/a02hn2h6NAyEQFLXX/9yhTX9ENZjZxpPCSr+wg0vMYpfhpvsavJHyB4vO1tngLoK/ALrNo
	Zr2GHVRZ0NGquQ6TAeLUhqxzz0uqB0vdCfaHt2gKWvKaIb/m96WaEyJI+3Pyy0ZMMIZY7Sy8kN4
	99obmSk+NWHl9j6UuU9AmQ6es8kMUK6jJPRjlw/RIMg17k/kIC7YnCh9Fom5ktkjWwmOH9BhibH
	wfljj43jO/USqxkU+2pe6FuakHawc1OZ6LXMqjHtL8fOAHx+UFPqm06AIoBenEZtn7e8XRet/GW
	TvL5KPR0SO5386ndFUer/iSAHTEt0qvTerD50AYZODabSE5Mj8j88gFat+K1qG3Oww+K2NpKaye
	E9jEyCqb3RgmD053vDh7io2gP+QccCN/NFFhHcmSznpJAyJw==
X-Google-Smtp-Source: AGHT+IGo/kUBmmZVSBiCCtDWJPQhX6W2PzXxnBQ3p+r5Rs/M8lNok3r/Ez1M0M2GbDWgxzLf0C8R3g==
X-Received: by 2002:a17:902:dac5:b0:267:6754:8fd9 with SMTP id d9443c01a7336-290ca216ad6mr166008035ad.39.1760930238858;
        Sun, 19 Oct 2025 20:17:18 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1da1:a41d:3815:5989:6e28:9b6d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fddfesm66373435ad.88.2025.10.19.20.17.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 20:17:18 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	david@redhat.com,
	ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
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
Subject: [PATCH v11 mm-new 06/10] mm: bpf-thp: add support for global mode
Date: Mon, 20 Oct 2025 11:16:51 +0800
Message-Id: <20251020031655.1093-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251020031655.1093-1-laoar.shao@gmail.com>
References: <20251020031655.1093-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-process BPF-THP mode is unsuitable for managing shared resources
such as shmem THP and file-backed THP. This aligns with known cgroup
limitations for similar scenarios [0].

Introduce a global BPF-THP mode to address this gap. When registered:
- All existing per-process instances are disabled
- New per-process registrations are blocked
- Existing per-process instances remain registered (no forced unregistration)

The global mode takes precedence over per-process instances. Updates are
type-isolated: global instances can only be updated by new global
instances, and per-process instances by new per-process instances.

Link: https://lore.kernel.org/linux-mm/YwNold0GMOappUxc@slm.duckdns.org/ [0]

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 mm/huge_memory_bpf.c | 109 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory_bpf.c b/mm/huge_memory_bpf.c
index e8894c10d1d9..cad1ca6f59a4 100644
--- a/mm/huge_memory_bpf.c
+++ b/mm/huge_memory_bpf.c
@@ -33,6 +33,28 @@ struct bpf_thp_ops {
 };
 
 static DEFINE_SPINLOCK(thp_ops_lock);
+static struct bpf_thp_ops __rcu *bpf_thp_global; /* global mode */
+
+static unsigned long
+bpf_hook_thp_get_orders_global(struct vm_area_struct *vma,
+			       enum tva_type type,
+			       unsigned long orders)
+{
+	thp_order_fn_t *bpf_hook_thp_get_order;
+	int bpf_order;
+
+	rcu_read_lock();
+	bpf_hook_thp_get_order = rcu_dereference(bpf_thp_global->thp_get_order);
+	if (!bpf_hook_thp_get_order)
+		goto out;
+
+	bpf_order = bpf_hook_thp_get_order(vma, type, orders);
+	orders &= BIT(bpf_order);
+
+out:
+	rcu_read_unlock();
+	return orders;
+}
 
 unsigned long bpf_hook_thp_get_orders(struct vm_area_struct *vma,
 				      enum tva_type type,
@@ -45,6 +67,10 @@ unsigned long bpf_hook_thp_get_orders(struct vm_area_struct *vma,
 	if (!mm)
 		return orders;
 
+	/* Global BPF-THP takes precedence over per-process BPF-THP. */
+	if (rcu_access_pointer(bpf_thp_global))
+		return bpf_hook_thp_get_orders_global(vma, type, orders);
+
 	rcu_read_lock();
 	bpf_thp = rcu_dereference(mm->bpf_mm.bpf_thp);
 	if (!bpf_thp || !bpf_thp->thp_get_order)
@@ -177,6 +203,23 @@ static int bpf_thp_init_member(const struct btf_type *t,
 	return 0;
 }
 
+static int bpf_thp_reg_gloabl(void *kdata, struct bpf_link *link)
+{
+	struct bpf_thp_ops *ops = kdata;
+
+	/* Protect the global pointer bpf_thp_global from concurrent writes. */
+	spin_lock(&thp_ops_lock);
+	/* Only one instance is allowed. */
+	if (rcu_access_pointer(bpf_thp_global)) {
+		spin_unlock(&thp_ops_lock);
+		return -EBUSY;
+	}
+
+	rcu_assign_pointer(bpf_thp_global, ops);
+	spin_unlock(&thp_ops_lock);
+	return 0;
+}
+
 static int bpf_thp_reg(void *kdata, struct bpf_link *link)
 {
 	struct bpf_thp_ops *bpf_thp = kdata;
@@ -187,6 +230,11 @@ static int bpf_thp_reg(void *kdata, struct bpf_link *link)
 	pid_t pid;
 
 	pid = bpf_thp->pid;
+
+	/* Fallback to global mode if pid is not set. */
+	if (!pid)
+		return bpf_thp_reg_gloabl(kdata, link);
+
 	p = find_get_task_by_vpid(pid);
 	if (!p)
 		return -ESRCH;
@@ -207,8 +255,10 @@ static int bpf_thp_reg(void *kdata, struct bpf_link *link)
 	 * might register this task simultaneously.
 	 */
 	spin_lock(&thp_ops_lock);
-	/* Each process is exclusively managed by a single BPF-THP. */
-	if (rcu_access_pointer(mm->bpf_mm.bpf_thp))
+	/* Each process is exclusively managed by a single BPF-THP.
+	 * Global mode disables per-process instances.
+	 */
+	if (rcu_access_pointer(mm->bpf_mm.bpf_thp) || rcu_access_pointer(bpf_thp_global))
 		goto out_lock;
 	err = 0;
 	rcu_assign_pointer(mm->bpf_mm.bpf_thp, bpf_thp);
@@ -224,12 +274,33 @@ static int bpf_thp_reg(void *kdata, struct bpf_link *link)
 	return err;
 }
 
+static void bpf_thp_unreg_global(void *kdata, struct bpf_link *link)
+{
+	struct bpf_thp_ops *bpf_thp;
+
+	spin_lock(&thp_ops_lock);
+	if (!rcu_access_pointer(bpf_thp_global)) {
+		spin_unlock(&thp_ops_lock);
+		return;
+	}
+
+	bpf_thp = rcu_replace_pointer(bpf_thp_global, NULL,
+				      lockdep_is_held(&thp_ops_lock));
+	WARN_ON_ONCE(!bpf_thp);
+	spin_unlock(&thp_ops_lock);
+
+	synchronize_rcu();
+}
+
 static void bpf_thp_unreg(void *kdata, struct bpf_link *link)
 {
 	struct bpf_thp_ops *bpf_thp = kdata;
 	struct bpf_mm_ops *bpf_mm;
 	struct list_head *pos, *n;
 
+	if (!bpf_thp->pid)
+		return bpf_thp_unreg_global(kdata, link);
+
 	spin_lock(&thp_ops_lock);
 	list_for_each_safe(pos, n, &bpf_thp->mm_list) {
 		bpf_mm = list_entry(pos, struct bpf_mm_ops, bpf_thp_list);
@@ -242,6 +313,31 @@ static void bpf_thp_unreg(void *kdata, struct bpf_link *link)
 	synchronize_rcu();
 }
 
+static int bpf_thp_update_global(void *kdata, void *old_kdata, struct bpf_link *link)
+{
+	struct bpf_thp_ops *old_bpf_thp = old_kdata;
+	struct bpf_thp_ops *bpf_thp = kdata;
+	struct bpf_thp_ops *old_global;
+
+	if (!old_bpf_thp || !bpf_thp)
+		return -EINVAL;
+
+	spin_lock(&thp_ops_lock);
+	/* BPF-THP global instance has already been removed. */
+	if (!rcu_access_pointer(bpf_thp_global)) {
+		spin_unlock(&thp_ops_lock);
+		return -ENOENT;
+	}
+
+	old_global = rcu_replace_pointer(bpf_thp_global, bpf_thp,
+					 lockdep_is_held(&thp_ops_lock));
+	WARN_ON_ONCE(!old_global);
+	spin_unlock(&thp_ops_lock);
+
+	synchronize_rcu();
+	return 0;
+}
+
 static int bpf_thp_update(void *kdata, void *old_kdata, struct bpf_link *link)
 {
 	struct bpf_thp_ops *old_bpf_thp = old_kdata;
@@ -249,6 +345,15 @@ static int bpf_thp_update(void *kdata, void *old_kdata, struct bpf_link *link)
 	struct bpf_mm_ops *bpf_mm;
 	struct list_head *pos, *n;
 
+	/* Updates are confined to instances of the same scope:
+	 * global to global, process-local to process-local.
+	 */
+	if (!!old_bpf_thp->pid != !!bpf_thp->pid)
+		return -EINVAL;
+
+	if (!old_bpf_thp->pid)
+		return bpf_thp_update_global(kdata, old_kdata, link);
+
 	INIT_LIST_HEAD(&bpf_thp->mm_list);
 
 	/* Could be optimized to a per-instance lock if this lock becomes a bottleneck. */
-- 
2.47.3

