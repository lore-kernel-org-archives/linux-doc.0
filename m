Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD026CE1A
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487524; cv=none; b=XQe6plkg0KQdgMgEotff1JDslLU+DzOfcYBT6PsT8u2/yQGLDRN/VGBm+SrtG4u5Fy0oin8r4gyn5e6jckSrRMeOuKN3HTX1yMmdNitgqAsnMIBJq9wtjsGdyJrz5nwPZfMb1t57TLQlqh01BAKTDFeld16VS0IOmQmUyghDuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487524; c=relaxed/simple;
	bh=0R9nNh+fcxIvM+QvxY30LzRC0hI4TwT1hpwj1bidwn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9WnO6kdeeJvUiz4DNlDyRctEE4DlPCuCjexjdlcr/JFSLZR8yZMOFYGV3Gk/zDaoggSVy1W/FIj9GhXKcL3iEyvhEps9CTTCGZCtm3gDLoWQ26yFP7aKyF2faogjZ8ydlYZ+zrhcy52r479Idoo8aUCafTQ9vwpq5BItyjRmF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zFGecU9H; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zFGecU9H"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so6436737b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763487522; x=1764092322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KOpYFcon0iDNFMIs3t+r9Ea1btmn7c7oPi7Nmj2oec=;
        b=zFGecU9Hi+7IGywYRFjuy/UyYCOwT7m2Psq0CRVAHdKpKQ8X00QXCaPNs2ndTQotyv
         BCswsOxVw4gW5EJx+uDvIv113R641UBvb/cjb90QEOWRZ+KLNGYcD/4dmSYN8iq20VfH
         zD7S3wpdmFldzMnthMWqUybuJbxDad8mdTKi9UUzZ2V5zTfgs2ScxYH0RumXplH0hmFk
         hCjyMNMoqdYbYO3C9Kqu0vlpF71u/WVX40Eh+2UsZOel6VDh/g5hjE/tu9t2VA9E+0Zr
         mwf4FofvcXjL72aXiYvTNckIcT3X+U9lXVEq7Bpidk9JPPbEB4Pd9elNmMccEgTNGxSC
         TmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487522; x=1764092322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KOpYFcon0iDNFMIs3t+r9Ea1btmn7c7oPi7Nmj2oec=;
        b=Ye7VXQjPNIZ2R5eYepy44Tq2FAkVrTSfRRsgWyrWCyj+c0FTwEEPpABUv5bnOK7RuF
         T7w8Wb1u93mWsvrGkkzMvf9OlmFkzzKNsF389Qpv+jNNlTE7VBS62qXdWP/+SPYyzy2d
         +kEYdrr71J3mpZmt4vygATckB/Ipgv0cTl6Pa1sIANBfXImJDJHVaBuobKWh8dwzwWCy
         SHYDV7uQNtAmoVhatgmCh0/7Rd7gvx7Yt4gggCO6kNP/zCHSoL8SyIocQqhHj2nSqAxx
         mUhoOKnsHM7gxKeMQj+zX4m9jpeRgow+e1mq9bEuCCxbnMvOFG3w6Kt7YHk5XRa4T0Aq
         0sxw==
X-Forwarded-Encrypted: i=1; AJvYcCUCWGnjtqi6Ejs188ktBzE2rd2lEAnkr4qVt6MpAWa1vFJhBBQVApaXgmzfZPhzFXzoXTLbQIa0xus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1gFjd9IxvG/gcgzL4kXRymsfG4nPWk5L739v0qDO2dZ6wcCv
	TdTGQoAqRuOLIfaug77NvhCPLvnXOHK9C3Xzd9cdlB16wxzyeYUzeP2uzW98IRqpBQ==
X-Gm-Gg: ASbGncsfBV/+eWMnEkUjtbV63mgTNHbdzAwV6fMfH6+74KNTk4F/Ub9+L8rdGj9gm/E
	UpXeuckuIegUTFW4sJK7BEU0hGMTTGulGneeywvo1YJGc45VL7C0MOLbv/kpyZ9OxUY7w+6R6hq
	wUG1DKQuTBUFC5kXVRfBrzEM0HxPxBu2VPse2+hKyPZKbhLWlaDEkMhz3e7LVsuoSRh+ys6Jxze
	3paUrggWViWTWl31mw7CNSFw2qW8O06eVns2KB7GsH6Qfw4sa8GNioNxJeRwn/xWG+og3lp5JE3
	qXFnAyiPJA5bH8LNYbp7zcc/gjPszV2QZR7ccbRafsmT+bFTOWOuMzGf8PmeChHc7SjoL78BH9A
	LOEyVPDz+1NsgmUbw00ggCqEz2ykTMw5zNLgg526H4tWXa16fcb5zgladVZaGgSEm49H+WTHcOQ
	AydtbZwXDTZDxXd35wrZco0xZEFaZZai8jYqoSjRQPj3jO7KE50oKw
X-Google-Smtp-Source: AGHT+IFHhg72xm2TGOlgC80Jpbc+gsGTnmY9bbV9Ns7ch2lY+9eWvW41JSseHQ0nLr5q5q73zE6FJQ==
X-Received: by 2002:a05:6a00:9aa:b0:7aa:93d5:822c with SMTP id d2e1a72fcca58-7ba3c27267emr14948626b3a.23.1763487521172;
        Tue, 18 Nov 2025 09:38:41 -0800 (PST)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92782d390sm17124484b3a.60.2025.11.18.09.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 09:38:39 -0800 (PST)
Date: Tue, 18 Nov 2025 17:38:35 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	rppt@kernel.org, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net,
	brauner@kernel.org, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, saeedm@nvidia.com,
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com,
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com,
	skhawaja@google.com, chrisl@kernel.org
Subject: Re: [PATCH v6 06/20] liveupdate: luo_file: implement file systems
 callbacks
Message-ID: <aRyvG308oNRVzuN7@google.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-7-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115233409.768044-7-pasha.tatashin@soleen.com>

On 2025-11-15 06:33 PM, Pasha Tatashin wrote:
> This patch implements the core mechanism for managing preserved
> files throughout the live update lifecycle. It provides the logic to
> invoke the file handler callbacks (preserve, unpreserve, freeze,
> unfreeze, retrieve, and finish) at the appropriate stages.
> 
> During the reboot phase, luo_file_freeze() serializes the final
> metadata for each file (handler compatible string, token, and data
> handle) into a memory region preserved by KHO. In the new kernel,
> luo_file_deserialize() reconstructs the in-memory file list from this
> data, preparing the session for retrieval.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

> +int liveupdate_register_file_handler(struct liveupdate_file_handler *h);

Should there be a way to unregister a file handler?

If VFIO is built as module then I think it  would need to be able to
unregister its file handler when the module is unloaded to avoid leaking
pointers to its text in LUO.
