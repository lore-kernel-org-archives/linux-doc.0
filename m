Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE211922E4
	for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2024 18:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724437079; cv=none; b=iZIZIHIzVkVi4e4rydrVtCOwGP8TKpqIFcdlLHabAHcKPjInIECZF8hqcB5Os85vgQRnoN8+bT0/kidy8FSRswgaBxlFT/FrE4U1zmV11BclCrNO6mNCr3cybOGrNOqDnpGmwgYio48anf5b1W23utQujZDtkbi/GHS6avj/LAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724437079; c=relaxed/simple;
	bh=us2rdXys21oFgrc3lIMa0w1LdWVH/OnjI7GaLqu0mi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKag1ekzlEFc2g4ePyTfxyRVCa2Xt9MTGrqdNDADISCx93BZt4uvFwcEMVYz2JBqsv9PyXSTwfOmtVrdYMRPxX6UJkU5asb/DQic2e1GfU+GucRg9DoPZR/6OpSS7WQ2xCoLD556nijaEEUqU4Wc7WwIzbkR60clB8PdGr/naoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=GfUlYxIh; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="GfUlYxIh"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-81f8d644fe0so29291539f.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2024 11:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1724437076; x=1725041876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1L2UbMyeA6ZtpjTTf28qzgxKAoNSjMt5tsfvJ8hB874=;
        b=GfUlYxIhh/Nu/xAZbJn7bjXK45QogWB3VoLR+TZC+3pATI157oIPXO8X3vTwdJxnHL
         BmGfP+/t72P3wS6LqhmF/CwYlYMHr8dQFd21VuAy+G3vwbFEDPCH2HhugdSVh3ujiwIL
         YZzwdemqMNuONPNjwvmCnbAKS2GZkLCbKSmLKbIGy6GW2SL6jMgOfjzsBKFd8npRfhKv
         PzOXjb7H5oBvThdjJk9SLZgXOr0Y7dTujowLcl48jPu3grKS+ME7iU6um/f1jXd/nYEq
         +cdx1KQDBcEUbCookwApuOVBqlyB/owwidnlJwE0lMu+gssQP7IOBOf6H94BiesIL7S0
         Q8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724437076; x=1725041876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1L2UbMyeA6ZtpjTTf28qzgxKAoNSjMt5tsfvJ8hB874=;
        b=FIybrZgiWpWaseEjAYiG+ulM7N3Mm5d74LrNeMYlGwsbYsMQYTUYeKWSm5FbDriF2Y
         XOv+zsDIuofcwBRr/9sGAI1unW81SCM6qpt+UqcfEva/V5udzsE+iI4Z139YkmGQ5vTY
         z/5DvZgptiCBVDp5ZXLrWtREsisdZCYOytwuqVfPnYgRW+Dwn2UqsRWVcWKNmQIf1/w2
         PFWp3BfYbkMYgZ1qeCkG9IF1bDUujR3ME4LVIAT6fAhsxIgefkIb1pFxQSVMU1LHMMIa
         RVIx4xh1kEeXJV30JP2dEAVJrBOL8OY8TyD/Na8ZBmqV2bIPX5oGdaCFiERkdwnIZ7ED
         xBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXum/4NGo9Rk5IgdmJdTMmJkky2UpWwuB7+FQeyweqQtGfkd4y2CyovPvVXJvmDA1gETTgFH1KzGUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNr1YQuG4u5fRM+JTJsNQfkufxGU0Hc1E/H4dUo05aON9DlPfi
	ouVpvraFd2gj4ta4K5Fe7hGOcZ4iKh9InsnorxFPzfcF86zY5nszSJ2/kr00ieM=
X-Google-Smtp-Source: AGHT+IE/2G50xW++565D0QEbsbBjpVPhWGeJ2rBDoGBZkDXHAPhG03bCJzSak3QpcUe2p4QHftCocw==
X-Received: by 2002:a92:ca4c:0:b0:374:aa87:bcaa with SMTP id e9e14a558f8ab-39e3c98c6fcmr38850175ab.14.1724437076349;
        Fri, 23 Aug 2024 11:17:56 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ce70f5c54dsm1036027173.55.2024.08.23.11.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 11:17:55 -0700 (PDT)
Message-ID: <6f303c9f-7180-45ef-961e-6f235ed57553@kernel.dk>
Date: Fri, 23 Aug 2024 12:17:54 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] Documentation: Document the kernel flag
 bdev_allow_write_mounted
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, linux-fsdevel@vger.kernel.org,
 linux-block@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
 Bart Van Assche <bvanassche@acm.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Jan Kara <jack@suse.cz>
References: <20240823180635.86163-1-gpiccoli@igalia.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240823180635.86163-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/23/24 12:05 PM, Guilherme G. Piccoli wrote:
> Commit ed5cc702d311 ("block: Add config option to not allow writing to mounted
> devices") added a Kconfig option along with a kernel command-line tuning to
> control writes to mounted block devices, as a means to deal with fuzzers like
> Syzkaller, that provokes kernel crashes by directly writing on block devices
> bypassing the filesystem (so the FS has no awareness and cannot cope with that).
> 
> The patch just missed adding such kernel command-line option to the kernel
> documentation, so let's fix that.
> 
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Darrick J. Wong <djwong@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 
> V3: Dropped reference to page cache (thanks Bart!).
> 
> V2 link: https://lore.kernel.org/r/20240823142840.63234-1-gpiccoli@igalia.com
> 
> 
>  Documentation/admin-guide/kernel-parameters.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 09126bb8cc9f..58b9455baf4a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -517,6 +517,18 @@
>  			Format: <io>,<irq>,<mode>
>  			See header of drivers/net/hamradio/baycom_ser_hdx.c.
>  
> +	bdev_allow_write_mounted=
> +			Format: <bool>
> +			Control the ability of directly writing to mounted block

Since we're nit picking...

Control the ability to directly write [...]

The directly may be a bit confusing ("does it mean O_DIRECT?"), so maybe
just

Control the ability to write [...]

would be better and more clear.

> +			devices, i.e., allow / disallow writes that bypasses the

Since we're nit picking, s/bypasses/bypass

> +			FS. This was implemented as a means to prevent fuzzers
> +			from crashing the kernel by overwriting the metadata
> +			underneath a mounted FS without its awareness. This
> +			also prevents destructive formatting of mounted
> +			filesystems by naive storage tooling that don't use
> +			O_EXCL. Default is Y and can be changed through the
> +			Kconfig option CONFIG_BLK_DEV_WRITE_MOUNTED.
> +
>  	bert_disable	[ACPI]
>  			Disable BERT OS support on buggy BIOSes.

-- 
Jens Axboe

