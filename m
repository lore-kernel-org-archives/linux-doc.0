Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F2200C96
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181098; cv=none; b=XLhw8a2RieWfww/b0iuN2XcYZqH3AAQubPYgd/GmTMwmgj1RcIz0sxAdmTNddnt1kaqHqEIKAp8FPHu89rZsraJOwI6O6iHm+mdHkEkgrm+TV+yA2CYT88B1BYSBvYPin2RUL4G0aLoT0RUwPlYlBSj4WizKlbWnDbhjxVczEj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181098; c=relaxed/simple;
	bh=rkJGzaJiGDNyDHmrzD6Ukn0kvrLRqUNFw7rsJbF66DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbUyWXwQHGQzbdTAXXTD5iyV5y5Smi1G4J8n5FPooxeK+P4C7fbYDKOTAOiTlb4httOZSgBCre/e+syOizFnonjT/it1Ogrg2sTEEQ6881VT1fRXzlaRDQDWkKCZl6KTqvcRFHCwnP7dDplrqn1STVUaZMegt/x5c3veFs+dD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O4MXc1dw; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O4MXc1dw"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-460969c49f2so146871cf.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730181095; x=1730785895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS+AWBnCO/J18Xc6TcuxqR5XEdAGr/Rpio3YV4nA0AE=;
        b=O4MXc1dwxcgbsQWGK53emGves46j/aC/NBO5mU8uxHNFbMgm99YV1mCvYt9FMmNEza
         Nrd0l09XgIndpa3N3+rrO40GWHE8PMH7DSRn3APfxUKc4+e+mpNPr5krVYfDQMYaBz23
         nH1KKMPj/U8SaZ35spcPGvPCabb5tlab7e/+5XDtZbEyF3Vt2zbgaTjPJRaLBEgdjAW8
         aOkTwCEQ+Zcgy00U/n839uEzdgcCnE5gwi3sacJIgOnnSCbV2+TP+4lRbRS1z4BLEBFu
         y1KDxn2N4Xlmsy+XhzHUd8ZpFcdvQNNezNsYWFO3DJcGqSuqYguNEDUe50pXcQrHwjMI
         zJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730181095; x=1730785895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS+AWBnCO/J18Xc6TcuxqR5XEdAGr/Rpio3YV4nA0AE=;
        b=jJU6OJbBnY6NtLBl606Ad19SQAaFr3LFebPZiVTZZ8sQaOKBCERgTAQDAzosBgPI42
         +N+7+2GG7gWEviDf1c5VXR/qg1dFlX792qZn8u01joK3ukVZXo6wYom/W/y27KPsw4du
         NFqZA5TX22ktiqakPCpAjB+0k860CLxgCv57CkgfyY2ZnZ8BHzNikn1Xs1p78RS1Ttd5
         fSFqE/JRCh04z0s3/PHm9pBciCbs2TKHcOJ0/OP1NpZMSM2fcTe6IgcYCYA4V91Ow1zj
         3oksimHm5oLwGKwr6tTaoCDN0I8T7egS2nPF0/+s5NbMNz54EV71bSR3sfD0Hvc+HQfN
         rIYA==
X-Forwarded-Encrypted: i=1; AJvYcCWOxKgu32fHnTKjdyrQwAXO3Adk2b+3musSuDnfMWYsv8c3Gli+RObbMpoO4r8VvbM76lAkSalN/bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSZb+qQvAMUpNzm7m/cJUDYtJStnVrHyoxqTdH3oNceGXzUCo
	Sa5aO/0uq+jQEvMyDhFVSvs+iSQ4DqzUHEZP7vqsAJhhQxDG2QBBJhur5KLr2muGKVLj0kY999R
	y5a9NwVUyPAGG8zAxuThA0cQFJZhC6yATG82y
X-Gm-Gg: ASbGnctKRZys5j0Xnbhg4TnNN5coC0eJryCb3zT3Z2qOWKlXL/pvFB2XCQCYQ1Ys7tB
	2GG3AuFbjpyf7kwRUt+/Z0hcdQHEkMNSBUlscPNk7EO8SKJnfwIxuCubBEC4=
X-Google-Smtp-Source: AGHT+IEVAXdFG3fNtFOsbcJBNRZwq6dZ7NPHf4Fl17QtrnIba/Ad0eOq8gq9bIFuScwN6QgnbyAorRomVIE9wKpqH3w=
X-Received: by 2002:a05:622a:38b:b0:45f:6f3:5671 with SMTP id
 d75a77b69052e-46164fa2de0mr2424301cf.20.1730181094473; Mon, 28 Oct 2024
 22:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-3-xur@google.com>
 <202410281716.0C8F383@keescook> <0605fa9c-0e48-48ec-b04d-c2ef1c48fdd9@zytor.com>
In-Reply-To: <0605fa9c-0e48-48ec-b04d-c2ef1c48fdd9@zytor.com>
From: Rong Xu <xur@google.com>
Date: Mon, 28 Oct 2024 22:51:21 -0700
Message-ID: <CAF1bQ=QDQ+ACsH2CchnRk2LDRpN_WYjJOAjr9FDspxiar+YbrQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] objtool: Fix unreachable instruction warnings for
 weak functions
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the objtool works on individual object files (or vmlinux.o).
The -Wl,--gc-sections flag, on the other hand, is a linker flag that
acts on the final link -- it's applied after objtool invocations.
Therefore, even with -Wl,--gc-sections, we'll still encounter those
spurious warnings from objtool.

-Rong

On Mon, Oct 28, 2024 at 5:19=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 10/28/24 17:16, Kees Cook wrote:
> > On Fri, Oct 25, 2024 at 10:14:04PM -0700, Rong Xu wrote:
> >> In the presence of both weak and strong function definitions, the
> >> linker drops the weak symbol in favor of a strong symbol, but
> >> leaves the code in place. Code in ignore_unreachable_insn() has
> >> some heuristics to suppress the warning, but it does not work when
> >> -ffunction-sections is enabled.
> >>
> >> Suppose function foo has both strong and weak definitions.
> >> Case 1: The strong definition has an annotated section name,
> >> like .init.text. Only the weak definition will be placed into
> >> .text.foo. But since the section has no symbols, there will be no
> >> "hole" in the section.
> >>
> >> Case 2: Both sections are without an annotated section name.
> >> Both will be placed into .text.foo section, but there will be only one
> >> symbol (the strong one). If the weak code is before the strong code,
> >> there is no "hole" as it fails to find the right-most symbol before
> >> the offset.
> >>
> >> The fix is to use the first node to compute the hole if hole.sym
> >> is empty. If there is no symbol in the section, the first node
> >> will be NULL, in which case, -1 is returned to skip the whole
> >> section.
> >>
> >> Co-developed-by: Han Shen <shenhan@google.com>
> >> Signed-off-by: Han Shen <shenhan@google.com>
> >
> > This seems logically correct to me, but I'd love to see review from Jos=
h
> > and/or Peter Z on this change too.
> >
> > Reviewed-by: Kees Cook <kees@kernel.org>
> >
>
> Does this happen even with -Wl,--gc-sections?
>
>         -hpa
>
