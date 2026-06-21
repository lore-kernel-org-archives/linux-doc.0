Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08228C874
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782047561; cv=none; b=ueO5Uj1V70Th+Mpuj+Ov2rQQmyc9Zv0irHwPyhR/u9G15qP1+SXiEpBJk1WYbIkSudWuxzHT9yCHis26BgxK4He1UwIZOCm69Hm/e2l7+8So8i45R4O9ktlFsic55WSfL0ilQr5A+zgR/AcwUrdx/PKSwWS5A3naFK2rxJ6PVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782047561; c=relaxed/simple;
	bh=2pSWhC7sWXUPeIP8Go0Er5txaqNcwpEYKgo7sFwXZ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sz9d8IV6MbPrVuIe2TluQV7iCoa+2SewbpQSyC13sp9u/OenX1X8rnsyrMhiblxmcvlFgID1YLUgLQCbPCxQOEy87r8JbY4cR8foL3EqHcpXcp9eK1rV376LRYAga7o5tyqAur8F1XFkAe2K4gC1lLpfVcsuswyBSeJKgU1h4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+QrPW4r; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+QrPW4r"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso3157008a91.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782047558; x=1782652358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28PBRXgwImdFqpLKwLHF4u08pHnJZrBFQZ0aLiG8nHk=;
        b=p+QrPW4rWZR7uAoJsSm0Okz4NGXqS8IpSH34aktOt3qzlhJaMWt/K28BmP35LDJ2rv
         hwE/VI33RzMbadfngbclEQfxYjTDrkhcHtUSC+Du4O83Kx1ESGZrgCASMLINCQKb5U48
         OTrRhcFM51ykWjWWCKfV9zNUW9R/PD1RHx7uhfOopbwWJd52Ayfg6SO8A56BcTtxn4UH
         zViuwy4bBjhsUYHSgmH/M8YJyWS/nKs+8miIoIHwoJmrCrTNWZguyQnSKcenD6yVWIHl
         L0Cf2m+/aFt+1Xvbr6BKjgaTVuPvN/lCLh/haZDgucCDqlk89O11PakaSpM2KaTtlgKx
         Ep+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782047558; x=1782652358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28PBRXgwImdFqpLKwLHF4u08pHnJZrBFQZ0aLiG8nHk=;
        b=XYP+IDhusljVXHbFnWB27sjeLf9n2UEvNLKdzbaI5sJmFeNwADjITXKJr2o2FmaenT
         nbb4jXYEPoDin5FJvD42lydgjwsjb4z2aFCYOvadjpdjQL14qdXlszdtgV1ggEsvu2L/
         1/ymQ31vD1cyvyWH0+WZIVjxBoDBUNKjv3otRPdLCDS/16jZCfX1nRXFigxWnTRHpTrs
         IDwsyKeVaAmOGVCLhSIZgkU6ErRV7vVAEgnfdC1ov/iU5Nvl8Tn7NXvQPBE/1DdyZ56w
         /tYzkJnWNiSkA76PIlnbbrkxw45f9RRkqcH6/jGPwqmoYoH3zaADdlc5fgmtA3iGgGBk
         uo4w==
X-Forwarded-Encrypted: i=1; AHgh+RpJt5MhCsevREgabk9ByslEjqQyQn3UZEj2RJrHS3QjdaelPSfvBx1E9WrQNic4/4gLFUyEdUtefG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjY9noPrCttBQ9tbjJ3J2G0wv6t0Chqwca7wJHvgc58IKY4JO
	RO74y4G/h7019fkUoymTkGPGkNAWSHCsB/frubctC9V2UgaIUFzB5MPq
X-Gm-Gg: AfdE7clD0LHrr9cFGJ+Y17cqifLujx2kQ/iI+RUcIfIlI5IUlpi3lxw2JCwBD9xMnp2
	6Hl37VENA/OhrKNqnXo5piTQfDMIOYFFpa6BhcGXFBr6aHC8WM8A6eRz7AnS60tJym82tj0Pttu
	TCgWWTCgunITucKZEuisUM2TZNeqzCLkGLAzNC5KkdQ12kYiysEK6c4ZCkN05D9+KL2YmPeJFN1
	676dTejXmbXvTmOPvL8PYRCLP63m5W/IE90gvDL6+SFPffxq5CtC+ePfSzmHqgkhbbKedfnH2oq
	vGkrWw3XDBSWBbExlqAgHI+J2igYOJAS/WGIHIp2c9uIq+n+9xAD92QsJOnoUisrNJeL7C+SPmC
	JOs4vqVBpJo5bAR6523fPisOcpx4BXzvso4JpPCSmZiJV+YGVhnyvQJWxna3BrzT8wwsokyMd39
	e1pFkJEKbIUmeEmaNfkBTQF+SfHOqK
X-Received: by 2002:a17:902:d488:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2c725ba507emr106566035ad.2.1782047558425;
        Sun, 21 Jun 2026 06:12:38 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc1:3c11:741b:44f:bd4b:7c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe6c6sm45943405ad.58.2026.06.21.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:12:38 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH v2 2/2] docs/zh_CN: update sphinx.rst translation
Date: Sun, 21 Jun 2026 21:12:12 +0800
Message-ID: <20260621131215.1303439-3-qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the zh_CN translation of doc-guide/sphinx.rst.

Update this translation through commit f1c2db1f145b
("docs: move test_doc_build.py to tools/docs")

- clean up the file header anchor `_sphinxdoc_zh`
- sync the Chinese translation with the current Sphinx build requirements
- add sections on HTML math rendering and minimum-version testing
- refresh guidance for tables, cross-references, and commit references

Assisted-by: Codex:GPT-5.4
Signed-off-by: Jiandong Qiu <qiujiandong1998@gmail.com>
---
 .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++++++++++++----
 1 file changed, 133 insertions(+), 34 deletions(-)

diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
index 3375c6f3a811..11e846fc97e4 100644
--- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
+++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
@@ -1,10 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/doc-guide/sphinx.rst
 
-:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
-
-.. _sphinxdoc_zh:
+:译者:
+ - 吴想成 Wu XiangCheng <bobwxc@email.cn>
+ - 裘剑东 Jiandong Qiu <qiujiandong1998@gmail.com>
 
 简介
 ====
@@ -14,7 +15,7 @@ Linux内核使用 `Sphinx <http://www.sphinx-doc.org/>`_ 来把 ``Documentation`
 换成漂亮的文档。使用 ``make htmldocs`` 或 ``make pdfdocs`` 命令即可构建HTML
 或PDF格式的文档。生成的文档放在 ``Documentation/output`` 文件夹中。
 
-reStructuredText文件可能包含包含来自源文件的结构化文档注释或kernel-doc注释。
+reStructuredText文件可能包含来自源文件的结构化文档注释或kernel-doc注释。
 通常它们用于描述代码的功能、类型和设计。kernel-doc注释有一些特殊的结构和
 格式，但除此之外，它们还被作为reStructuredText处理。
 
@@ -26,7 +27,7 @@ reStructuredText文件可能包含包含来自源文件的结构化文档注释
 安装Sphinx
 ==========
 
-Documentation/ 下的ReST文件现在使用sphinx1.7或更高版本构建。
+Documentation/ 下的ReST文件现在使用 ``sphinx`` 3.4.3 或更高版本构建。
 
 这有一个脚本可以检查Sphinx的依赖项。更多详细信息见
 :ref:`sphinx-pre-install_zh` 。
@@ -38,21 +39,13 @@ Documentation/ 下的ReST文件现在使用sphinx1.7或更高版本构建。
 ``virtualenv-3`` 或 ``virtualenv`` 在虚拟环境中安装Sphinx，具体取决于发行版
 如何打包Python3。
 
-.. note::
-
-   #) html输出建议使用RTD主题。根据Sphinx版本的不同，它应该用
-      ``pip install sphinx_rtd_theme`` 单独安装。
+总之，如您要安装最新版的Sphinx，应执行::
 
-   #) 一些ReST页面包含数学表达式。由于Sphinx的工作方式，这些表达式是使用 LaTeX
-      编写的。它需要安装amsfonts和amsmath宏包，以便显示。
+       $ virtualenv sphinx_latest
+       $ . sphinx_latest/bin/activate
+       (sphinx_latest) $ pip install -r Documentation/sphinx/requirements.txt
 
-总之，如您要安装Sphinx 2.4.4版本，应执行::
-
-       $ virtualenv sphinx_2.4.4
-       $ . sphinx_2.4.4/bin/activate
-       (sphinx_2.4.4) $ pip install -r Documentation/sphinx/requirements.txt
-
-在运行 ``. sphinx_2.4.4/bin/activate`` 之后，提示符将变化，以指示您正在使用新
+在运行 ``. sphinx_latest/bin/activate`` 之后，提示符将变化，以指示您正在使用新
 环境。如果您打开了一个新的shell，那么在构建文档之前，您需要重新运行此命令以再
 次进入虚拟环境中。
 
@@ -76,6 +69,23 @@ PDF和LaTeX构建
 根据发行版的不同，您可能还需要安装一系列 ``texlive`` 软件包，这些软件包提供了
 ``XeLaTeX`` 工作所需的最小功能集。
 
+HTML中的数学表达式
+------------------
+
+有些ReST页面中包含数学表达式。由于Sphinx的工作方式，这些表达式使用LaTeX
+符号书写。Sphinx在HTML输出中渲染数学表达式有两种方式：一种是名为 `imgmath`_
+的扩展，它将数学表达式转换成图像并嵌入到HTML页面中。
+另一种是名为 `mathjax`_ 的扩展，它将数学表达式的渲染交由支持 JavaScript
+的浏览器处理。
+在6.1版内核文档之前，前者是唯一可用的方式，并且需要安装大量texlive软件包，
+其中包括amsfonts和amsmath等。
+
+自内核6.1版本起，无需安装任何texlive软件包即可构建包含数学表达式的HTML
+页面。更多信息请参阅 :ref:`choice_of_math_renderer_zh`。
+
+.. _imgmath: https://www.sphinx-doc.org/en/master/usage/extensions/math.html#module-sphinx.ext.imgmath
+.. _mathjax: https://www.sphinx-doc.org/en/master/usage/extensions/math.html#module-sphinx.ext.mathjax
+
 .. _sphinx-pre-install_zh:
 
 检查Sphinx依赖项
@@ -108,7 +118,29 @@ PDF和LaTeX构建
 
 ``--no-virtualenv``
 
-	使用Sphinx的系统打包，而不是Python虚拟环境。
+	使用系统发行版提供的Sphinx软件包，而不是Python虚拟环境。
+
+安装最小版本的Sphinx
+--------------------
+
+在修改Sphinx构建系统时，确保其最小支持版本仍然可用非常重要。
+然而，在现代发行版上，这样做正变得越来越困难，因为在Python 3.13及以上版本
+环境下，已经无法安装该最小版本。
+
+要按照 Documentation/translations/zh_CN/process/changes.rst
+中定义的最低支持Python版本进行测试，可以使用该版本创建一个虚拟环境，
+并安装最小依赖::
+
+	/usr/bin/python3.9 -m venv sphinx_min
+	. sphinx_min/bin/activate
+	pip install -r Documentation/sphinx/min_requirements.txt
+
+更全面的测试可以使用以下脚本完成:
+
+	tools/docs/test_doc_build.py
+
+该脚本会为每个受支持的Python版本创建一个虚拟环境，并可选择针对一定范围内的
+Sphinx版本构建文档。
 
 Sphinx构建
 ==========
@@ -117,17 +149,66 @@ Sphinx构建
 的格式：请参阅 ``make help`` 的文档部分。生成的文档放在 ``Documentation/output``
 下相应格式的子目录中。
 
-要生成文档，显然必须安装Sphinx（ ``sphinx-build`` ）。要让HTML输出更漂亮，可以
-使用Read the Docs Sphinx主题（ ``sphinx_rtd_theme`` ）。对于PDF输出，您还需要
-``XeLaTeX`` 和来自ImageMagick（https://www.imagemagick.org）的 ``convert(1)`` 。
-所有这些软件在大多发行版中都可用或已打包。
+要生成文档，显然必须安装Sphinx（ ``sphinx-build`` ）。对于PDF输出，您还需
+要 ``XeLaTeX`` 和来自 ImageMagick（https://www.imagemagick.org）的
+``convert(1)`` 。\ [#ink]_ 所有这些软件在各大发行版中都很常见，
+也都有对应的软件包。
 
 要传递额外的选项给Sphinx，可以使用make变量 ``SPHINXOPTS`` 。例如，使用
 ``make SPHINXOPTS=-v htmldocs`` 获得更详细的输出。
 
+也可以通过make变量 ``DOCS_CSS`` 传入一个额外的DOCS_CSS覆盖文件，以自定义
+html布局。
+
+默认情况下，构建HTML文档时使用的是"Alabaster"主题；该主题随Sphinx一同提供，
+无需单独安装。也可以通过make变量 ``DOCS_THEME`` 覆盖Sphinx主题。
+
+.. note::
+
+   有些人可能更喜欢在html输出中使用RTD主题。根据Sphinx版本的不同，它可能需要
+   单独安装，可使用 ``pip install sphinx_rtd_theme`` 进行安装。
+
+还有一个make变量 ``SPHINXDIRS`` ，在测试构建某个文档子集时很有用。例如，您可
+以通过运行 ``make SPHINXDIRS=doc-guide htmldocs`` 构建
+``Documentation/doc-guide`` 下的文档。 ``make help`` 的文档部分会显示可指定的
+子目录列表。
 
 要删除生成的文档，请运行 ``make cleandocs`` 。
 
+.. [#ink] 如果还安装了来自 Inkscape（https://inkscape.org）的 ``inkscape(1)`` ，
+	  则能够提升嵌入到PDF文档中的图像质量，尤其是在5.18及之后的内核版本中。
+
+.. _choice_of_math_renderer_zh:
+
+数学渲染器的选择
+----------------
+
+自内核 6.1 版本起， ``mathjax`` 可作为html输出中数学渲染器的后备方案。\ [#sph1_8_zh]_
+
+数学渲染器会根据可用命令按如下方式选择：
+
+.. table:: HTML 中数学渲染器的选择
+
+    ============ ================= ============
+    数学渲染器   所需命令          图像格式
+    ============ ================= ============
+    imgmath      latex, dvipng     PNG（栅格）
+    mathjax
+    ============ ================= ============
+
+也可以通过设置环境变量 ``SPHINX_IMGMATH`` 来覆盖该选择，如下所示：
+
+.. table:: 设置 ``SPHINX_IMGMATH`` 的效果
+
+    ====================== ==========
+    设置                   渲染器
+    ====================== ==========
+    ``SPHINX_IMGMATH=yes`` imgmath
+    ``SPHINX_IMGMATH=no``  mathjax
+    ====================== ==========
+
+.. [#sph1_8_zh] 数学渲染器的后备机制要求Sphinx >= 1.8。
+
 编写文档
 ========
 
@@ -187,7 +268,8 @@ Sphinx构建
        ~~~~~~~~
 
   尽管RST没有规定具体的顺序（“没有强加一个固定数量和顺序的节标题装饰风格，最终
-  按照的顺序将是实际遇到的顺序。”），但是拥有一个通用级别的文档更容易遵循。
+  按照的顺序将是实际遇到的顺序。”），但整体上让较高层级的标题样式保持一致，
+  会更便于阅读和理解文档结构。
 
 * 对于插入固定宽度的文本块（用于代码样例、用例等）： ``::`` 用于语法高亮意义不
   大的内容，尤其是短代码段； ``.. code-block:: <language>`` 用于需要语法高亮的
@@ -218,15 +300,24 @@ C域
 神奇力量，如果给定函数名的索引项存在，文档构建系统会自动将对 ``function()``
 的引用转换为交叉引用。如果在内核文档中看到 ``c:func:`` 的用法，请删除它。
 
-
-列表
+表格
 ----
 
-我们建议使用 *列式表* 格式。 *列式表* 格式是二级列表。与ASCII艺术相比，它们对
-文本文件的读者来说可能没有那么舒适。但其优点是易于创建或修改，而且修改的差异
-（diff）更有意义，因为差异仅限于修改的内容。
+reStructuredText 为表格语法提供了多种选项。内核文档中的表格通常优先使用
+*simple table* 或 *grid table* 语法。更多细节请参阅
+`reStructuredText 用户参考中的表格语法`_ 。
+
+.. _reStructuredText 用户参考中的表格语法:
+   https://docutils.sourceforge.io/docs/user/rst/quickref.html#tables
 
-*平铺表* 也是一个二级列表，类似于 *列式表* ，但具有一些额外特性：
+列式表
+~~~~~~
+
+列式表（``list-table``）格式对于无法用常规Sphinx ASCII艺术格式轻松排版的表格来说
+可能很有用。然而，这种格式对于纯文本文档的读者来说几乎无法理解，因此，
+除非有充分的理由，否则应避免使用。
+
+``flat-table`` 也是一个二级列表，类似于 ``list-table`` ，但具有一些额外特性：
 
 * 列范围：使用 ``cspan`` 修饰，可以通过其他列扩展单元格
 
@@ -302,15 +393,15 @@ C域
 
 从一页文档到另一页文档的交叉引用可以通过简单地写出文件路径来完成，无特殊格式
 要求。路径可以是绝对路径或相对路径。绝对路径从“Documentation/”开始。例如，要
-交叉引用此页，以下写法皆可，取决于具体的文档目录（注意 ``.rst`` 扩展名是可选
+交叉引用此页，以下写法皆可，取决于具体的文档目录（注意 ``.rst`` 扩展名是必需
 的）::
 
     参见 Documentation/doc-guide/sphinx.rst 。此法始终可用。
     请查看 sphinx.rst ，仅在同级目录中有效。
     请阅读 ../sphinx.rst ，上级目录中的文件。
 
-如果要使用相对路径，则需要使用Sphinx的 ``doc`` 修饰。例如，从同一目录引用此页
-的操作如下::
+如果希望链接显示的文本不同于文档标题，则需要使用 Sphinx 的 ``doc`` 修饰。例
+如::
 
     参见 :doc:`sphinx文档的自定义链接文本 <sphinx>`.
 
@@ -318,7 +409,15 @@ C域
 个没有任何特殊作用的 ``:doc:`` 用法，请将其转换为文档路径。
 
 有关交叉引用kernel-doc函数或类型的信息，请参阅
-Documentation/doc-guide/kernel-doc.rst 。
+Documentation/translations/zh_CN/doc-guide/kernel-doc.rst 。
+
+引用提交
+~~~~~~~~
+
+对 git 提交的引用如果采用以下格式书写，会自动转换为超链接::
+
+    commit 72bf4f1767f0
+    commit 72bf4f1767f0 ("net: do not leave an empty skb in write queue")
 
 .. _sphinx_kfigure_zh:
 
-- 
Jiandong Qiu <qiujiandong1998@gmail.com>
