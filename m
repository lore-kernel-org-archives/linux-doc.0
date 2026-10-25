Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934754;
	b=KBw8W9NaVUmC0kAKOksH2Rlx/Z4Kc4zPlJ3u+atI6cLUhzAMbOR6xtUHuM1N15jWbpQO
	 ffgLSWmwwOVv84fu1HiDDpr8H0+nA5xTVkt53C4euYPUMyIskl96+jh/Whdliz6/mg4xb
	 a4SNV6evFynL81yT8WQcfbcA7pYdxuLykVLtpPg+dDfw/KZgHhdEAyN7ZbAe2HB5InrUt
	 cmDzkt4zubauwmIn6kA8xuiqQ+aIU1D/WKjVDiFGqWNotkAbqymAiM18KC+lIpplOZnGi
	 hJXSG2ugeHQi4BxSzyBFu3aYJ1QwkmYTDRoXp7AOT4e0WaSA7BYpzEfuyeX1kwD0Lvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mi2nRyZ2cCGXqGYSLBWNvU2xGmO6GV/Jqec+NuWue9I=;
	b=J+IpAyoIUx04hfYNmvVGZ6bFfDqxvRHd1iGKI1XRTH4lsy6FqJbKkPd+rKX8A/aRrWml
	 2TVnz5ToD2hE3iXg5ofxU4X+aiyK706YAcNe6/GVsi5SHFyrFQq8lpcvf7Fv6fn2KP8rz
	 +uA0k18GnsbMbNkOiBD52nX/PZCEZ32PIgi5cqT+x9u4dguMS3sUkz83i1ddxnldmg2Zz
	 at08ypJkzxksPyY+HaiaWbnN02X7wxjVTb5AOCuOJ94q6xPYMiPE9abbu4DbD790hUBRh
	 tc1u3L16qnqYv8IN6491XvCYZfrc9UgV22WoJEKRKl1t/sb6k9u8oBj1XeluCgqSKzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D87Izte+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3FC606A31B
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D87Izte+
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917b78dfe30so33926736d6.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 06:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934753; cv=none;
        d=google.com; s=arc-20260327;
        b=Q3p/+utRuQuaC7iim5xlWWcM+LJGS+01yvHh4AZKsaLKBh/xTZs1RTgYjCmNA/sl52
         GLzOwCyQ8N/JIRB+u+SW5mycUWRrvLkUPOI+2zyE5cZvVDmeRkqL29Xyy9jv9omOgoBG
         l2JJmyyWGlLSBvk8QThP2k1AIILy7/W7b57OsICbRmgIcJnMuDB0MFIJ1N+P3GvRyVxI
         uwLnSaR6n7iYGxXOijQ5pHx4ORluCzDbFWzrMQ6Tjj+B10goZg/+1EActafZeqarEfqZ
         Yt7gljfEDF1HEmcgV9xVAlqMTzQPVmYcSdXTVL7Gky/BYbusEIWSYW85sFV8Ssa8rEOK
         ns8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mi2nRyZ2cCGXqGYSLBWNvU2xGmO6GV/Jqec+NuWue9I=;
        fh=NnTgj2nPO7p4NlviyCKvOho1PxtXe0DXxiOZeA3Zv4M=;
        b=KTUnyi11dFWqJt8wEfTbezpYAuYdn5omDrqix1Dyp0BxDy48aw3/HKPIUnZvR8TyrN
         XgmBiyPv/UUapyBk3CUIi6N20pxo+fP1/IM9ZBwi1ueDCdZLzXYpQ44TG4n5aePnsj9e
         aBnmDYOgUqlNjynZ8CvSOWhFX0pZj3NjMApKY1rJ2b7NMuw7T/XiHUX2ymDV8FcJC7YG
         qQdZskuIocnf5eYlfCnBq/ms7oiDrIAwS2N0TkKfElDS4c/7Xnmpk6VwOa0fXqd10x/Z
         01pWkdHNu3qRdpfJJuQkdBzWGMYMR3X/K5TjGEmZdQXhekRR1LT2Q67rqnTuKUEC3Chg
         cONQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934753; x=1793539553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mi2nRyZ2cCGXqGYSLBWNvU2xGmO6GV/Jqec+NuWue9I=;
        b=D87Izte+JPjIv7JoJa+YByasTrIdqIlc2TclP2PXNZpJI3iX4pfAo8mZDxkZ1MPPbf
         /S1KGJrYL/a0hEGffwL1RDdQneh3zpTPRB8XMEiD9dEmcR1vhsS9wzOztYDmc/Jm3qH7
         PGSv7qz2JjprQ4iO7dJRT+VXcDadbs73xLZ4DXkei0qYL8+2Fh2Z0zFiO+ApRM9Tu3of
         dW2rEgvNjtv6dyDzZg0QdtHy3MYDfAKUySCwitlx5UtGMNJmQt7DGWl732eBXV6ySLsN
         g5cCEf1D6Pb5rfiwB68c/LTyxyLoqb6Pr0BrBDMdrsbuCw+IZQIZYT9jSftL4dx9Eyho
         VSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934753; x=1793539553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mi2nRyZ2cCGXqGYSLBWNvU2xGmO6GV/Jqec+NuWue9I=;
        b=OZ7leATEjoREiu2XilLjR/3Iv3dwdNiBAhjluycLVtqm48StYzvcDrHkV8/oFL6+0T
         q8X7GkbVPNIpio6UouDCTZoY6psfWGOxI9LGDGL6WsEbTjYHrFxJVcuxJEebepdEFJP8
         c7pcneyKOd2h14RhCuBzuOWysZBZ5vSoCg59UuYm+e5NbqiUQ3m2zCaDPXnVh1fUfEwX
         8WC0IgPpvNe89RrW8k0hb5cBH+/QvaANMwqbYMz9sLPFehU5lSVV4dn/+Wyq0TQG/PVv
         fAB8dyH/5H0yNbUKxs8tGUlsMXBSlwUcaMuz1i9XgALrmo62nr9YuvXz9m6QcE1DUlXZ
         Idbg==
X-Forwarded-Encrypted: i=1; AKwUvBzg8qV5jUQ/Z4VLRJLLbMXw4q3G+YTg6PPYs5/Mgc2qe4MvHNMVfzQ3OhbCW6MtOfslUZLyDqgekwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE/Q3s0kgVrFC/DwQDdJdEoHr46IfD3rMOrRGXEyykLN8Dr0W+
	iYWY1E70Dk5pMt00jMyqiWkxRBMQgRCx41FYabjtsnjgUejX7jarOLari6KzuA1nLzxMgltksPl
	+iwKojH6/LyWnGbX9zBAACCNOMaJTUdM=
X-Gm-Gg: AYBFou3e/x7K/eEQNrj/AK+T/n0MA4ea5WQnGYrqpTEUeqblqJcyh2qJbJEBRDXKQHT
	6NKr3hYjiAXzt9bxbNl+WemCxZ8MuYZCYiZeaOj/Qur+B0R7REV+WqTHRsJwMpWL5WjJmroUfS4
	LZFMy6PoYAgpQKuLXaYhNJLagZ8Z+zBJnWshX7braxiSSqse2e2adMAppvt/guxve1zYbN9RJhd
	3UdsE1JTGjEvSs4/UzdjrM4SiinYyxx3WTlvyFs4/AA1+C5O04BOHwvhS+jjSmWvbvvzlHG2qBI
	HSEyQzvWBaW/3dRs7fjNLQ2G4DkvSs5XOi9tbafZxzcx4ZHznE3ij3K0d7rLJDqtxsvpqT1lUMN
	BnsHyrdve1xkNXzaSLHnoQyqmNGUKDv+CLCrwE8at9RPxsWm7K/G9I2I+H/xzM0Mt/31qGEBPhk
	szGgmx6fzsxdrd/7nGwIciTFKhspACCa1f0Q12RGA2cNs54Zil7Wa3sPNyNG0kBVEp8y512NSl
X-Received: by 2002:a05:6214:5503:b0:91b:eb98:d93d with SMTP id
 6a1803df08f44-91c48e7ff3dmr74941036d6.56.1792934752890; Sun, 25 Oct 2026
 06:25:52 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023100859.70744-1-lienze@kylinos.cn>
In-Reply-To: <20261023100859.70744-1-lienze@kylinos.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:25:40 -0300
X-Gm-Features: AclHuK93cmTn06Lm2iuX31Sy3W6skF1b-wNhVAcg7WhieI117wU5o8qsb4JVsm4
Message-ID: <CAMAsx6fVx41oHsZfZpFmYe8ErP==0b=oXG=aK3EEes58N4a-0w@mail.gmail.com>
Subject: Re: [PATCH] docs: hugetlbpage.rst: clarify HugePages_Total in hugetlbpage.rst
To: lienze@kylinos.cn
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026, Enze Li wrote:
> HugePages_Total
> - is the size of the pool of huge pages.
> + is the number of persistent huge pages of the default size
> + in the pool. Pools of other huge page sizes are not shown
> + here; see ``/sys/kernel/mm/hugepages`` described below.

Hi Enze,

Thanks for this, the current wording is indeed confusing. I checked the
new text against mm/hugetlb.c and have two comments.

1) "persistent" is not accurate. hugetlb_report_meminfo() prints
h->nr_huge_pages for the default hstate, and that counter includes
the surplus pages: alloc_surplus_hugetlb_folio() accounts the new
folio in nr_huge_pages and bumps surplus_huge_pages in the same lock
cycle (persistent_huge_pages() is defined as the difference). The
HugePages_Surp entry just below already says that surplus pages are
"in the pool above the value in /proc/sys/vm/nr_hugepages". So with
overcommit in use, HugePages_Total can be larger than nr_hugepages,
and describing it as the number of persistent pages would be wrong.

2) "Pools of other huge page sizes are not shown here" is not quite
right either. The Hugetlb: line, a few entries below, accounts for
pages of all sizes (as a total in kB) and already points to
/sys/kernel/mm/hugepages. What is missing is only the per-size
count.

Something like this would fix the confusion and stay accurate:

HugePages_Total
is the number of huge pages of the default size in the pool,
both persistent and surplus. Counts for the other huge page
sizes are available in ``/sys/kernel/mm/hugepages`` (described
below).

I built the admin-guide/mm documentation with your patch applied and it
adds no new warnings, so my comments are only about the wording.

Thanks,
Daniel


Em sex., 23 de out. de 2026 =C3=A0s 07:10, Enze Li <lienze@kylinos.cn> escr=
eveu:
>
> "the size of the pool of huge pages" confused me, since it sounds
> like a size in bytes.  It's actually the number of persistent huge
> pages of the default size, and pools of other sizes aren't shown
> here at all.  Reword it and point to /sys/kernel/mm/hugepages for
> those.
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  Documentation/admin-guide/mm/hugetlbpage.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation=
/admin-guide/mm/hugetlbpage.rst
> index 2075f1f14a42..01fa9f61c9a9 100644
> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
> @@ -43,7 +43,9 @@ The output of ``cat /proc/meminfo`` will include lines =
like::
>  where:
>
>  HugePages_Total
> -       is the size of the pool of huge pages.
> +       is the number of persistent huge pages of the default size
> +       in the pool.  Pools of other huge page sizes are not shown
> +       here; see ``/sys/kernel/mm/hugepages`` described below.
>  HugePages_Free
>         is the number of huge pages in the pool that are not yet
>          allocated.
>
> base-commit: 3fdcce698abd9193752ee89fb1a440cdceb1b74a
> --
> 2.56.0
>
>
