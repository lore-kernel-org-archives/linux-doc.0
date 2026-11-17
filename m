Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916579;
	b=AjyT+0/t912kKJkHMb5cl7FN4Dpp1sLOcTeCrp7k5JkpwvY1AkurxoESd5txE3vMyQYs
	 uGFLPlM6iwI8Hg+KFjUlcJDcE1gfIgk54jVUqo5ooZ0A6u1uu1HUfbcZfmBqPl8SMrKyU
	 HVX8YmzA/0L2jzWehkle/bDd5+D6T4KwJqlPHguy4IMSwRl5WwoTdHb4fdjxXn6R5gUeu
	 g+K2gAF9cVoXBYCGc+nnQL5ZcNlIcRYh6nu21JVL5xjeuAl7DpGiAOyW9a6gyYbQe+IP8
	 J0FJY/x81Wbj6aFB8XabJwLOxwcgjeyiHwzrAtBSgWKSEK8yV9kjKr5hKj5YcIPqogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916579;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=38TZLmmyGViyCrkVlxwNTQqthrsOR8AakMKDuHQcjXM=;
	b=MGySBwKnkjdawRX6s6EVxajLkxV7YjpQ7PWlXbSo0LvRDEsBCk3BRPCS98ARClWzPIgQ
	 yFhLvSEnLYlurmGnHCjut7uDbeOoFkAE5jFbERNqkHimr/S3swc3+PY2Naz9AT80KdKw2
	 dnBJ6+/DFSTkBzJPJ/jtDe8jTn2sBHAl3DJb9lCQ7evjJPkxqK+dXWHBk+x3HJ2QhScRC
	 aUPCii8jclfQZ1K/L/4+ceLRy90Kf7QQ+ylVgsyxkYufuQs0MP/JAhZeBWWcVsCBiDdbv
	 2d+l5s2TOePVGq0ylCwuil8VKiqf0mJE6pcf4DYM3CbdR7tc3F6rKlyj1rJzblhpA+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=E+dilgtB;
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA57606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA57606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=E+dilgtB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=38TZLmmyGViyCrkVlxwNTQqthrsOR8AakMKDuHQcjXM=;
	b=E+dilgtBM2o9hD81ey6sxJZhQ/61UyzC+zv8qIXsDl+Lp9v5paT9NMl1aA1fBp
	7uR2RVs59rhyhxZ73DrgyWLKXqxVGrabXTMwcrNXXPifgulPivXpjg/S3U6hFpl0
	mTRX1wMV8jmGQE/I6HAxystiNptWBN1yjIN4Pq5dIN61E=
Received: from peter-desktop.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnj9KxQPxqdB4NDQ--.49363S6;
	Tue, 17 Nov 2026 19:55:50 +0800 (CST)
From: YikunWei <YikunWei@126.com>
To: alexs@kernel.org
Cc: si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yikun Wei <YikunWei@126.com>
Subject: [PATCH v2 4/4] docs/zh_CN: Add botching-up-ioctls translation
Date: Tue, 17 Nov 2026 19:55:25 +0800
Message-ID: <20261117115527.27937-5-YikunWei@126.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117115527.27937-1-YikunWei@126.com>
References: <20261117115527.27937-1-YikunWei@126.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnj9KxQPxqdB4NDQ--.49363S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3ury5tFWkAr4DKr13Aw43Jrb_yoWDuw4fpF
	n3CrySqw18C342k34xWF48GF1UC3WxCay3WF40yryrX3Z5uw40vFZrK3Z5CFyfGryfCFyk
	XryFvrWFgw1rZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UN_-PUUUUU=
X-CM-SenderInfo: p1ln30xzhlqiyswou0bp/xtbBlQcbHWr8QMfHyAAA3K

From: Yikun Wei <YikunWei@126.com>

Translate Documentation/process/botching-up-ioctls.rst into Chinese.

Update translations/zh_CN/process/index.rst to reference the new
translation and drop the item from the TODOLIST.

Signed-off-by: Yikun Wei <YikunWei@126.com>
---
 .../zh_CN/process/botching-up-ioctls.rst      | 186 ++++++++++++++++++
 .../translations/zh_CN/process/index.rst      |   2 +-
 2 files changed, 187 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/process/botching-up-ioctls.rst

diff --git a/Documentation/translations/zh_CN/process/botching-up-ioctls.rst b/Documentation/translations/zh_CN/process/botching-up-ioctls.rst
new file mode 100644
index 000000000000..0e8985a9fcb6
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/botching-up-ioctls.rst
@@ -0,0 +1,186 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/process/botching-up-ioctls.rst
+
+:翻译:
+
+ Yikun Wei <YikunWei@126.com>
+
+.. _cn_botching_up_ioctls:
+
+=================================
+（如何避免）搞砸 ioctl
+=================================
+
+From: https://blog.ffwll.ch/2013/11/botching-up-ioctls.html
+
+By: Daniel Vetter, Copyright © 2013 Intel Corporation
+
+过去几年里，内核图形领域的开发者们得到一个明确的认识：试图设计一套统一的接口，
+在完全不同的 GPU 上管理执行单元和内存，是徒劳的。所以如今每个驱动都有自己一套
+ioctl 来分配内存、向 GPU 提交任务。这挺好的，因为不再有那种假通用、实际却只用
+一次的蹩脚接口。但明显的缺点是，把事情搞砸的可能性大大增加了。
+
+为了避免把所有同样的错误再犯一遍，我写下一些在为 drm/i915 驱动干活（并把事情
+搞砸）的过程中学到的经验教训。其中大多数只涉及技术细节，而非大局问题，比如
+命令提交 ioctl 究竟应该长什么样。学习这些教训，恐怕是每个 GPU 驱动都得自己走
+一遍的过程。
+
+
+前提条件
+--------
+
+首先是前提条件。缺了这些你就已经失败了，因为你将需要添加一个 32 位兼容层：
+
+ * 只使用固定大小的整数。为避免与用户空间的 typedef 冲突，内核提供了 __u32、
+   __s64 这样的特殊类型。请使用它们。
+
+ * 让所有内容按自然大小对齐，并使用显式填充。32 位平台不一定把 64 位值按
+   64 位边界对齐，但 64 位平台会。所以我们总是需要按自然大小填充，才能把它
+   做对。
+
+ * 如果结构体包含 64 位类型，就把整个结构体填充到 64 位的整数倍——否则结构体
+   大小在 32 位和 64 位上会不同。当把结构体数组传给内核时，或者当内核检查
+   结构体大小时（例如 drm 核心就会这么做），结构体大小不一致会造成麻烦。
+
+ * 指针用 __u64，在用户空间侧与 uintptr_t 相互转换，在内核侧与 void __user *
+   相互转换。务必尽量不要推迟这种转换，更糟糕的是别把原始的 __u64 在你的代码
+   里到处乱传，因为那会削弱 sparse 之类检查工具的作用。内核里可以用
+   u64_to_user_ptr 宏来避免关于整数和指针大小不同的警告。
+
+
+基础
+----
+
+免去了编写兼容层的乐趣之后，我们可以看看一些基础性的错误。忽视这些会让向后和
+向前兼容性变成真正的痛苦。而且由于第一次尝试就做对几乎是不可能的，所以对于任何
+一个给定的接口，你都会有第二次迭代，或者至少是一次扩展。
+
+ * 要有清晰的方法让用户空间判断某个内核是否支持你的新 ioctl 或 ioctl 扩展。
+   如果你不能指望旧内核拒绝新的标志位/模式或 ioctl（因为过去这一点被搞砸了），
+   那么你需要在某处提供一个驱动特性标志或版本号。
+
+ * 要有一个用新标志位或在结构体末尾新增字段来扩展 ioctl 的计划。drm 核心会
+   检查每次 ioctl 调用传入的大小，并对内核与用户空间之间的不一致做零扩展。
+   这有帮助，但不是一个完整的解决方案，因为旧内核上的新用户空间不会注意到
+   末尾新增的字段被忽略了。所以这仍然需要一个新的驱动特性标志。
+
+ * 检查所有未使用的字段和标志位、以及所有填充位是否为 0，若不是则拒绝该
+   ioctl。否则你那个漂亮的未来扩展计划就泡汤了，因为总会有人提交一个 ioctl
+   结构体，其尚未使用的部分塞满了随机的栈垃圾。这随后就把 ABI 固化成：这些
+   字段除了垃圾之外永远不能用于其他用途。这也是为什么你必须显式填充所有
+   结构体，即使你从不把它们用在数组里——编译器可能插入的填充位也许含有垃圾。
+
+ * 为以上所有情况准备简单的测试用例。
+
+
+错误路径的乐趣
+--------------
+
+如今我们再也找不到借口让 drm 驱动变成精巧的本地提权漏洞了。这意味着我们既需要
+完整的输入校验，也需要可靠的错误处理路径——GPU 总会在最古怪的边界情况下死掉：
+
+ * ioctl 必须检查数组溢出。还需要检查整数值的上溢/下溢和截断问题。常见的例子
+   是精灵（sprite）定位值被直接喂给硬件，而硬件只有大约 12 位。这本来工作得
+   很好，直到某个古怪的显示服务器懒得自己做截断，光标就绕回到屏幕另一边了。
+
+ * 为 ioctl 中每一种输入校验失败的情况准备简单的测试用例。检查错误码是否符合
+   预期。最后要确保你在每个子测试里只测试单一的错误路径，提交的数据在其他方面
+   都完全有效。否则，前面某个检查可能早就拒绝了这个 ioctl，从而遮蔽了你真正
+   想测试的代码路径，隐藏了 bug 和回归。
+
+ * 让你所有的 ioctl 都可重启（restartable）。首先 X 非常喜欢信号，其次这将让
+   你只需不断用信号打断主测试套件，就能测试 90% 的错误处理路径。多亏了 X 对
+   信号的偏爱，对于图形驱动来说，你几乎可以免费获得所有错误路径的出色基础
+   覆盖率。另外，处理 ioctl 重启的方式要保持一致——例如 drm 在其用户空间库中
+   有一个小小的 drmIoctl 辅助函数。i915 驱动在 set_tiling ioctl 上搞砸了这一点，
+   现在我们在内核和用户空间里都被某些晦涩的语义永远困住了。
+
+ * 如果你无法让某条代码路径可重启，至少要让卡住的任务可被杀死。GPU 就是会死机，
+   如果你的驱动把整台机器都挂住（通过一个杀不掉的 X 进程），用户可不会更喜欢你。
+   如果状态恢复仍然太棘手，就加一个超时或 hangcheck 安全网作为最后手段，以防
+   硬件彻底发疯。
+
+ * 为错误恢复代码中真正棘手的边界情况准备测试用例——在 hangcheck 代码和等待者
+   之间造成死锁，实在太容易了。
+
+
+时间、等待与错过
+----------------
+
+GPU 绝大部分工作都是异步完成的，所以我们需要给操作计时、并等待尚未完成的操作。
+这可是件相当棘手的事；目前 drm/i915 支持的 ioctl 没有一个是完全做对了这一点的，
+这意味着这里还有大量的教训等着我们去学。
+
+ * 始终使用 CLOCK_MONOTONIC 作为你的参考时间。如今这是 alsa、drm 和 v4l 默认
+   采用的。但要让用户空间知道，哪些时间戳来自不同的时钟域，比如你的主系统时钟
+   （由内核提供）或别处某个独立的硬件计数器。只要看得足够仔细，时钟总会对不上，
+   但如果性能测量工具掌握这些信息，它们至少可以做出补偿。如果你的用户空间能够
+   拿到某些时钟的原始值（例如通过命令流内的性能计数器采样指令），不妨考虑把这些
+   值也暴露出来。
+
+ * 用 __s64 秒加 __u64 纳秒来指定时间。这不是最方便的时间表示方式，但基本是
+   事实上的标准。
+
+ * 检查输入的时间值是否已归一化，若否则拒绝。注意内核原生的 struct ktime 对秒
+   和纳秒都使用有符号整数，所以要当心。
+
+ * 对于超时，使用绝对时间。如果你是个好人、把 ioctl 做成了可重启的，那么相对
+   超时往往太粗糙，会因为每次重启时的取整而无限延长你的等待时间。尤其是当你的
+   参考时钟是显示帧计数器这种非常慢的东西时。从一个钻牛角尖的规范律师角度看，
+   这不算 bug——毕竟超时总是可以被延长的——但如果用户漂亮的动画因此开始卡顿，
+   他们肯定会恨死你。
+
+ * 考虑干脆抛弃所有带超时的同步等待 ioctl，改为在一个可 poll 的文件描述符上
+   投递异步事件。这样能更好地融入事件驱动应用的主循环。
+
+ * 为边界情况准备测试用例，尤其是已经完成的事件、成功的等待和超时的等待这几种
+   情况的返回值是否都合理、且符合你的需要。
+
+
+不泄漏资源
+----------
+
+一个完整的 drm 驱动本质上实现了一个小型操作系统，只不过是专用于特定 GPU 平台的。
+这意味着驱动需要向用户空间暴露大量不同对象和其他资源的句柄。要把这件事做对，
+自有其一套小小的陷阱：
+
+ * 始终把动态创建资源的生命周期绑定到某个文件描述符的生命周期上。如果你的资源
+   需要跨进程共享，可以考虑采用 1:1 的映射——通过 UNIX 域套接字传递 fd 也能简化
+   用户空间的生命周期管理。
+
+ * 始终支持 O_CLOEXEC。
+
+ * 确保不同客户端之间有充分的隔离。默认情况下选择私有的、每 fd 一个的命名空间，
+   强制任何共享都必须显式进行。只有当对象确实是设备唯一的时候，才采用更全局的
+   每设备命名空间。drm modeset 接口里有一个反例：per-device 的 modeset 对象（如
+   connector）与 framebuffer 对象共享同一个命名空间，而后者大多根本不共享。为
+   framebuffer 单独设一个默认私有的命名空间会更合适。
+
+ * 想清楚用户空间句柄的唯一性要求。例如对大多数 drm 驱动来说，在同一次命令提交
+   ioctl 里两次提交同一个对象是用户空间的 bug。但如果对象是可共享的，用户空间
+   就需要知道自己是否已经见过某个从别的进程导入的对象。我自己还没试过这个做法，
+   因为缺一类新的对象，但可以考虑用共享文件描述符的 inode 号作为唯一标识符——
+   真正的文件也是这样区分的。可惜这需要在内核里实现一个完整的文件系统。
+
+
+最后但并非最不重要
+------------------
+
+并非每个问题都需要一个新的 ioctl：
+
+ * 仔细想想你是否真的想要一个驱动私有接口。当然，推送一个驱动私有接口，比为了
+   一个更通用的方案展开漫长讨论要快得多。偶尔搞一个私有接口来为某个新概念打头阵，
+   也确实是需要的。但最终，一旦通用接口出现，你将不得不无限期地维护两个接口。
+
+ * 考虑 ioctl 之外的其他接口。对于每设备设置，或者对于生命周期相当静态的子对象
+   （比如 drm 里带各种检测覆盖属性的输出连接器），sysfs 属性要好得多。又或许只有
+   你的测试套件需要这个接口，那么用 debugfs 更合适，它本身就声明了不保证稳定的
+   ABI。
+
+最后，这场游戏的要点是第一次就把它做对，因为如果你的驱动流行起来、硬件平台又
+长命百岁，那么你就基本上会被某个 ioctl 永远困住。你可以尝试在更新一代的硬件上
+弃用那些糟糕的 ioctl，但一般来说这要花上好几年。然后还要再等好几年，直到最后
+一个还能抱怨回归的用户也消失为止。
diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 0913e0f5e72a..9f657597b3f9 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -85,13 +85,13 @@ TODOLIST:
    applying-patches
    volatile-considered-harmful
    backporting
+   botching-up-ioctls
    ../arch/riscv/patch-acceptance
    ../core-api/unaligned-memory-access
 
 TODOLIST:
 
 * adding-syscalls
-* botching-up-ioctls
 * clang-format
 
 .. only::  subproject and html
-- 
2.43.0

