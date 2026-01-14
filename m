Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0FA3A4F2E;
	Wed, 14 Jan 2026 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408921; cv=none; b=kU+wZtsPQ3GNRycBsofAyyN9daPIGkHTBm8NEfgKz389mtgSrjZTUov0G8xrif5DArp1JryHmiT3cPtcvcNclsgpWFsUDzllNoO18c2FMjsiiqQ95UBPSjp1fH/fKJOkeC1aaXAy/cUHAJftiMKOq54ccuCuKe98QbNMTiO/XA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408921; c=relaxed/simple;
	bh=SX1sa8CiqOBBWhpbhpIXX3id/ld04Q1Rs7bqSyJg+As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQBlnZ/P1nxChcyVdYW2VYvJBDO29rCkoGXVE60ZO3Wqyi0J7R5V2oFaM5aN+/a6hDZ9zfNk88x4FcWuJlfrSg1FMxNu+lC6nCH5IYtYEHg8F5M44DsQtUHSGPuc8d7no4iotunxjSg/WxOEe5RVUcQLNnAhSG7IKaIDO9CNGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Vre51E+j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Vre51E+j"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 60AD940C9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768408918; bh=3KOvvozDmCpKfbGUoA+YZq8QeW7SfmkTQKClfqAjp7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vre51E+jZTOnSFQPXUM770ItxPhrpI9IJ90zlv9QVo75mjDrnz6MOO8bezxV5zXVp
	 O7NIA1FCr7UB+1xFUQwU1qvRamY3LrolIJwNqzOX/StC1cc/2Mg5A57O8a4ghXWebr
	 VzIWAknuOOmo1Oseuc1TsR9Mov7P8fpNk6oXfbC/AW9Op8NoXv0x3XV2mZwVw/7w6S
	 sbwXBEN374p+Y/g8st2SV0vKjbGjMJ/SGI62jOo27x1muE9/nvEleVkG+fFQ/Q7d7y
	 tQ18s1XE+8h+4gPDJH/9V38IQSPUA/ge71xPuMftXxqC4RVC72ijWFqEU/adlf1PPB
	 k5hduncS0J9hg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:27b::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 60AD940C9A;
	Wed, 14 Jan 2026 16:41:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] Move kernel-doc to tools/docs
Date: Wed, 14 Jan 2026 09:41:44 -0700
Message-ID: <20260114164146.532916-3-corbet@lwn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114164146.532916-1-corbet@lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kernel-doc is the last documentation-related tool still living outside of
the tools/docs directory; the time has come to move it over.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/conf.py                                  |  2 +-
 Documentation/doc-guide/kernel-doc.rst                 |  8 ++++----
 Documentation/kbuild/kbuild.rst                        |  2 +-
 Documentation/process/coding-style.rst                 |  2 +-
 .../translations/it_IT/doc-guide/kernel-doc.rst        |  8 ++++----
 .../translations/sp_SP/process/coding-style.rst        |  2 +-
 .../translations/zh_CN/doc-guide/kernel-doc.rst        | 10 +++++-----
 Documentation/translations/zh_CN/kbuild/kbuild.rst     |  2 +-
 .../translations/zh_CN/process/coding-style.rst        |  2 +-
 .../translations/zh_TW/process/coding-style.rst        |  2 +-
 MAINTAINERS                                            |  2 --
 Makefile                                               |  2 +-
 drivers/gpu/drm/i915/Makefile                          |  2 +-
 scripts/kernel-doc                                     |  1 -
 tools/docs/find-unused-docs.sh                         |  2 +-
 scripts/kernel-doc.py => tools/docs/kernel-doc         |  0
 tools/docs/sphinx-build-wrapper                        |  2 +-
 17 files changed, 24 insertions(+), 27 deletions(-)
 delete mode 120000 scripts/kernel-doc
 rename scripts/kernel-doc.py => tools/docs/kernel-doc (100%)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276c..383d5e5b9d0af 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -582,7 +582,7 @@ pdf_documents = [
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
 # line arguments.
-kerneldoc_bin = "../scripts/kernel-doc.py"
+kerneldoc_bin = "../tools/docs/kernel-doc"  # Not used now
 kerneldoc_srctree = ".."
 
 def setup(app):
diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index b56128d7f5c3a..8d2c09fb36e4d 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -54,7 +54,7 @@ Running the ``kernel-doc`` tool with increased verbosity and without actual
 output generation may be used to verify proper formatting of the
 documentation comments. For example::
 
-	scripts/kernel-doc -v -none drivers/foo/bar.c
+	tools/docs/kernel-doc -v -none drivers/foo/bar.c
 
 The documentation format of ``.c`` files is also verified by the kernel build
 when it is requested to perform extra gcc checks::
@@ -365,7 +365,7 @@ differentiated by whether the macro name is immediately followed by a
 left parenthesis ('(') for function-like macros or not followed by one
 for object-like macros.
 
-Function-like macros are handled like functions by ``scripts/kernel-doc``.
+Function-like macros are handled like functions by ``tools/docs/kernel-doc``.
 They may have a parameter list. Object-like macros have do not have a
 parameter list.
 
@@ -596,8 +596,8 @@ from the source file.
 
 The kernel-doc extension is included in the kernel source tree, at
 ``Documentation/sphinx/kerneldoc.py``. Internally, it uses the
-``scripts/kernel-doc`` script to extract the documentation comments from the
-source.
+``tools/docs/kernel-doc`` script to extract the documentation comments from
+the source.
 
 .. _kernel_doc:
 
diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 82826b0332df4..5a9013bacfb75 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -180,7 +180,7 @@ architecture.
 KDOCFLAGS
 ---------
 Specify extra (warning/error) flags for kernel-doc checks during the build,
-see scripts/kernel-doc for which flags are supported. Note that this doesn't
+see tools/docs/kernel-doc for which flags are supported. Note that this doesn't
 (currently) apply to documentation builds.
 
 ARCH
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 258158637f654..35b381230f6e4 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -614,7 +614,7 @@ it.
 
 When commenting the kernel API functions, please use the kernel-doc format.
 See the files at :ref:`Documentation/doc-guide/ <doc_guide>` and
-``scripts/kernel-doc`` for details. Note that the danger of over-commenting
+``tools/docs/kernel-doc`` for details. Note that the danger of over-commenting
 applies to kernel-doc comments all the same. Do not add boilerplate
 kernel-doc which simply reiterates what's obvious from the signature
 of the function.
diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
index aa0e31d353d6f..bac959b8b7b96 100644
--- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
@@ -80,7 +80,7 @@ Al fine di verificare che i commenti siano formattati correttamente, potete
 eseguire il programma ``kernel-doc`` con un livello di verbosità alto e senza
 che questo produca alcuna documentazione. Per esempio::
 
-	scripts/kernel-doc -v -none drivers/foo/bar.c
+	tools/docs/kernel-doc -v -none drivers/foo/bar.c
 
 Il formato della documentazione è verificato della procedura di generazione
 del kernel quando viene richiesto di effettuare dei controlli extra con GCC::
@@ -378,7 +378,7 @@ distinguono in base al fatto che il nome della macro simile a funzione sia
 immediatamente seguito da una parentesi sinistra ('(') mentre in quelle simili a
 oggetti no.
 
-Le macro simili a funzioni sono gestite come funzioni da ``scripts/kernel-doc``.
+Le macro simili a funzioni sono gestite come funzioni da ``tools/docs/kernel-doc``.
 Possono avere un elenco di parametri. Le macro simili a oggetti non hanno un
 elenco di parametri.
 
@@ -595,7 +595,7 @@ documentazione presenti nel file sorgente (*source*).
 
 L'estensione kernel-doc fa parte dei sorgenti del kernel, la si può trovare
 in ``Documentation/sphinx/kerneldoc.py``. Internamente, viene utilizzato
-lo script ``scripts/kernel-doc`` per estrarre i commenti di documentazione
+lo script ``tools/docs/kernel-doc`` per estrarre i commenti di documentazione
 dai file sorgenti.
 
 Come utilizzare kernel-doc per generare pagine man
@@ -604,4 +604,4 @@ Come utilizzare kernel-doc per generare pagine man
 Se volete utilizzare kernel-doc solo per generare delle pagine man, potete
 farlo direttamente dai sorgenti del kernel::
 
-  $ scripts/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation :^tools) | scripts/split-man.pl /tmp/man
+  $ tools/docs/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation :^tools) | scripts/split-man.pl /tmp/man
diff --git a/Documentation/translations/sp_SP/process/coding-style.rst b/Documentation/translations/sp_SP/process/coding-style.rst
index 025223be9706d..7d63aa8426e63 100644
--- a/Documentation/translations/sp_SP/process/coding-style.rst
+++ b/Documentation/translations/sp_SP/process/coding-style.rst
@@ -633,7 +633,7 @@ posiblemente POR QUÉ hace esto.
 
 Al comentar las funciones de la API del kernel, utilice el formato
 kernel-doc. Consulte los archivos en :ref:`Documentation/doc-guide/ <doc_guide>`
-y ``scripts/kernel-doc`` para más detalles.
+y ``tools/docs/kernel-doc`` para más detalles.
 
 El estilo preferido para comentarios largos (de varias líneas) es:
 
diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
index ccfb9b8329c23..fb2bbaaa85c18 100644
--- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -43,7 +43,7 @@ kernel-doc注释用 ``/**`` 作为开始标记。 ``kernel-doc`` 工具将提取
 用详细模式和不生成实际输出来运行 ``kernel-doc`` 工具，可以验证文档注释的格式
 是否正确。例如::
 
-	scripts/kernel-doc -v -none drivers/foo/bar.c
+	tools/docs/kernel-doc -v -none drivers/foo/bar.c
 
 当请求执行额外的gcc检查时，内核构建将验证文档格式::
 
@@ -473,7 +473,7 @@ doc: *title*
 如果没有选项，kernel-doc指令将包含源文件中的所有文档注释。
 
 kernel-doc扩展包含在内核源代码树中，位于 ``Documentation/sphinx/kerneldoc.py`` 。
-在内部，它使用 ``scripts/kernel-doc`` 脚本从源代码中提取文档注释。
+在内部，它使用 ``tools/docs/kernel-doc`` 脚本从源代码中提取文档注释。
 
 .. _kernel_doc_zh:
 
@@ -482,18 +482,18 @@ kernel-doc扩展包含在内核源代码树中，位于 ``Documentation/sphinx/k
 
 如果您只想使用kernel-doc生成手册页，可以从内核git树这样做::
 
-  $ scripts/kernel-doc -man \
+  $ tools/docs/kernel-doc -man \
     $(git grep -l '/\*\*' -- :^Documentation :^tools) \
     | scripts/split-man.pl /tmp/man
 
 一些旧版本的git不支持路径排除语法的某些变体。
 以下命令之一可能适用于这些版本::
 
-  $ scripts/kernel-doc -man \
+  $ tools/docs/kernel-doc -man \
     $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
     | scripts/split-man.pl /tmp/man
 
-  $ scripts/kernel-doc -man \
+  $ tools/docs/kernel-doc -man \
     $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools") \
     | scripts/split-man.pl /tmp/man
 
diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
index 57f5cf5b2cddb..a477b4b089585 100644
--- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
+++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
@@ -174,7 +174,7 @@ UTS_MACHINE 变量（在某些架构中还包括内核配置）来猜测正确
 KDOCFLAGS
 ---------
 指定在构建过程中用于 kernel-doc 检查的额外（警告/错误）标志，查看
-scripts/kernel-doc 了解支持的标志。请注意，这目前不适用于文档构建。
+tools/docs/kernel-doc 了解支持的标志。请注意，这目前不适用于文档构建。
 
 ARCH
 ----
diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
index 0484d0c65c25b..5a342a024c01e 100644
--- a/Documentation/translations/zh_CN/process/coding-style.rst
+++ b/Documentation/translations/zh_CN/process/coding-style.rst
@@ -545,7 +545,7 @@ Linux 里这是提倡的做法，因为这样可以很简单的给读者提供
 也可以加上它做这些事情的原因。
 
 当注释内核 API 函数时，请使用 kernel-doc 格式。详见
-Documentation/translations/zh_CN/doc-guide/index.rst 和 scripts/kernel-doc 。
+Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 。
 
 长 (多行) 注释的首选风格是：
 
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 311c6f6bad0bc..e2ba97b3d8bbf 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -548,7 +548,7 @@ Linux 裏這是提倡的做法，因爲這樣可以很簡單的給讀者提供
 也可以加上它做這些事情的原因。
 
 當註釋內核 API 函數時，請使用 kernel-doc 格式。詳見
-Documentation/translations/zh_CN/doc-guide/index.rst 和 scripts/kernel-doc 。
+Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 。
 
 長 (多行) 註釋的首選風格是：
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e03e33bd33b83..8ea68e7c2fa7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7522,7 +7522,6 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
-F:	scripts/kernel-doc*
 F:	tools/lib/python/*
 F:	tools/docs/
 F:	tools/net/ynl/pyynl/lib/doc_generator.py
@@ -7559,7 +7558,6 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/sphinx/
-F:	scripts/kernel-doc*
 F:	tools/lib/python/*
 F:	tools/docs/
 
diff --git a/Makefile b/Makefile
index 3cd00b62cde99..81a4ab11256ce 100644
--- a/Makefile
+++ b/Makefile
@@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
 
 # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
 # has a logic to call it
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+KERNELDOC       = $(srctree)/tools/docs/kernel-doc
 export KERNELDOC
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4db24050edb0e..c979c579de66f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -443,7 +443,7 @@ always-$(CONFIG_DRM_I915_WERROR) += \
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
-		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
+		$(KERNELDOC) -none -Werror $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
deleted file mode 120000
index 3b6ef807791a2..0000000000000
--- a/scripts/kernel-doc
+++ /dev/null
@@ -1 +0,0 @@
-kernel-doc.py
\ No newline at end of file
diff --git a/tools/docs/find-unused-docs.sh b/tools/docs/find-unused-docs.sh
index ca4e607ec3f72..53514c759dc1b 100755
--- a/tools/docs/find-unused-docs.sh
+++ b/tools/docs/find-unused-docs.sh
@@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
 	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
 	continue;
 	fi
-	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
+	str=$(PYTHONDONTWRITEBYTECODE=1 tools/docs/kernel-doc -export "$file" 2>/dev/null)
 	if [[ -n "$str" ]]; then
 	echo "$file"
 	fi
diff --git a/scripts/kernel-doc.py b/tools/docs/kernel-doc
similarity index 100%
rename from scripts/kernel-doc.py
rename to tools/docs/kernel-doc
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 7a5fcef254297..cb2a5005e633f 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -246,7 +246,7 @@ class SphinxBuilder:
         #
         self.sphinxbuild = os.environ.get("SPHINXBUILD", "sphinx-build")
         self.kerneldoc = self.get_path(os.environ.get("KERNELDOC",
-                                                      "scripts/kernel-doc.py"))
+                                                      "tools/docs/kernel-doc"))
         self.builddir = self.get_path(builddir, use_cwd=True, abs_path=True)
 
         #
-- 
2.52.0

