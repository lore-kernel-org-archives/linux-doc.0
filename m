Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B93233F4;
	Fri,  3 Apr 2026 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195913; cv=none; b=RNzij0txlb649ycCcG5f6wbBZhMNHKtjak8EYOSHN9JQXVb96DamnW9q3T+yGT2QasMEOB8omyyXfFk8u4db1EO9b2P451mv3Dw/2T1EZNVU6k3LvaAdIBjGGoM52FX7tL8gJh3zkwvF5c2h77MsE8IYsLWBW+PAK0g+cPmjRKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195913; c=relaxed/simple;
	bh=GqzjaJLUmYUCS8QADFOZq2Rrfr6Vt8VTEQWyc42krB0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oRfm+eF7F/hdC6DOnBSTV8uznBZ42+M+8B6d5f2+GA3rL5Ff+XpGiPrhcGsbVoxhbayZAWnBscS8xq2oAgqafs82gqdfwLadw6A8ywBE7umN2z1L8eQ0y+p2gO1c15CRuUKO011Od60OpCDJoh+NXmIxYjp34BGd32BsZ31gS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=124.126.103.232
Authentication-Results:smtp.subspace.kernel.org; dkim=permerror (bad message/signature format)
X-UUID: 1d5dfb222f2211f1aa26b74ffac11d73-20260403
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e18052b6-0fca-44c5-b109-a9ebd7919d26,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a987b866f89964e70fda1da2fdd80112,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:850,TC:nil,Content:0|15|52,EDM:-3,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d5dfb222f2211f1aa26b74ffac11d73-20260403
X-User: fangqiurong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <empty.sender@empty.domain>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 744742611; Fri, 03 Apr 2026 13:58:19 +0800
From: fqr <user.email>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	carlos.bilbao@kernel.org,
	avadhut.naik@amd.com
Cc: fangqiurong <fangqiurong@kylinos.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/doc: Update yield_task description in sched-design-CFS
Date: Fri,  3 Apr 2026 13:58:06 +0800
Message-Id: <20260403055806.358921-1-user@fqr-pc>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: fangqiurong <fangqiurong@kylinos.cn>

The yield_task description referenced the long-removed compat_yield
sysctl and described the function as a dequeue/enqueue cycle. Update
it to reflect current behavior: yielding the CPU by moving the
current task's position back in the runqueue.

Sync zh_CN and sp_SP translations.

Signed-off-by: fangqiurong <fangqiurong@kylinos.cn>
---
 Documentation/scheduler/sched-design-CFS.rst                | 5 ++---
 .../translations/sp_SP/scheduler/sched-design-CFS.rst       | 6 +++---
 .../translations/zh_CN/scheduler/sched-design-CFS.rst       | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
index b574a2644c77..03998f6c8f9c 100644
--- a/Documentation/scheduler/sched-design-CFS.rst
+++ b/Documentation/scheduler/sched-design-CFS.rst
@@ -183,9 +183,8 @@ This is the (partial) list of the hooks:
 
  - yield_task(...)
 
-   This function is basically just a dequeue followed by an enqueue, unless the
-   compat_yield sysctl is turned on; in that case, it places the scheduling
-   entity at the right-most end of the red-black tree.
+   This function yields the CPU by moving the currently running task's position back
+   in the runqueue, so that other runnable tasks get scheduled first.
 
  - wakeup_preempt(...)
 
diff --git a/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst b/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
index b35d24464be9..ff0ccbc59183 100644
--- a/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
+++ b/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
@@ -198,9 +198,9 @@ Esta es la lista parcial de llamadas:
 
  - yield_task(...)
 
-   Esta función es básicamente desencolar, seguido por encolar, a menos que
-   sysctl compat_yield esté activado; en ese caso, sitúa la entidad a gestionar
-   en la parte más hacia la derecha del árbol rojo-negro.
+   Esta función cede la CPU desplazando la posición de la tarea actualmente
+   en ejecución hacia atrás en la cola de ejecución, para que otras tareas
+   ejecutables sean planificadas primero.
 
  - check_preempt_curr(...)
 
diff --git a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
index abc6709ec3b2..03691e0309af 100644
--- a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
+++ b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
@@ -144,8 +144,8 @@ array）。
 
  - yield_task(...)
 
-   这个函数的行为基本上是出队，紧接着入队，除非compat_yield sysctl被开启。在那种情况下，
-   它将调度实体放在红黑树的最右端。
+   此函数通过将当前任务在运行队列中的位置后移来让出 CPU，
+   使得其他可运行的任务优先被调度。
 
  - wakeup_preempt(...)
 
-- 
2.25.1

