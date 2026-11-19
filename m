Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100071;
	b=szbf9elBQOpI8urWgP6D3agMkXu6p6qeFyiQdSO9u9+Bjo1/VpBgC1YcSVRL2icUjNUU
	 xpMRsa5OvOGU2lfA/VEl06OGK1Ho3t0lDWk5wqu2FyRC9FocX6t6lSxwi08W8KUD5Ihap
	 abC46fm9M6e38bIFNO98f33D7cq4F8pIrPbVvs1zak2Prp9MnKZq+9V7+A3ZYQ4FUOJtn
	 mNrIKcI8Pkz2PGN35cIWaJTIh9ZOxk+5ApGQoRwwHjbdM9dYjZcCCZTN9TFjy2B8Le+0l
	 BaiizClVBn+/zH1N3zAlsll95TA+Cn0vE8UZXRq7lO6GdvDNKSm4EmO+zJe5GPqhZmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
	b=ZXjQ3FTXxnCjBTOTpe8rphQr1+dSHsCWrqfm6eLoHVoxs5EgCuZgN9zIyeIXUAUkgbMw
	 /VMZiurIewFNx6otWK2wJ+OMQfzyR6Qgtwp/qaVMhk35tXC0jtMvQzdzrcKvXj5aGUvOT
	 r3dCt7AlhctPgjxlEBvh8+CYykkS/tfRMb9tqZrDWoAxqo4/1xJ+ELAwyo73oUsN+hmDH
	 E4XlQy/MH2ycMJ3qxxyY90b5VyPU+KIDKft3K2JCeriXCaX5gYWOenxkCKmOfox1xOADN
	 upne8blzddJPVvODwBZiEsoFWlFtjVKaNtal/T01SJ8UjtqJPksqvgsHgVEj2vR9aOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6LPAIeX;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADD606A335
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00ADD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6LPAIeX
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f3c616c84so208767985a.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 06:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795100069; x=1795704869; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
        b=I6LPAIeX+5AEjUj2jih1ACvF7QNbKEZSSWEQHvV1cx+j9LvgW93X3qemhuduWcn0D3
         wzjjkTCPSi8Rgf0iuqK8xc8hJddhWoVNo21OQxjCP7w+/nVX/0sSFgNp6T16VosZ8l8m
         HAxC3NLC6MhIkDBmbKV8klY8QvYuZ/Xb43ZoIKvvEvWWV6qHPqKqKpSCN1Va6vVqIQ/u
         honQkjaTAMAdsC3ea9n10KbyFizCpOLDvHQAp3NtIUNsuoQsfY2rOKBvBaTmm6gqubgm
         nGFTgPM6LG7FI1IqREsQ43EHzZnUjXfjfvYzru7SjxiKuf1M/4sgL6+m4kdJklSo01+f
         Zypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100069; x=1795704869;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
        b=sVxlh5LCEgyEfPocuEEEusPAzDv38PJqzVukInDhrvcMaOElK2dqf+X1w9yRwjUc5o
         7rK9FRbg/JG14biwJw7VarTCFsPAD7NBwAVxKKSlQ494ri1djSBkUBcv9o5lvFZogRzV
         uCOpd06fBApy33KHaAcjXuEyu4dLT0lpjtVPin98cQHNkc82C0jPf4hPpGM9U1UHIoGb
         A6s1BjGG92sGAQ41GFN6WXEB3E+n65Id27sjHqadPs+bu6Vx4zzHSMCwLTh4+0AT4yae
         vQ+Ud4hNiwmsA244kG6JMgkvWpSgG8RHU3b4dsBWOzkaAQjJbEV572uO76VrNYvChSDP
         o+9w==
X-Forwarded-Encrypted: i=1; AL+hErGnJo+Pjbh/l1/W0Jhrb0UtFZ5CbInQiS0c0NiL9TD+lFYwaUOffqx0EswF3OfCnI9ZSKslNJ5Gcf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0Obq/pESaOrX+Y1OQuf7pHFDK1V8Iq3HO+hQO06t6WfRhBGBS
	/UwGtINJboWKNJ9+7XdxEjio98dNydmqizwBNGBlrD3UEGOPTolV5A2pkFrAbU8pE2E=
X-Gm-Gg: AYBFou3uUTTyvgqH2eRcPtRwBtWSx1JA2MC6xxzuRu5rxNw319PH2qOxZPz1LZx+uZv
	Gwcy2LlTf7k6sxoeVvlv+Hq845WLlgvNUI8us5ZoPzkoTE76waIz+EuDXEYI5OjRZ6TCQfaUBFe
	j/IpstjqIwEVFr0zc+62MOsm7n85VshappdQUZ5qAvbQrkHIYEeYR7GubcRprU5uYRqRxyU6y8v
	F1WtksMtWZ8l9FsyoBSnJ8MTPqh0kXbsq2xYCuVCqghQILoh2B30PmITwwqpza/7TqDoTpg0fZn
	zmJUAdUXmNxVZydfJVJdCz18FLsw8u6Iy5EwQ9E1WwMxlXafyKa3kgl3wDxp1CKvMkbm+O2l7ZF
	pk3iFrkqe9l3pJClgllYMHwcgNLtw1Cf5uFp8Ha4j8aQte3wjq/mJeP1VPkMZM8ygvyZ6NK8ls1
	iN+Nn0sTkHMRfURMc1FA1y5cNZpoSRQbY4HoFtzH6+DosN2ydH434zIoOn8jmIbwlWxpRXwB8nO
	SAaNE4/oTFAg1Q5cjZ3aXeNoaeZY+e0T3cIjSaxGOEo8D3e0Di+vezieht0UDManV8yp87gwfaM
	NFrb6YCIqpY44V0R0tRsLkm7jK9TFI6QBjke9qfWA+uouid8PpRdw5vT2Qx15/gZPOw5HyHcOav
	ktRONafQFEkRf2xBQ5nqoP68f0lzcBHQ=
X-Received: by 2002:a05:620a:6e84:20b0:949:a7d0:e6b4 with SMTP id af79cd13be357-949a7d0e7f1mr416234385a.51.1795100068869;
        Thu, 19 Nov 2026 06:54:28 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9a5370dsm10296885a.23.2026.11.19.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:54:28 -0800 (PST)
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
Date: Thu, 19 Nov 2026 09:54:27 -0500
Message-Id: <DMZ9V6MU9XNZ.3J23SCKTSDHB@soleen.com>
To: "Chris Down" <chris@chrisdown.name>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>
Cc: "Breno Leitao" <leitao@debian.org>, "Alexander Graf" <graf@amazon.com>,
 "Baoquan He" <baoquan.he@linux.dev>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, <kexec@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
 kexec
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <cover.1794383544.git.chris@chrisdown.name>
 <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
In-Reply-To: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>

On Wed Nov 11, 2026 at 2:52 AM EST, Chris Down wrote:
> After a KHO kexec, the new kernel keeps the page holding the previous
> kernel's kexec metadata reserved for as long as it runs. It only needs
> the page once, since kho_in_kexec_metadata() copies the previous release
> and the kexec count out of it at boot, and nothing reads it again.
>
> Free it with kho_restore_free() once copying is complete.
>
> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  Documentation/admin-guide/mm/kho.rst |  4 +++-
>  kernel/liveupdate/kexec_handover.c   | 10 +++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-g=
uide/mm/kho.rst
> index 902d171a780a..f9d2cc5999ee 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -120,4 +120,6 @@ stabilized.
> =20
>  ``/sys/kernel/debug/kho/in/sub_fdts/``
>      Similar to ``kho/out/sub_fdts/``, but contains sub blobs
> -    of KHO producers passed from the old kernel.
> +    of KHO producers passed from the old kernel. A blob disappears
> +    once the kernel has read and freed it, as ``kexec-metadata`` does
> +    during boot.
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index eeec298aa9d6..3046b89e5db4 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1808,6 +1808,9 @@ static void __init kho_in_kexec_metadata(void)
> =20
>  	pr_info("exec from: %s (count %u)\n",
>  		kho_in.previous_release, kho_in.kexec_count);
> +
> +	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
> +	kho_restore_free(metadata);
>  }
> =20
>  /*
> @@ -1885,14 +1888,15 @@ static __init int kho_init(void)
>  	if (err)
>  		goto err_free_fdt;
> =20
> +	if (fdt)
> +		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +
>  	err =3D kho_kexec_metadata_init(fdt);
>  	if (err)
>  		goto err_free_fdt;
> =20
> -	if (fdt) {
> -		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +	if (fdt)
>  		return 0;
> -	}

This re-ordering can be removed, now that we applied:
https://lore.kernel.org/all/179508700586.361583.12491114908870226409.b4-ty@=
b4/

> =20
>  	for (int i =3D 0; i < kho_bootmem_cnt; i++) {
>  		unsigned long base_pfn =3D PHYS_PFN(kho_bootmem[i].addr);





--=20
Pasha

