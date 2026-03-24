Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83684035B3
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364874; cv=pass; b=K41ntTUtwJveLBO4QxI52ztr21vA0KD2liLkgRDlXHJZyrkATCedbNKk0Jr9q2vfXVNVwIEGjqWHKxkU2n6rpCtacAKUg62NrOpPyEm23059RnQYI96p7CD73UKnpNRI8HuyPLlA3N1BINNieo6tEofAVLjMR3nsLruZrOeaugE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364874; c=relaxed/simple;
	bh=1Z6JMNCHSGaxtIAix0aAtaZagu/pLyzUz7fEOf63FQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAETc51iRsAFet2AcXJMes2YcoXNEVPMvYimBQMfkhkFScf1TnJg85MpOhO7CNFldaAzPo4JvQphzu1fexbqKnDLpuFPEBwvxklWp8Q7t09MmVlgArRAaZrjNKbcjvuK2Y5L6lBr4TNLdYqsMdIh5sX8/0abNDIL8iSESho4m5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhE2htIX; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhE2htIX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so43334315e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364871; cv=none;
        d=google.com; s=arc-20240605;
        b=UgCrW5V8MnjPtPXPG7u+WTY5tI1FO0j+A4SR4qgHPgS0mnQ/52QjonWps473xePIXT
         ryNNn/sKb0g92uC4PsvSoRXzdOcMGH3uFOJz9UUS+HDX09Y7Tt+3tpqbDvPZHGGhpTXQ
         6G6t2HYZBmEPP57N3LFOfNm9zkN1fb+v5OmhPZajNoCB3Uma3jMi4wr4+GCnyB4M9re9
         Kv/CJVIHTcqrpRSh6JlEfHaBh9MCxzYkYxDCo2p/2Q5KeanSiV8EnnZe9XiUWK7XNXco
         rwnU4Xx+TLL7rYCj/HwWtxv7DgHXi6hS499DmDmXveGk9ifcYkG1CTOpgTJaD4AMDYTp
         MjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BskBfui7rapELmoLhcbRuH9sFyg4/N10zalNMto/sCg=;
        fh=tAUcXyqMeFQcuIJRPlEpbeGwJtGU3djpYAYTrABiU+w=;
        b=XTGKi+u1aP29tRSKDbQtEnZ/y5vb+txlTkmlHep6FtIbZlasK4BdIM9Cq9fa6Guaan
         c6h+7aBVAaU0SMjeceydGt+ZBC/bxggHfmgwoVpb6BMvH49CR6nuZYutBu2SGJTw5iSA
         R6HRnG7PEdprGCm20jzfv1KWdgplriFhxSG6J89xbuPocClA18+PSz2gdKkpJ7LjLk8F
         arUzIeNPh8grdUP7YoJtNQU+eJz0S7W7zO4h5A6fD0JqlmgS1wmYtawpMJfGh/H3XADJ
         PXx79SCxJtj7yuWcL8c3r6ItZzthhKwuTqkc2AaI0fC39Y4/1kiB8+ZIeqwQ3jCJKnpB
         ZoWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774364871; x=1774969671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BskBfui7rapELmoLhcbRuH9sFyg4/N10zalNMto/sCg=;
        b=PhE2htIXEQo5bYFb7KluljetQMoLlA9n2RRoXwzblUDzswJ8bFRC6AM5DRa+GExEBN
         FZGpT0eVO+zwKmDBhjlBIH5iZc6Jbb4aGj+Rm40RMZ5qOlrDF+nEJ4+hkxlUhCT2xYZG
         67EJ4PzVn1dA/LNeZr73nxAkCCp4C1SiD5w29nFBlv8bZI2ZGHEUdjGdZzygTOR4Prpx
         09ESScw+O9kLOAdlDMApNQWbRFOXjzOBQQteLYK3DMmvaN1vEh7qejhC1P1QvjIGg8bf
         LO4zH2XZV/QtPOEBc0k+CTr3Te3THej35F3tYmzoP0O5O+sQbP9ywiMg+bCB8bJ4kEvi
         tpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364871; x=1774969671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BskBfui7rapELmoLhcbRuH9sFyg4/N10zalNMto/sCg=;
        b=n12LHCxDFXgbLc9x7We1tFLRYpHtDGYsVs9UDaRk42J5967yBqDpwgFXjew1g4vYkC
         cHYsgRK10sindwm0GXG/AjOMXafANHTrgRy5QrEutyHyQFvU3lcFDYb/0Mupz+w5ky9d
         6ic9dlr6G7S3Z2M+jwFDimUP4PLMxnocRLAtxtV90Iyv2xWiO2gXOahVaOpBxYlCTgT7
         i2P82Itkytq/ZSrexul0WDnbgKFtk39OXTEMryl1+dv9CN3dez4G9rPAcHdllr7KNSZ7
         y66SCGAhx1DunCI+Wndoanou4QgwHwHn7LfDM0ZniY4EZRtZc+zupfB+KJ/m2HD5HsWk
         jK6g==
X-Forwarded-Encrypted: i=1; AJvYcCW5gTJ537I9coa/fWJmO+PGbbJmQ9MfOmMGAS5wW6U740IDLppOta9owNBQRbFLCtYphrPr/GYrdCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywF1NdCZY+khMUZcgjEb34/eIW3yIOytO1D5u4QZQXLJ2de6OL
	Tc/9ynoqlWV6VCCyA/m/t5AK1lOK66O5e6HS8/5NCpE+jBb/DsVrZ7sG5PrCYor2+L3niOnH9W3
	ysoszW2VDta8EiyTpUa0hUfM9ecY11aU=
X-Gm-Gg: ATEYQzwt7Kp/DPPmWw1xGDER1mvB/nNgKrOPyLdE0EDZ+3MAWHXLSwDPKt6l1m496P5
	+A5xmbHje+5jZLPRYP/N59f2V726hIO+t2hepQFAzc/0dP3vK81Mnu45pjh5zyKMcciv+9MfAz4
	Qafvb9YAcMs8Fya7LnrfvdC6ZCyUO0Udkm35Kssi+Lo/Btd/YQ26sQfAmWJmTfMjpfRfGLWNXaF
	yiZE/PqmwO0CWwB63eB/pbloquuMx9BfOI7BolqA8dH21dhiyI99ywZixr09sJxJjNNhsYD6PGt
	9VglJD+JZyrt6jDaup2u+V/LKLKQE5CyoSqX9L04Kt0fqUh2qOCMdMXpT8A/axUWGvaZ3AdGDWQ
	LUUM0YJgBr5fIFoF2pekBXBwtoA==
X-Received: by 2002:a05:600c:8489:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-48715fc384dmr1835815e9.4.1774364871041; Tue, 24 Mar 2026
 08:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164858.1939248-1-sashal@kernel.org> <20260323164858.1939248-3-sashal@kernel.org>
In-Reply-To: <20260323164858.1939248-3-sashal@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:07:39 -0700
X-Gm-Features: AQROBzBqtCVnV-aokcS_jfx2Rq64gl7691VsnwgJMvcALBoTl8K4Z3ivzRJzHjM
Message-ID: <CAADnVQ+oBm7Gj3KScFujGwVKc5d2sqcK3MWX5K6dTAjekYitSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kallsyms: add BTF-based deep parameter rendering in
 oops dumps
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Alexei Starovoitov <ast@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Gow <davidgow@google.com>, Kees Cook <kees@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Juergen Gross <jgross@suse.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-modules@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> +static const char *extract_struct_name(const char *type_str, bool *is_un=
ion,
> +                                      char *name_buf, size_t bufsz)
> +{
> +       const char *p, *end;
> +
> +       *is_union =3D false;
> +
> +       /* Must end with " *" to be a pointer */
> +       end =3D type_str + strlen(type_str);
> +       if (end - type_str < 3 || end[-1] !=3D '*' || end[-2] !=3D ' ')
> +               return NULL;
> +
> +       if (!strncmp(type_str, "struct ", 7)) {
> +               p =3D type_str + 7;
> +       } else if (!strncmp(type_str, "union ", 6)) {
> +               p =3D type_str + 6;
> +               *is_union =3D true;
> +       } else {
> +               return NULL;
> +       }
> +
> +       /* Copy name up to the " *" */
> +       {
> +               size_t len =3D (end - 2) - p;
> +
> +               if (len =3D=3D 0 || len >=3D bufsz)
> +                       return NULL;
> +               memcpy(name_buf, p, len);
> +               name_buf[len] =3D '\0';
> +       }
> +
> +       return name_buf;


Nack. This is just awful.
You didn't even bother to reformat what claude spat out.
Which means you didn't think it through.
It prints something that looks plausible
which is the opposite of what kernel crash dump should be.
crash output should be accurate and not a guess work.
