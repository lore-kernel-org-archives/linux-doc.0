Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432025;
	b=zdCFommJQEPLQLCIR48R+XY6DSSwPCWBd/2sswG7pAF4YtbIa8TFgRMa1YrqMmpRYxEC
	 TZ7kWXHQ0gztwyTks2bBY+SJMtzvftYdU5B00Wk/5QbZhCj4X0d14QKh2WUArw7W8Kit1
	 k4xyg3XQBr5u0wHhkF+yq46RzbNfiI1pE5D7MDvd8DMXWa6Y9ldVAoowjvjFAjvkScCZ0
	 34XV6pRlDxS4/sY2AM32UjttU5qFtQk0bUkK4qA0PaSz50HRWu2LFiwBDTS0nz4Zh2hNt
	 UsjBQkYSaKetndMp2Vb05goSffdYs4CgkGe2opERhtalAl98bep+greTeVi0H0RDWWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kQ4rOOoKNCsL6aw6hnnbbdjeTAhSY7pDB71hftG49LA=;
	b=K/M3Ac0Ik+u1g65okAgL3giNtyFUnk8xl8kfadIkej93ekq43giQJGgRAHmFcUCMGu1G
	 091Wz310MepQI8+DYEqB9oGcL1jmfavtRA9zLSL+nnUxv7Vn5+z2FHbEGtlqR5TUpH0Zk
	 TT28TOaVwbR6POcotD0ibti0tkNVCgv6HSQJX/5UMtwDkRxN8yMLC3Wl6XESAc27U68aS
	 UKd/EagJAPTTGH8kRo7RrjUc3l66EiA3BrGCNCmuiXgln36Wia639CLTdn4/pr6dmatCl
	 LIjzvnLogXHy0yipUeBBdv+5p5ITEe4WkBuROHI4/lo1yd8VwhXsLAVwxgKNwzFtXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cd2BHXac;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7C606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E7C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cd2BHXac
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3859da5694cso451430eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432023; x=1796036823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQ4rOOoKNCsL6aw6hnnbbdjeTAhSY7pDB71hftG49LA=;
        b=cd2BHXacy3KWPGrkdxsmkMqiMY8S7Wd5i5yR9DJbRAoXCAhpx3vnzQDP36zlpXRKgS
         YOaw28B7rc87qwSD2lIK0WvpOUhmhTIYmAskSf22yBS6lMxrYc3JhYZa/TL5SOw0eTgb
         rNilLn/AlIjk33yrPxnRYnvmO6BbP91vIj5X5qUgqcxV6pLNwgEIGt9hXUDbQspg76U7
         S7oufA9iMxH3Vc/GH/1Dvx4/xFVmHiRvVb4CgTXo+BJ0DZ7OgA3eD6sTtPOV8jWU8xNi
         t9iXhAxu48e6MLHepzsYXm0ahvERHsj2QdHiPrFaSNJWFVdqzie1s6uCpaM6HWuEOpxY
         lEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432023; x=1796036823;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQ4rOOoKNCsL6aw6hnnbbdjeTAhSY7pDB71hftG49LA=;
        b=gm2d/fLP/s8VtIWeuH2aiXwtPFZrfklpLrQAujZcX8yUXNmcF7iBdzOHZ3o+3pLqWU
         MWHYB5yz78vpUz1HmEZSVv2kpqfymcfYNzWyAyY+pH3RQsB6IO1BnYz4oPYtiUSsRuJ2
         FQJZ1SWiQ/3J+WNTgWgsWqS6oZXgD4AUI3UtcdSEeQtyPVBfKC3Qrk8rLC11+ZFHBCPH
         n9FLYED5f5EZGKgSLs9ACtoE9DB1RDh7XCxVjDdfplHm4wGN7/z1bsqhGJY18cwhgD1H
         hFXSAHebIj6tbjR63oV8fIQ2bG0amwpnr6GVqxgV2jlsfCHypyHk/KrwkxBpxQCu0UBt
         zHIQ==
X-Forwarded-Encrypted: i=1; AL+hErGLl5cOHIQDbJxCyscXv5TwwJDuVcew0+O9fUxl2YkRCsR6YDVy81zpa/EALhr+j9ZIERNv3I+q6oA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sIhagk1O7euCgfGLz4f2NMYnrgtdC6vtTbUVlIFut5C2Rs7QG
	ruyfr+cCas0gWQHoJLOLECSzINrBRJWWoB90GszkvfoWTvlGymlEAh1A
X-Gm-Gg: AZFdTZdt+DxZDjzTwK4u0l/q25dziKnCQg17kzsYolOFCxtB3RUSGZI6kmczNYZlB88
	Cbw4dBkEqnOb2pGliQXdHo+/KkecakPit1J4wFdeXvxmoiUYQGr7hG6MhiE8gfEQNuuqkA0CSrM
	U7DdwXu6Q00LbkfkS3dpvz3msASVlyC6hYGI706TEqHjV2ld5yl/Qex5//xPG/eMTooaPRJl5C4
	X6hogDBm0zeSslexIqtoCA2CwO6xPEbI/XtXNgzhqdXxMR6xcjN6DFwZV3fs7IAidlyDiKiDsem
	DpDM/uOQ5s4cuTfPB6oh7ph1m98qk+6F3j5ou4H4Wy9TvWJn8euDPdU6/FqXw0WjyREQqP3VHK6
	inCaV0puSr9k2IJjQ7Gf9/192sugkCWvN6+5FnUtvPkIV30oE6NYI3hZUBPjlOdGcT8irT3TGSn
	L8Ylej6o+oMKy3wknu3JVrokqLyIN+Qydjn1ypaOIXWz7LZZxzN2pNyiWpywQ41GC3e3Q68QtB9
	RRwgDtCdWrmRRRu6yklPyq9zZALtXd6UQPGFfL7PrGdg1p6RpkEapYIgsNgfkys/+5Li88++AnK
	4haMlt5gcARpDpzNfCEUefWPM+n826rYCG3ajT3MoauZdWerLXeyFF/dNo8PEjGJLYDeOV40xZz
	vCRu0dwcdxvyzxS5IOWezM0iQ
X-Received: by 2002:a05:701b:4558:10b0:183:d275:cf76 with SMTP id a92af1059eb24-1b5568bfe8cmr16801681c88.2.1795432022402;
        Mon, 23 Nov 2026 03:07:02 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:07:01 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 05/13] docs/zh_TW: process: add changes.rst translation
Date: Mon, 23 Nov 2026 19:06:28 +0800
Message-ID: <20261123110637.172045-6-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
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

Translate Documentation/process/changes.rst into Traditional Chinese
from the current English text, including the minimum version table
(Clang/LLVM 17.0.1, Rust 1.85.0, bindgen 0.71.1, pahole 1.26) and the
GNU AWK, mkimage and rustdoc sections.  There is no zh_CN translation
of this file to consult.

List the new file in the toctree of process/index.rst, before
programming-language as in the English index, and drop it from the
TODOList.

update to commit fd5425b67355 ("docs, resolve_btfids: Document kfunc
BTF annotation emission")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/changes.rst    | 530 ++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |   2 +-
 2 files changed, 531 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/changes.rst

diff --git a/Documentation/translations/zh_TW/process/changes.rst b/Documentation/translations/zh_TW/process/changes.rst
new file mode 100644
index 000000000000..5aa998cfeb07
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/changes.rst
@@ -0,0 +1,530 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/changes.rst
+
+編譯核心的最低需求
+++++++++++++++++++
+
+簡介
+====
+
+本文件列出執行目前版本核心所需的最低軟體版本。
+
+本文件最初是以我為 2.0.x 核心所寫的「Changes」檔案為基礎，因此要感謝的人
+也和那份檔案相同（Jared Mauch、Axel Boldt、Alessandro Sigala，以及網路上
+無數的其他使用者）。
+
+目前的最低需求
+**************
+
+在認為自己遇到缺陷之前，請 **至少** 先升級到下列軟體版本！如果不確定目前
+執行的是哪個版本，表中建議的指令應該可以告訴你。如果要列出系統上這些程式
+的版本，請執行 ./scripts/ver_linux
+
+再次提醒，這份清單假設你已經能夠正常執行 Linux 核心。此外，並不是每個系統
+都需要所有工具；舉例來說，如果你沒有任何 PC Card 硬體，大概就不必理會
+pcmciautils。
+
+====================== ===============  ========================================
+程式                   最低版本         檢查版本的指令
+====================== ===============  ========================================
+bash                   4.2              bash --version
+bc                     1.06.95          bc --version
+bindgen（選用）        0.71.1           bindgen --version
+binutils               2.30             ld -v
+bison                  2.0              bison --version
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM（選用）     17.0.1           clang --version
+e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+gdb                    7.2              gdb --version
+GNU awk（選用）        5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+GRUB                   0.93             grub --version || grub-install --version
+gtags（選用）          6.6.5            gtags --version
+iptables               1.4.2            iptables -V
+jfsutils               1.1.3            fsck.jfs -V
+kmod                   13               kmod -V
+mcelog                 0.6              mcelog --version
+mkimage（選用）        2017.01          mkimage --version
+nfs-utils              1.0.5            showmount --version
+openssl & libcrypto    1.0.0            openssl version
+pahole                 1.26             pahole --version
+pcmciautils            004              pccardctl -V
+PPP                    2.4.0            pppd --version
+procps                 3.2.0            ps --version
+Python                 3.9.x            python3 --version
+quota-tools            3.09             quota -V
+Rust（選用）           1.85.0           rustc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+squashfs-tools         4.0              mksquashfs -version
+udev                   081              udevadm --version
+util-linux             2.10o            mount --version
+xfsprogs               2.6.0            xfs_db -V
+====================== ===============  ========================================
+
+.. [#f1] 只有建置核心文件時才需要 Sphinx
+
+核心編譯
+********
+
+GCC
+---
+
+gcc 的版本需求可能會因電腦的 CPU 類型而有所不同。
+
+Clang/LLVM（選用）
+------------------
+
+建置核心時支援 clang 與 LLVM 工具的最新正式版本（依據
+`releases.llvm.org <https://releases.llvm.org>`_）。不保證舊版本可以正常
+運作，而且我們可能會從核心中移除過去為了支援舊版本而加入的權宜措施。更多
+說明請參閱 :ref:`使用 Clang/LLVM 建置 Linux <kbuild_llvm>`。
+
+Rust（選用）
+------------
+
+需要較新版本的 Rust 編譯器。
+
+如何滿足 Rust 支援的建置需求，請參閱 Documentation/rust/quick-start.rst。
+特別是 ``Makefile`` 的 ``rustavailable`` 目標，可以用來檢查為什麼偵測不到
+Rust 工具鏈。
+
+bindgen（選用）
+---------------
+
+``bindgen`` 用來產生核心 C 語言端的 Rust 綁定，它依賴 ``libclang``。
+
+Make
+----
+
+建置核心需要 GNU make 4.0 或更新版本。
+
+Bash
+----
+
+核心建置過程會用到一些 bash 指令稿，需要 Bash 4.2 或更新版本。
+
+Binutils
+--------
+
+建置核心需要 Binutils 2.30 或更新版本。
+
+pkg-config
+----------
+
+從 4.18 開始，建置系統需要 pkg-config 來檢查已安裝的 kconfig 工具，並決定
+'make {g,x}config' 所用的旗標設定。在此之前雖然已經使用 pkg-config，但並
+沒有檢查，也沒有寫進文件。
+
+Flex
+----
+
+從 Linux 4.16 開始，建置系統會在建置期間產生詞法分析器，因此需要 flex
+2.5.35 或更新版本。
+
+
+Bison
+-----
+
+從 Linux 4.16 開始，建置系統會在建置期間產生剖析器，因此需要 bison
+2.0 或更新版本。
+
+pahole
+------
+
+從 Linux 5.2 開始，如果選擇了 CONFIG_DEBUG_INFO_BTF，建置系統會從 vmlinux
+的 DWARF 產生 BTF（BPF Type Format），稍後也會從核心模組產生。這需要
+pahole v1.22 或更新版本。
+
+可以在發行版的「dwarves」或「pahole」套件中找到它，或從
+https://fedorapeople.org/~acme/dwarves/ 取得。
+
+Perl
+----
+
+建置核心需要 perl 5 以及下列模組：``Getopt::Long``、``Getopt::Std``、
+``File::Basename`` 與 ``File::Find``。
+
+Python
+------
+
+有幾個設定選項需要它：arm/arm64 的預設設定、CONFIG_LTO_CLANG、某些 DRM
+選用設定、kernel-doc 工具，以及文件建置（Sphinx）等都需要 Python。
+
+BC
+--
+
+建置 3.10 及更新版本的核心需要 bc。
+
+
+OpenSSL
+-------
+
+模組簽章與外部憑證處理會使用 OpenSSL 程式與加密函式庫來產生金鑰與簽章。
+
+如果啟用了模組簽章，建置 3.7 及更新版本的核心需要 openssl。建置 4.3 及
+更新版本的核心還需要 openssl 的開發套件。
+
+Tar
+---
+
+如果要啟用透過 sysfs 存取核心標頭檔的功能（CONFIG_IKHEADERS），需要 GNU
+tar。
+
+gtags / GNU GLOBAL（選用）
+--------------------------
+
+核心建置需要 GNU GLOBAL 6.6.5 或更新版本，才能透過 ``make gtags`` 產生
+標籤檔，這是因為它用到 gtags 的 ``-C (--directory)`` 旗標。
+
+mkimage
+-------
+
+建置 Flat Image Tree（FIT）時會用到這個工具，FIT 常見於 ARM 平臺。這個
+工具可以從 ``u-boot-tools`` 套件取得，也可以從 U-Boot 原始碼建置。請參閱
+https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
+的說明。
+
+GNU AWK
+-------
+
+如果要讓核心建置產生內建模組的位址範圍資料
+（CONFIG_BUILTIN_MODULE_RANGES），需要 GNU AWK。
+
+系統工具
+********
+
+架構上的變更
+------------
+
+DevFS 已經淘汰，改用 udev
+(https://www.kernel.org/pub/linux/utils/kernel/hotplug/)
+
+32 位元 UID 支援現在已經就緒。好好享受吧！
+
+Linux 函式的文件正逐步改為行內文件，也就是寫在原始碼中函式定義附近、具有
+特殊格式的註解。這些註解可以與 Documentation/ 目錄下的 ReST 檔案結合，
+產生內容更豐富的文件，再轉換成 PostScript、HTML、LaTex、ePUB 與 PDF 檔案。
+要把 ReST 格式轉換成你想要的格式，需要 Sphinx。
+
+Util-linux
+----------
+
+新版的 util-linux 讓 ``fdisk`` 支援更大的磁碟、為 mount 提供新的選項、
+能辨識更多種分割區類型，還有其他類似的好處。你大概會想升級。
+
+Ksymoops
+--------
+
+如果發生了難以想像的事，你的核心出現 oops，你可能需要用 ksymoops 工具來
+解碼，不過大多數情況下並不需要。一般建議在建置核心時啟用
+``CONFIG_KALLSYMS``，讓核心產生可以直接使用的可讀傾印（這也比 ksymoops
+的輸出更好）。如果因為某些原因，你的核心沒有啟用 ``CONFIG_KALLSYMS``，而
+你又沒辦法用該選項重新建置並重現 Oops，仍然可以用 ksymoops 解碼該 Oops。
+
+Mkinitrd
+--------
+
+``/lib/modules`` 檔案樹配置的這些變更，也需要升級 mkinitrd。
+
+E2fsprogs
+---------
+
+最新版的 ``e2fsprogs`` 修正了 fsck 與 debugfs 的幾個缺陷。顯然，升級是個
+好主意。
+
+JFSutils
+--------
+
+``jfsutils`` 套件包含這個檔案系統的工具程式，提供下列工具：
+
+- ``fsck.jfs`` - 啟動交易日誌的重播，並檢查與修復 JFS 格式的分割區。
+
+- ``mkfs.jfs`` - 建立 JFS 格式的分割區。
+
+- 這個套件裡也有其他檔案系統工具。
+
+Xfsprogs
+--------
+
+最新版的 ``xfsprogs`` 包含 XFS 檔案系統的 ``mkfs.xfs``、``xfs_db`` 與
+``xfs_repair`` 等工具。它與架構無關，2.0.0 以後的任何版本應該都能與這個
+版本的 XFS 核心程式碼正常搭配（建議使用 2.6.0 或更新版本，因為有一些重大
+改進）。
+
+PCMCIAutils
+-----------
+
+PCMCIAutils 取代了 ``pcmcia-cs``。如果核心採用模組化並使用熱插拔子系統，
+它會在系統啟動時正確設定 PCMCIA 插槽，並為 16 位元 PCMCIA 裝置載入適當的
+模組。
+
+Quota-tools
+-----------
+
+如果要使用較新的第 2 版 quota 格式，必須支援 32 位元的 uid 與 gid。
+Quota-tools 3.07 及更新版本提供這項支援。請使用上表建議的版本或更新版本。
+
+Intel IA32 微碼
+---------------
+
+核心已加入一個驅動程式，可以更新 Intel IA32 微碼，它是一個一般的（misc）
+字元裝置。如果你沒有使用 udev，在使用之前可能需要以 root 身分執行::
+
+  mkdir /dev/cpu
+  mknod /dev/cpu/microcode c 10 184
+  chmod 0644 /dev/cpu/microcode
+
+你大概也會想取得使用者空間的 microcode_ctl 工具來搭配使用。
+
+udev
+----
+
+``udev`` 是一個使用者空間應用程式，以動態方式在 ``/dev`` 中只建立實際存在
+的裝置項目。``udev`` 取代了 devfs 的基本功能，同時能為裝置提供固定的
+裝置名稱。
+
+FUSE
+----
+
+需要 libfuse 2.4.0 或更新版本。最低限度是 2.3.0，但 mount 選項
+``direct_io`` 與 ``kernel_cache`` 將無法使用。
+
+網路
+****
+
+一般變更
+--------
+
+如果你有進階的網路設定需求，或許應該考慮使用 ip-route2 的網路工具。
+
+封包過濾 / NAT
+--------------
+封包過濾與 NAT 程式碼使用的工具與之前的 2.4.x 核心系列相同（iptables）。
+它仍然包含與 2.2.x 風格的 ipchains 及 2.0.x 風格的 ipfwadm 向下相容的模組。
+
+PPP
+---
+
+PPP 驅動程式已經重新架構，以支援多重連結（multilink），並能在多種不同的
+媒介層上運作。如果你使用 PPP，請將 pppd 升級到至少 2.4.0。
+
+如果你沒有使用 udev，必須要有裝置檔案 /dev/ppp，可以以 root 身分執行下列
+指令建立::
+
+  mknod /dev/ppp c 108 0
+
+NFS-utils
+---------
+
+在古老的（2.4 及更早的）核心中，nfs 伺服器必須知道每個預期能透過 NFS 存取
+檔案的用戶端。這些資訊會在用戶端掛載檔案系統時由 ``mountd`` 提供給核心，
+或在系統啟動時由 ``exportfs`` 提供。exportfs 會從 ``/var/lib/nfs/rmtab``
+取得活動中用戶端的資訊。
+
+這種做法相當脆弱，因為它依賴 rmtab 的正確性，而這並不容易做到，特別是在
+嘗試實作容錯移轉（fail-over）時。即使系統運作正常，``rmtab`` 也會累積許多
+永遠不會被移除的舊項目。
+
+在現代的核心中，可以選擇讓核心在收到未知主機的請求時通知 mountd，再由
+mountd 把適當的匯出資訊提供給核心。這樣就不再依賴 ``rmtab``，而且核心只需
+要知道目前活動中的用戶端。
+
+要啟用這項新功能，需要在執行 exportfs 或 mountd 之前執行::
+
+  mount -t nfsd nfsd /proc/fs/nfsd
+
+建議盡可能用防火牆保護所有 NFS 服務，使其不暴露在整個網際網路上。
+
+mcelog
+------
+
+在 x86 核心上，啟用 ``CONFIG_X86_MCE`` 時需要 mcelog 工具來處理並記錄
+機器檢查事件。機器檢查事件是 CPU 回報的錯誤，強烈建議處理這些事件。
+
+核心文件
+********
+
+Sphinx
+------
+
+關於 Sphinx 需求的詳細資訊，請參閱 Documentation/doc-guide/sphinx.rst 中的
+:ref:`sphinx_install`。
+
+rustdoc
+-------
+
+``rustdoc`` 用來產生 Rust 程式碼的文件。更多資訊請參閱
+Documentation/rust/general-information.rst。
+
+取得更新的軟體
+==============
+
+核心編譯
+********
+
+gcc
+---
+
+- <ftp://ftp.gnu.org/gnu/gcc/>
+
+Clang/LLVM
+----------
+
+- :ref:`取得 LLVM <getting_llvm>`。
+
+Rust
+----
+
+- Documentation/rust/quick-start.rst。
+
+bindgen
+-------
+
+- Documentation/rust/quick-start.rst。
+
+Make
+----
+
+- <ftp://ftp.gnu.org/gnu/make/>
+
+Bash
+----
+
+- <ftp://ftp.gnu.org/gnu/bash/>
+
+Binutils
+--------
+
+- <https://www.kernel.org/pub/linux/devel/binutils/>
+
+Flex
+----
+
+- <https://github.com/westes/flex/releases>
+
+Bison
+-----
+
+- <ftp://ftp.gnu.org/gnu/bison/>
+
+OpenSSL
+-------
+
+- <https://www.openssl.org/>
+
+系統工具
+********
+
+Util-linux
+----------
+
+- <https://www.kernel.org/pub/linux/utils/util-linux/>
+
+Kmod
+----
+
+- <https://www.kernel.org/pub/linux/utils/kernel/kmod/>
+- <https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git>
+
+Ksymoops
+--------
+
+- <https://www.kernel.org/pub/linux/utils/kernel/ksymoops/v2.4/>
+
+Mkinitrd
+--------
+
+- <https://code.launchpad.net/initrd-tools/main>
+
+E2fsprogs
+---------
+
+- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
+- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>
+
+JFSutils
+--------
+
+- <https://jfs.sourceforge.net/>
+
+Xfsprogs
+--------
+
+- <https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git>
+- <https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/>
+
+Pcmciautils
+-----------
+
+- <https://www.kernel.org/pub/linux/utils/kernel/pcmcia/>
+
+Quota-tools
+-----------
+
+- <https://sourceforge.net/projects/linuxquota/>
+
+
+Intel P6 微碼
+-------------
+
+- <https://downloadcenter.intel.com/>
+
+udev
+----
+
+- <https://www.freedesktop.org/software/systemd/man/udev.html>
+
+FUSE
+----
+
+- <https://github.com/libfuse/libfuse/releases>
+
+mcelog
+------
+
+- <https://www.mcelog.org/>
+
+網路
+****
+
+PPP
+---
+
+- <https://download.samba.org/pub/ppp/>
+- <https://git.ozlabs.org/?p=ppp.git>
+- <https://github.com/paulusmack/ppp/>
+
+NFS-utils
+---------
+
+- <https://sourceforge.net/project/showfiles.php?group_id=14>
+- <https://nfs.sourceforge.net/>
+
+Iptables
+--------
+
+- <https://netfilter.org/projects/iptables/index.html>
+
+Ip-route2
+---------
+
+- <https://www.kernel.org/pub/linux/utils/net/iproute2/>
+
+OProfile
+--------
+
+- <https://oprofile.sf.net/download/>
+
+核心文件
+********
+
+Sphinx
+------
+
+- <https://www.sphinx-doc.org/>
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 7b830c48942a..90c33d020d34 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -40,6 +40,7 @@
 .. toctree::
    :maxdepth: 1
 
+   changes
    programming-language
    coding-style
    maintainer-pgp-guide
@@ -49,7 +50,6 @@
 
 TODOList:
 
-* changes
 * backporting
 * adding-syscalls
 * botching-up-ioctls
-- 
2.43.0

