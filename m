Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488391;
	b=yEYYetlGfUxrO/GHDI9eziKu8CcYBNk+U8TYgUW1cEiE8QW/3ShQYFiZBdqB/ZQrY6Rr
	 FPAHpH+fLiK3MCFV2Nto0AW9t0EZSCvuWV0IF94Ixpluzka1BciXkpU85G6kCd1SmB/76
	 tvNqRS4irzl4d2kc4dlhVENZI1nxP8xkUnSAkywk/GY9HMwd29pq5V+apK8FGWgfM+2qR
	 U6vnK68Xm6Ubsbezd+RzYchDop0yjLCQ41OKci7j0Dso1LGBrSDuRr9XDB670OQKBCIv6
	 8oy0XVos9s03hlj0LJ9w4Fz9WnRVd8ZianWlgcj0jL06ZORwZeHJ7y+5FRXvaxk9BSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=V62r2oyMwKweJj3yBSLKefUPJg8WZq8H2U6uQoCWZWk=;
	b=A3iy7wDBcWZbMbfHJGC6oQlcypdboYHeYemRdolVO4b13UaiHwsxwuRnK4HQxhSEvirc
	 YQZ9JdxEvHVrEx3guLcnqMo1l+vwtp6+5EvwcwDXDfoyZGQjJI1c/5hDagL59vtj+gfuT
	 1QtegdEH/97KjXQMQYZNhfHiDDX1hG6nAMd8YyVTLyep5Ol3WxdiRnLegb8Gaq32si24T
	 auAB9DQr4rSmnh7TsuYiNZb66fUQ3BoGyX52UV13tNh9l12/OhxmWIG8RWfhzJToiMe+A
	 +2F8VMp1Z6naEY/r6Y9BCTmLwq2pD89YJlMTbjXsfNUQ9b9oPxqo3p87onrK5Vt3g6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="fhvCsC+/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C2606A31E
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 09:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=fhvCsC+/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2460717f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792488382; x=1793093182; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62r2oyMwKweJj3yBSLKefUPJg8WZq8H2U6uQoCWZWk=;
        b=fhvCsC+/L+1bMr0FsexCnKyo47rJycuSZvhM1BKIBfyQEvBc4uR/sxPFeFk4JgA7t6
         ZUkpMEKwzeepefXulk1T2CMQpi0g/pzzFgGmJrpUjsF3g+7REVFmvCtPKN9uVKJlpyhg
         SIXhOvTi1U/sZBl523YJrKCAFpZVjG1d+k0DGvO1WNKY4v0xlGsLDYiPW+FaRySiti+e
         KKRSVX3h0x1tMIjBGVVVSsR9Jr+yzC3/MIAs2y7Lhpmgy1IcNGiOig7oKzPugb3huFZA
         nuY+FFTctXbaTtHfBpdiocNGG6/21HoY8Mh07eXk3PPFlShlnFFBPcK3hwSIrKnqIgG5
         SsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488382; x=1793093182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V62r2oyMwKweJj3yBSLKefUPJg8WZq8H2U6uQoCWZWk=;
        b=UnLpCxRXM0V+4wLTW/rmb+mvs9iIM9X8seivO/f94UMjLuGrwt3tZ7TD4+VDLxV1Lc
         tfazQuAIX1e6AjvYsmmejNzKk0dOpFa9I7lzztfifoYWt+v9yoWRZf9k7qm9lgV3nCCD
         AVz0kSJivDeA9XJG2y7xRTuFcJgXpIWK7VuFLl0Lyxxxg/wReqBiaTbOfxNyuv+QzFft
         mp7Xj1gFFiY0UjcDhCZXMczmyXOCbDsKuj13Oc5kgMwthvYRrBqHZ3UPPt2efEC2gydh
         PPJ1NcohnaO6n9U8BSEcgjrqwJrGBj8fShHT4d/6CxDuyQ8Ocsd9rrHMU65zgQcGYKEz
         9yVA==
X-Forwarded-Encrypted: i=1; AKwUvBwR3/5bbhRAwbg17sOsbOH3NH5uaP78MoQysBr6+y7KuA3cbkXBHIYb3c8Uv3RvzUf4Srfp4nNPLLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBICBGrs27WTePGiBMFuYIIA+tWQiovrJNG+WP7wPLPuXOHq9h
	F2+03TFyeQhWlibQh9rir9IIik5X8JXDZInJqTsIspmwE4Tka7zzu0Ye2A+TzFtLp+0=
X-Gm-Gg: AYBFou1fjyOKovvqsUfXip+oomxJE+xMHzhtUX5kdlXQAsYHbxzhUbaar1A5HMs4FHh
	PrK+38C4nIDy+53y7KBQ6JvDCkOsWwuIA9zQcvT72dZQFgcDTUxG6UG4fJr7kMJmeTRAz3t04T2
	VkzKK97uHK8ObcNh5gPJ8dljNKKy+VYiSflU3rY9Vrjgwyh2nSWpp1dMdaqFyl4pKyvcxs9REst
	FywXATT+wDa6qIMHPOOMs6OdZ5rS7Ld41BhnQG9yhV/l6KNu2jUpqkad45Ux6A4NmRYtLgMTTz2
	W9zq/Jvk6xOMHTc7ckWM26HI1S8Lj2FXGc/u6zX/3xMnd694ngAmphEwlY6yaIeMZqpThvn1B1f
	PlklLtErtHF8hECOUXplbclGhPCerjHIfWu2nocM/WadWnv7sWwTs3XMxtwpWbJ+6DLoJNHdjLZ
	60YDcxx2eWdVUQ8DQcIukcqiBM9AhTwx+q8qjELTnCvtg8SyMfh8H4TS1igkkPHbVDrtYXG6IGO
	wSr/w==
X-Received: by 2002:a5d:5e87:0:b0:48e:1fb5:eac2 with SMTP id ffacd0b85a97d-48e1fb5eae1mr2877151f8f.12.1792488382209;
        Tue, 20 Oct 2026 02:26:22 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm4750276f8f.31.2026.10.20.02.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:26:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:26:17 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Dionna Glaze <drdeeglaze@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com, 
	zohar@linux.ibm.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atcypJ7oQ37oY8c2@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>

Mon, Oct 19, 2026 at 06:10:31PM +0200, drdeeglaze@gmail.com wrote:
>On Mon, Oct 19, 2026 at 5:08 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> Yeah, I was thinking about this and went back and forth. In the end, the
>> only reason for leaving it unbounded is to allow multiple independent
>> users of the same register. For example, IMA and systemd could share a
>> TDX RTMR. The systemd side would read the journal through the
>> attestation device and the IMA side through securityfs, but both are
>> views of the same journal. If one side truncated it, the other could no
>> longer replay the RTMR. Isn't this the valid usecase? Do you see how to
>> resolve this?
>>
>
>Bright minds have spent a significant amount of time working on this.
>
>+Roberto Sassu, +Mimi Zohar
>IMA logs and systemd logs are both system level concerns that are
>relevant to the OS construction, not individual users,
>so I would just say to reroute IMA to use ctlv using a kernel config
>setting, then make systemd the new system manager of the holistic log.

Yeah, isn't there a valid usecase for 2 separete userspace consumers
though? It could be a limitation, perhaps configurable :S


>The securityfs log contents can simply say, "log managed by ctlv" in
>this setting, in the form of the template identifier.

Yeah, I just wanted the existing userspace IMA ecosystem *just work*
without any distruption.


>For policy violations, only the 0... extend needs to go to ctlv.
>IMA can still keep its violation log as a ring buffer when it's not a
>1-to-1 violation to extension
>https://www.youtube.com/watch?v=gyYUYbdiN_4
