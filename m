Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848136;
	b=ysKCTxcCl3CSF9n7F8CGq695oDkJPlRaaTjNWJ1xFOZRJMvg5WTYbe2+bxSmlrNRiZNR
	 zYyB/J5WnHJ3yInmQYTs3GcCO3U2+dsczFfQvV92+el6D2HmZcbeeDdpph/NJ8sbyhMGP
	 xG9yhExW4MGFmpWM63ECCYAAE9LKPfzn/KCn5Jy5HvS5ojm03G8e9qxXiNrUIAW4FivV7
	 b3EnBtHJaIKqZVSD3VOYpuXTkOa4IzUy+F7Av/ZtEQ03Cf2xbuDCvptOaaTXnKQ1abyJA
	 igvXPKt5Wi2LLR3hzYV9K2cgmj6eK/F2Kr0vmTOEWM9UIHasGcEgEAezUuDjkfIXCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cskAdeG+5DzIPrDqxlwbXP+hyy7pvRuXnxIMPqlgjFk=;
	b=aCSX82o7zVb5vgv1Xw6sHOG/x7779po/klAL3AQ6QdRUeh1eTjgju/LeOFfGqcbnxOFZ
	 gQxfYqMJT9SaDS3QAh5VTSlENetkmM3LSXMu5RH4BlgefF6anDWZygDZ4UpTdYgarn/mk
	 9jeykM0ta5rQjo2UP4n84ApUZvBYULlkWloT43x52y8S4tjPZBM3HsCNNQ1LmxBIEzVzi
	 Y36kONhEB6RGZjz46sTShHDGS+sYfiKGArGhFIZ8xMA+Q9UG8FoIurnVGs9RQ4C5egmVK
	 /d6/YmeyqSH5apvF4XCtFVafyjpfVtefkyDIRoTQfvymUmRXrx3otUZxOb5qmpzyLoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e97opZ9L;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4289606A321
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4289606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e97opZ9L
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3034236eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848135; x=1793452935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cskAdeG+5DzIPrDqxlwbXP+hyy7pvRuXnxIMPqlgjFk=;
        b=e97opZ9Ln+rlBfAifDHtPHsHMppa9xcSC+jFNIDzA7uoOGQRu1pcz2dYk6vJnEgKs/
         LWzv3+cwBdUBcYxe/cCSvJ3EF+qluGCh4s2UGXuAXEUKQm04rTBiTWbnT1mSrBmrFr/Y
         CE73NeuIe/LGnRgjkfPl6MX1aVt5y1gqWsmRvKZsSPreSNZ7A/JHWNNxf686wSobVg8p
         t0GMTys5XKBLS2iyyFNYe//Bx17SZ19Y6otzZFZooHPcqz6weJ3vMGw9NJ757Jl0PFuy
         5NNAjrGLb0AP3+dOHB7fTq7EumAuPO3uJtrg4/KlLJf2hJ0SpavXWYEByJ9YAMS0GGyj
         tR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848135; x=1793452935;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cskAdeG+5DzIPrDqxlwbXP+hyy7pvRuXnxIMPqlgjFk=;
        b=zB30sgTOvByg4RS4YI+U3JPiBYFBOIpL7Xxkt0cUlU4S30slwwwUP3p6Qh5RyJqM2H
         yd9nV6fWGwIb+svsU80ziDv3gitEvdpRQcPD0uOhe2NEMlyDIElLqoa6Bg4rjyaloSue
         6fR4y136i3U+Gb7Rnf1O5dRj7kZNYy3cF6fZZ2TQxFm7YASfnIkM//VoNonMmR9Uc7Qw
         4d6Cf3CznHVIleXWW8QXOHHopFtchBC4WJ5/yOUnCZvIGEinrVgTmEuVtiy3X5F2GGhk
         C5WGFN5iO3Mgg219S+AAblTdwTdGnE3mABGD3VR7wiKyrmKk8CW4s8EXGqRe0F95vss2
         Z4+w==
X-Forwarded-Encrypted: i=1; AKwUvBySBYv5x7CnFaiuJ7Am7ytM6/ssk0Y5d+JOKErHzPzo4XLZtnqqAJAihM4zQXV8S9GVIpSP9uMc8zI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY4QwxfPM9b2oGiNCHeDvi9+mntIOp9yU2HVlV1XOXkVBawcQy
	U4RrRUUcroHHmauK3DCTIJVLjK0gU2uj2BGPcAaK3aD3iCpBt8f1JqfzXxk2RJti
X-Gm-Gg: AYBFou0A6+LVOf7ZActWNjYFD6PQ/5PvgABzPOrUrCqMoqDD+/UKeu7lfW8VFdWNnra
	X4CYLOr801U5WJISGGzX+LwVaAmxQMOdk5fSywHHL4Mco0By98PaLzp52iX0D3arx5iu+7z1XBC
	GI3qplk3cCpFzXvPGnKr5Nsos2III2/XhBqM8KKXTsk6kJpZWE2+jFPEy8EaMgLjGXtKFubGLoa
	kxj4JZ2tDCUUel8yv8JTLBHhFJ0TFevjiAU8bKDP2CxR4EEaf+tIqORd4ZKa9sPr0Uj/yTK7lqi
	bdQdrbShdSon51nSlDBkGGjgKGJjVNMz873ETtMsv9ryAijb87Vzl0HTt4/6Gvbd3GyBb7sczgB
	E8tWznvLWl29ZjljS8vWPsIqHZuwm3rAEX0rPPsh9gusst6wPOzKba9wxSSPZ9KW0k7qiZ/3PRt
	fURzlKO1ob7SaB4maw4qP/hodKl+ICqrYkd2Gb/41bIZzd7GI/fPXDOAXxQPwrAdXmFzaXO5Nf7
	L84UiiidrsBitaoyGcwMzNSLiDDFKEXWE/e/5LA9UPAjZ+Zjszr4LE+PU65ODYdSKaw/H8wCSqS
	lEoWKmUtNvLT/OGAxcbghbH05IvgpRqQUx28CWrc2HQcrFsZfCRHKdnXrJz7vEVuzkn4UhKRgpc
	qP095lCgs
X-Received: by 2002:a05:693c:60d2:b0:35b:244b:ca8c with SMTP id 5a478bee46e88-369e850b09dmr3349430eec.33.1792848134803;
        Sat, 24 Oct 2026 06:22:14 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:14 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 06/11] docs/translations/pt_BR: process: changes.rst: sync with English
Date: Sat, 24 Oct 2026 10:21:53 -0300
Message-ID: <20261024132158.39493-7-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
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

Sync the minimal requirements table with the English version: rows are
now sorted alphabetically, pahole requires 1.26, and the GRUB, GNU awk
and Sphinx entries follow the original spelling.

Also restore the third item of the JFSutils list, which had become a
paragraph, the reference to the sphinx_install section and the bold
emphasis on "least".

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/changes.rst    | 61 ++++++++++---------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/changes.rst b/Documentation/translations/pt_BR/process/changes.rst
index 51c7fe416..3359e5ecd 100644
--- a/Documentation/translations/pt_BR/process/changes.rst
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@ -18,7 +18,7 @@ Mauch, Axel Boldt, Alessandro Sigala e inúmeros outros usuários em toda a rede
 Requisitos Mínimos Atuais
 ****************************
 
-Atualize para pelo menos estas revisões de software antes de pensar que
+Atualize para pelo **menos** estas revisões de software antes de pensar que
 encontrou um bug! Se não tiver certeza de qual versão está executando atualmente
 , o comando sugerido deve lhe informar. Para uma lista dos programas em seu
 sistema, incluindo as versões, execute ./scripts/ver_linux.
@@ -31,41 +31,41 @@ PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautil
 ====================== ===============  ========================================
 Programa               Versão mínima    Comando para verificar a versão
 ====================== ===============  ========================================
-GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  17.0.1           clang --version
-Rust (optional)        1.85.0           rustc --version
-bindgen (optional)     0.71.1           bindgen --version
-GNU make               4.0              make --version
 bash                   4.2              bash --version
+bc                     1.06.95          bc --version
+bindgen (optional)     0.71.1           bindgen --version
 binutils               2.30             ld -v
-flex                   2.5.35           flex --version
-gdb                    7.2              gdb --version
 bison                  2.0              bison --version
-pahole                 1.22             pahole --version
-util-linux             2.10o            mount --version
-kmod                   13               kmod -V
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM (optional)  17.0.1           clang --version
 e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+gdb                    7.2              gdb --version
+GNU awk (opcional)     5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+GRUB                   0.93             grub --version || grub-install --version
+gtags (opcional)       6.6.5            gtags --version
+iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
-xfsprogs               2.6.0            xfs_db -V
-squashfs-tools         4.0              mksquashfs -version
-btrfs-progs            0.18             btrfs --version
+kmod                   13               kmod -V
+mcelog                 0.6              mcelog --version
+mkimage (opcional)     2017.01          mkimage --version
+nfs-utils              1.0.5            showmount --version
+openssl & libcrypto    1.0.0            openssl version
+pahole                 1.26             pahole --version
 pcmciautils            004              pccardctl -V
-quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
-nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevadm --version
-grub                   0.93             grub --version || grub-install --version
-mcelog                 0.6              mcelog --version
-iptables               1.4.2            iptables -V
-openssl & libcrypto    1.0.0            openssl version
-bc                     1.06.95          bc --version
-Sphinx [#f1]_          3.4.3            sphinx-build --version
-GNU tar                1.28             tar --version
-gtags (opcional)       6.6.5            gtags --version
-mkimage (opcional)     2017.01          mkimage --version
 Python                 3.9.x            python3 --version
-GNU AWK (opcional)     5.1.0            gawk --version
+quota-tools            3.09             quota -V
+Rust (optional)        1.85.0           rustc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+squashfs-tools         4.0              mksquashfs -version
+udev                   081              udevadm --version
+util-linux             2.10o            mount --version
+xfsprogs               2.6.0            xfs_db -V
 ====================== ===============  ========================================
 
 .. [#f1] O Sphinx é necessário apenas para gerar a documentação do Kernel.
@@ -272,7 +272,8 @@ utilitários estão disponíveis:
 
 - ``mkfs.jfs`` - cria uma partição formatada em JFS.
 
-Outros utilitários de sistema de arquivos também estão disponíveis neste pacote.
+- outros utilitários de sistema de arquivos também estão disponíveis neste
+  pacote.
 
 Xfsprogs
 --------
@@ -399,8 +400,8 @@ Documentação do Kernel
 Sphinx
 ------
 
-Por favor, consulte Documentation/doc-guide/sphinx.rst para detalhes sobre os
-requisitos do Sphinx.
+Por favor, consulte :ref:`sphinx_install` em Documentation/doc-guide/sphinx.rst
+para detalhes sobre os requisitos do Sphinx.
 
 rustdoc
 -------
-- 
2.47.3

