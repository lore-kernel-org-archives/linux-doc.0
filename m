Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495637;
	b=wYilm+u797NJQTTe0UQEE6OBaXBg1h/tSuS38r8NArsVzThufPha7/1yYLaYtwNhqp38
	 dTvfGDi+08Zoe3bnd9HQq5p3ssYWkQ2j8+jlxP8H/UAMkNQfT+2TtDRmu2cSmh5cZYatN
	 Nel02kkQOvEUOgSDzdDeXiFbrnMBfXSaU7ElvUIg6tuaoe9IAju+uuFUGRTyjklKXC7FL
	 ZMVPe41cpBf+yOyZkQaFGvG1kdOG+ESiBeaLH96eoWBXR1gDkC9NqlZk8ykpSVYCQNjA3
	 w4vcctaFR32BdaP+RlzYZ/bkvHGaujlbezKdl1zOp5bLjHHB2Rll55iSBm+Xz+Iubbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8yYqy1tuA0FyJjrVSCVgV+Doj8Jl7Ml/5bTTP3YOpXU=;
	b=vEIPeLn1kKQ7Pnc5423QP65oWkfRgd0tKhJVv60trXAqoADT4vwAGYG0twNdNyPkHKVn
	 7P6EafF0HCMTtLrTbgqIlsSdFbw5Nc7GMZy/cpo0kJUWsDTdfWnGttyE1dkroFlSKhdVC
	 xzhab+paSmvVlt427XHDSgKG1x9sU/LRFdHOVSetVOP+wv+6+ZhBJgBCBHxxDIqOIzRv1
	 rbhLZIIBO5pIUXadKl454WcPBUGTUoj5ueBxSONG3V2UNjsiO4ygunQ/x+oFwXaD8bSDO
	 nLTujyp2yLxOVPtk4ADXecKwx02Vrk9KOFNXC5FzoT3k+IPIbbkTDxPqNjRJmdiXdYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UNTUk5Ph;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21073606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 15:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21073606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UNTUk5Ph
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eadef147ffso2264542e0c.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 07:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794495636; x=1795100436; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8yYqy1tuA0FyJjrVSCVgV+Doj8Jl7Ml/5bTTP3YOpXU=;
        b=UNTUk5Phl6735h5yGynAgTS/6C2cJAMQ5iWpSsj5LGh9dtu6ZbUQ28l9PCUZyDWFS2
         984cM+oMihbSSW0raUu6jnUzRcE4QjotUXIJukljUMS2LAKKCPb0itQ7GlX5XUb4E/Yk
         SKuDu87H7pV4G1oTWB77pRyK19GkF9y0JTc2S4ofIz0Os8H+TLP9NJthH1O5IJX5AOL5
         naVwG5XJzQSxQgYOJ2lKVnivL3+dtVsuXDcE1TqT4jw+WXUDMC3oSYgSdJYXWwcDBDg5
         l0vhl/Ozl5n2wi4MF0827C8dfNJtX6U5VONtrUegzVnq2Lt0hBh42Q5KGK56Et30gRE6
         3xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495636; x=1795100436;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yYqy1tuA0FyJjrVSCVgV+Doj8Jl7Ml/5bTTP3YOpXU=;
        b=Jb9IbHl4FHSHtuD9c2V5LBx5xI0LokOGHVzymQRmi6aHraRzsar0u41TS8kSTLLea3
         j5w1/37gS5BGUOL2R3KoZ8HBzFppIhj49unPlfLFfPnZy2LNM2F3BwDD16CVc44oMj+3
         tm3bE72yvU3rX3lKLg4pO6+BTmo4+eX1J0Uhew6QDAuj82cZjXgy4bZTmaIkVbuFDFZ7
         Sd2Pd8TXheLM9GY3NmlFpLMdVMm9p+Bl0F76c/FP9dpRwqFYPgGq7I/Mxm8hn5SEad4j
         RnJnmLjwCh8xdQTz77vgf83QVxKy42jKvYzhpg3tjVZ88s2uE0z0eTds62p+4S4RxvYO
         GCZQ==
X-Forwarded-Encrypted: i=1; AL+hErEG9KTHLEWOGgu4nuZFX6ZgkbXzLJ8kzYosEY4r8SZHneUrDaf9a0wK30tNM5hVa/3I4urp7ISv0Wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fnvF/sz9+CWiu18wDqb9n6C6qb0hVKXGkg9SEzXG6yX7GO9MS
	4RKH+aCAQo3y5/jJtEzPUQj4V1fi8eP0gACaW7EXlHAm8/QLCDH/aacBYSl3Ao167sA=
X-Gm-Gg: AYBFou3fyBxtEt++buphN2Yyo0rEVaAg9w1Gyo3CHp5HRFYuTJEZ6XQY5Txp1H36s9N
	45XAUSiDoR7xleckphXtmRERsQJsl1/o9sZa+LBj6FozOh2wItYusL8n8YwE8SJRURr6ZpZX6yW
	pLkR9niDuGHEiD6S8XiOW2cpyUj+xrbwD6Ms1Wq0Ve08RbHiK6RnFaLk+CSNCbLwRTsH+3epZ9O
	LFyPc8i0r2fsiUZrAaFoEsHrMloXN9JV3S4UpHQQAea4qpkT/OiN1SSK0J9sNLDnPLvc3rSMNY1
	S7JOvSiNx5Tc3nd+9SaxItv5Ti5d3DDdKzRZgKmP69H4+LXhY7abVAGaTlMV20VrS+qXZnPWPtb
	CT95n3wJcaZ5Lqd/5qF0MxJ5e7jr5CpCEN6QJoIsPpg+J+/C2MErCpnnafXQ6SCBP6cl8M6RBtc
	gnDBt90Ok8UiKSPTCxRCnmLP5RCnaD4Mrjt3x4cK3MfvEhS8lC+Cl7sQGYrXNHNco4KE1imbI42
	kJJmmOSh2+MzsSjMD/JgA70q06AgbZEDAmBSSo3nK8b8QuJ7PtrGz3NFmLOvIlTgxU8zg2k6W4M
	j0yCmt+y5QQPvNk4Jgl+JNFzGvpOJL3kJMiupsbiGjyUnalyJXYTNbezRjz5FsoJTGhBm8vn8r8
	MnOqRwEZK9qiH0F0rXl6Q9CM208Qx6pM=
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr2759606e0c.2.1794495636101;
        Thu, 12 Nov 2026 07:00:36 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3243e30fsm81430e0c.9.2026.11.12.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:00:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 10:00:34 -0500
Message-Id: <DMTBM1N2LO8K.2LXV0IVP9ZSI@soleen.com>
Cc: "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chen Pei" <cp0613@linux.alibaba.com>, "George
 Guo" <guodongtai@kylinos.cn>, "Kexin Liu" <liukexin@kylinos.cn>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Sourabh Jain" <sourabhjain@linux.ibm.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH v3 5/5] kho: docs: update description of bootmem regions
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>

On Thu Nov 12, 2026 at 5:38 AM EST, Mike Rapoport (Microsoft) wrote:
> The description of the boot memory regions does not mention the low
> memory region and claims there is always a region per node plus a global
> region, while the low memory and the global regions are not allocated
> when they would be empty.
>
> List all types of the boot memory regions and describe when they are not
> allocated.
>
> While on it, fix grammar and split the description of the regions size
> and of the CMA usage into separate paragraphs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  Documentation/core-api/kho/index.rst | 31 ++++++++++++++++++++----------=
-
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-ap=
i/kho/index.rst
> index e78a2bbe2be1d..ce2bf9cf66514 100644
> --- a/Documentation/core-api/kho/index.rst
> +++ b/Documentation/core-api/kho/index.rst
> @@ -52,17 +52,26 @@ allocations before during boot up to the initializati=
on of the page allocator.
> =20
>  We guarantee that we always have such regions through the boot memory re=
gions:
>  On first boot KHO allocates several physically contiguous memory regions=
. Since
> -after kexec these regions will be used by early memory allocations, ther=
e is a
> -boot memory region per NUMA node plus a boot memory region to satisfy
> -allocations requests that do not require particular NUMA node assignment=
. By
> -default, size of the boot memory region is calculated based on amount of=
 memory
> -allocated during boot. The ``kho_bootmem`` kernel command line option ma=
y be
> -used to explicitly define size of the boot memory regions. The boot memo=
ry
> -regions are declared as CMA when page allocator is initialized so that t=
heir
> -memory can be used during system lifetime. CMA gives us the guarantee th=
at no
> -handover pages land in that region, because handover pages must be at a =
static
> -physical memory location and CMA enforces that only movable pages can be=
 located
> -inside.
> +after kexec these regions will be used by early memory allocations, ther=
e are
> +several types of such regions to ensure that all boot-time allocations w=
ork:
> +
> +* a low memory region for allocations below ``ARCH_LOW_ADDRESS_LIMIT``
> +* a region per NUMA node
> +* a global region for allocations that do not require a particular NUMA =
node
> +
> +Regions that would be empty are not allocated. For example, there is no =
low
> +memory region when ``ARCH_LOW_ADDRESS_LIMIT`` covers all memory, and the=
re is
> +no global region when ``CONFIG_NUMA`` is disabled.
> +
> +By default, the size of the boot memory regions is calculated based on t=
he
> +amount of memory allocated during boot. The ``kho_bootmem`` kernel comma=
nd line
> +option may be used to explicitly define the size of the boot memory regi=
ons.
> +
> +The boot memory regions are declared as CMA when the page allocator is
> +initialized so that their memory can be used during system lifetime. CMA=
 gives
> +us the guarantee that no handover pages land in that region, because han=
dover
> +pages must be at a static physical memory location and CMA enforces that=
 only
> +movable pages can be located inside.
> =20
>  After KHO kexec, we ignore the ``kho_bootmem`` kernel command line optio=
n and
>  instead reuse the exact same region that was originally allocated. This =
allows

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>=20

--=20
Pasha

