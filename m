Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869146;
	b=gvNRZINloIbYxWBcXHIptGi+GX3S1lx5zBqlgW25Kl/c+TNNlH7uZvhAGvZzcaNY0L2J
	 u6QtMaUn9jRsYaJ+PtAm1OEm80aolu5pwBO0U4nVR/60IGnE1tlC+66v1IjOjw8/dp2+l
	 w9V6Je6MiWg4gCF3NBMDmbWzYRg1iW3Zt2xRKmf6Z9A0zWaRGH5WvzzuNZrT8nHTHeIQ7
	 VbeQ/6XNrgCTXrHb2GXDJ18bCq1ufJEi6zKYEDDz9MyESGbT+va4qplO7TEQlAjWQn19L
	 Fjad6NRQZUV0QTQZtxJsJgVqgCD1bTHeU+dYmpp6UHOA8yVaFDQ6pVpqiQ0dyelQ36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k7+WvZ0aOuqDrQLrk4s8LJ2lZixNWnQh+kPTnMGEgEw=;
	b=AzYNBrFuk9sLPUWeQRLHqArwHh0QdPmQss5IcqYfaWZlJuHn1eah/x1paWNnltmIXeiu
	 hlFPC3w+VPVbH5VevFiNlZA6qtGXHxqVfLBsYjh/Sqy+zwY3jL53NsX4YLP07alGK7gXW
	 Uc/zJeOKanNvxuhpUlugnZn/K2men5MsTaPaepkC8hShlMv0kczXL0YoGBNmLuIa6CpTk
	 bqRmNKY3ojXfBUNF2YXKTdnEfKzrWH+p8uicra53Ja8sCIPGEq5b0/hVuyQSC5dbcbZcF
	 TEKukI8+GZiupP/puTDVyA6yyE5BPyq7kFv75pg1zEzBUrqSw0iuxQ2S7axxXu6IZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=R8UAr+lI;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9B606A330
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE9B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=R8UAr+lI
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec690faf85so1235977e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794869145; x=1795473945; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7+WvZ0aOuqDrQLrk4s8LJ2lZixNWnQh+kPTnMGEgEw=;
        b=R8UAr+lI3Msl94iYtwZlUGS9fl/9Azgw9o1TvidEUDT3U/UAxHwn2iX60q7R9M3hzB
         B659tpi6WlpzrMHIvVCAfyfwG3vrOWQgsJbKCt1X/8aoUxYJ2rYtnfzYtiU0tt1IIFu4
         XklZWynE0fE+/GzJEL+WIyDmNz5KpSPmQCtBMySPYVjO2Y8u1Cjbayn1MJhu8Bl9joIn
         vIT7ITMjYAF62DxIH/awbl9GDTKJFKtJDHx70riNtyYhsx3PTuwFULfhohDVhrx46M4/
         e6QDN3p5nZtfoya9PbUwmcnaYqOS5bCtMmfBgmCo2srt2kWvSaEqRhX/DonO4tjmYXGC
         2z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869145; x=1795473945;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7+WvZ0aOuqDrQLrk4s8LJ2lZixNWnQh+kPTnMGEgEw=;
        b=iYWTFY950sIlQFn36p2B0v+Ya9bOk1oz7Fd9US3SEdNDyOpdDwkdjKyR7Nt8Lt0hR7
         WlJ7Fb8s52SWYNNU5XVDnMbwjiNiGVUYIRwxzJ4aisveLBa43uNk54384E41n+2e7OmE
         B/jYznPHMNRjF+DdaZvG8TlAuaZI6XzgxN10L5M0x3cGzW3bnBK/UJPPWYahI7yN3RqG
         GLS5UE6s5Mq2Xb8IYeod8ltm4NLh6SbKvBU5KQk5yPuP20Dh5N76rzXZ7MvzCkQ44Y3C
         zG8rBGnpRpeXM6mxnUEODrzeUfN3tzKVe46zpWGNFsAVblEWp9FBQwZREmp2pIp9J0Sm
         IJEQ==
X-Forwarded-Encrypted: i=1; AL+hErHsF6/020OmZEAHHsLG/DtIXDi7zUTJQ82SsqC94ho2NPgMa2n0hFWkNeR7VGTK6cX7w6A55QeadkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Om/3BFfpnLxwXeL6vmUovjl9AtRV8nolMeeBB/mNTrixQmksu
	ygf26OkAJYbtyrJbMFHKX7SaWfDExvDKEdUhaECySAsTXPMsCRgIauYLUCRrQhY/jQU=
X-Gm-Gg: AYBFou0LhTzHU4ZJvtcL19NGcLwOa7YPOEOXlLnrIo2BCC6b20vP+LJwAvBC04fBxwm
	ND6OnZTjq7j3fYnF2t3M6DooFTUwzq87WFPIASwIn7rWTjuf12XsU8InxlHTtXxmZFUOgIa0bxm
	MdUsfwbb8xUYDvhKW5eHduYnbuouqRB23bs+dB7PvoM8sSJutXg13YwYbVFW63eA520BTegmK02
	4WKaoz9VNh3qLcX9E6x4CgS4kN51fx/TC78offGmaJQFvHksPGaC1SpmJOK89v9TU0bx8+NKDSi
	m6Q4uKQaiGhz4P5GuCXUjh0sxk9mDmbs96yXkgBF6BbxIwUSygS0R5EbI7kQYD3HXhIqw4WPdu6
	r6//t9u0AlR8nDsALXON1lssH8eIExIeeSK8LE+hh4/JklW0KNcHxueVgMqnLcCMzS0zoFfr1tb
	TxOMWMKbKkLbnNeGir1JITWF81uMOpeNguE4DL1wERHXeqBKMVPcEw6JfZYBttKB+y/voXFbC3k
	sS9o6HuXFcDgBClmbZVdxouLRyhJUVRflJyNAYNe1YLJb7jHBJXvsTVwolAIHm5mbJFAnH5jyQr
	dRzOEHSdwtVcHzlQKV54SyOcpK6nFxm9vret8wE8ezloL/LoQJr1mxwcoRFl4f9hKvnrrAX4DCx
	Nqp6eB3G85LaYxSk0BeXBmgFqs5IOXKlcHxOhXLp/msTW4a4=
X-Received: by 2002:a05:6122:1d45:b0:5ec:e128:2c19 with SMTP id 71dfb90a1353d-5ee34afd185mr4178359e0c.23.1794869144703;
        Mon, 16 Nov 2026 14:45:44 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e3137csm7011494e0c.3.2026.11.16.14.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:45:44 -0800 (PST)
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
Subject: Re: [RFC PATCH 0/5] KHO map
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Alexander Graf <graf@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Tarun Sahu <tarunsahu@google.com>, David Matlack <dmatlack@google.com>, 
 Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
Date: Mon, 16 Nov 2026 17:45:38 -0500
Message-Id: <179486913878.127049.11178890384802388709.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2994;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=B4tBNQ1Z7VdtzwiInC3mDSvjqCs8TTj8AJu8ec5+Ftw=;
 b=kA0DAAoBu3coTNtzet4ByyZiAGr7h5ajw+EgnwLf4K1QE3Ey3wBrMuunsyLKn4FwzG4JaTR09
 IkCMwQAAQoAHRYhBEExqpPstG8a8H82Yrt3KEzbc3reBQJq+4eWAAoJELt3KEzbc3reexgP/iNJ
 9wngObtxeMjseUrGIZO+homrx001i5s30BEDOoxaOnc0JLX0k6wLSKqgU7aGykiWFCsycGxxB9b
 c29M5wS9gxdM/pcu2Xw5N70dBLhpdn9+haQci07V/zrd5lMrfphNFYZwqjlWwbiALzVcssvLiOD
 6UbaXW4F2dIngPseFhAnnXLKgfrn9J2HpO11t86+d5RTjj+UTj4pu7l8ZmzffBTZJS6uGXWkLGQ
 E7FhU0knsnp/EwrkIFEdlfVxywUvoFyZT2KmtpAFNboSsJrJmJR1W/gr2ReuSMOPwZb+36pn307
 qlchMHGrpkxxKYg8XoyuNXO4eOYHIPQiVkDGDYNoKrUYJPsuuuyn5RpSDBSpBDFbr8ZK+sPZWPu
 TZnI5Aexi2UPJFvXfvNhWNCaeUOUQMSWrbfoTaYNF534mDaCAKajs3cssYoD04PdOruWTDEOt+8
 oL3aJMyFRagxw4GQT9JZB3SLi4tQ/i1ym1rDfzxbdrAVVIbB7noxj+h+2U6Rj7W6bJUS2gnIc8k
 H3OrBYHeSS6ccJcuolC8taHqSp6qIY057JLomhydU/L2vC98fy5zipt4VeLuYl1Ty5BUAbmly34
 UZJSzl95wNhO1dpC/V5Uazz1WvnPgP/MCzzQDw/eXmunJU6ptZeKCrcSEjxNavBkmfIr08kd8Bm
 P9lPZ
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Hi,
> 
> This series introduces the KHO map. It is a sparse map from integer keys
> to u64 values. It is implemented as a radix tree of fixed depth.
> Currently the tree depth is 6, so it can support keys up to 54 bits
> wide.
> 
> The main user of the map is memfd. Currently memfd uses a vmalloc buffer
> that has a pair of {index,pfn} to track the folios in the file. That
> uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
> overhead. So for a 1 GiB memfd, it uses roughly half the memory.
> 
> In addition, it is a more versatile data structure. For example, it
> allows for adding or removing pages from a memfd after preserve more
> efficiently than the vmalloc array.
> 
> Post-LPC 2026, the plan is for KHO to maintain backwards compatibility
> as much as possible. So this data structure allows the serialization
> format to be more flexible to future changes. It can also be used by the
> upcoming HugeTLB and guest_memfd preservation.
> 
> I have talked about this as "KHO xarray" before, but I think using
> "xarray" is just going to confuse everyone since it isn't really a
> xarray, and the API works a fair bit differently. So I renamed it to
> "KHO map".
> 
> This series isn't complete yet, but it is in fairly good shape so I want
> to share it to get some early feedback.
> 
> Things that are missing and planned in the future:
> 
> - Multi-index entry support: currently, while the map is very efficient
>   with 4k folios, it is horribly inefficient with 2M folios. Each folio
>   in the memfd takes up a full page to track. Multi-index entry support
>   can fix this by tracking entries that cover a whole page in the
>   previous level, similar to page tables.

Let's fix it, see below.

> 
> - LUO versioning support: LUO versioning headers are still in
>   discussion. This data structure should use them for future
>   extensibility. I am mainly waiting for things to settle down there.

I would not worry about this. If versioning lands first, this series can 
be updated then; if this series lands first, Tarun will update his 
series.

> 
> - Dynamic depth support: Currently the depth is static, so it can only
>   support keys up to 54 bits wide. Adding support for multiple depth

Let's allow keys to cover the full 64-bit space from day 1, and make 
values 63-bit (like XArray), using bit 0 to distinguish a child node 
pointer from a leaf value.

By making it generic from the beginning, we won't need to worry about 
ABI churn for these features later. Instead of caller-chosen depth, the 
tree should grow (and shrink?) dynamically bottom-up based on the widest 
key.

Plus, with bit 0 tagging leaf values, 2M entries can be stored directly 
at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space 
is much smaller than 64 bits, so in practice the tree stays tiny in 
depth.

-- 
Pasha

