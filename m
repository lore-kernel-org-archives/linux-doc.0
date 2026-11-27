Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791829;
	b=lpxe8pVCPTfZoGfXzYgmqEp24ET9r3jgXqy5bMyBfRs0eeOCgoGGAfCBSOm/pqjrWLY6
	 yUpM1gZWt0FUJlhVxxhFd9VQV4NlFam949AEgwrYv2znLRHDRbh8u2chebFwJyF0tUeid
	 n/QXJRUXw3kA7yMrrTQ2ntAuMcHQzJTLwNnm+ySmM68pfpBTTrzXGNxEYixsJXQOEz2uR
	 YAXJA2OLe6R+oSRyBEiG+NxEfxQ8g9WCVc75JOBMtcmocMGFaPM9cSy0ggobpqgu21dd2
	 FeI+GBKhgZJaBpFjdXPbzxWgnP8zdhSeVquUsqjejxkSA+44GVAOurPx/t13b9y+8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=igR2PdoSE5zC+luyFOEYbUW1HNx+27WRDKANfZMFdJU=;
	b=5WSboDFEJeukKKuuHIWQ4A5FQpAfsy0WmP7vm/JIzhM/xfyQAFDE5c9KbU2wc6medkYC
	 Z3HsEdHG9EZead2Ajk+it4QD75vE3Y+P0lhQ6qDicaOyuwRWmuGORFJKRx0tePuIMDTRv
	 ldIdl/YRm9spMde2miRgxt9yl22V7DhkbwipHPIb9FgDcBcuP0gKwRU2lPFIfotu/Wmsw
	 /xov++vlFm/YGBk8VGyvYLzyaR5hXX7D5Azl/17Bu/Q4ZXn57qNMozXN4SaHNkuzXtzOF
	 mYq04DYn7tgxSiYQFCPQTmR51cUPM8s9rYmdUNFJCwOGb1teA7KfEPZlef4jS+swZLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i44f+muv;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2238606A31E
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 15:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2238606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i44f+muv
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3b4be95e0afso2508718a91.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791828; x=1796396628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=igR2PdoSE5zC+luyFOEYbUW1HNx+27WRDKANfZMFdJU=;
        b=i44f+muvtDEeeOY5tIoUToTBUtVium07pkP95DOcd0GpoK82QhGFz5ypxCHdp/+AGS
         ZBY6zDkNwAPki4z10a2QnVn/QKTOH76BbxA8rV3cMPMLOSlMBytIIgiBcNOCO4kRfJ0y
         7OVYznGFbndV+JqP+GPGu4GjdJI93H6N6yYRgxS16CdYBgTiMBJNFpbii+LTBDrJBEIo
         9eemZFVKWVyyvFtp6zgf4j6cNFeWUbBlRlorHq/QUMA1Pe5VkQfIIGRzr5Vn3GcQ28QU
         jqqH5eANnHlHec69m/Uhd3vvwLIJ3VOe+HGQ1ZyfDo677MHWNolNUUQW130J1/sTS9cN
         Yybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791828; x=1796396628;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igR2PdoSE5zC+luyFOEYbUW1HNx+27WRDKANfZMFdJU=;
        b=d/1Ltsn7OTGjKJGQ3lzOpPfoeYOv/BP2i5dzdAxX5Z1r8nILdizDrZZlC5maj0h8Yw
         wPev7C6X3p3IgSwNJdOYLdsTXKA4gZ0k/DIuPf+Ho3DBGtMJ2qyzoj1c2lS4b5TXPDHq
         suZkeoH+B363BThKdqLEGjWLXEWX00QeCE//42MIsPn0+ZLjBG/KjDv9aY7zMM5YlcHM
         xfRCQVvHEdX5NVY8UMx6fbaoLQ3EO/opBZ4zPX0vErnlEU9J7RiVsqd4EoDu9CM5y3s/
         L1XqZhQGGGwmLgWUqJf5GOHwCLhHoIBqV0By9/YZJOP88QuHd4UnPXNHvyEjk9g3Rgjg
         eyKg==
X-Forwarded-Encrypted: i=1; AL+hErFIXtEuXjhoW5XxFcHxS/6dtuy80IS5ivmcJZFkA3Wz4VclvS5K1f0keF/afnmeStllHE4TBdwyDPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B6FUaaAxztYStY74gpg9NtrNpHzlNSwm2qVwXz6TD5dus/Xz6
	CuRNP/jW3CqZfvoPAXBF4EIGgtSmCVAgoGkHz7rEJWBqfm7LWssbUKYV
X-Gm-Gg: AZFdTZdT+w8CC12P/g4uuXNRCf8cB6eZDDU1GLmc8y6r0jvOsWm3Qna0HXWRZmr/9YD
	sJju7kAUmGWCbrVarmcmwMZWOlMxGcXvk686iXFmKk3ETd7ReelXdTlWQC1RZyovwlMUAnUzKZz
	+aB83SzyscB71gQWDIINo/VAUgvoRkU36xPRHyDwqI8I5P9+w8o2hxqQeeQ6kmAF7mtPEAjFSTV
	1Km3fxUl/dxU/CjxkBvtWgugH5CmCokGaM8mIVf5kZuwh1wSlQo6MPtkyMeSGlnvnTDo4OHFE8a
	w7BbmeHf5lE1gokTyXL/M0s3DAw9gGkDb+PgBn8Ls17/03hntG+i8lyLumLXabyZRYI9p8844+d
	pk8aVfidVLqVLYbbtSH8361oYVwhlWvtgA/M3TvsjJZwG6EItxxKWhN983EQkH9Ye1LSNbkst4v
	KG4RUl6CSmsrP+MUbJhUmokSVH8JLJq/Sam9AsrLEDXxs+LqZO5lDvkuC0J+9+SCafaxZgAbAKC
	8xTZJ7YaRO6OUxoKclxqMlT6r6T8JFz7At52u3ZYnOxg2r+XPlfHVyxCigzCj0It6P3KH1eJWvz
	0hFAp5mkC6rb+eEfqdyJPOD2lIQ=
X-Received: by 2002:a17:90b:2701:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b41c8d9224mr23715014a91.10.1795791827753;
        Fri, 27 Nov 2026 07:03:47 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:36ba:d0f9:ff68:162c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b5210be133sm7345191a91.11.2026.11.27.07.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:03:47 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: bigeasy@linutronix.de
Cc: frederic@kernel.org,
	darwi@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Zixin Wang <w1355457260@gmail.com>
Subject: Re: [PATCH v7] Documentation: real-time: Add runtime tuning guide
Date: Fri, 27 Nov 2026 15:03:30 +0000
Message-ID: <20261127150330.798248-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126114102.615558-1-w1355457260@gmail.com>
References: <20261126114102.615558-1-w1355457260@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sebastian,

I am sorry for carrying your Reviewed-by into v7 without checking with
you first.  I should have followed what the process documentation says
in Documentation/process/submitting-patches.rst, section "Using
Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:":

> Both Tested-by and Reviewed-by tags, once received on mailing list from
> tester or reviewer, should be added by author to the applicable patches
> when sending next versions.  However if the patch has changed
> substantially in following version, these tags might not be applicable
> anymore and thus should be removed.  Usually removal of someone's
> Acked-by, Tested-by or Reviewed-by tags should be mentioned in the patch
> changelog with an explanation (after the '---' separator).

Since v7 changes the CPU isolation handling and the rcu_nocb_poll text
after that review, I should have dropped the tag or asked you first.  I
was wrong to carry it over without checking, and I am sorry for the
oversight and for the extra noise.

Please treat v7 as needing your confirmation.  If you prefer, I will
send a v8 with the tag dropped; otherwise I will keep it only if you
are happy with v7 as-is.

Thanks,
Zixin
