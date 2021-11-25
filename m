Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217C3C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Nov 2021 13:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354881AbhKYNFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355045AbhKYNDw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 08:03:52 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4E7C0613F1
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:27 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id o4so5806729pfp.13
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xGmRSEJ/J1wrUJB2JRC8JBrKDMHQGN9n3ASC40PcKRM=;
        b=Xcun9mU1J+s3GQY51d+HuVvCokI9InO5h0NRHvZasrXZ4+XLc1assyrHMUq8MfGzD5
         CixiC8KBBEAy9bm4arcMwySijjfUI4+YrnAUb7D+0r8sHyz0k5BumObVuyjGYLccGKHw
         bfqRBchegTvo3mpxlP1jKJrIVOu9OAByStvR6943SwTlBJpW+d5wp8H5mjDW+aAw1YMf
         qYHeCo80wTftBWPi+MBE/QIpOKkXQaf3Gq/0W4LJYSHWlgdqZKIF59LK6rqr/QHYsP88
         fqfr9M3SPqmclDeFvMvPeo6kdjSsOQ8K7raUqMkQD+AdtbWZhhI4FNi5PppuM+GHP37Y
         koig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xGmRSEJ/J1wrUJB2JRC8JBrKDMHQGN9n3ASC40PcKRM=;
        b=BaaXhqpkOx8sKI5lbjR5lTENpRUbHijZ9uIYBkDwuVhH3mvNZ3R+nVZvVAoAAZX/+o
         4RIzBEafKL2149R8Q4zUVrA+WVjEUTiL0oRfJHKE37fhSO5wS4D4wJFYKo8eXkNskGA6
         4HbCnhij99yEeX8/rKvveqSSMwCwKQXBAZn4lNLd+Dd3a1s2r7bhhnkQlXGuAqoVA7sM
         FRWCeMclRwIMnhkBCL8KJYryZP0m5JK6Z4vUs01FTTjGIlrFygEcDe0aSoZBW6yfoGGO
         01uTPwvlkwGz0YPjhASnYnjvFKBCuhh4eIfrd50YZR6/95YCw1en6Y3s1G2NJZD8vDeG
         dIJg==
X-Gm-Message-State: AOAM532dFFnZjkxF624CLIzruDV6HyBbRzxvOhE/ui1QGj03Oejq/ASM
        J6mVskKsfut+e9Xil5lz1Lg=
X-Google-Smtp-Source: ABdhPJwOQuWMmlBcN2miOKuG/h9GRs5f0khGKgrzonNk+LIExax3zstypTUqb8cotez5jLqAKrbqdQ==
X-Received: by 2002:a62:7c4b:0:b0:494:66ab:ae0a with SMTP id x72-20020a627c4b000000b0049466abae0amr13989563pfc.18.1637844926818;
        Thu, 25 Nov 2021 04:55:26 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id d7sm3694923pfj.91.2021.11.25.04.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 04:55:26 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH 2/3] docs/zh_CN: add scheduler sched-bwc translation
Date:   Thu, 25 Nov 2021 20:54:04 +0800
Message-Id: <94ee6cdbca40ca276fc13a6bc2827e9096b1fb83.1637843107.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637843107.git.siyanteng@loongson.cn>
References: <cover.1637843107.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../scheduler/sched-bwc.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/scheduler/index.rst    |   1 +
 .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
 2 files changed, 207 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bwc.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index 797df3a9c66f..aba11e561ec3 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -21,6 +21,7 @@ Linux调度器
 
     completion
     sched-arch
+    sched-bwc
 
 
 TODOList:
diff --git a/Documentation/translations/zh_CN/scheduler/sched-bwc.rst b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
new file mode 100644
index 000000000000..07214eea0bce
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
@@ -0,0 +1,206 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/sched-bwc.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_scheduler_sched-bwc.rst:
+
+============
+CFS 频率控制
+============
+
+.. note::
+   本文只讨论了SCHED_NORMAL的CPU频率控制。
+   SCHED_RT的情况在Documentation/scheduler/sched-rt-group.rst中有涉及。
+
+CFS频率控制是一个CONFIG_FAIR_GROUP_SCHED扩展，它允许指定一个组或层次的最大CPU频率。
+
+一个组允许的频率是用配额和周期指定的。在每个给定的”周期“（微秒）内，一个任务组被分配多
+达“配额”微秒的CPU时间。当cgroup中的线程可运行时，该配额以时间片段的方式被分配到每个cpu
+运行队列中。一旦所有的配额被分配，任何额外的配额请求将导致这些线程被限流。被限流的线程将不
+能再次运行，直到下一个时期的配额得到补充。
+
+一个组的未分配配额是全局跟踪的，在每个周期边界被刷新为cfs_quota单元。当线程消耗这个频率时，
+它以需求为基础被转移到cpu-local“筒仓”，在每次更新中转移的数量是可调整的，被描述为“片“（时
+间片）。
+
+突发功能
+--------
+现在这个功能借来的时间是用于防范我们对未来的低估，代价是对其他系统用户的干扰增加。所有这些都
+有很好的限制。
+
+传统的（UP-EDF）频率控制是这样的:
+
+  (U = \Sum u_i) <= 1
+
+这既保证了每个最后期限的实现，也保证了系统的稳定。毕竟，如果U>1，那么每一秒钟的上核时间，我
+们就必须运行超过一秒钟的程序时间，显然会错过我们的最后期限，但下一个最后期限会更远，永远没有
+时间赶上，无边无界的失败。
+
+突发功能观察到工作负载并不总是执行全部配额；这使得人们可以将u_i描述为一个统计分布。
+
+例如，让u_i = {x,e}_i，其中x是p(95)和x+e p(100)（传统的WCET）。这实际上允许u更小，提
+高了效率（我们可以在系统中打包更多的任务），但代价是当所有的概率都一致时，会错过最后期限。然
+而，它确实保持了稳定性，因为只要我们的x高于平均水平，每一次超限都必须与低估相匹配。
+
+也就是说，假设我们有两个任务，都指定了一个p(95)值，那么我们有一个p(95)*p(95)=90.25%的机
+会，两个任务都在他们的配额内，一切都很好。同时，我们有一个p(5)p(5)=0.25%的机会，两个任务同
+时超过他们的配额（保证最后期限失败）。在这两者之间有一个阈值，其中一个超过了，而另一个没有不足，
+无法补偿；这取决于具体的CDFs。
+
+同时，我们可以说，最坏的情况下的截止日期失败，将是Sum e_i；也就是说，有一个有界的迟延（在假
+设x+e确实是WCET的情况下）。
+
+使用突发时的干扰是由错过最后期限的可能性和平均WCET来评价的。测试结果表明，当有许多cgroup或
+CPU未被充分利用时，干扰是有限的。更多的细节显示在：
+https://lore.kernel.org/lkml/5371BD36-55AE-4F71-B9D7-B86DC32E3D2B@linux.alibaba.com/
+
+管理
+----
+配额、周期和突发是在cpu子系统内通过cgroupfs管理的。
+
+.. note::
+   本节描述的cgroupfs文件只适用于cgroup v1.对于cgroup v2，请参阅Control Group v2。
+   :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2-cpu>`.
+
+- cpu.cfs_quota_us：在一个时期内补充的运行时间（微秒）。
+- cpu.cfs_period_us：一个周期的长度（微秒）。
+- cpu.stat: 输出节流统计数据[下面进一步解释]
+- cpu.cfs_burst_us：最大累积运行时间（微秒）。
+
+默认值是::
+
+	cpu.cfs_period_us=100ms
+	cpu.cfs_quota_us=-1
+	cpu.cfs_burst_us=0
+
+cpu.cfs_quota_us的值为-1表示该组没有任何频率限制，这样的组被描述为无限制的频率组。这代表
+了CFS的传统工作保护行为。
+
+写入不小于cpu.cfs_burst_us的任何（有效的）正值将配发指定的频率限制。该配额或周期允许的最
+小配额是1ms。周期长度也有一个1s的上限。当频率限制以分层方式使用时，存在额外的限制，这些在下
+面有更详细的解释。
+
+向cpu.cfs_quota_us写入任何负值都会移除频率限制，并使组再次回到无限制的状态。
+
+cpu.cfs_burst_us的值为0表示该组不能积累任何未使用的频率。它使得CFS的传统频率控制行为没有
+改变。将不大于 cpu.cfs_quota_us 的任何(有效的)正值写入 cpu.cfs_burst_us 将配发未使用
+频率累积的上限。
+
+如果一个组处于受限状态，对该组频率规格的任何更新都将导致其成为无限流状态。
+
+系统范围设置
+------------
+为了提高效率，运行时间在全局池和CPU本地“筒仓”之间以批处理方式转移。这大大减少了大型系统的全
+局核算压力。每次需要进行这种更新时，传输的数量被描述为 "片"。
+
+这是可以通过procfs调整的::
+
+	/proc/sys/kernel/sched_cfs_bandwidth_slice_us (default=5ms)
+
+较大的时间片段值将减少传输开销，而较小的值则允许更精细的消费。
+
+统计
+----
+一个组的频率统计数据通过cpu.stat的5个字段导出。
+
+cpu.stat:
+
+- nr_periods：已经过去的执行间隔的数量。
+- nr_throttled: 该组已被节流/限制的次数。
+- throttled_time: 该组的实体被限流的总时间长度（纳秒）。
+- nr_bursts：突发发生的周期数。
+- burst_time: 任何CPU在各个时期使用超过配额的累计上核时间（纳秒）。
+
+这个接口是只读的。
+
+分层考虑
+--------
+该接口强制要求单个实体的频率总是可以达到的，即：max(c_i) <= C。然而，在总体情况下，是明确
+允许过度订阅的，以便在一个层次结构中实现工作保护语义:
+
+  例如，Sum (c_i)可能超过C
+
+[ 其中C是父方的频率，c_i是其子方的频率。 ]
+
+.. note::
+   译文中的父亲、孩子指的是进程。
+
+有两种方式可以使一个组变得限流:
+
+	a. 它在一段时期内完全消耗自己的配额
+	b. 父方的配额在其期间内全部用完
+
+在上述b)情况下，即使孩子可能有剩余的运行时间，它也不会被允许，直到父亲的运行时间被刷新。
+
+CFS频率配额的注意事项
+---------------------
+一旦一个片断被分配给一个cpu，它就不会过期。然而，如果该cpu上的所有线程都无法运行，那么除了
+1ms以外的所有时间片都可以返回到全局池中。这是在编译时由min_cfs_rq_runtime变量配置的。这
+是一个性能调整，有助于防止对全局锁的额外争夺。
+
+cpu-local分片不会过期的事实导致了一些有趣的罕见案例，应该被理解。
+
+对于cgroup cpu限制的应用程序来说，这是一个相对有意义的问题，因为他们自然会消耗他们的全部配
+额，以及每个cpu-本地片在每个时期的全部。因此，预计nr_periods大致等于nr_throttled，并且
+cpuacct.用量的增加大致等于cfs_quota_us在每个周期的增加。
+
+对于高线程、非cpu绑定的应用程序，这种非过期的细微差别允许应用程序短暂地突破他们的配额限制，
+即任务组正在运行的每个cpu上未使用的片断量（通常每个cpu最多1ms或由min_cfs_rq_runtime定
+义）。这种轻微的突发只适用于配额已经分配给cpu，然后没有完全使用或在以前的时期返回。这个突发
+量不会在核心之间转移。因此，这种机制仍然严格限制任务组的配额平均使用量，尽管是在比单一时期更
+长的时间窗口。这也限制了突发能力，每个cpu不超过1ms。这为在高核数机器上有小配额限制的高线程
+应用提供了更好的更可预测的用户体验。它还消除了在使用低于配额的cpu时对这些应用进行节流的倾向。
+另一种说法是，通过允许一个片断的未使用部分在不同时期保持有效，我们减少了在不需要整个片断的cpu
+时间的cpu-local 筒仓上浪费配额的可能性。
+
+绑定cpu和非绑定cpu的交互式应用之间的互动也应该被考虑，特别是当单核使用率达到100%时。如果你
+给了这些应用程序一半的cpu-core，并且它们都被安排在同一个CPU上，理论上非cpu绑定的应用程序有
+可能在某些时期使用多达1ms的额外配额，从而阻止cpu绑定的应用程序完全使用其配额，这也是同样的数
+量。在这些情况下，将由CFS算法（见CFS调度器）来决定选择哪个应用程序来运行，因为它们都是可运行
+的，并且有剩余的配额。这个运行时间的差异将在接下来的交互式应用程序空闲期间得到弥补。
+
+例子
+----
+1. 限制一个组的运行时间为1个CPU的价值::
+
+	如果周期是250ms，配额也是250ms，那么该组将每250ms获得价值1个CPU的运行时间。
+
+	# echo 250000 > cpu.cfs_quota_us /* quota = 250ms */
+	# echo 250000 > cpu.cfs_period_us /* period = 250ms */
+
+2. 在多CPU机器上，将一个组的运行时间限制为2个CPU的价值
+
+   在500ms周期和1000ms配额的情况下，该组每500ms可以获得2个CPU的运行时间::
+
+	# echo 1000000 > cpu.cfs_quota_us /* quota = 1000ms */
+	# echo 500000 > cpu.cfs_period_us /* period = 500ms */
+
+	这里较大的周期允许增加突发能力。
+
+3. 将一个组限制在1个CPU的20%。
+
+   在50ms周期内，10ms配额将相当于1个CPU的20%。::
+
+	# echo 10000 > cpu.cfs_quota_us /* quota = 10ms */
+	# echo 50000 > cpu.cfs_period_us /* period = 50ms */
+
+   通过在这里使用一个小的周期，我们以牺牲突发容量为代价来确保稳定的延迟响应。
+
+4. 将一个组限制在1个CPU的40%，并允许累积到1个CPU的20%，如果已经累积了的话。
+
+   在50ms周期内，20ms配额将相当于1个CPU的40%。而10毫秒的爆发将相当于1个
+   CPU的20%::
+
+	# echo 20000 > cpu.cfs_quota_us /* quota = 20ms */
+	# echo 50000 > cpu.cfs_period_us /* period = 50ms */
+	# echo 10000 > cpu.cfs_burst_us /* burst = 10ms */
+
+   较大的缓冲区设置（不大于配额）允许更大的突发容量。
-- 
2.27.0

