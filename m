Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686653;
	b=wRigE+ZsuOSoM6ajbzHdOPWVC1YkWBhhX+gATDkpRRCT7DCjNRL/Xk4LUY6jpyhj0qN8
	 1Kr6KI2/bTxu1WZ06Q8CL1HJwiaZLNSw4zNjyjwzkcBvhdlhi/1iKf+FRmCg7gFFSIRYz
	 irq0/k3X7cGTAVkBQ9ViGuPutq5vJ3lsjZ1wQbw7NbSQfp6S9LUUTBIK0t7qfCbJFsykz
	 k+qxqkToZRqEz05nieZ1JuYGT3RB9T/TmFTMZErGZItK1R9Vu/U/UEA+mTa6LUMEXLvdx
	 4f5TCs7iQhWfGYzWurkRseipKZJTUpPKOMOTxAsjuZi68WPrwF/kdWwuh+geXPLKcfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686653;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PcHNOjGg6mWjWyfm+bp/FehoMwcHoyo4XmWU8rkFwfE=;
	b=NsN2G1zkbZoGiwnN0XRR4wZz0I+gdibSABcfToJsDkKX8SrDwMRMBLBjLrbACMAefeAH
	 m7h3Rm0KykdPGiaC8W+ZNKeW1qnal5uIT9W59gQqW/1YVum9cBxHQq9XkHm2Hsj/TyX1C
	 ogdxwWu+slWr9CulZoS4EdBBMARAzjoboNBdehZST5fmL5inLK4EkVk0CYLQ8ssW+1ESB
	 QXY9yJA1yM8CvvbM8w89N18sG63R/xY9RQVc6FjPxI+NOt2mdjUwzPUzQTyVByZHY+ZHs
	 8VpLKeMlpNht3q3AZDOQviv7tETmiyTEwyCWxjzbSOFHz8nBYpiy3NfCKK/Ke0q5jOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O2mHvwLY;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D8606A31C;
	Thu, 26 Nov 2026 09:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O2mHvwLY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PcHNOjGg6mWjWyfm+bp/FehoMwcHoyo4XmWU8rkFwfE=;
	b=O2mHvwLYicVRufjtghpuBHGi68IyFjCJpBpGODJaogNMYUz0nNKlAhE2+4D1EmEfX58pZ8U2b
	C6ag6IR93V/egmATBUkMmqDtZhn+4+KX5ej+hJakQqwSSwmbgDF3YgXhDMrNAQyLFflSUCIBQPi
	Loeilm8lIAsDPJ9dC7pbOfY=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jZsHB5hk1z1prMh;
	Thu, 26 Nov 2026 17:50:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BF4040537;
	Thu, 26 Nov 2026 17:50:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 17:50:47 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <will@kernel.org>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 0/6] fs/resctrl: Fix some resctl bugs related to mpam
Date: Thu, 26 Nov 2026 17:50:32 +0800
Message-ID: <20261126095038.2276975-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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

v6 -> v7:
- State that the stale assignments have no visible effect for clear
  the CDP state after the cleanup (Ben).
- Remove unnecessary line break (Ben).
- Recreate the dirty RMIDs when the CDP state changes (Ben, Reinette).
- Add reviewed-bys.
- v6: https://lore.kernel.org/all/20261119094858.813874-1-ruanjinjie@huawei.com/

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
  fs/resctrl: Recreate the dirty RMIDs when the CDP state changes

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |   8 +-
 fs/resctrl/internal.h                 |   4 +-
 fs/resctrl/monitor.c                  | 183 +++++++++++++++++++++-----
 fs/resctrl/rdtgroup.c                 |  27 +++-
 4 files changed, 183 insertions(+), 39 deletions(-)

-- 
2.34.1

