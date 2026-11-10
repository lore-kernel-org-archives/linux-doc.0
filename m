Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323401;
	b=heyjggCiJDjPWcdBHNNt4QtF22voJeZESMrco2DwaEgLaEfe+yOFPSkGPhXp6d7lafek
	 eNEwSySVOV3WCpjYoNIwtBWkMJdkk32XNkyLzjZVPt2XuU2nT2qZIRWyV0eCI3B0qHZTM
	 eacUcCKYSy9f9g8qFg3xfJNTqIMsOjTW0PBM2HWC8CSh8U0B6HKdOP6B1mKLFsOyaTzIB
	 UeqZUlGeK+pOHeNhjpFxBzNTf8Z+TDcWOhsOMHF0tAHeMvYATst7qoMU3oDwtX72lHHJm
	 4AN+kA+llCylGY5g6768yw1NPGYwxq7Otd2lEE8eTQJ7ml0kQahkAjDr+Xb1uOB2pBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
	b=QZdXMGMMk1RCtCszuCc/v+htThGk8GFTTTjg2F6UVGxOtchMAk0Z9zFoZFohrhn1JhSV
	 CqKIYXorN0O8gpoVOyjqn71an5gxeqONJPImeCU/RTeULU6PhUpsKb7UeG0rU+ovxou15
	 l0had09CDtyQI4Ii9EnQUe7FwSeo4AYRbJaUcq/X9iFeODU3TscqzbLYZZifIiL3lAA7m
	 WU7uH1BCUjE81wUutgXDKPpXIETuf2s0LxVGUqfDO/ZKdrnSXXJkiDY3n0KfN0ULftwFW
	 QOOAxm49kbhyRsIwYMxt8s+Dj7HKurkqJPIlZtHH1SypjhTISUMMETms7nep1NsOfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJAYsXDa;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CA606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJAYsXDa
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4abbe52a747so992871fac.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323400; x=1794928200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
        b=bJAYsXDapbx1/QLiNtHVevBiK58yrD1XD/zEMOPwd6rnVtG+ajV/P2QZr2LGYyw4ck
         0UTIVYYFXkkRNzDk+p2umoRDpGF/aYPyPbMMv1FwMY/xDtgsMVuOF3OslQgA5/esyKHN
         JTVnX9Fdn84DqHqy8yoJemjKz1/NU0oIkEXlXb7p2qrSFDi1k2DQX513cksZefXQ+tm3
         lNm9mKtzSwpUWYFfFSmA0wG69Y1euzJzXJf0iYnwJHXp/exahZEbK9oqqzPCLyheWbOP
         sHKhbK0Ez3EHEQpWQd637ZteG3lQhTX9zKFx2X40E5ozYEAewl1PCbOeGqCfTYUwkUkB
         fy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323400; x=1794928200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzDtepYpPhppRO2OekG3HqAvxmazW/tXwsXJOMA5LnU=;
        b=hq9x8CGeanND0pjXvLBnFBToTc6liTjOojo9AT8e+O3ehVtGjZTh29FFcIFLJpS/c+
         TfVgbE7UNyaXgSMT+kz7KBI2rdHGScnqCZ1V1F0S1IVaepyUEcpgmXfD1vVPjQ3vJplI
         w5u9Tqoe50f+flZesKtu6E6zstUzBGxpz2/QsUyf+Xva5pBdGzZlLgg+nIDfEUw0k0hx
         3vdTX7NGR4XMuCJWU/5C4CFlZ/7kbgkeYuzUYgTeKzpKFAjJUbW73ljekxmoab/qRYYI
         tYjAmjJGJG8MmChXrpBTd5e7+4Um/1zAAf3fFG4A45XbWeo3iUaWbY/YSQ/2ML7QRYZn
         sNSw==
X-Forwarded-Encrypted: i=1; AL+hErEP6FLtxw5F33OBtnC19ZovMBdO+ah2ZVioWog+w+9gdAd9IjIsO96z/+jfrrMdGPjXQdnQvuXQ83Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2Tm81WzCAcRYLDIai03445QATPtsOEy8JyYw95PYazx6PZuCW
	vrPpdwiJ6ZaA9JdGuHnj6wjd4aG/N7Z5RAFIxnDRDc2FYkZ8VA7EpuHChT+GzdtG
X-Gm-Gg: AYBFou263O8+oXaZoWg0+cSuqCYEwHvkdKbEbhEdm5Vxw8JW++7OUgk87/byze5ayrE
	jDjqBBZvyqeMXMzcDUMjI3KTAlwvkrFFYLCNvfG1BDBpV/dKgXQsk2fbTAzXWx+M6YHvhKzQdf0
	/uFFThm/+xX8RkCGPX2M4OnsVRmwN4M7AEgVH91nLncio8rlZAVrwo5TEXrM5x2pfE/i8kOxrCz
	3rNfZAcWZ1oa/+Z0yoIVxO09joZdQcEr8gNAo0Lipuy/GZ+xiPMOUv0iOLeZ5V7b+Pp6DfYQiE0
	ZdyMOzOD0LdjeILpm13E4Q3L6RT5RR3ICMu/4jCA6PQcLg1D831kQWwyKK7BgSeU58R5xNi81NB
	MUobpE5auDl55zCASE196UHkhdsMAW0fsnDtHlILNy8qMTJSZ/G0l14QE/XKMOZDWuUkrTnF01l
	Vut1Kyhz9sh9Cb0+hrySceXyHRe1LQRgyNUyPsyY25H2YiJKuTo9L1haOWbGRMP0K1M9rKl4L4Y
	mwucexzV2OLlsjxpYI9DMb75nZrPK0F/g+4AAqxs+sR7MC0e+gLk1BrUSnm4jWUH3V1uwXwAoN9
	UssOCkGMVpKfBi47zfLkxxy1kJfkrz7j/bhWBgcMuzacPDgyeWVwFjiCZAAkUFHP8FDAy9mHsFx
	NWQjphzAk
X-Received: by 2002:a17:903:2a84:b0:2e9:ca71:45f4 with SMTP id d9443c01a7336-2edb91d4de7mr23669695ad.33.1794316927647;
        Tue, 10 Nov 2026 05:22:07 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:07 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 6/7] fs/resctrl: Disallow monitor group move when the RMID index changes
Date: Tue, 10 Nov 2026 21:20:53 +0800
Message-ID: <20261110132054.3702-7-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Peter Newman <peternewman@google.com>

A MON group can be moved into the mon_groups directory of another
CTRL_MON group to move its tasks to that group's allocation while
keeping their monitoring data. Where the RMID is only meaningful
together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
extends the PARTID, the move changes the RMID index of the group. The
move succeeds, but:

- The group's monitoring data is reset. Its counters are identified by
  the CLOSID and RMID together, so after the move the group reads the
  counters of the new CLOSID instead of the ones its tasks used.

- The group uses an RMID index that was never allocated to it. When
  the group is removed, free_rmid() puts an RMID index of the new CLOSID
  into limbo without checking that the group owns it. If another group
  of that CLOSID holds the index, the limbo handler tests and frees an
  RMID that is still in use, while the RMID index allocated to the
  moved group is never freed.

- The tasks are not moved. mongrp_reparent() sets the new parent and
  CLOSID of the group before rdt_move_group_tasks() looks for the tasks
  to update, and the search then matches on the new CLOSID, which none
  of the tasks carries yet. The tasks keep the old CLOSID and the old
  CTRL_MON group's allocation, and the group does not count them.

Fixing the task move does not make the move work. The RMID index is the
hardware ID the counters count for, so a group whose CLOSID changes
cannot keep its monitoring data, and it would need a new RMID index
allocated for the new CLOSID, which fails when every RMID index of that
CLOSID is in use. The documentation promises that a move keeps the
monitoring data, so the move cannot be supported, as decided in the
thread at the Link tag.

Reject the move with -EOPNOTSUPP when it changes the RMID index of the
group, and document that a move is not allowed when the monitoring data
or assigned tasks would be impacted. Where the RMID does not depend on
the CLOSID, such as on x86, the move keeps the same RMID index and is
still allowed. Renaming a MON group within the same CTRL_MON group keeps
the CLOSID and is still allowed everywhere.

Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
Signed-off-by: Peter Newman <peternewman@google.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/
---
v5:
- Retitle as the RMID index changes, not the RMID, and a rename within
  the same CTRL_MON group is still allowed.
- Describe the RMID index that is freed without having been allocated,
  and why the move cannot be fixed instead of being rejected.
- Drop the parent and resctrl_arch_mon_capable() checks, which the RMID
  index comparison and the MON group check already cover.
- Use the resctrl.rst terms in the last_cmd_status message.
- Drop the stable version range and the Link tags the changelog did not
  refer to, and link the decision to reject the move instead.
- Link to v2: https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/
v2:
- Drop the Suggested-by tag.
- Describe the systems by whether the RMID depends on the CLOSID rather
  than by MPAM, in both the changelog and resctrl.rst.
- Explain that moving a monitor group is already broken on these systems
  because the tasks are not moved, so no existing user relies on it.
- v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
---
 Documentation/filesystems/resctrl.rst |  8 ++++----
 fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..fecb2cd2b343 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -551,10 +551,10 @@ will automatically remove all MON groups below it.
 
 Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
-without impacting its monitoring data or assigned tasks. This operation
-is not allowed for MON groups which monitor CPUs. No other move
-operation is currently allowed other than simply renaming a CTRL_MON or
-MON group.
+without impacting its monitoring data or assigned tasks. This operation is
+not allowed for MON groups which monitor CPUs, or when the monitoring data
+or assigned tasks would be impacted. No other move operation is currently
+allowed other than simply renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b702fe6dbbec..2dfb3b54338a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4403,6 +4403,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/*
+	 * Moving the group to another CTRL_MON group changes its CLOSID.
+	 * Where the RMID is only meaningful together with the CLOSID, this
+	 * changes the RMID index and the monitor state cannot follow the
+	 * move. A rename within the same CTRL_MON group keeps the index.
+	 */
+	if (resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
+	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
+		rdt_last_cmd_puts("Moving a MON group to a new CTRL_MON group is not supported\n");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
 	 * current parent CTRL_MON group and therefore cannot be assigned to
-- 
2.43.0

