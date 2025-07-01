Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011121FF35
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384791; cv=none; b=lCiybdTPLp25gLCHEjDFPECGKq3GufGaCAOQj6WsDYV94gwOdCz2f44FwhU6Li05VnfdTDfymfgugAxTn6hynH41mdISpg/G72SV2OHWYnbi78R7UD7485Nw4h5r3L14t8gEHmt+gUhzguRDNqGbITUON8EGn7eQUbi2pyuyCsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384791; c=relaxed/simple;
	bh=pAglDTOhrF8Zvgb1AFD+OxJd1JCWicRRyJSMm11OT0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMTu74EwjhjO8K26fspAK42ED4Y8Zwm/9kPQUzgunZD+YfsMjzMXwHQZwl57eHdmNkr1fjqUhJBUZphyXixJbMpAPzEUC2N2zDs+6J0LvPeZk+trTJIvQvVuGV9XTvMrqD1R9viV+qeC7wLAoSKOvYyH5+l/G6lFXOByQq/lw4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H3deQlJL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H3deQlJL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a577f164c8so798741f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751384788; x=1751989588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOFZz6F2G83zxV/3z8yTT2gDImG/Fh4Mhj3FLnYmKOQ=;
        b=H3deQlJLRphrt4rWcA25M4YoONr5eYM9aw9yOf+DHWm3TuVRF8Bnr33zw+Zzs3/ko+
         ObIOOB2spCDHhUgYlZ4pSuB5gdND+8lFQQvGO2HOUXkzMJ5H1kwJDos5CejiQPfVlluK
         VKLrGHFaNJ/Py+tFwgywoCZGt1dy2K8RCwKxKPx8DqRwMsloskj0bf7Jch26xLPqdZKS
         9n5I97w0mqKIRoO7cyJjg2y6ZVUPI7T/EUE7KDn7fWXRfaHqz5IL2LvIao+g/eBRxeg+
         0lBFaW0NEEQRP+DhAtznrc7pu83p72ELNIK75mBqA6oqDZpXCMLtSjw4qTYHCGVpUu3V
         7BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384788; x=1751989588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOFZz6F2G83zxV/3z8yTT2gDImG/Fh4Mhj3FLnYmKOQ=;
        b=U5wX55lC7/trAkTkJIKxcuxNR/Gtc31UgHJtGtQiInNm+X2BL+1sgALWbEHcKrb8k6
         uxKDMcyS/auJzL82ULvtqgJhVL6pRYTOlYq91kpnXJNGL8jNJWTxWrPnACtMklVnTeKK
         Uz7eDMEqBqv54Ay4ytv8CtG6plw0E1k6sqnKbqoI5myIWp8/OpSUsCcWh+TB1eDqeCJC
         8QXvt7DGratjGb4SYKSiRmW3XUXeBNAGi7zKy2HdTSGdCzuBRZxrhmA5W+byoupPEXPu
         Qd0SG0PiA5K8PFCGwaDKbFmTFcELkCS+My7IL/5WYuPORdLI9czcukvTf9Y5nwuARoiO
         im1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvoPAMhf7ln2SJj2OQpcnnQ7/5ZEThPULWizxq5qlh6ThYccLw1JCB/GO6r7/OkC1loiTQzCae90s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTgcR+a+n3Wtwr8Rglzsq82WhcdgrkPxToPY5Kj9m6B/aIwXUZ
	kC0P46svEgKIaOIVxAeI3/5K7u3w9K4sZyt2IcBgCF8FURL8ERpeVwsJmkcAkMZnaPk=
X-Gm-Gg: ASbGncvBZLwT/hEP2pHMV5Y/MjOPMsOhPePTb4c4f/GOTWOp54nVRhgtcWJnspgIYux
	4c37Pv4kxgmih9jO50evQ1b4doJXU9NZ/nLPFONuamw3pxObs+ub6+FL/Li4cGFl3ksu+tpsMBv
	aqPMuuBDwHYf+Q0YiIDC6XQq8imDShwQhSOgHfWCrAdD+MBLCuImBjtX+zUNz9/BW4ENYuZSiPr
	vW5QtLpkj/xHBEYaJjSnvFA58VHVcjxJh/BITolmAX2tDl9/BcBbnNc21qaiF/tEgwH42w/pJ2f
	/PhRodk0SIgNQXgPB2XOJfRVCoz5yfhMaR7HbS8td07ZhX8WFVa//Qs=
X-Google-Smtp-Source: AGHT+IHoPM3nOnG6zXq1wPZop0nFfQhTrUhv7Mx3b1Sj2NYhuzTU7PMm4Jn+4jvjv+oZm9TEot6V1Q==
X-Received: by 2002:a05:6000:1885:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3af485b1fb4mr1179705f8f.1.1751384787986;
        Tue, 01 Jul 2025 08:46:27 -0700 (PDT)
Received: from mordecai.tesarici.cz ([213.235.133.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm170405635e9.11.2025.07.01.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:46:26 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:46:21 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrew
 Morton <akpm@linux-foundation.org>, Keith Busch <kbusch@kernel.org>, Jens
 Axboe <axboe@kernel.dk>, Bagas Sanjaya <bagasdotme@gmail.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for
 dma_pool_zalloc()
Message-ID: <20250701174621.5e8812ce@mordecai.tesarici.cz>
In-Reply-To: <875xgct6js.fsf@trenco.lwn.net>
References: <20250627101015.1600042-1-ptesarik@suse.com>
	<20250627101015.1600042-5-ptesarik@suse.com>
	<5a997777-fd14-40e1-919b-2e61a6e8d570@infradead.org>
	<20250701133833.4060f406@mordecai.tesarici.cz>
	<875xgct6js.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 01 Jul 2025 06:54:47 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Petr Tesarik <ptesarik@suse.com> writes:
> 
> > Do I have to submit a v3 then?  
> 
> What path were you planning for this to go upstream?  If it goes through
> docs, I can apply that tweak on the way in.

There's a reason I put docs: in the Subject prefix. ;-)

This specific patch touches an include file outside Documentation/, but
since it merely adds a kernel-doc comment, I believe it's still good to
go through docs.

Thanks
Petr T
