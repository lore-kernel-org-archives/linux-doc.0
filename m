Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382390;
	b=m7Uq5gSSCKeanE1RMPpe1cWXOOl7pK0tp6jf001WOTrSaMT5DTff7IpJe4sZCGoIaCXE
	 /818v08NAjspRjjOPTrUpmHAE0GwJuuD/rkUMvjqW3Di25+tmO/m1jHQA0vZl7d2rd4Iz
	 LCjoxV4eZ5xzqb1h5vaoUuPoxloL4n9jeZESLqfdiILW8S0KCL03DTKoPrOVDU0nDQGDF
	 s2e1fiAM7THSUV9sQ6Ajrbx8OhvJzEY3Xz01tv++onCmFlSN7OzNAUx6MrtqYM0ztz1H1
	 OFoOgRIYBRVemEHPRlAcaiN93rTOKE2rhjtd5dXPvfbFYUHu1tQaJkZfrS3U4K2As9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
	b=PCOlQdETCPP+K7d5vfp78lIzrk3uoLJPK4wFsOcgOKmYMdvemRkopZ2wqdqtKXzA/mXb
	 Wz3H5vK7se0epLisiP0U+YFGJ3WtuPd6BpL12HrUVD996bzVIV1xBH0yL20iuw74gt7H3
	 ghvj/vGcxRmltlvpjBDhlozQoGv3BgfL18BGI9V3AEzVV11qqPqMjTTwLwf/dZfK8T0Rk
	 aDhv02PocT0bhZRyZVh1SsY3BkxG4rALWZyTe7YNI4dIYSvbOWy4rESyQMnCn5F44K6iq
	 U0PqlPfz9Q7mzHu6D446V04SDq/ndfHBr90Oij0hqY6yDRdYJrb9CJNKyA0ML1yBCPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6YuWc3T;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE9606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFE9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6YuWc3T
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f048bc09d7so61365ad.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795382389; x=1795987189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
        b=Q6YuWc3T3SalsZoSZ7nZACQHkeGNao4ybVKhTt0wRTBMWq/STNikHYxymoVlbxJKwt
         ObO7f6LqOfkLa0ZWQsDUJxcoIFT1R7RX+ch+NcX9HjC1fUkz2lVXWap2Fhk6d1BNQ0/q
         ou34OmAd2JjIq4liY6+XTlyVs7lAo8j7mMJNCn4UbXdO1PySd7WVB7CcG5aY5NFk6zeK
         MTPQ2mPRuN0yBX2byMj04WfBHffJTGoEmJVbEpdFlNNAdwmn3w7R5fnIWHJ14+7KZJBj
         9JP319l80gUmvzuJ9ttWm+kYAoDSsisjSAMPzJOAjU3H2qQMyoaLkA8b4AIwL0EJiVEx
         8BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795382389; x=1795987189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
        b=1q4ihMTDAgNRR2TeQyxUeggUXyxdYaTsFyL+SKdTqIsWMu0rpDrJLBQt8kdsIpBLPg
         qPjP5ezbzIG9Ash+uN8eEDkTJSBJX/5PbqR3xcEzNazgh6dTY2bV9c/foyPKGNbZs80D
         /AXVOkBK0TXuXs+FS4uHr8Ue50GrnEfAR6GN6uH7UBmCRHlrXPJQhiq9BM9GW32skK0I
         bNhGdn+QIrXAKvbWvL5OI4nfiDk2EMmtZBdPCn1uSAgCWdlXeTMD8JE8i21TQGOCJlct
         68JpH+Av6TQKFj4MEFD6r7q8Y+MeG6+7YROvKp3iy+Alj5zmvpefLP0vL+q3F3sIOKXV
         E3pA==
X-Forwarded-Encrypted: i=1; AL+hErFrE2gbdeuqt98sZ9mE4XuSNVAumD05XX1zfj49jp9a0n/CIwEGOFXQBaoeg6h17p8fZteyDbqlhUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z910nxJGvJWcBjg00TIMcq7McTAoWsWnOJE+yzKxsmmIpK3IQPX
	lo503AMypSOIPHuCfeE1pw3LBuZLXrrpDBQucjsWDZdIqpPIRey9Et0o7e/2LX8jCg==
X-Gm-Gg: AZFdTZeZPh/1Qv55n0yHNXPuPrHy2jm8J37JuSq9C2M/9QGwlbCKgOaLsN0srIJTiPh
	97BpVobPTsN/xSrrlpvPgEaF6gr4sGdu3P2P+4UmEbmfvbownwKM2vBOTPJm4Se1CatCm7y5HYd
	W/P3Wn1PUEJxQfBDIm7oLPUOJ2kW3Csh9sqpcOLH1CD2UTCngQ3NeZ90cr3L7gaxB93W88t4p1H
	HfJTuWW+jOgKzQOSk9ezZHFndUMxOOehY88BW/RVYiuiz9eU2YGc4vpxbkkceYUa5aMIYIgzX4o
	8FjJDuNS875sdaT60/lrsx7cDOsv2Lm8igGnqBA0AHm2RxU8cyNDdHvFREi7jk6KFoYXNCRroAd
	5a9/Je2OgF/y9CpcaBmQsG8aijYE8rolFiw3RtFvdrw0Sv45d2yH+VhbxfOdu0HXlNXQgnH9gcJ
	3bWaBNynF0SEId99MnN6KJnc0y9UkpH7LPEEHTyLlymTUdIOYFr25+8rESthJYa55Kl21gDM2s2
	tX0FXw9/QN/ru0NsMX9/ds4e5tet7y+Po6iEltedQiM01rR/sW2qYI7PpSEB1GR/1Vh9KhckrPN
	qFrTPxfZ2D8ucNYtnRCCLALhkPOWQZeVo3yIJX29Jp0Kc6HpmpX6yrWX+hz1zFLUdOOYsoJ/tOF
	m+iuv2nJDQ76bkWZaD4OTtw==
X-Received: by 2002:a17:903:19e3:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2f066708a17mr4257845ad.15.1795382388397;
        Sun, 22 Nov 2026 13:19:48 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm18461423a91.8.2026.11.22.13.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:19:47 -0800 (PST)
Date: Sun, 22 Nov 2026 21:19:42 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 03/27] liveupdate: Export symbols needed by modules
Message-ID: <awNVk3q6Q6sAHn6U@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-4-vipinsh@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261102153656.1431701-4-vipinsh@google.com>

On Mon, Nov 02, 2026 at 07:36:32AM -0800, Vipin Sharma wrote:
>Export liveupdate_register_file_handler() and
>liveupdate_unregister_file_handler(). All of these will be used by
>vfio-pci in a subsequent commit, which can be built as a module.
>
>Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>Signed-off-by: Vipin Sharma <vipinsh@google.com>
>---
> kernel/liveupdate/luo_file.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
>index dbae0715220b..6aaa9a531428 100644
>--- a/kernel/liveupdate/luo_file.c
>+++ b/kernel/liveupdate/luo_file.c
>@@ -916,6 +916,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> 	up_write(&luo_register_rwlock);
> 	return err;
> }
>+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
>
> /**
>  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
>@@ -933,6 +934,7 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
> 	luo_flb_unregister_all(fh);
> 	list_del(&ACCESS_PRIVATE(fh, list));
> }
>+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
>
> /**
>  * liveupdate_get_token_outgoing - Get the token for a preserved file.
>-- 
>2.56.0.317.g454f8302e1-goog
>

Can you please send this separately, it can probably go in without rest
of the vfio changes? This is required by iommufd and guest_memfd also I
think.

Thanks,
Sami
