Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3549430DEDC
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785047977; cv=none; b=qdxtegMtAGayRVRG1AKesfYZWOHXiRO0sCZ2ATYFZ3QaZcwTWNrMQYnyicJAYPIJ2xtFmlCcmzNVRdOWjSPgFaE2HcNNuLemqH5BU7nqCah/EL/IzD/9bi/ig4H0XibS+V4jsCpbjIWizGIdOHrqtdDuW6vqyyg0sX+QqaulTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785047977; c=relaxed/simple;
	bh=PKeEaS5geNFrMTu6xbg29CWdsj1hX63ic4uVSpAS4lM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=djtLgUacEdx+1agcWer0NOtZTEwGcQB84bvSkHKazt0jysj8RT81iLeCIYXSnEIhk+AGKjOoBAZiUK1nlJBF2GTYiq8aHVyAGiRdqtdXZxzQ4vNQBDIqYdtOL10iTPMA2BRDkTkuj1cuYTkh5KMTZvabsDA+dKyaBbiN0s5wBv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8qaoiGj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8qaoiGj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495502852d1so2054035e9.2
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785047973; x=1785652773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3ESNIpjoiBbkcy3neoZCNWcjosBBW5QrkCTixAL/dA=;
        b=c8qaoiGjOGbRKW+TfZFDJxrMYM3Qr22ZGSjzOmz7gsaL+g1Xjidje5TZzExTB/B44Q
         GEeMpJgrVT56mToD7lLMzz/nSMKW8PxCHu9NSBfAR1b4u8pDeDa9BY4/IVZpmwd6yD7d
         O54EJZ94nJGIMhyAtpcDhECdx+PBaYa5Ipyt6ZN9AFBTIpMBICF/lBIcKX1D7/7RzWgN
         udK6wlsNnVvAujPTPhm4rawESol36UKu7jJAo2EJL1IBxgjrBPPgLU48D3DcPwlvcj14
         PWw/uHI4fZQRg7R52ygbc7StMqO++cCftaKuwQ1/+unGP8dCOkc6T6teRplcMV2J+sVV
         MOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785047973; x=1785652773;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3ESNIpjoiBbkcy3neoZCNWcjosBBW5QrkCTixAL/dA=;
        b=dTE5hWkFdCDS1WsJ2khv57QQFyeEErI83tUtM4NBiETiTXM5Fw/6G/x0ljy7wtX4lf
         8uXPbjldcniMHb2RlPeZPKFfsIqZsqtXLMtZRtLtq+1H/RiWl2lxP9FVn0tE3X3wFOt3
         O2+H+HraEOyGNWtvchSyApx747+B7b0+gwZ2LH6P6Aol+RnJkYoQxR6PWjdjeIEwn0RK
         c8uGRUg1p/CoFs2Pxwti9QIeiiAlJ/rFkgAJ0EsmVFskxOaaImBFP2qUtFcQIOEHgCjV
         emK1rDSh2P7nrfxCp/TnB6rUBg8B/RkBTRbuiu1ldX+F51HBeM6tqwsPiyPSzPMURT1G
         rOcQ==
X-Gm-Message-State: AOJu0YxwOSaX68/cIdERKT61PsJaJ0EP536PEeO5oLO2kavHpUCLTB9t
	veayAUyzRRH/TJstiRtqGF+rLfOV2ZxsyCYa1vIUJXlqL2YbDah7sV7QzEKM+uoW
X-Gm-Gg: AR+sD10Z8+xxhFas4HwNpdnWNwcVnjlYb0bxsMLk42AfQsSUKNg6jOs1yL5dE7+ZKnv
	jm5rOxQ371SizhviPSu7xBWs/czxfveBnsYfbGM9TnPUNLJKk+SBz/SbjBhjwbpVlRNEDI0IukL
	UVCn4b6b1UNgepDRRZMfQcRDQtlll4fhvrukDxGRva9m2130utFdA+siG2jQ0CBgyjCRX7f9zJU
	Tjhp2eoFzvvLI3MTOqglp8NHUNhHFbIAYHmpT+cU9j5ufC/GgurCkBF/6mO20VE3olAl/pyHrx/
	lx3mVZTCm28CUHfmUGftxcj9BO2xpJcIKqDiYK2/9lruSgPNnn2iUhai7uZZgKEg0PHD2G8kVVK
	xtZWixfGuU1VDch52xL8w2p4RhweENfTyi0slj97wb1343c75iTYUwdLXmCqqXkTyUY2I64JSjO
	FVtIHHkysHog4BuZGmtU7lOva+ex+VNXCLHMwdf31J74V95qZbi6eCG9GZx/mmFE33fKFUoaqQP
	J3j+j8W8vZ5uS6tpphugiItlyOlhC7IHix48Md1wUEMewivS5qlpnKOFTNAAMSIWqV+F40bEQ==
X-Received: by 2002:a05:600c:6989:b0:496:bbce:103 with SMTP id 5b1f17b1804b1-496bbce019cmr5898295e9.6.1785047973066;
        Sat, 25 Jul 2026 23:39:33 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfd1a60sm153969255e9.2.2026.07.25.23.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:39:31 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v5] Docs/translations/it_IT: sync changes.rst requirements
Date: Sun, 26 Jul 2026 06:39:27 +0000
Message-ID: <20260726063928.1322676-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Thanks to Federico Vaga for the review and wording suggestions.

Tested with:

  make SPHINXDIRS=translations/it_IT htmldocs

Note: this version focuses on keeping the "Current Minimal Requirements"
section and directly related requirements text in sync with the English file.
If a full-file sync is preferred, I can do that instead.

Changes in v5:
- Incorporate Federico's wording suggestions for pahole, Python and GNU AWK.

Changes in v4:
- Fix the malformed requirements table.
- Run the Italian documentation build.

Changes in v3:
- Sync the full current requirements table with the English version.
- Update directly related requirements text for pahole, Python and GNU AWK.
- Add Rust/bindgen source links and remove the stale cpio source entry.

Changes in v2:
- Rebase on current docs-next.

 .../translations/it_IT/process/changes.rst    | 118 +++++++++++-------
 1 file changed, 73 insertions(+), 45 deletions(-)

diff --git a/Documentation/translations/it_IT/process/changes.rst b/Documentation/translations/it_IT/process/changes.rst
index 7ee54c972418..0be1292a87fc 100644
--- a/Documentation/translations/it_IT/process/changes.rst
+++ b/Documentation/translations/it_IT/process/changes.rst
@@ -23,50 +23,53 @@ Requisiti minimi correnti
 
 Prima di pensare d'avere trovato un baco, aggiornate i seguenti programmi
 **almeno** alla versione indicata!  Se non siete certi della versione che state
-usando, il comando indicato dovrebbe dirvelo.
+usando, il comando indicato dovrebbe dirvelo. Per avere una lista dei programmi
+sul vostro sistema, incluse le rispettive versioni, eseguite
+./scripts/ver_linux.
 
 Questa lista presume che abbiate già un kernel Linux funzionante.  In aggiunta,
 non tutti gli strumenti sono necessari ovunque; ovviamente, se non avete una
 PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
 
-====================== =================  ========================================
-        Programma       Versione minima       Comando per verificare la versione
-====================== =================  ========================================
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
+====================== ===============  ========================================
+        Programma      Versione minima        Comando per verificare la versione
+====================== ===============  ========================================
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
+l'errore "func_proto incompatible with vmlinux". Molte kfunc in sched_ext sono
+interessate da questo problema.
 
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
+documentazione (Sphinx), e altro ancora.
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
+sugli intervalli di indirizzi per i moduli integrati
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

