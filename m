Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92F255F2C;
	Tue, 17 Mar 2026 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768139; cv=none; b=O49z8EhDeYnDUgv+gHvDIfSqtA2Q9WGDu7VB8Pl6OkxHurkfPp0IwabTJx0r34DJ25JnIfYJwfDDq2z2K7uQBxy8ukpLZnXe6O0XiLib4CL12xmfteRHAtIGZina0BWJUcz0GL6jv0B9GhDyZwgM7o96TKp3r/YQYcWNtJLBadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768139; c=relaxed/simple;
	bh=jh2gPRot7MNqrfOgDPkLhGxWii5BtLA90rLtEfEs8oo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRTfWcOomcBbGrNAot0b3fcGFzUTa8Nxu2x7ev5ROWgXx0qy7WiYpDGt15VP+EGINTG+95qlKAH0duK69UAlu6DIEvSlE7+/EY1+bHdUGzM/gJOzkXMq1yav3iPmo0NXJLVtg5Nq8ZSqPOmsCY76yMfzI9rYhmZ+IzV2hevZ+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fZzKG34n7zHnGhy;
	Wed, 18 Mar 2026 01:21:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 556AB40573;
	Wed, 18 Mar 2026 01:22:14 +0800 (CST)
Received: from localhost (10.48.149.62) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Mar
 2026 17:22:12 +0000
Date: Tue, 17 Mar 2026 17:22:09 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 01/40] arm_mpam: Ensure in_reset_state is false after
 applying configuration
Message-ID: <20260317172209.00001ec9@huawei.com>
In-Reply-To: <20260313144617.3420416-2-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
	<20260313144617.3420416-2-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)

On Fri, 13 Mar 2026 14:45:38 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: Zeng Heng <zengheng4@huawei.com>
> 
> The per-RIS flag, in_reset_state, indicates whether or not the MSC
> registers are in reset state, and allows avoiding resetting when they are
> already in reset state. However, when mpam_apply_config() updates the
> configuration it doesn't update the in_reset_state flag and so even after
> the configuration update in_reset_state can be true and mpam_reset_ris()
> will skip the actual register restoration on subsequent resets.
> 
> Once resctrl has a MPAM backend it will use resctrl_arch_reset_all_ctrls()
> to reset the MSC configuration on unmount and, if the in_reset_state flag
> is bogusly true, fail to reset the MSC configuration. The resulting
> non-reset MSC configuration can lead to persistent performance restrictions
> even after resctrl is unmounted.
> 
> Fix by clearing in_reset_state to false immediately after successful
> configuration application, ensuring that the next reset operation
> properly restores MSC register defaults.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Acked-by: Ben Horgan <ben.horgan@arm.com>
> [Horgan: rewrite commit message to not be specific to resctrl unmount]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

