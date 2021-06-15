Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A50CC48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5531B61428
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhFOHyS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:54:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46204 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230365AbhFOHyQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Jun 2021 03:54:16 -0400
Received: from localhost.localdomain (unknown [223.106.58.132])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb0MlXMhgEIYRAA--.22883S3;
        Tue, 15 Jun 2021 15:52:08 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 1/2] docs/zh_CN: add core api memory_hotplug translation
Date:   Tue, 15 Jun 2021 15:52:39 +0800
Message-Id: <592b325fbc92ac72752b36195718c32763d15ecf.1623743265.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1623743265.git.siyanteng@loongson.cn>
References: <cover.1623743265.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb0MlXMhgEIYRAA--.22883S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4xAw4xGFy7CFyrGFW7Arb_yoWxCry7pa
        sFv3s3Ja1UCa4kuF4Ikr1UWr18Gay8C3y3K397Aw1SvF1UA3yFyF47tFy3Wr9xW34xZFyq
        kF4Yyry0kFyFvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBK14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
        Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
        0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
        AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU=
        =
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/cachetlb.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../zh_CN/core-api/memory-hotplug.rst         | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/memory-hotplug.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index b4bde9396339..14012c5b0f40 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -80,12 +80,12 @@ Todolist:
    :maxdepth: 1
 
    cachetlb
+   memory-hotplug
 
 Todolist:
 
 
    cpu_hotplug
-   memory-hotplug
    genericirq
    protection-keys
 
diff --git a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
new file mode 100644
index 000000000000..35bd8f20a1be
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
@@ -0,0 +1,126 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/cachetlb.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+.. _cn_core-api_memory-hotplug:
+.. _memory_hotplug:
+
+==========
+内存热插拔
+==========
+
+内存热拔插事件通知器
+====================
+
+热插拔事件被发送到一个通知队列中。
+
+在 ``include/linux/memory.h`` 中定义了六种类型的通知：
+
+MEM_GOING_ONLINE
+  在新内存可用之前生成，以便能够为子系统处理内存做准备。页面分配器仍然无法从新
+  的内存中进行分配。
+
+MEM_CANCEL_ONLINE
+  如果MEM_GOING_ONLINE失败，则生成。
+
+MEM_ONLINE
+  当内存成功上线时产生。回调可以从新的内存中分配页面。
+
+MEM_GOING_OFFLINE
+  在开始对内存进行下线处理时生成。从内存中的分配不再可能，但是一些要下线的内存
+  仍然在使用。回调可以用来释放一个子系统在指定内存块中已知的内存。
+
+MEM_CANCEL_OFFLINE
+  如果MEM_GOING_OFFLINE失败，则生成。来自我们试图离线的内存块中的内存又可以使
+  用了。
+
+MEM_OFFLINE
+  在下线内存完成后生成。
+
+一个回调程序可以通过调用::
+
+  hotplug_memory_notifier(callback_func, priority)
+
+优先级数值较高的回调函数在数值较低的回调函数之前被调用。
+
+一个回调函数必须有以下原型::
+
+  int callback_func(
+    struct notifier_block *self, unsigned long action, void *arg);
+
+回调函数的第一个参数（self）是指向回调函数本身的通知器链块的一个指针。第二个参
+数（action）是上述的事件类型之一。第三个参数（arg）传递一个指向
+struct memory_notify的指针::
+
+	struct memory_notify {
+		unsigned long start_pfn;
+		unsigned long nr_pages;
+		int status_change_nid_normal;
+		int status_change_nid_high;
+		int status_change_nid;
+	}
+
+- start_pfn是在线/离线内存的start_pfn。
+
+- nr_pages是在线/离线内存的#页数。
+
+- status_change_nid_normal是当nodemask的N_NORMAL_MEMORY被设置/清除时设置节
+  点id，如果是-1，则nodemask状态不改变。
+
+- status_change_nid_high是当nodemask的N_HIGH_MEMORY被设置/清除时设置的节点
+  id，如果这个值为-1，那么nodemask状态不会改变。
+
+- status_change_nid是当nodemask的N_MEMORY被（将）设置/清除时设置的节点id。这
+  意味着一个新的（无记忆的）节点通过联机获得新的内存，而一个节点失去了所有的内
+  存。如果这个值为-1，那么nodemask的状态就不会改变。
+
+  如果 status_changed_nid* >= 0，回调应该在必要时为节点创建/丢弃结构体。
+
+回调例程应返回 ``include/linux/notifier.h`` 中定义的NOTIFY_DONE, NOTIFY_OK,
+NOTIFY_BAD, NOTIFY_STOP中的一个值。
+
+NOTIFY_DONE和NOTIFY_OK对进一步处理没有影响。
+
+NOTIFY_BAD是作为对MEM_GOING_ONLINE、MEM_GOING_OFFLINE、MEM_ONLINE或MEM_OFFLINE
+动作的回应，用于取消热插拔。它停止对通知队列的进一步处理。
+
+NOTIFY_STOP停止对通知队列的进一步处理。
+
+内部锁
+======
+
+当添加/删除使用内存块设备（即普通RAM）的内存时，device_hotplug_lock应该被保持
+为:
+
+- 针对在线/离线请求进行同步（例如，通过sysfs）。这样一来，内存块设备只有在内存
+  被完全添加后才能被用户空间访问（.online/.state属性）。而在删除内存时，我们知
+  道没有人在关键部分。
+
+- 与CPU热插拔和类似的同步（例如，与ACPI和PPC有关）
+
+特别是，在添加内存和用户空间试图以比预期更快的速度联机该内存时，有可能出现锁反转，
+使用device_hotplug_lock可以避免。:
+
+- device_online()将首先接受device_lock()，然后是mem_hotplug_lock。
+
+- add_memory_resource()将首先使用mem_hotplug_lock，然后是device_lock()（在创
+  建设备时，在bus_add_device()期间）。
+
+由于在使用device_lock()之前，设备对用户空间是可见的，这可能导致锁的反转。
+
+内存的上线/下线应该通过device_online()/device_offline()完成--以确保它与通过
+sysfs进行的操作正确同步。建议持有device_hotplug_lock（例如，保护online_type）。
+
+当添加/删除/上线/下线内存或添加/删除异构/设备内存时，我们应该始终持有写模式的
+mem_hotplug_lock，以序列化内存热插拔（例如访问全局/区域变量）。
+
+此外，mem_hotplug_lock（与device_hotplug_lock相反）在读取模式下允许一个相当
+有效的get_online_mems/put_online_mems实现，所以访问内存的代码可以防止该内存
+消失。
-- 
2.27.0

