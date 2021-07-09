Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544B4C07E9C
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 03:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35EC8613B6
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 03:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhGIDCp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jul 2021 23:02:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46006 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230347AbhGIDCo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:02:44 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx4OKru+dgOBkeAA--.14843S3;
        Fri, 09 Jul 2021 10:59:57 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 1/2] docs/core-api: Modify document layout
Date:   Fri,  9 Jul 2021 11:00:34 +0800
Message-Id: <f151bbc0d1ff6cf24611a698c76b90181f005f8d.1625798719.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1625798719.git.siyanteng@loongson.cn>
References: <cover.1625798719.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Bx4OKru+dgOBkeAA--.14843S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar13tw4UKw1fGw4DAw1fJFb_yoWxZw17pF
        sxXFWSgr1vvFyUC3yIvr48Grn5uFZ5A3y3ArykGrWIyF15CryUCFsxtFyrAFW8GrWkuFyj
        vw1jqr1ru3yDAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjfUOHUqUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Modify the layout of the document and remove unnecessary symbols.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/core-api/cpu_hotplug.rst | 38 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index a2c96bec5ee8..0c872cbea7d5 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -91,9 +91,10 @@ Never use anything other than ``cpumask_t`` to represent bitmap of CPUs.
 
 Using CPU hotplug
 =================
+
 The kernel option *CONFIG_HOTPLUG_CPU* needs to be enabled. It is currently
 available on multiple architectures including ARM, MIPS, PowerPC and X86. The
-configuration is done via the sysfs interface: ::
+configuration is done via the sysfs interface::
 
  $ ls -lh /sys/devices/system/cpu
  total 0
@@ -113,14 +114,14 @@ configuration is done via the sysfs interface: ::
 
 The files *offline*, *online*, *possible*, *present* represent the CPU masks.
 Each CPU folder contains an *online* file which controls the logical on (1) and
-off (0) state. To logically shutdown CPU4: ::
+off (0) state. To logically shutdown CPU4::
 
  $ echo 0 > /sys/devices/system/cpu/cpu4/online
   smpboot: CPU 4 is now offline
 
 Once the CPU is shutdown, it will be removed from */proc/interrupts*,
 */proc/cpuinfo* and should also not be shown visible by the *top* command. To
-bring CPU4 back online: ::
+bring CPU4 back online::
 
  $ echo 1 > /sys/devices/system/cpu/cpu4/online
  smpboot: Booting Node 0 Processor 4 APIC 0x1
@@ -142,6 +143,7 @@ The CPU hotplug coordination
 
 The offline case
 ----------------
+
 Once a CPU has been logically shutdown the teardown callbacks of registered
 hotplug states will be invoked, starting with ``CPUHP_ONLINE`` and terminating
 at state ``CPUHP_OFFLINE``. This includes:
@@ -158,9 +160,10 @@ at state ``CPUHP_OFFLINE``. This includes:
 
 Using the hotplug API
 ---------------------
+
 It is possible to receive notifications once a CPU is offline or onlined. This
 might be important to certain drivers which need to perform some kind of setup
-or clean up functions based on the number of available CPUs: ::
+or clean up functions based on the number of available CPUs::
 
   #include <linux/cpuhotplug.h>
 
@@ -186,9 +189,10 @@ During the removal of a hotplug state the teardown callback will be invoked.
 
 Multiple instances
 ~~~~~~~~~~~~~~~~~~
+
 If a driver has multiple instances and each instance needs to perform the
 callback independently then it is likely that a ''multi-state'' should be used.
-First a multi-state state needs to be registered: ::
+First a multi-state state needs to be registered::
 
   ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "X/Y:online,
                                 Y_online, Y_prepare_down);
@@ -197,7 +201,7 @@ First a multi-state state needs to be registered: ::
 The ``cpuhp_setup_state_multi()`` behaves similar to ``cpuhp_setup_state()``
 except it prepares the callbacks for a multi state and does not invoke
 the callbacks. This is a one time setup.
-Once a new instance is allocated, you need to register this new instance: ::
+Once a new instance is allocated, you need to register this new instance::
 
   ret = cpuhp_state_add_instance(Y_hp_online, &d->node);
 
@@ -206,7 +210,8 @@ This function will add this instance to your previously allocated
 (*Y_online*) on all online CPUs. The *node* element is a ``struct
 hlist_node`` member of your per-instance data structure.
 
-On removal of the instance: ::
+On removal of the instance::
+
   cpuhp_state_remove_instance(Y_hp_online, &d->node)
 
 should be invoked which will invoke the teardown callback on all online
@@ -214,6 +219,7 @@ CPUs.
 
 Manual setup
 ~~~~~~~~~~~~
+
 Usually it is handy to invoke setup and teardown callbacks on registration or
 removal of a state because usually the operation needs to performed once a CPU
 goes online (offline) and during initial setup (shutdown) of the driver. However
@@ -226,6 +232,7 @@ hotplug operations.
 
 The ordering of the events
 --------------------------
+
 The hotplug states are defined in ``include/linux/cpuhotplug.h``:
 
 * The states *CPUHP_OFFLINE* … *CPUHP_AP_OFFLINE* are invoked before the
@@ -248,13 +255,14 @@ another hotplug event.
 
 Testing of hotplug states
 =========================
+
 One way to verify whether a custom state is working as expected or not is to
 shutdown a CPU and then put it online again. It is also possible to put the CPU
 to certain state (for instance *CPUHP_AP_ONLINE*) and then go back to
 *CPUHP_ONLINE*. This would simulate an error one state after *CPUHP_AP_ONLINE*
 which would lead to rollback to the online state.
 
-All registered states are enumerated in ``/sys/devices/system/cpu/hotplug/states``: ::
+All registered states are enumerated in ``/sys/devices/system/cpu/hotplug/states`` ::
 
  $ tail /sys/devices/system/cpu/hotplug/states
  138: mm/vmscan:online
@@ -268,7 +276,7 @@ All registered states are enumerated in ``/sys/devices/system/cpu/hotplug/states
  168: sched:active
  169: online
 
-To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue: ::
+To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue::
 
   $ cat /sys/devices/system/cpu/cpu4/hotplug/state
   169
@@ -276,14 +284,14 @@ To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue: ::
   $ cat /sys/devices/system/cpu/cpu4/hotplug/state
   140
 
-It is important to note that the teardown callbac of state 140 have been
-invoked. And now get back online: ::
+It is important to note that the teardown callback of state 140 have been
+invoked. And now get back online::
 
   $ echo 169 > /sys/devices/system/cpu/cpu4/hotplug/target
   $ cat /sys/devices/system/cpu/cpu4/hotplug/state
   169
 
-With trace events enabled, the individual steps are visible, too: ::
+With trace events enabled, the individual steps are visible, too::
 
   #  TASK-PID   CPU#    TIMESTAMP  FUNCTION
   #     | |       |        |         |
@@ -318,6 +326,7 @@ trace.
 
 Architecture's requirements
 ===========================
+
 The following functions and configurations are required:
 
 ``CONFIG_HOTPLUG_CPU``
@@ -339,11 +348,12 @@ The following functions and configurations are required:
 
 User Space Notification
 =======================
-After CPU successfully onlined or offline udev events are sent. A udev rule like: ::
+
+After CPU successfully onlined or offline udev events are sent. A udev rule like::
 
   SUBSYSTEM=="cpu", DRIVERS=="processor", DEVPATH=="/devices/system/cpu/*", RUN+="the_hotplug_receiver.sh"
 
-will receive all events. A script like: ::
+will receive all events. A script like::
 
   #!/bin/sh
 
-- 
2.27.0

