Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BF413E048
	for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822080; cv=none; b=sG0goSP3kWZuNNcpsoCzE2GbZEhiQ/+ngCUkBanKKlBjx8UAMA7qAvj1bKElWJneqCKG9dhDu9YSiNqO/dWTGWdAbqA4m0+CMm9e0F0kI9Bxrnhx5nHfmwHI1dHh0fUJv/igLLRVRin2iHk6pVtp+qxFcg0FUI7lK9xb/pIpRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822080; c=relaxed/simple;
	bh=ZimJfwvl3WzhsFTbPcUKcAmZJIX5Tie8DjUsEOTGLWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXHTrjRf+2zmhKhSga7oCfv+q5JB8FBGQaXhkUU7BmKSnCQcpw1A5r+iCuhWt/v/y3xf74hJUs9Quk2KLGn1nEkMv9D67d75UXsXHxqwWNBPHWfYlN3UhYTNJuURbQYxesQJMJQV1j9HBE59OFQHc+kBrtOZcvE+VCi8OUXk5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWsrwpRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWsrwpRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712822078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxDRipmzDDBkSip6m/UVrfqyWqi0BJV7Yyl6Xvbo+6E=;
	b=VWsrwpRk4srmFfvLtNDVB0PeKOH/xGBicndcDHqO6WiBjAKZiRa5EahkbamlUFh+921pde
	fgLSkhgNWBQRziTgYPDEJKXp1RPS7r/snl5zMOnf5HV0xGynA0YFMygIPlUI9hU/xyycbE
	TXvXflt7jDYr6e+h+jZiTql0z4vV6kk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-Nfd3Z1XUNzKUh41FAEQQsA-1; Thu, 11 Apr 2024 03:54:36 -0400
X-MC-Unique: Nfd3Z1XUNzKUh41FAEQQsA-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0so856414276.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 00:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712822075; x=1713426875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxDRipmzDDBkSip6m/UVrfqyWqi0BJV7Yyl6Xvbo+6E=;
        b=Og0Id91DBi/AEVfJNB1mnrT2SOLj9YevNONvdp9x8RN+s4jUyTvLXHv1OkUvya9QOE
         vG5GcdVkfqvrpRgtPT+iA4RQ3z+Tpm7106I4ZfQGtN/PzfCuBh6N3NeYop8yUg4u913B
         NFiOzmAttsPV7hDvW/arCjh5qfp0lX8txC1KsrDmAWo8+sJxhDhvLIQ05fzomsfWb9gC
         izifsnw+nx/yulKlBdu6OITQd3lz4KiEs1H7ZXDXbtBmIXZP9hX7udsPIzvqiFagHlh7
         iel0srWkaB32WwSqKzOidXuD8aiO5QYnCQfUZ4miJ5x326S5gMDh7CXGhQt4JiIf795X
         ZcIg==
X-Forwarded-Encrypted: i=1; AJvYcCX2J9DHn69OA9RwPBa2PW/nVt4tAqzWL+Hp+PzhhvrkQ9OPR4odFYvMIbn7CM5EzQXOZitSMxQpRIc5tG+fPCZhxmlV29q0aVtm
X-Gm-Message-State: AOJu0YwkfeeO597rPtYnk3lhEQFnw83Un7eOPr86ESL+R2/MKoBemDI9
	xQrkPiOYOQuAD2yJvXStwAOD0R1SbUoZUCwtDgCzgUMff3w9r+uyybelZtONy0SDi498IohW5Xx
	763QBXo2YujD8pkzetGTkCnZsxYMgvFIbgPmDXTuRTcGN80eIusPgagM5t4MU3IcX4JpbJ3OAmr
	ZbI7GVPhAnOTkcJfKHz7s8wdjVu5iw1esO35dmW9dTsUQ=
X-Received: by 2002:a25:cd82:0:b0:dc6:ca3a:31da with SMTP id d124-20020a25cd82000000b00dc6ca3a31damr1446421ybf.16.1712822075239;
        Thu, 11 Apr 2024 00:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4/VROz6VRwtxqGZSnsbr8an7LRWsYWB4kGZ99T+tllX8qYXGWqrOEg5CQ+iJUfbEzOcupJtkqlQIST/p0M3k=
X-Received: by 2002:a25:cd82:0:b0:dc6:ca3a:31da with SMTP id
 d124-20020a25cd82000000b00dc6ca3a31damr1446407ybf.16.1712822074917; Thu, 11
 Apr 2024 00:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405164920.2844-1-mcassell411@gmail.com>
In-Reply-To: <20240405164920.2844-1-mcassell411@gmail.com>
From: Vratislav Bendel <vbendel@redhat.com>
Date: Thu, 11 Apr 2024 09:54:18 +0200
Message-ID: <CAHrQN1xuLfc0sfe1kMHmHrBzKQLMD-6PNEakA=EDdabEv4ATnQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/admin-guide/sysctl/vm.rst adding the
 importance of NUMA-node count to documentation
To: Matthew Cassell <mcassell411@gmail.com>
Cc: corbet@lwn.net, akpm@linux-foundation.org, rppt@kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 6:49=E2=80=AFPM Matthew Cassell <mcassell411@gmail.c=
om> wrote:
>
> If any bits are set in node_reclaim_mode (tunable via
> /proc/sys/vm/zone_reclaim_mode) within get_pages_from_freelist(), then
> page allocations start getting early access to reclaim via the
> node_reclaim() code path when memory pressure increases. This behavior
> provides the most optimization for multiple NUMA node machines. The above
> is mentioned in:
>
> Commit 9eeff2395e3cfd05c9b2e6 ("[PATCH] Zone reclaim: Reclaim logic")
> states "Zone reclaim is of particular importance for NUMA machines. It
> can be more beneficial to reclaim a page than taking the performance
> penalties that come with allocating a page on a REMOTE zone."
>
> While the pros/cons of staying on node versus allocating remotely are
> mentioned in commit histories and mailing lists. It isn't specifically
> mentioned in Documentation/ and isn't possible with a lone node. Imagine =
a
> situation where CONFIG_NUMA=3Dy (the default on most major distributions)
> and only a single NUMA node exists. The latter is an oxymoron
> (single-node =3D=3D uniform memory access). Informing the user via vm.rst=
 that
> the most bang for their buck is when multiple nodes exist seems helpful.
>

I agree that the documentation could be improved to better express the
implications
and relevance of setting zone_reclaim_mode bits.

Though I would suggest to go a step further and also elaborate on
those "additional actions",
for example something like:
"The page allocator will attempt to reclaim memory within the zone,
depending on the bits set,
before looking for free pages in other zones, namely on remote memory nodes=
."

> Signed-off-by: Matthew Cassell <mcassell411@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admi=
n-guide/sysctl/vm.rst
> index c59889de122b..10270548af2a 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -1031,7 +1031,8 @@ Consider enabling one or more zone_reclaim mode bit=
s if it's known that the
>  workload is partitioned such that each partition fits within a NUMA node
>  and that accessing remote memory would cause a measurable performance
>  reduction.  The page allocator will take additional actions before
> -allocating off node pages.
> +allocating off node pages. Keep in mind enabling bits in zone_reclaim_mo=
de
> +makes the most sense for topologies consisting of multiple NUMA nodes.
>
>  Allowing zone reclaim to write out pages stops processes that are
>  writing large amounts of data from dirtying pages on other nodes. Zone
> --
> 2.34.1
>

