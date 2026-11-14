Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631051;
	b=5nE3XjluOfV/IErSS1glQFp/ZO8fGCkGdBdL108fT/Y1pH8y9vRAgaXSdLp6bgWDIuxa
	 f/dznsJpe3zn8JZq5tV76L/nrRW1JWAJVeEDB5jptTW2prEElJ+UTzyhug48dsEEGYTu+
	 hPwVHUasgTQWOsP2uu4StNC4KyN2zFvrIkiRSesCiMKklGoyK6HqN44cN5gNKeVG+/EUy
	 21YVwWjB0AJXZjw2c8poRQmgDKGROr3h/7o/QxyxkHd4xeA0x0SnVG27jeUa4AZsS2lsU
	 Mai+CNyy+mWJwX3K7Ik2hzadPTzvpkEWXnZMyBFHZ9FxcQk9F3lZ2qjGv5aKaJXX8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631051;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=oICEGqCg4sNUja27yYfP0gDHLDKlgL82Y9zyUOLdDAY=;
	b=URPXssSoMyI9Tx9iAGwqu4ttK2gyPVw21ie1/uH2AUGCuAk8oyk6wVJWNXEpzqZeb9P1
	 IxRft2HZITqXZmZIVWlPov4EXRsrwEnTgR+tcVyyZOokf4H9R15rWiccDwL4f398kkD7V
	 n9VMjAtWWmDQ81nGEZgM8pxTXxULlX+6b+DRYZBAm2L25EeLQrlshVEmdC97i0c+h+V0q
	 WypYpeDS2VueahEkUq6u3YZN4GoKnIUVgZ8sXhREmtM2eIFSsYUsFplOBFd5oiVxjc3/Y
	 uXUhobd6Zkqtz6JdFd/If47Rcjit2z5GPBHsuobrjitNFGj2NgUky/xa7fZB6UKzWAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=mzJeZuqL;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC9606A327
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 04:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEC9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=mzJeZuqL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=oICEGqCg4sNUja27yYfP0gDHLDKlgL82Y9zyUOLdDAY=;
	b=mzJeZuqLu8h8xaZ+yZtrPpUsLnKtKlHcK+GQXmcCjpOvZpEWc7ornfZ4Tmu7iR
	6tEfxoI3M0mGd2K6m4+/YDcIR5sylMJlROz4KSgFlz/rH63QyXpKem3VeQpkJIIa
	tKuj2QG+pbXjHJt3YtB67d9diIcIhFhzRjAC/dxfxGscc=
Received: from peter-desktop.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDH3zVU5fdqU98sDQ--.26503S2;
	Sat, 14 Nov 2026 12:36:37 +0800 (CST)
From: YikunWei <YikunWei@126.com>
To: alexs@kernel.org
Cc: si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yikun Wei <YikunWei@126.com>
Subject: [PATCH] docs/zh_CN: Add backporting translation
Date: Sat, 14 Nov 2026 12:36:31 +0800
Message-ID: <20261114043633.7459-1-YikunWei@126.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:_____wDH3zVU5fdqU98sDQ--.26503S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfur4UtrWxCr45tw1UXFWrKrg_yoW8tr13Co
	WIv3y3C34ruF15Jw4rCrWUGr43J3sagrs3tFy5Kw15J3W7ta4fGw4ruw48Wrs8ur4rJa98
	Gw1xuas7JFWrJF48n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYoGQDUUUU
X-CM-SenderInfo: p1ln30xzhlqiyswou0bp/xtbBqRkoKmr35VlmBQAA3w

From: Yikun Wei <YikunWei@126.com>

Translate Documentation/process/backporting.rst into Chinese.

Update translations/zh_CN/process/index.rst to reference the new
translation and drop the item from the TODOLIST.

Signed-off-by: Yikun Wei <YikunWei@126.com>
---
 .../zh_CN/process/backporting.rst             | 464 ++++++++++++++++++
 .../translations/zh_CN/process/index.rst      |   2 +-
 2 files changed, 465 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/process/backporting.rst

diff --git a/Documentation/translations/zh_CN/process/backporting.rst b/Documentation/translations/zh_CN/process/backporting.rst
new file mode 100644
index 000000000000..334fe5e982ea
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/backporting.rst
@@ -0,0 +1,464 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/process/backporting.rst
+
+:翻译:
+
+ Yikun Wei <YikunWei@126.com>
+
+.. _cn_backporting:
+
+===================================
+补丁回填与冲突解决
+===================================
+
+:Author: Vegard Nossum <vegard.nossum@oracle.com>
+
+.. contents::
+    :local:
+    :depth: 3
+    :backlinks: none
+
+简介
+====
+
+有些开发者在日常工作中可能从来不需要处理补丁回填（backporting）、分支合并或冲突
+解决，因此一旦真遇到合并冲突，往往会让人发怵。所幸，解决冲突和任何其他技能一样，
+是可以练出来的；而且有许多实用的技巧，能让整个过程更顺畅，也让你对结果更有信心。
+
+本文档旨在成为一份全面、循序渐进的补丁回填与冲突解决指南。
+
+将补丁应用到代码树
+==================
+
+有时候你要回填的补丁本身已经是一个 git 提交，这种情况下直接用 ``git cherry-pick``
+把它摘取过来即可。不过，如果该补丁来自一封邮件（Linux 内核的补丁经常如此），你就
+得用 ``git am`` 把它打到代码树上。
+
+如果你用过 ``git am``，大概已经知道它对补丁能否干净地打到源码树上相当挑剔。事实上，
+你可能还对 ``.rej`` 文件、以及为了能让补丁打上而手动去改补丁的噩梦记忆犹新。
+
+强烈建议的做法是：先找一个能让补丁干净应用的合适基线版本，*然后* 再把它摘取到你的
+目标代码树上。这样一来，Git 就会输出冲突标记，让你能够借助 Git 以及任何你偏好的
+冲突解决工具来解决问题。例如，如果你想把一个刚发到 LKML 上的补丁应用到较旧的稳定
+内核，可以先把它打到最新的主线内核上，再摘取到你的旧稳定分支。
+
+一般来说，使用和补丁原本生成时所基于的版本完全一致的基础更好；但只要能干净地打上、
+且与原始基线相差不算太远，其实差别不大。把补丁打到“错误”的基线上，唯一的问题在于：
+当你把它摘取到旧分支时，diff 的上下文里可能会混入更多不相干的改动。
+
+相比 ``git am``，更推荐 ``git cherry-pick`` 的一个理由是：Git 掌握着一个已有提交的
+确切历史，因此当代码被移动过、行号发生变化时它也能知晓；这反过来又降低了把补丁打错
+位置的概率（打错位置可能导致隐蔽的错误，或产生一团乱麻般的冲突）。
+
+如果你正在使用 `b4`_，并且是直接从一个邮件来应用补丁，那么可以配合 ``-g``/
+``--guess-base`` 与 ``-3``/``--prep-3way`` 选项来让 b4 自动完成上述部分工作（更多
+信息请参阅 `b4 presentation`_）。不过，本文其余部分都假定你是在做一次普通的
+``git cherry-pick``。
+
+一旦把补丁放进 Git，就可以着手把它摘取到你的源码树里了。如果你想留下该补丁来自
+何处的书面记录，别忘了在摘取时加上 ``-x``！
+
+注意，如果你是为 stable 提交补丁，格式会略有不同；主题行之后的第一行需要是::
+
+    commit <upstream commit> upstream
+
+或者::
+
+    [ Upstream commit <upstream commit> ]
+
+解决冲突
+========
+
+哎呀，摘取失败了，还附带一条颇有些吓人的信息::
+
+    CONFLICT (content): Merge conflict
+
+现在该怎么办？
+
+一般来说，当补丁的上下文（也就是被修改的行，以及/或者修改点周围的行）与你试图把
+补丁打上去的那棵树对不上时，冲突就会出现。
+
+对于回填而言，更可能的情况是：你从中回填的分支里，包含了目标分支所没有的某些补丁。
+不过，反过来也有可能。无论如何，结果都是一个需要解决的冲突。
+
+如果你尝试的摘取因冲突而失败，Git 会自动修改相关文件，插入所谓的“冲突标记”，告诉
+你冲突在哪里、两个分支又是如何分道扬镳的。解决冲突通常意味着：编辑出最终结果，使之
+兼顾其他那些提交。
+
+解决冲突既可以徒手在普通文本编辑器里完成，也可以使用专门的冲突解决工具。
+
+许多人更习惯用自己平常用的文本编辑器直接编辑冲突，因为这样更容易理解自己在做什么、
+也更容易掌控最终结果。两种方法各有优劣，有时两者结合使用也很有价值。
+
+这里我们不打算介绍各类专用合并工具的使用，只给出一些可供选用的工具线索：
+
+-  `Emacs Ediff mode <https://www.emacswiki.org/emacs/EdiffMode>`__
+-  `vimdiff/gvimdiff <https://linux.die.net/man/1/vimdiff>`__
+-  `KDiff3 <http://kdiff3.sourceforge.net/>`__
+-  `TortoiseMerge <https://tortoisesvn.net/TortoiseMerge.html>`__
+-  `Meld <https://meldmerge.org/help/>`__
+-  `P4Merge <https://www.perforce.com/products/helix-core-apps/merge-diff-tool-p4merge>`__
+-  `Beyond Compare <https://www.scootersoftware.com/>`__
+-  `IntelliJ <https://www.jetbrains.com/help/idea/resolve-conflicts.html>`__
+-  `VSCode <https://code.visualstudio.com/docs/editor/versioncontrol>`__
+
+要配置 Git 来配合这些工具，请参阅 ``git mergetool --help`` 或官方的
+`git-mergetool documentation`_。
+
+前置补丁
+--------
+
+大多数冲突之所以发生，是因为你所要回填到的分支，相比你从中回填的分支少了若干补丁。
+在更一般的情况下（比如合并两个互不相干的分支），开发可能发生在任意一条分支上，或者
+两条分支干脆就分叉了——也许你的旧分支上已经打过别的回填补丁，而那些补丁本身就需要
+解决冲突，从而造成了分叉。
+
+始终弄清楚究竟是哪一次（或哪几次）提交引发了冲突，这一点非常重要，否则你无法对解决
+结果的正确性有信心。额外的好处是：尤其是当你对出问题的代码区域并不熟悉时，这些提交的
+改变日志（changelog）往往能给你提供理解这段代码、以及认清你的冲突解决方案可能存在的
+问题或陷阱所需的背景。
+
+git log
+~~~~~~~
+
+一个不错的起点，是查看出现冲突的那个文件的 ``git log``——当该文件改动不多时，这通常
+就足够了；但如果文件很大、且经常被打补丁，结果可能会让人一头雾水。你应当针对当前所在
+分支（``HEAD``）与你所摘取的补丁的父提交（``<commit>``）之间的提交区间来运行
+``git log``，即::
+
+    git log HEAD..<commit>^ -- <path>
+
+更好的是，如果你只想把输出限定在某个函数内（因为冲突正是出现在那里），可以使用下面
+这样的语法::
+
+    git log -L:'\<function\>':<path> HEAD..<commit>^
+
+.. note::
+     函数名两侧的 ``\<`` 与 ``\>`` 用于确保匹配锚定在单词边界上。这一点很重要，因为
+     这部分其实是一个正则表达式，而 git 只取第一个匹配；所以如果你写
+     ``-L:thread_stack:kernel/fork.c``，即使该文件中还有许多其他名字里含有
+     ``thread_stack`` 字符串的函数，它可能也只会给你
+     ``try_release_thread_stack_to_cache`` 这个函数的结果。
+
+``git log`` 另一个有用的选项是 ``-G``，它可以让你按“出现在所列提交 diff 中的某些
+字符串”来过滤::
+
+    git log -G'regex' HEAD..<commit>^ -- <path>
+
+这也是一种快速定位“某样东西（比如一次函数调用或一个变量）是何时被改动、新增或删除”
+的便捷方式。搜索字符串是正则表达式，这意味着你甚至能搜得更具体，比如对某个结构体
+成员的赋值::
+
+    git log -G'\->index\>.*='
+
+git blame
+~~~~~~~~~
+
+另一种寻找前置提交的办法（尽管对每个冲突只能找到最近的那一次）是运行 ``git blame``。
+这种情况下，你需要针对你所摘取的补丁的父提交、以及出现冲突的文件来运行它，即::
+
+    git blame <commit>^ -- <path>
+
+这个命令也接受 ``-L`` 参数（用于把输出限定在单个函数内），不过此时你要像平常一样把
+文件名放在命令末尾::
+
+    git blame -L:'\<function\>' <commit>^ -- <path>
+
+定位到冲突发生的地方。blame 输出的第一列，就是新增那行代码的补丁的提交 ID。
+
+你不妨 ``git show`` 这些提交，看看它们是否像引发冲突的源头。有时这样的提交不止一个，
+原因可能是多个提交修改了同一冲突区域的不同行，*或者* 多个后续补丁对同一行（或几行）
+反复修改过。在后一种情况下，你可能需要再次运行 ``git blame``，并指定该文件的较旧版本
+来查看，以便向文件历史更深处追溯。
+
+前置补丁与偶然补丁
+~~~~~~~~~~~~~~~~~~
+
+找到引发冲突的补丁之后，你需要判断它究竟是你要回填的补丁的*前置条件*，还是仅仅是个
+*偶然* 存在、可以跳过的补丁。所谓偶然补丁，指的是它触碰了与你回填补丁相同的代码，但
+并没有以任何实质方式改变代码的语义。例如，一次空白符清理补丁完全是偶然的——同理，仅仅
+是重命名某个函数或变量的补丁也是偶然的。另一方面，如果那个被修改的函数在你的当前分支
+里根本就不存在，那这绝不只是偶然，你需要仔细考虑：是否应当先把新增该函数的那个补丁
+摘取过来。
+
+如果你发现存在必要的前置补丁，就需要停下来，改为先把它摘取过来。如果你已经在另一个
+文件里解决了若干冲突、不想重来一遍，可以先给那个文件做个临时副本。
+
+要中止当前的摘取，直接运行 ``git cherry-pick --abort``，然后用前置补丁的提交 ID 重新
+开始摘取过程。
+
+理解冲突标记
+------------
+
+组合 diff
+~~~~~~~~~
+
+假设你已经决定不再去摘取（或回退）额外的补丁，只想解决眼前的冲突。Git 会在你的文件里
+插入冲突标记。开箱即用时，它看起来大致像这样::
+
+    <<<<<<< HEAD
+    this is what's in your current tree before cherry-picking
+    =======
+    this is what the patch wants it to be after cherry-picking
+    >>>>>>> <commit>... title
+
+这就是你在编辑器里打开文件时会看到的内容。然而，如果你不带任何参数地运行 ``git diff``，
+输出则会像这样::
+
+    $ git diff
+    [...]
+    ++<<<<<<<< HEAD
+     +this is what's in your current tree before cherry-picking
+    ++========
+    + this is what the patch wants it to be after cherry-picking
+    ++>>>>>>>> <commit>... title
+
+在解决冲突时，``git diff`` 的行为与平时不同。注意这里有两列 diff 标记，而非常见的一
+列；这就是所谓的“`combined diff`_”，此处展示的是三方 diff（或者说 diff 的 diff），
+介于：
+
+#. 当前分支（摘取前）与当前工作目录之间，以及
+#. 当前分支（摘取前）与“原补丁应用之后”的文件之间。
+
+更清晰的 diff
+~~~~~~~~~~~~
+
+三方的组合 diff 包含了你的当前分支与你所摘取的分支之间，该文件发生的所有其他改动。
+虽然这有助于发现你需要兼顾的其他改动，但也让 ``git diff`` 的输出显得有些吓人、难以
+阅读。你或许更愿意运行 ``git diff HEAD``（或 ``git diff --ours``），它只展示当前
+分支（摘取前）与当前工作目录之间的差异。它看起来像这样::
+
+    $ git diff HEAD
+    [...]
+    +<<<<<<<< HEAD
+     this is what's in your current tree before cherry-picking
+    +========
+    +this is what the patch wants it to be after cherry-picking
+    +>>>>>>>> <commit>... title
+
+如你所见，读起来就和任何别的 diff 一样，并且清楚地表明哪些行属于当前分支、哪些行是
+作为合并冲突或所摘取补丁的一部分而被加入的。
+
+合并风格与 diff3
+~~~~~~~~~~~~~~~
+
+上面展示的默认冲突标记风格被称为 ``merge`` 风格。此外还有另一种风格，叫做 ``diff3``
+风格，看起来像这样::
+
+    <<<<<<< HEAD
+    this is what is in your current tree before cherry-picking
+    ||||||| parent of <commit> (title)
+    this is what the patch expected to find there
+    =======
+    this is what the patch wants it to be after being applied
+    >>>>>>> <commit> (title)
+
+如你所见，它有三段而非两段，并且包含了 Git 本期望在那里找到、却没找到的内容。*强烈
+推荐* 使用这种冲突风格，因为它能更清楚地展示该补丁究竟改了什么；也就是说，它能让你
+对所摘取提交的文件“修改前/修改后”两个版本做对比。这有助于你对如何解决冲突做出更好的
+判断。
+
+要切换冲突标记风格，可以使用如下命令::
+
+    git config merge.conflictStyle diff3
+
+还有第三个选项 ``zdiff3``，在 `Git 2.35`_ 中引入，它和 ``diff3`` 一样有三段，但会把
+公共行裁掉，从而在某些情况下缩小冲突区域。
+
+迭代式解决冲突
+--------------
+
+任何冲突解决过程的第一步，都是先理解你要回填的补丁。对于 Linux 内核而言这一点尤为
+重要，因为一处不正确的改动可能导致整个系统崩溃——甚至更糟，埋下一个未被察觉的安全
+漏洞。
+
+理解补丁的难易，取决于补丁本身、它的改变日志，以及你对所改代码的熟悉程度。不过，对
+每一处改动（或补丁的每一个 hunk）都可以问一个好问题：“这个 hunk 为什么会出现在补丁
+里？”这些问题的答案，将指导你的冲突解决。
+
+解决流程
+~~~~~~~~
+
+有时最简单的做法，就是把冲突中除第一部分以外的部分全部删掉，让文件基本保持原样，然后
+徒手把改动应用上去。举例来说，假设某次冲突改动把一个函数调用参数从 ``0`` 改成了
+``1``，而与之冲突的另一处改动则在参数列表末尾新增了一个完全无关紧要的参数；这种情况
+下，徒手把参数从 ``0`` 改成 ``1``、其余参数原样保留即可。这种“手动应用改动”的技巧，
+在冲突牵扯进大量你其实无需关心的上下文时尤其有用。
+
+对于带有大量冲突标记、尤其棘手的冲突，你可以用 ``git add`` 或 ``git add -i`` 有选择
+地暂存你的解决方案，把它们从待办中挪开；这也让你能用 ``git diff HEAD`` 随时查看还有
+哪些没解决，或用 ``git diff --cached`` 查看当前补丁长什么样。
+
+处理文件重命名
+~~~~~~~~~~~~~~
+
+回填补丁时最恼人的一件事，就是发现被修补的某个文件已经被重命名了，因为那通常意味着
+Git 连冲突标记都不会插入，而只是摊开两手说（意译）：“未合并的路径！你来干活……”
+
+一般有几招可以应对。如果被重命名文件的补丁很小，比如只有一行改动，最简单就是直接徒手
+把它改上、了事。反之，如果改动很大或很复杂，你肯定不想手动去做。
+
+作为第一步，你可以试试类似下面的命令，它会把重命名检测的阈值降到 30%（默认情况下 Git
+用 50%，也就是说两个文件至少要有一半以上内容相同，Git 才会把一对“新增+删除”视为可能
+的重命名）::
+
+  git cherry-pick -strategy=recursive -Xrename-threshold=30
+
+有时正确的做法是：把那个做了重命名的补丁也一并回填，但这绝对不是最常见的情况。你真正
+可以做的，是在你要回填到的分支里临时把那个文件重命名（用 ``git mv`` 并提交结果），
+重新尝试摘取该补丁，再把文件改回原名（再次 ``git mv`` 并提交），最后用 ``git rebase
+-i`` 把结果压成一个提交（参见 `rebase tutorial`_），这样完成时它看起来就像一个单独的
+提交。
+
+注意事项
+--------
+
+函数参数
+~~~~~~~~
+
+注意函数参数的变化！人们很容易一扫而过、以为两行相同，实则它们在某个小细节上并不一样，
+比如究竟把哪个变量作为实参传了进去（尤其是当两个变量都是长得几乎一样的单个字符时，
+比如 i 和 j）。
+
+错误处理
+~~~~~~~~
+
+如果你摘取的补丁里包含一条 ``goto`` 语句（通常用于错误处理），那么绝对有必要仔细核查：
+在你回填到的分支里，它跳转的目标标签是否依然正确。对于新增的 ``return``、``break``
+和 ``continue`` 语句，道理相同。
+
+错误处理通常位于函数的末尾，因此即便它被其他补丁改动过，也可能并不属于冲突的一部分。
+
+确保你审查了错误路径的一个好办法，是在检视改动时始终使用 ``git diff -W`` 和
+``git show -W``（也即 ``--function-context``）。对于 C 代码，这会展示出补丁中被改动
+函数的整个函数体。回填过程中经常出错的一点就是：在你从中或向之回填的两条分支上，函数
+里的别处发生了改动。把整个函数纳入 diff，你能获得更多上下文，也更容易发现那些本可能
+被忽略的问题。
+
+被重构的代码
+~~~~~~~~~~~~
+
+相当常见的一件事是：代码通过把一段公共代码序列或模式“抽取”成一个辅助函数而被重构。
+当把补丁回填到一个已经发生过这类重构的区域时，你实际上需要在回填时反其道而行之：某个
+应用到单一位置的补丁，在回填版本里可能需要应用到多个位置。（这种情况的一个征兆是某
+函数被重命名了——但也不总是如此。）
+
+为了避免不完整的回填，值得花点心思去搞清：该补丁修复的 bug 是否出现在不止一处。一个
+办法是用 ``git grep``。（其实这本身是个好主意，不仅限于回填。）如果你确实发现同样的
+修复也适用于别处，那还值得看看这些地方在上游是否存在——如果不存在，那么该补丁很可能
+需要做相应调整。``git log`` 是你弄清这些区域发生了什么的好帮手，因为 ``git blame``
+不会展示已被删除的代码。
+
+如果你在上游树里确实发现了同一模式的其他实例，却不确定它是否也是个 bug，那么去问问
+补丁作者不失为妥当之举。回填过程中发现新 bug 可一点都不罕见！
+
+验证结果
+========
+
+colordiff
+---------
+
+提交了一个无冲突的新补丁之后，你现在可以把自己的补丁和原始补丁做个对比。强烈推荐
+使用像 `colordiff`_ 这样的工具，它能并排展示两个文件，并按它们之间的差异上色::
+
+    colordiff -yw -W 200 <(git diff -W <upstream commit>^-) <(git diff -W HEAD^-) | less -SR
+
+这里，``-y`` 表示做并排对比；``-w`` 忽略空白符；``-W 200`` 设置输出宽度（否则默认用
+130，往往有点偏小）。
+
+``rev^-`` 这种语法是 ``rev^..rev`` 的便捷简写，本质上就是只给出那一次提交的 diff；
+另请参阅官方的 `git rev-parse documentation`_。
+
+再次提醒，注意在 ``git diff`` 里加上 ``-W``；它能确保你看到任何被改动函数的完整
+函数体。
+
+colordiff 一个极其重要的作用，是突出显示不同的行。例如，如果错误处理用的 ``goto`` 在
+原始补丁与回填补丁之间换了标签，colordiff 会把它俩并排展示、却用不同颜色高亮。于是，
+一眼就能看出这两条 ``goto`` 跳转的是不同的标签。同理，那些没有被任一补丁修改、却因
+上下文不同而相异的行，也会被高亮，从而在人工检视时格外显眼。
+
+当然，这终究只是肉眼检查；真正的检验还得靠构建并运行被打过补丁的内核（或程序）。
+
+构建测试
+--------
+
+运行时测试这里就不展开了，但只构建补丁所触及的文件作为快速健全性检查，是个不错的主意。
+对于 Linux 内核，在 ``.config`` 与构建环境都已正确就绪的前提下，你可以像这样单独构建
+某个文件::
+
+    make path/to/file.o
+
+注意，这发现不了链接错误，因此在确认单个文件能编译通过后，你仍应做一次完整构建。先
+编译单个文件，可以避免在（万一）你改动过的文件里存在编译错误时，还得苦等一次完整
+构建。
+
+运行时测试
+----------
+
+即便是成功的构建或启动测试，也未必足以排除某处缺失依赖的可能性。尽管概率很小，但完全
+可能存在这样的代码改动：对同一文件的两处独立改动，既不会产生冲突，也不会引发编译期
+错误，而只在极个别情况下才暴露运行时错误。
+
+一个具体的例子是：有一对针对系统调用入口代码的补丁，第一个保存/恢复了某个寄存器，而
+后一个补丁在这段序列中间的某处用到了同一个寄存器。由于两处改动毫无重叠，你大可以摘取
+第二个补丁、不产生任何冲突，并以为一切安好，而事实上代码此刻正在覆盖一个未被保存的
+寄存器。
+
+尽管绝大多数错误都会在编译期间、或在浅层执行代码时被捕获，但*真正*验证一次回填的唯一
+办法，是以你对待（或应当对待）任何其他补丁的同等级别去审查最终补丁。拥有单元测试、回归
+测试或其他类型的自动化测试，有助于提升对回填正确性的信心。
+
+向 stable 提交回填补丁
+=====================
+
+当 stable 维护者试图把主线修复摘取到他们的稳定内核时，遇到冲突他们可能会发邮件来
+索要回填补丁，例如见
+<https://lore.kernel.org/stable/2023101528-jawed-shelving-071a@gregkh/>。这些邮件
+通常会包含你需要把补丁摘取到正确代码树并提交的确切步骤。
+
+有一件要确保的事，是你的改变日志要符合预期格式::
+
+  <original patch title>
+
+  [ Upstream commit <mainline rev> ]
+
+  <rest of the original changelog>
+  [ <summary of the conflicts and their resolutions> ]
+  Signed-off-by: <your name and email>
+
+“Upstream commit”这一行有时会因 stable 版本不同而略有差异。较旧的版本使用如下格式::
+
+  commit <mainline rev> upstream.
+
+最常见的是在邮件主题行里标明该补丁所适用的内核版本（例如使用
+``git send-email --subject-prefix='PATCH 6.1.y'``），但也可以把它放在 Signed-off-by
+区域附近，或 ``---`` 线以下。
+
+stable 维护者希望对每一个活跃的稳定版本分别提交，而且每次提交也应当分别测试。
+
+最后几点建议
+============
+
+1) 以谦逊之心对待回填过程。
+2) 理解你要回填的补丁；这意味着既要读改变日志，也要读代码。
+3) 提交补丁时，坦诚说明你对其结果有几分把握。
+4) 向相关维护者索要明确的 ack。
+
+示例
+====
+
+上面大致展示了理想化的回填流程。若要一个更具体的例子，请参阅这段把两个补丁从主线回填
+到 stable 的视频教程：`Backporting Linux Kernel Patches`_。
+
+.. _b4: https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
+.. _b4 presentation: https://youtu.be/mF10hgVIx9o?t=2996
+.. _git-mergetool documentation: https://git-scm.com/docs/git-mergetool
+.. _combined diff: https://git-scm.com/docs/diff-format#_combined_diff_format
+.. _rebase tutorial: https://medium.com/@slamflipstrom/a-beginners-guide-to-squashing-commits-with-git-rebase-8185cf6e62ec
+.. _Git 2.35: https://github.blog/2022-01-24-highlights-from-git-2-35/
+.. _colordiff: https://www.colordiff.org/
+.. _git rev-parse documentation: https://git-scm.com/docs/git-rev-parse#_other_rev_parent_shorthand_notations
+.. _Backporting Linux Kernel Patches: https://youtu.be/sBR7R1V2FeA
diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index cd02cce21bf0..0913e0f5e72a 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -84,12 +84,12 @@ TODOLIST:
    magic-number
    applying-patches
    volatile-considered-harmful
+   backporting
    ../arch/riscv/patch-acceptance
    ../core-api/unaligned-memory-access
 
 TODOLIST:
 
-* backporting
 * adding-syscalls
 * botching-up-ioctls
 * clang-format
-- 
2.43.0

