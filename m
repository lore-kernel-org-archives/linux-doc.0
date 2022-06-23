Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5AAC43334
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbiFWNK4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiFWNKy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:10:54 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3AC3F3388A
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:10:50 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb01VZrRi96hWAA--.32262S3;
        Thu, 23 Jun 2022 21:10:46 +0800 (CST)
Message-ID: <ed10126b-69f4-834d-70fc-bf71a52360f5@loongson.cn>
Date:   Thu, 23 Jun 2022 21:10:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] docs/zh_CN: core-api: Update the translation of
 cpu_hotplug.rst to 5.19-rc3
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <9a123a1938a09f883db0b429396954e0792c84c1.1655863769.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <9a123a1938a09f883db0b429396954e0792c84c1.1655863769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb01VZrRi96hWAA--.32262S3
X-Coremail-Antispam: 1UD129KBjvAXoWfZr1rur4fJFyUGr43XF4fXwb_yoW5Jw17Ko
        Wavr45u395G3s8Ary2yay3Gr4jvw4kAr1kCr13ur42k3ZrGw1SvFWIyw1ayFWFkrs8JF45
        Gr1UJrZ8Kan5uF43n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY-7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUkHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/22 18:18, Binbin Zhou 写道:
> Synchronous translation from upstream commit c9871c800f65
> ("Documentation: core-api/cpuhotplug: Rewrite the API section")
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

Thanks,
Yanteng

> ---
>   .../zh_CN/core-api/cpu_hotplug.rst            | 435 +++++++++++++++---
>   1 file changed, 377 insertions(+), 58 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> index 85a264287426..4772a900c37a 100644
> --- a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> +++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> @@ -4,6 +4,7 @@
>   :翻译:
>   
>    司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>   
>   :校译:
>   
> @@ -15,12 +16,13 @@
>   内核中的CPU热拔插
>   =================
>   
> -:时间: 2016年12月
> +:时间: 2021年9月
>   :作者: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
> -          Rusty Russell <rusty@rustcorp.com.au>,
> -          Srivatsa Vaddagiri <vatsa@in.ibm.com>,
> -          Ashok Raj <ashok.raj@intel.com>,
> -          Joel Schopp <jschopp@austin.ibm.com>
> +       Rusty Russell <rusty@rustcorp.com.au>,
> +       Srivatsa Vaddagiri <vatsa@in.ibm.com>,
> +       Ashok Raj <ashok.raj@intel.com>,
> +       Joel Schopp <jschopp@austin.ibm.com>,
> +       Thomas Gleixner <tglx@linutronix.de>
>   
>   简介
>   ====
> @@ -139,7 +141,7 @@ CPU的热拔插协作
>   下线情况
>   --------
>   
> -一旦CPU被逻辑关闭，注册的热插拔状态的清除回调将被调用，从 ``CPUHP_ONLINE`` 开始，在
> +一旦CPU被逻辑关闭，注册的热插拔状态的清除回调将被调用，从 ``CPUHP_ONLINE`` 开始，到
>   ``CPUHP_OFFLINE`` 状态结束。这包括:
>   
>   * 如果任务因暂停操作而被冻结，那么 *cpuhp_tasks_frozen* 将被设置为true。
> @@ -154,82 +156,399 @@ CPU的热拔插协作
>   * 一旦所有的服务被迁移，内核会调用一个特定的例程 ``__cpu_disable()`` 来进行特定的清
>     理。
>   
> -使用热插拔API
> --------------
> +CPU热插拔API
> +============
> +
> +CPU热拔插状态机
> +---------------
> +
> +CPU热插拔使用一个从CPUHP_OFFLINE到CPUHP_ONLINE的线性状态空间的普通状态机。每个状态都
> +有一个startup和teardown的回调。
> +
> +当一个CPU上线时，将按顺序调用startup回调，直到达到CPUHP_ONLINE状态。当设置状态的回调
> +或将实例添加到多实例状态时，也可以调用它们。
> +
> +当一个CPU下线时，将按相反的顺序依次调用teardown回调，直到达到CPUHP_OFFLINE状态。当删
> +除状态的回调或从多实例状态中删除实例时，也可以调用它们。
> +
> +如果某个使用场景只需要一个方向的热插拔操作回调（CPU上线或CPU下线），则在设置状态时，
> +可以将另一个不需要的回调设置为NULL。
> +
> +状态空间被划分成三个阶段:
> +
> +* PREPARE阶段
> +
> +  PREPARE阶段涵盖了从CPUHP_OFFLINE到CPUHP_BRINGUP_CPU之间的状态空间。
> +
> +  在该阶段中，startup回调在CPU上线操作启动CPU之前被调用，teardown回调在CPU下线操作使
> +  CPU功能失效之后被调用。
> +
> +  这些回调是在控制CPU上调用的，因为它们显然不能在热插拔的CPU上运行，此时热插拔的CPU要
> +  么还没有启动，要么已经功能失效。
> +
> +  startup回调用于设置CPU成功上线所需要的资源。teardown回调用于释放资源或在热插拔的CPU
> +  功能失效后，将待处理的工作转移到在线的CPU上。
> +
> +  允许startup回调失败。如果回调失败，CPU上线操作被中止，CPU将再次被降到之前的状态（通
> +  常是CPUHP_OFFLINE）。
> +
> +  本阶段中的teardown回调不允许失败。
> +
> +* STARTING阶段
> +
> +  STARTING阶段涵盖了CPUHP_BRINGUP_CPU + 1到CPUHP_AP_ONLINE之间的状态空间。
> +
> +  该阶段中的startup回调是在早期CPU设置代码中的CPU上线操作期间，禁用中断的情况下在热拔
> +  插的CPU上被调用。teardown回调是在CPU完全关闭前不久的CPU下线操作期间，禁用中断的情况
> +  下在热拔插的CPU上被调用。
> +
> +  该阶段中的回调不允许失败。
> +
> +  回调用于低级别的硬件初始化/关机和核心子系统。
> +
> +* ONLINE阶段
> +
> +  ONLINE阶段涵盖了CPUHP_AP_ONLINE + 1到CPUHP_ONLINE之间的状态空间。
> +
> +  该阶段中的startup回调是在CPU上线时在热插拔的CPU上调用的。teardown回调是在CPU下线操
> +  作时在热插拔CPU上调用的。
> +
> +  回调是在每个CPU热插拔线程的上下文中调用的，该线程绑定在热插拔的CPU上。回调是在启用
> +  中断和抢占的情况下调用的。
> +
> +  允许回调失败。如果回调失败，CPU热插拔操作被中止，CPU将恢复到之前的状态。
> +
> +CPU 上线/下线操作
> +-----------------
> +
> +一个成功的上线操作如下::
> +
> +  [CPUHP_OFFLINE]
> +  [CPUHP_OFFLINE + 1]->startup()       -> 成功
> +  [CPUHP_OFFLINE + 2]->startup()       -> 成功
> +  [CPUHP_OFFLINE + 3]                  -> 略过，因为startup == NULL
> +  ...
> +  [CPUHP_BRINGUP_CPU]->startup()       -> 成功
> +  === PREPARE阶段结束
> +  [CPUHP_BRINGUP_CPU + 1]->startup()   -> 成功
> +  ...
> +  [CPUHP_AP_ONLINE]->startup()         -> 成功
> +  === STARTUP阶段结束
> +  [CPUHP_AP_ONLINE + 1]->startup()     -> 成功
> +  ...
> +  [CPUHP_ONLINE - 1]->startup()        -> 成功
> +  [CPUHP_ONLINE]
> +
> +一个成功的下线操作如下::
> +
> +  [CPUHP_ONLINE]
> +  [CPUHP_ONLINE - 1]->teardown()       -> 成功
> +  ...
> +  [CPUHP_AP_ONLINE + 1]->teardown()    -> 成功
> +  === STARTUP阶段开始
> +  [CPUHP_AP_ONLINE]->teardown()        -> 成功
> +  ...
> +  [CPUHP_BRINGUP_ONLINE - 1]->teardown()
> +  ...
> +  === PREPARE阶段开始
> +  [CPUHP_BRINGUP_CPU]->teardown()
> +  [CPUHP_OFFLINE + 3]->teardown()
> +  [CPUHP_OFFLINE + 2]                  -> 略过，因为teardown == NULL
> +  [CPUHP_OFFLINE + 1]->teardown()
> +  [CPUHP_OFFLINE]
> +
> +一个失败的上线操作如下::
> +
> +  [CPUHP_OFFLINE]
> +  [CPUHP_OFFLINE + 1]->startup()       -> 成功
> +  [CPUHP_OFFLINE + 2]->startup()       -> 成功
> +  [CPUHP_OFFLINE + 3]                  -> 略过，因为startup == NULL
> +  ...
> +  [CPUHP_BRINGUP_CPU]->startup()       -> 成功
> +  === PREPARE阶段结束
> +  [CPUHP_BRINGUP_CPU + 1]->startup()   -> 成功
> +  ...
> +  [CPUHP_AP_ONLINE]->startup()         -> 成功
> +  === STARTUP阶段结束
> +  [CPUHP_AP_ONLINE + 1]->startup()     -> 成功
> +  ---
> +  [CPUHP_AP_ONLINE + N]->startup()     -> 失败
> +  [CPUHP_AP_ONLINE + (N - 1)]->teardown()
> +  ...
> +  [CPUHP_AP_ONLINE + 1]->teardown()
> +  === STARTUP阶段开始
> +  [CPUHP_AP_ONLINE]->teardown()
> +  ...
> +  [CPUHP_BRINGUP_ONLINE - 1]->teardown()
> +  ...
> +  === PREPARE阶段开始
> +  [CPUHP_BRINGUP_CPU]->teardown()
> +  [CPUHP_OFFLINE + 3]->teardown()
> +  [CPUHP_OFFLINE + 2]                  -> 略过，因为teardown == NULL
> +  [CPUHP_OFFLINE + 1]->teardown()
> +  [CPUHP_OFFLINE]
> +
> +一个失败的下线操作如下::
> +
> +  [CPUHP_ONLINE]
> +  [CPUHP_ONLINE - 1]->teardown()       -> 成功
> +  ...
> +  [CPUHP_ONLINE - N]->teardown()       -> 失败
> +  [CPUHP_ONLINE - (N - 1)]->startup()
> +  ...
> +  [CPUHP_ONLINE - 1]->startup()
> +  [CPUHP_ONLINE]
> +
> +递归失败不能被合理地处理。
> +请看下面的例子，由于下线操作失败而导致的递归失败::
> +
> +  [CPUHP_ONLINE]
> +  [CPUHP_ONLINE - 1]->teardown()       -> 成功
> +  ...
> +  [CPUHP_ONLINE - N]->teardown()       -> 失败
> +  [CPUHP_ONLINE - (N - 1)]->startup()  -> 成功
> +  [CPUHP_ONLINE - (N - 2)]->startup()  -> 失败
> +
> +CPU热插拔状态机在此停止，且不再尝试回滚，因为这可能会导致死循环::
> +
> +  [CPUHP_ONLINE - (N - 1)]->teardown() -> 成功
> +  [CPUHP_ONLINE - N]->teardown()       -> 失败
> +  [CPUHP_ONLINE - (N - 1)]->startup()  -> 成功
> +  [CPUHP_ONLINE - (N - 2)]->startup()  -> 失败
> +  [CPUHP_ONLINE - (N - 1)]->teardown() -> 成功
> +  [CPUHP_ONLINE - N]->teardown()       -> 失败
> +
> +周而复始，不断重复。在这种情况下，CPU留在该状态中::
> +
> +  [CPUHP_ONLINE - (N - 1)]
> +
> +这至少可以让系统取得进展，让用户有机会进行调试，甚至解决这个问题。
> +
> +分配一个状态
> +------------
> +
> +有两种方式分配一个CPU热插拔状态:
> +
> +* 静态分配
> +
> +  当子系统或驱动程序有相对于其他CPU热插拔状态的排序要求时，必须使用静态分配。例如，
> +  在CPU上线操作期间，PERF核心startup回调必须在PERF驱动startup回调之前被调用。在CPU
> +  下线操作中，驱动teardown回调必须在核心teardown回调之前调用。静态分配的状态由
> +  cpuhp_state枚举中的常量描述，可以在include/linux/cpuhotplug.h中找到。
> +
> +  在适当的位置将状态插入枚举中，这样就满足了排序要求。状态常量必须被用于状态的设置
> +  和移除。
> +
> +  当状态回调不是在运行时设置的，并且是kernel/cpu.c中CPU热插拔状态数组初始化的一部分
> +  时，也需要静态分配。
> +
> +* 动态分配
> +
> +  当对状态回调没有排序要求时，动态分配是首选方法。状态编号由setup函数分配，并在成功
> +  后返回给调用者。
> +
> +  只有PREPARE和ONLINE阶段提供了一个动态分配范围。STARTING阶段则没有，因为该部分的大多
> +  数回调都有明确的排序要求。
> +
> +CPU热插拔状态的设置
> +-------------------
> +
> +核心代码提供了以下函数用来设置状态：
> +
> +* cpuhp_setup_state(state, name, startup, teardown)
> +* cpuhp_setup_state_nocalls(state, name, startup, teardown)
> +* cpuhp_setup_state_cpuslocked(state, name, startup, teardown)
> +* cpuhp_setup_state_nocalls_cpuslocked(state, name, startup, teardown)
> +
> +对于一个驱动程序或子系统有多个实例，并且每个实例都需要调用相同的CPU hotplug状态回
> +调的情况，CPU hotplug核心提供多实例支持。与驱动程序特定的实例列表相比，其优势在于
> +与实例相关的函数完全针对CPU hotplug操作进行序列化，并在添加和删除时提供状态回调的
> +自动调用。要设置这样一个多实例状态，可以使用以下函数：
> +
> +* cpuhp_setup_state_multi(state, name, startup, teardown)
> +
> +@state参数要么是静态分配的状态，要么是动态分配状态（PUHP_PREPARE_DYN，CPUHP_ONLINE_DYN）
> +的常量之一， 具体取决于应该分配动态状态的状态阶段（PREPARE，ONLINE）。
> +
> +@name参数用于sysfs输出和检测。命名惯例是"subsys:mode"或"subsys/driver:mode"，
> +例如 "perf:mode"或"perf/x86:mode"。常见的mode名称有：
> +
> +======== ============================================
> +prepare  对应PREPARE阶段中的状态
> +
> +dead     对应PREPARE阶段中不提供startup回调的状态
> +
> +starting 对应STARTING阶段中的状态
> +
> +dying    对应STARTING阶段中不提供startup回调的状态
> +
> +online   对应ONLINE阶段中的状态
> +
> +offline  对应ONLINE阶段中不提供startup回调的状态
> +======== ============================================
> +
> +由于@name参数只用于sysfs和检测，如果其他mode描述符比常见的描述符更好地描述状态的性质，
> +也可以使用。
> +
> +@name参数的示例："perf/online", "perf/x86:prepare", "RCU/tree:dying", "sched/waitempty"
> +
> +@startup参数是一个指向回调的函数指针，在CPU上线操作时被调用。若应用不需要startup
> +回调，则将该指针设为NULL。
> +
> +@teardown参数是一个指向回调的函数指针，在CPU下线操作时调用。若应用不需要teardown
> +回调，则将该指针设为NULL。
> +
> +这些函数在处理已注册回调的方式上有所不同:
> +
> +  * cpuhp_setup_state_nocalls(), cpuhp_setup_state_nocalls_cpuslocked()和
> +    cpuhp_setup_state_multi()只注册回调。
> +
> +  * cpuhp_setup_state()和cpuhp_setup_state_cpuslocked()注册回调，并对当前状态大于新
> +    安装状态的所有在线CPU调用@startup回调（如果不是NULL）。根据状态阶段，回调要么在
> +    当前的CPU上调用（PREPARE阶段），要么在CPU的热插拔线程中调用每个在线CPU（ONLINE阶段）。
> +
> +    如果CPU N的回调失败，那么CPU 0...N-1的teardown回调被调用以回滚操作。状态设置失败，
> +    状态的回调没有被注册，在动态分配的情况下，分配的状态被释放。
> +
> +状态设置和回调调用是针对CPU热拔插操作进行序列化的。如果设置函数必须从CPU热插拔的读
> +锁定区域调用，那么必须使用_cpuslocked()变体。这些函数不能在CPU热拔插回调中使用。
> +
> +函数返回值：
> +  ======== ==========================================================
> +  0        静态分配的状态设置成功
> +
> +  >0       动态分配的状态设置成功
> +
> +           返回的数值是被分配的状态编号。如果状态回调后来必须被移除，
> +           例如模块移除，那么这个数值必须由调用者保存，并作为状态移
> +           除函数的@state参数。对于多实例状态，动态分配的状态编号也
> +           需要作为实例添加/删除操作的@state参数。
> +
> +  <0	   操作失败
> +  ======== ==========================================================
> +
> +移除CPU热拔插状态
> +-----------------
> +
> +为了移除一个之前设置好的状态，提供了如下函数：
> +
> +* cpuhp_remove_state(state)
> +* cpuhp_remove_state_nocalls(state)
> +* cpuhp_remove_state_nocalls_cpuslocked(state)
> +* cpuhp_remove_multi_state(state)
> +
> +@state参数要么是静态分配的状态，要么是由cpuhp_setup_state*()在动态范围内分配
> +的状态编号。如果状态在动态范围内，则状态编号被释放，可再次进行动态分配。
> +
> +这些函数在处理已注册回调的方式上有所不同:
> +
> +  * cpuhp_remove_state_nocalls(), cpuhp_remove_state_nocalls_cpuslocked()
> +    和 cpuhp_remove_multi_state()只删除回调。
> +
> +  * cpuhp_remove_state()删除回调，并调用所有当前状态大于被删除状态的在线CPU的
> +    teardown回调（如果不是NULL）。根据状态阶段，回调要么在当前的CPU上调用
> +    （PREPARE阶段），要么在CPU的热插拔线程中调用每个在线CPU（ONLINE阶段）。
> +
> +    为了完成移除工作，teardown回调不能失败。
> +
> +状态移除和回调调用是针对CPU热拔插操作进行序列化的。如果移除函数必须从CPU hotplug
> +读取锁定区域调用，那么必须使用_cpuslocked()变体。这些函数不能从CPU热插拔的回调中使用。
> +
> +如果一个多实例的状态被移除，那么调用者必须先移除所有的实例。
> +
> +多实例状态实例管理
> +------------------
> +
> +一旦多实例状态被建立，实例就可以被添加到状态中：
>   
> -一旦一个CPU下线或上线，就有可能收到通知。这对某些需要根据可用CPU数量执行某种设置或清
> -理功能的驱动程序来说可能很重要::
> +  * cpuhp_state_add_instance(state, node)
> +  * cpuhp_state_add_instance_nocalls(state, node)
>   
> -  #include <linux/cpuhotplug.h>
> +@state参数是一个静态分配的状态或由cpuhp_setup_state_multi()在动态范围内分配的状
> +态编号。
>   
> -  ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "X/Y:online",
> -                          Y_online, Y_prepare_down);
> +@node参数是一个指向hlist_node的指针，它被嵌入到实例的数据结构中。这个指针被交给
> +多实例状态的回调，可以被回调用来通过container_of()检索到实例。
>   
> -*X* 是子系统， *Y* 是特定的驱动程序。 *Y_online* 回调将在所有在线CPU的注册过程中被调用。
> -如果在线回调期间发生错误， *Y_prepare_down*  回调将在所有之前调用过在线回调的CPU上调
> -用。注册完成后，一旦有CPU上线， *Y_online* 回调将被调用，当CPU关闭时， *Y_prepare_down*
> -将被调用。所有之前在 *Y_online* 中分配的资源都应该在 *Y_prepare_down* 中释放。如果在
> -注册过程中发生错误，返回值 *ret* 为负值。否则会返回一个正值，其中包含动态分配状态
> -（ *CPUHP_AP_ONLINE_DYN* ）的分配热拔插。对于预定义的状态，它将返回0。
> +这些函数在处理已注册回调的方式上有所不同:
>   
> -该回调可以通过调用 ``cpuhp_remove_state()`` 来删除。如果是动态分配的状态
> -（ *CPUHP_AP_ONLINE_DYN* ），则使用返回的状态。在移除热插拔状态的过程中，将调用拆解回调。
> +  * cpuhp_state_add_instance_nocalls()只将实例添加到多实例状态的节点列表中。
>   
> -多个实例
> -~~~~~~~~
> +  * cpuhp_state_add_instance()为所有当前状态大于@state的在线CPU添加实例并调用与
> +    @state相关的startup回调（如果不是NULL）。该回调只对将要添加的实例进行调用。
> +    根据状态阶段，回调要么在当前的CPU上调用（PREPARE阶段），要么在CPU的热插拔线
> +    程中调用每个在线CPU（ONLINE阶段）。
>   
> -如果一个驱动程序有多个实例，并且每个实例都需要独立执行回调，那么很可能应该使用
> -``multi-state`` 。首先需要注册一个多状态的状态::
> +    如果CPU N的回调失败，那么CPU 0 ... N-1的teardown回调被调用以回滚操作，该函数
> +    失败，实例不会被添加到多实例状态的节点列表中。
>   
> -  ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "X/Y:online,
> -                                Y_online, Y_prepare_down);
> -  Y_hp_online = ret;
> +要从状态的节点列表中删除一个实例，可以使用这些函数:
>   
> -``cpuhp_setup_state_multi()`` 的行为与 ``cpuhp_setup_state()`` 类似，只是它
> -为多状态准备了回调，但不调用回调。这是一个一次性的设置。
> -一旦分配了一个新的实例，你需要注册这个新实例::
> +  * cpuhp_state_remove_instance(state, node)
> +  * cpuhp_state_remove_instance_nocalls(state, node)
>   
> -  ret = cpuhp_state_add_instance(Y_hp_online, &d->node);
> +参数与上述cpuhp_state_add_instance*()变体相同。
>   
> -这个函数将把这个实例添加到你先前分配的 ``Y_hp_online`` 状态，并在所有在线的
> -CPU上调用先前注册的回调（ ``Y_online`` ）。 *node* 元素是你的每个实例数据结构
> -中的一个 ``struct hlist_node`` 成员。
> +这些函数在处理已注册回调的方式上有所不同:
>   
> -在移除该实例时::
> +  * cpuhp_state_remove_instance_nocalls()只从状态的节点列表中删除实例。
>   
> -  cpuhp_state_remove_instance(Y_hp_online, &d->node)
> +  * cpuhp_state_remove_instance()删除实例并调用与@state相关的回调（如果不是NULL），
> +    用于所有当前状态大于@state的在线CPU。 该回调只对将要被移除的实例进行调用。
> +    根据状态阶段，回调要么在当前的CPU上调用（PREPARE阶段），要么在CPU的热插拔
> +    线程中调用每个在线CPU（ONLINE阶段）。
>   
> -应该被调用，这将在所有在线CPU上调用拆分回调。
> +    为了完成移除工作，teardown回调不能失败。
>   
> -手动设置
> -~~~~~~~~
> +节点列表的添加/删除操作和回调调用是针对CPU热拔插操作进行序列化。这些函数不能在
> +CPU hotplug回调和CPU hotplug读取锁定区域内使用。
>   
> -通常情况下，在注册或移除状态时调用setup和teamdown回调是很方便的，因为通常在CPU上线
> -（下线）和驱动的初始设置（关闭）时需要执行该操作。然而，每个注册和删除功能也有一个
> -_nocalls的后缀，如果不希望调用回调，则不调用所提供的回调。在手动设置（或关闭）期间，
> -应该使用 ``get_online_cpus()`` 和 ``put_online_cpus()`` 函数来抑制CPU热插拔操作。
> +样例
> +----
>   
> +在STARTING阶段设置和取消静态分配的状态，以获取上线和下线操作的通知::
>   
> -事件的顺序
> -----------
> +   ret = cpuhp_setup_state(CPUHP_SUBSYS_STARTING, "subsys:starting", subsys_cpu_starting, subsys_cpu_dying);
> +   if (ret < 0)
> +        return ret;
> +   ....
> +   cpuhp_remove_state(CPUHP_SUBSYS_STARTING);
>   
> -热插拔状态被定义在 ``include/linux/cpuhotplug.h``:
> +在ONLINE阶段设置和取消动态分配的状态，以获取下线操作的通知::
>   
> -* ``CPUHP_OFFLINE`` ... ``CPUHP_AP_OFFLINE`` 状态是在CPU启动前调用的。
> +   state = cpuhp_setup_state(CPUHP_ONLINE_DYN, "subsys:offline", NULL, subsys_cpu_offline);
> +   if (state < 0)
> +       return state;
> +   ....
> +   cpuhp_remove_state(state);
>   
> -* ``CPUHP_AP_OFFLINE`` ... ``CPUHP_AP_ONLINE`` 状态是在CPU被启动后被调用的。
> -  中断是关闭的，调度程序还没有在这个CPU上活动。从 ``CPUHP_AP_OFFLINE`` 开始，
> -  回调被调用到目标CPU上。
> +在ONLINE阶段设置和取消动态分配的状态，以获取有关上线操作的通知，而无需调用回调::
>   
> -* ``CPUHP_AP_ONLINE_DYN`` 和 ``CPUHP_AP_ONLINE_DYN_END`` 之间的状态被保留
> -  给动态分配。
> +   state = cpuhp_setup_state_nocalls(CPUHP_ONLINE_DYN, "subsys:online", subsys_cpu_online, NULL);
> +   if (state < 0)
> +       return state;
> +   ....
> +   cpuhp_remove_state_nocalls(state);
>   
> -* 这些状态在CPU关闭时以相反的顺序调用，从 ``CPUHP_ONLINE`` 开始，在 ``CPUHP_OFFLINE``
> -  停止。这里的回调是在将被关闭的CPU上调用的，直到 ``CPUHP_AP_OFFLINE`` 。
> +在ONLINE阶段设置、使用和取消动态分配的多实例状态，以获得上线和下线操作的通知::
>   
> -通过 ``CPUHP_AP_ONLINE_DYN`` 动态分配的状态通常已经足够了。然而，如果在启动或关闭
> -期间需要更早的调用，那么应该获得一个显式状态。如果热拔插事件需要相对于另一个热拔插事
> -件的特定排序，也可能需要一个显式状态。
> +   state = cpuhp_setup_state_multi(CPUHP_ONLINE_DYN, "subsys:online", subsys_cpu_online, subsys_cpu_offline);
> +   if (state < 0)
> +       return state;
> +   ....
> +   ret = cpuhp_state_add_instance(state, &inst1->node);
> +   if (ret)
> +        return ret;
> +   ....
> +   ret = cpuhp_state_add_instance(state, &inst2->node);
> +   if (ret)
> +        return ret;
> +   ....
> +   cpuhp_remove_instance(state, &inst1->node);
> +   ....
> +   cpuhp_remove_instance(state, &inst2->node);
> +   ....
> +   remove_multi_state(state);
>   
>   测试热拔插状态
>   ==============

