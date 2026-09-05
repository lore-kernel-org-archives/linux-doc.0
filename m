Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F6D364E9E
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788624497; cv=none; b=WoAMsrtWGdyGZDMi4+BZxG3SWyVOy16ERVj4eRJGQcfhEDDn30sXbhReBIjhDcLvHaX1LIWX89+jINQxuLbVvuNeLkdXSP4s189e4/NIYpLptL2BlirgXQPDrx/BQMLq7pyfFH2/H0PiGXZR3blYRN2xI0NAp0iZLEc7Lffhm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788624497; c=relaxed/simple;
	bh=LMxI9sOawdiT9zLsKL/YQkkSUT66UphiELZF1GohwBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQhiFRq61GIc+QPCmVexfgp+6lmOc2fabntsaq4njwfIv/hoG2Jn3xtVlD6FG06BbtU3lvcrS2hZjQtsTRcRU/XBH5zjA2dR0vSdA0A7fNJPSnUtHi08ZubcR7txfhfhQI0VhL7J42nNfeGsSRsE/LhuB5CXG9Zb2Lbfp2kXtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdF7I0Tf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdF7I0Tf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so1343144f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788624494; x=1789229294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMxI9sOawdiT9zLsKL/YQkkSUT66UphiELZF1GohwBE=;
        b=rdF7I0TfChqEa/qjldD62O5XHj9JnAUEEmZR4GbQ4lRGl20sdOzCAtqsGYMk4dUL2w
         JQR5tYESzFODXfPwEplbSB/8FI+r6/jy8Bsm1meBYT//DCw5LtnwNmvNzvwKdUulK2ql
         mM2hXFyZV452HGw3sSkEtj+uZwPP/GjyuR2SXBji7nkdMy3NQQn9j61NIeS3G7MHHp3A
         h30s8F3YWGLCnB/r4PuRc8xhP+M47ARXgkX05Jed68cNPA4/a2iIZR6aMkJ+9ydJMcqb
         lUQXIlnv0Ks88ZcFTSu8NYkn4ypxTVLdRQu5mIRYeyHIt8U3hqp3jUCpo7aAvZZG5k+n
         HG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788624494; x=1789229294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMxI9sOawdiT9zLsKL/YQkkSUT66UphiELZF1GohwBE=;
        b=q6y7vonOyxOakcQoIv5+wxgX6XNtou2z72LsTLDCjAM43B9527ErZswt4MzaRCwBnq
         ZeAnaKK0Q+q3VIDowPGGPaGKV2KhQhLq7zDDwoztFItt08F5o6ozm7zRaZAYQ2gcmDNI
         BoS3hcOktxVmYPJdH5C/g9CRi86uS99AJd1HCd9uUxSjOfe77VTyhRVAHAyuSfuxYadE
         K11qZg8BepuUnBVc/6I47wngzCnZB7eCH/mwHKo+rlc6RTu8nve7Qt3Jnw6djZBkEOtv
         dNahoB3bxJjghwDWk966JlW/ksStOHrWqUoAv6TAtPrl6f/JxDAdhJoNt3YK/vm8AjWP
         Fjeg==
X-Forwarded-Encrypted: i=1; AKwUvBwDv07up2Tc0Z58CidtHDanRZ0mWVKJrvOl1b+XM9WsPW6gLDrrOu1fBSIyWmA7KncRww/w6NAgNrw=@vger.kernel.org
X-Gm-Message-State: AFuF++nvHk0ItRwauRpBb7W4PE1XhjJRfw/P7mA8nqfCjq3OnHn1oMVl
	iRyYkdU/KVL+Tb7PisAgHauYL5sku7XzEYfByttrSqRFAd8fwLj9bUyc
X-Gm-Gg: AYBFou16Uj6fB7T9yhfF32FVDziUJHJT++0u53qmz1mtRtATE1E+AyP9kw5mbnAluEg
	yA6kDML4QGiMw1t8v7hZqO+o1Hq03K0DQrEx/O7qaWORUK2VFY12jdLi+CYO9FAC+4XmVovAVLN
	5X5ZxFirum0PRIz9d5BvICgDgBpLbdoRieGFMCeDgRV8Xrkhkpd4L/Aw7/Ne4dvQhd5csAtbJoy
	h/MTKjkeoae0sMjrbNFjqwTmRqigo/5kiQDOSgBJDlV2Z0n5dvLZDzU4Bqgoh7so/dDd+RUnQpZ
	kCA9qAVd0SgwHHEBqm4CW8NGQiFJ54SCKzeIx1I/E29Jm4WA6f25SLEcM9JZPpmGW+wwRft75FD
	6X2E80U0UgeGg67vZnN5scL1HmFkGfPkTzUw/9h9AN37HA3MfURL1eZY/eZ/0uwEWPKeNjkt1up
	5i9upZE/5B8fQxWefIZX5/a4jcVsojMVDLAAnkb3VNbT8CvzloE6W4YgRQbmUNzjKEiHYWRwYVb
	Tg0DoQpkU+PIR31jWqbTKVvishsDkuawKwbmKRlk2GmlbXeTrmGxR+82L5iDyWy5rrcHpPQNekp
	q3E8gOxlXGPQnS84inOTyj/piwLOjJ4uEM63ucWT47/YNJvX/WD2kHz+Vhd9v+styRM=
X-Received: by 2002:a05:6000:1843:b0:485:8c17:9767 with SMTP id ffacd0b85a97d-4858c179a7emr11526790f8f.41.1788624493804;
        Sat, 05 Sep 2026 09:08:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm14967818f8f.21.2026.09.05.09.08.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 09:08:13 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ata: pata_legacy: remove documentation for removed module parameters
Date: Sat,  5 Sep 2026 18:08:09 +0200
Message-Id: <20260905160809.91509-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260607064053.195166-1-enelsonmoore@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jun 06, 2026 at 11:40:49PM -0700, Ethan Nelson-Moore wrote:
> Commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
> several module parameters from the pata_legacy driver, but neglected to
> remove their documentation. Remove it.

Checked against current mainline. That commit removed exactly these six
module parameters, and this patch still applies.

Reviewed-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
