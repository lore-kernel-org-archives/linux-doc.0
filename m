Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F875C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0977B613B7
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbhDFHDA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:03:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57174 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234018AbhDFHC7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:02:59 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_ciRB2xgbLYEAA--.5852S4;
        Tue, 06 Apr 2021 15:02:46 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 2/8] docs/zh_CN: add cpu-freq cpu-drivers.rst translation
Date:   Tue,  6 Apr 2021 15:02:33 +0800
Message-Id: <20210406070239.19910-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070239.19910-1-siyanteng@loongson.cn>
References: <20210406070239.19910-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_ciRB2xgbLYEAA--.5852S4
X-Coremail-Antispam: 1UD129KBjvAXoW3tFW3ZF4rGr18tF1UWw17Jrb_yoW8Jw1UAo
        WI93yYkF18JryrtF1kAr4UJry7XrnFyF4DAw48GrWa9FyDJF43J34DJw43CF13uF45tF15
        J3Wjqr1rAF1xJr1Un29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUOU7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
        kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
        1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbdOz7UU
        UUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documention/cpu-freq/cpu-drivers.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/cpu-freq/cpu-drivers.rst            | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
new file mode 100644
index 000000000000..27a70f3a9938
--- /dev/null
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -0,0 +1,259 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../cpu-freq/cpu-drivers`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_cpu-drivers.rst:
+
+
+=======================================
+如何实现一个新的CPUFreq处理器驱动程序？
+=======================================
+
+作者:
+
+
+	- Dominik Brodowski  <linux@brodo.de>
+	- Rafael J. Wysocki <rafael.j.wysocki@intel.com>
+	- Viresh Kumar <viresh.kumar@linaro.org>
+
+.. Contents
+
+   1.   怎么做？
+   1.1  初始化
+   1.2  Per-CPU 初始化
+   1.3  验证
+   1.4  target/target_index 或 setpolicy?
+   1.5  target/target_index
+   1.6  setpolicy
+   1.7  get_intermediate 与 target_intermediate
+   2.   频率表助手
+
+
+
+1. 怎么做？
+===========
+
+如此，你刚刚得到了一个全新的CPU/芯片组及其数据手册，并希望为这个CPU/芯片组添加cpufreq
+支持？很好，这里有一些至关重要的提示：
+
+
+1.1 初始化
+----------
+
+首先，在__initcall_level_7 (module_init())或更靠后的函数中检查这个内核是否
+运行在正确的CPU和正确的芯片组上。如果是，则使用cpufreq_register_driver()向
+CPUfreq核心层注册一个cpufreq_driver结构体。
+
+结构体cpufreq_driver应该包含什么成员?
+
+ .name - 驱动的名字。
+
+ .init - 一个指向per-policy初始化函数的指针。
+
+ .verify - 一个指向"verification"函数的指针。
+
+ .setpolicy 或 .fast_switch 或 .target 或 .target_index - 差异见
+ 下文。
+
+并且可选择
+
+ .flags - cpufreq核的提示。
+
+ .driver_data - cpufreq驱动程序的特定数据。
+
+ .resolve_freq - 返回最适合目标频率的频率。不过并不能改变频率。
+
+ .get_intermediate 和 target_intermediate - 用于在改变CPU频率时切换到稳定
+ 的频率。
+
+ .get - 返回CPU的当前频率。
+
+ .bios_limit - 返回HW/BIOS对CPU的最大频率限制值。
+
+ .exit - 一个指向per-policy清理函数的指针，该函数在cpu热插拔过程的CPU_POST_DEAD
+ 阶段被调用。
+
+ .stop_cpu - 一个指向per-policy停止函数的指针，该函数在cpu热插拔过程的CPU_DOWN_PREPARE
+ 阶段被调用。
+
+ .suspend - 一个指向per-policy暂停函数的指针，该函数在关中断且在该策略的调节器停止
+ 后被调用。
+
+ .resume - 一个指向per-policy恢复函数的指针，该函数在关中断且在调节器再一次开始前被
+ 调用。
+
+ .ready - 一个指向per-policy准备函数的指针，该函数在策略完全初始化之后被调用。
+
+ .attr - 一个指向NULL结尾的"struct freq_attr"列表的指针，该函数允许导出值到
+ sysfs。
+
+ .boost_enabled - 如果设置，则启用提升(boost)频率。
+
+ .set_boost - 一个指向per-policy函数的指针，该函数用来开启/关闭提升(boost)频率功能。
+
+
+1.2 Per-CPU 初始化
+------------------
+
+每当一个新的CPU被注册到设备模型中，或者在cpufreq驱动注册自己之后，如果此CPU的cpufreq策
+略不存在，则会调用per-policy的初始化函数cpufreq_driver.init。请注意，.init()和.exit()程序
+只对策略调用一次，而不是对策略管理的每个CPU调用一次。它需要一个 ``struct cpufreq_policy
+*policy`` 作为参数。现在该怎么做呢？
+
+如果有必要，请在你的CPU上激活CPUfreq功能支持。
+
+然后，驱动程序必须填写以下数值:
+
++-----------------------------------+--------------------------------------+
+|policy->cpuinfo.min_freq 和	   |					  |
+|policy->cpuinfo.max_freq	    | 该CPU支持的最低和最高频率（kHz）     |
+|				    |                                      |
+|				    | 				           |
++-----------------------------------+--------------------------------------+
+|policy->cpuinfo.transition_latency |                                      |
+|				    | CPU在两个频率之间切换所需的时间，以  |
+|				    | 纳秒为单位（如适用，否则指定         |
+|				    | CPUFREQ_ETERNAL）                    |
++-----------------------------------+--------------------------------------+
+|policy->cur			    | 该CPU当前的工作频率(如适用)          |
+|				    |                                      |
++-----------------------------------+--------------------------------------+
+|policy->min,			    |					   |
+|policy->max,			    |					   |
+|policy->policy and, if necessary,  |					   |
+|policy->governor		    | 必须包含该cpu的 “默认策略”。稍后     |
+|				    | 会用这些值调用                       |
+|				    | cpufreq_driver.verify and either     |
+|				    | cpufreq_driver.setpolicy or          |
+|				    | cpufreq_driver.target/target_index   |
+|				    | 		                           |
++-----------------------------------+--------------------------------------+
+|policy->cpus			    | 用与这个CPU一起做DVFS的(在线+离线)   |
+|				    | CPU(即与它共享时钟/电压轨)的掩码更新 |
+|				    | 这个                                 |
+|				    |                                      |
++-----------------------------------+--------------------------------------+
+
+对于设置其中的一些值(cpuinfo.min[max]_freq, policy->min[max])，频率表助手可能会有帮
+助。关于它们的更多信息，请参见第2节。
+
+
+1.3 验证
+--------
+
+当用户决定设置一个新的策略(由 “policy,governor,min,max组成”)时，必须对这个策略进行验证，
+以便纠正不兼容的值。为了验证这些值，cpufreq_verify_within_limits(``struct cpufreq_policy
+*policy``, ``unsigned int min_freq``, ``unsigned int max_freq``)函数可能会有帮助。
+关于频率表助手的详细内容请参见第2节。
+
+您需要确保至少有一个有效频率（或工作范围）在 policy->min 和 policy->max 范围内。如果有必
+要，先增加policy->max，只有在没有办法的情况下，才减少policy->min。
+
+
+1.4 target 或 target_index 或 setpolicy 或 fast_switch?
+-------------------------------------------------------
+
+大多数cpufreq驱动甚至大多数cpu频率升降算法只允许将CPU频率设置为预定义的固定值。对于这些，你
+可以使用->target()，->target_index()或->fast_switch()回调。
+
+有些cpufreq功能的处理器可以自己在某些限制之间切换频率。这些应使用->setpolicy()回调。
+
+
+1.5. target/target_index
+------------------------
+
+target_index调用有两个参数：``struct cpufreq_policy * policy``和``unsigned int``
+索引(于列出的频率表)。
+
+当调用这里时，CPUfreq驱动必须设置新的频率。实际频率必须由freq_table[index].frequency决定。
+
+它应该总是在错误的情况下恢复到之前的频率(即policy->restore_freq)，即使我们之前切换到中间频率。
+
+已弃用
+----------
+目标调用有三个参数。``struct cpufreq_policy * policy``, unsigned int target_frequency,
+unsigned int relation.
+
+CPUfreq驱动在调用这里时必须设置新的频率。实际的频率必须使用以下规则来确定。
+
+- 紧跟 "目标频率"。
+- policy->min <= new_freq <= policy->max (这必须是有效的!!!)
+- 如果 relation==CPUFREQ_REL_L，尝试选择一个高于或等于 target_freq 的 new_freq。("L代表
+  最低，但不能低于")
+- 如果 relation==CPUFREQ_REL_H，尝试选择一个低于或等于 target_freq 的 new_freq。("H代表
+  最高，但不能高于")
+
+这里，频率表助手可能会帮助你--详见第2节。
+
+1.6. fast_switch
+----------------
+
+这个函数用于从调度器的上下文进行频率切换。并非所有的驱动都要实现它，因为不允许在这个回调中睡眠。这
+个回调必须经过高度优化，以尽可能快地进行切换。
+
+这个函数有两个参数： ``struct cpufreq_policy *policy`` 和 ``unsigned int target_frequency``。
+
+
+1.7 setpolicy
+-------------
+
+setpolicy调用只需要一个``struct cpufreq_policy * policy``作为参数。需要将处理器内或芯片组内动态频
+率切换的下限设置为policy->min，上限设置为policy->max，如果支持的话，当policy->policy为
+CPUFREQ_POLICY_PERFORMANCE时选择面向性能的设置，当CPUFREQ_POLICY_POWERSAVE时选择面向省电的设置。
+也可以查看drivers/cpufreq/longrun.c中的参考实现。
+
+1.8 get_intermediate 和 target_intermediate
+--------------------------------------------
+
+仅适用于 target_index() 和 CPUFREQ_ASYNC_NOTIFICATION 未设置的驱动。
+
+get_intermediate应该返回一个平台想要切换到的稳定的中间频率，target_intermediate()应该将CPU设置为
+该频率，然后再跳转到'index'对应的频率。核心会负责发送通知，驱动不必在target_intermediate()或
+target_index()中处理。
+
+在驱动程序不想因为某个目标频率切换到中间频率的情况下，它们可以从get_intermediate()中返回'0'。在这种情况
+下，核心将直接调用->target_index()。
+
+注意：->target_index()应该在失败的情况下恢复到policy->restore_freq，因为core会为此发送通知。
+
+
+2. 频率表助手
+=============
+
+由于大多数cpufreq处理器只允许被设置为几个特定的频率，因此，一个带有一些函数的 “频率表”可能会辅助处理器驱动
+程序的一些工作。这样的 "频率表" 由一个cpufreq_frequency_table条目构成的数组组成，"driver_data" 中包
+含了驱动程序的具体数值，"frequency" 中包含了相应的频率，并设置了标志。在表的最后，需要添加一个
+cpufreq_frequency_table条目，频率设置为CPUFREQ_TABLE_END。而如果想跳过表中的一个条目，则将频率设置为
+CPUFREQ_ENTRY_INVALID。这些条目不需要按照任何特定的顺序排序，但如果它们是cpufreq 核心会对它们进行快速的DVFS，
+因为搜索最佳匹配会更快。
+
+如果策略在其policy->freq_table字段中包含一个有效的指针，cpufreq表就会被核心自动验证。
+
+cpufreq_frequency_table_verify()保证至少有一个有效的频率在policy->min和policy->max范围内，并且所有其他
+标准都被满足。这对->verify调用很有帮助。
+
+cpufreq_frequency_table_target()是对应于->target阶段的频率表助手。只要把数值传递给这个函数，这个函数就会返
+回包含CPU要设置的频率的频率表条目。
+
+以下宏可以作为cpufreq_frequency_table的迭代器。
+
+cpufreq_for_each_entry(pos, table) - 遍历频率表的所有条目。
+
+cpufreq_for_each_valid_entry(pos, table) - 该函数遍历所有条目，不包括CPUFREQ_ENTRY_INVALID频率。
+使用参数 "pos"-一个``cpufreq_frequency_table * `` 作为循环变量，使用参数 "table"-作为你想迭代
+的``cpufreq_frequency_table * `` 。
+
+例如::
+
+	struct cpufreq_frequency_table *pos, *driver_freq_table;
+
+	cpufreq_for_each_entry(pos, driver_freq_table) {
+		/* Do something with pos */
+		pos->frequency = ...
+	}
+
+如果你需要在driver_freq_table中处理pos的位置，不要减去指针，因为它的代价相当高。相反，使用宏
+cpufreq_for_each_entry_idx() 和 cpufreq_for_each_valid_entry_idx() 。
-- 
2.25.1

