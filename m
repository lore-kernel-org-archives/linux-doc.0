Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107438;
	b=qIsc8w/o13lBd/GC9RHAgIgv82Yn2E2wrJrXztQkSUwyqAB29YPWui2aXQx1dA489XDl
	 iQg4w3YqZzXOygYlhQJT9fnOi5mQDc3i5PUVBnvSRzAWqyok+x1p25VJiqtFggxch7Gak
	 9iEP7dc0X4Bqh2CNc1e4ZSGk9KUq8G0LFHaq/UwjLgMgYPiSZzSJ7BWk9DSa4zFsHPOUU
	 u8Q/EdZR9DPjkZZtjM/Xbu2Duo9SGPsuAdPOPF3b2HUDuPYhEAIW9C0IqumvxdZiweI5g
	 EY//WPZVTttltwZS9QBhmfuHiRh7UXnVpCt2AZ8Tjphg1oHo5KQ10zzKpbr58fWDheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107438;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6tuom3DYsRHEZxkXN0NcdzkCvwTxVz55uLUzNvwJZcI=;
	b=l4/zDbivrEYLR/k7C3Boi14age2yEp/4DqVob+/TqX6MFXpc/BrYI51Eqki/n3x0Po9E
	 NUDv03d6GmTWQxf654Kn3nk+hq/bY+qB1Dth6Z0Npe0saO7qHIBuCFK+0y/XryJYLuKhF
	 MnvKd4rCuMQYBTP+mJPezkAlRtDrVxnQcXsXznGnxRqOaic2UgWYOWl80zFT29TdEVJbs
	 ge5GzTcNbS4MFImo414ePXzEKWYzdbX7usMD1W5qXY8rBOYtOW7kEaXpp3er0Fw0Pa/oW
	 GeZ7o5T52HlQa9BhGgFo88JcFOK4s5x4jgs6D2u99dBWFIYZ76MV+YL8v0kcbffPs1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Nr+kzCwc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735FC606A325;
	Thu, 19 Nov 2026 16:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735FC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Nr+kzCwc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A85E8143D;
	Thu, 19 Nov 2026 08:57:13 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70EB33F673;
	Thu, 19 Nov 2026 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795107436; bh=FHUc48wOcGqKHXbvkuY7DvwDlDPYTESJ3SZKx0LoAg8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Nr+kzCwcDsjWd0JNJY6jKfFf3X//Qw3A3UKxqju9O0S7fr8LFsLoCV0DQ6rY51yGH
	 0+Axm5Cjcv0uaGjPTPS3MXA6gqMZUVqHQ7+fSja1zf2NMI1yBq0mWfcHP+XqKsIbnI
	 ADm1rcJTqOP1oT9hutXofrliy9MNdatyR6ZUnzRs=
Message-ID: <808d038d-e977-407e-90a8-ec241f0d3cf4@arm.com>
Date: Thu, 19 Nov 2026 16:57:13 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] fs/resctrl: Disallow monitor group move when the
 RMID index changes
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, bp@alien8.de, tan.shaopeng@fujitsu.com,
 gshan@redhat.com, jic23@kernel.org, fenghuay@nvidia.com,
 zengheng4@huawei.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-7-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261119094858.813874-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 19/11/2026 09:48, Jinjie Ruan wrote:
> From: Peter Newman <peternewman@google.com>
> 
> A MON group can be moved into the mon_groups directory of another
> CTRL_MON group to move its tasks to that group's allocation while
> keeping their monitoring data. Where the RMID is only meaningful
> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
> extends the PARTID, the move changes the RMID index of the group. The
> move succeeds, but:
> 
> - The group's monitoring data is reset. Its counters are identified by
>   the CLOSID and RMID together, so after the move the group reads the
>   counters of the new CLOSID instead of the ones its tasks used.
> 
> - The group uses an RMID index that was never allocated to it. When
>   the group is removed, free_rmid() puts an RMID index of the new CLOSID
>   into limbo without checking that the group owns it. If another group
>   of that CLOSID holds the index, the limbo handler tests and frees an
>   RMID that is still in use, while the RMID index allocated to the
>   moved group is never freed. If no other group holds it, the index is
>   in use while it is considered free for allocation.
> 
> - The tasks are not moved. mongrp_reparent() sets the new parent and
>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>   to update, and the search then matches on the new CLOSID, which none
>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>   CTRL_MON group's allocation, and the group does not count them.
> 
> Fixing the task move does not make the move work. The RMID index is the
> hardware ID the counters count for, so a group whose CLOSID changes
> cannot keep its monitoring data, and it would need a new RMID index
> allocated for the new CLOSID, which fails when every RMID index of that
> CLOSID is in use. The documentation promises that a move keeps the
> monitoring data, so the move cannot be supported, as decided in the
> thread at the Link tag.
> 
> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
> group, and document that a move is not allowed when the monitoring data
> or assigned tasks would be impacted. Leave the move allowed where the
> RMID does not depend on the CLOSID, such as on x86, and leave renaming
> within the same CTRL_MON group allowed everywhere; neither changes the
> RMID index.
> 
> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
> Signed-off-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/

Looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> ---
> v6:
> - Describe the RMID index that is used while it is considered free, and
>   keep the last paragraph imperative (Reinette).
> v5:
> - Retitle as the RMID index changes, not the RMID, and a rename within
>   the same CTRL_MON group is still allowed.
> - Describe the RMID index that is freed without having been allocated,
>   and why the move cannot be fixed instead of being rejected.
> - Drop the parent and resctrl_arch_mon_capable() checks, which the RMID
>   index comparison and the MON group check already cover.
> - Use the resctrl.rst terms in the last_cmd_status message.
> - Drop the stable version range and the Link tags the changelog did not
>   refer to, and link the decision to reject the move instead.
> - Link to v2: https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/
> v2:
> - Drop the Suggested-by tag.
> - Describe the systems by whether the RMID depends on the CLOSID rather
>   than by MPAM, in both the changelog and resctrl.rst.
> - Explain that moving a monitor group is already broken on these systems
>   because the tasks are not moved, so no existing user relies on it.
> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
> ---
>  Documentation/filesystems/resctrl.rst |  8 ++++----
>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b52795e03303..fecb2cd2b343 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -551,10 +551,10 @@ will automatically remove all MON groups below it.
>  
>  Moving MON group directories to a new parent CTRL_MON group is supported
>  for the purpose of changing the resource allocations of a MON group
> -without impacting its monitoring data or assigned tasks. This operation
> -is not allowed for MON groups which monitor CPUs. No other move
> -operation is currently allowed other than simply renaming a CTRL_MON or
> -MON group.
> +without impacting its monitoring data or assigned tasks. This operation is
> +not allowed for MON groups which monitor CPUs, or when the monitoring data
> +or assigned tasks would be impacted. No other move operation is currently
> +allowed other than simply renaming a CTRL_MON or MON group.
>  
>  All groups contain the following files:
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index c7c4f618208d..e16ae5799e0b 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4403,6 +4403,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
>  		goto out;
>  	}
>  
> +	/*
> +	 * Moving the group to another CTRL_MON group changes its CLOSID.
> +	 * Where the RMID is only meaningful together with the CLOSID, this
> +	 * changes the RMID index and the monitor state cannot follow the
> +	 * move. A rename within the same CTRL_MON group keeps the index.
> +	 */
> +	if (resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
> +		rdt_last_cmd_puts("Moving a MON group to a new CTRL_MON group is not supported\n");
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
>  	/*
>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>  	 * current parent CTRL_MON group and therefore cannot be assigned to

