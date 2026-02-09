Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7E276028
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641294; cv=pass; b=tG7wTzwvGuxM3/jYgKJ6zwdH90hJDtavIlVi6cQyqX9zaERKjU9YvooH05K4AS4y20xcngkNumr8PQ59qiqvsluZlHXy+UAclAEVqOrwE0sieM2h1rW7tGwOQTZwGHWIoAT3QF9zFfb71kWoTKOl4WyHNmp7AcMka9nNXVWw3f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641294; c=relaxed/simple;
	bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+s4y95CANPUyenint/jGSI5TlEidDAocW4ssOnT/KI/LWPbTvAHqaM+jkX+7pWnolIjL1ptn7QuFzg8q3T+XXjztNVHbpdG3rfbPxgTd95eyp2IOYu3xGMx0R/Efi7jEI82SprSCGnHIR56UKuRH8y3aElZn87Q55XZXCsSB2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClakaICm; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClakaICm"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b866f98574so129988eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 04:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770641294; cv=none;
        d=google.com; s=arc-20240605;
        b=dZjBJKbR9jnV+dCWi8C5jfdprLINry6mWV8A3IhWBpJ3L+9z48NNehdzeNU2Wh8b4U
         lsdT1FFvAgZ6ZneyCQq2fxvmuF9fsh1ZzwDAdbh9lnQp2LBNMfKYMD74epGa10H9o37x
         XtUCJRZM1b+3KipMDa+c+2pipE3nceqAtEb6EIVxdBLKm6ThWKy7eirtj18q/pkuXmj7
         MfEXIvdUve1uSnWgX0yHBhSg83LI4M16OhvIG1rRwv6DNQb1c28gGkzo4V5C6tImYLkE
         mG31ox54hCh+nrKp5b4uCvgMRUph1H1Qc2wBaTg0yCFlFe4VoW69Ljf2NwyckVmHCQt0
         Mq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        fh=zlMhxFQCvepWWaAZYC7mPy2ckyoHS1PVYZ7JpO+giRM=;
        b=fNiDoPBKivPgwavEcqlQEhQCi1bbLLv6xDO2opF9GJKwyrZ8JCGQrMElJPRWq+ekgj
         tcZ0YVm6fzg/+kT/6qipKx1TaFKx5hzgdT0vkCKR34oA45JpYZnN8MaVdpeC1THue51o
         OIiwJNsEZg6DYKhRaREqwc5CypYLvvJ9Koi3XOUaGcOnlz8A0A8svUdX3vPdSDPnzGTD
         dbd9y/Bup576rpbq1S8eBmuUvO4c4BDyQm5mbrAM+J8dN+nxzbWGT2JlL3dk1VxjvMPd
         w11bn62+84NG+HlUknoqzzUIjch5vdE0uFJPu6Rt3VWFAq7HuIiRqJKzoE0lHfaQP5/8
         OJxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770641294; x=1771246094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        b=ClakaICmsE1yL+UafRVq1mZpUEutWrwl06UbF5Lzftu/tgcx6jIuZsK5V9RHIZVCL2
         6SgglWqooQgrkA3BVw+NITAvMmw29z+k3u1TehRwrAQ6uFvs7gLA6oA+j3N480TQc6+h
         qL6D1rWYgTeprCVZEYA02n+sLqPXfct6LmyMmTUnZsbb1EG+/p9JWTQX3qhgtofVgcq+
         qgpoPuW9IBTNsvvouyNY4Qf5d9tkWnXRdLoEYCcTmY8aTkNQYoBDYWZJMCbDvjX8WAUR
         G1aTXDozVgt4/2teV0hZzOuFFpKnDrFMklOfdn1v0oJRSv6b0yaGtHT9tHZ5HDJKUq+Y
         jk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641294; x=1771246094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        b=DbK0TusyAoSZIzCbcS8bjdCk6xlSP3EGduEE64/hvGSSL2UpqJSzszpdDqSonSkcID
         9uC3ygSQ0yyP+hdvncfWd//erLYMKId/r4NulOyCk2Di1ygQID98ccjHpYq28HU/6snQ
         4iST7EVtBdAgL8nDiVaMPAV3fiUVWQ+6SlSFmRkBdD1PibHvciE6bsFqXOsyizhRbuOf
         jZcGCAP74tKB4WEShcCcTVzqrWus1Sw4tKO992wob3VRpDZc34SevtIJ30danGzxdW8g
         LcKy1hCwucI66gMAC9A3ac8r2v9spiJML7IDqCMWemLahuxfIV7AcVAhEGRqHob9NngV
         RW2A==
X-Forwarded-Encrypted: i=1; AJvYcCXGTtu7r+g7BLMybJ8uwX7OU3DKx8qp6rPypzV5DicDujsiQXAtCZajIxGWEiqj5gTEudz1e9/7sM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwexdGVCcX69waEeX/fiWDK+Z+B0XYGNiqj8dx0sgRA4ZDQh/vw
	92jRLYXp775ubJE/5/YojKFIqLkjeMpdBoA0rV6qaUJ2n4Bum8zOEE04JLVcxv0bl7RMHzuxjga
	rsiSKuv+NhHBFlkEy4va87P/dROWdPy0=
X-Gm-Gg: AZuq6aJ1FxA4LPB3ZUYhIuKQh1S8ntdxULqTeiefHS7hzhGbmXN+MMTftnAatmwjRH8
	qrnnTUy7/yZX7pn/pK2d84O1S2hM6m1L76+unxj1hargXAwwCLixajuED3+gJeRSD+E4GOprLzb
	WOLl5bIUsrI6+0gt53y0An4GrpoIFU57bLZvW/wskcIQoyfPOpTeAfRZTEUEwTQvRWM1XaIQvaU
	L8AwZKppLDGCqtJuyYy5T+Q6ks8SsFa0+vBXQ23wEvhyNZ23r9DhEVVULR7gDtDL7flP/gxpYiq
	sv8pIBG2M+ZlHn7nPD7EtFKM2n+aPO/5tGU0iSGj431+aUAkPdbE8LnpSissKVs1k0rrnCGeLzF
	VtF9UVxv/onBz
X-Received: by 2002:a05:7022:f110:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1270400d2efmr3145716c88.4.1770641293834; Mon, 09 Feb 2026
 04:48:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com> <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
In-Reply-To: <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:48:01 +0100
X-Gm-Features: AZwV_QgErW1i3cdVg9NCUS7ajodA3eR57gJ3TzoJcEMEoaMPMOSJAFJmjla3p-Y
Message-ID: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, linkmauve@linkmauve.fr, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 1:29=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> As far as I understand the patch is complete, the problem is outside the
> kernel, it is in the libcore provided by rust or the rust compiler.
>
> That libcore seems to call __udivdi3() and __umoddi3() which are not
> provided by the kernel. Instead if should call the functions do_div()
> and friends provided by include/asm-generic/div64.h, or provide
> __udivdi3() and __umoddi3() on its own.

Yeah, but what I mean is, should we add this if it doesn't link,
especially without a note or comment of some kind? (Perhaps to your
tracking issue in GitHub?)

i.e. if I understand correctly, you prefer to not add the panicking
intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
By the way, it would be nice if IBM could join one of the meetings
with have with upstream Rust to raise this topic again with them.

In any case, it is up to you, of course. My only concern on the Rust
bits is on the docs side, the rest looks fine.

Thanks!

Cheers,
Miguel
