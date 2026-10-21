Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587896;
	b=FIOEfbahuNFYU8dUAuTGLAmi9iULMvq1jCQcYKQwS1PfvQMnqyrWONUzTy7wQZ9qFNu/
	 9M4DoRZ9bHOovCANu+Ipnn3XU3ZXA5UOfP2NVb+AJFne+9c79aOJ9XXsF/7f96Vp4lZF3
	 DsdVJsk3N5NN4YPxgdndc3sMWO7QN9UtQXl4Yc0Axg+9JjNSr9Sl6NT/t277gG38HH2V+
	 QYpz/WleFYVyuoIC5A5+bbLj34XXx4sQiJMKGuwHl04MtRu8RTq1YgE2qzrsXaBZsApvW
	 N5idDiWaDYyBjJQR5cby2+jgUXcaSBX+X2q8XFutixnECet8QKRQmkM7v5RQR6nPUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
	b=iaWfpIB+VLEtLaU27/Ye7BPcb+wsOnDcLbF4fYeSk3SkMq3uucQUPhhPyUVtIdkBLvcG
	 nrMGtqkua2mNRlyge88hcDoCmNg8ULZ+P8pmi6pLP1SkbkjuuM31k3/kQ1OZPVgqa131m
	 +w4wx99gdjbRWfH+BRaDWZ4RatDyeqLF9AuLU1AAZxMM2j9Tm5xK9DJdSm6UrRlUqsE09
	 sdb+j+MXoy7Uv7CUJsQS1pruKs3zqM9uecYAkxVont6xdZuKdwV9d4W/2eknDIQY5HFaE
	 VO5gtLZ5zFvF7s8+b/hiQcqJOVaYmIyZYkHr6WbRKaHNCGP6chi5qmNQfsmzZU0cmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=CFLBbsMY;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F79606A31D
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 13:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F79606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=CFLBbsMY
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3047565e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792587893; x=1793192693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
        b=CFLBbsMYwkrufn9yAq0dSA5Z2c8I2rI4qRFb2c71CsfhYTuPu1XRsLh69ZdtqYM98x
         9C7RY1x4yjmLKjlv5JMunmxpuiHgr10OI/zCMoNcmyFwjHLmzfgUNQ8rWUEAJRoNAgPd
         zx6f1rQ+q6QLX+7BmMwMlP6A/8+Oc5Yrau5gTZOanD+1ts5Aa7lgDfF10KVx3gHSb730
         rAnUJJ7t2T2AqgXlhscveNcqek8YMjE2eKzx6NEQ7hcihBA0/X7uvPVcD7TOMvGRg+CI
         VJqsYeSAGOgzr7gowdk3glF2ev0bFVuPoPFN+QB9wwVANRdfS5JCQbZWv6FroeDwvu9l
         NhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587893; x=1793192693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
        b=uPCAgAgGiWKdkP8F8fHNSz/mRHTiGPQNe9Uu//bIonfTC5hh8h5hXGKtoF81fuPBGl
         Pa/SlK15hz3jt35oOi6nINm6Oxt2kt/v84ybUxEkXNVDKquuQtlPUcnYxzf9bwVKB9/t
         hvNis+MjAR3Q166cnCuEdRO1Vg/fXSV4D36tGyil+kgrmS693HYrD3iNwzGS/P3ZwrYt
         LgNMVUNJ5D8yJsuVin8ZxGekrfHhEyRhTnvVXG/TzVj3AyA/TX1I0hGjlj1vElUmGGLM
         WOP4qBI7jX3g9JICKote+iyLT+GgcX6IyolcU+n1EGL5GVwDcnPWbLxoogn/v67DnHzI
         GAKg==
X-Forwarded-Encrypted: i=1; AKwUvBzTM1/FHWRwvlFG7CuhY3ueCCV4V2rR/SOnJ1Av5Qc5itzeSV5GZ4ifgkJCAoYOSwSs51xJI3lt22c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVdm/3xO1Qy94MpjAcieB80tIauHRunlRrwhirFR/QVrBuX/C/
	s5vMFFtAeBTEz+66iylD9UpaCZQdY7wKvd4dKJEZ74qRXDX0mkHCx/vzOH2lbeqgASY=
X-Gm-Gg: AYBFou09oEkRKVvjiSBMhEGdEZ2AWMk+kc/T/6pBiyVwMKM0/iCuS9pW4NUGeqBpQ3T
	C605Ei0H2U+FXzYjGudaj/ZeAJjMTE6m+/vjyQhuVxIDosJkeQM2Io6tuQVv25EayrnmlZ1McjL
	gKlWKN8aYzhoJAvz3RjGWI2uQm2WtzK4OcYX9yunM1KEA0ibDmpn8MgsHbtWdThbUSnbUyuiskR
	/2Ez8A5xUgeSAwJ1K6/BeePNhgyeFt3xwhdaB1WAq1MOExEXKFgMCn83GfgPJRAuWDDn8lbQ/Wd
	Ms+fcStqCz+bq3RCAiQUwm5T66RWxbnWOvXLjV3h9RTFJDe5Evba4Lk5OKBcsD0KE4fsNlKP4Kn
	Gam/Y6fN7cA1OaepzboCrKSvEBgmh+zsBg5MxyBBH7W7g7QVrNWdAt5Aj624izPLFQWjz6Jpmar
	WwTDMXCXJ43pb7HOUY8C3rYZ/SzOL1lTqU0Ee0ZM+4VbvqYX/OxJh+RzfswUIncsCzeLxASCEI2
	DPYSG6Ac9ZEjqEW5qqBX+uDpnbyTuJKKI8QavCh/P+wD7OBwOb8TN/Rc8Zfe2n5qEvyfnw/pzM4
	MwJR8X3ZV7+q
X-Received: by 2002:a05:600c:3512:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a1fd8a3fd3mr39461765e9.1.1792587893167;
        Wed, 21 Oct 2026 06:04:53 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835c77sm5101952f8f.36.2026.10.21.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:04:52 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:04:49 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <ati4arl9sf1Rgnob@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
 <179245258506.58760.1633805100070716498.b4-review@b4>
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
In-Reply-To: <179245258506.58760.1633805100070716498.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 99 lines skipped ... ]
>> +++ b/drivers/attestation/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig ATTESTATION
>> +	tristate "Attestation"
>> +	depends on CTLV
>
>ld.lld-21: error: undefined symbol: hash_digest_size
>>>> referenced by ctlv.c
>>>>               drivers/attestation/core/ctlv.o:(ctlv_attestation_mr_read_query) in archive vmlinux.a
>>>> referenced by ctlv.c
>
>Needs a:
>
>+       select CRYPTO_HASH_INFO

Ack

>
>-- 
>Jason
