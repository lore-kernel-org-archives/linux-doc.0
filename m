Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081756;
	b=U4/jorOI5VRvFIuEssPQVbEkwnTD6di3SgEGrWbYcHuDltWgPW3WeCK7PMalYO/6ylyC
	 bG49/F4uTPAJO+yxdhbHjnKcflNFYi3AfQ4CfKC1+lRByx1z6K+hQ9awborJXNrTzDbey
	 RBKrZDzHcFs0bHekD/EJ2N5WXnKPlKX+qo71Fl7tWOnTN+YwX9p7fJ2S0mfwCoyZNzoUJ
	 ezJ/O4W9SkrEzvIeg8P0Cz5rixDfF2hG2HqTnNWTaTGhaQrLgUOL1phiXfa432NavdyfU
	 K9ru+atnZPSvi41Y/Ghjk2GFSsEqoCBjbCLNldz9o1ncjemlS+hMF3/ZanK9m1IrCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081756;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Yu3m+Mi3FUhc4owY3jw1JJ2htm1Y3FreKzqq7UKx3uQ=;
	b=MY4RWr6TdI5CPOGREVvenD7ZUsrpFdmER3RbIlAYVM/WBiJH6jVI0c4QsuOs4EdMeh41
	 icViYiJg8lO5P3bOk+MXe/djwGnhdv7qUEEDJvtJelFvE1PrT9h7JdVwznXDhldUnI3i3
	 EHtlsxHNweLx/2GrtFW6XFrfQnuJ1V0XzmKjE7PJ87P5xwtM1j44tt33sAMmTkdwIsATG
	 WVp8AUGBvkBq+3e3iPZzwayMrCjlLKmPs9bKcwgV2c8jyxuTB2S1zMNm0gECL1W9lPj9F
	 bA2VG2icQaoo6Okl+zDA1n2ZbHfTXuEMlUc1OSp3nN99NMWCty7GIXO3bO/KTsRbZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="4/jd8HNf";
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0768606A326;
	Thu, 19 Nov 2026 09:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0768606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4/jd8HNf
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Yu3m+Mi3FUhc4owY3jw1JJ2htm1Y3FreKzqq7UKx3uQ=;
	b=4/jd8HNf0RVU6EDvn35wleBkNlPq750w+G9+05u54DjRB7wku7zNbYlcJv71vYtRD399glhzN
	WJuYN4AfJWqoZ9xrOP63/WCuN+ANm6BOGX1u9xYEb5Q+oPdzrkmeo0wdGQLAFfzTLIYF+J0QTyv
	Y4TwVoSSYY6maoNOfeEbslA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jVYYw0VYMznTW1;
	Thu, 19 Nov 2026 17:48:20 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 90DD840572;
	Thu, 19 Nov 2026 17:49:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 17:49:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <gshan@redhat.com>, <ben.horgan@arm.com>,
	<jic23@kernel.org>, <fenghuay@nvidia.com>, <zengheng4@huawei.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 3/6] fs/resctrl: Clear the CDP state after the cleanup
Date: Thu, 19 Nov 2026 17:48:55 +0800
Message-ID: <20261119094858.813874-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119094858.813874-1-ruanjinjie@huawei.com>
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

To support CDP, resctrl halves the number of CLOSIDs available to
resource groups and gives each remaining CLOSID two hardware
configurations instead of one, distinguished by index: 2 * CLOSID for
data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
configuration, at index CLOSID. Every architecture computes these
indices the same way.

Unmounting clears the CDP state before it undoes what the groups were
given, so the cleanup computes index CLOSID where the group was set up
with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
left in place and index CLOSID is cleared instead, which with CDP
enabled is a configuration of a different CLOSID. The architecture may
keep this state for as long as the resource exists.

Only MPAM can reach this today. Of everything the cleanup has to undo,
MPAM addresses only the MBM counter assignment by the translated CLOSID,
and it only began doing so when it implemented assignable counters. x86
addresses its counters by RMID alone.

Clear the CDP state after the cleanup, so that the cleanup runs with the
CDP state the groups were set up under.

Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v6:
- Describe the CDP indices as resctrl filesystem behavior that applies
  to every architecture, and the flow instead of the code (Reinette).
- Drop the stable version range, the Fixes tag already gives it.
---
 fs/resctrl/rdtgroup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..3312637fb514 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Clear the CDP state after the cleanup. The CDP state decides
+	 * which hardware configuration a CLOSID refers to, so the teardown
+	 * must run with the state the configuration was created under.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.34.1

