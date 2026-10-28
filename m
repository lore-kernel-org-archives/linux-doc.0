Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793215592;
	b=jMe2Hm76V0dv1sFNVE9WQc1BRQsiOvuq0+gSjA1YNx66zH19OiHDs1SrMk1ZXZyHty6F
	 Tkq/ZlZpuT9AHwZDNeYiI1Oa67TW8GQa2mRqR21KulHabDn3fAx/kWGVqx+44fxEdQWjM
	 ZXqnC3YWcXXjdbCfqtmdCG77z12YpNKJHSZYNM2x6d/sayw9UPOhti9fF4Dxb+vJVItfk
	 GthxSkJFPDY5A680o9qlx2zD3xTp9goX4m/KHyKLBSoKEEi3NcO3G2nwJIb9irYp+h58p
	 BD422rN8iBgNuzUdXaFQnc8JPh07rBdaj33HQD1JBgOdClFdBbObqIoS0ogu6LgnBlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
	b=itDwYyAo8XOdMQpHhx4zmwgb1Rh7Qwud1eeigTsILbAema3/WSpq3o+5m5uwqIdle3Qm
	 hlaPsRzXcNEH9c7jRx5m0nmb2PR9tjVfZubgELCWDZBDE7vH0ASKkRcZnzsQ4U0uENDM/
	 7MsKLwcpdIQFJuvQy5w+byRtKI9xdo1FL6HRm6wPQn/UTgC1f+IPzVXyi46kfNVDQicMG
	 Prs+1Ciz78sKoS3ABDfoCyn8STBc/TdgKL72IpO7TesYTSbvwQzSE+lKKAKRrhAEfPj9f
	 xDX04WmLgQIqbonks0GbZrr11G7lBXJ+9NPDCj3mDJHT2EY8bh0pKKvfZv2d7XPfWZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORU73yaL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4C606A31A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 19:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORU73yaL
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1107307e87.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 12:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793215590; cv=none;
        d=google.com; s=arc-20260327;
        b=PBAoZ+zK81z8OTC+7QL3JhlNajgeoO2aXN2nqrmN4UVim2kIVor7M1iTq+QdGF0wJQ
         A8o2cXwpxQw16sfP0YkVK7lEtUQg1NvYV7EoaSbiu1SlKc7+BvoHLdaWa38W+1yi6bUJ
         ncBFPAiMmitVFi8aUWKh43abV2zqD4cDBs0k1SjAenpruc0Pa29nP7SXqX/EiIsoH6pK
         4/3C2V3sFBUQfbuHk70tvPvnv8NRI1xwD9TozW88sBIoU/0e/zmVxjs8OY9VmVIvJ6Da
         lHbqLA2pq8fLeUo1Ff61blNxbcvZ1cl//6JIIpxbmzxkqLCZo36qVGTbPpd1x90+ohf/
         33gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
        fh=R4dFORs7+ie4jEX8oDdIFsjHLgfiFlH5dlo+YQGv/9M=;
        b=D9S7Zme7T8PHtRVJNHiUKBQLfnTFvZjILGmurhnzwRmb8pKL3fTAa5O/4MCjdFPYVJ
         B2RN7VS+DYyUJyJwOfUcgJxqdefsTs5JCpCe/2FNBqI0snICYuVk/g9nQFfu7DhlSlgO
         FPE/dp3JO+JSD2j9wlzHjQJIcF+7erQy0RbUnLFKlOtUbp5nYjLyp5U+jldyGKz2iSWE
         j+3sjnyvAKmWdhgh3v0oLOvfBZG2E+JUlPfa7Pa/j7a30A5KA+HASDTEVqDeli9W5Fc3
         iJrNZA3gtjGzKqtq311+0uLUMqT/Fe7QO0TaEYxtaU8hpQuU5m3KCh1UETmIlmeeHD/U
         1zNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215590; x=1793820390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
        b=ORU73yaLtW5wRVH5cpaMw0E38ib3Jw2vDW0ZmCirAgqx3Tgpr3CvejRnYiVql79xlq
         43v46nR+Jxmm4easMaolaT9XTNZu+5M5HwcIyXOogeb28n1gaE18EH6stokH3i0NqQRw
         RRnc16kf0OebFj09rDU3H4qY3O55i70vdDifjoP9Mb0Jh1Zock5qQC8UfcKprVa6RGDk
         IKElMRLctZ6RLBegeIhIL+1FpA0w7eurjp0NKYgW9xCnQmgq1jKtvHSQEAwClDaY0tl1
         EGZBWspjS2CtHjnPeUhSPGGSM0txo7a63fvQZ8LPGntpS4SgT25BfWwJicb2tOgL+EL3
         XAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215590; x=1793820390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
        b=RIBxNz9Vopg8RC2KIiiNNJ+2lC8LPdX6PNK0BKGyevV26/2AI4cQLettviv3/V5yYY
         qrKZf49p8xBqPU+Iargl0m4id9gV5o4tjo0yVgne+Vz/SksMKjHmTtDlFlExbAQ5TnY7
         Rt/JyQ5yZVJZmjK2itTbwpyzB+sUlYLoRmY06571eLLp9fubkZ295qG8HPWvcaeEYdCV
         iuK/dQa6XK5wJ19lv7rHB0ZJvtP1Y9bj+pLpLrkYi90NSWdwCZzJP9+PBkLTqIqOiMju
         Ya0PZvtOhPjZXXaNKLTswuDgIw8PAAshYejuJyXJus6lLSMGdf4aSOH+CyeIufNTMx15
         9jcg==
X-Gm-Message-State: AFq9FYI95Fyebqtq5mgh4oFNLGMYHVHNga14T43Ralt0uJdDUnJSvBID
	UKRHx31ACsUatuEmBoB1n/PNNtfsAPnokys38BuczlGMb+fqlZizHxqMzNzDtNSWdMHidL89JMe
	5J09Mx3mmHifz3nTpYjq8T0jOaAHKqeI=
X-Gm-Gg: AYBFou0xS01NMIv0JUTwWi/Oq5ZmX2h/q9bt4Ot+rj3oNvzETjXStEyiqfFy5X/VTO/
	F1dcb7qB3C3//eu4/yrDlrDF3fXIUPUBBAMHWCk8RD8FuILLTp2yf/X04VErPHkhdDF9hpF8p5+
	To5lKSiyG7eWuVXxI4hB0U14u9B9fNTxldQJs+u8teHxqhcD1dErjMoiFlL7xbMxUx0ztvTxICb
	Nqbp+9K5p8NBulTbKdvRbDsI6gWhRDpk8oWYwVVhssTLegzLrqRzORDii/boPDH0XYEGTqmmlHX
	YwCjGHsp0w4PaFcxKXJTCO6ANYiTigRf57z4u2g420hu4DE1AtMd6UtEkROQSfkBzIRbzdWGRm0
	t4U6bemQVHfrWofGhVL2Bd9KH3+mpBGOKGyY3/binl1MrayalAEcHamM6NEokhG8tJIngHMzQo/
	IWO7vdC3P3dlOhF23PmLOLJ05aDAizT0sykJRytj+4dwNKomSRADYoqYGr5OQIe30OTTs/FHOEK
	+j3xmsEMjltxSITHh3+
X-Received: by 2002:a05:6512:39d4:b0:5be:4904:d2c4 with SMTP id
 2adb3069b0e04-5bfcad7e51bmr1381844e87.15.1793215589567; Wed, 28 Oct 2026
 12:26:29 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028122739.5874-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261028122739.5874-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 28 Oct 2026 16:26:13 -0300
X-Gm-Features: AclHuK8NspXUp5sa4f9DrpougHgahx4CAWqm7lcpujQjdYinJ2Zou8w4OpupYjk
Message-ID: <CAMAsx6e9Br5iqUGDPVrJ4forg3AV_-HXZ_32cn1rXzjE7Tb+1g@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add maintainer PGP guide
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026, Gabriel Ribeiro <ic.gabrielribeiro@gmail.com> wrote:

> docs: translations: pt_BR: add maintainer PGP guide
>
> Translate the maintainer PGP guide into Brazilian Portuguese and add it
> to the pt_BR process index.

Hi Gabriel,

Thanks for the patch. I applied it on top of your programming-language.rst
patch (index.rst depends on it), compared the translation against the
original, and ran a full make htmldocs. No warnings were emitted for this
file, but I found a few things, commented inline below.

Also, checkpatch warns about a commit message body line over 75 columns
(the "Translate the maintainer PGP guide ..." line quoted above). Please
wrap it. The MAINTAINERS warning can be ignored, since
Documentation/translations/pt_BR/ is already covered.

> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst

> +- Snapshots peri=C3=B3dicas de vers=C3=B5es (tarballs)

I believe it should be "peri=C3=B3dicos", since "snapshot" is masculine.

> +- Os tarballs v=C3=AAm acompanhados de assinaturas PGP destacadas.

"Separadas" sounds more natural to me for "detached signatures", but this
is a preference.

> +Desde o comprometimento de sistemas centrais do kernel.org em 2011, o
> +princ=C3=ADpio operacional do projeto Kernel Archives =C3=A9 presumir qu=
e qualquer

The original says "the main operating principle", so "principal" got
dropped here.

> +.. _pt_BR_devs_not_infra:

Same for pt_BR_pgp_tools, pt_BR_protect_your_key, pt_BR_smartcards,
pt_BR_pgp_with_git, pt_BR_kernel_identities and
pt_BR_kernel_org_trust_repository: none of these labels is referenced
anywhere in the tree. The ones that matter are pt_BR_pgpguide (document
anchor) and pt_BR_verify_identities (used by :ref:). The original has the
same unused labels, so keeping or dropping them is a matter of taste.

> +- Chaves **[S]** podem ser usadas para assinar.

(Also for the [E]/[A]/[C] items.) These end with a period and the original
ones do not. Not a problem, just a difference.

> +Use uma frase secreta forte
> +--------------------------------

The underline is longer than the title (27 vs 32 characters). RST accepts
it, but the original keeps them the same length. The same happens at
"Entenda as subchaves PGP", "Use o gpg-agent via SSH", "Crie commits
assinados" and "Instale e configure o patatt".

> +- `Nitrokey Start <pt_BR_nitrokey_start_>`_: hardware aberto e software

Instead of the embedded alias with a separate prefixed target, you can
keep the original form:

  `Nitrokey Start`_
  .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys

The pt_BR_ prefix only matters for labels used with :ref:, which are
global; hyperlink targets are local to the file. The embedded-alias form
also makes docutils report a duplicate-name INFO for "Prote=C3=A7=C3=A3o da
integridade do c=C3=B3digo", which appears twice.

> +  resistente a adultera=C3=A7=C3=B5es e com mais recursos de seguran=C3=
=A7a e formatos
> +  USB.
> +  Oferece suporte =C3=A0 criptografia de curva el=C3=ADptica (ED25519 e =
NISTP).

"USB." is left alone on a line and "Oferece suporte..." starts on the
next one; the wrapping could be adjusted.

> +``key 1`` (=C3=A9 a primeira da lista, a subchave **[E]**):
> +
> +    gpg> key 1

This one is a real bug: the paragraph is missing the "::" at the end. The
original ends with ")::". Without it, the "gpg> key 1" line is not a
literal block; in the generated HTML it comes out as a blockquote. Sphinx
does not warn about this, so a clean build does not catch it.

> +qual chave est=C3=A1 =E2=80=9Cselecionada=E2=80=9D. Ele funciona como um=
 *alternador*: Se voc=C3=AA

"Se" should be lowercase after the colon.

> +Use o reposit=C3=B3rio de chaves confi=C3=A1veis do kernel.org

The original heading is "Using the kernel.org web of trust repository",
so "web of trust" got lost here.

> +`adicione o UID =C3=A0 sua chave <pt_BR_add_kernel_uid_>`_ para tornar o=
 WKD

The link text in the original is "add the kernel.org UID to your key", so
"do kernel.org" got lost.

Everything else matches the original: the remaining 40 literal blocks are
byte-identical, URLs, e-mail addresses and numbers match, and the heading
structure and notes/warnings are the same.

With the "::", the lowercase "Se", "peri=C3=B3dicos" and the commit message
wrapping fixed, this looks good to me.

Thanks,
Daniel
