Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515444E64E
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774912; cv=none; b=Whp7Peb4D2uTmYnWNWaCIZIEbd/Dj0zHaHoW+ErdHzfa0yEPIkXI5Cw8lT0C5LJEcjpSeiMV/PE02FplWcoZAv0qzcMBs/AQeKxNk/4kvtERIFxkFfc5V8XSXjJ/OcUBk/gqGVDUyDKs4rzJmeTibfJoK8ouR6HU+6WH2kWY3e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774912; c=relaxed/simple;
	bh=i9d4Vftsku4C4hRtse/HfWlFXzHBBI2yaNFsrVGvuRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8hPL6joPS756nB0UAfXo+BVGm5avyOrT0YVaMgja4A9h9KuZOfaI7Ud7tlvlfz7ErhpNj2/GdsNKBJGL+Y8xjadAbixY9sCHYJRfempq6jfO9JkDoU4jW0BpntkiA9bkiaxurbzScVC1P6AA54lw0WGOoY19Igp/8FLWe/bEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYb/6dud; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYb/6dud"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381b831d535so5555971a91.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774909; x=1789379709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PD03fl7XZ6y143t1i1zJonTPm8hoG59RG3FMhqUEKQ=;
        b=rYb/6dudsrjrCPnaXEiTRGPURgOsyipjYS8AN4udPKKPeit3KmvHYceI71Jvt+YNHR
         t9xMDNoEZgqz0TvN6PLNz5D9HYAobf/K2ftJr6OIIekQkQM4d0aFl6JXXW4e1wd2xRc4
         0oTHWIHp1e1CRRgkZwvwwFSN/28wIu0+krLDvqDjJRh8u00WdOdprw24xHPiBJ2WuNnf
         V3/HXpkUGKcJYt0qzzFjjr2slUihOaxFydNHBkqpBtCPXe3GrLvb040EE05GHdAaXJhn
         tNb1r6CYPNsDNGImbnQt8C2NyJsFCdXM6ckTgwRu55/F0n8chbnUN6eybm2/h28YDiUD
         a4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774909; x=1789379709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PD03fl7XZ6y143t1i1zJonTPm8hoG59RG3FMhqUEKQ=;
        b=LK3I2d8qW3EN38JcpKOTxt+ZrMBe5ked3AGljua1UHIFOW1iuZy8JH3B5/3enyiNpJ
         rZ01uVMrGMIy0RAlIB876gHyhYo7H7alYAL6+51JOJ91V30BiaAaWkz0wMjRDNJqd2fO
         C/iH3FIdtJqr7Owuy/dp4R+slxEN1PzwlzGmXEhgLAIq9nvzBcYbDsBg2Xb8iY0XCFDV
         8xCi4GI/UFY7xihVhsTHNrv47v7KvUnZ7siPwUqt+9CoHr29owz03/Jd3Ge06dUKJFpV
         2ypEN1jRBuYasvghbqnswrx98ce8wbLlQTYn0Np+UpAZv+SsOXx5J+HBWow8HL3mYCfr
         3JKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0+VqvUvk9Ht3PrrBuLRF+BhvrCHrNGNdry4I023E2LPUkjhotq6bURr80CF1+ZWLJExw+q96NYjo=@vger.kernel.org
X-Gm-Message-State: AFuF++lse/ZGoiCl6HHwu8zNAKpUzbL/GVNrG9379okRzb9mK77Idt9I
	bJW5rYaCQ0mUdv8dfLYTe8/QZEesvKvlsdsL59876hKzu9NKQA7mbrWO
X-Gm-Gg: AYBFou18BxjPGHqaojbYAJJJ3MEUp78TF8j38VcV+Yc/Pse0XUlyxOio/xpzxcRZnqh
	mTMs9o8yBtcTU0azTNAGKc3bLa1OQxATPlSESLEUiBOqmVHIwBqdTxGU7p6bwzMKLrvznsqwHWr
	OS/P338fD4zv/9BmmH0WMYm4evQzDNplWNbutcajAmXcGMpihdaQKDAxk5zeewe+xNsiHvM092l
	ShZD6tu0kyaoLTpjpuK2k0ejuKdKnNyrIaPpHg1Act0SUBG+319er50k5DT5tEKe4JBJNo6yVN8
	SiMmMD5a/TjtmnAYjs4NHyow3vbYqhaE8mxAO8EitcUOwqEu7MdV7D2vENJvy8XIrLbNZHxgR0O
	eFEyrXqXxIsh7xqR3VQ4F38lRxmIU6ZKgtlLuRA8P7DMTCdKmuNtV4arLZ0rJZanGrIfl7Umq+3
	hN0sZo7TWzrD9XQCOwtcxIbEhRbsH9rsKihDs+zrn01/DxjGYMffmCF47u2CwAgVt5I1Kam6oIl
	GixlKa2XADvYRE=
X-Received: by 2002:a17:90b:3803:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39b25eef036mr31016094a91.0.1788774903375;
        Mon, 07 Sep 2026 02:55:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34831030c88.2.2026.09.07.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:55:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH iwl-next v2 2/4] ice: fix typos in comments
Date: Mon,  7 Sep 2026 15:24:44 +0530
Message-ID: <20260907095446.27290-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095446.27290-1-hemanth.selam@gmail.com>
References: <20260907095446.27290-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to iwl-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto iwl-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907064528.6602-1-hemanth.selam@gmail.com/

 drivers/net/ethernet/intel/ice/ice.h       | 2 +-
 drivers/net/ethernet/intel/ice/ice_main.c  | 2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index db3c7015c56c..e5f940d324dc 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -1105,7 +1105,7 @@ extern const struct xdp_metadata_ops ice_xdp_md_ops;
  * ice_is_dual - Check if given config is multi-NAC
  * @hw: pointer to HW structure
  *
- * Return: true if the device is running in mutli-NAC (Network
+ * Return: true if the device is running in multi-NAC (Network
  * Acceleration Complex) configuration variant, false otherwise
  * (always false for non-E825 devices).
  */
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index d88835482d3a..fe47ec0ba809 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -6202,7 +6202,7 @@ ice_fdb_del(struct ndmsg *ndm, __always_unused struct nlattr *tb[],
  *
  * Features that need fixing:
  *	Cannot simultaneously enable CTAG and STAG stripping and/or insertion.
- *	These are mutually exlusive as the VSI context cannot support multiple
+ *	These are mutually exclusive as the VSI context cannot support multiple
  *	VLAN ethertypes simultaneously for stripping and/or insertion. If this
  *	is not done, then default to clearing the requested STAG offload
  *	settings.
diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
index e04de0215596..9ef1aa66fa2b 100644
--- a/drivers/net/ethernet/intel/ice/ice_sriov.c
+++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
@@ -924,7 +924,7 @@ static void ice_sriov_remap_vectors(struct ice_pf *pf, u16 restricted_id)
  * is correct etc. Then disable old mapping (MSI-X and queues registers), change
  * MSI-X and queues, rebuild VSI and enable new mapping.
  *
- * If it is possible (driver not binded to VF) try to remap also other VFs to
+ * If it is possible (driver not bound to VF) try to remap also other VFs to
  * linearize irqs register usage.
  */
 int ice_sriov_set_msix_vec_count(struct pci_dev *vf_dev, int msix_vec_count)
