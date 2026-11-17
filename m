Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955620;
	b=Wz8ToP18Ez8K3ngIBpcjg+6HkGUfoffPArcCeM3/TPSVtEkeygoEuzyvoP8FgtPbKYHQ
	 8JhOo4BMvze4KFqTAJBjwrPApH8c8EsVuwRyf26B2nupkKKJ1O7crMhnTfZTSJbSzDS26
	 U5WzmPoX0RwgXG/2vrtrodGJzqi3Qtrgx6jO8p1NpKiN6bEbcOD0jog1YJvswKUTujlNI
	 qyyecHpLCIlK9xikX21/4fXa1tFme85psujWDvS+VOcm9nq9j8dHCBS4WY4K4SCB4W2Vt
	 40d24jn+5F1fPL4C3mLqyiJEz+yTrfMXw3uide1SA7vEHb3z7tO/cNeXv+IY1umwZKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
	b=Jp6ggWYod0TThVKqWn69711osqa+Ulby3Us0bKBhmWpttFucr5Td/erqgcF99+Sl7Shn
	 8ON4iZwHPy2LZ/PC5YOluovYE+Yx/65mOMmuqYz25G89kgh3xMnrW9NJqT8hHdgzBa2jf
	 uAqiTDZZ6YlM5isPZDQd1B3WCG+Twd0nNaiJM9brOAXGE56KcQB0gUar9a/POFAEcWPc3
	 5g+bvi369Ihq7POTgLdOD2GhfMC4cR5OjUfTB7kzmiqb1RoyXVN+GAso9GdYH5kdM4DSE
	 S+DFxFhDhgKcLAIj1sT8BRZ4hZSLHry+HOsJxQuj4vXfpUBJSNyM9/TQGm/qk57j4HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BCE606A333
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BCE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfdRG192175
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KSC81XL1+EQ
	pdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=; b=OpD+6PDMlyRVIQ4gUsxd1pQRiiY
	2xNljoVElEeEhFUiOG5Uk44VLPG4O4uXpXj0+j4jeDetx+c0P8e+noxSYq2lCh5W
	KHejIzt/I4UdTJmzw+Fg/nSj7cB1QTMx/l3bO+xrP+TSeATVVrDxWTZVHibCW5U+
	hjOQG+u9uC1e2kybz2OaCsXrkrsDWl9/U/SGRqGmJY0vG7rKiLXndtlvel7lQl55
	sdjYVggRIUMT42oLfV5wteJXfkuV+1P3ib3Fp4ylW8JJJGpvlzjjnP6mzY9S0HdJ
	AQ9e8xf/1KwJnz4XcYTaX6HmGdSH8UZ30qmpl1eTP9PIAKGbfG22H6j3L9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by m0089730.ppops.net (PPS) with ESMTPS id 4j0yu5g45x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so211331a91.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955617; cv=none;
        d=google.com; s=arc-20260327;
        b=AdhPh5LEPY225OBjz0zl76XkimjKgEhT6oXFImZQ2DOqcCAw079/gdqOIEjkbR0wgF
         VWEM1LD0s5ejk45kXR6Myet9qdAWSsLUWvg42KnjBjgZnaLJCL7bC3IPaJyIXqxCfy/6
         6J8ECSNKbXqge/Wtxpapi4ZK5LZQzEbdUKSw3Rq/3/dbpiyFCjIFhxOwAdiWRNZPt2v5
         N3TtknIyEPszzSQWyo3mhZb1LxnLgru/KLXlvsH0NzGp5N95JK7DpvMJx+e+reP2khVh
         lGVsSPc54UVPlDG88Gl/K7NwblxLpXUrR0qT6neF0MI78r7pjzSgdzRcJ/lK8eH7Y/h2
         PViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        fh=6zrxVgpsD+F1jgZdANTa9a5uD0s34bl4c6fiZi8m6mY=;
        b=N6kAPToYsdTkAKf7SVajv0LY8yYLcidC/zPQpOjQ2rNulTST5WJ1qYZ0fQUcP219vZ
         U4HFAs4OvgF2tXzezcbZZg+H+KptqvAr8MwIaBYcRJgMZkMEtHu6swtC0/4UR2iPkY0l
         jrsF+eQlYpkvA5lbENoQkwgeMrVFSiXPPU9PWhHiPYaLkXBXimneOnHCkl7BgvLjnBKU
         oHCPHcCt1pUKma+XlQyVmWtxK8IHysyQuKCwbVeymJ2brS8IIDuqNugBWRS5fkCe1kBg
         TLKtk4xrvcjbO0d0rF+qEKfeBLELDsv1duXB+WIXjSU5otobLADSfppglziWlv6nM9Ik
         GVrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955617; x=1795560417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        b=pxmsnl0zuA81uxvBwK/hbqP10pWF+r5ZxjQa1jllIKUz0M2NDOlif+xj1z1VDmpOoM
         JKGiCcrCc03EtCFp2USnYnK7UMbBQ/wO6GfY6Y6PchOGsTDLp/BAohXlZ04x0Di+Qa6J
         rlT0jTvFtX8gsqCDiLpNnJ30rvEqLFES2MxNXP+eV+wVXCobd87NDIfiNcaJTsrjBDm7
         jqBvwFRucqkWBXUWZdp1w/ATX4bA5o3O5akBNRzfIul3yhbHW/wlbBll2qEOFdJFhewb
         rhd0e+aWaUGdX95inBc74F7aMSb3V/KnxEssfTCiJqewq/+C4y+RHwvTs0cyUjA/tLYE
         B50A==
X-Forwarded-Encrypted: i=1; AL+hErFXCzq/LtKwRE+wtZH/2fV0/0TjHAtY6KHlgPlDSSwbyNgZ+ptwuAz9Pm4UAnhvbsyVHkax4QSec7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D6y5bRNeoshQRAuK6Hdcq6UmMgAx0W8pV8K4tvYKer+tNTdNH
	4L3f0slnR9a+IJEpBn8/KoIFIFh8wSpqnet5XXmWmjdJkFj5Guo36WFmcDmz5MKrwZI+dMQbJW9
	GqBh8+i205Tm96cxLciJra5VNVVTWPxYkuGyIo9AZs6PTsHrAi7MK1vcdmbYKHn5oZVOCeeMhyv
	ywjIQYfBUKoJJmkEtUG1OIyJM7X3wX6bpm1zs=
X-Gm-Gg: AZFdTZcriK3Dim1oi7kuuBTeNVSv1b8FMqJ5BIimOd4RHUZ4f4S6whAYKzveEJNHP/b
	zOmlsr7QxSCFYpitYoEH0rWG/7XTKXAOK15RmfO2itQpHG7r//hAOxHm7bU97V4zhX0kV5TSPtS
	Bzu/QvcP1fTRlsjUULsKFpQsBGO4mYCweTVgVVVqNmb7y2oIGhZrJHyTMX8l0vN9qJpfelpIFXJ
	LLJdSaik7yxntYWPnPK4Iq0Wht58KDQRrg31ymKqv+lTtGIJ9I=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr710210a91.13.1794955617474;
        Tue, 17 Nov 2026 14:46:57 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr710167a91.13.1794955616819; Tue, 17 Nov 2026
 14:46:56 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-10-toddfreed@meta.com> <179471270451.2199510.14795764193886368841@kernel.org>
In-Reply-To: <179471270451.2199510.14795764193886368841@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:46:45 -0800
X-Gm-Features: AclHuK_60Rb9y_3QFrgeQGfRKqUkPpfoiUhcDbbJP8UTYE_KV9Woof2OdSMKaMY
Message-ID: <CADh2yMwGN64zEVedBhYbMDcsyPjSJ90tyPz7evJ6x7B9pAk3TQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/15] net/sched: add act_psp for psp
 transport mode
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=EqFHPicA c=1 sm=1 tr=0 ts=6afcd962 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=DHOIGP5XwAi4GC-hQCcA:9 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfXzTolJiI8plgx
 tKy6s/0hCapynBFsMY4jNLz9TOMa3QaEzFcH6CTiTeswriIHfd7zivgdelVicwlDtlJhWSvM9Gq
 /dUm5lwAXtWrAcfUNMpP+WQIXkQvce8=
X-Proofpoint-ORIG-GUID: PI9Km6Z3aOlZ6O1lOBu1UMvK6Q9_3cLB
X-Proofpoint-GUID: PI9Km6Z3aOlZ6O1lOBu1UMvK6Q9_3cLB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX8fmCF+DSXyKM
 Bpn2XmtiWQMlmOPhJMAWHEzFR53QPTRX9lWohIprDlaIVJEGh7ge58y+JKy1/ZVr0DI3VNI1u/9
 XB7JnxxdRjEsyDyfNvq74j7B85cx40jAE0BnMAeyHEhufYkudz0ASyvpg3T+gXO1W0hu/2uVic9
 XvPPdJ1JXrMMB+Vhlx7I4k1bgXz7snq2FobtkGAfr+QX97isTFbwiiBjoUeF7jWQbQZfKXfwKSD
 fwJkaUER02ncVqFrqTgjxS6iV6MuKoI70S+oG70eP6BnIUQkTfo8rbB7nFR9jLSofhiWjz58mwA
 uZpCgAfJQnjDEWN4qSVykttHInkDyzLXSyuQzecWDw6Tx/Vx66TkmyWTjEAVaNViNcK/wvTITvR
 +ZVjZNHLg0Srci6IRniOZfnOue5aUEa00QAnWYSeITkmH0gYd9tDN1mlhkuycmp6/++j7m22dmv
 4vqlJHMSoAaZO9PWU9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Can the METADATA_PSP dst and skb->decrypted get separated after this
> point?
>
> The commit message relies on skb->decrypted as the backstop: "on egress,
> encap sets skb->decrypted, so that sk_validate_xmit_skb() drops the packet
> if it loses the METADATA_PSP dst on the way". The egress to ingress guards
> in mirred and bpf also check only the decrypted bit:
>
> One path where this happens, on a non-PSP netdev's clsact egress:
>
>   act_ct (defrag, sets tc_skb_cb(skb)->mru)
>   -> psp encap (the reassembled packet is not a fragment, so it is accepted)
>   -> mirred egress redirect to the PSP netdev
>
> tcf_dev_queue_xmit()
>   sch_frag_xmit_hook()
>     sch_fragment()
>       ip_do_fragment(net, skb->sk, skb, sch_frag_xmit)
>
> sch_frag_xmit() then puts the original dst back on each fragment:
>
>         __skb_dst_copy(skb, data->dst);
>
> As a result, every fragment carries the association but has
> decrypted == 0.

The fragment path is handled by "net: don't fragment decrypted skbs" in the
net series,

https://lore.kernel.org/netdev/20261117203137.804424-4-toddfreed@meta.com

This causes the skbs to simply be dropped instead of being fragmented.

> Would it make sense to do one or more of the following?
>
> - propagate decrypted in ip_copy_metadata() and ip6_copy_metadata()

Conceptually it makes sense. But because of the fix above, that would be
dead code. Furthermore, they still couldn't be sent. skbs which are to be
encrypted on tx (ktls, psp) need the L4 header, and non-initial fragments
do not have it.

> - also test skb_psp_md() in the mirred/bpf guards and in the cleartext
>   backstop
>
> - have decap refuse packets that carry a METADATA_PSP dst

In both cases, these guards would be dead code.There's no way for these
to happen once the fragment path is closed.

-Todd
