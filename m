Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD473033D6
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510943; cv=none; b=hYdZT4Yk9rrAVnTrYrga91GInVLfb/AN4JSBeoOkMQlXwV/jmtnOBU9px0NdVae/MhjCJ5uxhHAgNrb+78PAyOelBejE1Oza2ZDlarfDCUpdNHV1omQ3/SI0OVOoDBu3Ab0Tgwm4qnG+C19mG/902NL/EvSoa2pFdtM9Z0dQOCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510943; c=relaxed/simple;
	bh=ZtHn4mYlln7ylKSz2NusJM+Pjh7gr8K34Nva+jWD49A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBZp3qKU0Mm5Y6K6dvf9jETgbWfsq0ncd15NaQjeZ3lb0gZZtREZpditUPFXjit2BH3bPM+umtHOqVlo+fbA4ixozOZ61AKH4sWQ38LhgRyzTSMiRDYvN/2uGgNA9qMbVSznpllKgkaWOH0PMynFUu5XLfx0UGg8aB4idW86z48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7H9wteK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7H9wteK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47debaa89cfso16951f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 04:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510940; x=1784115740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dILBe1BnJLM80i1tBMIfeTWpSxlQ3O/R8C79FjvEbEM=;
        b=d7H9wteKNn8frYq2d+FpU2rUkHi2yrNw2mKZ1WbtRjWB0Z8z0PQjPbYQhWC2M3JvnK
         TR+L8zAWDorwdJ5NJnOYm7Jne37REy1fx+ylDARg6DnYdfc3TFWbEBJomxxJUEgsKuky
         8O8DEVMNI9SceuF53qOusYbtDVhL5pEGFlxOv3EMrepVfry7MVwqtonU6sod2sU3oZI5
         EBguNETwgAlfvFJTsRZ/M6i05HKtAoxpu/cKTOkJ8CTPiE/k91/xIenZdp3+JNd6zzZe
         jL0nuZYfRUw/4KkZyeLgjdf1yf1xP1Wrwysy4cgto3vxtjBrd2tTL9GsDLcC+6xLRS5V
         Ck/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510940; x=1784115740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dILBe1BnJLM80i1tBMIfeTWpSxlQ3O/R8C79FjvEbEM=;
        b=lvv3hoIl1w3oMfz4FEfOd26ls4BCaBNlToP8os9TAdwa2+3AXNMxwdbZ7u7tSTHSxN
         87M1hxJaIg/52zPjYYOKSSs/P/bXWG9YnoSur8qDgvVR/2CSSiEOy4KBcbu+d3rZP78K
         7NnyHWmNLMQxNkiHZkhnNNMhO4iruA+MlIfoctMB0Ac4T0glHVOTp8Ej9cFGinbNKBIC
         qMWDTFNDG6YHug9mt8U2Py1EKerGZRBXzPGTcprIMEBfrPzVdbv0HelkjFcdbDxCmRnR
         c0cQKPXbiR9z4ZIYj3ndZfS8zMoCuzaU/tnw/cCDmJLLCE4hsJ4G9VlJQi/oW2oafvBn
         jx8g==
X-Gm-Message-State: AOJu0YzuyURI4Oxjmm6ndWdzSEI4TtBU5bslFzwN6e1ltGsOyl0QRAMZ
	K0FZVvgWOE9eF6u8pJ8/CmYUuabFDRUUAWivRjex07eUCP+S9XkgI/e8KzKcVu8Z
X-Gm-Gg: AfdE7cnU9zG6IC6NMbNBZzWdnuTkP3pWGrpVhreCvyXoAPxnjRHwEvgWHQO2gJymcuA
	Yxd8pDFm4vkgvqFaDuXoFMBENDl7kkru1V4GIEjHZJATKe0OpC/Ak5WOQkLuClfhrhcGALMUFm5
	2f9blQoMhNPAZjKe6hg5Wp0vVamBsOois9YolQZ4Wkxn9bisO1ajdiDsdchtWRTB8VYx+51phhJ
	YMHChXA9+Oj7APJU9XIsKGAOgqMHAZfOwdmvAFZa2kUVDbyGGdvym6uGBC5EOu/OuLQK2OYBn5N
	uSqbT38zEJ3aMVaNozlRcdmNnC5S20Hq0VSAm5E2XfxIgNbTjdTuRIQAUi29N1uHvXdOusjjOvA
	1dSCjnsCZqe6WgAbpDgV7KokRPIIfL0FRnlsgQr92ptWO5KZ88XPNwl3AjJ/irrcOJ1XhPyq5pl
	U+/S6BCTiekwC/P0Up3lnsd8RCCAJwnX7WKc+OAah9AW0fCSwTUO6g2RSv0bYfWN3QQaFTPQz5g
	8qf1uMVgC4ithLX
X-Received: by 2002:a05:6000:402a:b0:472:6416:4550 with SMTP id ffacd0b85a97d-47df082f1f2mr1341803f8f.8.1783510939628;
        Wed, 08 Jul 2026 04:42:19 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm43631730f8f.2.2026.07.08.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:42:19 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v3] Docs/translations/it_IT: sync changes.rst requirements
Date: Wed,  8 Jul 2026 11:42:08 +0000
Message-ID: <20260708114212.1769512-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707092613.1373425-1-doehyunbaek@gmail.com>
References: <20260707092613.1373425-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Italian current requirements text had fallen behind the English
Documentation/process/changes.rst version.

Sync the current requirements table and add the missing ver_linux note.
Also update directly related text for pahole, Python and GNU AWK, add the
Rust/bindgen source links, and remove the stale cpio source entry.

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
---
Note: this version focuses on keeping the "Current Minimal Requirements"
section and directly related requirements text in sync with the English file.
If a full-file sync is preferred, I can do that instead.

Changes in v3:
- Sync the full current requirements table with the English version.
- Update directly related requirements text for pahole, Python and GNU AWK.
- Add Rust/bindgen source links and remove the stale cpio source entry.

Changes in v2:
- Rebase on current docs-next.

 .../translations/it_IT/process/changes.rst    | 112 +++++++++++-------
 1 file changed, 70 insertions(+), 42 deletions(-)

diff --git a/Documentation/translations/it_IT/process/changes.rst b/Documentation/translations/it_IT/process/changes.rst
index 7ee54c972418..a0db135ca529 100644
--- a/Documentation/translations/it_IT/process/changes.rst
+++ b/Documentation/translations/it_IT/process/changes.rst
@@ -23,7 +23,9 @@ Requisiti minimi correnti
 
 Prima di pensare d'avere trovato un baco, aggiornate i seguenti programmi
 **almeno** alla versione indicata!  Se non siete certi della versione che state
-usando, il comando indicato dovrebbe dirvelo.
+usando, il comando indicato dovrebbe dirvelo. Per avere una lista dei programmi
+sul vostro sistema, incluse le rispettive versioni, eseguite
+./scripts/ver_linux.
 
 Questa lista presume che abbiate già un kernel Linux funzionante.  In aggiunta,
 non tutti gli strumenti sono necessari ovunque; ovviamente, se non avete una
@@ -32,41 +34,42 @@ PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
 ====================== =================  ========================================
         Programma       Versione minima       Comando per verificare la versione
 ====================== =================  ========================================
-GNU C                  8.1                gcc --version
-Clang/LLVM (optional)  17.0.1             clang --version
-Rust (opzionale)       1.78.0             rustc --version
-bindgen (opzionale)    0.65.1             bindgen --version
-GNU make               4.0                make --version
-bash                   4.2                bash --version
-binutils               2.30               ld -v
-flex                   2.5.35             flex --version
-bison                  2.0                bison --version
-pahole                 1.16               pahole --version
-util-linux             2.10o              mount --version
-kmod                   13                 depmod -V
-e2fsprogs              1.41.4             e2fsck -V
-jfsutils               1.1.3              fsck.jfs -V
-xfsprogs               2.6.0              xfs_db -V
-squashfs-tools         4.0                mksquashfs -version
-btrfs-progs            0.18               btrfsck
-pcmciautils            004                pccardctl -V
-quota-tools            3.09               quota -V
-PPP                    2.4.0              pppd --version
-nfs-utils              1.0.5              showmount --version
-procps                 3.2.0              ps --version
-udev                   081                udevd --version
-grub                   0.93               grub --version || grub-install --version
-mcelog                 0.6                mcelog --version
-iptables               1.4.2              iptables -V
-openssl & libcrypto    1.0.0              openssl version
-bc                     1.06.95            bc --version
-Sphinx\ [#f1]_         2.4.4              sphinx-build --version
-cpio                   any                cpio --version
-GNU tar                1.28               tar --version
-gtags (opzionale)      6.6.5              gtags --version
-mkimage (opzionale)    2017.01            mkimage --version
-Python (opzionale)     3.5.x              python3 --version
-====================== =================  ========================================
+bash                   4.2              bash --version
+bc                     1.06.95          bc --version
+bindgen (opzionale)    0.71.1           bindgen --version
+binutils               2.30             ld -v
+bison                  2.0              bison --version
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM (opzionale) 17.0.1           clang --version
+e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+gdb                    7.2              gdb --version
+GNU awk (opzionale)    5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+GRUB                   0.93             grub --version || grub-install --version
+gtags (opzionale)      6.6.5            gtags --version
+iptables               1.4.2            iptables -V
+jfsutils               1.1.3            fsck.jfs -V
+kmod                   13               kmod -V
+mcelog                 0.6              mcelog --version
+mkimage (opzionale)    2017.01          mkimage --version
+nfs-utils              1.0.5            showmount --version
+openssl & libcrypto    1.0.0            openssl version
+pahole                 1.26             pahole --version
+pcmciautils            004              pccardctl -V
+PPP                    2.4.0            pppd --version
+procps                 3.2.0            ps --version
+Python                 3.9.x            python3 --version
+quota-tools            3.09             quota -V
+Rust (opzionale)       1.85.0           rustc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+squashfs-tools         4.0              mksquashfs -version
+udev                   081              udevadm --version
+util-linux             2.10o            mount --version
+xfsprogs               2.6.0            xfs_db -V
+====================== ===============  ========================================
 
 .. [#f1] Sphinx è necessario solo per produrre la documentazione del Kernel
 
@@ -144,7 +147,13 @@ pahole
 
 Dalla versione 5.2, quando viene impostato CONFIG_DEBUG_INFO_BTF, il sistema di
 compilazione genera BTF (BPF Type Format) a partire da DWARF per vmlinux. Più
-tardi anche per i moduli. Questo richiede pahole v1.16 o successivo.
+tardi anche per i moduli. Questo richiede pahole v1.22 o successivo.
+
+Dalla versione 7.0, le kfunc annotate con KF_IMPLICIT_ARGS richiedono pahole
+v1.26 o successivo. Senza questa versione, tali kfunc avranno prototipi BTF
+errati in vmlinux, causando il fallimento del caricamento dei programmi BPF con
+l'errore "func_proto incompatible with vmlinux". Molte kfunc sched_ext sono
+interessate.
 
 A seconda della distribuzione, lo si può trovare nei pacchetti 'dwarves' o
 'pahole'. Oppure lo si può trovare qui: https://fedorapeople.org/~acme/dwarves/.
@@ -155,6 +164,14 @@ Perl
 Per compilare il kernel vi servirà perl 5 e i seguenti moduli ``Getopt::Long``,
 ``Getopt::Std``, ``File::Basename``, e ``File::Find``.
 
+Python
+------
+
+Diverse opzioni di configurazione lo richiedono: è necessario per le
+configurazioni predefinite di arm/arm64, CONFIG_LTO_CLANG, alcune opzioni
+configurabili del DRM, lo strumento kernel-doc e la generazione della
+documentazione (Sphinx), fra gli altri.
+
 BC
 --
 
@@ -193,6 +210,12 @@ pacchetto ``u-boot-tools`` oppure può essere compilato dal codice sorgente di
 U-Boot. Consultate le istruzioni
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+GNU AWK
+-------
+
+GNU AWK è necessario se si vuole che la compilazione del kernel generi dati
+sugli intervalli di indirizzi per i moduli incorporati
+(CONFIG_BUILTIN_MODULE_RANGES).
 
 Strumenti di sistema
 ********************
@@ -405,6 +428,16 @@ Clang/LLVM
 
 - :ref:`Getting LLVM <getting_llvm>`.
 
+Rust
+----
+
+- Documentation/rust/quick-start.rst.
+
+bindgen
+-------
+
+- Documentation/rust/quick-start.rst.
+
 Make
 ----
 
@@ -507,11 +540,6 @@ mcelog
 
 - <https://www.mcelog.org/>
 
-cpio
-----
-
-- <https://www.gnu.org/software/cpio/>
-
 Rete
 ****
 
-- 
2.43.0

