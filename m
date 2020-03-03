Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CE4C3F2D7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 17:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C0D120848
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 17:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PD/R9+Mj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgCCRTc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 12:19:32 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34773 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbgCCRTc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Mar 2020 12:19:32 -0500
Received: by mail-pg1-f193.google.com with SMTP id t3so1848203pgn.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2020 09:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jPSqNTJB6oFtzjzmDLc+9zVnydkmrV2ijq5zde7srqc=;
        b=PD/R9+MjS+r3DY1G3jbJan5hv+mx7KxmbweIwBsaAkxYzqjQTCNjuHqPsRUHaW3YJr
         t5Jh6b2Ka6CoqdeigyaQtNzCOZR0iimJGwA8oENgpa3+kGANqG30Xt2OCbCjXNQjHNyI
         OodvimhugQGD0T4mq/XmKAq4YSqGNDHxyeTQd/9uOlg6NmLj+6qIjvzBf1jJsLgE6NJX
         z5qB6GEBtWHpsBSlb2LfFbw7plyvYn3aj/+92uZBZkiJYlXSMnKG2f9TNXBgCOWPz17o
         XYSyW6nflrse/YzIEe6TNygYaLyGPNkq3MNyaFP4su8CzCvd/MzpXdykJn686z00nElm
         EmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jPSqNTJB6oFtzjzmDLc+9zVnydkmrV2ijq5zde7srqc=;
        b=L2dxQU9n4R2n1PxtMILazRNbzF9NWHlEwoknSo6aH6IRLjHksNNjl43xHrI2WufjPP
         UzE1QVyX3j4HjecfGAmq9COOf5Tqny+YidmNeVbmA/llF9j8d4YTZRLFnmCYrzcasHof
         xv8umL3dUm9Q/a++5PQ+biiPRqomYLje3dQF1qWIm+huHD6vbuo6gg+IQdVILzdNfusg
         /+CbWhW0sIYF4E58zvDXhsJKmqxylNVjNsEH+21hgMZ7XstOhytTHmecE95/HynFmkvt
         CivQtFxz+J+OH1R2+aBQd17epFuY13ES8/z5yWmhdUkN5aERqeSdeCjlU6U0CHKj1FYB
         ewYQ==
X-Gm-Message-State: ANhLgQ369AjN4hhSuGP7LwjCsV+mI35eJ6B/o+arl4kwX3NHCYCVl7fF
        VXlob4ZxoQztdT/r11dIH9UGUvfczbagtdz/Eb6uOiJMpa0=
X-Google-Smtp-Source: ADFU+vu6NWJHuK3TC1OVfoWKr8Ux8zaenhlStyU8kukkers9pzz+oLzD/jOnecsyJ9hKSHvRucPPHAcCM7FKUpdFab4=
X-Received: by 2002:a63:4e22:: with SMTP id c34mr5151590pgb.263.1583255970960;
 Tue, 03 Mar 2020 09:19:30 -0800 (PST)
MIME-Version: 1.0
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
 <e733111f3599dff96524ad09ace5204ac6bb496b.1583250595.git.mchehab+huawei@kernel.org>
In-Reply-To: <e733111f3599dff96524ad09ace5204ac6bb496b.1583250595.git.mchehab+huawei@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 Mar 2020 09:19:19 -0800
Message-ID: <CAKwvOdmHMjA3YepX6LNpFAAvPb1eikO0KcDG2J2JwyP690rk4Q@mail.gmail.com>
Subject: Re: [PATCH 6/9] docs: translations: it: avoid duplicate refs at programming-language.rst
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 3, 2020 at 7:50 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As the translations document is part of the main body, we can't
> keep duplicated references there. So, prefix the Italian ones
> with "it-".
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Recensito-da: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  .../it_IT/process/programming-language.rst    | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/translations/it_IT/process/programming-languag=
e.rst b/Documentation/translations/it_IT/process/programming-language.rst
> index f4b006395849..c4fc9d394c29 100644
> --- a/Documentation/translations/it_IT/process/programming-language.rst
> +++ b/Documentation/translations/it_IT/process/programming-language.rst
> @@ -8,26 +8,26 @@
>  Linguaggio di programmazione
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> -Il kernel =C3=A8 scritto nel linguaggio di programmazione C [c-language]=
_.
> -Pi=C3=B9 precisamente, il kernel viene compilato con ``gcc`` [gcc]_ usan=
do
> -l'opzione ``-std=3Dgnu89`` [gcc-c-dialect-options]_: il dialetto GNU
> +Il kernel =C3=A8 scritto nel linguaggio di programmazione C [it-c-langua=
ge]_.
> +Pi=C3=B9 precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ u=
sando
> +l'opzione ``-std=3Dgnu89`` [it-gcc-c-dialect-options]_: il dialetto GNU
>  dello standard ISO C90 (con l'aggiunta di alcune funzionalit=C3=A0 da C9=
9)
>
> -Questo dialetto contiene diverse estensioni al linguaggio [gnu-extension=
s]_,
> +Questo dialetto contiene diverse estensioni al linguaggio [it-gnu-extens=
ions]_,
>  e molte di queste vengono usate sistematicamente dal kernel.
>
>  Il kernel offre un certo livello di supporto per la compilazione con ``c=
lang``
> -[clang]_ e ``icc`` [icc]_ su diverse architetture, tuttavia in questo mo=
mento
> +[it-clang]_ e ``icc`` [it-icc]_ su diverse architetture, tuttavia in que=
sto momento
>  il supporto non =C3=A8 completo e richiede delle patch aggiuntive.
>
>  Attributi
>  ---------
>
>  Una delle estensioni pi=C3=B9 comuni e usate nel kernel sono gli attribu=
ti
> -[gcc-attribute-syntax]_. Gli attributi permettono di aggiungere una sema=
ntica,
> +[it-gcc-attribute-syntax]_. Gli attributi permettono di aggiungere una s=
emantica,
>  definita dell'implementazione, alle entit=C3=A0 del linguaggio (come le =
variabili,
>  le funzioni o i tipi) senza dover fare importanti modifiche sintattiche =
al
> -linguaggio stesso (come l'aggiunta di nuove parole chiave) [n2049]_.
> +linguaggio stesso (come l'aggiunta di nuove parole chiave) [it-n2049]_.
>
>  In alcuni casi, gli attributi sono opzionali (ovvero un compilatore che =
non
>  dovesse supportarli dovrebbe produrre comunque codice corretto, anche se
> @@ -41,11 +41,11 @@ possono usare e/o per accorciare il codice.
>  Per maggiori informazioni consultate il file d'intestazione
>  ``include/linux/compiler_attributes.h``.
>
> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> -.. [gcc] https://gcc.gnu.org
> -.. [clang] https://clang.llvm.org
> -.. [icc] https://software.intel.com/en-us/c-compilers
> -.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-=
Options.html
> -.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> -.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-S=
yntax.html
> -.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +.. [it-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. [it-gcc] https://gcc.gnu.org
> +.. [it-clang] https://clang.llvm.org
> +.. [it-icc] https://software.intel.com/en-us/c-compilers
> +.. [it-gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Diale=
ct-Options.html
> +.. [it-gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.h=
tml
> +.. [it-gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribut=
e-Syntax.html
> +.. [it-n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> --
> 2.24.1
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/e733111f3599dff96524ad09ace5204ac6bb496b.1583250595.git=
.mchehab%2Bhuawei%40kernel.org.



--=20
Thanks,
~Nick Desaulniers
