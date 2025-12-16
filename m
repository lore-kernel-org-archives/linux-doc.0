Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65AD3557E9
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897981; cv=none; b=Rk1YXjMeje7Fy/1+bXhjj1CDa3Xc4jAXYlXn22t9CB4o5C+3XT4S7lgywT3pOQ5xsM0MXmd18DANyvmPcyAeJ6NhQAr5qR6YBQYPceePy7axGdbnPI9gaMq6rkj/8q5KTm8zQHDy2S/7KAlTIR4HT3Gpg+k0gDcIFKhiZkKUA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897981; c=relaxed/simple;
	bh=otRnitXgK3YK8QOOnOlDhlnw9uTpljPxLSfkYiE4/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URhr4pr4oYLIG7QIvCBIPcb5bpju5A2Ur+wBrQHVi5fmLV0ajrMr9/yUsqGWlFFRG/tEsCQT25y9fsg8OBjdsbG/fnRyCTa3RRofVsvWAGm8nHO7c8uwp4MQtFsburJj6ivTxjJ8pGS30MFD7IKNcH36v4GGQnq5HVO4eWyXkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ak6pimUM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ak6pimUM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so11272515e9.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765897976; x=1766502776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=ak6pimUMaCZZ/eH5zmilk5fKWiWmW54oMRx2jPSJVi1CVmJPC98gQhTksBJFW+6nHP
         DLE/wPy/UVd/TBJCpnXSaDfkC28opZO1OGWlzr6THu7BZffJesytfKxKrfaEWWQOvJdB
         Ro9a3MGnc9Th9Aofq0LHrc4iXCjQxD7lXbdtME75auAIp06AwNFJk17U4gcy4sEeP6BZ
         iRvSkXX1cwVC/goq2Jw4EZ9m/Ie8IaH/U2IsFtT/U51CKl+hcFy8uf0/8tp07WkrieUV
         1JAlv/ia8ggNysCdeLTYF/v1MLare0gRW8hYTq3ZcLxz/6Or+4EXMTge1Q2fGGhNLp8K
         cYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897976; x=1766502776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=e9rpGnPeLx+eMqBqTsS0U+igyo598hg915W1kYWAQXVrbdX69fZ6Him45w+l1wrVbB
         SJeAPR159Byp3KFhRx4hYTggDcr4yFTyhlIUqEOTdpAzL/WAH71G+uK3P1BQh9nXQdW9
         2CaOzGVlusGbNcEZVvS8vYjgPfK96Eef8f+T+sVVJNphChdhKZHD0E/+J34NOVqnEs+0
         sxqrj64O1wDur1y/wVCnGLp0ayHb4ZpyfSwvskNUwPMA2rr9Bq34i9iTT1Hcx3jEqMQ0
         Z4NstSzFCY1WeE1HpqUCZwYzUW5QsXPIJIoqWuUmWU0lL/71nuUxXPkNTzOlsRzLi143
         jrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfCXFkPvMVckkHQsI2+D6eXM0XLgEUXi7QG+7po6Om+a7oKD+f/EYNACIIV8h/uVYW/p4p0CmOHVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3EMfCYLiiqIujIR9WT5ZSyo3NitJfuMegFGfLiAO44IFjJvyq
	PHER+FpbC+PfIPWlMUAZ8UXGSRo8JCh7soLrlFtjvq2w1G2lehFWQGM0lfUnJsaKI2E=
X-Gm-Gg: AY/fxX4TSvG+60ond2mXyUHrCr9V7WZSMxk8sW4i1OuHTjn7Gc7kX3qjpb1ixQlwsCQ
	b0eLCtx33Ot/aOev+g4fb3c/DPoBQdjx25/U5g5HkV/l3Revp4oHYzO88VHeSYV8UxWd1/YeDHB
	zymXDS36yiZlMDpiJM14Sp/RznQJ0vKPgq43wpR3irOgvL+Mdo0P8FSG5U0W9S0rmVhm/J+68sC
	VHpzFULChnHT+Y2d85tjKTE8IPwUtPfOYfV1spB8iksrbHZxpHSH+IR4rhLTWJ5hen+ot3gapjz
	McwsNY8gUj2GR/HQFuFSBuBaVUN7vcmZ38lJlCL35weWgLqpWmeX7t+KQXNdTcNkHZyLETVeUB0
	Uf3aMkWRJdAMZInnS9W9qGheRVuUzjBuvYJpYfHhBpj88RsdN9HmlwzcpQ7xiFc/nj/v7ewroim
	f9rrn8ubpbUeUo2w==
X-Google-Smtp-Source: AGHT+IFg1h+oSthyGc4tPORkNrPPpnVeUr6FNMPfEJgnXBupogksrkrfKGsIU7DtuK9+emJLDR1CpQ==
X-Received: by 2002:a05:600c:608d:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-47a8f8c18d1mr142495795e9.11.1765897975942;
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90b81e6sm12034075e9.3.2025.12.16.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Date: Tue, 16 Dec 2025 16:12:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 21/26] printk: Register information into meminspect
Message-ID: <aUF29MLUj3YRh4v_@pathway.suse.cz>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-22-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-22-eugen.hristev@linaro.org>

On Wed 2025-11-19 17:44:22, Eugen Hristev wrote:
> Annotate vital static information into meminspect:
>  - prb_descs
>  - prb_infos
>  - prb
>  - prb_data
>  - printk_rb_static
>  - printk_rb_dynamic
> 
> Information on these variables is stored into inspection table.
> 
> Register dynamic information into meminspect:
>  - new_descs
>  - new_infos
>  - new_log_buf
> This information is being allocated as a memblock, so call
> memblock_mark_inspect to mark the block accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>

I haven't tested this. But it looks reasonable from my POV.
I assume that the output from the "log" command was from your
synthetic test so that "crash" was even able to print the messages.

Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I haven't attended Plumbers conference this year so
    I do not know what is the current state of this project.
    
