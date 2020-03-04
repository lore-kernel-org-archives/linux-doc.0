Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063C0C3F2D1
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 08:35:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD40521741
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 08:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="xyTDMquN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgCDIfI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Mar 2020 03:35:08 -0500
Received: from mx.kolabnow.com ([95.128.36.42]:43684 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728301AbgCDIfI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Mar 2020 03:35:08 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 39D165ED;
        Wed,  4 Mar 2020 09:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1583310902; x=1585125303; bh=ARjgys6wnNKVl92ykcAcXMzpN9kzBsDWxuu
        6ynvn+j8=; b=xyTDMquNizCJzgbLQKt46zp+ww6YJl3vdXTLTMNM+FCkuo9I/1n
        1e44bqMr/bAIACVgoFUIvNmIauDsnDozxGP3hG+vBiVTNdW5nZ6F66oXU4W+zqeT
        Q3EPmec9risFINhtCI+fFdWX7OKT3Ksj8NMShlJ149supb5z5uPzE4EpIRVqgDad
        sM0RrESmgW1zmnBKIEpidfFSpRvZVlPUobP1KNsYiFVsudtZzK30d65Xvoz1xsTg
        CYfWzGUThh/PNLBDpOv95ES5UCg5MSc1mZZAM1yS3ZBsHSFnTW6dbf4RjziLgVXO
        9BGWtZrC+GXPb8oN2vkqsiobLu0kdjj/3ujuqVT2otXFBifRudd2OJcvobQ9sEVf
        zI5yYjMQlCX5RFtchOiGLQeLidajzNiT527HKYYOTIna8YEjDzvVyW52iF7bqCmM
        ppu1f7msQn/6vibRCOi2sFXNrhipfe0O0sNGmfmccRbdrAirpXFDwwmgSxTWeqlf
        Gxi7yskmPXup5ifvAgcO7LWW8a/mAy2+8thvylt/5T8uuF+wsUBDOvgVkpmQO1A7
        qZMV70xWGj/Ddv6ZYx0i/6Dr+En5yY1t41JYIqFPmU5n55k7BHh2WwR3Y8LS/W96
        m+xN8hi0f2aL0CBo6AC8IZtBZlZu5xKBdsard4Q0zcUzkMyPI+dKzsjc=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 93dAO4nFNplu; Wed,  4 Mar 2020 09:35:02 +0100 (CET)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id E0A964D1;
        Wed,  4 Mar 2020 09:35:00 +0100 (CET)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id 89999BAF;
        Wed,  4 Mar 2020 09:35:00 +0100 (CET)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 6/9] docs: translations: it: avoid duplicate refs at programming-language.rst
Date:   Wed, 04 Mar 2020 09:34:58 +0100
Message-ID: <1950025.KkpgXc3J7C@pcbe13614>
In-Reply-To: <e733111f3599dff96524ad09ace5204ac6bb496b.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org> <e733111f3599dff96524ad09ace5204ac6bb496b.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, March 3, 2020 4:50:36 PM CET Mauro Carvalho Chehab wrote:
> As the translations document is part of the main body, we can't
> keep duplicated references there. So, prefix the Italian ones
> with "it-".
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I thought this patch was already there, it was raised some months ago;=20
probably I am confused I can't retrieve the thread. Anyway:

Reviewed-by: Federico Vaga <federico.vaga@vaga.pv.it>

Hopefully in the next weeks I should be able to be on duty again and fix al=
l=20
the issues and re-align the translation. It took a while to fix my personal=
=20
life :)

> ---
>  .../it_IT/process/programming-language.rst    | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git
> a/Documentation/translations/it_IT/process/programming-language.rst
> b/Documentation/translations/it_IT/process/programming-language.rst index
> f4b006395849..c4fc9d394c29 100644
> --- a/Documentation/translations/it_IT/process/programming-language.rst
> +++ b/Documentation/translations/it_IT/process/programming-language.rst
> @@ -8,26 +8,26 @@
>  Linguaggio di programmazione
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> -Il kernel =E8 scritto nel linguaggio di programmazione C [c-language]_.
> -Pi=F9 precisamente, il kernel viene compilato con ``gcc`` [gcc]_ usando
> -l'opzione ``-std=3Dgnu89`` [gcc-c-dialect-options]_: il dialetto GNU
> +Il kernel =E8 scritto nel linguaggio di programmazione C [it-c-language]=
_.
> +Pi=F9 precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ usan=
do
> +l'opzione ``-std=3Dgnu89`` [it-gcc-c-dialect-options]_: il dialetto GNU
>  dello standard ISO C90 (con l'aggiunta di alcune funzionalit=E0 da C99)
>=20
> -Questo dialetto contiene diverse estensioni al linguaggio
> [gnu-extensions]_, +Questo dialetto contiene diverse estensioni al
> linguaggio [it-gnu-extensions]_, e molte di queste vengono usate
> sistematicamente dal kernel.
>=20
>  Il kernel offre un certo livello di supporto per la compilazione con
> ``clang`` -[clang]_ e ``icc`` [icc]_ su diverse architetture, tuttavia in
> questo momento +[it-clang]_ e ``icc`` [it-icc]_ su diverse architetture,
> tuttavia in questo momento il supporto non =E8 completo e richiede delle
> patch aggiuntive.
>=20
>  Attributi
>  ---------
>=20
>  Una delle estensioni pi=F9 comuni e usate nel kernel sono gli attributi
> -[gcc-attribute-syntax]_. Gli attributi permettono di aggiungere una
> semantica, +[it-gcc-attribute-syntax]_. Gli attributi permettono di
> aggiungere una semantica, definita dell'implementazione, alle entit=E0 del
> linguaggio (come le variabili, le funzioni o i tipi) senza dover fare
> importanti modifiche sintattiche al -linguaggio stesso (come l'aggiunta di
> nuove parole chiave) [n2049]_. +linguaggio stesso (come l'aggiunta di nuo=
ve
> parole chiave) [it-n2049]_.
>=20
>  In alcuni casi, gli attributi sono opzionali (ovvero un compilatore che =
non
> dovesse supportarli dovrebbe produrre comunque codice corretto, anche se =
@@
> -41,11 +41,11 @@ possono usare e/o per accorciare il codice.
>  Per maggiori informazioni consultate il file d'intestazione
>  ``include/linux/compiler_attributes.h``.
>=20
> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> -.. [gcc] https://gcc.gnu.org
> -.. [clang] https://clang.llvm.org
> -.. [icc] https://software.intel.com/en-us/c-compilers
> -.. [gcc-c-dialect-options]
> https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html -..
> [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html -..
> [gcc-attribute-syntax]
> https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html -.. [n2049]
> http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf +..
> [it-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards +..
> [it-gcc] https://gcc.gnu.org
> +.. [it-clang] https://clang.llvm.org
> +.. [it-icc] https://software.intel.com/en-us/c-compilers
> +.. [it-gcc-c-dialect-options]
> https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html +..
> [it-gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> +.. [it-gcc-attribute-syntax]
> https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html +.. [it-n2049]
> http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf


=2D-=20
=46ederico Vaga
http://www.federicovaga.it/


