Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF9B1411DE
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024512; cv=none; b=VPOFq4R5UCOXzrwY8EQA9x0ONCjCs4z5RDjxI+vv3mM1qNctQMTc6to/SFWWX6+AKcV5KTAB6BQUGFwY1CayBO+NuISe6/a6WjypBEQxFuzaic3VjhhZvurioF9gCnprBiPeFAsh1X0ExvLvZ+e18gV8eP9fXp2W26DUaffxViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024512; c=relaxed/simple;
	bh=0YMTewUxt0SnaozREI5ztxaCqTcluXt169MXZrYO5cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP7aXVTM+Oa8Jmbq6dQQPIwHH2PPjQ0TJ9JGkjeKihiy1AXXMBMSLFgA33qIkSCjZHINGr+gHUTJbmt1iT46xM8f1wXQHcTJy1hqDfTm03MP1GSqs8xguimM5OE/7/grvEGnHTwBL0JAVXDcKLE6s2Sj5WdG31k/Q5GexM9xAg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com; spf=pass smtp.mailfrom=clever-cloud.com; dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b=V4n7HS07; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b="V4n7HS07"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf848528aso53033815e9.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clever-cloud.com; s=google; t=1746024508; x=1746629308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBafi4wy61at6m9m8dlEpfvo5N42mzCjz/Tvd2WuLBw=;
        b=V4n7HS07aFCNP3uFLurPuivJxv69SZkN64bkMtWuHm7YUzce4gRZI/Of8hC0H8CS6R
         ZETdGcAAvzLDCQhz9Wq84d2nDrhhQB5ZDOZT7quCMeksV6zv1nPI6vOZH7Ku++RfUNWe
         Q+vOOIMTQAwef6MFOfE02eKghMujGDFO/AldEr25/EzX0TnVGyBWMAHtdY+De+aZkk4o
         7amCklZLvecjktJa9kR4IofmgKef2JhPrqUmy7p5ML8Vs4hQgmM1N6s94kgE1X+VB3eR
         DticwP88T/VdfsNE8AdyWOPXT7+aXZLqXouSWS0br5I7/xg6pzRouNUsImOe619/D+zP
         /kWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024508; x=1746629308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBafi4wy61at6m9m8dlEpfvo5N42mzCjz/Tvd2WuLBw=;
        b=V7thoCdf5Zy0Em/G0k3g1ATkyhHycg7FcTwNtt4UV9yUrljKg23R5RiMl7pIFB6cBN
         gsQ0oUm7j2Uor0oeM1joudFf7Imn2oTQMxImfJeS14SWdIzjGOhTnTDQ4uAEjMux+/yw
         uxaVFj3keOLKYDSooPiUzowErWR3ANYk35dsDNT6PJAH7mEyQ8VSTQne0wOvAh2H6izc
         OpEQpxT1r31Y5fRwLxB0P6pEEx/WRPQxZckCsS400h7brOqzq4USb/KQO9+QuVn2Df7z
         Q/Isj70prvvIV6KooJM43fv/nhAYTydscaOKDTzkuEURq3q0XMg7uwFRzAPF6afXqnZn
         IwTA==
X-Forwarded-Encrypted: i=1; AJvYcCXxZRZqfHW79StH+HOu9iofL9C3xVzxixw8vNbLafWAIg92bOE1esfZkVvhxoqmb/ebIRm87nCFi+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBzXQib3SmLExu26xwXHYx8uEKkh109d53KMeT/fTc0zvJV9B
	gvfgROPg0u1SpOA2U3tfdwBO487g+bfig2TrNQZMJ3BPIIHaM+dzDvcWcU25hLA=
X-Gm-Gg: ASbGncs67ur1gTXPOlx9D2lBUyXGarI7Ap3GCycAhsyzwu7iL+FBhnuhJMzAULGTlxm
	3n4go8lBAKqB6rQoeUUjAelrKxIs6kbahOAYz1CYCUK6vNZH3cqwgSs08dEEGhdo4K8GtXmZSUl
	e0lOc22SauWKONkjN4zsMhyQZ9cQCy2RZL+C1XRSTdiMx27mdwFP09wz/G1RI9RFt+iVAbmWbGB
	mpHj7ybr5w2VWR27Bi/cleEOAMIqV7Rm4BsFQwIaGmhMNiaPcXd8Zjom6evSYj9pRa7MU3Rp4MS
	VNVIbLNUK9WZbBvv4rIvr52oAaPHaw2P4cUGTxg42Hs5aimn+YqVdqNyrdF0QS04FuHOc209BXL
	XJUy4sF95Me1ucHc8U7wXdrXdezxUoofeRlfsBYTjtN1z
X-Google-Smtp-Source: AGHT+IFM1f/VQjEUzanLgfNlKL8+eZe9frOBhk8fG9VNEkHSwxq81/XTCkO1SajflF9iftLCBa6EiA==
X-Received: by 2002:a05:600c:4e4d:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-441b1dfb252mr36438585e9.0.1746024508186;
        Wed, 30 Apr 2025 07:48:28 -0700 (PDT)
Received: from exherswag (2a01cb059441a4004633a140b8a72842.ipv6.abo.wanadoo.fr. [2a01:cb05:9441:a400:4633:a140:b8a7:2842])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a5fsm27740485e9.12.2025.04.30.07.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:48:27 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:48:25 +0200
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
Message-ID: <c2mqpzhtyrd5qzove5pa44ob2iiwdcrtnj655sozy2a4pprln7@mql5bjuwjbxs>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-7-coxu@redhat.com>
 <fa6uyhukjfjgteptdpud6wd6w7yin466p3tp6rdxwbsuqgkfdc@jwgf5ztb2ni7>
 <rwetpbjimryr7g7xmdmaeuwkdasyqdpejsy4sdee3kzlssm32s@5xnznwqa3ivm>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <rwetpbjimryr7g7xmdmaeuwkdasyqdpejsy4sdee3kzlssm32s@5xnznwqa3ivm>

On Tue, Apr 29, 2025 at 05:40:21PM +0800, Coiby Xu wrote:
>On Wed, Apr 23, 2025 at 10:59:06PM +0200, Arnaud Lefebvre wrote:
>>>diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>>>index 68530fad05f7..5604a5109858 100644
>>>--- a/arch/x86/kernel/kexec-bzimage64.c
>>>+++ b/arch/x86/kernel/kexec-bzimage64.c
>>>@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
>>>	if (image->type == KEXEC_TYPE_CRASH) {
>>>		len = sprintf(cmdline_ptr,
>>>			"elfcorehdr=0x%lx ", image->elf_load_addr);
>>>+
>>>+		if (image->dm_crypt_keys_addr != 0)
>>>+			len += sprintf(cmdline_ptr + len,
>>>+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);
>
>sprintf will return the length of dmcryptkey=xxx which will be added to
>len.
>
>>>	}
>>>	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
>>>	cmdline_len += len;
>
>Then cmdline_len will included the new len.

Yes, the cmdline_len is correct. No issue there.

>
>>
>>You are adding another kernel parameter but I believe without taking its
>>length into account. See the MAX_ELFCOREHDR_STR_LEN constant which is added to the
>>params_cmdline_sz variable for the elfcorehdr= parameter.
>
>Thanks for raising the concern! I believe this issue has already been
>took care of. Please check the above two inline comments:)
>

I'm sorry but I don't think it is. If you look at my comments below:

>
>>
>>This will (at least during my tests) truncate the cmdline given to the crash kernel because
>>the next section (efi_map_offset) will have an offset starting inside the cmdline section
>>and it might overwrite the end of it:
>>
>>kexec-bzimage64.c:480:
>>params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
>>			MAX_ELFCOREHDR_STR_LEN; <<< Should have + 31 here for "dmcryptkeys=0x<ptr> "
>>params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
>>kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
>>			sizeof(struct setup_data) +
>>			sizeof(struct efi_setup_data) +
>>			sizeof(struct setup_data) +
>>			RNG_SEED_LENGTH;
>>
>>And I believe the buffer might be too small.
>>
>>Also, there is another check a few lines above that needs to take the size into account:
>>
>>/*
>>* In case of crash dump, we will append elfcorehdr=<addr> to
>>* command line. Make sure it does not overflow
>>*/
>>if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
>>	pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
>>	return ERR_PTR(-EINVAL);
>>}
>>
>

To try to explain a bit more, we pass a lot of arguments to the crash kernel so
the initrd (dracut) can mount the encrypted disk. When I run kexec using
the following:

/usr/host/bin/kexec --debug --load-panic /linux-hv '--append=maxcpus=1
reset_devices rd.info rd.cc.kdump root=UUID=d039277c-2ee
3-466a-85eb-db9524398135 console=ttyS0 rd.timeout=10 rd.shell=1
rd.cc.kdump.encrypted
rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c260907a2447' --initrd
/crash-initrd

kexec debug print those logs:

<snip>
[   53.642483] kexec-bzImage64: Loaded purgatory at 0xb6ffb000
[   53.642828] kexec-bzImage64: Loaded boot_param, command line and misc at
0xb6ff9000 bufsz=0x12f0 memsz=0x2000
[   53.643366] kexec-bzImage64: Loaded 64bit kernel at 0xb1000000
bufsz=0x16a5000 memsz=0x550d000
[   53.643918] kexec-bzImage64: Loaded initrd at 0xaeb90000 bufsz=0x246f2a1
memsz=0x246f2a1
[   53.644363] kexec-bzImage64: Final command line is: elfcorehdr=0x77000000
dmcryptkeys=0xa81fc000 maxcpus=1 reset_devices rd.info rd.cc.kdump
root=UUID=d039277c-2ee3-466a-85eb-db9524398135  console=ttyS0 rd.timeout=10
rd.shell=1 rd.cc.kdump.encrypted
rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c260907a2447
<snip>

Here, we see the full command line, as expected. But when I trigger a panic
using `echo c > /proc/sysrq-trigger`, the first two lines of the crash kernel
loading are:

[    0.000000] Linux version 6.12.23+ (arnaud@exherbo) (gcc (GCC) 12.3.0, GNU ld
(GNU Binutils) 2.44) #4 SMP Wed Apr 30 16:11:39 CEST 2025
[    0.000000] Command line: elfcorehdr=0x77000000 dmcryptkeys=0x9ec14000
maxcpus=1 reset_devices rd.info rd.cc.kdump
root=UUID=d039277c-2ee3-466a-85eb-db9524398135 console=ttyS0 rd.timeout=10
rd.shell=1 rd.cc.kdump.encrypted
rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c26090

You can see some of it is truncated at the end. It's missing `7a2447`. This is
because I guess it gets overridden.

My comment above explains where and why it might happen. If I add the size of
the dmcryptkeys string length to the params_cmdline_sz variable, we should
allocate enough space to have it all. With the patch below, it works fine and I
get the full cmdline when my crash kernel boots:

[    0.000000] Linux version 6.12.23+ (arnaud@exherbo) (gcc (GCC) 12.3.0, GNU ld
(GNU Binutils) 2.44) #3 SMP Thu Apr 24 16:42:18 CEST 2025
[    0.000000] Command line: elfcorehdr=0x77000000 dmcryptkeys=0xa81fc000
maxcpus=1 reset_devices rd.info rd.cc.kdump
root=UUID=d039277c-2ee3-466a-85eb-db9524398135 console=ttyS0 rd.timeout=10
rd.shell=1 rd.cc.kdump.encrypted
rd.cc.kdump.device=UUID=908234b1-c1f3-4150-bfdf-c260907a2447
rd.cc.kdump.keyring=cryptsetup:908234b1-c1f3-4150-bfdf-c260907a2447


diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 5604a5109858..06fc1f412af4 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -27,6 +27,7 @@
  #include <asm/kexec-bzimage64.h>
  
  #define MAX_ELFCOREHDR_STR_LEN	30	/* elfcorehdr=0x<64bit-value> */
+#define MAX_DMCRYPTKEYS_STR_LEN 31
  
  /*
   * Defines lowest physical address for various segments. Not sure where
@@ -434,7 +435,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
  	 * In case of crash dump, we will append elfcorehdr=<addr> to
  	 * command line. Make sure it does not overflow
  	 */
-	if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
+	if (cmdline_len + MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN > header->cmdline_size) {
  		pr_err("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
  		return ERR_PTR(-EINVAL);
  	}
@@ -478,7 +479,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
  	 */
  	efi_map_sz = efi_get_runtime_map_size();
  	params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
-				MAX_ELFCOREHDR_STR_LEN;
+				MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN;
  	params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
  	kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
  				sizeof(struct setup_data) +


Let me know if it makes more sense!
