Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810E246778
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 01:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673467; cv=pass; b=DVYQlqyxzZMp1WobFVsLqbdVPE0KNPceHx33Tn6nWBT3pfZ/50lGvcobv/yMxu2YPoWGJlY6YsXLx1FCKKWxv6qBqmbb0+Jx1+UUyFwQBeNzkNuAutk4GCXwgNV1YgVvZMFhIc4EXWq5IxRBjlfDLjmj2WINepUJ0OzsEoEvkAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673467; c=relaxed/simple;
	bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9QSkc39pfmew/1cO8th8jW8asTvbRhzdt9SA37amJB6R/E9WuAxUTOuVcNVy3qLD+ITGfIGxzGSggmmJMnc65PS/6wZOhm2MgsRvdhDsqsWjZDODcyOlAdrxZC75HZThHstSHp1iNYCRF1Dwalj7O3BQwxfelLgsdd3y5E0AJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qo3hxI7k; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qo3hxI7k"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso18127459a12.0
        for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 18:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779673465; cv=none;
        d=google.com; s=arc-20240605;
        b=NiEgmgCEkQ4o+E90jDQP4L1A/DVAOTR3JTQvfWslfiN5B9BJVT/miEvseL8Uf0M+ze
         rmvpmoSVMkZ9B1GQ8o5AFyA3oFoDUlTw+QQqIg7v+LXBKvPPn2VSIObJH72s5t5XY6TV
         /gviaK+ggB4nX43bamq8O8zz8KtWZlcbqjcH7NeMYEe5S1xeJUqJLj0CA69di9k0N2Cv
         GyYZg2tR9hnU7sNotQxojeOWqvqxIo4fu3/vZXx+QuCnuyMdzurWr6l1bT5Psib9U27/
         sMEXC7ZPtNg0jPo2R5FT3iNTb++DNzak6rDqa2yz4/x+nvyyXpOHfZBu2PaQ9yOvqfjm
         UQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
        fh=tn515lkCL4NOst/4jf20p/lRQgA+ZszYu6tKY4Y8Uyc=;
        b=eY6chLE8n6KhggGw2e4XstSp8LlbawvOZQuUkT2AaRPq87JPjCVQ50eR8cpoA5H5nd
         fmwrx8SXF9+YpZDKi/Xuylg8FYDpDWAvF3VzOUdF5U93LY/M/FUhn8OE5sPLL3u1OnPG
         PfTKMfPQnA7ioOxdQ7brrIMcGq/vFLH1emy/nK4Jd1wVqp0OKmXzt6SWJtjWPU+0IroL
         ap0q/hq3SsSsYH/x7tqnN77SFw26kkEEtr32+lGGxhldO6UhPE8jasiFkYGhjmwHrqiN
         gJNUWHYarhUCXDYDUxaBQ/x2m/mCn0rzq3NmpXqrixe5RYrE2KJ4n0zzmLVqfILiQjZU
         e5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779673465; x=1780278265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
        b=qo3hxI7kIAHe5a62AcbYg8rwNyPCiVI4Gn0xso13TrfXAIrUEKseZRaUOK7lDCehn8
         QYr5UGYILoUUzuOQF4lelENurTL77H+qTIXsvK07mJovCYPXMprYhqt36ugQx94ZWsAV
         yd0c4iQyS5gxuy/EZXEk3rpsB41i6vUF8MgdSJEMCpfu4qgcfLZvREQ+jZyBom79fZHN
         EUCNWwb3viaAvzARBsXwMgQMumYSG0F3zibzirFy5Uqz8XmdUarswnjoZtQY79SJlnwa
         EZiShx9NpACCPMMLrjX+Y/NGn+KR183vDSnJLIiyDniv4hm5fYZIj6VgX/mbpUmCKhnH
         YE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673465; x=1780278265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
        b=YaDJ8oNTwBrAPgsCyj/nRYXkbXvQZqsAfy7xsjgQCAD7Xf1ea/njhN5qskCfTWB/K9
         4ZRXBg1E+iYzWmz1rHPWt+taiuKC5o2Sm/coFMUeXxWhGE8VqRQqtWSQ1qvxB9TgE+tX
         RL44mv+VwZEMQoVxXFWuIt2/EGf1wJHFG3vMewQjlazWRoUFOMtFXn0/MZJlsJVwAlFT
         gnCHpvAvjdcwRtSg+ynTvK41rPa6LbiPMeH2yTAqyml0Bz1T3L9HXojHeFmiY+AjJQqE
         BfKQ5RS8s5yBcydrHLGmbcrYEcuPD+9TMmDPU8rpZfRh3/SXBfBG8HPd/5nKWfVEArcE
         UJtw==
X-Forwarded-Encrypted: i=1; AFNElJ9I7eLkWPdEM/FQFLJSYbEAL2Ez7fGnCKaw34JihGr6hHAto8Cy0q52jXYGCKpNFWBe/Z3rMqMCQ4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5srFR5FTbkVTl3CW8eWWYPpGi4USePMaiCIzaPfTcWNxKwS+
	6e9iwxgkfzh6GB6jYVFBgYuM9/0etU/hEE4RsG8a4E/5TI0vRUEcuuHrZhWeiTabuIR/TGZD/bE
	JC7Oblq5i7X2B0t0Taq6XN/CaKcChQ1A=
X-Gm-Gg: Acq92OGL9lGJjm4TVPsQj8C187gL11gDWR7lXwKUFdt2v1jQQ8x/L1uS3cxEKxP8DWA
	erOzyVfhuiyH8x7mq53fAHjmlwh0lXtYMpI7HJ0P5O1NH6rKOrjKYunvA6KE3JZjVOtXDE2OcvZ
	eqfnflS9m91JN5qMR6hwFjWoOjMPBG9ETEPQwEZ5Fna671PQGLP6vw3hY+9FhwH3HZbJFzE8nsI
	S2r7ZMYyrJXxnrxDi+UgYIYdNVEqNL7luJdWvouU/YgqRcErPz1viWwI5GVGli3uPnEPcyxU7kB
	9z3s5/Mmu9/VJEIj7tJHAsdPJfqpCkMsctSe6AonWg==
X-Received: by 2002:a05:6402:370a:b0:670:6ff3:6d23 with SMTP id
 4fb4d7f45d1cf-6889c431257mr6615752a12.7.1779673464584; Sun, 24 May 2026
 18:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
 <20260505-seg6-mobile-v2-1-9e8022bdfdb6@gmail.com> <20260519033151.b01e47a877b01d3b68931abc@uniroma2.it>
In-Reply-To: <20260519033151.b01e47a877b01d3b68931abc@uniroma2.it>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Mon, 25 May 2026 10:44:12 +0900
X-Gm-Features: AVHnY4L_KWEVlSdlGhMUwX9iTXuQg6B8YX1-k5ekXIJ_K-F3-WVsht3luuuTJjE
Message-ID: <CAGCJULO5HR0J7pD++_--epSEnzqO2p5Mn=UQ3LPbsYYPGydM7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] seg6: add End.MAP behavior
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, stefano.salsano@uniroma2.it, ahabdels@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 10:32=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma=
2.it> wrote:

> The commit message lists three drop reasons including
> SEG6_MOBILE_HOP_LIMIT_EXCEEDED, but the code does not add that one.
> The likely third reason (SEG6_MOBILE_MTU_EXCEEDED) appears in
> patch 2. (Flagged by Sashiko, the Patchwork AI reviewer.)

You and Sashiko are right. The new submission will only list the
drop reasons that End.MAP actually adds.

> Nit: As far as I can see, Link: tags in this tree usually point to mailin=
g
> list messages (patch.msgid.link, lore.kernel.org). Other commits that
> reference RFCs typically cite them in the commit body instead. Same for
> patches 2-7.

Will move the RFC references into the commit body and drop the Link:
tags in the upcoming submissions.

> This single reason covers several distinct failure modes across the
> patchset: wrong Segments Left, SRH absent, SRH structurally malformed, an=
d
> HMAC validation failure. An operator seeing this drop cannot tell which
> check failed. Using separate SRv6-level drop reasons seems reasonable. Se=
e
> my cover letter reply for the broader discussion on drop reasons.

Agreed. As discussed on the cover letter thread, the SRv6-level drop
reasons (SEG6_INVALID_SRH, SEG6_HMAC, ...) would be introduced in a
prep patchset that also converts the existing seg6_local and
seg6_iptunnel call sites. Pending the resolution on the cover letter
thread of who prepares the prep series, the End.MAP repost will
depend on it and consume the new reasons.

> This overlaps with the existing generic SKB_DROP_REASON_NOMEM in
> dropreason-core.h. Why not use the generic one?

I'll drop SEG6_MOBILE_NOMEM and use the generic SKB_DROP_REASON_NOMEM.

> seg6_get_srh() returns NULL both when the SRH is absent and when it is
> malformed (seg6_validate_srh fails, e.g. type !=3D 4) or truncated.
> seg6_mobile_get_validated_srh() sets *missing =3D true in all these cases=
,
> so input_action_end_map() treats a malformed SRH the same as an absent
> one and continues processing. HMAC validation is also bypassed because
> seg6_get_srh() returns NULL before HMAC is reached.
>
> seg6_mobile_get_validated_srh() needs to distinguish "absent" from
> "malformed/truncated" so callers can drop on malformed instead of silentl=
y
> accepting the packet.

The natural fix is to change seg6_get_srh() to expose the reason
(absent / malformed / HMAC failure) to the caller, which fits into
the drop-reason prep series and lets the dedicated helper go away.
API shape deferred to whoever prepares the prep series.

> Nit: the function comment says "decrement the Hop Limit" but the code doe=
s not
> do it explicitly. The forwarding path handles it (ip6_forward). Maybe
> remove that part from the comment or add a note that the forwarding path
> handles it?

Will reword the comment to make it clear that Hop Limit handling is
left to the forwarding path.

> Because of the bug described above, the only path that reaches the
> drop label with this reason is HMAC validation failure (when HMAC is
> enabled). Same drop reason granularity point as above.

Right, that's a symptom of the helper bug; both will be fixed
together by the seg6_get_srh() refactor in the prep series.

> See above: this only catches HMAC failure. A malformed SRH falls through =
as
> if the SRH were absent.

This call site folds away with the helper rework above.

> Sashiko flagged that for SRH-less packets this breaks the ICMPv6 checksum=
,
> because the pseudo-header includes the DA. The AI bot was right, but when=
 I
> ran the selftest it passed. Digging a bit further, I noticed why:
> 2001:db8:f::1 and 2001:db8:2::e have the same 16-bit word sum
> (0x000f+0x0001 =3D 0x0002+0x000e), so the checksum stays valid by
> coincidence. Changing nh6 to 2001:db8:2::2 makes the ping fail with
> Icmp6InCsumErrors.

Thanks for reproducing this. I'll fix the L4 checksum on DA rewrite
with an incremental update via inet_proto_csum_replace16().

> seg6_lookup_nexthop() calls seg6_lookup_any_nexthop() which already calls
> skb_dst_drop() internally. The explicit skb_dst_drop(skb) above is
> redundant.

Will drop the redundant call.

> End.MAP reuses SEG6_LOCAL_NH6 to mean "replacement SID", not "next-hop"
> as in End.X/End.DX6. This overloads the existing UAPI semantics of
> the attribute. The cover letter reply discusses this attribute-semantics
> question across the patchset.

As discussed on the cover letter thread, End.MAP will move into the
new seg6_mobile module under LWTUNNEL_ENCAP_SEG6_MOBILE and use a
new SEG6_MOBILE_* attribute (SEG6_MOBILE_NH6 or similar) for the
replacement SID, so SEG6_LOCAL_NH6 keeps its existing next-hop
semantics. No SEG6_LOCAL_* attribute will be reused.

> The selftest only covers the SRH-less path. End.MAP also accepts packets
> with an SRH, and that case should be covered as well.
>
> To expose the ICMPv6 checksum issue noted above, the address pair should =
be
> chosen so that the daddr rewrite changes the checksum.

Will cover SRH and no-SRH paths per the cover letter discussion, and
pick addresses whose 16-bit word sums differ so the ICMPv6 checksum
path is actually exercised.

The next round will be a fresh standalone "[PATCH] seg6_mobile: add
End.MAP behavior" series in the new seg6_mobile module, posted after
(or as a dependency on) the seg6 drop-reason prep series, per the
cover letter discussion.

Thanks again for the careful review.
Yuya
