Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793136731;
	b=zpvECzZFuHhs7OzRBTjwmf++VsOqwtMDXLR2PB96DfGCVmep8d4osrUp7xiRilVV9R8i
	 p1n3plXhbqVsa4ZyPwTfgb3CP5kcLkoqZ7sr5TnM9nST+zb9D1HLuMT4VLCvtFzhEWQYd
	 W+pe0nbiOEvD+4c32Jj3jcDqDTMsbsxPN7B1rJVK1AaCuZhQsk/uZ7FShtu7bsM6AhLFN
	 eRPd9PRxMUP/+19Mf2NGSdy87yQH/7YNgt+LwzrqgOxaaHlFWMeRi0DD5yuWlCdH5Zpr7
	 cE5lFZgS9AS3j3ux4/Fvos4H7RjxEy6pYB32+35Cy220WssGtlOrbROrJngARyjuOfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
	b=VDLNdxC3kxl+11af3cCestCxmscRRttlPGzSt7Z6iN1kY7td9yJ/RPQyJyX1FDgxCxov
	 1cRR4QT+Fr/ymPF9bimhi/j292bjuDMCBG56YxcmB1KzYU4hwIdOxzZuZ3trlXhN/7Q6v
	 Ov6HQE+MeR9dJ2ZeBoFhB8Azl5ttfTf9i/wAqwlUriZ8Ke3eZAnEFjhy5XtyIDOdo10p3
	 0VkFPs9zhSls0RvAWLXMgwg/sEFFbQlMg6xbkYdbAKpad01rOgaFIFlqOQKvkV/xB3C4r
	 vI/0YjctjLCH4c9ymUzBaRU+emN8DJu1GSBH/wJSx9wqKL8uokhDVOkdTotX907VyLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S4q8x2rQ;
	arc=fail smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D132606A323
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 21:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D132606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S4q8x2rQ
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c45551fa84eso45603166b.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136730; cv=none;
        d=google.com; s=arc-20260327;
        b=jQzm/pfQgKO5UGFyt54D87ODKOUtOs/B/MChoS4CWYP3PYyoXNoW0vvX2ATC534TTL
         FQ9CkgOcX1LKwbk72kesY/C2hLWzDFI1IIXkoZH6PkruuH/4eUul9JLzmOTfyjvkKz7E
         AFshyrsTflOZQlT2e42MhHRI14PBRy5MDqJVtLcwlCvmAEEWBwDOZUdIQL9qpUeO7pC7
         kxRrq7/enReA2doSdqsVIVgkYrOisjU6Nqvt5H6x7XXeMKuoqsqQQpVN+zt/UmBvZv53
         bmqJqE4HNJI56LEagrU0xq+tQezWZFO57nQ5x5zrY9qpaTXpml/bIE/+oG3fOroHoACX
         67bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        fh=E5BEhSMRyznNL+P4nny5zJsLd+Yayq2pHbJ9o0dLx00=;
        b=Z+HdLNxlzXO99C9waBIcU8vGk/lZ+7LT/TUYO60xS8dj/9oty5z9L8wOpcLCvHDM1E
         BtR1ZwNR6bKQqDv/TVoy8dmdBg1HkLwXjkzrfWTmByUazUl721PsycxHz0NABzPRiQm/
         PEjiaQvbpJ8l7Q3pIVhGarIiAnkqogIOoco5CHMKONEGl8ho5KBfjmARiYBm1EGCOk8y
         YRJCb9MVutslfIwbM3CHBouNNmS8JOXQ8QCO/jiQJayKcCok+sTj65+RfPBxTgb2lyOT
         84FV7gC1qEMMR6EeuOg/AffGtoiM8S1j0eHfr3nxP8ycU7em6KthB9H1DrbjVCSXM5j2
         BCFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136730; x=1793741530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=S4q8x2rQcUgbgnB2taH0pkeX7W824XEztlulInCkstTN98gFWl50fOUHsLcMogIWem
         +SWWuuIF9ShMS36X+rzUjPd7KU7unYZs0GbPKlZZc+H50ZsfMxB5kFt9pJF7G8rQPafS
         Yj/Qmgt7zp+vc5tnLKCYLsenY72iRxUoBzH1XWuLuKRRylx2sc/th56B7WwrxdvuqIlj
         tisiwgUTXoSytzPTLshRseVU8MV/f68st3yxUw4yxkUyz/mWdH6jW87vSpFl3DClcaci
         WvuRRwXmAgU+OVFLKqPNuTNITzE4a/9IGHAuQqBbyFGnX3jJ2y/T3HqHGFlomaAJHMvR
         E4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136730; x=1793741530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuhHDIMVu5WYcDA1LFoQtTkJOtLD/1lu0y5o2UH4ICo=;
        b=AZpyW0EdHOklNqdHLSKPz+BXHuFCI9zVjNe9SWXtCFSt3mb1CtCwysIUIzKBN1baoc
         BZOGAwBMZamVTkSY7pEB5aPmVM4g57PcLyxNSchISQt+7pISO1zdN1nPcFYSoXrs60kR
         ldqAABeznTtW4fJ8e6fNyoj+TK4AQMsZCKkqTVPdR1zZcqWn45xWbzWwCsUQuMGl+5OX
         jDBOlXGeOObJ0C5V3nljot3d7I2NYmgM/djfdxSp5B7f9V1T7Sw1fExfnDMsJPbTBZhZ
         XkaBE/G8bTyzhEHGH/5mFDFnCPFnHlYzcOQl1XGUw2o4QbsAHQ4hy5WwQ/9APj1WYd+b
         kgyw==
X-Forwarded-Encrypted: i=1; AKwUvBxf0NZyzKCLab3fkm9093q4b7RLvOEbb740Qh0DbtWQakERnD7G3IIKU49jIOzP6B22W7GBBBgN4rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2+OZCTNzrMXTEZVnatNtyMQoacdVa9DU922SaRq0udyJevivO
	+IDY9VKHN+KM/1GQj19uF/IpC8sk67I6ty+ce1VpKddDJsM/6WK/zAYInkgvjWtnu5x0s048EiG
	93zQ7jgsaaTOJRhz0u1FfN5qGAeyjHYUMNmGZyKLi
X-Gm-Gg: AYBFou3x4+ckWZj+jsknKTEfRb/777e1W0rBdGF7mDfVFm33V1CH5qZBzbmB5IPATku
	DIU0ReUo8iwMp25u1Ddp9YEbV4h1aXBKPzLAI92yWgo+0SXRkE+rTNrm6bYUGYmyDvNAs58zs/g
	USictM5qXMasNTj/LHDL24Mttek69GaodOymvOneAfv3m59FLZe04e/Dj/nWMRDn7TJ/XgqWPZG
	AE2G+I+C/7gN1hALC3In/fMTfz992WIiq+jo6GtMgupop7UvRbY3NONznYpeLloedEIwzxnXjoO
	RgBuVXTzpHT87roaedosk+j1oVNV/g4To4VC8zTuxDwNsB1y2mrlD2NINZJHw5ThvD1emIRV7uY
	5Au/0zV6m/JqJwRjNobOk9LL5E/ClupDbjpr65A3SmJhGxmnDldHj30KiiTdnfflK6E99rIKkCC
	QLj6bjwqmtdIT6
X-Received: by 2002:a17:907:868c:b0:c46:bbde:734b with SMTP id
 a640c23a62f3a-c49bdf39dc0mr39237466b.32.1793136729307; Tue, 27 Oct 2026
 14:32:09 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-9-wusamuel@google.com> <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
In-Reply-To: <a925a7a8362e8e9aa0270c2b252aedcc10694857db29c31f66d6f7c5ba89ac08@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:31:57 -0700
X-Gm-Features: AclHuK_3f2GFNzZ4NDx25anrHi3Bvdsj3Ks-ELoCN4hDAJz29yzPop2fh0fcApc
Message-ID: <CAG2Kctryf8+44WKQzUOzyMmtL4biW3Pbg3Pntzkn3Ot49RhFow@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> [ ... ]
>
> Should the BY_ADDR path return -ENOENT when kallsyms_lookup() resolves to=
 a
> BPF address (for example, is_bpf_text_address(addr) is true and the addre=
ss
> is not in vmlinux or a module) unless bpf_jit_kallsyms_enabled() is true?
>

Thanks for the catch. In v3, I'll update BY_ADDR to gate on
bpf_jit_kallsyms_enabled() so hidden BPF JIT symbols return -ENOENT.
