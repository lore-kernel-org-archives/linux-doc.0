Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5B33A9C4
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785072281; cv=none; b=F/8JpL7VuGjBFTF3UlIrY2jyRxkiOKazbulaHBpqdbCNguUo2kuwPTms6mLHYZMUywTT1K0WsoxF3WKHMTQyU25jX9ZgF8GmxqMMFI+96rMd7gEx3z58fXSdQm4XlR+cWAo0ZiSHSV8v2Oof6ItrHMcMLKAuQqg+46NWbebOOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785072281; c=relaxed/simple;
	bh=U+UwLH1dFOJPg0SIUCRfYdl1It4jIOWZwiIN2dDZA2c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOe/dXMDU7EeGu3mYUIPk5dRM1Gu0iNYZ+R0q0yUnqbVFe6vxCJz0VCUZQC7Bab/zJwdktlMTZtXsb3V+qN35q6sHAAv6TdMy5isP6v4jovrclXEC9MSqiaPn7ZItEXSKhiG0OEJgGCOroifcw6kqtKXzb9qYBJkCZOCtpKh248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=E05uazrK; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="E05uazrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1785072264; x=1785331464;
	bh=jX29S7AyOaSTRxDlVRmArw+JMXKntZ5OHQyVIiPC4mE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E05uazrKXbrMEpfJ1L7CymeHdUu9U/cF052rqczPj+WhLcn4vG9uBtcTRuRdaXhYY
	 VorKWUDwjSwkEdsHTxRMVUnj8pKrFKLNGkNuMzaoYyAhYGwABsZq3gKLpKT7AryhdO
	 uyMmnNuRv7lm+hl9P/zmVLfHEP1H2d8io6XZmogbdsUZG50t1SAPoNMvgCWPbm1iFv
	 YYS5U3ak2UViXZxBbDu+vMfBsJL6JO5pMFQxe0qkG2rIlsTkILkB6BL+p00H7fDr1k
	 Lp6L0lib7MwpLa0StZRdN8tT75GxwRZzGnzP/7WAyGtsfTqCvfgEiL9TYdK8+AeYIf
	 bOrjmf1N6jQQA==
Date: Sun, 26 Jul 2026 13:24:17 +0000
To: Doehyun Baek <doehyunbaek@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v5] Docs/translations/it_IT: sync changes.rst requirements
Message-ID: <noc35tgvjfb3bph6wapjw2jmdrzsjczqqih756bcpbrgygfk4q@y63j2ed3aepo>
In-Reply-To: <20260726063928.1322676-1-doehyunbaek@gmail.com>
References: <20260726063928.1322676-1-doehyunbaek@gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 2d4ff8789aa2bce6ee594cd79fbd9f29758eec6c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Doehyun,

it looks good to me.

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

On Sun, Jul 26, 2026 at 06:39:27AM +0000, Doehyun Baek wrote:
>The Italian current requirements text had fallen behind the English
>Documentation/process/changes.rst version.
>
>Sync the current requirements table and add the missing ver_linux note.
>Also update directly related text for pahole, Python and GNU AWK, add the
>Rust/bindgen source links, and remove the stale cpio source entry.
>
>Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
>Cc: Federico Vaga <federico.vaga@vaga.pv.it>
>Cc: Jonathan Corbet <corbet@lwn.net>
>Cc: Shuah Khan <skhan@linuxfoundation.org>
>---
>Thanks to Federico Vaga for the review and wording suggestions.
>
>Tested with:
>
>  make SPHINXDIRS=3Dtranslations/it_IT htmldocs
>
>Note: this version focuses on keeping the "Current Minimal Requirements"
>section and directly related requirements text in sync with the English fi=
le.
>If a full-file sync is preferred, I can do that instead.
>
>Changes in v5:
>- Incorporate Federico's wording suggestions for pahole, Python and GNU AW=
K.
>
>Changes in v4:
>- Fix the malformed requirements table.
>- Run the Italian documentation build.
>
>Changes in v3:
>- Sync the full current requirements table with the English version.
>- Update directly related requirements text for pahole, Python and GNU AWK=
.
>- Add Rust/bindgen source links and remove the stale cpio source entry.
>
>Changes in v2:
>- Rebase on current docs-next.
>
> .../translations/it_IT/process/changes.rst    | 118 +++++++++++-------
> 1 file changed, 73 insertions(+), 45 deletions(-)
>
>diff --git a/Documentation/translations/it_IT/process/changes.rst b/Docume=
ntation/translations/it_IT/process/changes.rst
>index 7ee54c972418..0be1292a87fc 100644
>--- a/Documentation/translations/it_IT/process/changes.rst
>+++ b/Documentation/translations/it_IT/process/changes.rst
>@@ -23,50 +23,53 @@ Requisiti minimi correnti
>
> Prima di pensare d'avere trovato un baco, aggiornate i seguenti programmi
> **almeno** alla versione indicata!  Se non siete certi della versione che=
 state
>-usando, il comando indicato dovrebbe dirvelo.
>+usando, il comando indicato dovrebbe dirvelo. Per avere una lista dei pro=
grammi
>+sul vostro sistema, incluse le rispettive versioni, eseguite
>+./scripts/ver_linux.
>
> Questa lista presume che abbiate gi=C3=A0 un kernel Linux funzionante.  I=
n aggiunta,
> non tutti gli strumenti sono necessari ovunque; ovviamente, se non avete =
una
> PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciaut=
ils.
>
>-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>-        Programma       Versione minima       Comando per verificare la v=
ersione
>-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>-GNU C                  8.1                gcc --version
>-Clang/LLVM (optional)  17.0.1             clang --version
>-Rust (opzionale)       1.78.0             rustc --version
>-bindgen (opzionale)    0.65.1             bindgen --version
>-GNU make               4.0                make --version
>-bash                   4.2                bash --version
>-binutils               2.30               ld -v
>-flex                   2.5.35             flex --version
>-bison                  2.0                bison --version
>-pahole                 1.16               pahole --version
>-util-linux             2.10o              mount --version
>-kmod                   13                 depmod -V
>-e2fsprogs              1.41.4             e2fsck -V
>-jfsutils               1.1.3              fsck.jfs -V
>-xfsprogs               2.6.0              xfs_db -V
>-squashfs-tools         4.0                mksquashfs -version
>-btrfs-progs            0.18               btrfsck
>-pcmciautils            004                pccardctl -V
>-quota-tools            3.09               quota -V
>-PPP                    2.4.0              pppd --version
>-nfs-utils              1.0.5              showmount --version
>-procps                 3.2.0              ps --version
>-udev                   081                udevd --version
>-grub                   0.93               grub --version || grub-install =
--version
>-mcelog                 0.6                mcelog --version
>-iptables               1.4.2              iptables -V
>-openssl & libcrypto    1.0.0              openssl version
>-bc                     1.06.95            bc --version
>-Sphinx\ [#f1]_         2.4.4              sphinx-build --version
>-cpio                   any                cpio --version
>-GNU tar                1.28               tar --version
>-gtags (opzionale)      6.6.5              gtags --version
>-mkimage (opzionale)    2017.01            mkimage --version
>-Python (opzionale)     3.5.x              python3 --version
>-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+        Programma      Versione minima        Comando per verificare la v=
ersione
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>+bash                   4.2              bash --version
>+bc                     1.06.95          bc --version
>+bindgen (opzionale)    0.71.1           bindgen --version
>+binutils               2.30             ld -v
>+bison                  2.0              bison --version
>+btrfs-progs            0.18             btrfs --version
>+Clang/LLVM (opzionale) 17.0.1           clang --version
>+e2fsprogs              1.41.4           e2fsck -V
>+flex                   2.5.35           flex --version
>+gdb                    7.2              gdb --version
>+GNU awk (opzionale)    5.1.0            gawk --version
>+GNU C                  8.1              gcc --version
>+GNU make               4.0              make --version
>+GNU tar                1.28             tar --version
>+GRUB                   0.93             grub --version || grub-install --=
version
>+gtags (opzionale)      6.6.5            gtags --version
>+iptables               1.4.2            iptables -V
>+jfsutils               1.1.3            fsck.jfs -V
>+kmod                   13               kmod -V
>+mcelog                 0.6              mcelog --version
>+mkimage (opzionale)    2017.01          mkimage --version
>+nfs-utils              1.0.5            showmount --version
>+openssl & libcrypto    1.0.0            openssl version
>+pahole                 1.26             pahole --version
>+pcmciautils            004              pccardctl -V
>+PPP                    2.4.0            pppd --version
>+procps                 3.2.0            ps --version
>+Python                 3.9.x            python3 --version
>+quota-tools            3.09             quota -V
>+Rust (opzionale)       1.85.0           rustc --version
>+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
>+squashfs-tools         4.0              mksquashfs -version
>+udev                   081              udevadm --version
>+util-linux             2.10o            mount --version
>+xfsprogs               2.6.0            xfs_db -V
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> .. [#f1] Sphinx =C3=A8 necessario solo per produrre la documentazione del=
 Kernel
>
>@@ -144,7 +147,13 @@ pahole
>
> Dalla versione 5.2, quando viene impostato CONFIG_DEBUG_INFO_BTF, il sist=
ema di
> compilazione genera BTF (BPF Type Format) a partire da DWARF per vmlinux.=
 Pi=C3=B9
>-tardi anche per i moduli. Questo richiede pahole v1.16 o successivo.
>+tardi anche per i moduli. Questo richiede pahole v1.22 o successivo.
>+
>+Dalla versione 7.0, le kfunc annotate con KF_IMPLICIT_ARGS richiedono pah=
ole
>+v1.26 o successivo. Senza questa versione, tali kfunc avranno prototipi B=
TF
>+errati in vmlinux, causando il fallimento del caricamento dei programmi B=
PF con
>+l'errore "func_proto incompatible with vmlinux". Molte kfunc in sched_ext=
 sono
>+interessate da questo problema.
>
> A seconda della distribuzione, lo si pu=C3=B2 trovare nei pacchetti 'dwar=
ves' o
> 'pahole'. Oppure lo si pu=C3=B2 trovare qui: https://fedorapeople.org/~ac=
me/dwarves/.
>@@ -155,6 +164,14 @@ Perl
> Per compilare il kernel vi servir=C3=A0 perl 5 e i seguenti moduli ``Geto=
pt::Long``,
> ``Getopt::Std``, ``File::Basename``, e ``File::Find``.
>
>+Python
>+------
>+
>+Diverse opzioni di configurazione lo richiedono: =C3=A8 necessario per le
>+configurazioni predefinite di arm/arm64, CONFIG_LTO_CLANG, alcune opzioni
>+configurabili del DRM, lo strumento kernel-doc e la generazione della
>+documentazione (Sphinx), e altro ancora.
>+
> BC
> --
>
>@@ -193,6 +210,12 @@ pacchetto ``u-boot-tools`` oppure pu=C3=B2 essere com=
pilato dal codice sorgente di
> U-Boot. Consultate le istruzioni
> https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-lin=
ux
>
>+GNU AWK
>+-------
>+
>+GNU AWK =C3=A8 necessario se si vuole che la compilazione del kernel gene=
ri dati
>+sugli intervalli di indirizzi per i moduli integrati
>+(CONFIG_BUILTIN_MODULE_RANGES).
>
> Strumenti di sistema
> ********************
>@@ -405,6 +428,16 @@ Clang/LLVM
>
> - :ref:`Getting LLVM <getting_llvm>`.
>
>+Rust
>+----
>+
>+- Documentation/rust/quick-start.rst.
>+
>+bindgen
>+-------
>+
>+- Documentation/rust/quick-start.rst.
>+
> Make
> ----
>
>@@ -507,11 +540,6 @@ mcelog
>
> - <https://www.mcelog.org/>
>
>-cpio
>-----
>-
>-- <https://www.gnu.org/software/cpio/>
>-
> Rete
> ****
>
>--
>2.43.0
>
>

--=20
Federico Vaga

