Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 693F77D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 09:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfADJom (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 04:44:42 -0500
Received: from mx.kolabnow.com ([95.128.36.41]:17148 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbfADJol (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:44:41 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 51C0F1002;
        Fri,  4 Jan 2019 10:44:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1546595074; x=1548409475; bh=QMWJ+/zG+A7wUAdF4XSB7IVHCcj76baMi9S
        2TMK4jYs=; b=Pjxo6Ag5JwcPLer15Ov5hF6O2+7tXwSvfRKQ8IX0gb1cePX+bY1
        de5qCbcqcqOWdCi5BL14EoFXl2D9bAq7WjQY9DIB4JzPevzZtX5/xeCutN38wuAJ
        sjT7ZxMg///zk4ACRTQjIOibBxs0T50lpvJ+E207FWoBEPNpjRJB1HB6P2mLqyzT
        AnsJZJfMBICPE/xVW0LzemIhAQ/F5/Bq5zDvgBtAAf1/1Kombjh4Le/82tEwE7Ra
        66L3CiMjE2J+qIhD+wndjaGT7KNndP+GF5H1mrYXnr3YYDbzAVmbe3zJw8LrRb0/
        UIQ6036QstTirdPMx52MVLGnRcY93uLlPBPuIzHJK80JVv2QiceWzfJcmGwqSY76
        98HqXvfthRoR4TyhzOCG4bwKRVy+DJQq1l44HN9ZBpnLfZ+1HqIuytgb5ElcM+hE
        ZgC146TBUnxKQxGnsL6qRnDzJq13EKZSpgsE0Vi9cAQQH2N4A9h6Z/XO8w2yQIos
        PtfXcTAF+0bJF3u6Ar+cokp1jwL6sqGCV9ImtHyGQNwkUx1+hJ3NzisaLlnQSg9A
        OlNW26FEgpPFMFP5gKQwOiqVKQuqlIthfl0iNuCcrTT1yo5a7BiOSZr42aoYnzL0
        7vjbYRtaoy/gA8Hw5Xh7CEWdGG80gGgaC0f5bhBBVVVrkWw0bzEkgbPc=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gR7Yt8jVbz-8; Fri,  4 Jan 2019 10:44:34 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 6548B1C2;
        Fri,  4 Jan 2019 10:44:34 +0100 (CET)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 244BC3F2;
        Fri,  4 Jan 2019 10:44:26 +0100 (CET)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>, Zhang Le <r0bertz@gentoo.org>,
        Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into .dir-locals.el
Date:   Fri, 04 Jan 2019 10:44:23 +0100
Message-ID: <4009470.9o5kGc7Prg@harkonnen>
In-Reply-To: <20190104003957.82220-1-bvanassche@acm.org>
References: <20190104003957.82220-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Friday, January 4, 2019 1:39:57 AM CET Bart Van Assche wrote:
> For new kernel developers who use emacs it is tedious to follow the
> instructions in Documentation/process/coding-style.rst for configuring
> emacs. Make it easier for emacs users by moving these settings into the
> top-level .dir-locals.el file. Emacs supports directory-local variables
> since version 23.1, released in 2009. See also
> https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html
>=20
> The settings in .dir-locals.el are not identical to those in
> Documentation/process/coding-style.rst. The most important difference
> is that "(arglist-cont-nonempty c-lineup-gcc-asm-reg
> c-lineup-arglist-tabs-only)" (which is not a valid alist) has been
> changed into "(arglist-cont-nonempty . c-lineup-arglist)". I have
> verified with several large and nontrivial kernel source files that
> the settings in .dir-locals.el format code according to what checkpatch
> expects.

Isn't it better if we collect such configuration files into a dedicated=20
directory (where exactly?) instead of putting them in the top-level one? Th=
en,=20
the developer has to copy/link the configuration file into the top-level=20
directory.

If we accept emacs configuration files in the top-level directory we will h=
ave=20
to accept also the ones from other editors (of course, when they support lo=
cal=20
configurations). In addition, probably, there are people who do not want to=
=20
use local configurations.

> The Italian and Chinese translations of the modified paragraphs have
> been generated by Google Translate.

Thanks for the Italian translation but unfortunately Google Translate is no=
t=20
up to the task :) Any one can understand the translation that Google did bu=
t=20
it is incorrect.

I can give you a correct translation once it has been agreed on the English=
=20
version.

>=20
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Cc: Geyslan G. Bem <geyslan@gmail.com>
> Cc: Tiago Natel de Moura <tiago4orion@gmail.com>
> Cc: Alison Chaiken <alison_chaiken@mentor.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Zhang Le <r0bertz@gentoo.org>
> Cc: Li Yang <leo@zh-kernel.org>
> ---
>  .dir-locals.el                                | 41 +++++++++++++++
>  Documentation/process/coding-style.rst        | 49 ++----------------
>  .../it_IT/process/coding-style.rst            | 50 ++-----------------
>  .../translations/zh_CN/coding-style.rst       | 43 +---------------
>  4 files changed, 53 insertions(+), 130 deletions(-)
>  create mode 100644 .dir-locals.el
>=20
> diff --git a/.dir-locals.el b/.dir-locals.el
> new file mode 100644
> index 000000000000..8cf857a00772
> --- /dev/null
> +++ b/.dir-locals.el
> @@ -0,0 +1,41 @@
> +;; Emacs settings for Linux kernel C code.
> +
> +(
> + (c-mode . (
> +	(c-basic-offset . 8)
> +	(c-cleanup-list . (brace-else-brace))
> +	(c-hanging-braces-alist . (
> +			(arglist-cont-nonempty)
> +			(block-close . c-snug-do-while)
> +			(brace-entry-open)
> +			(brace-list-open)
> +			(substatement-open after)
> +			))
> +	(c-label-minimum-indentation . 0)
> +	(c-offsets-alist . (
> +			(arglist-cont-nonempty . c-lineup-arglist)
> +			(arglist-intro         . +)
> +			(brace-list-intro      . +)
> +			(c                     . c-lineup-C-comments)
> +			(case-label            . 0)
> +			(comment-intro         . c-lineup-comment)
> +			(cpp-define-intro      . +)
> +			(cpp-macro             . -1000)
> +			(cpp-macro-cont        . +)
> +			(defun-block-intro     . +)
> +			(else-clause           . 0)
> +			(func-decl-cont        . +)
> +			(inclass               . +)
> +			(inher-cont            . c-lineup-multi-inher)
> +			(knr-argdecl-intro     . 0)
> +			(label                 . 0)
> +			(statement             . 0)
> +			(statement-block-intro . +)
> +			(statement-case-intro  . +)
> +			(statement-cont        . +)
> +			(substatement          . +)
> +			))
> +	(indent-tabs-mode . t)
> +	)
> + )
> +)
> diff --git a/Documentation/process/coding-style.rst
> b/Documentation/process/coding-style.rst index 277c113376a6..e12b845d6766
> 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -571,50 +571,11 @@ item, explaining its use.
>  9) You've made a mess of it
>  ---------------------------
>=20
> -That's OK, we all do.  You've probably been told by your long-time Unix
> -user helper that ``GNU emacs`` automatically formats the C sources for
> -you, and you've noticed that yes, it does do that, but the defaults it
> -uses are less than desirable (in fact, they are worse than random
> -typing - an infinite number of monkeys typing into GNU emacs would never
> -make a good program).
> -
> -So, you can either get rid of GNU emacs, or change it to use saner
> -values.  To do the latter, you can stick the following in your .emacs fi=
le:
> -
> -.. code-block:: none
> -
> -  (defun c-lineup-arglist-tabs-only (ignored)
> -    "Line up argument lists by tabs, not spaces"
> -    (let* ((anchor (c-langelem-pos c-syntactic-element))
> -           (column (c-langelem-2nd-pos c-syntactic-element))
> -           (offset (- (1+ column) anchor))
> -           (steps (floor offset c-basic-offset)))
> -      (* (max steps 1)
> -         c-basic-offset)))
> -
> -  (add-hook 'c-mode-common-hook
> -            (lambda ()
> -              ;; Add kernel style
> -              (c-add-style
> -               "linux-tabs-only"
> -               '("linux" (c-offsets-alist
> -                          (arglist-cont-nonempty
> -                           c-lineup-gcc-asm-reg
> -                           c-lineup-arglist-tabs-only))))))
> -
> -  (add-hook 'c-mode-hook
> -            (lambda ()
> -              (let ((filename (buffer-file-name)))
> -                ;; Enable kernel mode for the appropriate files
> -                (when (and filename
> -                           (string-match (expand-file-name
> "~/src/linux-trees") -                                         filename))
> -                  (setq indent-tabs-mode t)
> -                  (setq show-trailing-whitespace t)
> -                  (c-set-style "linux-tabs-only")))))
> -
> -This will make emacs go better with the kernel coding style for C
> -files below ``~/src/linux-trees``.
> +``GNU emacs`` automatically formats the C sources for you. However,
> +the defaults it uses are less than desirable. Use a version of emacs
> +that support directory local variables such that it automatically
> +picks up the settings from .dir-locals.el in the kernel top level
> +directory.
>=20
>  But even if you fail in getting emacs to do sane formatting, not
>  everything is lost: use ``indent``.
> diff --git a/Documentation/translations/it_IT/process/coding-style.rst
> b/Documentation/translations/it_IT/process/coding-style.rst index
> b707bdbe178c..05a86c69bd5d 100644
> --- a/Documentation/translations/it_IT/process/coding-style.rst
> +++ b/Documentation/translations/it_IT/process/coding-style.rst
> @@ -578,51 +578,11 @@ commento per spiegarne l'uso.
>  9) Avete fatto un pasticcio
>  ---------------------------
>=20
> -Va bene, li facciamo tutti.  Probabilmente vi =C3=A8 stato detto dal vos=
tro
> -aiutante Unix di fiducia che ``GNU emacs`` formatta automaticamente il
> -codice C per conto vostro, e avete notato che s=C3=AC, in effetti lo fa,=
 ma che
> -i modi predefiniti non sono proprio allettanti (infatti, sono peggio che
> -premere tasti a caso - un numero infinito di scimmie che scrivono in
> -GNU emacs non faranno mai un buon programma).
> -
> -Quindi, potete sbarazzarvi di GNU emacs, o riconfigurarlo con valori pi=
=C3=B9
> -sensati.  Per fare quest'ultima cosa, potete appiccicare il codice che
> -segue nel vostro file .emacs:
> -
> -.. code-block:: none
> -
> -  (defun c-lineup-arglist-tabs-only (ignored)
> -    "Line up argument lists by tabs, not spaces"
> -    (let* ((anchor (c-langelem-pos c-syntactic-element))
> -           (column (c-langelem-2nd-pos c-syntactic-element))
> -           (offset (- (1+ column) anchor))
> -           (steps (floor offset c-basic-offset)))
> -      (* (max steps 1)
> -         c-basic-offset)))
> -
> -  (add-hook 'c-mode-common-hook
> -            (lambda ()
> -              ;; Add kernel style
> -              (c-add-style
> -               "linux-tabs-only"
> -               '("linux" (c-offsets-alist
> -                          (arglist-cont-nonempty
> -                           c-lineup-gcc-asm-reg
> -                           c-lineup-arglist-tabs-only))))))
> -
> -  (add-hook 'c-mode-hook
> -            (lambda ()
> -              (let ((filename (buffer-file-name)))
> -                ;; Enable kernel mode for the appropriate files
> -                (when (and filename
> -                           (string-match (expand-file-name
> "~/src/linux-trees") -                                         filename))
> -                  (setq indent-tabs-mode t)
> -                  (setq show-trailing-whitespace t)
> -                  (c-set-style "linux-tabs-only")))))
> -
> -Questo far=C3=A0 funzionare meglio emacs con lo stile del kernel per i f=
ile che
> -si trovano nella cartella ``~/src/linux-trees``.
> +`` GNU emacs`` formatta automaticamente le sorgenti C per te. Tuttavia,
> +le impostazioni predefinite che utilizza sono meno desiderabili.
> +Utilizzare una versione di emacs che supporti le variabili locali della
> +directory in modo tale che raccolga automaticamente le impostazioni da
> +.dir-locals.el nella directory di livello superiore del kernel.
>=20
>  Ma anche se doveste fallire nell'ottenere una formattazione sensata in
> emacs non tutto =C3=A8 perduto: usate ``indent``.
> diff --git a/Documentation/translations/zh_CN/coding-style.rst
> b/Documentation/translations/zh_CN/coding-style.rst index
> 1466aa64b8b4..32a72a9c110a 100644
> --- a/Documentation/translations/zh_CN/coding-style.rst
> +++ b/Documentation/translations/zh_CN/coding-style.rst
> @@ -516,47 +516,8 @@ Documentation/doc-guide/ =E5=92=8C scripts/kernel-do=
c =E4=BB=A5=E8=8E=B7=E5=BE=97=E8=AF=A6=E7=BB=86=E4=BF=A1=E6=81=AF=E3=80=82
>  9) =E4=BD=A0=E5=B7=B2=E7=BB=8F=E6=8A=8A=E4=BA=8B=E6=83=85=E5=BC=84=E7=B3=
=9F=E4=BA=86
>  ------------------------------
>=20
> -=E8=BF=99=E6=B2=A1=E4=BB=80=E4=B9=88=EF=BC=8C=E6=88=91=E4=BB=AC=E9=83=BD=
=E6=98=AF=E8=BF=99=E6=A0=B7=E3=80=82=E5=8F=AF=E8=83=BD=E4=BD=A0=E7=9A=84=E4=
=BD=BF=E7=94=A8=E4=BA=86=E5=BE=88=E9=95=BF=E6=97=B6=E9=97=B4 Unix =E7=9A=84=
=E6=9C=8B=E5=8F=8B=E5=B7=B2=E7=BB=8F=E5=91=8A=E8=AF=89=E4=BD=A0
> -``GNU emacs`` =E8=83=BD=E8=87=AA=E5=8A=A8=E5=B8=AE=E4=BD=A0=E6=A0=BC=E5=
=BC=8F=E5=8C=96 C =E6=BA=90=E4=BB=A3=E7=A0=81=EF=BC=8C=E8=80=8C=E4=B8=94=E4=
=BD=A0=E4=B9=9F=E6=B3=A8=E6=84=8F=E5=88=B0=E4=BA=86=EF=BC=8C=E7=A1=AE=E5=AE=
=9E=E6=98=AF=E8=BF=99=E6=A0=B7=EF=BC=8C=E4=B8=8D=E8=BF=87=E5=AE=83
> -=E6=89=80=E4=BD=BF=E7=94=A8=E7=9A=84=E9=BB=98=E8=AE=A4=E5=80=BC=E5=92=8C=
=E6=88=91=E4=BB=AC=E6=83=B3=E8=A6=81=E7=9A=84=E7=9B=B8=E5=8E=BB=E7=94=9A=E8=
=BF=9C (=E5=AE=9E=E9=99=85=E4=B8=8A=EF=BC=8C=E7=94=9A=E8=87=B3=E6=AF=94=E9=
=9A=8F=E6=9C=BA=E6=89=93=E7=9A=84=E8=BF=98=E8=A6=81=E5=B7=AE=E2=80=94=E2=80=
=94=E6=97=A0=E6=95=B0=E4=B8=AA=E7=8C=B4=E5=AD=90
> -=E5=9C=A8 GNU emacs =E9=87=8C=E6=89=93=E5=AD=97=E6=B0=B8=E8=BF=9C=E4=B8=
=8D=E4=BC=9A=E5=88=9B=E9=80=A0=E5=87=BA=E4=B8=80=E4=B8=AA=E5=A5=BD=E7=A8=8B=
=E5=BA=8F) (=E8=AF=91=E6=B3=A8=EF=BC=9AInfinite Monkey Theorem)
> -
> -=E6=89=80=E4=BB=A5=E4=BD=A0=E8=A6=81=E4=B9=88=E6=94=BE=E5=BC=83 GNU emac=
s=EF=BC=8C=E8=A6=81=E4=B9=88=E6=94=B9=E5=8F=98=E5=AE=83=E8=AE=A9=E5=AE=83=
=E4=BD=BF=E7=94=A8=E6=9B=B4=E5=90=88=E7=90=86=E7=9A=84=E8=AE=BE=E5=AE=9A=E3=
=80=82=E8=A6=81=E9=87=87=E7=94=A8=E5=90=8E=E4=B8=80=E4=B8=AA=E6=96=B9=E6=A1=
=88=EF=BC=8C
> -=E4=BD=A0=E5=8F=AF=E4=BB=A5=E6=8A=8A=E4=B8=8B=E9=9D=A2=E8=BF=99=E6=AE=B5=
=E7=B2=98=E8=B4=B4=E5=88=B0=E4=BD=A0=E7=9A=84 .emacs =E6=96=87=E4=BB=B6=E9=
=87=8C=E3=80=82
> -
> -.. code-block:: none
> -
> -  (defun c-lineup-arglist-tabs-only (ignored)
> -    "Line up argument lists by tabs, not spaces"
> -    (let* ((anchor (c-langelem-pos c-syntactic-element))
> -           (column (c-langelem-2nd-pos c-syntactic-element))
> -           (offset (- (1+ column) anchor))
> -           (steps (floor offset c-basic-offset)))
> -      (* (max steps 1)
> -         c-basic-offset)))
> -
> -  (add-hook 'c-mode-common-hook
> -            (lambda ()
> -              ;; Add kernel style
> -              (c-add-style
> -               "linux-tabs-only"
> -               '("linux" (c-offsets-alist
> -                          (arglist-cont-nonempty
> -                           c-lineup-gcc-asm-reg
> -                           c-lineup-arglist-tabs-only))))))
> -
> -  (add-hook 'c-mode-hook
> -            (lambda ()
> -              (let ((filename (buffer-file-name)))
> -                ;; Enable kernel mode for the appropriate files
> -                (when (and filename
> -                           (string-match (expand-file-name
> "~/src/linux-trees") -                                         filename))
> -                  (setq indent-tabs-mode t)
> -                  (setq show-trailing-whitespace t)
> -                  (c-set-style "linux-tabs-only")))))
> -
> -=E8=BF=99=E4=BC=9A=E8=AE=A9 emacs =E5=9C=A8 ``~/src/linux-trees`` =E4=B8=
=8B=E7=9A=84 C =E6=BA=90=E6=96=87=E4=BB=B6=E8=8E=B7=E5=BE=97=E6=9B=B4=E5=A5=
=BD=E7=9A=84=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=81=E9=A3=8E=E6=A0=BC=E3=80=82
> +``GNU emacs``=E6=9C=83=E8=87=AA=E5=8B=95=E7=82=BA=E6=82=A8=E8=A8=AD=E7=
=BD=AEC=E6=BA=90=E4=BB=A3=E7=A2=BC=E3=80=82=E4=BD=86=E6=98=AF=EF=BC=8C=E5=
=AE=83=E4=BD=BF=E7=94=A8=E7=9A=84=E9=BB=98=E8=AA=8D=E5=80=BC=E4=B8=8D=E5=A4=
=AA=E7=90=86=E6=83=B3=E3=80=82
> +=E4=BD=BF=E7=94=A8=E6=94=AF=E6=8C=81=E7=9B=AE=E9=8C=84=E6=9C=AC=E5=9C=B0=
=E8=AE=8A=E9=87=8F=E7=9A=84emacs=E7=89=88=E6=9C=AC=EF=BC=8C=E4=BB=A5=E4=BE=
=BF=E5=AE=83=E8=87=AA=E5=8B=95=E5=BE=9E=E5=85=A7=E6=A0=B8=E9=A0=82=E7=B4=9A=
=E7=9B=AE=E9=8C=84=E4=B8=AD=E7=9A=84.dir-locals.el=E4=B8=AD=E7=8D=B2=E5=8F=
=96=E8=A8=AD=E7=BD=AE=E3=80=82
>=20
>  =E4=B8=8D=E8=BF=87=E5=B0=B1=E7=AE=97=E4=BD=A0=E5=B0=9D=E8=AF=95=E8=AE=A9=
 emacs =E6=AD=A3=E7=A1=AE=E7=9A=84=E6=A0=BC=E5=BC=8F=E5=8C=96=E4=BB=A3=E7=
=A0=81=E5=A4=B1=E8=B4=A5=E4=BA=86=EF=BC=8C=E4=B9=9F=E5=B9=B6=E4=B8=8D=E6=84=
=8F=E5=91=B3=E7=9D=80=E4=BD=A0=E5=A4=B1=E5=8E=BB=E4=BA=86=E4=B8=80=E5=88=87=
=EF=BC=9A=E8=BF=98=E5=8F=AF
>  =E4=BB=A5=E7=94=A8 ``indent`` =E3=80=82




