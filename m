Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39973FE350
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073826; cv=none; b=BYl92qFTnci4EyOY3FVQw4s1FcwYyPeUd2mkqkqHRCRu/we5zM9pHUG7X+14gRNg2j9h0ExPs4QFWR9oruwVignyqAmJuqH6canBp3I5ICnzDjCdxaGKlhOiO9y1TFvH9kU4dYvhF4U2nhifIFbGuPWt2eKwWVlOjVUC8jA7Qk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073826; c=relaxed/simple;
	bh=F/QiQ0zSPrm/6oDcRCoTElEWdSJvT5j07i2HruZ+ebE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/ToZBz15jbRZejGsnXc8IVSbJmGRYFRWfvhvgabMBvhD9KyKkVuvTquSC1Tf70bQFhphirSpHropCUI4m0TPgRL5HniQ1pqWM0P3xe6+qI9F/UQH347E5F4Z4aJo+yH7n/GoPaRLCt/cpRJ1Jqq11U5t4PfysyvqOE8pqszwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oxe0cd12; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oxe0cd12"
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7e666292eb8so2136485a34.3
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073823; x=1780678623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rls65X3DOzAoQMMdNR2JhXNJkdCouUDjyK2mqUrqz1s=;
        b=Oxe0cd12/Pz5k1qhA3VTJSMPUIhcXMw/5wOn1iXa+tolLRgeNJ+/4aAJX0mSFW/Ezm
         y9S9z5+NLm67T6s0J6XSyc0Z5td0ILcyCpNQ7sJ8Dq3Kcd4RmvK0XGqc/W0lxLQmm2Xj
         mLmdkjJsPGdnZ0iHblC//YaBEDSlTMwI0qZv+Kx/ZznALEr+w3oMIoif+HX3U/naz+eq
         LLFYyF/z6pR+FH/WyGeTo0Jl8fmlWyR9eqr7gU8pFBWlu6HRLox3D978WTDw1ot/2Opy
         JmvEVoWTM6C3BoYgyW8x5/9X87YXE1wT1L6pDyz+gALsVHrBVeV26N5sqc4tFuBVJN/l
         7zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073823; x=1780678623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rls65X3DOzAoQMMdNR2JhXNJkdCouUDjyK2mqUrqz1s=;
        b=F9fVFZpiG7XGZuW79YC6+TQPoaM0EwrOE23cEphYTrOQv3X1ch1j4U3CmJC+IEU4vY
         gvB2+Fn6YMDKU95yAZWrtSSw7X4cNDGfb48/tEhzs3CLzFWVufRKiWGApyAi/G5iSp5i
         m4/ce/lX1J+2HPrhSFxVLwos8gZeCxanG2ymzskwION7EzR2xFJm9N/J6noHDIs9mijS
         w0wFpYXLunS+Wr8eE+r12OAg9C2gkcn+ZegcNPACu/lBBP0Sul+xFb0zLYVexVbMkSCF
         KULMkmQWZe84TpNxjD7fc2xs2asVEp6f0GiFz0Qbr7JxicTDt4QyhR7Wak2u178JlsRp
         2IbA==
X-Forwarded-Encrypted: i=1; AFNElJ8fOVTl4zNR3WoP7I4stojVFCEMMC8KkIhkBRxYy+L1INR2ejCyGA9FvV0l72O/bBf1j114bQIU2aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv+09gqj0JiXrZ9VvD9qPxzsosJ8phbniCsgdVY+7gjn9YtVi5
	B6GhclF0fgHcjHAB710tb4fwNiqhCmBcIDGEGKugNb/w3p6MXwVmIYI=
X-Gm-Gg: Acq92OG5ODx805zpC+2MW7Ny0Ioqow3hguewm2hYORDGUMXE7uPa9QyrAsnflJvy0bV
	Zk0ZoN4wwYCCl9TwO9tVN5tsISwqswCDGYVPQ1wTZ8oByI/eJyFK1qM+zrlmR/EQTjyU9TmP/io
	yW3y9a4egqJKcEJjRCH7veZ+ISteHldK9iY/BSJfOdZKcUr2++H3Em6QY1oZOLJn+gitum02l+a
	rRG/Zgjh0o4lQbOI8r2pjUz9UmMUbtXqzydUuyRE2DVKv4CX1ls1kpSmx+T3HJsPaKIXYNVe5ff
	UQACm4/TW520nh+0PmUzrNJ3/hJ7wOHfdR4c97DskGN7Y++KIL62Xzsi54vudUdEN4QdS0edQHZ
	S8aUzwCQK6UC67VybFtijs7Z5htSVl03XmMyqjP4VzbZaQM2OWfnVPVng0w2mGQVHGpMYSERpWa
	TsDprhWYDezYSb+fWV15TAVJi8tjzSpXkscHB5j3qq9R5YvugZ9J4y0u6WV2t74qlct0lUS83OO
	cKpJuUVF6eP
X-Received: by 2002:a05:6830:258d:b0:7d7:ccc7:c546 with SMTP id 46e09a7af769-7e6a1e3ad8amr396513a34.23.1780073822973;
        Fri, 29 May 2026 09:57:02 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695b8f662sm1862616a34.4.2026.05.29.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:57:02 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 2/6] mm/damon/sysfs-sample: expose perf_events configuration via sysfs
Date: Fri, 29 May 2026 09:56:36 -0700
Message-ID: <20260529165640.820-3-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529165640.820-1-ravis.opensrc@gmail.com>
References: <20260529165640.820-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a perf_events/ subdirectory under each context's sample/ directory.
Each numbered entry maps to one damon_perf_event and exposes its raw
PMU attr, addressing flags, and period/delivery knobs.

Defaults match Intel PEBS L3-miss; userspace overrides them for other
PMUs.  sample_weight_struct defaults off because PMUs that do not
advertise PERF_SAMPLE_WEIGHT_STRUCT (e.g. AMD IBS Op) reject events
that request it with -EOPNOTSUPP.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/sysfs-sample.c | 579 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 579 insertions(+)

diff --git a/mm/damon/sysfs-sample.c b/mm/damon/sysfs-sample.c
index ffc9c85455474..0570d27a47b1c 100644
--- a/mm/damon/sysfs-sample.c
+++ b/mm/damon/sysfs-sample.c
@@ -452,6 +452,520 @@ static const struct kobj_type damon_sysfs_primitives_ktype = {
 	.default_groups = damon_sysfs_primitives_groups,
 };
 
+/*
+ * perf_event_attr directory
+ */
+
+struct damon_sysfs_perf_event_attr {
+	struct kobject kobj;
+	u32 type;
+	u64 config;
+	u64 config1;
+	u64 config2;
+	bool sample_phys_addr;
+	bool sample_weight_struct;
+	bool exclude_kernel;
+	bool exclude_hv;
+	bool freq;
+	u64 sample_freq;
+	u64 sample_period;
+	u32 wakeup_events;
+	u32 precise_ip;
+};
+
+static struct damon_sysfs_perf_event_attr *
+damon_sysfs_perf_event_attr_alloc(void)
+{
+	struct damon_sysfs_perf_event_attr *attr =
+		kzalloc(sizeof(*attr), GFP_KERNEL);
+
+	if (!attr)
+		return NULL;
+	attr->wakeup_events = 1;
+	attr->precise_ip = 2;
+	attr->freq = true;
+	attr->exclude_kernel = true;
+	attr->exclude_hv = true;
+	return attr;
+}
+
+static ssize_t attr_type_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "0x%x\n", perf_event_attr->type);
+}
+
+static ssize_t attr_type_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou32(buf, 0, &perf_event_attr->type);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t config_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "0x%llx\n", perf_event_attr->config);
+}
+
+static ssize_t config_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou64(buf, 0, &perf_event_attr->config);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t config1_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "0x%llx\n", perf_event_attr->config1);
+}
+
+static ssize_t config1_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou64(buf, 0, &perf_event_attr->config1);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t config2_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "0x%llx\n", perf_event_attr->config2);
+}
+
+static ssize_t config2_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou64(buf, 0, &perf_event_attr->config2);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t sample_phys_addr_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%d\n", perf_event_attr->sample_phys_addr);
+}
+
+static ssize_t sample_phys_addr_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	bool sample_phys_addr;
+	int err = kstrtobool(buf, &sample_phys_addr);
+
+	if (err)
+		return -EINVAL;
+
+	perf_event_attr->sample_phys_addr = sample_phys_addr;
+	return count;
+}
+
+static ssize_t sample_weight_struct_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%d\n", perf_event_attr->sample_weight_struct);
+}
+
+static ssize_t sample_weight_struct_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	bool sample_weight_struct;
+	int err = kstrtobool(buf, &sample_weight_struct);
+
+	if (err)
+		return -EINVAL;
+
+	perf_event_attr->sample_weight_struct = sample_weight_struct;
+	return count;
+}
+
+static ssize_t sample_freq_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%llu\n", perf_event_attr->sample_freq);
+}
+
+static ssize_t sample_freq_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou64(buf, 0, &perf_event_attr->sample_freq);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t wakeup_events_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%u\n", perf_event_attr->wakeup_events);
+}
+
+static ssize_t wakeup_events_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou32(buf, 0, &perf_event_attr->wakeup_events);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t precise_ip_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%u\n", perf_event_attr->precise_ip);
+}
+
+static ssize_t precise_ip_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou32(buf, 0, &perf_event_attr->precise_ip);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t freq_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%d\n", perf_event_attr->freq);
+}
+
+static ssize_t freq_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	bool freq;
+	int err = kstrtobool(buf, &freq);
+
+	if (err)
+		return -EINVAL;
+	perf_event_attr->freq = freq;
+	return count;
+}
+
+static ssize_t sample_period_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%llu\n", perf_event_attr->sample_period);
+}
+
+static ssize_t sample_period_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	int err = kstrtou64(buf, 0, &perf_event_attr->sample_period);
+
+	if (err)
+		return -EINVAL;
+	return count;
+}
+
+static ssize_t exclude_kernel_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%d\n", perf_event_attr->exclude_kernel);
+}
+
+static ssize_t exclude_kernel_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	bool v;
+	int err = kstrtobool(buf, &v);
+
+	if (err)
+		return -EINVAL;
+	perf_event_attr->exclude_kernel = v;
+	return count;
+}
+
+static ssize_t exclude_hv_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+
+	return sysfs_emit(buf, "%d\n", perf_event_attr->exclude_hv);
+}
+
+static ssize_t exclude_hv_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_event_attr *perf_event_attr = container_of(kobj,
+			struct damon_sysfs_perf_event_attr, kobj);
+	bool v;
+	int err = kstrtobool(buf, &v);
+
+	if (err)
+		return -EINVAL;
+	perf_event_attr->exclude_hv = v;
+	return count;
+}
+
+static void damon_sysfs_perf_event_attr_release(struct kobject *kobj)
+{
+	kfree(container_of(kobj, struct damon_sysfs_perf_event_attr, kobj));
+}
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_type_attr =
+		__ATTR(type, 0600, attr_type_show, attr_type_store);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_config_attr =
+		__ATTR_RW_MODE(config, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_config1_attr =
+		__ATTR_RW_MODE(config1, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_config2_attr =
+		__ATTR_RW_MODE(config2, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_sample_phys_addr_attr =
+		__ATTR_RW_MODE(sample_phys_addr, 0600);
+
+static struct kobj_attribute
+		damon_sysfs_perf_event_attr_sample_weight_struct_attr =
+		__ATTR_RW_MODE(sample_weight_struct, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_sample_freq_attr =
+		__ATTR_RW_MODE(sample_freq, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_wakeup_events_attr =
+		__ATTR_RW_MODE(wakeup_events, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_precise_ip_attr =
+		__ATTR_RW_MODE(precise_ip, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_freq_attr =
+		__ATTR_RW_MODE(freq, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_sample_period_attr =
+		__ATTR_RW_MODE(sample_period, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_exclude_kernel_attr =
+		__ATTR_RW_MODE(exclude_kernel, 0600);
+
+static struct kobj_attribute damon_sysfs_perf_event_attr_exclude_hv_attr =
+		__ATTR_RW_MODE(exclude_hv, 0600);
+
+static struct attribute *damon_sysfs_perf_event_attr_attrs[] = {
+	&damon_sysfs_perf_event_attr_type_attr.attr,
+	&damon_sysfs_perf_event_attr_config_attr.attr,
+	&damon_sysfs_perf_event_attr_config1_attr.attr,
+	&damon_sysfs_perf_event_attr_config2_attr.attr,
+	&damon_sysfs_perf_event_attr_sample_phys_addr_attr.attr,
+	&damon_sysfs_perf_event_attr_sample_weight_struct_attr.attr,
+	&damon_sysfs_perf_event_attr_freq_attr.attr,
+	&damon_sysfs_perf_event_attr_sample_freq_attr.attr,
+	&damon_sysfs_perf_event_attr_sample_period_attr.attr,
+	&damon_sysfs_perf_event_attr_wakeup_events_attr.attr,
+	&damon_sysfs_perf_event_attr_precise_ip_attr.attr,
+	&damon_sysfs_perf_event_attr_exclude_kernel_attr.attr,
+	&damon_sysfs_perf_event_attr_exclude_hv_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(damon_sysfs_perf_event_attr);
+
+static const struct kobj_type damon_sysfs_perf_event_attr_ktype = {
+	.release = damon_sysfs_perf_event_attr_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = damon_sysfs_perf_event_attr_groups,
+};
+
+/*
+ * perf_events directory
+ */
+
+/*
+ * Cap on the number of perf events per damon_ctx, to bound the sysfs
+ * kobject footprint and prevent unbounded allocations from a careless
+ * write to nr_perf_events.
+ */
+#define DAMON_SYSFS_PERF_EVENTS_MAX	64
+
+struct damon_sysfs_perf_events {
+	struct kobject kobj;
+	struct damon_sysfs_perf_event_attr **attrs_arr;
+	int nr;
+};
+
+static struct damon_sysfs_perf_events *damon_sysfs_perf_events_alloc(void)
+{
+	return kzalloc(sizeof(struct damon_sysfs_perf_events), GFP_KERNEL);
+}
+
+static void damon_sysfs_perf_events_rm_dirs(
+		struct damon_sysfs_perf_events *events)
+{
+	struct damon_sysfs_perf_event_attr **attrs_arr = events->attrs_arr;
+	int i;
+
+	for (i = 0; i < events->nr; i++)
+		kobject_put(&attrs_arr[i]->kobj);
+	events->nr = 0;
+	kfree(attrs_arr);
+	events->attrs_arr = NULL;
+}
+
+static int damon_sysfs_perf_events_add_dirs(
+		struct damon_sysfs_perf_events *events, int nr_events)
+{
+	struct damon_sysfs_perf_event_attr **attrs_arr, *attr;
+	int err, i;
+
+	damon_sysfs_perf_events_rm_dirs(events);
+	if (!nr_events)
+		return 0;
+
+	attrs_arr = kmalloc_array(nr_events, sizeof(*attrs_arr), GFP_KERNEL);
+	if (!attrs_arr)
+		return -ENOMEM;
+	events->attrs_arr = attrs_arr;
+
+	for (i = 0; i < nr_events; i++) {
+		attr = damon_sysfs_perf_event_attr_alloc();
+		if (!attr) {
+			damon_sysfs_perf_events_rm_dirs(events);
+			return -ENOMEM;
+		}
+
+		err = kobject_init_and_add(&attr->kobj,
+				&damon_sysfs_perf_event_attr_ktype, &events->kobj,
+				"%d", i);
+		if (err) {
+			kobject_put(&attr->kobj);
+			damon_sysfs_perf_events_rm_dirs(events);
+			return err;
+		}
+		attrs_arr[i] = attr;
+		events->nr++;
+	}
+	return 0;
+}
+
+static ssize_t nr_perf_events_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_perf_events *events = container_of(kobj,
+			struct damon_sysfs_perf_events, kobj);
+
+	return sysfs_emit(buf, "%d\n", events->nr);
+}
+
+static ssize_t nr_perf_events_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_perf_events *events;
+	int nr, err = kstrtoint(buf, 0, &nr);
+
+	if (err)
+		return err;
+	if (nr < 0 || nr > DAMON_SYSFS_PERF_EVENTS_MAX)
+		return -EINVAL;
+
+	events = container_of(kobj, struct damon_sysfs_perf_events, kobj);
+
+	if (!mutex_trylock(&damon_sysfs_lock))
+		return -EBUSY;
+	err = damon_sysfs_perf_events_add_dirs(events, nr);
+	mutex_unlock(&damon_sysfs_lock);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static void damon_sysfs_perf_events_release(struct kobject *kobj)
+{
+	kfree(container_of(kobj, struct damon_sysfs_perf_events, kobj));
+}
+
+static struct kobj_attribute damon_sysfs_perf_events_nr_attr =
+		__ATTR_RW_MODE(nr_perf_events, 0600);
+
+static struct attribute *damon_sysfs_perf_events_attrs[] = {
+	&damon_sysfs_perf_events_nr_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(damon_sysfs_perf_events);
+
+static const struct kobj_type damon_sysfs_perf_events_ktype = {
+	.release = damon_sysfs_perf_events_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = damon_sysfs_perf_events_groups,
+};
+
 /*
  * sample directory
  */
@@ -471,6 +985,7 @@ int damon_sysfs_sample_add_dirs(struct damon_sysfs_sample *sample)
 {
 	struct damon_sysfs_primitives *primitives;
 	struct damon_sysfs_sample_filters *filters;
+	struct damon_sysfs_perf_events *perf_events;
 	int err;
 
 	primitives = damon_sysfs_primitives_alloc(true, false);
@@ -494,7 +1009,23 @@ int damon_sysfs_sample_add_dirs(struct damon_sysfs_sample *sample)
 	if (err)
 		goto put_filters_out;
 	sample->filters = filters;
+
+	perf_events = damon_sysfs_perf_events_alloc();
+	if (!perf_events) {
+		err = -ENOMEM;
+		goto put_filters_out;
+	}
+	err = kobject_init_and_add(&perf_events->kobj,
+			&damon_sysfs_perf_events_ktype, &sample->kobj,
+			"perf_events");
+	if (err)
+		goto put_perf_events_out;
+	sample->perf_events = perf_events;
+
 	return 0;
+put_perf_events_out:
+	kobject_put(&perf_events->kobj);
+	sample->perf_events = NULL;
 put_filters_out:
 	kobject_put(&filters->kobj);
 	sample->filters = NULL;
@@ -512,6 +1043,10 @@ void damon_sysfs_sample_rm_dirs(struct damon_sysfs_sample *sample)
 		damon_sysfs_sample_filters_rm_dirs(sample->filters);
 		kobject_put(&sample->filters->kobj);
 	}
+	if (sample->perf_events) {
+		damon_sysfs_perf_events_rm_dirs(sample->perf_events);
+		kobject_put(&sample->perf_events->kobj);
+	}
 }
 
 void damon_sysfs_sample_release(struct kobject *kobj)
@@ -596,3 +1131,47 @@ int damon_sysfs_set_sample_control(
 	return damon_sysfs_set_sample_filters(control,
 			sysfs_sample->filters);
 }
+
+static int damon_sysfs_add_perf_event(
+		struct damon_sysfs_perf_event_attr *sys_attr,
+		struct damon_ctx *ctx)
+{
+	struct damon_perf_event *event = kzalloc(sizeof(*event), GFP_KERNEL);
+
+	if (!event)
+		return -ENOMEM;
+
+	event->attr.type = sys_attr->type;
+	event->attr.config = sys_attr->config;
+	event->attr.config1 = sys_attr->config1;
+	event->attr.config2 = sys_attr->config2;
+	event->attr.sample_phys_addr = sys_attr->sample_phys_addr;
+	event->attr.sample_weight_struct = sys_attr->sample_weight_struct;
+	event->attr.freq = sys_attr->freq;
+	event->attr.sample_freq = sys_attr->sample_freq;
+	event->attr.sample_period = sys_attr->sample_period;
+	event->attr.wakeup_events = sys_attr->wakeup_events;
+	event->attr.precise_ip = sys_attr->precise_ip;
+	event->attr.exclude_kernel = sys_attr->exclude_kernel;
+	event->attr.exclude_hv = sys_attr->exclude_hv;
+
+	list_add_tail(&event->list, &ctx->perf_events);
+	return 0;
+}
+
+int damon_sysfs_add_perf_events(struct damon_ctx *ctx,
+		struct damon_sysfs_sample *sysfs_sample)
+{
+	struct damon_sysfs_perf_events *events = sysfs_sample->perf_events;
+	int i, err;
+
+	if (!events)
+		return 0;
+
+	for (i = 0; i < events->nr; i++) {
+		err = damon_sysfs_add_perf_event(events->attrs_arr[i], ctx);
+		if (err)
+			return err;
+	}
+	return 0;
+}
-- 
2.43.0

