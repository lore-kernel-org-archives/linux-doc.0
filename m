Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79CB352C54
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 03:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781234110; cv=none; b=CIxeUWLEj2pou/QrrWngHOO5YwHvP1r+DJwnQ5wA/s+aB/QukfNva5p9mQKeh2sAbGgIoeJ/qSXcoNft2i/uzFmjUQvZqAFPNqTp1CRf2NgLyeAawXt9SUpDQJbOo91Gk02Ao5xDJxTy4+Y4hYEafeDC49oIJjmU2ThUiXaBg6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781234110; c=relaxed/simple;
	bh=V05AsWAa1UWGRukEpGKz9sh81+TnR8w8ANVgPsPOj6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xiw46iH4z0nannblJANQZnboOwRtwZdb+0+no060H0xwKtAA6fybehZdLwuyFpCHpKa4yPo7nk03X257xwjg/31/6IiZ681DQy8IPS0khHlNQNkWNogbxgHSjRVQ1CJ/q3IepBTidKbbkLIdVRnG1qR5FtX3aFDi2HGlK2X+NNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/S1rx1Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/S1rx1Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c3315c5dso5438385ad.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 20:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781234108; x=1781838908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V05AsWAa1UWGRukEpGKz9sh81+TnR8w8ANVgPsPOj6c=;
        b=I/S1rx1ZV07niCbP1Y8v/ASVKVilCUyueX8+bRakpf1i89eT2FkQth4bQb3ToSq/CP
         +TqRkahRLV4rj9bWQhu4FDMPex6x6G3ISAOF8X1OUtrn1kxVsFwUBR/rIHDC0fPeQz+S
         4LcjaSdEz8Of97ZtVhTYk3+sGIyOxdncxVZiCm0l4K6mrfRur06NrhJsDYDsbDNbXuhk
         6RjhH3aWNqP9IFUWG3I1pWx0aM4e5Izof5p6P6KoguYSCa7pOeCKcKzRcpAPS5rc5X7A
         5qSBm534NlExkHhxL3snmJjtYu2jWMH3pSJwVcNLJDbSL6mS4zKODsvSdwxZiEUj7KqQ
         PLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781234108; x=1781838908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V05AsWAa1UWGRukEpGKz9sh81+TnR8w8ANVgPsPOj6c=;
        b=MYgKD6g3t841lGvFfoQ5H425MMPE/QFdx5BqXvFsBi4phY90gkdu7g6h4oVmqu9UWt
         Tht5DBL7BpHa1zBnWdPWXFvKfEyCxRR9qGjTiLXKTwRHt9Nunu/LOHLwehV7ks302jO8
         dKElIgYwK1hA4v2gJzHC0nrC2DPXQ90emvns1Rn9fjioHljz1npP4WAToYNS9scpznFc
         +ighqMCa1V3uGt/8JxbUbDIO49qT7tbBxHpdF8knAYdMe9juj8WIrO/IaviKmUGpTg7R
         xyCpFMPSky0QD8ENCc5bOJqB/ixD8iIf2rTxId2JanA6PuwwcKnYT9RO4DioNvrgAaMG
         XRDw==
X-Forwarded-Encrypted: i=1; AFNElJ9W2YvdAnU+7WGQaFdEAkBm31HDcyGkiF+BNn9sY5lNcHa85Z78lBnq1KTmdjDOEk0tL77rR61hviU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ZzKRlEAGcMxKCiYzw7Gh6xE2+bKnn5emjGpYFq6i857Gq9/D
	hJwW+WpQ1twMUF3MwjfxosHeP8Wm29dMMTCPR3Hr+OCiGKzH7Q0b4ov5
X-Gm-Gg: Acq92OEKTLxGfrhYlDbPbhz2XBSGMIpkztH4YmwUyCwzrVFVRmdVbR8D1hSOIuzPtPI
	sTouaR0EEo6YSBRr/80yWy8YJHjsP3sS2fz8cz8nypIw9alkLpu+JqXlNvN+1OJVt36UsxwHN21
	xJ7CCmIdiouIwhmtT0Oho4VOS872+hGLTL+VISqBKGLLkHOnWOr5jzyubROpqRE6DSikXRhZ43F
	z5f2dSi1Czr6J2LvvxFjcHr4xvuIs7QNVdP6YE2jQFSXvibZ8ZL93nYdwk6XdcSAQq3LeknYwQJ
	53BdT2hVP4fR1BkCzcVDtk1jkMsypUlX+TglOmGCRa3OIJ8RGCzEOtVUyFtIRtW8r39Gqiiwqzc
	x5C3YpoA242nZHdABaOJ47ST71psambpu9y7v/DW7X/5OrMVTinwSD0Te0ej6uZV8GiPMiYQrok
	p1nLQipUL0UfFPUMKa
X-Received: by 2002:a17:902:e812:b0:2c1:b8af:18ab with SMTP id d9443c01a7336-2c411d7a10bmr14275715ad.19.1781234107996;
        Thu, 11 Jun 2026 20:15:07 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acab5sm3637705ad.40.2026.06.11.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:15:07 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Google-Original-From: Yuya Kusakabe <y-kusakabe@bbsakura.net>
To: andrea@common-net.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	edumazet@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	shuah@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stefano.salsano@uniroma2.it,
	ahabdels@cisco.com
Subject: Re: [PATCH v2 3/7] seg6: add End.M.GTP6.E behavior
Date: Fri, 12 Jun 2026 12:14:56 +0900
Message-ID: <20260612031456.4164970-1-y-kusakabe@bbsakura.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260605032001.2f46e6a55f69896d29da69df@common-net.org>
References: <20260605032001.2f46e6a55f69896d29da69df@common-net.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuya Kusakabe <yuya.kusakabe@gmail.com>

Hi Andrea,

Thank you for the review. The points shared with patch 2 (NF_HOOK
split removal, drop reasons via your prep series, reverse christmas
tree, the missing frag_off check, BAD_INNER scoping, the repeated
size-selection ternary, iptunnel_handle_offloads(), the fixed source
port, and the RFC 6040 wording) will be addressed as described in my
patch 2 reply and apply here the same way. Below are the
End.M.GTP6.E-specific points.

> SEG6_LOCAL_MOBILE_SRC_ADDR (the "src" attribute) is copied verbatim into
> the outer IPv6 source address. In patch 2 (End.M.GTP4.E) the same
> attribute is used as a template from which bits are extracted to form
> the IPv4 source address, and may be entirely unused depending on
> v4_mask_len.
> This UAPI overload needs revision.

Agreed. With v4_mask_len gone, End.M.GTP4.E will not take src at all
(the IPv4 SA will be recovered purely from the inbound IPv6 SA, see
the patch 2 reply), which removes the verbatim-vs-template overload.
In the new SEG6_MOBILE_* namespace I plan to give SEG6_MOBILE_SRC_ADDR
a single meaning for the IPv6-emitting behaviors
(End.M.GTP6.E/D/D.Di): the outer IPv6 source address, used verbatim.
The one remaining non-verbatim consumer would be H.M.GTP4.D, where the
configured address acts as the RFC 9433 Figure 12 "Source UPF Prefix"
template with exactly the 32 IPv4 SA bits overlaid at
v6_src_prefix_len. H.M.GTP4.D posts last in the per-behavior order, so
if you prefer the two semantics not to share one attribute name, I can
give the template a distinctly named attribute in that series.

> udp6_set_csum() already handles the CHECKSUM_PARTIAL + pseudo-header seed
> setup and also covers the GSO case. Using it would avoid open-coding this
> sequence.

Will switch to udp6_set_csum(), thanks. It is also more correct than
the open-coded sequence: for a non-GSO inner that arrives
CHECKSUM_PARTIAL it resolves the inner checksum via local checksum
offload instead of clobbering csum_start.

> seg6_lookup_any_nexthop() already calls skb_dst_drop() internally. The
> explicit call above is redundant.

Will remove.

> Nit: fc_dst_len is int in struct fib6_config (IPv6 prefix length, range
> 0..128); the (unsigned int) cast is not needed.

This check will move into the attribute parser of the new explicit
locator-length attribute (see the patch 2 reply), so the fib6_config
peek and the cast both go away.

Thanks,
Yuya
