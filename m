Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438867;
	b=z0ipb4ZIwDgFapGfLX+meZC/a+he9fPKBITSP9JdskqAmiLz4StDzP6SxYpNRN/RbYgI
	 V/AF2zU9MKsUPdcPUgpq8h2+bTpe6dEeL6C2e/IcfaA5j0kfOa5Vefzuk6uG1OF2eJal8
	 ONNmu1Jd29VSEGw+5Dt+zcAkSzB9AVVDNsgUe6KwsNCHsYdhb8QRXHd7B2xvO0RRvr9qH
	 jNNAacILG0PkXWPnX/dGQxEgX9F0DF16HDN6Gn7em/4v6J6EDIJDfxwOEqvCaCNgktCZa
	 3s4faaIS/dVovVdOSzmz/LbHvej8ZGK0+ABSCbwyq45MP9ORmnXekuRJDqS/Rt3u7gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DVdMMVnHovVouauLZSJMD6AHtT5aNNb/DqiljF977ik=;
	b=zPKFPmP+Hr2jsmsk4LG1iKdELpcO2e9avDSpS/3NHXQK76ldct8i3sewOnUI/IEvxiA5
	 6RXfnJQXVl4hnnLUXAyrI4CoiTGrrE645yAIHraIcUiTU+JjpcsV5ptRjpcG0Xb+G2IRp
	 A+SdIrS8PHl2SPxjDFNGJwstQVT9Q/BdlS8sMlZs6MVSKTai0Slv1AsGqgsZ3TFcUTkWe
	 f1hEECPHVsnQwXIaqUOBRbvnoa6s5mpVv3GpxdtMeeSFpeESoTuWiyIFntXVCR0AazOLZ
	 Lh2zJMAInCMy/wCcX39npz2kNCrmwfOpSHrlsf4vQy0bJf7Lj3E+cY13QJNbLOBr8ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kvS0zyNs;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DC606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kvS0zyNs
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so1218821137.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794438866; x=1795043666; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVdMMVnHovVouauLZSJMD6AHtT5aNNb/DqiljF977ik=;
        b=kvS0zyNsproPmuwYK8MWJrWagwCI5gmQVIM8I77DyxzoKRCEVr74LTy06oE9xrvhQM
         A7I34wabPoA7Sd4vcWNCcTzJjpKya+viMI7eHt7LdyJnWEfM+i4EKYCc+nOxM2kszh16
         WXSUzesEiKPj/Vu86sC1ubMblHw7SICF0tA2j3PSrjUq7HLgsVnupJFDiurRnlwxBkFT
         wrN8ayxpTXyKTRbxy7GkKNXyYYGrLQ62JIiZVr/6a6Vuy86vTJG3mjHrIJPZVvVrLK3J
         7egRtcPqTRC4T+JK0YAPq22nJHpHXClMDwLxsK26QPbjJDlppFqm9L7tht8/eZ5V1ch7
         cBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794438866; x=1795043666;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVdMMVnHovVouauLZSJMD6AHtT5aNNb/DqiljF977ik=;
        b=ZB7Ts61RreV2bo0UNKDRjWDfbyR1niR7DE+eb0RzYyjupBuRq97sFVtdyPapNH0UCr
         yvms4MHywMtxGi0YMU1vDUjzmHgHckjM2SYZYknq3gPSD7yYkv7bdyKU35btCXNoX8dl
         RCPXYw5iR9aEeDAeuv5isErSb3Dm7XSdJXiwMEqOcNrh92C+ysfkBnCcJslSD7gbIgTU
         S6kybzBQRDjshqjNjMtQ5NHlNrzlIyTmlFZwGykAO7RmearNsklY2QXKWU3IVBWSCjkX
         EIDmtF2zM4kcMLgrdFzUcUuvAKWO1SIbpZjH9aeHJLiSGOpy1A5yGGLXMZgQSExQVuPr
         QgDw==
X-Forwarded-Encrypted: i=1; AL+hErGq5Xn0h5s6M+VBOQT0bmMcDyk0+IqGg5hZ7J91qdgzkw+7grf9GhYd1+Gr48z+o2txGuVj6Jcpj1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z99fZmpEanjB4YA1I+obMWgktREXxGEPtJtG8bdhxo9XcxMNdi5
	hJbLCvE7TGY3X5+fG5QGY9fgnbBrb4ef0q8PAx9vwo9D1BBcWLTwXXtIR5tMSRuNO6w=
X-Gm-Gg: AYBFou0khPPdzSa2WE79g4tRG513IClPtIj87BG0MnCwwnr+u5aMiOPTm89SBzy3B7p
	CNGxJ9JUrl8fJ6HqacmhRe74MOR3nB9sNknPgDVede6dtj4mvfZsTZJxSpwHXZjHAeY8UEoNjzO
	D4O7IOjFP0WDIb7leKLz34iyX5LYDI5uBvRA531AjLXAU2DkBiSoacfqrz9iFIBHP0MeHmWy8aS
	9Db7VAGNxhH8wNw77LjTCEZ8bbtQKYg17fa9Hn7wby7oIqQJS5RFeYREB1Fe3qNCrsbX0QjBSNe
	udXOjYGOZLVwHtEreJkXCCia7nDud4NlancCKPejRA1Z2l0IbOtYS/lq6PZpAhIKyU/17UvENpl
	GMk2rXODAiWEVjTHpwvy4o4sWaY63ZC0fSz7H+7yeZz81DnsxNsmSzfxPQ+oHtMQhqFfS1tYhhb
	7yu3tNzczhzYSWUAGl+0sacIK+bS7uJlUMstv0pu/5K23ZAjsXCIi0j+blrFnTHVeTxIhjiLhQu
	e6paBIApcxIOJFkXMcgi5ZhemxRV2j3ldkF0+fNVTVOnMyzXdw8raNgk/hiHZh3Bl8DvT6Yt9lT
	ArwmIMBFYyp584l9QaH/43TPanAUoYOoPhZ/Ux3T15ezxcr/yAxVRzXU+kKPsD0z6mktvMVviMy
	TuwmoF700FVUmX8VBIQ3ZZWNe/caCgkbt+4vmj4cTlzD3
X-Received: by 2002:a05:6102:5126:b0:7d2:7377:32db with SMTP id ada2fe7eead31-7d5060a7703mr1403477137.24.1794438865829;
        Wed, 11 Nov 2026 15:14:25 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c22302403sm4344200241.10.2026.11.11.15.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:14:25 -0800 (PST)
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
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
 monitoring
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@meta.com
In-Reply-To: <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
 <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
Date: Wed, 11 Nov 2026 18:14:22 -0500
Message-Id: <179443886218.2329176.10742245280418377061.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=9scWIMT8bcH1hJE5tzuaZbvTMzuuUTRWsydhjCoHQQ8=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq9PbPj7WdaeKNG/W4QNGLva9/0FB58zcLhfiDz
 D1uxgEKxc2JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavT2zwAKCRC7dyhM23N6
 3lFzEACWzSLOLHD1CYufzDO7hpK/ihqAdc830DtEx9ApghbfTfc1chnrI57/Wp2D9h7buNVVH45
 vnopS5ouz/fz6MCr1CLzZSlDrGgLZR5dCamAyBUTezBztIbRa8TcuC96hhwyPFxjLEdLW+NKjkp
 /qgGjQVOh7kd1VSE0obnNl+tVRoNL6cznEf+LKlobs40aMr6EqkNL654Zl9rdx1w9jor1+dj6nU
 SVEH/8uk2nvb6CFV70dA+aWyqVVWOJ2J6KtdOpTZPFofGAdDfeAhj7vyOPmcRUjvLjs/0rjq6yL
 B1PRB/UrzDRXrEwBO3Tx1t/T2M+v1u5MME0yEVugXvjpvWPFMLdZoGZmv0M42/e9uS6gjD3/9kp
 qwKDfUjqZpnelcj92WBqr5oycg1c9RqKoc+fqMyXJUcrZI1UAvnwEPzku4mXigZPnlq1RVnH66u
 /hCOahaJCjJObbeQzwGGNF/jlZMU1LPHOn8hryQG2VdTv0LdwyGH3wAoFY7dwMotlsBN3fiiaq5
 gLTvD+Ylxp9lmXxm7K1sivMmR5vGkUcohFKJ+kmiBYDPvL5R04L8owhQQiJuZe4i012L1tGFk99
 06tbJ14sWZItiw1bysAP3Gh/qrXB6ycrzrN45vbpceX0VcALyQPyEsYouSwcnWC/IZqDo6Cakcz
 8R+Ei1KWFz4evKA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> We want to use live update at Meta to upgrade hypervisors whose VMs
> can't be migrated away first. But this poses a problem: whether we can

Awesome.

> enable KHO on a class of host depends on how much memory it leaves
> available for unmovable allocations. In an early test, a 64 GiB host
> with hugetlb_cma=6G set aside about 30 GiB of bootmem, which the running
> kernel can only use for movable allocations.
> 
> The reservation varies with the kernel, memory size, NUMA layout and
> command line. Our fleet collector needs the actual size from each host
> so we can decide where to enable KHO and catch a kernel release that
> takes those hosts over their bootmem budget.

HM, that works for cold boot not for live update :-)

> 
> Today the collector would have to sum kho/out/bootmem_len in debugfs,
> which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
> to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma

Is this a different bug?

> count in /proc/zoneinfo includes bootmem after a cold boot but not after
> a KHO kexec. On an 8 GiB QEMU guest booted with
> kho_bootmem=32M,1536M,512M:
> 
>                 CmaTotal  CmaFree     zoneinfo cma (all zones)
>     cold boot   0 kB      2127872 kB  2129920 kB
>     KHO kexec   0 kB       881336 kB  0 kB
> 
> Even if bootmem becomes a CMA area, CmaTotal will still include other
> areas such as hugetlb CMA, so inferring the bootmem size is still
> error-prone.
> 
> Let's report the total bootmem reservation in bytes at
> /sys/kernel/kexec/kho_bootmem_size.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> index f59051b5d96d..80941a7d8a7c 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> @@ -59,3 +59,11 @@ Description:	read only
>  		to the crash (kdump) kernel. It lists the start and end physical
>  		addresses of CMA regions assigned for crashkernel use.
>  User:		kdump service
> +
> +What:		/sys/kernel/kexec/kho_bootmem_size

I have some concerns about exposing this as a stable API. What if we get 
rid of bootmem or make it resizable? We only recently renamed it from 
scratch to bootmem, and we have been exploring for way to optimize it.

I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for 
now, and not worry about it being stable.

> +Date:		Nov 2026
> +Contact:	kexec@lists.infradead.org
> +Description:	read only
> +		Total size of the KHO bootmem regions in bytes. Returns 0
> +		when KHO is disabled.
> +User:		system monitoring
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
> index f9d2cc5999ee..c329d720bf25 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -81,6 +81,15 @@ At scale, correlating crashes to the previous kernel version enables
>  faster root cause analysis when issues only occur in specific kernel
>  transition scenarios.
>  
> +sysfs Interfaces
> +================
> +
> +``/sys/kernel/kexec/kho_bootmem_size``
> +    Total size of the KHO bootmem regions in bytes, or 0 when KHO is
> +    disabled.
> +
> +See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
> +
>  debugfs Interfaces
>  ==================
>  
> diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
> index ef2b188c8ed0..736d51e79fd2 100644
> --- a/include/linux/kexec_handover.h
> +++ b/include/linux/kexec_handover.h
> @@ -40,6 +40,7 @@ void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t bootmem_phys,
>  		  u64 bootmem_len);
>  
>  bool kho_bootmem_overlap(phys_addr_t phys, size_t size);
> +phys_addr_t kho_bootmem_size(void);
>  
>  static inline enum migratetype kho_bootmem_migratetype(unsigned long pfn,
>  						       enum migratetype mt)
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index f4a31565c447..ed105e6351eb 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -13,6 +13,7 @@
>  #include <linux/slab.h>
>  #include <linux/fs.h>
>  #include <linux/kexec.h>
> +#include <linux/kexec_handover.h>
>  #include <linux/mutex.h>
>  #include <linux/list.h>
>  #include <linux/liveupdate.h>
> @@ -1324,6 +1325,15 @@ static struct kobj_attribute crash_elfcorehdr_size_attr = __ATTR_RO(crash_elfcor
>  #endif /* CONFIG_CRASH_HOTPLUG */
>  #endif /* CONFIG_CRASH_DUMP */
>  
> +#ifdef CONFIG_KEXEC_HANDOVER
> +static ssize_t kho_bootmem_size_show(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%llu\n", (unsigned long long)kho_bootmem_size());
> +}
> +static struct kobj_attribute kho_bootmem_size_attr = __ATTR_RO(kho_bootmem_size);
> +#endif

Keeping it together with the rest of KHO code would be better.

-- 
Pasha

