Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176E43C04D
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584880; cv=pass; b=pHygxdQZdopnDomigoVOfcv+rIPjZfyZbrnHU+UB8bfVl2kR7wIGgcPfloM9zMNZLYlJk2dldSawNAJWmdfPacXf3NU0tHhBb90Dmzv2myHYWF9kMjbMKnK0hmwzikYMGh/GjFdqJEWjqA78CIViikpiyO6QyhQq/wDy31WUzbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584880; c=relaxed/simple;
	bh=j/7Pu0goIzrDPISYd7UGXNeACZWMCvQbsT7AmxUh2RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFxs8P8tMrMlyZx51d4n9ujOGKE1x5uCI1bP9AEbPfLVH7rJGdSog/FdGE6tmi04OJOVooMsHAeoIe8SZZQHC1MRzobImHO5K9mpnlEWBXwlghPmQSsK2XnTuzIz7cMHHW3jRTcxrE8cZOkMcXIX6OLChV4Bmil69bCKHxIzViM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMey3lva; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMey3lva"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so12016605a12.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584875; cv=none;
        d=google.com; s=arc-20260327;
        b=Kd+WsWDWZ/JcFtBkS1dtLKI4m49yP/KhhGiBWyLbJFDDi5GkS/OhIRGbDL7TY91wwZ
         FprnTRK4VyWqCFMunGmynFCkSUKx8X9r4QU6ItKCbYYwXcFJ/q5LGo/tAQxhhxh+2x3C
         g3hQcwenWifd98E1S+MzLDqu9yPlwx/OjE5sDYAYHAd6RawqCptt1ziXbHopnkwbxwQj
         6a/KCXiMHhmB0aF1cAKGmuvyd2pWhghvqShZy2T9QVeEJY8sb2H+Fivri1Bh3dxzmV15
         MY/hPT65n+5rBVcwrI7m5lc5HHT7UjxKJrHx+KZR/7IrIquOTRvtditELDUyv+pS4KX1
         pAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        fh=GX7JmCSOJE88s7CRlv9Wqa2gXUQOgbtf0JVklZItvHo=;
        b=Bz90O3Js42bleVnzDvnV+fsYNYbT15AnsTwBpPTjgy25LKimR763qdevlHlCJN9AJJ
         u0SQ3euq3OPp6PsdFqZ6OSCahIaX/LhEC22bqP8HT9W2PBy4KQuMVkpuLlbjFDrJkWyb
         sxUQ31yKqrYN7cctylGLAP97J1aM032EGWnQ0MDw09T58bCzC1sh5R1BP6orxZK61YVx
         R6Uj0DBUWFPDinnv6XE7nkCZ9PLuITLFxqXNslX5EADoH4g2jO4kS6pSPeCI+nRli2EA
         CNZM68+PEbEZpGGBmiq+CuMscdyeStJE+87cHtx/Q8nfMmuT3lFpbshS9PmHU4ZAGUKZ
         hcVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784584875; x=1785189675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=ZMey3lvahqP+YPW9LamnWQzczRxQiZ4wg9gw2Nu7P3y1v17JUAuMM/AR3JTiQFFKU8
         d9noasqw2G++q5S+mCeWeywDA5kpg8MuVxJjECyua9/y3jlOjzMIOYlRYZqO13STHgxR
         WQ87V1/rMYJN18KwPy7Kt1f4oO1hp7OTlSg/lmBFsB1gkADDpu+GAYd81uYxtDWFgDYj
         g7E/fCVHIhWUawA3wQ30Wot0eYDovRLDP5gkADBspVyzhS4siR8fFKxsvW3/xg6aPXXq
         4tTUNL4YjCh2lps4QkQgZ6MAQbSDaAHnlH759VBDRh1kPBksK3QYu64fJW2a6dhpi8jy
         qpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584875; x=1785189675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=BR2B9xwOi8bYQeMAQ1Y01ARwJr4PWnkv2RJNTpey+lNXsj70gwXD+meJLjIu0TxVb2
         qdHpsopbf2jPiPhOlphWnsVKWZsPtlLw3L5LKIF6SfTD3g/FumQWxfVpoWO8gp7C1rf0
         OM/YsIOH6sQL7rru2qPwtsEUcI8wMopkqG6PkmsqSXe9N4Idn7bDtTDTp2UqzB8i61OY
         nbPXSlfkYcwXbd8UsML+ztCmMVAy/h6LGllcwZlJlpVmEPxn4geHCO7dJC5YLqeekY53
         Co2w8pZD98G6Zd3QMs7FqcvN160gxzgu/t8ZFngrmGDs1dUtg6ea6VEBIfoujou31ukA
         aP3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq9UmeKMLcGsPfUlHewqc0rGQSPoz6mU3WZ+8YFVT1ePt07RjPFfVm5y1MELFmuF4S6TZ/gQxvtL1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRCGA9j16PFd7H/oFToeX2ORKErIfXMwl4jKu0tY2R1huyvKhU
	Iv/xDd9P2Bt6qwa976AdnKeDMHemImimtaNF4aivQkWqig0pmqR6jzGiHz+cDH+CDXoLfbWkINc
	cKhavjr+Fp+E+gmE1YLENB3Ug5vFcM60=
X-Gm-Gg: AR+sD11LvPZb/OblFM15HUgSJkqt5C9xI9fV5ZZvwRbs+0/zQbpNVnGNODNEvtrv973
	QWXswG6ATqMXJNbBPG0QNHlGOVyLT2np8J/jsmJUJN/A3Nm3V2fDVsKDe7WTnkLmKTsUxtXbseh
	v0YG2OxQeSbnq9rH32PI8pDJV8k52JZhldtQzVpbmvUt4UfIQrrXME+ryG4BtCz5agyT3XIqqlv
	lGlto7B8ZCfkPEt/nlwdauF9GbBohMSLsKbTr1lLLgpxsYk7j6waKKDlKY0XAnLoT3+BAJez4no
	GY35D/qd6aT/Rgix0kATl6gBalgMIw0=
X-Received: by 2002:a05:6402:2356:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-69e6525c770mr6536246a12.3.1784584875096; Mon, 20 Jul 2026
 15:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
 <87wluplb6k.ffs@fw13>
In-Reply-To: <87wluplb6k.ffs@fw13>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Jul 2026 00:01:03 +0200
X-Gm-Features: AUfX_mw5696pn_wiz_LjCaJHiFU9IchwhNNUbBWmuIdhtqSFIK3TJnj9-atYCBw
Message-ID: <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

On Mon, Jul 20, 2026 at 9:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
>
> Similar to what Peter and me suggested in the related discussion
> vs. s390 which has a similar issue, you can just have a dedicated
> syscall_return member in your pt_regs struct, which is preset to -ENOSYS
> and operate on that. You have an unused padding entry there which means
> it won't even change the size.
>

Thanks, that makes sense in principle.

One complication is that my Alpha GENERIC_ENTRY branch already reuses that
former pt_regs padding slot, while keeping the pt_regs size and stack
alignment unchanged. The extra syscall-entry bookkeeping I needed so far li=
ves
in thread_info rather than adding more fields to pt_regs.

So the padding slot is not free in my current branch. I can still look at
whether a dedicated syscall_return scratch value would be cleaner, but the
tested version currently handles this by setting the default -ENOSYS result
only on the no-dispatch path, after generic entry processing, and only if
ptrace/seccomp/BPF did not already provide a return value.

>
> You were on CC for the V2, no?
>

Sorry, I must have missed that.

> The whole pile including Jinjie's seccomp bypass fix is in
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
>
> and is targeted for the 7.3 merge window.
>

Great!

> If you want to base your stuff on that for 7.3, I can add a tag which
> makes it immutable so it can be pulled into the alpha tree.
>

Yes, please. There is still some ongoing testing/review of my Alpha
GENERIC_ENTRY series, but assuming it is ready in time for the 7.3 merge
window, an immutable tag would be very helpful.

Magnus
