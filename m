Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785023ED6F;
	Tue,  7 Jul 2026 08:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414437; cv=none; b=pZ7+njBGvsS+ezLqKQT9le/bnQcQEf1RJGUgJrkMAlpP5MXLVrLfjLNKyWt0q+HiClTuQ9USfYGa7+35L8r8jF9a4mSgkU4yd6wZ3WBr8tDywBGzukBFP4U+r7H9DMMa5vFUdCfNaxy7QRIyUOZmGMFFxWBd9zCy9hD9nLV9vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414437; c=relaxed/simple;
	bh=S/pb/9Fi8S+ITROp7jSyIZoncrv3aksYhm9/wmYDMMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Bgc4CcFrSKVpMI3NjAbzYoUAJgThxXiQ+ddHJwKVvFyzBFENvPEqAB7nJjlZxheDE+QHqI7RcqVUF8ZOcRR+cBJ5vt28dgEYap6NauW3CWlskhpNSxEu+v39jjZVm5/Si/yDcAUxLc7lpptdvN1QsYqq7H7Acb8QNK6kzJpWYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 59b43ff079e111f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d048ae7f-8699-4612-b324-1c21b693610b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4bb2c6fcafb04efa138be27e6f3aaf8f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|865|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 59b43ff079e111f1aa26b74ffac11d73-20260707
X-User: luoliang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <luoliang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 683246431; Tue, 07 Jul 2026 16:53:40 +0800
From: luoliang@kylinos.cn
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Luo <luoliang@kylinos.cn>
Subject: [PATCH] sched/doc: Fix stale em_pd_energy() reference in sched-energy
Date: Tue,  7 Jul 2026 16:53:35 +0800
Message-Id: <20260707085335.2942128-1-luoliang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Liang Luo <luoliang@kylinos.cn>

The scheduler energy-aware placement documentation refers to the
em_pd_energy() API, which was renamed to em_cpu_energy() in commit
f0b5694791ce ("PM / EM: change name of em_pd_energy to em_cpu_energy").
Update the reference to the current name.

em_cpu_energy() is the EM helper that compute_energy() in
kernel/sched/fair.c calls to estimate a performance domain's energy
consumption (defined in include/linux/energy_model.h).

Sync the zh_CN translation, which carries the same stale name.

Signed-off-by: Liang Luo <luoliang@kylinos.cn>
---
 Documentation/scheduler/sched-energy.rst                    | 2 +-
 Documentation/translations/zh_CN/scheduler/sched-energy.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-energy.rst b/Documentation/scheduler/sched-energy.rst
index 4e47aaf103eb..83bac0da4869 100644
--- a/Documentation/scheduler/sched-energy.rst
+++ b/Documentation/scheduler/sched-energy.rst
@@ -141,7 +141,7 @@ in its previous activation.
 find_energy_efficient_cpu() uses compute_energy() to estimate what will be the
 energy consumed by the system if the waking task was migrated. compute_energy()
 looks at the current utilization landscape of the CPUs and adjusts it to
-'simulate' the task migration. The EM framework provides the em_pd_energy() API
+'simulate' the task migration. The EM framework provides the em_cpu_energy() API
 which computes the expected energy consumption of each performance domain for
 the given utilization landscape.
 
diff --git a/Documentation/translations/zh_CN/scheduler/sched-energy.rst b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
index fdbf6cfeea93..03dedc69839a 100644
--- a/Documentation/translations/zh_CN/scheduler/sched-energy.rst
+++ b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
@@ -119,7 +119,7 @@ EAS覆盖了CFS的任务唤醒平衡代码。在唤醒平衡时，它使用平
 
 如果唤醒的任务被迁移，find_energy_efficient_cpu()使用compute_energy()来估算
 系统将消耗多少能量。compute_energy()检查各CPU当前的利用率情况，并尝试调整来
-“模拟”任务迁移。EM框架提供了API em_pd_energy()计算每个性能域在给定的利用率条件
+“模拟”任务迁移。EM框架提供了API em_cpu_energy()计算每个性能域在给定的利用率条件
 下的预期能量消耗。
 
 下面详细介绍一个优化能量消耗的任务放置决策的例子。
-- 
2.43.0

