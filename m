Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081756;
	b=Enf4qJxvDEIVxU8gFJyRPTqvP72T799NdVECYr3BuynUBr4ld5Znop0DsMWZlhmI2rfU
	 Y3B6nu3mgBVYYDoZjc7T7cnS51jSHVxxE9LpPE43RjmoeLawtg09Sov/FJHym+wH5oxwG
	 axGA/iqbePbyeWBrMn/BtksxGyUh+30TZpgI9WZWNTwfjZ21EB4YugQNoFTMXpOIKuA2X
	 XSB2AY0J5NKXqz32lksRwG6uQQhlLxCiqpS2viQ4Oe1SMUhg2xiIAV0bI6Udn0/o7BjvR
	 zg/eTZSC/56dFUzrLtjcC+z8+Zhq1BKY3kxLpk8S1rfRcW8XJVAHGHC/UcWiz5YZBqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081756;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3HRMsbqq20vvB7iIhIVXozulhrLmJsAwA9yqJMv+v1U=;
	b=tJsnOlI9yNKOZk+Wc9ac8lexmvnU2jyidPOd8ghnoz+mw6+ISfpO2r0RQF4vrAq8a3hH
	 dly1bfrm+mrHJAZGOuQWj1WzKxXvDENRfQYuhfEYKOXIVKaGQN9iHBRqksWK2bq+74IVM
	 ApE2ywdY//ZiOE8vrqZQ4bwULLsQ2EkKzxKAC+j5VtRsxYsqfbpGGTwZ3jk+YFl9Nn7Ji
	 xgS6ESDsh8Uw16YpE395kwf6eHuL7N/hJ1vScgXeELcF9dicqehRMA7ItIqxPMgCmKO9H
	 P8X321zVGbQvlgt4XlxcgTpZNH41fLh9ogXJLkTa1+0KmRkdWrnHfDgTvl8mD+g89bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=movk9P5H;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999B606A324;
	Thu, 19 Nov 2026 09:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7999B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=movk9P5H
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3HRMsbqq20vvB7iIhIVXozulhrLmJsAwA9yqJMv+v1U=;
	b=movk9P5HZ7xWiYgX774ITct4Wm2Y49l13UzOCTVjG2FQcFEOii8CWo0j+k4YV4F+eorxT98Lu
	W3VMu2BFiyuBFaEDvwDQGePNDWF37wFAzJ5qONApUIoiyqfwGhoJwPzRMjwEmozkKZ6UajG6XUU
	f07rTaxTWr0YzrtbV8qapMU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jVYZc084tzKm4h;
	Thu, 19 Nov 2026 17:48:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 07EA74048B;
	Thu, 19 Nov 2026 17:49:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 17:49:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <gshan@redhat.com>, <ben.horgan@arm.com>,
	<jic23@kernel.org>, <fenghuay@nvidia.com>, <zengheng4@huawei.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 0/6] fs/resctrl: Fix some resctl bugs related to mpam
Date: Thu, 19 Nov 2026 17:48:52 +0800
Message-ID: <20261119094858.813874-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

And do not allow monitor group move when the RMID index changes.

These fixes are split out of the v10 Narrow-PARTID series below.
	https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

v5 RESEND -> v6:
- Drop the moveable_mon_group interface to be discussed widely.
- Updated variable and function name, commit message, comments (Reinette).
- Remove cdp hook and instead check whether all resource CDPs are
  enabled and add a comment (Reinette, Ben).
- Add reviewed-by.
- v5 RESEND: https://lore.kernel.org/all/20261110133938.3768632-1-ruanjinjie@huawei.com/

v5 -> v5 RESEND:
- resend because of email problem.

Changes in v5:
- Update and split the patch as Reinette and Ben suggested.
- Adjust the commit message.
- Add Reviewed-by.
- Link to v4:
  - https://lore.kernel.org/all/20261105070934.2258613-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Jinjie Ruan (5):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Clear the CDP state after the cleanup
  fs/resctrl: Stop the limbo handler while resctrl is unmounted
  fs/resctrl: Release the limbo RMIDs when the CDP state changes

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |   8 +-
 fs/resctrl/internal.h                 |   4 +-
 fs/resctrl/monitor.c                  | 160 +++++++++++++++++++++-----
 fs/resctrl/rdtgroup.c                 |  27 ++++-
 4 files changed, 160 insertions(+), 39 deletions(-)

-- 
2.34.1

