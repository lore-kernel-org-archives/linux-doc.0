Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5EA3806DA
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564787; cv=none; b=kVkLy/jjIk6eX1JeeiQfEU/pRG5dn9SuWCWftOyQHWzIV/Cye3wyverEgN+NRTAHh/OfwrAEuSwa7Wz79xw3BgMQzKKmtkXekki1esifqakz9RqSzRBRXRdDNUOQB2KZjGbGnverIgxiV+AUfmtejrZtwz63xlnWq9HamDvxv24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564787; c=relaxed/simple;
	bh=fCWw0Trjnxse44I8g0/geXOuyNpXr43fX6tn+i6FZ7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRfOK+so/PBZ6LGHR2dxfBnZNjjk8Mf+HpCoUdWlRszOK8RV+hKHzzNlsFsNjDa7lly0Z551DJh/gv8In7B17Hj4ICljVp5zlWPYet6abNg9trutZc8MHfBFrH2qqv1ySskP/R5bxIIvjerXnbY/ZgWa1yKytl9CgiAu9Bb40P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b3ddw9Uf; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b3ddw9Uf"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1718228a12.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789564784; x=1790169584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/g2oyb1OwyLHE2WzpJBh/jQ1AsTk6Ezgm+5y3dxq+Tw=;
        b=b3ddw9UfrwqrjZKQdivrcL7IsRbQHVgcfyFeGHsFlpyaekr3MZ6dZJqrYetG2drAWb
         PqjCrWOKKycNtnxpZhmY4w52K41AlzsA+Ser7/c2ufy95x1eGBC0BA1aqnStI731RFou
         rOIvcsv/quJqQLFCpAMEp2TMKullerHStCDF4aU/Eipsc0Lm3GD/dQ4sIXsd3ZMh0RXH
         ejmIuUU7EUFn6tXyJ2Mvr6mSv4bFIELlpywYnakWr1n1AlToDECyk5kO8hnPseBF4bV8
         YIzaiQVqULQhlAPBXk+6afXTA4NSglZHfKxxmVGC41hjP8Msm692XGXc//25fX1s67lr
         raLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564784; x=1790169584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g2oyb1OwyLHE2WzpJBh/jQ1AsTk6Ezgm+5y3dxq+Tw=;
        b=SljEPHmL1h9hmpTEWMYJCX18yy4oNoQraMEbCIF8ARrFB853T9qdPytR7EoNn6t2BO
         20z4/ImADsOweumlcl+91CNbZRuW6Mf0j0n/4iJWiqNAnEVT5P6nX8XTRudRwR8oreu9
         d3iOxoW4SpbPEzYZb4gCDTw0CIOprN8WupSCWGp8LFfZPHDNIPWdFFT7KLRkA0FbNRce
         CmnjD6F35gNixiuWqyg5KYz7ucB37gJtWwKfp7PlXA3acNE2gMTdD27JNRbYt5PIlPcT
         ICp+/iQCSdUA1hvmQQZb9XN5wGmnkbFlv5LHh6a3+hDtCwHXeFwkUWdrMHRhdwbU/QXF
         lfFw==
X-Forwarded-Encrypted: i=1; AKwUvBya0p5q/QZaPn32ruVSayrSU0l62L7q6Bg8XOxWV0cWLfk71pJzIvgg3zOoulj6v1HXYRwvEH/R6g4=@vger.kernel.org
X-Gm-Message-State: AFuF++k0bQ1YHzIJ69u3c1Q8qicU8BOd44jRq8YF0wLqQYx89iyC5bwr
	ACNjPHpk65k1+xnA1z4QRAkTCojVhNlU9hzr+0HNGYwVZb2HuoezUYvnl7sPhq3ovkE=
X-Gm-Gg: AYBFou34RawVGSB9OToRelUZ+Jsmlzdo2MZ1JgxQfSENXX1A+iaGZ/Zjp2uTjvLgvec
	DiY+mf19gMHA0v4Gx1XaxmtKum6N8O0G142EVubw91nEqj8D2zo+lawgAbpPrcvNHMJeF8ST6I2
	HbeWpATdJCxla9JeeqC4ph7Bj6LZI76Pkae2yuH5TB+5aesWq0uwm6bm0jTwGcwbEqhzZyA2me4
	Z8DKZe1w+TE5FiX1TtbRUokEZDL4X2wViWlNwJxddVK0pp1HaOQiCMSqyV4HHaQar5CkLdXMQlN
	kH5tSI647lJjCZl145SUCSbmI71DjHPmPKx8Nz14mzz0sVUcf0CCCTPnUtFeG1enLTNt5tVvQpy
	C74vcuKNpW5OCwxjRum+ReuMWDTrkWiboXnEnOotgYXpdxU55UeuJwoHPT5JlKglwx2+fksPISs
	3k3wmm/fxKiHGpmQCt2ht5p9Wu5YBKRCZaX24OFpnNFTTRz5S+2szel3o7hZoB
X-Received: by 2002:a05:6402:1f12:b0:6a9:a5e7:f8d3 with SMTP id 4fb4d7f45d1cf-6aa223a42b5mr1916895a12.19.1789564784428;
        Wed, 16 Sep 2026 06:19:44 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe07e4sm1748298a12.2.2026.09.16.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:19:44 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:19:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kyle Meyer <kyle.meyer@hpe.com>, akpm@linux-foundation.org,
	corbet@lwn.net, linmiaohe@huawei.com, shuah@kernel.org,
	tony.luck@intel.com, jane.chu@oracle.com, jiaqiyan@google.com,
	Liam.Howlett@oracle.com, bp@alien8.de, hannes@cmpxchg.org,
	jack@suse.cz, joel.granados@kernel.org, laoar.shao@gmail.com,
	lorenzo.stoakes@oracle.com, mclapinski@google.com,
	nao.horiguchi@gmail.com, osalvador@suse.de,
	rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
	shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqqXbwglwYTyTuUG@tiehlicka>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <aqkCbgHmMGxI_GLG@tiehlicka>
 <aqmGd0GGUCkbZpkZ@hpe.com>
 <aqpYxAktjexhaMGc@tiehlicka>
 <ad36cd54-7319-4bb4-bf8f-9fcc7b009158@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad36cd54-7319-4bb4-bf8f-9fcc7b009158@kernel.org>

On Wed 16-09-26 15:08:45, David Hildenbrand wrote:
> 
> > 
> > OK, so apparently there are some BIOSes which abuse this feature to
> > mimic a real HW poisoning. This doesn't change the overall picture
> > though
> 
> Is this really abusing? We know that a page is shaky and will likely go bad in
> the future, For now it is still accessible. Trying to migrate off that page stop
> using it right away sounds pretty logical to me.

Yes, no dispute on that. But we have HW poisoning for exactly that
purpose, no?

> Now, the weird thing is that for hugetlb we wants a different behavior (keep
> using the page and ignore the request to evacuate).

Exactly

-- 
Michal Hocko
SUSE Labs
