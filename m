Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EAA3B1EEE
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511884; cv=pass; b=i1rqP0ImZGXMjdcwW49D6Oj+8k21/UjNz55NoAJjMz32ZAPCFRnCEkbb0EbGbJA1rAoMzuq1ZdMU9MdbzuCiqWeKs8yYM+N0xuOZo6nseUGiGjDDPL+cyHc+EgpmFrRUy94w+EAnb3NiWpil6dvuyjyl6p36oQad1Oz3aY4NeYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511884; c=relaxed/simple;
	bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlXCibOlLfJvy/A/O+olzbUZfpcW5KKROHzYZLlCsA1zLoBUYPDp0iKkCpv1z0enbI4LWk8cB1snxpBgrG0dKf1khSD6VSrGQpronrqL1Xpf37MD3B7qMq4pjbTAcRhUHeSJIXUI8b/Y1js8v7EUGHQDnLDxMtY+y5g5j59PY0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsDTFALD; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsDTFALD"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66d116f0de8so641357d50.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 01:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511882; cv=none;
        d=google.com; s=arc-20260327;
        b=gsPqBBBdwGD0XmE1zMI8iiFzmWBQd8ZXSX36ZBZDkdw6H67l6RPNUAW4SqXPN/6KkQ
         wbBPmchRAHipLu2UCZjrPYOp/FQ0iBLTMm9SjpSSwerCTENaFJakORVH5R+Po5PJYDVt
         KHaZyXL0gBJwymF6o1TGQ6Pu5BGVKyR5lJjLUArrK6rcoB6Bpi2qxQ/AE6ouZVTQEEaf
         39As/cXckVQ93pFuazyS1JR8ShhDKETVEMVI/YAcU+ck7XMEnCZbHMGfNq9exYAZibd0
         mq8asYHKBZ9/wjdRhF3IizkTkwUR+Lde8OhiUL1wElYM1StolywvxtdFXdLWRzYoAIHr
         DyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        fh=V0vhq+6v1B7+s4WGB6NjPJXlk3lP1tKEH0T65N5ahAE=;
        b=YaYyAv9Sy7676ybl9ExUVITrrn26V2dyY7AtmO6ZhDWAVUP4vlerTMU9sn8tOmBuRp
         dNX4t3QOGavQch37KXYkjrzFe1gxFcHFalg+kbw+w6XRWcPIGtKSNgaZobHuCEJHzFF6
         suGIYPwaOoZZM+vj041ZWXKVaB9fd3mHdaWJ0vDWLKKYWzjDRONWhzxIdmDTKFY5/sMG
         teQ4anVG9Beqi3H3kn/3GUY9TgbOXkaopFKdM1RCjXOLNRRzpY7SfRne8lycMfXH0p6S
         U8k3AiPuXF7t7iOuMH4KG46BDlgHdM2BGs0Si48hPEMzpcQyWUxDQDbjFki1r7bLVzYD
         3T4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511882; x=1789116682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        b=TsDTFALDw4vsg1GN3g+UztVq9bUfuAKY8SIzq703SuedfYigVlMSf6jeA7JQqnvzo6
         H+bdIZiYYT2Id0IFRDBzF/pSegUpkX04c+5X/MDwrFyoNXITvDHTLSrW8BHC+m+KsTlh
         zyhiLtSj0nxFg/pCbyTDpM19NkKthyd2RAUgxwJ+4Bn8Q4cbn/9BlnxDwHjEWADhCtes
         V7MilISWIICAkfPebCopcNudegdQLPQg/C0wmTUwg9kYGcEuRq2m9nCL1uSYkLAMXp/N
         7hnYtLDQ/9EAXev+7dGUqNFxr0t81siXFKzxiiwpRat81kwxvqT1JpGLX/MXFOcCE7xL
         TSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511882; x=1789116682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        b=BY7w+opobK6uKT0x06sS/vL/8tBRX49Ax9XfyXdbfhvfufx5rRIs2xXAEL15IUX3Ge
         1TGk/siAeGbW+QbGQKSsdUa1ikrl9f8kOYw0jPYvw0kP5RsmzEano6bGRT0ISt4xgtEG
         pYoOyn67PJwrINNnm3Zsctbq4R+DCJJfkPPY5i03i4opqVJiGISlJ7EANDfr59CmilS1
         rEupeRA8sln+bwq4IJK+1g0GeaaGgXwi1V0WMC1NWF10l0FHgDivIQgwQxVvMZZ6UGf4
         mERupZupd00Yglzwv3wqt59VRrjZt9Gi+TAOG1ME4MyA0msGPOQeah1M2ipip/T6p1ZP
         tGiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbMC84LPsnfTzMMEDiU3HYJcSFSPf4g2VrvPUE11WT/VubSIuAXkZ3bXnQEul922/KCiz7m02t/aY=@vger.kernel.org
X-Gm-Message-State: AFuF++l39pxv9M4JpNrtkC6QgF/67MoC9Supn5GdArBgA5VqzPfiula8
	hTAed/pALwUT8IsP0Do5GXSszqV5Pp1jH5FRRdOvHiXOG4K6TbstE/2hn8/avs4FljO4L26S0FL
	wlJrQ44agvESD2F+o4rU+MDQlleH4wWo=
X-Gm-Gg: AYBFou2wj/NXNSomj9n6OCz8P4c9FOGx23vfqKZ9CPskliDZwk0INA2jz98FrlIZDBf
	vfGaFw8MTsq1Bv7C+EBqzxi+LMALX+S+X1gkLN7Aw4zF2k9GyDb9qyovxs7He9UhUyRRzJuIwJ8
	ygO8sHTrwnOU5oQ6N4vWBy0DGUka74y0VVfhIrHt1xi0zHU6kxTgy4E7t9xRjt/IGgsJjvPdLvW
	Bceo1U0cXungrv1KXKKq3KzPjHtIiCNOSLZ/KrlE2v6CpySeJZNZGjMuvBsTQ8NwiVdorGwG0IM
	YgNeKzkOHlAJtauRiXbXkcX4zSAVYA8BEjwXieBZppQfVc4zWwC+JT6RyCckXMZYzYatBK2ZBIb
	2wTMNF1Puh93TDEyRWQocAHMT
X-Received: by 2002:a05:690e:e25:b0:66d:2c09:fb70 with SMTP id
 956f58d0204a3-66fb575c665mr1287497d50.0.1788511882074; Fri, 04 Sep 2026
 01:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082954.48738-1-enelsonmoore@gmail.com>
In-Reply-To: <20260904082954.48738-1-enelsonmoore@gmail.com>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Fri, 4 Sep 2026 09:51:10 +0100
X-Gm-Features: AcwNN1US813RpOVK53IyVszIyhGZqjM2-hVqjP58I9fP7PqngduJcqRbNBYYNbU
Message-ID: <CAK+_RL=RHfRLDc=Ldjx1p8KTHSKeELjnBpxEqYjwWX_8ur1hOw@mail.gmail.com>
Subject: Re: [PATCH] bfs: remove the filesystem
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jan Kara <jack@suse.cz>, Jakub Kicinski <kuba@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hisam Mehboob <hisamshar@gmail.com>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Howells <dhowells@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"Theodore Ts'o" <tytso@mit.edu>, Catalin Iacob <iacobcatalin@gmail.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andrei Vagin <avagin@gmail.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Bhavik Sachdev <b.sachdev1904@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Wang Yan <wangyan01@kylinos.cn>, 
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Malaya Kumar Rout <malayarout91@gmail.com>, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Hi Ethan,

On Fri, 4 Sept 2026 at 09:30, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
>
> BFS (not to be confused with BeFS, the BeOS filesystem) is the
> filesystem UnixWare uses for its boot partition. It has extremely
> limited functionality, only supporting contiguous files and no
> subdirectories. Even though the bfs driver is very small and is
> unlikely to cause future maintenance problems, given that the only type
> of data stored on such a partition is likely to be kernels and
> bootloader settings, there is very little reason anyone would want to
> access it from Linux. Other old Unix filesystems (efs, freevxfs) have
> been removed recently, and bfs is highly unlikely to have any users, so
> remove it as well. Retain the UAPI header to be safe.
>

You are right that probably no one would want to use BFS for storing
the actual data today.
But some things have didactical value, rather than mere pragmatic
usage. It is the didactic
value of MINIX (and its limitations wrt making use of the wonderful
capabilities of i386) that
has originally triggered the creation of Linux. But back to BFS: it is
actually used in Steve Pate's
book "Linux Filesystems" (2024, unfinished yet), which is a sequel to
his excellent classic
"UNIX Filesystems" (2003), as an illustration of a particularly simple
filesystem implementation.

I remember when Linus accepted my patch with BFS on 28 October 1999
into 2.3.25 his comment
was: "this appears to be a particularly simple one".

Kind regards,
Tigran
