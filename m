Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02922C4743D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 07:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3C6960FEF
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 07:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFHHXw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 03:23:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60016 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229526AbhFHHXw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Jun 2021 03:23:52 -0400
Received: from localhost.localdomain (unknown [223.106.58.132])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx70KNGr9gxewMAA--.14387S3;
        Tue, 08 Jun 2021 15:21:53 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 1/2] docs/core-api: Modify document layout
Date:   Tue,  8 Jun 2021 15:22:25 +0800
Message-Id: <fda69eb4a88f6dc8cefe75c8d211735ab98f9131.1623136676.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1623136676.git.siyanteng@loongson.cn>
References: <cover.1623136676.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx70KNGr9gxewMAA--.14387S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar13tw4UKw1fGw4DAw1fJFb_yoWxCrWxpF
        sxXFWSgrnYvFyUC3y2vw48Grn5uFZ5A3y3ArykGrWIyF15CryUCFsxtFy5AFW8GrWkuFyj
        vw1jqr1ru3yDAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUU
        U
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Modify the layout of the document and remove unnecessary symbols.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/core-api/cpu_hotplug.rst | 36 ++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index a2c96bec5ee8..46a1d859a099 100644
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
@@ -277,13 +285,13 @@ To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue: ::
   140
 
 It is important to note that the teardown callbac of state 140 have been
-invoked. And now get back online: ::
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

