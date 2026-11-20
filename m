Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165837;
	b=iSmwv9pAPVH2MXcOQTyFqXgH1NP/0OMUWegzTknJXrMlh9ikR0u3ibODB0IDlAWq+SVx
	 Mw3aE+rNZQQ3pmzYKSvjOk++J2RVryr3bv5JkN7OoLSR3ZworD+yeiOmoiK5VhjOvPtwM
	 PHXcAG3fdGl8RufGJRvCg+E9tFO7j8HJt4j+4BPtdQRsBCLYSZKjVzhk9zVFlfuNpqmMW
	 lxCtBVErAktRwfRPG/2tnZt5JBKbkxxbGLJuMkO70TwsOBG5LY7iZRFb0XdVM7PoP+kCr
	 qLqoLep+2pnJQtVgAFQH2vUP10NCs+yfKZEuPEQHKwBDILmnncV7xE1MKy0/E/yFWBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DSSS9+Kfoc3mBii8TnSdmAyAnW6IkpsziMrkIvRl8EY=;
	b=w6yFMq6+MIftFbBA9OFJK1GTpJvLPBIBN78H6ViZPDAdPMXgYdD0hjMZ392lQA9syu5e
	 9DYfc1WmyQfnEcsw2+c9KPP5aDMK4ugK8q++5EVs7MU7jn850N3CU0aDnaInDW9U/2JoI
	 vcrdNBrv120AqTv2PR2ndGnj2tuy5T1wQnx1g9S0NJ41/89l/zff3O6GaksXHFDsX2kx5
	 FzCVVbYKkIQyIxZ6M1BuI6NsauQu6sVhYMgVP2XStUX8vCqOb4cySL+HJ0q7cDXjFkSiu
	 DdNFgh2/zbzbhvXefLTQv8oKh05h1105UMLCFXztOH7DZglHdSNFv3syeSoXsgulElg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NE7Gm+sN;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860B606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6860B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NE7Gm+sN
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so528292f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 01:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795165836; x=1795770636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSSS9+Kfoc3mBii8TnSdmAyAnW6IkpsziMrkIvRl8EY=;
        b=NE7Gm+sNDCoFDIhu5kQ8biWSURUgBl99wQeBaD/DGxuf5jNbr9GQ8WsqbkHHRF0Ex1
         FxijF5AICR796Q2woFKU7E5LnAP6h9SLne82bqWcOEojGc5oygQCZTpbnpQPhW/x/V3l
         k7llf4PMQF0WnvDNlXQYLfu6mB12uZIBSpjt2zhlpGsXkG0tiYGlZjJT+Qi7bL8Dr6Kg
         zWGVIbNbck4/VDmpkaYvY9mTq5dZ/jaK5y+vHG1OMewjpkWbMho/WMMkY68IhES2kPV3
         BJagtKeeZouoQRIZqrfNzVPbc9Qr5Fz9Vh/bFTa5rzL3dKohm1n9HvEcVYvYTQK2Nkh8
         9sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165836; x=1795770636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSSS9+Kfoc3mBii8TnSdmAyAnW6IkpsziMrkIvRl8EY=;
        b=YqJW6Wd8/SML4iIySLYJgkysfQ2vd8kyHW/00H3vbyu+amHRZ3mtxqOQlzQe8VG9Xj
         2kE0qlPdIF7HT0gidpgV1ev4Jr8ZDQ7iv+7WpHC2XzfMoopOH4UymqFRz7qsB226Jnjm
         qcrtAsJlZ7hGChRXA4zCPXLLNHiWempfBp7jWZJXQy0CwSjbKWHG4Ux2J5J8tfO1lu8h
         3YZY5KqyMKwceRLA/OFj7bfSr3Ur86/B1bKMIWJPaLz6VO6fTOh3+2WH5cHePa4RX3aG
         +vc5UPrp4MedJlB9Fy87UBUwNsPrvcJYvsR6KpUiZRN1Im2l8X5YF6AGKRWpSuu2CU0E
         54Cw==
X-Forwarded-Encrypted: i=1; AL+hErG0zDHuMXmvdJoFveBZRtECDHuZQJIVDDJud7lfth82ObWcAty6OzhFL5dqfH2V4LH2JEMpBg11geU=@vger.kernel.org
X-Gm-Message-State: APuU4Z83Fpybuo+HTRknxNe2LLmROhIvomC5SEY1KKsLtnDxWrMjGqcx
	/3cmKSLCY1eEZfXa8HCufOWLhMyXaDXdMPZpgeRTkXJBxc1jQ/X5NuSr7E3fH5hk81o=
X-Gm-Gg: AYBFou1R74PWtjanRq1WHh8y3slMWzHKXT8+dqioCO4IKDu4AYgliBNex0nj6DPJK0P
	ucXtlSBHQTdAf02WKVxxUHaw8vYY+JLqiTroc+VkIVlQeTR9LHFm1iEgSEyXZJ86t5FnQN2tzX5
	DpXnrv1wQ4WDSHtQD2DKwNTLCLKG14KQJ2YgVPpwr1VUNzU0Nk2T+s2qR5nQVSB/DkTB4LPn5Rt
	wDc+XArfJ0EghZmWqcDEYs/rJBERiQZrW8OZfpVfW5rpe4mWVPhxrHhr71mZvupxpn8xnwNYmJf
	RhDnIhVGfPkRGUP0IDwG/mO5fuuVor8GhvmM8yDHYks1KHXkzJ9u7/UIm3+qQKSRJWyxwKrLikf
	fVicXw+ytAB+MH8MFEojVCALlV0YEECbdeHO1oJYbhyFWj/PDTA4qm8hR7boU+G7mU2zYkAUj7o
	O3a6SjS8xcNIezENarixBcEX/UcDQM9zg7R+urRhZUL+mbTEiAHRLq/XBmonSBxBGhQmvno9iuY
	YjvwU3rLuxeqXu5Xf5x1SUEeR6daJ0jP6gJLmtwryiO2l+Jc3kzywLNzArbMfpw3PBbWl2LuK5j
	6vO503X2xf2I/nc4JrRe
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr49732185e9.35.1795165835650;
        Fri, 20 Nov 2026 01:10:35 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm114241355e9.11.2026.11.20.01.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:10:35 -0800 (PST)
Date: Fri, 20 Nov 2026 10:10:31 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 2/4] x86/vmware: Add a bounded panic log sender
Message-ID: <awAOhyq48jRfcVWd@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <7e985e2aea6507a0444addd816d4251f78d048f6.1794980455.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e985e2aea6507a0444addd816d4251f78d048f6.1794980455.git.zack.rusin@broadcom.com>

On Wed 2026-11-18 01:01:49, Zack Rusin wrote:
> A VMware guest may be unable to save its own logs after a crash. Copy
> the newest kernel log records to the host's vmware.log before kdump,
> so they remain available if the capture kernel fails.
> 
> Register the sender on the platform panic notifier list and send the
> log through the low-bandwidth register interface. Allocate a fixed
> 8 KiB buffer during early init; 4 KiB can lose useful stack-trace
> context. The callback allocates no memory and emits no printk
> messages. Limit the transfer to the buffer size and make at most three
> attempts, retrying only if a VM checkpoint interrupts the transfer.
> 
> Enable logging by default only in guests without memory encryption;
> encrypted guests should send their log to the host only when an
> administrator opts in. The copy is best-effort diagnostics; kdump does
> not depend on it succeeding.
> 
> Suggested-by: Michael Kelley <mhklinux@outlook.com>
> Link: https://lore.kernel.org/r/SN6PR02MB41574A11D309A0530C63E0FED4842@SN6PR02MB4157.namprd02.prod.outlook.com
> Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
> Co-developed-by: Bo Gan <bo.gan@broadcom.com>
> Signed-off-by: Bo Gan <bo.gan@broadcom.com>
> Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

I made just a quick review of the string manipulation and
kmsg_dump_get_buffer() API use. And it looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Note that I am not familiar with the vmware hypercalls so that
I did not check this part.

Some nits below.

> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -52,6 +57,23 @@
> +#define VMWARE_LOG_BUF_SIZE		SZ_8K
> +#define VMWARE_LOG_ATTEMPTS		3
> +#define VMWARE_LOG_PREFIX		"log "
> +#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)

[...]

> +static int vmware_log_send_once(const struct vmware_rpc_channel *channel,
> +				const char *buffer, size_t length)
> +{
> +	u32 info;
> +
> +	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDSIZE, length,
> +			  (u32)channel->id << 16, channel->cookie_high,
> +			  channel->cookie_low, &info);
> +	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
> +		return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
> +
> +	while (length) {
> +		size_t bytes = min_t(size_t, length, sizeof(u32));
> +		u32 word = 0;
> +
> +		memcpy(&word, buffer, bytes);
> +		vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDPAYLOAD,
> +				  word, (u32)channel->id << 16,
> +				  channel->cookie_high, channel->cookie_low,
> +				  &info);
> +		if (!(info & VMWARE_MSG_STATUS_SUCCESS))
> +			return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
> +
> +		buffer += bytes;
> +		length -= bytes;
> +	}
> +
> +	return 0;
> +}

[...]

> +static int vmware_panic_log_notify(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct kmsg_dump_iter iter;
> +	char *buffer = page_address(vmware_panic_page);
> +	size_t length = 0;

I would add:

	BUILD_BUG_ON(VMWARE_LOG_PREFIX_LEN > VMWARE_LOG_BUF_SIZE);

just to be on the safe side.

> +
> +	if (!READ_ONCE(vmware_record_panic_msg))
> +		return NOTIFY_DONE;
> +
> +	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);

I would feel more comfortable when the trailing '\0' gets copied as
well, e.g.

	strscpy(buffer, VMWARE_LOG_PREFIX);

It is not strictly needed because the length is counted
explicitly, strlen() is not used. Also vmware_log_rpc() does
not send the trailing '\0'.

So, it is a rather a defensive programming. The buffer might be handled
another way in the future, e.g. printed by some debug code, tracing, ...

> +	kmsg_dump_rewind(&iter);
> +	(void)kmsg_dump_get_buffer(&iter, true,
> +				   buffer + VMWARE_LOG_PREFIX_LEN,
> +				   VMWARE_LOG_BUF_SIZE - VMWARE_LOG_PREFIX_LEN,
> +				   &length);
> +	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
> +
> +	return NOTIFY_DONE;
> +}

Best Regards,
Petr
