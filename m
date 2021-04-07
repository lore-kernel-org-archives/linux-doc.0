Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD34C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E77261222
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346805AbhDGHvN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:51:13 -0400
Received: from m32-153.88.com ([43.250.32.153]:32781 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234159AbhDGHvN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=RI7BM++TPE8PVqSpgWd2uv8h1ZPucrARg/mkb
        kh4VCE=; b=hAaZIKQcGjHrL0h3mqgcK8Hi9Tx/+qHU9yjzOl7qn8eUl8NrC0eC4
        3/Zj1PNOaN34xJv6R8vK7RZO4vkKrLUI+D0uNNkbdZEI/RkU0kwEHolWGDcmzpFI
        Zg5gr/+tDckxv0sPa2tD0AkWDllX5/zZvCK0vNw9WwZlLcNQho+HAQ=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHkyNiZG1gt0NhAA--.29846S2;
        Wed, 07 Apr 2021 15:51:00 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:50:58 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 3/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/kernel-doc.rst
Message-ID: <b758619c8da427cbe04944bd81701ed2b276c858.1617699755.git.bobwxc@email.cn>
References: <cover.1617699755.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617699755.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHkyNiZG1gt0NhAA--.29846S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr4DXFyDGw43XryxtrWUArb_yoW8AFy5Ko
        WUurZ5Cw1fAa15JFW5Kr4kWFW8CFs5GFWDWanrKrn09w1jy3WftF4xArnxGrW3C398J3W5
        Aa48J34fAw18Xa47n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5B7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8CwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
        vjDU0xZFpf9x07jL0edUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation
  Documentation/translations/zh_CN/doc-guide/kernel-doc.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/doc-guide/kernel-doc.rst            | 500 ++++++++++++++++++
 1 file changed, 500 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst

diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
new file mode 100644
index 000000000000..166542411eb8
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -0,0 +1,500 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/doc-guide/kernel-doc.rst
+
+:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+编写kernel-doc注释
+===========================
+
+Linux内核源文件可以包含kernel-doc格式的结构化文档注释，用以描述代码的函数、
+类型和设计。将文档嵌入源文件更容易保持文档最新。
+
+.. note:: 内核文档格式与javadoc、gtk-doc或Doxygen看似很相似，但由于历史原因，
+          实际有着明显的不同。内核源包含成千上万个kernel-doc注释。请坚持遵循
+          此处描述的风格。
+
+.. note:: kernel-doc无法包含Rust代码：请参考
+          :ref:`Documentation/rust/docs.rst <rust_docs>`。
+
+从注释中提取kernel-doc结构，并从中生成适当的 `Sphinx C 域`_ 函数和带有锚点的
+类型描述。这些注释将被过滤以生成特殊kernel-doc高亮和交叉引用。详见下文。
+
+.. _Sphinx C 域: http://www.sphinx-doc.org/en/stable/domains.html
+
+使用 ``EXPORT_SYMBOL`` 或 ``EXPORT_SYMBOL_GPL`` 导出到可加载模块的每个函数都
+应该有一个kernel-doc注释。模块使用的头文件中的函数和数据结构也应该有
+kernel-doc注释。
+
+对于其他内核文件（未标记为 ``static`` ）中外部可见的函数，提供kernel-doc格式
+的文档是一个很好的实践。我们也建议为私有（文件 ``static`` ）程序提供kernel-doc
+格式的文档，以确保内核源代码布局的一致性。此建议优先级较低，由内核源文件的
+维护者自行决定。
+
+如何格式化kernel-doc注释
+---------------------------------
+
+kernel-doc注释用 ``/**`` 作为开始标记。 ``kernel-doc`` 工具将提取以这种方式
+标记的注释。注释其余部分的格式类似于一个普通的多行注释，左侧有一列星号，以
+``*/`` 行结束。
+
+函数和类型的kernel-doc注释应该放在所描述的函数或类型之前，以便最大限度地提高
+更改代码的人同时更改文档的可能性。概述kernel-doc注释可以放在最顶部的任何地方。
+
+用详细模式和不生成实际输出来运行 ``kernel-doc`` 工具，可以验证文档注释的格式
+是否正确。例如::
+
+	scripts/kernel-doc -v -none drivers/foo/bar.c
+
+当请求执行额外的gcc检查时，内核构建将验证文档格式::
+
+	make W=n
+
+函数文档
+----------------------
+
+函数和函数式宏的kernel-doc注释的一般格式是::
+
+  /**
+   * 函数名() - 函数简要说明.
+   * @参数1: 描述第一个参数.
+   * @参数2: 描述第二个参数.
+   *        可以为参数提供一段
+   *        多行描述.
+   *
+   * 更详细的描述，进一步讨论函数 函数名(), 这可能对使用或修改它的人有用.
+   * 以空注释行开始, 内部可以包含空注释行.
+   *
+   * 详细描述可以有多个段落.
+   *
+   * Context: 描述函数是否可以休眠, 它需要、释放或期望持有什么锁.
+   *          可以写多行.
+   * Return: 描述函数返回值.
+   *
+   * 返回值描述也可以有多个段落,
+   * 并且应该放在注释块的末尾.
+   */
+
+函数名后面的简短描述可以跨多行，并以参数描述、空注释行或注释块结尾结束。
+
+函数参数
+~~~~~~~~~~~~~~~~~~~
+
+每个函数参数都应该按照顺序描述，紧跟在函数简要说明之后。不要在函数描述和参数
+之间，也不要在参数之间留空。
+
+每个 ``@参数:`` 描述可以跨多行。
+
+.. note::
+
+   如果 ``@参数`` 描述有多行，则说明的续行应该从上一行的同一列开始::
+
+      * @参数: 较长说明
+      *        的续行
+
+   或::
+
+      * @参数:
+      *		较长说明
+      *         的续行
+
+如果函数的参数数目可变，则需用kernel-doc格式对其进行描述::
+
+      * @...: 描述
+
+函数上下文
+~~~~~~~~~~~~~~~~
+
+可调用函数的上下文应该在 ``Context`` 节中描述。此节应该包括函数是休眠的还是
+可以从中断上下文调用的，以及它需要什么锁、释放什么锁和期望它的调用者持有什么
+锁。
+
+例如::
+
+  * Context: Any context.
+  * Context: Any context. Takes and releases the RCU lock.
+  * Context: Any context. Expects <lock> to be held by caller.
+  * Context: Process context. May sleep if @gfp flags permit.
+  * Context: Process context. Takes and releases <mutex>.
+  * Context: Softirq or process context. Takes and releases <lock>, BH-safe.
+  * Context: Interrupt context.
+
+返回值
+~~~~~~~~~~~~~
+
+如有返回值，应在 ``Return`` 节中描述。
+
+.. note::
+
+  #) 您提供的多行描述文本 *不会* 识别换行符，因此如果您想将某些文本预格式化，
+     如::
+
+	* Return:
+	* 0 - OK
+	* -EINVAL - invalid argument
+	* -ENOMEM - out of memory
+
+     它们在最终文档中变成一行::
+
+	Return: 0 - OK -EINVAL - invalid argument -ENOMEM - out of memory
+
+     因此，为了在需要的地方换行，您需要使用ReST列表，例如::
+
+      * Return:
+      * * 0		- OK to runtime suspend the device
+      * * -EBUSY	- Device should not be runtime suspended
+
+  #) 如果您提供的描述性文本中的行以某个后跟冒号的短语开头，则每一个这种短语
+     都将被视为新的节标题，可能会产生意料不到的效果。
+
+结构体、共用体、枚举类型文档
+-----------------------------------------------
+
+结构体（struct）、共用体（union）、枚举（enum）类型kernel-doc注释的一般格式为::
+
+  /**
+   * struct 结构体名 - 简要描述.
+   * @成员1: 成员1描述.
+   * @成员2: 成员2描述.
+   *           可以为成员提供
+   *           多行描述.
+   *
+   * 结构体的描述.
+   */
+
+可以用 ``union`` 或 ``enum`` 替换上面示例中的 ``struct`` ，以描述共用体或枚举。
+``成员`` 用于表示枚举中的元素或共用体成员。
+
+结构体名称后面的简要说明可以跨多行，并以成员说明、空白注释行或注释块结尾结束。
+
+成员
+~~~~~~~
+
+结构体、共用体和枚举的成员应以与函数参数相同的方式记录；它们后紧跟简短的描述，
+并且为多行。
+
+在结构体或共用体描述中，可以使用 ``private:`` 和 ``public:`` 注释标签。
+``private:`` 域内的字段不会列在生成的文档中。
+
+``private:`` 和 ``public:`` 标签必须紧跟在 ``/*`` 注释标记之后。可以选择是否
+在 ``:`` 和 ``*/`` 结束标记之间包含注释。
+
+例子::
+
+  /**
+   * struct 张三 - 简短描述
+   * @a: 第一个成员
+   * @b: 第二个成员
+   * @d: 第三个成员
+   *
+   * 详细描述
+   */
+  struct 张三 {
+      int a;
+      int b;
+  /* private: 仅内部使用 */
+      int c;
+  /* public: 下一个是公有的 */
+      int d;
+  };
+
+嵌套的结构体/共用体
+~~~~~~~~~~~~~~~~~~~~~
+
+嵌套的结构体/共用体可像这样记录::
+
+      /**
+       * struct nested_foobar - a struct with nested unions and structs
+       * @memb1: first member of anonymous union/anonymous struct
+       * @memb2: second member of anonymous union/anonymous struct
+       * @memb3: third member of anonymous union/anonymous struct
+       * @memb4: fourth member of anonymous union/anonymous struct
+       * @bar: non-anonymous union
+       * @bar.st1: struct st1 inside @bar
+       * @bar.st2: struct st2 inside @bar
+       * @bar.st1.memb1: first member of struct st1 on union bar
+       * @bar.st1.memb2: second member of struct st1 on union bar
+       * @bar.st2.memb1: first member of struct st2 on union bar
+       * @bar.st2.memb2: second member of struct st2 on union bar
+       */
+      struct nested_foobar {
+        /* Anonymous union/struct*/
+        union {
+          struct {
+            int memb1;
+            int memb2;
+          };
+          struct {
+            void *memb3;
+            int memb4;
+          };
+        };
+        union {
+          struct {
+            int memb1;
+            int memb2;
+          } st1;
+          struct {
+            void *memb1;
+            int memb2;
+          } st2;
+        } bar;
+      };
+
+.. note::
+
+   #) 在记录嵌套结构体或共用体时，如果结构体/共用体 ``张三`` 已命名，则其中
+      的成员 ``李四`` 应记录为 ``@张三.李四:``
+
+   #) 当嵌套结构体/共用体是匿名的时，其中的成员 ``李四`` 应记录为 ``@李四:``
+
+行间注释文档
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+结构成员也可在定义时以行间注释形式记录。有两种样式，一种是单行注释，其中开始
+``/**`` 和结束 ``*/`` 位于同一行；另一种是多行注释，开头结尾各自位于一行，就
+像所有其他核心文档注释一样::
+
+  /**
+   * struct 张三 - 简短描述.
+   * @张三: 成员张三.
+   */
+  struct 张三 {
+        int 张三;
+        /**
+         * @李四: 成员李四.
+         */
+        int 李四;
+        /**
+         * @王五: 成员王五.
+         *
+         * 此处，成员描述可以为好几段.
+         */
+        int 王五;
+        union {
+                /** @儿子: 单行描述. */
+                int 儿子;
+        };
+        /** @赵六: 描述@张三里面的结构体@赵六 */
+        struct {
+                /**
+                 * @赵六.女儿: 描述@张三.赵六里面的@女儿
+                 */
+                int 女儿;
+        } 赵六;
+  };
+
+Typedef文档
+---------------------
+
+Typedef的kernel-doc文档注释的一般格式为::
+
+  /**
+   * typedef 类型名称 - 简短描述.
+   *
+   * 类型描述.
+   */
+
+还可以记录带有函数原型的typedef::
+
+  /**
+   * typedef 类型名称 - 简短描述.
+   * @参数1: 参数1的描述
+   * @参数2: 参数2的描述
+   *
+   * 类型描述.
+   *
+   * Context: 锁（Locking）上下文.
+   * Return: 返回值的意义.
+   */
+   typedef void (*类型名称)(struct v4l2_ctrl *参数1, void *参数2);
+
+高亮与交叉引用
+-------------------------------
+
+在kernel-doc注释的描述文本中可以识别以下特殊模式，并将其转换为正确的
+reStructuredText标记和 `Sphinx C 域`_ 引用。
+
+.. attention:: 以下内容 **仅** 在kernel-doc注释中识别， **不会** 在普通的
+               reStructuredText文档中识别。
+
+``funcname()``
+  函数引用。
+
+``@parameter``
+  函数参数的名称（未交叉引用，仅格式化）。
+
+``%CONST``
+  常量的名称（未交叉引用，仅格式化）。
+
+````literal````
+  预格式化文本块。输出将使用等距字体。
+
+  若你需要使用在kernel-doc脚本或reStructuredText中有特殊含义的字符，则此功能
+  非常有用。
+
+  若你需要在函数描述中使用类似于 ``%ph`` 的东西，这特别有用。
+
+``$ENVVAR``
+  环境变量名称（未交叉引用，仅格式化）。
+
+``&struct name``
+  结构体引用。
+
+``&enum name``
+  枚举引用。
+
+``&typedef name``
+  Typedef引用。
+
+``&struct_name->member`` or ``&struct_name.member``
+  结构体或共用体成员引用。交叉引用将链接到结构体或共用体定义，而不是直接到成员。
+
+``&name``
+  泛类型引用。请首选上面描述的完整引用方式。此法主要是为了可能未描述的注释。
+
+从reStructuredText交叉引用
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+无需额外的语法来从reStructuredText文档交叉引用kernel-do注释中定义的函数和类型。
+只需以 ``()`` 结束函数名，并在类型之前写上 ``struct`` ， ``union`` ， ``enum``
+或 ``typedef`` 。
+例如::
+
+  See foo().
+  See struct foo.
+  See union bar.
+  See enum baz.
+  See typedef meh.
+
+若要在交叉引用链接中使用自定义文本，可以通过以下语法进行::
+
+  See :c:func:`my custom link text for function foo <foo>`.
+  See :c:type:`my custom link text for struct bar <bar>`.
+
+有关更多详细信息，请参阅 `Sphinx C 域`_ 文档。
+
+总述性文档注释
+-------------------------------
+
+为了促进源代码和注释紧密联合，可以将kernel-doc文档块作为自由形式的注释，而
+不是函数、结构、联合、枚举或typedef的绑定kernel-doc。例如，这可以用于解释
+驱动程序或库代码的操作理论。
+
+这是通过使用带有节标题的 ``DOC:`` 节关键字来实现的。
+
+总述或高层级文档注释的一般格式为::
+
+  /**
+   * DOC: Theory of Operation
+   *
+   * The whizbang foobar is a dilly of a gizmo. It can do whatever you
+   * want it to do, at any time. It reads your mind. Here's how it works.
+   *
+   * foo bar splat
+   *
+   * The only drawback to this gizmo is that is can sometimes damage
+   * hardware, software, or its subject(s).
+   */
+
+``DOC:`` 后面的标题用作源文件中的标题，但也用作提取文档注释的标识符。因此，
+文件中的标题必须是唯一的。
+
+包含kernel-doc注释
+=============================
+
+文档注释可以被包含在任何使用专用kernel-doc Sphinx指令扩展的reStructuredText
+文档中。
+
+kernel-doc指令的格式如下::
+
+  .. kernel-doc:: source
+     :option:
+
+*source* 是相对于内核源代码树的源文件路径。
+支持以下指令选项：
+
+export: *[source-pattern ...]*
+  包括 *source* 中使用 ``EXPORT_SYMBOL`` 或 ``EXPORT_SYMBOL_GPL`` 导出的所有
+  函数的文档，无论是在 *source* 中还是在 *source-pattern* 指定的任何文件中。
+
+  当kernel-doc注释被放置在头文件中，而 ``EXPORT_SYMBOL`` 和 ``EXPORT_SYMBOL_GPL``
+  位于函数定义旁边时， *source-pattern* 非常有用。
+
+  例子::
+
+    .. kernel-doc:: lib/bitmap.c
+       :export:
+
+    .. kernel-doc:: include/net/mac80211.h
+       :export: net/mac80211/*.c
+
+internal: *[source-pattern ...]*
+  包括 *source* 中所有在 *source* 或 *source-pattern* 的任何文件中都没有使用
+  ``EXPORT_SYMBOL`` 或 ``EXPORT_SYMBOL_GPL`` 导出的函数和类型的文档。
+
+  例子::
+
+    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+       :internal:
+
+identifiers: *[ function/type ...]*
+  在 *source* 中包含每个 *function* 和 *type* 的文档。如果没有指定 *function* ，
+  则 *source* 中所有函数和类型的文档都将包含在内。
+
+  例子::
+
+    .. kernel-doc:: lib/bitmap.c
+       :identifiers: bitmap_parselist bitmap_parselist_user
+
+    .. kernel-doc:: lib/idr.c
+       :identifiers:
+
+no-identifiers: *[ function/type ...]*
+  排除 *source* 中所有 *function* 和 *type* 的文档。
+
+  例子::
+
+    .. kernel-doc:: lib/bitmap.c
+       :no-identifiers: bitmap_parselist
+
+functions: *[ function/type ...]*
+  这是“identifiers”指令的别名，已弃用。
+
+doc: *title*
+  包含 *source* 中由 *title*  标题标识的 ``DOC:`` 文档段落。 *title* 中允许
+  空格；不要在 *title* 上加引号。 *title*  仅用作段落的标识符，不包含在输出中。
+  请确保在所附的reStructuredText文档中有适当的标题。
+
+  例子::
+
+    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+       :doc: High Definition Audio over HDMI and Display Port
+
+如果没有选项，kernel-doc指令将包含源文件中的所有文档注释。
+
+kernel-doc扩展包含在内核源代码树中，位于 ``Documentation/sphinx/kerneldoc.py`` 。
+在内部，它使用 ``scripts/kernel-doc`` 脚本从源代码中提取文档注释。
+
+.. _kernel_doc_zh:
+
+如何使用kernel-doc生成手册（man）页
+-------------------------------------------
+
+如果您只想使用kernel-doc生成手册页，可以从内核git树这样做::
+
+  $ scripts/kernel-doc -man \
+    $(git grep -l '/\*\*' -- :^Documentation :^tools) \
+    | scripts/split-man.pl /tmp/man
+
+一些旧版本的git不支持路径排除语法的某些变体。
+以下命令之一可能适用于这些版本::
+
+  $ scripts/kernel-doc -man \
+    $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
+    | scripts/split-man.pl /tmp/man
+
+  $ scripts/kernel-doc -man \
+    $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools") \
+    | scripts/split-man.pl /tmp/man
+
-- 
2.20.1

