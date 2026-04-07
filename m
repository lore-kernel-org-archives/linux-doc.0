Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE393822B3
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775604479; cv=pass; b=V+DHXZ6/jrNE73O4Da7LE9K1HevFa3KpwX7goNQdH28loyqloLLdCWuhH24Msc+G4NqBfoa2mP5UCH6cE0C8tLIvesOANxNdOErsTBHfoEnpq44M1+NfVQrpyRpBT1bDZpdltRjxyDSsNqoMl2EhZZvXW2Pk2tBOkIM+MdIAaYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775604479; c=relaxed/simple;
	bh=HbnetPts9zzI5j/EfgcrPgVFzL9OQ52ypHZ1fkR/qyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egjU36CQfCM8b/wDjoIY+uawM8LNOGJ9w1RiPAgAlFTJNrgh7hclCAUvpQ2XfHKhSOwR7VifV9Ggz57QjBJ4oa5knobwha9FfMm9QRTWfnw9pLrDkNig1MlYSuZ1Bn0JrEO/K8UEdqP+hg/vFcDioG34vklghlHSxgGEBD62SBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4DGUQhl; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4DGUQhl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so4626a12.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 16:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775604477; cv=none;
        d=google.com; s=arc-20240605;
        b=Cb7qKVEZb2k/5BFFnx7kfU6nx16qs26aCQVxvnBd9OJz5UVOSOMtH60K+NYHpTzPZv
         4rqPC18AjcG/3ml1BqjE3NCwFRJvKIkcfVVoNfI9w+3+2v+KyuODb2fPE3S5AUnjhcEd
         mKlycdza4ZmJ4dR0AwJFSI5JXiYQ6gZlPrgQhoGtf5a20kuWbrhA+x1CLLMV6VpILIzr
         /mbanmb26/kHxGIlf0aZZNEcwLLk8yTe9S6eiAA815ebO0K1D4rs9Y1MGBSIA3a0kDOl
         j6AMa7T8sxelQzqXcao/xIbO1yOvRKe2uNa+tJSupdnZ5WyqSRf7t5+4X/DBCRRrZtQw
         IZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HbnetPts9zzI5j/EfgcrPgVFzL9OQ52ypHZ1fkR/qyc=;
        fh=UqjpYJVUTnhhD7zeWUpOWX61bZ8aU2fsA4c+x/p1QmQ=;
        b=P01cLjZK0nktHHJviVjy8y2DG1thMMbd8U39FDMRQ+Qz66Z0l6ccvLHwGe4VXO5ygk
         0US0MV8fSNMZmwlDIlbELMK3WR7aOFxHSNoUZmaL1O1Jk1oBH//TrvV4gOgO89wFsfFs
         Xzss+iKTed7HzxWqerlE9ZxIC3hnVQelxGXHV2KWKOfKdx7E9WJkR8AMHNeHpqPQ3gpu
         Jw+0PRwW8BbBaw+/fQLpbPZv30YITSxZAMBrRFSLzxlSYfmnvrXx1zx8p2stn05m4Jst
         LohQhScqxXtixY1uM6GE2Nisk9mwLn3QlDDJKaYBwvlJVR6QsT1EEdYt7rJLmOX/y+1D
         suPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775604477; x=1776209277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbnetPts9zzI5j/EfgcrPgVFzL9OQ52ypHZ1fkR/qyc=;
        b=o4DGUQhl324AQHf3NZyWq698l82y3qvXGiEoliiKvgS7bvqcahckh60klXj1Uc0F1V
         x1SIiZRBfhI+WzVmwmn3C4g+XblT6oq4ljrBEvTjC7FGJ2L69LZgvP1/vRkisoqQLtas
         Sf5ZgP5OFSxrACKZi2tli0kYjmj3EweP9buEhG+9jzYAE3ErF5YzqJw/umbxCnzab1ZC
         TB8O1GOtR0QZRWmcmE0C+/FYW2n6lgeDZB15cry3QZZ6z3nw9d1aLElE0qCPwY36MyEM
         du16YI6Tm2nzVaDjlftrtJM0zGybJkwFW+01vPN8lZOuOXkhHmUA5qrzgEmg4Dme4EkS
         CWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775604477; x=1776209277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbnetPts9zzI5j/EfgcrPgVFzL9OQ52ypHZ1fkR/qyc=;
        b=bGYLel7Y6YEYJI0fh7zs1eavlH7UomyFZoAXh+BaYMGn1txXRrJR9BfjKsYgoe4Hy6
         b8qKOpk4Mupfq3w4zQqhFw06uK6UzqQMU87x9Yv0N3IyNt1yb7E49zrq9iNwSRxlYDxe
         xA7lNrbnYF5nKm2ITJ/FI38JLr6o+DpKQ9I5AdnjQVrQuAWDBZnmUUalHAQiyDckxDCB
         h3iOvLitkVGKyHOQLvufHnzXjAfbhpbA8nd8L9mA/G8uuWHSfCDCbIhiHDLjNqjD5sCn
         H1pYqbI6yhS8cMz+/Js3hBU9XxtglKMp0n+wXVHMyRneRNy3z4MhPskKfIh+qmUWLa2p
         YF5w==
X-Forwarded-Encrypted: i=1; AJvYcCW/iYEUssc/i2LGPdLAcdDBnw5b/p670H9QywSXdsw4dSGyf4T5hTTXk+Wd1za0iY2NKcp7NpnXS6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxedbu9wpM1WQW+d00gRNxUVdbZ6v8GxQMJ1VjmHFolHnIjlnd
	Fj7j13lqftfCaLRwSM22bTscGebbyYFOoOT1rTncli9uq0pcQYYifpYasxfUL7yZcxWA2WDXCDE
	jrI3PpwDJka3pq5zmad90Wcnr01PQ1E6qFvNJ7POt
X-Gm-Gg: AeBDievSJohSeDJg00ll7AyP0xPqkAD2vujL0OLecD802pIaU65UZhT6OP8Y7k6Ltq0
	AH1Pj3PszgWLfqlvE3/gblfx3VkgE4gS+9YQ9DlxXH51ZallysfRLAMu/TDS9ZQrHqt1Gu7n5Vh
	Hj9LLWuke2qzlp3AhBQL1hYc4l3wj5vXBTwxN9xeiHdFCDfNCfhdBpYdVeUimWu01655Me00fFo
	21Aq+w99g9zfK9gZ/gCeVoP1QpX0yRlcRkXO6Lmw1bhn07tgN3T5RmJuwGbZXou7eL72s6nf4T+
	rsOSlg4=
X-Received: by 2002:a05:6402:5192:b0:66b:b6d8:c0f7 with SMTP id
 4fb4d7f45d1cf-66f9e8a747amr11450a12.0.1775604476364; Tue, 07 Apr 2026
 16:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404002149.wtayv6a64vzuppgp@desk> <CALMp9eSqgL5q-MY1xpjqR5oRn5_cb=mfEhNFWusNneS=Mx8UMg@mail.gmail.com>
 <20260404034954.t7iapenzvhdpagxp@desk> <CALMp9eR70eE2U63gzNzTiic0PqJVGv3CBBuVUOVbi3nqbWKZkQ@mail.gmail.com>
 <20260407163943.y6tkh26z2rfktn3y@desk> <CALMp9eTA3cXxuOT4dq=6y1hx52gPH1ywwTEmPQ5-fA-vz6r3VQ@mail.gmail.com>
 <20260407171151.2gf2idjbmph35ypb@desk> <CALMp9eRNVGFpzk_-ajQTuXadMtoY9H-ndUaz78wTT1zDYbTrPQ@mail.gmail.com>
 <20260407191128.b2hr2ttkdpyunhrr@desk> <CALMp9eTK0o7Z7-oTB8ohvmoh-vy-Y2qjdUvbqD6HaEhOEPZmhw@mail.gmail.com>
 <20260407222738.lrartp6evfp7yhti@desk>
In-Reply-To: <20260407222738.lrartp6evfp7yhti@desk>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 16:27:43 -0700
X-Gm-Features: AQROBzBBo6GfpOq19SORVT29fsvEw6HsoB1rD-rISQykjQ6bs3K88dpb-buaNTY
Message-ID: <CALMp9eQjSqwnvJz4JVzYpMkkTiucSJtW48zC4Hj9GBiUhOH-Eg@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] x86/bhi: Make clear_bhb_loop() effective on
 newer CPUs
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Laight <david.laight.linux@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Asit Mallick <asit.k.mallick@intel.com>, Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 3:27=E2=80=AFPM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> On Tue, Apr 07, 2026 at 01:53:24PM -0700, Jim Mattson wrote:
> > On Tue, Apr 7, 2026 at 12:11=E2=80=AFPM Pawan Gupta
> > <pawan.kumar.gupta@linux.intel.com> wrote:
> > >
> > > On Tue, Apr 07, 2026 at 11:40:57AM -0700, Jim Mattson wrote:
> > > > My proposal is as follows:
> > > >
> > > > 1. The (advanced) hypervisor can advertise to the guest (via CPUID =
bit
> > > > or MSR bit) that the short BHB clearing sequence is adequate. This =
may
> > > > mean either that the VM will only be hosted on pre-Alder Lake hardw=
are
> > > > or that the hypervisor will set BHI_DIS_S behind the back of the
> > > > guest. Presumably, this bit would not be reported if BHI_CTRL is
> > > > advertised to the guest.
> > > > 2. If the guest sees this bit, then it can use the short sequence. =
If
> > > > it doesn't see this bit, it must use the long sequence.
> > >
> > > Thats a good middle ground. Let me check with folks internally what t=
hey
> > > think about defining a new software-only bit.
> > >
> > > Third case, for a guest that doesn't want BHI_DIS_S, userspace should=
 be
> > > allowed to override setting BHI_DIS_S. Then this proposed bit can ind=
icate
> > > that long sequence is required.
> >
> > That case can be handled by the paravirtual mitigation MSRs, right?
>
> Yes. But, that was the part that received the most pushback.

What is your proposed BHI_DIS_S override mechanism, then?
