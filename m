Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B33321C1
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 03:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246744; cv=pass; b=CsMiNKfY0olaBagVtAupGcgEIYRgaD10jeYRDt/Rp3n0C02MPFxmKSw9AIHpwTIPD3AcrUYpIt8oD1kO5RtDfyez0SKf58joGBa0TXLPv6ykuIDcdtgfcBpzztkpfQ8jvErN4UAThGzrFlDbprhqW4H6uA78a/oklTU4Uas1Nyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246744; c=relaxed/simple;
	bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgA5m1kIFZGg/AJezzs72dM/426XmDTaGpRaiZ6FMwClH31JUiincudmN7bjsMDV/9OS86mHjI2mcKqNtwg5YPqpL5t40cvvD1Pbr2vsQF3bRAgxJJdm1k+R96KG8FZeOnr8US9tiQAUzryft7WvsQlMRsQURQGuAtBZfTdpKcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeoyhOPV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeoyhOPV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bce57c132b2so1023475366b.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 20:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779246741; cv=none;
        d=google.com; s=arc-20240605;
        b=fVAidqFhPsTtzxZ3RTPjoMTwHYaXHqIgn2whFrpq1ir4cAFMOPzQA1d4qzCg0kBMJH
         ULjlnnj959lP3t+72A03PN/IGWWOokJQX2T7b6iQ5ncH6lR+H+VWz4CDR2De5OKvR1H/
         H9me56AUN3c71MFNRQMiAt4PAYSUaBt7zVPqMhLeF51cyKxs0INrXyQ+C+BfJ5jbYS6W
         Q7H2g54TQVFuRyolo9cNRNgq/uBb+iqDp+IOClkj34kWz/0N+z+s5O4672/dyCJrx/+a
         p5W1FvTIollZb/WMlPRJSqq7z5yVlMiZ4cjShnuB0dxAXp7qg48ZooTR72eaj70NIp4f
         bzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
        fh=pVTurRIXtwbBKx+spXnQx8EVJhoj/EofpFKuXFXEH44=;
        b=b0l4asx9f57DxHxqV61AWAA/5gYbEpmCN4RI7/zyfE+/8QslAat/F6XL4UlB1aipor
         2m2+Q9WNjz/Jsir8g9h0hPNUqbPj9dIYUhmbMQbzJ48rn+Wl8p4TV1w/7dAKnIyRRZCg
         G3TO9pSDJ6WVv8zgLNnEInIAVlhzemkkwTKGLxSAsVCDil38cT08nqC9KXP7NhX7hIO4
         JNAEh+tqe0H6mcZ00/6GwfZ97qUxxS6ByJKGmc3HHgg09NzBMFKlVXuEyB8FArNNEeDx
         uEqZhJaUyLheDNVBiC2+vkLCTKzv00eXiaxaH8zGg5x+HqR4Ulj23AbkoZ50Ph1UQxGR
         HgqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246741; x=1779851541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
        b=YeoyhOPV5sKrbofkwxsSxP3WPdccEUSvVpdmOdwbfcxgzaur8OSMmUykKafMs7HiNd
         XuT2BOJmZNbSD/b5QhYrvbJN7SZ7puEVsuf/XIS1vXO4IFc5UVx2PDdiN6NvLyJEZHki
         o6PFpUCWYPkodJ1Tr5UzX18EP4LqGHnkAj/R9+aUgepEX4cnDMcp5dADgCavEsZJxZWJ
         0UJo6kx/sYDHD4SFuPkwDJZW7hTcaN3QfD+7s0p8YZaMTlT/q4/miW4/yINShwjbbmK6
         d5wfRKYGdMsMthoyzRtN1qaiwFg5/Mqq/BEt3TSiulqdWJ/Xntw85YA5Ev+s7weaJbta
         kmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246741; x=1779851541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
        b=U/ma2hF3B/zUqrf7FFbYJ5kRddyyieB0fg39xPcdFJ1R7K0mpZEmTvcHpHtSyJLzCE
         l3OieOw8u8eS1WJccxxBThX80B6mkEgu5Z8fe0jTWcqq4mwYf8XaP6HmSU79Sn4B4wFG
         gf3L1rKCOLVrg3Zp7JQh1/tOxM8IlfBtml82qRSP0P+8XNwHEHs0sECnRzUqjgW35bvY
         9Q5dz3rEt+JkUeI/PHZiPleatiALOAqN/IYFbSAmakInxo2G4qpZJUoJUPr23LfPYdTN
         V1RLRzNCqwklzuHKqbFgGCwDMWw7bGRZLTHKRaSFMPdPxzBzlkRZ1uaOtFDRWRzoOjpp
         qQVg==
X-Forwarded-Encrypted: i=1; AFNElJ+KVsMS0VypTArB+tooHzNtG5HmH9bENUWImmiQLFpBytcz3NlZdAuIH4DGYdIoMhhXyEpsLILSivQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjjbmx1Bqn4I85oxe9UNFlgxAKpyXVsZRRHRS1s0tyJ7M2QBYl
	Z0f8nC4s+2lf0/TJqEICYPBfBPrXUWwXKJgO5TC7bl7bX+z9fGoPdPRWa+Y/KMjkS2kmUx1chX7
	ARFZ3n3W5EXqziwH00eZwEBmElp5qA+s=
X-Gm-Gg: Acq92OH+JDgTALy8ayZdpw3asxMWoKJTAkZSG78tZj3yVzQt7jAEAPviVLG/4BL7Bd8
	Qef+fN7WGeFYDxeLCd3WZ34i0oz9PSloCQr4doIWrCXAaEMu/Ldjkhq4Jj8tEmK+mRveJy/xDe1
	7UOzAnaYh4UrliDGG3ktvMkmBUj+/VBHQRzgwwYOuSiOkgWa7ZvWycPu8o+ve/P74WNNV+J87bN
	2Bhv0K5SG+WacDIU7TU0sbIrqsGTvXy4g6R+azIJDMPCPU5YL7D8WALzc7qi4YFGbSt4CwrWgxN
	puJNvaY1wy2+2DNBt2pctNQhfurLNw2ksFOO4eTMLg==
X-Received: by 2002:a17:907:1888:b0:bda:24df:21c with SMTP id
 a640c23a62f3a-bda24df0842mr166491266b.17.1779246741329; Tue, 19 May 2026
 20:12:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com> <20260516182556.66af27a9c63208435911990b@uniroma2.it>
In-Reply-To: <20260516182556.66af27a9c63208435911990b@uniroma2.it>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 20 May 2026 12:12:08 +0900
X-Gm-Features: AVHnY4KTNuJSbb9D4nUNQUegv6_rAFJNR8Egb-FQK8FpKvIA1CC8ZYCh7vjvMDc
Message-ID: <CAGCJULPdm8jbveZsUm467_LBHRf5g=Jqd=XvCVKdNE1F2U99jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Justin Iurman <justin.iurman@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, stefano.salsano@uniroma2.it, ahabdels@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 1:26=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma2=
.it> wrote:
> RFC 9433 Section 6 is titled "SRv6 Segment Endpoint Mobility Behaviors",
> but Section 6.7 defines H.M.GTP4.D as "SR Policy Headend with tunnel
> decapsulation and map to an SRv6 policy". This behavior receives IPv4
> packets and is not bound to any SID, so it does not fit the endpoint
> model that seg6_local implements. Placing it there required relaxing the
> ETH_P_IPV6 guard to accept ETH_P_IP and adding input_family to
> seg6_action_desc, for a single behavior that does not share the endpoint
> model.
>
> seg6_local is not the natural place for this behavior. The UAPI cannot
> be undone once merged, so where it should live needs discussion on the
> list before we proceed.
>
> Given the volume, moving the MUP code into a separate seg6_mobile.c
> (say CONFIG_IPV6_SEG6_MUP) would keep seg6_local focused on the RFC
> 8986 endpoint framework.

I will move the MUP code out of seg6_local into a new
net/ipv6/seg6_mobile.c under a new Kconfig symbol, and register the
behaviors under a new lwtunnel encap type rather than
LWTUNNEL_ENCAP_SEG6_LOCAL.

For naming I was thinking CONFIG_IPV6_SEG6_MOBILE and
LWTUNNEL_ENCAP_SEG6_MOBILE to match the file name, but I have no strong
preference over CONFIG_IPV6_SEG6_MUP if the list prefers that.

Once LWTUNNEL_ENCAP_SEG6_MOBILE is its own encap type, it feels
natural to me to put H.M.GTP4.D there too rather than adding a
separate LWTUNNEL_ENCAP_SEG6_MOBILE_HEADEND. What do you think?

> I think this patchset should be broken into smaller patchsets, one per
> behavior, each with the behavior, its selftest, and any needed helpers as
> separate patches. The same approach was used for End.DT4/End.DT6 and
> End.DT46. End.M.GTP4.E alone is ~1.2k lines in a single diff.

Will do, following the End.DT4/End.DT6/End.DT46 model: one patchset
per behavior, with the behavior, helpers, and selftest as separate
patches. The new code will be aligned with seg6_local.c style as
part of this rework.

> The series reuses SEG6_LOCAL_NH6, SEG6_LOCAL_SRH and SEG6_LOCAL_OIF with
> semantics that differ from the existing behaviors. NH6 today means
> next-hop in End.X/DX6. This series reuses it as DA replacement in
> End.MAP and as prefix template in H.M.GTP4.D.
> SRH is inserted verbatim in End.B6/B6.Encaps but augmented per-packet in
> the mobile behaviors. These attributes have established UAPI semantics
> from their existing behaviors. Giving them a different meaning in new
> behaviors is a UAPI semantic divergence.

The mobile behaviors will define their own SEG6_MOBILE_* attribute
namespace under LWTUNNEL_ENCAP_SEG6_MOBILE, with no reuse of any
SEG6_LOCAL_* attribute. That keeps the established SEG6_LOCAL_*
semantics untouched.

> The selftests use OIF on all five GTP behaviors to select a VRF for the
> lookup, but that is what TABLE and VRFTABLE are for (End.DT4, End.DT6).
> OIF in the existing behaviors means output interface (End.X) or L2
> egress device (End.DX2). VRF support is a nice-to-have that can be added
> later as a separate optional attribute.

I will drop VRF support from the initial behaviors and revisit it
later as a separate optional attribute.

> The user-facing parameter names and their semantics are defined in the
> iproute2 series (where the man page lives), so that is probably the
> better place to discuss keyword choices and attribute naming.

Thanks for the pointer.

> We could think about a prep patch introducing SRv6-level drop reasons
> (SEG6_INVALID_SRH, SEG6_HMAC, etc.) that both the existing behaviors and
> the MUP ones can share.

Good idea. The prep patchset would introduce the SRv6-level reasons
(SEG6_INVALID_SRH, SEG6_HMAC, ...) and convert the existing seg6_local
and seg6_iptunnel call sites to use them. The mobile-specific reasons
(BAD_SID, BAD_GTPU) would then be added together with the first
behavior that uses them and reused by subsequent behaviors. NOMEM and
MTU_EXCEEDED would be dropped in favor of the existing generic
reasons, and the current INVALID_SRH_SL / BAD_INNER misuses would be
replaced by the new SRv6-level reasons from the prep patchset.

Would you prefer to lead on the prep patchset yourself, or would you
like me to prepare it?

> Selftests for the five GTP behaviors heavily depend on python3 and scapy
> heredocs embedded in the shell scripts for packet construction and
> validation, which adds an external runtime dependency. A statically
> compiled C helper would remove it and avoid embedding python heredocs
> in shell scripts.
> A few cases worth covering: SRH and no-SRH input paths where the
> behavior accepts both, missing SRH where the behavior requires
> it, malformed SRH, and invalid attribute values.

I will replace the python3/scapy heredocs with a statically compiled
C helper for packet construction and validation, and extend the
selftests to cover the cases you mention (SRH / no-SRH input paths,
missing SRH where required, malformed SRH, and invalid attribute
values).

> The dst problem is pre-existing from 7a3f5b0de364 ("netfilter: add
> netfilter hooks to SRv6 data plane") and affects seg6_iptunnel too. Both
> issues need a robust fix before this series can go in. I want to look at
> this myself and will Cc you when I do, as the five new behaviors may need
> to be adjusted on top.

Thanks for taking that on. Given the cb/dst issues you described, I
am inclined to drop NF_HOOK support from the initial mobile behaviors
and add it in a follow-up patchset once your fix lands. The initial
behaviors would then do a direct input -> output flow without the
cb-context/finish-callback pattern, which avoids the issues entirely
on day one and decouples this series from the pre-existing fix. Does
that work for you, or would you prefer NF_HOOK to be present from the
start and rebased on top of your fix?

Thanks,
Yuya
