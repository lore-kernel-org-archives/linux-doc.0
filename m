Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261426;
	b=FSelrbtF52/2bulgfmCorqOq5I7Sg8VQ2xDAteEsJRW+XZKsgTihMczaQViR0pmwMFP/
	 PYjOk66aaNZ8L1G/y6XVra6Qcd2fbQ16l29P9jCaiSX+i4fIvhdp5X4VLcYKirHjhhoOA
	 XpzzN8IZtZ6uwecVeeHyRDLH9Elqbi4YEe05Ekv+nCm5G9hLgM3hhCzkBPvGvL/ojC7rP
	 7N4EbdHpaT6ak45C2QGP5hQ54J244WSfXU91vaJW6Q3UB/1tO09Bcw1rnMxSFKfd0HJ1G
	 KO91DZGaM77dbFTkGs7Zv8j3HcL/5e4ZEXgF2KshwWgwV3ig2RvSW+vEq6DCvOsff5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fuuQE+0q6aMXMK2w5CQO+HhUEAZWO2YsQm3bGqm9ELk=;
	b=sOWTjfalUzf/wCCqPcLWw7XqyuE5J7hiAJA2BgkwUjz1dUo2qEls+KuvQGkjmmGC07zk
	 wfjtYiwpvlphgT5AOMS/Uqz+qt1o22Iobg/IkFPrYInm9L66bc+5vsjKttsJQ+SkkKS3o
	 QetsR5FdezxhvITHyspylnOH0AtpMuG/iISJ+swZipMoNXKIqtJF7pSqgK9fanRd91lF+
	 3rXG3Zh2UrOSOR6Bbk8hH/EO025H377L+zOMdVQ6P2FljTSgXZ/FikD932c3j18lqnwpe
	 0L4oKZJHTr4oW/AJbKDigmy8FBZcUKDK9gt4VzqWShAemstNYgfxQqxifDU3ijGRqkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kYTMQDPJ;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AB7606A321
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 21:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AB7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kYTMQDPJ
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed276af91dso23384165ad.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794261425; x=1794866225; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuuQE+0q6aMXMK2w5CQO+HhUEAZWO2YsQm3bGqm9ELk=;
        b=kYTMQDPJQhwibutGohKus/kbWKLZ6wwl14rcPVMl+HKeIaqmPoKFtYYBV3HqOsxZpQ
         i6VFiuZ+6vynKCSSVfxIAw99CfHYt1m/M9nZo2p9kgNo7TlxC0ZjVVw89Fwg3RlVmegl
         k71jEurPdeb7gxYjSZ6tp4dUMeYCi/91R8K+O2L9mNo+jTfxIOiIGkW+v7fzQYqA6VgW
         xhj5r/NSLQO4EZ6bq4E2gHa1k5+/Wf23BBLEgRXMrgoKI2fNk66fPC79IUfGUECRO6Vk
         y4a99a1faO983t1QQyeT6b+pz5JR/44yPIN314H5YpELrTYKMevNoKjRLUlc1x+OYme9
         5dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261425; x=1794866225;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuuQE+0q6aMXMK2w5CQO+HhUEAZWO2YsQm3bGqm9ELk=;
        b=pRTWHxolvT4BJ7vLbBgZWK7gD+tVYOBAusSmbJwU8UzmBsNzwbq9GvpwZgdvyntsvQ
         xybdYee1mZzYjLnAAM3fpEAiQVTMCD6Q9iJSnP0/+mjUthu1RvyINkf9wX9O35aKzBGo
         +d10P1lDu1KdWqUo422kPYqKG2o7f468vBWFbuFax3fIXeEVmipsYQam+c1HVowmtQcf
         mndB5OrttitjVhy+OPPcKUOgucOOhtjxEUS73y43IazXkU6vrIfp8khXaVYMYkpZwQ91
         oDbb/KoFb3/YFszHBQLyLEU4JLMc2sz8i+dkurwbhKL1Amx6LxhuNLrct4n2yWekWX+2
         PM8Q==
X-Forwarded-Encrypted: i=1; AL+hErG4VhPoCwbuIk2F+GZ8EwWOFHv0+2V5UtGIyJrk0wBJU123vp+GzVBS8jFzpdm++u6gutKpzwRe+kM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wUjiuScakZSELGFFQcSl575HjL5wq3hXf/s3gk0/taLld7yvn
	qaFQDvHgyHbIdIjvz39cAe9whOPtkv9E00X+V62kDkmwQt/SRvN3AKsf2znulEBtU2cdOSlm16O
	rBPX8yyP35yqI/wfn3wa8eBt846FLJhap5Q==
X-Received: from plbbg3.prod.google.com ([2002:a17:902:8e83:b0:2e8:ac89:717d])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f709:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2edb91f0086mr5040085ad.39.1794261425086;
 Mon, 09 Nov 2026 13:57:05 -0800 (PST)
Date: Mon,  9 Nov 2026 21:57:04 +0000
In-Reply-To: <20261028173038.292999-1-rathodpriyank@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-1-49a0d7aeaea0@google.com>
 <20261027230853.GA519764@bhelgaas> <20261028173038.292999-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261109215704.1852183-1-rathodpriyank@google.com>
Subject: Re: [PATCH 1/2] PCI/AER: Make aer_mask_override effective for
 injected errors
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	danielmaraboo@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2026 at 05:30:38PM +0000, Priyank Rathod wrote:
> Good point, thank you.  Would a shorter commit log like the following
> look better to you?
>
>   aer_mask_override=1 is supposed to allow injecting masked errors, but
>   aer_inject() corrupts the hardware Mask registers with "&= !" and
>   restores them before irq_inject_interrupt(), so aer_isr() still drops
>   the error as masked.  Emulate aer_mask_override in config space reads
>   and writes instead of modifying the hardware Mask registers, and
>   document the parameter with MODULE_PARM_DESC().
>
> I am happy to send a v2 with this updated commit message, unless you
> prefer to adjust it directly when applying.

Hi Bjorn,

Gentle ping on this series now that v7.4-rc1 is out (both patches still
apply cleanly to v7.4-rc1 and pci/next).

Please let me know if the shorter commit description above looks good to
fold in when applying, or if you would prefer that I post a v2.

Thanks,
Priyank
