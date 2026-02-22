Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9493C322A
	for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771783794; cv=pass; b=a2QhJ192GhDgDEPe2+RmHF6uFkQXgyUGJDe+BYfegVvI4DFVIKqeEkstlcPccIgC4c79GNLZTxcPyfriTKKXVq30MXhiYkFGkhInWzSt2B0w5HBUlm7YotAzfgbnacs1uC81KUhhb0p31ctiJvp3tLRKZ8ky2g9XOXF3tuHkj2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771783794; c=relaxed/simple;
	bh=+ZLcpx0EeYCuav5+AU0HUoV7c8dGSHXUVko87H7r+g0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0jqnouNql32T+KAqZu1+kbQUW9Tlk78v025QToB4ZIGO9blqvyfQ6v2Ul2L+AZhowa6Eimmf99He7JysA/ivwPQNmeVMr+J23acDnbVbnD8amLAXfCOsKCgEB2IWNxvLAM/DKNUORijF4cldq9YAFrorzjHBi02JKC1eOfe9fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDywi67C; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDywi67C"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so32377145e9.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 10:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771783791; cv=none;
        d=google.com; s=arc-20240605;
        b=ew3XXmKANBzci0dg44uzP6WOsIIFZ82bUbM6qHdM7uC6iLa3fGQzcovX9Mc5CNkcI1
         y8HDmvQ2Gv4I67tiShKA/17RI86G0Tt6+GU2zuSQrpzSHSaj4qcORt6JvMEmBA8BUJoU
         iYY2Z1NEIfaQy9dsVZSJkf1hidNNSun81GPRy4zGfevyApZCW/Vq2c4gAxNYeniTq/eT
         LEo4I5sw0vrRpSjJl33x57zzdg89xmo7utoqQMaKfsv4Ye6LcsHt288fFXbzdLHitiDw
         jfL/b/y4e27aP4sMBE3hKoCsQXlyHMOOi4kOibrbCXooOrd5NRmgy0G0W0pyRe5WwSd7
         +low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        fh=kB4n7KdfOmb40ckpY8INeI4LxSvaVHLlr/meXEmv8Zs=;
        b=GpC2eUSIvRHSmLEg7iI45L0MAbqnQ9TQQFXVSZIrwgiR52Tyvv+HmW01Q7ZQ7HEACM
         WM14TW3cOkKD83yFEi9W7C+nupv8lIXVkVsks4Wj+747DoLsX7QuskV9Th55I7tji9pC
         LSJZhu69eapLkR/G1JUnMtRBngCPLILvv1Y2Q8tLfALFkOIpZaS4NEOlfgf8UhvxQ/R8
         EZDikkc+8DX/c0bp54e8av1g2EMj44ts/+hH6fNEZRtzlHPw8iyjWIiKA/jEJMK7hf9o
         AsExxNhXZNGYulUbQe73fBFA1G8gmLzhfrkvPdfm4xpeHR2rzhrMKOeUIWbSbBMl6dO4
         sDuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771783791; x=1772388591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        b=EDywi67CWjXEzbjOEg7m6sxY6IyWBLSrIOHjdNShfdqaAe+L9BFRsD0YTKSywZqhsA
         aH2YWbh/gzvYvFtoXNAz1rdyOBZNpkajy0nb45Y0jbahQx201H8tfPyrXOYZ7H2wJMKe
         rH8i17STFWc+U0MkUz6bzIIPeQXbfv1xZ2RID5W1YFpKKinkyqMpwVxJ5SwdRNeq6w9V
         2msgcOcWIAfQ6iUXkzVahD2eEqR+xyWr2sz3w0vUUS4aOFZXD+SUvCyL0RZahrAe2Kzi
         COZzFCOzw/rshuyP3gGpTwc/faPp+JrW7/5ETwfUujM0ZLPzEeR+Y9exd48APST33ICm
         oZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771783791; x=1772388591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        b=B2b6dyk1wX8muq1vffFlZ4o7QkLhhhyt6dGKQ7/u17ia3hPuYS/k6kgT64vC+x4A2n
         ZrBcGklvB+Co0HwIz5KB66lTeY9l3f40QTbsMSCgsxlZWw57k5sVMAcSDhgy6iNNsPMc
         NxS7gX/+wFWr0wL2a2noIn6A4q6bXP39fph1HcJY9/4cFBxep8nA/FOk8joyD2Om8asq
         7Ja/Nfnzd4Eh0Z2Iaa+VWsgJS+/6gUTrYWqxQ66x/LPxMDYj1/QS93SiHgPMbhrP4VDO
         6u7OHJvrXhex74PhZKdVQfrn+lNkABzP3MCu2IC35kBeQ5860wCtOlTlKJA/QirH7uRm
         Mvng==
X-Forwarded-Encrypted: i=1; AJvYcCVOvGrjDMz21YSnUflIziJmiz5p5q1I7rmBBKbZdH4jyZW4dORTLi9+lnQenUwott+UcqCdibSFTKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+iOe1301x2N9Ky/SFeDRA40W9MK0d82Pg/U7O3PEOHvkT6BU
	bhETKHb+DDkH7ZtuNkWsCycLOSr0VXKRCvbAAGCNPd39DQcxnDR+ySITNpRiHYh2Eqh1WvTovQo
	49oDUycxW4r1fvRRVUx2UeyXkA/d2biWmmPtSJymx
X-Gm-Gg: AZuq6aJcUBGHmpGBFBrnSkqieMYWRCt48zvaD9Vue5qIdFJyXl1ZChRbtDB8R6Vli41
	8F5bnVmqXJbVHzHW0B2Jd90bDdnAnQVpt4Hql2oX1Jsqu3hKcysk8lEG/c8TkY4KW/kx07Uwun3
	aDSqA7pH2OrWk/Nnb4PBvS4vzfbWtdnPm3M9DwpC3cCPZYTUCSMe75GsZ7piTSs6lzJx966O3vE
	0CCWKAVqFh6urYHawwTNchjVtm6EtemdOXJQx1xTu9atT9lQj/cyygIhiG14jTHzMptG/m+EEDT
	MM9IRmgoz5zdMZ+nWPJC3Q72tYmHaYg0zoKDwk2QQkMGjfw/
X-Received: by 2002:a05:600c:620c:b0:483:43d8:8d68 with SMTP id
 5b1f17b1804b1-483a95f8988mr99041605e9.28.1771783790563; Sun, 22 Feb 2026
 10:09:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
In-Reply-To: <20260210090023.2587534-3-mkchauras@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 22 Feb 2026 19:09:38 +0100
X-Gm-Features: AaiRm52Q8m3SEnrLH6jkyBDSVsN1hOKBCoLoWD_xybQBz668Fl6X4XkBu3NwbWo
Message-ID: <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:00=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> From: Link Mauve <linkmauve@linkmauve.fr>
>
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
>
> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE +=3D $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>
> +KBUILD_RUSTFLAGS +=3D --target=3Dpowerpc-unknown-linux-gnu

This needs to be a softfloat target.

Alice
