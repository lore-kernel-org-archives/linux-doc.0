Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB030C35E
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785005289; cv=none; b=gz90KbOyShczIQGXhPK6mtx8O+//U9TfKh0kHPzBJSY1KCp0NzzdpWHIrgKKrQMuWgmjkeYwPV4bY66OrR0oKHcCAkae9NYcRyXjaGa0wCXZ8ReSp4leSDg0Cd39K5hMMrUcAw39CJcEMZ4A14hMbpLVGFiU+t5p+aHaWAiRPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785005289; c=relaxed/simple;
	bh=qC35bNir+ulREZsEvd/fPAFGmhu1yEh3pr0CUfYux4Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX5d9Qw7fh06cVix1aSRabwvUf3WbhXPSEb4ySYNgOSq0Ea6Tv1IvjugYPWWWeDIXzWeXaS/KI9OYzi76x3mEukmLOcF0zb4y/pMolqoX46wSd1mH6r85GS+1qj1r/Em7XHV9HJrJsXrAea/7n9gVaTJ8myYnIBacYLP47+jNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=aPUZr7q/; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="aPUZr7q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1785005274; x=1785264474;
	bh=qC35bNir+ulREZsEvd/fPAFGmhu1yEh3pr0CUfYux4Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aPUZr7q/NdYOfsm1d4zDw9y7+FdKFYpdIY/f3Q4Rrq79eFwksDDnkiHcksn5hS++X
	 klgAh3cFfnyTrIkEzFHOuj6kmYgAKY1BOBoyKa6nSYvwZFcKvdnZK5YRCZ5xtg7A0l
	 XyjLCmHtQl6dNmrV6OKMXkmUnwIa8F/AGkSbl5NavdEqy6txIExhjfMmZQv0NjT318
	 hAmfz/PZLaLzOmAS1lUInBMW3ADYHFWjw4PuWF/dJB3L9gFJc1Xvql6l2fHyEnRjHA
	 1KyfkHhoOMKD9qE+aOTXmdEI5+rwb6Fza7vM6RmwJs0aXIcMBcYRZerpMbn78kSbmX
	 BB9kR/AnSPI4Q==
Date: Sat, 25 Jul 2026 18:47:51 +0000
To: Doehyun Baek <doehyunbaek@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] Docs/translations/it_IT: sync changes.rst requirements
Message-ID: <2gpwx4wwc4snjomb5bvdnjpth5f5gpprhcqzkoloviuiwylpux@ivyk3gigsrzj>
In-Reply-To: <20260722161814.2007502-1-doehyunbaek@gmail.com>
References: <20260722161814.2007502-1-doehyunbaek@gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: a2329cf174054ba90193856fa4fdd66bb8dd09e1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Doehyun,

See a few minor inline comments.

On Wed, Jul 22, 2026 at 04:18:13PM +0000, Doehyun Baek wrote:
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
>+l'errore "func_proto incompatible with vmlinux". Molte kfunc sched_ext so=
no
>+interessate.

I would rather use:

"Molte kfunc in sched_ext sono interessate da questo problema."

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
>+documentazione (Sphinx), fra gli altri.

"fra gli altri" -> "e altro ancora".

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
>+sugli intervalli di indirizzi per i moduli incorporati

"incorporati" -> "integrati"

--=20
Federico Vaga

