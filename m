Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382817;
	b=2g2lgIWPEbQiZP1585seqOTvQRLsJjyWZ8DqwmQMslyFrUYKu7GlepOFPQnk6Ckur0Tq
	 vr7RJsdUR+g6gy6DF6cLfoTtNGRurvZPHQp2pzxK2i2urMgiMH+S76iXFyDi6ANyHciq7
	 47w2IjDS2rXcCiAGmWlD6IlsUAAWiX/Jp1X42+Xr2ynNJqFRMrWpKnavZFTu6h6RY3wBa
	 VkpnoPmq/l2Q5bAj8iwbXLxxviOPFY7q4c/bOYX5TUAPoy/wJR8kUO9vpiPD+10uD2FSd
	 r8NQrhYZOZqzSNL5iUUvN9h9eIehBqc7JUN4OE/3ssmN7lGUNYwrxkf2MW3Wh5O+VrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5sA/bJ7zlvzB4PjwB/BzIEOEcwq2h4lfsdHKluSnl6M=;
	b=ukLePT+v//KUgKT0NMIN/Rb/wzQ2D4AvyyxcHhFElGnWqRFIClQTbjwmEfkxqbOGagqn
	 wF3E7aiy1YfsaN2yL6O1g4KCi52/0QvfoEJ7IIezIqp4HmXfv/uEVs+uJzKe1ZfmAhZl7
	 YjrlwStpPQ+GACsT9dSk4JEqyeAHyDlFRYk44930vjt0BvJdeVi3OOlQgEXrwO/faWnbw
	 +oV9tMg/kfjuyhkPIh0LwJ7kgE4kdDawxNd6N/FHcEzfr0o4ztv1Y2yD25GzGEudBAMZS
	 OYWW4lF65E8EjI2vApM+4iP+QUDp0a0XZuQ7NNBjxgwcSX9YyNgg1N3sk8gIIX8wjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RshPZ4Ni;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF88606A332
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF88606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RshPZ4Ni
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so413792a12.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382816; x=1794987616; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sA/bJ7zlvzB4PjwB/BzIEOEcwq2h4lfsdHKluSnl6M=;
        b=RshPZ4NiZ3yyINW4tEcVjyvremNrPP0ZAsQXV6Slh3WDu0fI6Bfxv5vH9S2S6zksDQ
         PB/TpcB8s5qifEhzKZ+/rA8tJBr6eOcZPnuy3AcwnB5qwLvOgg06jliCu5PqRroc6DFv
         gM5ZzMkUWfhp1kivGjKjaUyKB7Blwnk9IeRVt1QwQ/LQjFq2fgj/V5MfABBARa1iMLR2
         7J6lS2KljnM3f5tH/ka9kfloyLOnK6cGO9fMQfwCfKq3ibQigdpsLiouz1vXXUgdqCaZ
         iyPFC289FZsHf5jkmMp95GL0mBZcl8+jsxzAv7mkk6J2XYs6tmv7hzT2U9tYUHiY4h1v
         rcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382816; x=1794987616;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sA/bJ7zlvzB4PjwB/BzIEOEcwq2h4lfsdHKluSnl6M=;
        b=HwtXuVQUl5HRXct+Om9UUNq36GoD3q8Liquj9LSx2/r4H7rmE5uiO312DTd6yPgGSD
         GG5YOYxUG6Mavpj92JOihN74KseBVGUnBlsHZyDn0Z/n2jqwF9sLOK/fBC+mysLSs7DU
         aSnCEifJkUa5Vjzq4jp19yr/ilY6Q6p1rC3SqxpQoDypdDo5Yp4w6NsnTmdOVDIBF3Nx
         K7EJ96hMQxLL8ZCnJkysiqf4zyvAB3Pvn81NkJI45h1MdNQymoEkEtTEYDbaWDKgRDwt
         Wg5p1/dFIB6MWjpcj9dRktzs0VK+xSUiRo6c4heOKrr3ZExta4/AJPE07xMB16YV6uKo
         8AbA==
X-Forwarded-Encrypted: i=1; AL+hErHXwmorcy+foT6R89TZf663cTbvIdm/d1T48S/AJOVZ+8DDSrHv8VcFEFHOzoiyHFt8lMt1YvGkpa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p0uwrkYduWHvkjHytULCVoOra9eHmVbdTThxQObGjfoNILj5m
	Uq0tjxMWyqGxlQR/B9qgmnGbM9h3vRNsevSOenQSPHvE3sVelGuc+ziU
X-Gm-Gg: AYBFou2ZXntzIDU1kHFo2UgH5A0VsjtbeaPi38MsBO8QzSqYSojgx7xAg3R0t/TRPQ+
	8EI3pw+RM0kk0mJE/HxUYx/4103la++TAKj6iz4Feh8onR7TPtzXssnea9+/3MJRPc9gY0tS2kX
	FhHLvTXvBSVYZ8pC0m5DXJdMkW0Vm1vwn1EIHG5zrS/NwZ/eAmynZ2J+1gw/dDb+RKCMyY7eCK7
	FJGRvL1B0mQDk2y/bd47qZkvheWX5kmuzve+MylX0Akxh2G13McTXPYPJgYzYlq6Pj8IUuCZT/s
	uAigxDX2ezKZ8o5/w2WKgfb2ZZOZOz1ttNgsXj0tWiGHKuKKrkkw5zRUvpMcbecy5cxiLQD6vGN
	nqXEVg8RbUL+9e0WTO+8WG/7TXGiKSXkyKJPh1JxiHSIH43aklP0vHL5zoF1hy6qiPhLF/ENICJ
	LOfk7+X9LLaEwzKD/Q1lUmwLA66maSqUuLOc5fC4VdddzDYQcHBSjMudhezYsT1fiQ0Czifpg1V
	DlEv7mZhCwl7TrOOdaLnPlEzpmNsBMFn0L/4VRo0zqJ33pj8gvncAEfXo7YKUM0fauTKGWyNjKr
	RDtcVQAetFDLI2SvyhyI+dF8IaqsVlWdzS30DRAv3x8kBWO3Tp3ekCSYw++/GVPCf6x+4POWJ1m
	1cfXHmVsxemWVFRqtwL+DOKIvlQ==
X-Received: by 2002:a05:6a00:813:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8bc1c59482dmr1963449b3a.9.1794382816055;
        Tue, 10 Nov 2026 23:40:16 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm1781918b3a.36.2026.11.10.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:40:15 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v0] Docs/mm/damon/design: document data attributes
 report infra design (beyond page table accessed-bit milestone 2)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 11 Nov 2026 18:35:52 +1100
Message-Id: <179438255225.3134195.10613668244848761847.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261017195747.89961-1-sj@kernel.org>
References: <20261017195747.89961-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 17 Oct 2026 12:57:45 -0700 SJ Park wrote:

> +The data attribute probe supports the reports.  The probes can be configured to
> +hit for a given memory region depending on the existence of specific types of
> +reports that associated with the memory region in given report buffers.

I'm wondering how this would interact with the region size.  If each
page of a region is reported with probability q, a region of s pages
would hit with probability 1 - (1 - q)^s, so a large region may hit
more often than a small region of the same access density.  The page
table accessed-bit check samples one page per region, so its hit rate
doesn't depend on the region size in the same way.

A quick replay of the crediting rule of Ravi's RFC v4 [1] on synthetic
traces showed a similar trend.  The adaptive regions adjustment would
mitigate this to some extent, but large cold-only regions still kept
high hit rates after split and merge in the replay.  I'm not sure how
much it matters on real workloads, though.

Would crediting the hits relative to the region size, e.g., reported
bytes / region bytes, make sense to you?  It would need probe_hits
wider than u8, so it is not free.  If you think it is worth exploring,
I may run more experiments and share the results.

[1] https://lore.kernel.org/all/20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com/

Thanks,
Aveline Noir
