Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2FDC4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiLJD0k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiLJD0j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:26:39 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29C42286D2
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:26:37 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Dxfett_JNjR5gEAA--.10725S3;
        Sat, 10 Dec 2022 11:26:37 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxoOJq_JNjyPIpAA--.37251S5;
        Sat, 10 Dec 2022 11:26:36 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 13/13] docs/zh_CN: Update the translation of energy-model to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:27:05 +0800
Message-Id: <06df12357d64d602a4dfb10a025a7520daeb3ba0.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxoOJq_JNjyPIpAA--.37251S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jw4kZFW5ZF18ur43Zw4fZrb_yoWxXFy3pa
        s2g34Sqw47AFyqvrykua48Xw1xGFWxAw429Fs7Ga43Xr15tFZ0yw4Yya43XFW7X34jyFyq
        yFZ8uayIyry2ywUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b-xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW3AVW8Xw1lYx0E
        x4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUx_-BDUUUU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit c5d39fae8992 ("Documentation: EM: Switch to
micro-Watts scale")

commit f48a0c475c2a ("Documentation: EM: Describe new registration
method using DT")
commit 75a3a99a5a98 ("PM: EM: Change the order of arguments in the
.active_power() callback")
commit 015f569c4649 ("Documentation: EM: Add artificial EM
registration description")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/power/energy-model.rst | 36 ++++++++++++++-----
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_CN/power/energy-model.rst b/Documentation/translations/zh_CN/power/energy-model.rst
index c7da1b6aefee..48849919d8aa 100644
--- a/Documentation/translations/zh_CN/power/energy-model.rst
+++ b/Documentation/translations/zh_CN/power/energy-model.rst
@@ -23,15 +23,15 @@
 实现支持，EM框架作为一个抽象层介入，它在内核中对功率成本表的格式进行标准化，
 因此能够避免多余的工作。
 
-功率值可以用毫瓦或“抽象刻度”表示。多个子系统可能使用EM，由系统集成商来检查
+功率值可以用微瓦或“抽象刻度”表示。多个子系统可能使用EM，由系统集成商来检查
 功率值刻度类型的要求是否满足。可以在能量感知调度器的文档中找到一个例子
 Documentation/scheduler/sched-energy.rst。对于一些子系统，比如热能或
 powercap，用“抽象刻度”描述功率值可能会导致问题。这些子系统对过去使用的功率的
-估算值更感兴趣，因此可能需要真实的毫瓦。这些要求的一个例子可以在智能功率分配
+估算值更感兴趣，因此可能需要真实的微瓦。这些要求的一个例子可以在智能功率分配
 Documentation/driver-api/thermal/power_allocator.rst文档中找到。
 
 内核子系统可能（基于EM内部标志位）实现了对EM注册设备是否具有不一致刻度的自动
-检查。要记住的重要事情是，当功率值以“抽象刻度”表示时，从中推导以毫焦耳为单位
+检查。要记住的重要事情是，当功率值以“抽象刻度”表示时，从中推导以微焦耳为单位
 的真实能量消耗是不可能的。
 
 下图描述了一个驱动的例子（这里是针对Arm的，但该方法适用于任何体系结构），它
@@ -89,20 +89,40 @@ Documentation/driver-api/thermal/power_allocator.rst文档中找到。
 驱动程序应通过以下API将性能域注册到EM框架中::
 
   int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
-		struct em_data_callback *cb, cpumask_t *cpus, bool milliwatts);
+		struct em_data_callback *cb, cpumask_t *cpus, bool microwatts);
 
 驱动程序必须提供一个回调函数，为每个性能状态返回<频率,功率>元组。驱动程序
 提供的回调函数可以自由地从任何相关位置（DT、固件......）以及以任何被认为是
 必要的方式获取数据。只有对于CPU设备，驱动程序必须使用cpumask指定性能域的CPU。
 对于CPU以外的其他设备，最后一个参数必须被设置为NULL。
 
-最后一个参数“milliwatts”（毫瓦）设置成正确的值是很重要的，使用EM的内核
+最后一个参数“microwatts”（微瓦）设置成正确的值是很重要的，使用EM的内核
 子系统可能会依赖这个标志来检查所有的EM设备是否使用相同的刻度。如果有不同的
-刻度，这些子系统可能决定：返回警告/错误，停止工作或崩溃（panic）。
+刻度，这些子系统可能决定返回警告/错误，停止工作或崩溃（panic）。
 
 关于实现这个回调函数的驱动程序的例子，参见第3节。或者在第2.4节阅读这个API
 的更多文档。
 
+使用DT的EM注册
+==============
+
+EM也可以使用OPP框架和DT "操作点-v2 "中的信息注册。DT中的每个OPP条目都可
+以用一个包含微瓦特功率值的属性 "op-microwatt "来扩展。这个OPP DT属性允
+许平台注册反映总功率（静态+动态）的EM功率值。这些功率值可能直接来自实验和
+测量。
+
+“人工”EM的注册
+==============
+
+有一个选项可以为缺少关于每个性能状态的功率值的详细知识的驱动程序提供一个自
+定义回调。回调.get_cost()是可选的，它提供EAS使用的“成本”值。这对那些只提
+供CPU类型之间相对效率信息的平台很有用，人们可以利用这些信息来创建一个抽象的
+功率模型。但是，考虑到输入功率值的大小限制，即使是抽象的功率模型有时也很难装
+进去。.get_cost()允许提供反映CPU效率的“成本”值。这将允许提供EAS信息，它
+与EM内部计算'成本'值的公式有不同的关系。要为这样的平台注册EM，驱动程序必须
+将标志“microwatts”设置为0，提供.get_power()回调和.get_cost()回调。EM
+框架会在注册过程中正确处理这样的平台。这种平台会被设置EM_PERF_DOMAIN_ARTIFICIAL
+标志。其他使用EM的框架应该特别注意测试和正确对待这个标志。
 
 “简单”EM的注册
 ~~~~~~~~~~~~~~~~
@@ -147,8 +167,8 @@ cpufreq_driver::register_em()。这个回调必须为每个特定的驱动程序
 
   -> drivers/cpufreq/foo_cpufreq.c
 
-  01	static int est_power(unsigned long *mW, unsigned long *KHz,
-  02			struct device *dev)
+  01   static int est_power(struct device *dev, unsigned long *mW,
+  02                   unsigned long *KHz)
   03	{
   04		long freq, power;
   05
-- 
2.31.1

