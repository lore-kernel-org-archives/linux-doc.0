Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7617198D
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 18:08:55 -0800 (PST)
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ScZy75z8dzWhfR;
	Sat, 25 Nov 2023 10:08:15 +0800 (CST)
Received: from huawei.com (10.67.174.93) by kwepemm000004.china.huawei.com
 (7.193.23.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 25 Nov
 2023 10:08:52 +0800
From: Wenyu Huang <huangwenyu5@huawei.com>
To: <corbet@lwn.net>, <alexs@kernel.org>, <siyanteng@loongson.cn>
CC: <mingo@kernel.org>, <peterz@infradead.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH] sched/eevdf/doc: Modify the list of hooks and synchronize Chinese version
Date: Sat, 25 Nov 2023 02:05:27 +0000
Message-ID: <20231125020527.965230-1-huangwenyu5@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected

commit e23edc86b09d ("sched/fair: Rename check_preempt_curr() to
wakeup_preempt()") renamed the check_preempt_curr() to wakeup_preempt().

commit 03b7fad167ef ("sched: Add task_struct pointer to sched_class::set_curr_task")
renamed the 'set_curr_task' to 'set_next_task'.

They didn't modify the documentation. Now I modify them.

commit 2f88c8e802c8 ("sched/eevdf/doc: Modify the documented knob to
base_slice_ns as well") renamed the 'min_granularity_ns' sysctl to 'base_slice_ns'
, but the Chinese translation doesn't rename it.

Fixes: e23edc86b09d ("sched/fair: Rename check_preempt_curr() to wakeup_preempt()")
Fixes: 03b7fad167ef ("sched: Add task_struct pointer to sched_class::set_curr_task")
Fixes: 2f88c8e802c8 ("sched/eevdf/doc: Modify the documented knob to base_slice_ns as well")

Signed-off-by: Wenyu Huang <huangwenyu5@huawei.com>
---
 Documentation/scheduler/sched-design-CFS.rst              | 8 ++++----
 .../translations/zh_CN/scheduler/sched-design-CFS.rst     | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
index f68919800f05..6cffffe26500 100644
--- a/Documentation/scheduler/sched-design-CFS.rst
+++ b/Documentation/scheduler/sched-design-CFS.rst
@@ -180,7 +180,7 @@ This is the (partial) list of the hooks:
    compat_yield sysctl is turned on; in that case, it places the scheduling
    entity at the right-most end of the red-black tree.
 
- - check_preempt_curr(...)
+ - wakeup_preempt(...)
 
    This function checks if a task that entered the runnable state should
    preempt the currently running task.
@@ -189,10 +189,10 @@ This is the (partial) list of the hooks:
 
    This function chooses the most appropriate task eligible to run next.
 
- - set_curr_task(...)
+ - set_next_task(...)
 
-   This function is called when a task changes its scheduling class or changes
-   its task group.
+   This function is called when a task changes its scheduling class, changes
+   its task group or is scheduled.
 
  - task_tick(...)
 
diff --git a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
index 3076402406c4..abc6709ec3b2 100644
--- a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
+++ b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
@@ -80,7 +80,7 @@ p->se.vruntime。一旦p->se.vruntime变得足够大，其它的任务将成为
 CFS使用纳秒粒度的计时，不依赖于任何jiffies或HZ的细节。因此CFS并不像之前的调度器那样
 有“时间片”的概念，也没有任何启发式的设计。唯一可调的参数（你需要打开CONFIG_SCHED_DEBUG）是：
 
-   /sys/kernel/debug/sched/min_granularity_ns
+   /sys/kernel/debug/sched/base_slice_ns
 
 它可以用来将调度器从“桌面”模式（也就是低时延）调节为“服务器”（也就是高批处理）模式。
 它的默认设置是适合桌面的工作负载。SCHED_BATCH也被CFS调度器模块处理。
@@ -147,7 +147,7 @@ array）。
    这个函数的行为基本上是出队，紧接着入队，除非compat_yield sysctl被开启。在那种情况下，
    它将调度实体放在红黑树的最右端。
 
- - check_preempt_curr(...)
+ - wakeup_preempt(...)
 
    这个函数检查进入可运行状态的任务能否抢占当前正在运行的任务。
 
@@ -155,9 +155,9 @@ array）。
 
    这个函数选择接下来最适合运行的任务。
 
- - set_curr_task(...)
+ - set_next_task(...)
 
-   这个函数在任务改变调度类或改变任务组时被调用。
+   这个函数在任务改变调度类，改变任务组时，或者任务被调度时被调用。
 
  - task_tick(...)
 
-- 
2.34.1

