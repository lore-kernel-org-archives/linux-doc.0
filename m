Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DECE45518A
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774900; cv=none; b=H+/7AMC2CyTSpIg+vWuskozYqm+QrWhZ9RQ0KE/jbHOxCTyJmIf0Qq0PK/aUacmlU+ZpgYxtWimn6mbpF0MvXwT/mDjxnWEzp1REYSXa0wRRoPTo9uo8/T3QS19TQvbd8YTw6g4OFsYoe7gxw/3yA3fv5/ELJU1r6adwa1p7fkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774900; c=relaxed/simple;
	bh=s549kevUZC4ZyUc7XqUZMng2RkCpooWQvdm+Nz2D0W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiBE8P8pmKrNEifBiZm++vtHCGB9gqWr4S1R/54mIUJUwBbgl7mUPd3saKkPb4qI4J2ChGOGEmPOvv7mjlpDzmuS1Dioia5sojyTAa6kV9JM3uXqXa5CI1DLZMMvArj3HqCzCrKwMEkdNrtZkJw0JLxZ3+05lWq0zd77mzEd+yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4IFcsRl; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4IFcsRl"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39266382df6so2534005a91.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 02:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774898; x=1789379698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAjCGFj9uN24CROal9WgOpj03Aiwe9JIURKGhaUN4Iw=;
        b=O4IFcsRlp1gUSfPO5iwfSBPxBw+b73izEsYnNtRZbCijsuG6NlHuX+K97alavRu5Nv
         Ydqt6eOu1VCuktpGnl3MJpHeuPkZhl+c5mTTA1pjAImBiRmGBqI8nfwsInm4cQCgreC5
         j/VBc3LKidVrsglvBAjm1bwTTh59WGezMpXlWjXV3IgJS5noUyQmIO9CCgl268sn+xm9
         IlmVoU/TX2W0rz6P2Hoi7uar5dgki3npcuJSwk8lcpMjK8fcxCOuUEEwWAfkSgyWW+6/
         pfs9HvhGqhxGt+KpPWESaCkVI94uAh6D6ZhBkwrsF/JBFULUckDLKpHv6xbTx6MlkxKX
         iqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774898; x=1789379698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CAjCGFj9uN24CROal9WgOpj03Aiwe9JIURKGhaUN4Iw=;
        b=bWJxM40+4uMa8y2lwsngOwG6Hkp3e0buXSyMYDIMeLdLmwp4rerYcUhuffQEL2X0kc
         E+9dLaClEcRjk1ZYO3ncr7ZXlw6KzDI8s3t8munh8zStfrARBshJmv8a47r0/kEk+GN3
         7HHbtGe9O0Y9C24OutrBB+4BH93DH7hr42WgaqJbNHUG2SK1tUHVHDkaN4AT51CwvOrq
         qHaGYmdjHWB697MzH9YCBKkclHIesFpSCBtjIBybqAT8EX0cAx4bu7pMWHMMkAcJzLIo
         n73DYlS9Pf1VlIdveFauJG2ur8eDuwQMpK6mE1UkHarryOqesOIeAeikMEvaZcSm3VuX
         zBfA==
X-Forwarded-Encrypted: i=1; AKwUvBx8Ufuyxsfk/SeB1xV86x7cUNWvdG9cobi84C5rhlxewCLDcSE3FLcZrB2zwsuq72Vlsr9FQK7Y190=@vger.kernel.org
X-Gm-Message-State: AFuF++kpx5DFfuQfrIVhaygwgfOn+u4JT7H9ZIID+kb8KPHu2gXf81xw
	/tmTUPCN2AWlCpXcDTZil/lfo/UOHDVe9VYny4DeyiOXr/N9RrJGLvf2
X-Gm-Gg: AYBFou1QRS7I3TiUH4etimbkmdH4V1elOriQte6G7CVom/WIxJxU7NpZMqQEBx3U36s
	umazYEQsomOJjb6OYvpung7D9+IZTF0f9VwE0JiKXB5Db2ChJdqZC79YlY1TxglhrXDzuN6MVgQ
	n2vH6afIX7THUBTqyXS264KLT+2UkqwTczL2doCQQRZZI5PU5wDYXV/cnpL08xv5voT2ehxf0Pr
	1Qsf/SG2Kg9Lm1sJD9zT2AEe2RqE6tHhbFKUBfWSVQu9vqSmGul5B76Z/EJy+RD0UWgn8Aa68ug
	CpFZcaGaKFo4e3xiABf7MgexMJ1tGqsuMVy3pB7Uv088wH8qhEV2qwCxwtduIa6JWH+2Jz9XCek
	K95WArJ7982W0juerZ/kAo+jkZ66ZzSjGa51eD+Z8pg98xJ/2Zien4OFkmFf2sBqiCATcC+q8s5
	p3gF5NuXFJqhdG8lCTvyV7h7O4WJbYZr9caRmtWiE15+ObMn6FkWku+eGjs6aOXcgSTiE5hm0R7
	bIO6sFcBD2hiA==
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr36356477a91.24.1788774898462;
        Mon, 07 Sep 2026 02:54:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34831030c88.2.2026.09.07.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:54:57 -0700 (PDT)
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
Subject: [PATCH iwl-next v2 1/4] i40e: fix typos in comments
Date: Mon,  7 Sep 2026 15:24:43 +0530
Message-ID: <20260907095446.27290-2-hemanth.selam@gmail.com>
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

 drivers/net/ethernet/intel/i40e/i40e_common.c  | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_common.c b/drivers/net/ethernet/intel/i40e/i40e_common.c
index 8dadfef2c09f..026b35e5a000 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_common.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_common.c
@@ -676,7 +676,7 @@ int i40e_pf_reset(struct i40e_hw *hw)
 	grst_del = FIELD_GET(I40E_GLGEN_RSTCTL_GRSTDEL_MASK,
 			     rd32(hw, I40E_GLGEN_RSTCTL));
 
-	/* It can take upto 15 secs for GRST steady state.
+	/* It can take up to 15 secs for GRST steady state.
 	 * Bump it to 16 secs max to be safe.
 	 */
 	grst_del = grst_del * 20;
diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 3da9ec49cc74..ef9d1e78c16a 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -2614,7 +2614,7 @@ static u64 i40e_eeprom_test(struct net_device *netdev, u64 *data)
 	netif_info(pf, hw, netdev, "eeprom test\n");
 	*data = i40e_diag_eeprom_test(&pf->hw);
 
-	/* forcebly clear the NVM Update state machine */
+	/* forcibly clear the NVM Update state machine */
 	pf->hw.nvmupd_state = I40E_NVMUPD_STATE_INIT;
 
 	return *data;
