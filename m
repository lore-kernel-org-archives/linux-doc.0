Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590556;
	b=CigFOLXOb4SFBkCtk+8jnTKJ3lF6VT64Bjds4kR20hNkY2B2cD7XctS1o3iaWhfaIIXX
	 BEtIGquwUkAQ9ukE3k9jGkP2jHzSjcCeG6cAigwDjxrvlvFbFTYarHZ1TjlIPuvytLnNH
	 agy0xcikYcIFWMV/fS/dukSZneLEgO/5bQEva08foVy/HPFn04Is7DIR/J4esArKY51nt
	 jmfnQ3bhCM0eLx72eMu3NJDCDYwxrA0aVRLDBCjE6tExMOBSLzELdwZyYA9iT7tPWAGor
	 67+3j4JCvaIO1jG6o0HYDfCIvZEIPSryxTzg7NLKiD1d51DKyOukOFU1q4RSsA2XoPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590556;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
	b=d405BbRI0c/Wdvv/VWg3sOoFMEPxwLdPNdZWmjy89XvGA197ICcxuhOr+36eP/p/8glE
	 MgWElKQ2wFy7x77LOs3of6SvPR5/HxUDiiim5cWG//8L6LF4tJrvjJYZgjVSvCoJKLfZM
	 SOolJqr5s2yLIaoG3dhN+Bq7HWYWA/Cg64j9jkDLVpPMliwhJzz07ZHucbPFl7nF89jm0
	 cExXWvRbvNA34/YC8Bwi6TV+dfKnmrrDfxd8uMo+nDKx37MLe1aX2j/WzFISR2rN8jHcJ
	 TTkgNbwfMY6O97u5pw1zToWjou3IIJE0Q1BOTGFNphGnlkxsti7N5eo4OXTPwYdelSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=an7qNshc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qXmGz5yr;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68625606B379
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68625606B379
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=an7qNshc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qXmGz5yr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
	b=an7qNshcty32otm5qc6CSPxErGcMnyUYWXQa8X2t7Wm7rmmS2RBjZ9GNdTNRIwjpIF8iAb
	UlezVmtgYquLGDTsS8QBdBAOiVnfOwFYZepup5h9hTPFUvP5uKAcP4efq2CvLNy2InrgLl
	VZC3e6d68eeiNBko8aMNA31HguofSvw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595--V9kM6snPje6dNV_v85muw-1; Fri, 13 Nov 2026 12:22:34 -0500
X-MC-Unique: -V9kM6snPje6dNV_v85muw-1
X-Mimecast-MFC-AGG-ID: -V9kM6snPje6dNV_v85muw_1794590553
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee04c49451so18790745ad.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590553; x=1795195353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
        b=qXmGz5yr9pHv4tTSpC58k+rWs53N4pUlkZjYvaIZ1egIj0YUNFoOF0Q0sNNJTdpMUX
         ixhfuM9a2c6J29rolLc7APuG+6qtFoDviJO9YmoliwG8Yqt5vTiLBgyBGIm3Ensog3Ru
         nmNHoOBnZzcD121DUbYrTGyijQofVxcNlBwIEUVHhcmXUhnCuK0CAyxgR2iYyee+ljg5
         Ou0rhvabqmruMVAyaIR4haauLRBp5rGpHHRWhN4C2jC1KHjZZjwSjUUaijYy2/kMfVp+
         Cx8G2V0vMqv3dQwMLZOOKP9tP0yfon29TPoUzr3Ld7m5NZvdifIiLugexTQtav6hrwHP
         Oa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590553; x=1795195353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z43uFM3Pjo7vfGW2mID+1SupLltnf5Xt8DNDDQTTcdI=;
        b=TW9EzPkErBGGHueGAORMv3zjky7EmbBTjL/M5x9fpyA8k2TtaWRUT96dWWvzDb9HPw
         iv+UsU8dP95l59HuK+SxNROKf0gTLvMDQCCBQ4RhXgQnmMAoK4S4xo1DE2Z8GVpspYe7
         bRi5tLrAcrS5vvydwhQa+LIlrvVddp3iYO8VT5und2Mpo0rprkGUGgeqsqA7cbQ9Mbge
         W8vSW7sl+re7gTiFHd1wOEo+f/TZ29O8lsuzfj43Pqod71P6jg4ox2wq7CRs2BtcxtF5
         rnVlRxNfBZd9F3/VTWOgg8kzQDWX0DAq/ixGgLxS50UdY2zl+cNrzaRTumRQLRsuC5l4
         +vtA==
X-Forwarded-Encrypted: i=1; AL+hErFjZ/F9Nb4HgiS/TufYZfiy39gj3D4z2GkhlRqyLbi4DPLXVJOcZ4in1XXxHHYBLPMRqu4dxG021L4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FjMuz0oqfquqIts8ROiprClOOvyXk2xLhwE7wmtfiyOR/qmc3
	afp0Z1wFiVD/RE/KJ4iK9/bPcB2gaSC9kuh6KpUcUMXYG4XNKz+t7p5VKMPHweBCuRBAYFKhqgl
	Tr6kw7gU1bcHPLaym04lbG4iig9shwwdBLGpJGBD3qP0mGxSkoRlfIBcsWe0XMA==
X-Gm-Gg: AYBFou3l64H6EZcCdYMRc0euaj/WZF+urgr3yf0tx6RCpmh2D26lMmrP8qrd53x+jUX
	TK2ltQoNEpsNn+EFkORDzTWN4yfGasFrx+ioXr4t32whImLAnfuDtvO0sy+m4ifcN518+BCA7iA
	+3jzFY5IImecIBIaYZ81FTNUPF7/39SMELLIZatJI1OyKmypGzS5kZ7MK54HAHiMpU6oXi1nP/M
	ALh8k5NQe9lB4QD7KuEjzHljXfwZnt+4BF1PYHAUY8kvlEGFu+zzMn7DSIVL+hWl6Et+dgy4RhH
	t39o2P+Pouaj5JRu1Pbh8bIuc3OlrsDZ6/OpDAjJmfzRfmER9aT4NlqCF1N0PR8avvHc44QAjDu
	01bU/g9jDHa2aE9TyjISmsI7qJZS0vAcTmDS6DIbLJJDgKKk46txa7MlNTI1GML7sgSYQeos=
X-Received: by 2002:a17:902:d550:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2ee0d6654a8mr33241605ad.1.1794590552889;
        Fri, 13 Nov 2026 09:22:32 -0800 (PST)
X-Received: by 2002:a17:902:d550:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2ee0d6654a8mr33241305ad.1.1794590552278;
        Fri, 13 Nov 2026 09:22:32 -0800 (PST)
Received: from [192.168.1.102] ([117.245.168.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f809867sm14050805ad.41.2026.11.13.09.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:22:31 -0800 (PST)
Message-ID: <9eac28b2-1931-434a-ad06-ceddf34869f1@redhat.com>
Date: Fri, 13 Nov 2026 22:52:24 +0530
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] kho: docs: update description of bootmem regions
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/11/26 4:08 pm, Mike Rapoport (Microsoft) wrote:
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
>  Documentation/core-api/kho/index.rst | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
> index e78a2bbe2be1d..ce2bf9cf66514 100644
> --- a/Documentation/core-api/kho/index.rst
> +++ b/Documentation/core-api/kho/index.rst
> @@ -52,17 +52,26 @@ allocations before during boot up to the initialization of the page allocator.
>  
>  We guarantee that we always have such regions through the boot memory regions:
>  On first boot KHO allocates several physically contiguous memory regions. Since
> -after kexec these regions will be used by early memory allocations, there is a
> -boot memory region per NUMA node plus a boot memory region to satisfy
> -allocations requests that do not require particular NUMA node assignment. By
> -default, size of the boot memory region is calculated based on amount of memory
> -allocated during boot. The ``kho_bootmem`` kernel command line option may be
> -used to explicitly define size of the boot memory regions. The boot memory
> -regions are declared as CMA when page allocator is initialized so that their
> -memory can be used during system lifetime. CMA gives us the guarantee that no
> -handover pages land in that region, because handover pages must be at a static
> -physical memory location and CMA enforces that only movable pages can be located
> -inside.
> +after kexec these regions will be used by early memory allocations, there are
> +several types of such regions to ensure that all boot-time allocations work:
> +
> +* a low memory region for allocations below ``ARCH_LOW_ADDRESS_LIMIT``
> +* a region per NUMA node
> +* a global region for allocations that do not require a particular NUMA node
> +
> +Regions that would be empty are not allocated. For example, there is no low
> +memory region when ``ARCH_LOW_ADDRESS_LIMIT`` covers all memory, and there is
> +no global region when ``CONFIG_NUMA`` is disabled.
> +
> +By default, the size of the boot memory regions is calculated based on the
> +amount of memory allocated during boot. The ``kho_bootmem`` kernel command line
> +option may be used to explicitly define the size of the boot memory regions.
> +
> +The boot memory regions are declared as CMA when the page allocator is
> +initialized so that their memory can be used during system lifetime. CMA gives
> +us the guarantee that no handover pages land in that region, because handover
> +pages must be at a static physical memory location and CMA enforces that only
> +movable pages can be located inside.
>  
>  After KHO kexec, we ignore the ``kho_bootmem`` kernel command line option and
>  instead reuse the exact same region that was originally allocated. This allows
> 
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

-- 
Regards,
Mukesh Pilaniya

