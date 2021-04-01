Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B797AC43460
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99969611C9
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235498AbhDAR43 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:56:29 -0400
Received: from m34-101.88.com ([104.250.34.101]:33974 "EHLO 88.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237277AbhDARvP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:51:15 -0400
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Thu, 01 Apr 2021 13:51:14 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=ASbMt47A/MRnnixjOGpwSexCafpygq/mpK+s+
        hHb9OA=; b=WZjjy43wATaZb7E72/AQ27h+R9Il7mePUfvid3zQkUypmMjxDxHGj
        5dZDOLEi2KHwNUnYmsexpRvMXVNAQh13EWV6CANXkaO67oMdKwk/hZDlR4UGS9dM
        MlYJLpQsedT6q7QtUkLFxGYqpeyWxD+w9EvqURuATMAM8P1hfWvIao=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdAXzmVgkydGAA--.26878S2;
        Thu, 01 Apr 2021 21:43:52 +0800 (CST)
Date:   Thu, 1 Apr 2021 21:43:51 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/5] docs/zh_CN: Add translation
 zh_CN/doc-guide/sphinx.rst
Message-ID: <20210401134350.GA27759@mipc>
References: <cover.1617260163.git.bobwxc@email.cn>
 <8e7152f494d93b9eac04ff5fce8b46f1236f1542.1617260163.git.bobwxc@email.cn>
 <CAMU9jJodfzup_-rxc7Y6Fn89MkGnsoAoY+YwCcHpzV99itB6_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJodfzup_-rxc7Y6Fn89MkGnsoAoY+YwCcHpzV99itB6_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdAXzmVgkydGAA--.26878S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFWxuFy3Gw15ArWDKFWUtwb_yoWftw1DpF
        sIg397KF4kJry8JrWxKrsrZw1akrW8AF12qF18tFyIyrnayFyDtrWjvr1rWFWxWFy8AFyj
        vF17WrW7Cry8C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyjb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6ry8MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYY7kG6xAYrwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
        6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU5rgA7UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu, Apr 01, 2021 at 08:44:07PM +0800, teng sterling wrote:
> Hi~
> Xiang cheng
> 
> Wu XiangCheng <bobwxc@email.cn> 于2021年4月1日周四 下午3:08写道：
> >
> > Add new translation
> >   Documentation/translations/zh_CN/doc-guide/sphinx.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../translations/zh_CN/doc-guide/sphinx.rst   | 415 ++++++++++++++++++
> >  1 file changed, 415 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.rst
> >
> > diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > new file mode 100644
> > index 000000000000..6c2555c98dd3
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
[...]
> > +
> > +检查Sphinx依赖项
> > +--------------------------------
> > +
> > +这有一个脚本可以自动检查Sphinx依赖项。如果它认得您的发行版，还会提示您所用发行
> > +版的安装命令::
> > +
> > +       $ ./scripts/sphinx-pre-install
> > +       Checking if the needed tools for Fedora release 26 (Twenty Six) are available
> > +       Warning: better to also install "texlive-luatex85".
> > +       You should run:
> translate？:)
> > +
> > +               sudo dnf install -y texlive-luatex85
> > +               /usr/bin/virtualenv sphinx_1.7.9
> > +               . sphinx_1.7.9/bin/activate
> > +               pip install -r Documentation/sphinx/requirements.txt
> > +
> > +       Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 468.
> translate？:)

These two are actually the *output* of the script
	`./scripts/sphinx-pre-install`
They are rendered as a code block. I think no need for translating.

> > +
> > +默认情况下，它会检查html和PDF的所有依赖项，包括图像、数学表达式和LaTeX构建的
> > +需求，并假设将使用虚拟Python环境。html构建所需的部分被认为是必需的，其他部分
> 部分 -> 依赖项？

OK.

> > +则是可选的。
> > +
> > +它支持两个可选参数：
> > +
> > +``--no-pdf``
> > +
> > +       禁用PDF检查；
> > +
> > +``--no-virtualenv``
> > +
> > +       使用Sphinx的系统打包，而不是Python虚拟环境。
> Maybe the translation is wrong？:)

This means to use the Sphinx package provied by os package manager such
as apt/yum, instead of using `python -m venv` then `pip install ...`.

> > +
> > +Sphinx构建
> > +============
> > +
> > +生成文档的常用方法是运行 ``make htmldocs`` 或 ``make pdfdocs`` 。还有其他可用
> 其他 -> 其它

OK.

> > +的格式：请参阅 ``make help`` 的文档部分。生成的文档放在 ``Documentation/output``
> > +下各个格式的子目录中。
> Any better translation？

相应格式的子目录

> > +
> > +要生成文档，显然必须安装Sphinx（ ``sphinx-build`` ）。要让HTML输出更漂亮，可以
> > +使用Read the Docs Sphinx主题（ ``sphinx_rtd_theme`` ）。对于PDF输出，您还需要
> > +``XeLaTeX`` 和来自ImageMagick（https://www.imagemagick.org）的 ``convert(1)`` 。
> > +所有这些在一般发行版中都有可用打包。
> 所有这些软件包都是广泛存在的，并且被打包进发行版。？

All of these are widely available and packaged in distributions.
use this 所有这些软件在大多发行版中都可用或已打包。

> > +
> > +要传递额外的选项给Sphinx，可以使用 ``SPHINXOPTS`` make变量。例如，使用
> 可以使用make变量 ``SPHINXOPTS``。？

OK.

> > +``make SPHINXOPTS=-v htmldocs`` 获得更详细的输出。
> > +
> > +
> > +要删除生成的文档，请运行 ``make cleandocs`` 。
> > +
> > +编写文档
> > +=====================
> > +
> > +添加新文档很容易，只需：
> > +
> > +1. 在 ``Documentation`` 下某处添加一个新的 ``.rst`` 文件。
> > +2. 从 ``Documentation/index.rst`` 中的Sphinx `主目录树`_ 链接到它。
> > +
> > +.. _主目录树: http://www.sphinx-doc.org/en/stable/markup/toctree.html
> > +
> > +对于简单的文档（比如您现在正在阅读的文档），这通常已经足够好了，但是对于较大
> > +的文档，最好创建一个子目录（或者使用现有的子目录）。例如，图形子系统文档位于
> > +``Documentation/gpu`` 下，拆分为多个 ``.rst`` 文件，并具有从主目录链接来的单
> > +独索引 ``index.rst`` （有自己的目录树 ``toctree`` ）。
> > +
> > +请参阅 `Sphinx <http://www.sphinx-doc.org/>`_ 和 `reStructuredText
> > +<http://docutils.sourceforge.net/rst.html>`_ 的文档，以了解如何使用它们。
> > +特别是Sphinx `reStructuredText 基础`_ 这是开始学习使用reStructuredText的
> > +好地方。还有一些 `Sphinx 特殊标记结构`_ 。
> > +
> > +.. _reStructuredText 基础: http://www.sphinx-doc.org/en/stable/rest.html
> > +.. _Sphinx 特殊标记结构: http://www.sphinx-doc.org/en/stable/markup/index.html
> > +
> > +内核文档的具体指南
> > +------------------------------------------------
> > +
> > +这是一些内核文档的具体指南：
> > +
> > +* 请不要过于痴迷转换格式到reStructuredText。保持简单。在大多数情况下，文档
> > +  应该是纯文本，格式应足够一致，以便可以转换为其他格式。
> > +
> > +* 将现有文档转换为reStructuredText时，请尽量减少格式更改。P
> what is P？

Will delete it.
'P' is paste in vim :P

> > +
> > +* 在转换文档时，还要更新内容，而不仅仅是格式。
> > +
> > +* 请遵循标题修饰符的顺序：
> > +
> > +  1. ``=`` 文档标题，要有上线::
> > +
> > +       ==============
> > +       文档标题
> > +       ==============
> > +
> > +  2. ``=`` 章::
> > +
> > +       章标题
> > +       ========
> > +
> > +  3. ``-`` 节::
> > +
> > +       节标题
> > +       -------
> > +
> > +  4. ``~`` 小节::
> > +
> > +       小节标题
> > +       ~~~~~~~~~~
> > +
> > +  尽管RST没有规定具体的顺序（“没有强加一个固定数量和顺序的节标题装饰风格，最终
> > +  按照的顺序将是实际遇到的顺序。”），但是拥有一个通用级别的文档更容易遵循。
> > +
> > +* 对于插入固定宽度的文本块（用于代码样例、用例等）： ``::`` 用于语法高亮意义不
> > +  大的内容，尤其是短代码段； ``.. code-block:: <language>`` 用于需要语法高亮的
> > +  较长代码块。对于嵌入到文本中的简短代码片段，请使用 \`\` 。
> > +
> > +
> > +C域
> > +------------
> > +
> > +**Sphinx C域（Domain）** （name c）适用于C API文档。例如，功能原型：
> 函数原型？

OK!

[...]
> > +交叉引用
> > +-----------------
> > +
> > +从一页文档到另一页文档的交叉引用可以通过简单地写出文件路径来完成，无特殊格式
> > +要求。路径可以是绝对路径或相对路径。绝对路径从“Documentation/”开始。例如，要
> > +交叉引用此页，以下写法皆可，取决于具体的文档目录（注意 ``.rst`` 扩展名是可选
> > +的）::
> > +
> > +    See Documentation/doc-guide/sphinx.rst. This always works.
> > +    Take a look at sphinx.rst, which is at this same directory.
> > +    Read ../sphinx.rst, which is one directory above.
> translate？

OK

> > +
> > +如果要使用相对路径，则需要使用Sphinx的 ``doc`` 修饰。例如，从同一目录引用此页
> > +的操作如下::
> > +
> > +    See :doc:`my custom link text for document sphinx <sphinx>`.
> translate？

OK

> > +
> > +对于大多数用例，前者是首选，因为它更干净，更适合阅读源文件的人。如果您遇到一
> > +个没有任何特殊作用的 ``:doc:`` 用法，请将其转换为文档路径。
> > +
> > +有关交叉引用kernel-doc函数或类型的信息，请参阅
> > +Documentation/doc-guide/kernel-doc.rst 。
> > +
> > +.. _sphinx_kfigure_zh:
> > +
> > +图形图片
> > +================
> > +
> > +如果要添加图片，应该使用 ``kernel-figure`` 和 ``kernel-image`` 指令。例如，
> > +要插入具有可缩放图像格式的图形，请使用SVG（:ref:`svg_image_example_zh` ）::
> > +
> > +    .. kernel-figure::  svg_image.svg
> > +       :alt:    简易 SVG 图片
> > +
> > +       SVG 图片示例
> > +
> > +.. _svg_image_example_zh:
> > +
> > +.. kernel-figure::  svg_image.svg
> > +   :alt:    简易 SVG 图片
> > +
> > +   SVG 图片示例
> > +
> > +内核figure（和image）指令支持 DOT 格式文件，请参阅
> > +
> > +* DOT：http://graphviz.org/pdf/dotguide.pdf
> > +* Graphviz：http://www.graphviz.org/content/dot-language
> > +
> > +一个简单的例子（:ref:`hello_dot_file_zh` ）::
> > +
> > +  .. kernel-figure::  hello.dot
> > +     :alt:    你好，世界
> > +
> > +     DOT 示例
> > +
> > +.. _hello_dot_file_zh:
> > +
> > +.. kernel-figure::  hello.dot
> > +   :alt:    你好，世界
> > +
> > +   DOT 示例
> any better translation？

Nope. It will act as the title of this figure.
Keep simple.

[...]
> > --
> > 2.20.1
> >
> 
> Thanks！
> 
> Yanteng

