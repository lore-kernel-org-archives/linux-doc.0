Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036EEC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD121611F1
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhELH0U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 03:26:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38506 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229627AbhELH0U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 03:26:20 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjNgptgW14VAA--.28636S2;
        Wed, 12 May 2021 15:25:03 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/zh_CN: add core api kobject translation
Date:   Wed, 12 May 2021 15:25:43 +0800
Message-Id: <20210512072543.4188612-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxzcjNgptgW14VAA--.28636S2
X-Coremail-Antispam: 1UD129KBjvAXoWfCFWrXFyUGF1ktFW7JrWUJwb_yoW8tryxWo
        WjvrWakwn5AFyrtFyktwsxKrWUAF15KFWjyws3W3sxAw1UGr1rXr1xJw13tr17ZrZ8CF15
        JFyxX34a9a43Ja1Un29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYc7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
        fUoOJ5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/kobject.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   6 +-
 .../translations/zh_CN/core-api/kobject.rst   | 379 ++++++++++++++++++
 2 files changed, 384 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/kobject.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index f1fa71e45c77..b4cfb4adfcc3 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -32,9 +32,13 @@ Todolist:
 
 在整个内核中使用的函数库。
 
-Todolist:
+.. toctree::
+   :maxdepth: 1
 
    kobject
+
+Todolist:
+
    kref
    assoc_array
    xarray
diff --git a/Documentation/translations/zh_CN/core-api/kobject.rst b/Documentation/translations/zh_CN/core-api/kobject.rst
new file mode 100644
index 000000000000..ac75fbe04007
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/kobject.rst
@@ -0,0 +1,379 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/kobject.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_core_api_kobject.rst:
+
+=======================================================
+关于kobjects、ksets和ktypes的一切你没想过需要了解的东西
+=======================================================
+
+:作者: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+:最后一次更新: December 19, 2007
+
+根据Jon Corbet于2003年10月1日为lwn.net撰写的原创文章改编，网址是：
+https://lwn.net/Articles/51437/
+
+理解驱动模型和建立在其上的kobject抽象的部分的困难在于，没有明显的下手点。
+处理kobjects需要理解一些不同的类型，所有这些类型都会相互引用。为了使事情
+变得更简单，我们将采取一种多途径的方法，从模糊的术语开始，并在我们进行过
+程中适当的时候增加细节。为此，这里有一些我们将要使用的术语的快速定义。
+
+ - 一个kobject是一个struct kobject类型的对象。Kobjects有一个名字和一个
+   引用计数。一个kobject也有一个父指针（允许对象被排列成层次结构），一个
+   特定的类型，并且，通常在sysfs虚拟文件系统中表示。
+
+  Kobjects本身通常并不有趣；相反，它们通常被嵌入到其他结构体中，这些结构
+  体包含代码真正感兴趣的东西。
+
+  任何结构体都不应该有一个以上的kobject嵌入其中。如果有的话，对象的引用计
+  数肯定会被打乱，而且不正确，你的代码就会出现错误。所以不要这样做。
+
+ - ktype是嵌入一个kobject的对象的类型。每个嵌入kobject的结构体都需要一个
+   相应的ktype。ktype控制着kobject在被创建和销毁时的情况。
+
+ - 一个kset是一组kobjects。这些kobjects可以是相同的ktype或者属于不同的
+   ktype。kset是kobjects集合的基本容器类型。Ksets包含它们自己的kobjects，
+   但你可以安全地忽略这个实现细节，因为kset的核心代码会自动处理这个kobject。
+
+ 当你看到一个下面全是其他目录的sysfs目录时，通常这些目录中的每一个都对应
+ 于同一个kset中的一个kobject。
+
+ 我们将研究如何创建和操作所有这些类型。将采取一种自下而上的方法，所以我们
+ 将回到kobjects。
+
+
+嵌入kobjects
+=============
+
+内核代码很少创建孤立的kobject，只有一个重要的例外，下面会解释。相反，
+kobjects被用来控制对一个更大的、特定领域的对象的访问。为此，kobjects会被
+嵌入到其他结构中。如果你习惯于用面向对象的术语来思考问题，那么kobjects可
+以被看作是一个顶级的抽象类，其他的类都是从它派生出来的。一个kobject实现了
+一系列的功能，这些功能本身并不特别有用，但在其他对象中却很好用。C语言不允
+许直接表达继承，所以必须使用其他技术——比如结构体嵌入。
+
+作为一个旁观者，对于那些熟悉内核链表实现的人来说，这类似于“list_head”结
+构本身很少有用，但总是被嵌入到感兴趣的更大的对象中）。
+
+例如， ``drivers/uio/uio.c`` 中的IO代码有一个结构体，定义了与uio设备相
+关的内存区域::
+
+    struct uio_map {
+            struct kobject kobj;
+            struct uio_mem *mem;
+    };
+
+如果你有一个uio_map结构体，找到其嵌入的kobject只是一个使用kobj成员的问题。
+然而，与kobjects一起工作的代码往往会遇到相反的问题：给定一个结构体kobject
+的指针，指向包含结构体的指针是什么？你必须避免使用一些技巧（比如假设
+kobject在结构的开头），相反，你得使用container_of()宏，其可以在 ``<linux/kernel.h>``
+中找到::
+
+    container_of(ptr, type, member)
+
+其中:
+
+  * ``ptr`` 是一个指向嵌入kobject的指针，
+  * ``type`` 是包含结构体的类型，
+  * ``member`` 是 ``指针`` 所指向的结构体域的名称。
+
+container_of()的返回值是一个指向相应容器类型的指针。因此，例如，一个嵌入到
+uio_map结构 **中** 的kobject结构体的指针kp可以被转换为一个指向 **包含** uio_map
+结构体的指针，方法是::
+
+    struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
+
+为了方便起见，程序员经常定义一个简单的宏，用于将kobject指针 **反推** 到包含
+类型。在早期的 ``drivers/uio/uio.c`` 中正是如此，你可以在这里看到::
+
+    struct uio_map {
+            struct kobject kobj;
+            struct uio_mem *mem;
+    };
+
+    #define to_map(map) container_of(map, struct uio_map, kobj)
+
+其中宏的参数“map”是一个指向有关的kobject结构体的指针。该宏随后被调用::
+
+    struct uio_map *map = to_map(kobj);
+
+
+kobjects的初始化
+================
+
+当然，创建kobject的代码必须初始化该对象。一些内部字段是通过调用kobject_init()
+来设置的（强制）::
+
+    void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
+
+ktype是正确创建kobject的必要条件，因为每个kobject都必须有一个相关的kobj_type。
+在调用kobject_init()后，为了向sysfs注册kobject，必须调用函数kobject_add()::
+
+    int kobject_add(struct kobject *kobj, struct kobject *parent,
+                    const char *fmt, ...);
+
+这将正确设置kobject的父级和kobject的名称。如果该kobject要与一个特定的kset相关
+联，在调用kobject_add()之前必须分配kobj->kset。如果kset与kobject相关联，那么
+kobject的父级可以在调用kobject_add()时被设置为NULL，那么kobject的父级将是kset
+本身。
+
+由于kobject的名字是在它被添加到内核时设置的，所以kobject的名字不应该被直接操作。
+如果你必须改变kobject的名字，请调用kobject_rename()::
+
+    int kobject_rename(struct kobject *kobj, const char *new_name);
+
+kobject_rename()不执行任何锁，也不知道什么名字是有效的，所以调用者必须提供自己
+的理智检查（调用之前自己想清楚）和序列化。
+
+有一个叫kobject_set_name()的函数，但那是遗留的垃圾，正在被删除。如果你的代码需
+要调用这个函数，那么它是不正确的，需要被修复。
+
+要正确访问kobject的名称，请使用函数kobject_name()::
+
+    const char *kobject_name(const struct kobject * kobj);
+
+有一个辅助函数可以同时初始化和添加kobject到内核中，令人惊讶的是，该函数被称为
+kobject_init_and_add()::
+
+    int kobject_init_and_add(struct kobject *kobj, struct kobj_type *ktype,
+                             struct kobject *parent, const char *fmt, ...);
+
+参数与上面描述的单个kobject_init()和kobject_add()函数相同。
+
+
+Uevents
+=======
+
+当一个kobject被注册到kobject核心后，你需要向全世界宣布它已经被创建了。这可以通
+过调用kobject_uevent()来实现::
+
+    int kobject_uevent(struct kobject *kobj, enum kobject_action action);
+
+当kobject第一次被添加到内核时，使用 *KOBJ_ADD* 行为。这应该在该kobject的任
+何属性或子对象被正确初始化后进行，因为当这个调用发生时，用户空间会立即开始寻
+找它们。
+
+当kobject从内核中移除时（关于如何做的细节在下面）， *KOBJ_REMOVE* 的uevent
+将由kobject核心自动创建，所以调用者不必担心手动操作。
+
+
+引用计数
+========
+
+kobject的关键功能之一是作为它所嵌入的对象的一个引用计数器。只要对该对象的引用
+存在，该对象（以及支持它的代码）就必须继续存在。用于操作kobject的引用计数的低
+级函数是::
+
+    struct kobject *kobject_get(struct kobject *kobj);
+    void kobject_put(struct kobject *kobj);
+
+对kobject_get()的成功调用将增加kobject的引用计数器值并返回kobject的指针。
+
+当引用被释放时，对kobject_put()的调用将递减引用计数值，并可能释放该对象。请注
+意，kobject_init()将引用计数设置为1，所以设置kobject的代码最终需要做一个
+kobject_put()来释放该引用。
+
+因为kobjects是动态的，所以它们不能以静态方式或在堆栈中声明，而总是以动态方式分
+配。未来版本的内核将包含对静态创建的kobjects的运行时检查，并将警告开发者这种不
+正当的使用。
+
+如果你想使用kobject只是为了给你的结构体提供一个引用计数器，请使用struct kref
+来代替；kobject是多余的。关于如何使用结构kref的更多信息，请参见Linux内核源代
+码树中的文件《为内核对象添加引用计数器（krefs）》。
+
+
+创建“简单的”kobjects
+====================
+
+有时，开发者想要的只是在sysfs层次结构中创建一个简单的目录，而不必去搞那些复杂
+的ksets、显示和存储函数，以及其他细节。这是一个应该创建单个kobject的例外。要
+创建这样一个条目（即简单的目录），请使用函数::
+
+    struct kobject *kobject_create_and_add(const char *name, struct kobject *parent);
+
+这个函数将创建一个kobject，并将其放在sysfs中指定的父kobject下面的位置。要创
+建与此kobject相关的简单属性，请使用::
+
+    int sysfs_create_file(struct kobject *kobj, const struct attribute *attr);
+
+或者::
+
+    int sysfs_create_group(struct kobject *kobj, const struct attribute_group *grp);
+
+这里使用的两种类型的属性，与已经用kobject_create_and_add()创建的kobject，
+都可以是kobj_attribute类型，所以不需要创建特殊的自定义属性。
+
+参见示例模块， ``samples/kobject/kobject-example.c`` ，了解一个简单的
+kobject和属性的实现。
+
+
+
+ktypes和释放方法
+================
+
+以上讨论中还缺少一件重要的事情，那就是当一个kobject的引用次数达到零的时候
+会发生什么。创建kobject的代码通常不知道何时会发生这种情况；如果它知道，那
+么首先使用kobject就没有什么意义。当sysfs被引入时，即使是可预测的对象生命
+周期也会变得更加复杂，因为内核的其他部分可以获得在系统中注册的任何kobject
+的引用。
+
+最终的结果是，一个由kobject保护的结构体在其引用计数归零之前不能被释放。引
+用计数不受创建kobject的代码的直接控制。因此，每当它的一个kobjects的最后一
+个引用消失时，必须异步通知该代码。
+
+一旦你通过kobject_add()注册了你的kobject，你绝对不能使用kfree()来直接释
+放它。唯一安全的方法是使用kobject_put()。在kobject_init()之后总是使用
+kobject_put()是一个很好的做法，以避免错误的发生。
+
+这个通知是通过kobject的release()方法完成的。通常这样的方法有如下形式::
+
+    void my_object_release(struct kobject *kobj)
+    {
+            struct my_object *mine = container_of(kobj, struct my_object, kobj);
+
+            /* Perform any additional cleanup on this object, then... */
+            kfree(mine);
+    }
+
+有一点很重要：每个kobject都必须有一个release()方法，而且这个kobject必
+须持续存在（处于一致的状态），直到这个方法被调用。如果这些约束条件没有
+得到满足，那么代码就是有缺陷的。注意，如果你忘记提供release()方法，内
+核会警告你。不要试图通过提供一个 "空 "的释放函数来摆脱这个警告。
+
+如果你的清理函数只需要调用kfree()，那么你必须创建一个包装函数，该函数
+使用container_of()来上传到正确的类型（如上面的例子所示），然后在整个
+结构体上调用kfree()。
+
+注意，kobject的名字在release函数中是可用的，但它不能在这个回调中被改
+变。否则，在kobject核心中会有一个内存泄漏，这让人很不爽。
+
+有趣的是，release()方法并不存储在kobject本身；相反，它与ktype相关。
+因此，让我们引入结构体kobj_type::
+
+    struct kobj_type {
+            void (*release)(struct kobject *kobj);
+            const struct sysfs_ops *sysfs_ops;
+            struct attribute **default_attrs;
+            const struct attribute_group **default_groups;
+            const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
+            const void *(*namespace)(struct kobject *kobj);
+            void (*get_ownership)(struct kobject *kobj, kuid_t *uid, kgid_t *gid);
+    };
+
+这个结构提用来描述一个特定类型的kobject（或者更正确地说，包含对象的
+类型）。每个kobject都需要有一个相关的kobj_type结构；当你调用
+kobject_init()或kobject_init_and_add()时必须指定一个指向该结构的
+指针。
+
+当然，kobj_type结构中的release字段是指向这种类型的kobject的release()
+方法的一个指针。另外两个字段（sysfs_ops 和 default_attrs）控制这种
+类型的对象如何在 sysfs 中被表示；它们超出了本文的范围。
+
+default_attrs 指针是一个默认属性的列表，它将为任何用这个 ktype 注册
+的 kobject 自动创建。
+
+
+ksets
+=====
+
+一个kset仅仅是一个希望相互关联的kobjects的集合。没有限制它们必须是相
+同的ktype，但是如果它们不是相同的，就要非常小心。
+
+一个kset有以下功能:
+
+ - 它像是一个包含一组对象的袋子。一个kset可以被内核用来追踪 "所有块
+   设备" 或 "所有PCI设备驱动"。
+
+ - kset也是sysfs中的一个子目录，与kset相关的kobjects可以在这里显示
+   出来。每个kset都包含一个kobject，它可以被设置为其他kobject的父对象；
+   sysfs层次结构的顶级目录就是以这种方式构建的。
+
+ - Ksets可以支持kobjects的 "热插拔"，并影响uevent事件如何被报告给
+   用户空间。
+
+ 在面向对象的术语中，"kset "是顶级的容器类；ksets包含它们自己的kobject，
+ 但是这个kobject是由kset代码管理的，不应该被任何其他用户所操纵。
+
+ kset在标准的内核链表中保存它的子对象。Kobjects通过其kset字段指向其
+ 包含的kset。在几乎所有的情况下，属于一个kset的kobjects在它们的父
+ 对象中都有那个kset（或者，严格地说，它的嵌入kobject）。
+ 
+ 由于kset中包含一个kobject，它应该总是被动态地创建，而不是静态地
+ 或在堆栈中声明。要创建一个新的kset，请使用::
+
+  struct kset *kset_create_and_add(const char *name,
+                                   const struct kset_uevent_ops *uevent_ops,
+                                   struct kobject *parent_kobj);
+
+当你完成对kset的处理后，调用::
+
+  void kset_unregister(struct kset *k);
+
+来销毁它。这将从sysfs中删除该kset并递减其引用计数值。当引用计数
+为零时，该 kset 将被释放。因为对该 kset 的其他引用可能仍然存在，
+释放可能发生在 kset_unregister() 返回之后。
+
+一个使用kset的例子可以在内核树中的 ``samples/kobject/kset-example.c``
+文件中看到。
+
+如果一个kset希望控制与它相关的kobjects的uevent操作，它可以使用
+结构体kset_uevent_ops来处理它::
+
+  struct kset_uevent_ops {
+          int (* const filter)(struct kset *kset, struct kobject *kobj);
+          const char *(* const name)(struct kset *kset, struct kobject *kobj);
+          int (* const uevent)(struct kset *kset, struct kobject *kobj,
+                        struct kobj_uevent_env *env);
+  };
+
+
+过滤器函数允许kset阻止一个特定kobject的uevent被发射到用户空间。
+如果该函数返回0，该uevent将不会被发射出去。
+
+name函数将被调用以覆盖uevent发送到用户空间的kset的默认名称。默
+认情况下，该名称将与kset本身相同，但这个函数，如果存在，可以覆盖
+该名称。
+
+当uevent即将被发送至用户空间时，uevent函数将被调用，以允许更多
+的环境变量被添加到uevent中。
+
+有人可能会问，鉴于没有提出执行该功能的函数，究竟如何将一个kobject
+添加到一个kset中。答案是这个任务是由kobject_add()处理的。当一个
+kobject被传递给kobject_add()时，它的kset成员应该指向这个kobject
+所属的kset。 kobject_add()将处理剩下的部分。
+
+如果属于一个kset的kobject没有父kobject集，它将被添加到kset的目
+录中。并非所有的kset成员都必须住在kset目录中。如果在添加kobject
+之前分配了一个明确的父kobject，那么该kobject将被注册到kset中，
+但是被添加到父kobject下面。
+
+
+移除Kobject
+===========
+
+当一个kobject在kobject核心注册成功后，当代码使用完它时，必须将其
+清理掉。要做到这一点，请调用kobject_put()。通过这样做，kobject核
+心会自动清理这个kobject分配的所有内存。如果为这个对象发送了 ``KOBJ_ADD``
+uevent，那么相应的 ``KOBJ_REMOVE`` uevent也将被发送，任何其他的
+sysfs内务将被正确处理。
+
+如果你需要对kobject进行两阶段的删除（比如说当你需要销毁对象时，你
+不允许睡眠），那么调用kobject_del()将从sysfs中取消kobject的注册。
+这使得kobject "不可见"，但它并没有被清理掉，而且该对象的引用计数仍
+然是一样的。在稍后的时间调用kobject_put()来完成与该kobject相关的
+内存的清理。
+
+kobject_del()可以用来放弃对父对象的引用，如果循环引用被构建的话。
+在某些情况下，一个父对象引用一个子对象是有效的。循环引用必须通过明
+确调用kobject_del()来打断，这样一个释放函数就会被调用，前一个循环
+中的对象会相互释放。
+
+
+示例代码出处
+============
+
+关于正确使用ksets和kobjects的更完整的例子，请参见示例程序
+``samples/kobject/{kobject-example.c,kset-example.c}`` ，如果
+您选择 ``CONFIG_SAMPLE_KOBJECT`` ，它们将被构建为可加载模块。
-- 
2.27.0

