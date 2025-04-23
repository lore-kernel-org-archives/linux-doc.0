Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14B139566
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441951; cv=none; b=qI5yFADK0zJweRog1voT8nUdsyByYVsUiIhrHjfxbZAtIIg1NVxRQMPNUg46hTkpCysVXtNNdVmm5LQ7LX0E5YXnOZxF0WqxWajee/B2Zlt1ATmktqGIFFIWHlnydQZnIRWOQUqO4V5ouR4M36y5BvgOLe/XIIMAIfH1lt43SOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441951; c=relaxed/simple;
	bh=pZjRj+FNkJ75G+DRq94pEn+eARqdISny+XwLAQ6jwr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbQkYf1NWJUVuL3+mlbuiUVd7ooNA4HZcAycKbv0dJFtHEsR20SH8F0bsK1WbmeFmQSeqdNfja50+5Y2BmAQ4iDzTBMxCX9g4Ps17/I1lXALdmQzESA8rm8B/XaYNLPD8V2e26mRR3Af05BEMqXnlbYw4rLKheIwHN5WuL9xut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com; spf=pass smtp.mailfrom=clever-cloud.com; dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b=DnmB9Q1t; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b="DnmB9Q1t"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1047955f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clever-cloud.com; s=google; t=1745441948; x=1746046748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8rBmkOf4aIvYi3I8FgBy0awmrD8H509/EVP5Ei1ytI=;
        b=DnmB9Q1tq95RlHPzbiD7g5YEneg2BxCa3N0QG3F5aOUyMDPgA4EP2aCl/3x1anF2AG
         8qKmTH4NTmj2+c0PvKd6y4hEApV9Lo+MbvBPjykBjuaBSPzouE4EPRfEB+io6cOGvqf4
         WO4PgUmhQM3XFsl3ErynO7DVSxm/ECEpr7b81DTf1OTCNcXpii1t+1KDhBTJIjWWcorx
         F8KAu0MeBTHmuNGDGDAJXByRODNGb1NQmicc/ydoGY+v/c5CJqUagjUcDtTX8/VXojwb
         RoqEL9NcDeiLdqZ2S4GzZBw1FQFwJ5FxCiVvLMX8PcD9FRxA4yaGrkq5wEQbd+qyos/j
         pwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441948; x=1746046748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8rBmkOf4aIvYi3I8FgBy0awmrD8H509/EVP5Ei1ytI=;
        b=HN4LEF6Sjhd3IEGaQlBWAcZoAF1PchNg6dMgSFqLbMbz+qKvf5K+GAf/Z31In6bvlx
         gd5O8/rTTv8nqvWsZyHLyDgJ7g4PsMaSFr4GeEalBf+KqvWDgfMAJkFDNa2Bar15T8Eq
         Ce6nFHMIIVp2Sr4g5BX5DVe7MpVdNFES2JqJjE7qW7vwiSO3V8ij8jXxJy8UsQ1GOw/X
         UcDBp1583K5jsEv/BK2zWbegbqrK0LQ8ez0cIn3fsePonK/pnMPoyxt1DL3c5YagBRAz
         /a6Kr4rMSAQtBxrKJlinbu4LPmOROQd7392af0ZTBc+lNhMnoWIZQTuySo+UMI62DVi5
         1wkA==
X-Forwarded-Encrypted: i=1; AJvYcCXSWvzufDPSpFSC67L+0bcyu6gPsY7dd5lMF3P1EtfRNcY9SXCGScN/8VVhATe18+ZjFOVX6JStoro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU7n6nGoGgfL6UXHncAlW68m2sTSGL7tV7P3uwpVxl1Uv+drPA
	q9A9v+LHOB70ZWxXJJXbZzd96x26Q6f8uv5c4T0nvJnT0jCh//prtzfHz36bNv8=
X-Gm-Gg: ASbGncvhLo/k5FA8DLqaa+v2MBqEsT9qN4z82uP0FauRFW6I05rA5qM8Utvb6rgYizw
	1ZgHDd54gXAjjFrti8tXNQKob2KiMrEQYIedlIyhvMQK+Ds3dqzRZYWx7ot+ifZkhoeaCHGnnpj
	T4O7TnayYbSRkeNizs8+wg18zOJslD/yheMkJ0wpy+c3slogGCpdGTyQN595NhlDqKt/x9Pfpw9
	iN5fqZ0c0/+3kOEXS8kg3wpO6qdyV0+AsQxUMNaWT7PMJKaicnTpJghAyF6N9KDam1w3PRKatX+
	b4PRqIiSNvUOMV/yjjjOMGsU5sBOBxn2NkobUH5mLiShPHNh3OFcf+KC
X-Google-Smtp-Source: AGHT+IEC8NhWZ4nFelT85eBp6fi4TvPQ6Kzx7d5h/Km9A9mjgSdikufYzNisns3RJyMikFxJ1y2KBQ==
X-Received: by 2002:a5d:5f4e:0:b0:39c:12ce:1112 with SMTP id ffacd0b85a97d-3a06ced244emr13792f8f.21.1745441947688;
        Wed, 23 Apr 2025 13:59:07 -0700 (PDT)
Received: from exherswag ([2a01:e34:ec5f:fb40:df48:ecab:7887:deaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm19625573f8f.80.2025.04.23.13.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:59:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 22:59:06 +0200
From: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 6/7] x86/crash: pass dm crypt keys to kdump kernel
Message-ID: <fa6uyhukjfjgteptdpud6wd6w7yin466p3tp6rdxwbsuqgkfdc@jwgf5ztb2ni7>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-7-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250207080818.129165-7-coxu@redhat.com>

>diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>index 68530fad05f7..5604a5109858 100644
>--- a/arch/x86/kernel/kexec-bzimage64.c
>+++ b/arch/x86/kernel/kexec-bzimage64.c
>@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
> 	if (image->type == KEXEC_TYPE_CRASH) {
> 		len = sprintf(cmdline_ptr,
> 			"elfcorehdr=0x%lx ", image->elf_load_addr);
>+
>+		if (image->dm_crypt_keys_addr != 0)
>+			len += sprintf(cmdline_ptr + len,
>+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);
> 	}
> 	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
> 	cmdline_len += len;

You are adding another kernel parameter but I believe without taking its
length into account. See the MAX_ELFCOREHDR_STR_LEN constant which is added to the
params_cmdline_sz variable for the elfcorehdr= parameter.

This will (at least during my tests) truncate the cmdline given to the crash kernel because
the next section (efi_map_offset) will have an offset starting inside the cmdline section
and it might overwrite the end of it:

kexec-bzimage64.c:480:
params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
			MAX_ELFCOREHDR_STR_LEN; <<< Should have + 31 here for "dmcryptkeys=0x<ptr> "
params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
			sizeof(struct setup_data) +
			sizeof(struct efi_setup_data) +
			sizeof(struct setup_data) +
			RNG_SEED_LENGTH;

And I believe the buffer might be too small.

Also, there is another check a few lines above that needs to take the size into account:

/*
  * In case of crash dump, we will append elfcorehdr=<addr> to
  * command line. Make sure it does not overflow
  */
if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
	pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
	return ERR_PTR(-EINVAL);
}
