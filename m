Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522399;
	b=imqRlCGBoNHD0Lw2jAa1N7Fw0Acl4uYPZAVsySo1PKx7dEteSNZ6yh1mZNRDnCSLKiaA
	 ScuvNPEjCA992IRDUgAQTf/vb/rWoNOSvBx4ObJtZuB4y/NWOOelxs/GaTd5VyMU5C+fs
	 0ul2Dzf+S9FKTv+HFeAWpZtSaCwZU7ZfE48UfYKZ/TRROt4eneSAzW081meQoduY4A7ar
	 eqSHJtsIuEsp6QC5SoCEPsqa/zrCINmiypc/BU7GuKyowfG3OlTK5A1OPAxkPgvt7pJM5
	 T4OBdvOHchwgbZwCvhO78TCD5KWYJq+EdrghxIu5x7HE77gsQmWeIfF00NOjftmNtUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
	b=sX39Z52CHZmaGAK1tZQ7Pgfu0rtlXzQhdUU3aLse+aK7GMo+UuvZaxiXeiGwWLZCMsXM
	 gioNiJcllroZtLvUkXGpTzrJRMb8QB/AZYLsRB5V17gAgEcQkYJp+XpABa4n7yyyN4zuD
	 Tou5q5mGJck96dvGvYzPI9YU/WXjztG4W0gIBtcOEqf1n+vB0+dUC34jvv6DvTfY3u+8q
	 Zl3tmPuI9xzW+1r7mDQWZ48xWgon0c+275zBIx7vXBqCeybqqwh/wTMiwWyRTZvVqpi4Z
	 twZIRUxYelZ9SesURXMfkVSegeHjimjTnvfpOmLT+YBj6oy05jXKaur3kGAeewlJlHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="viTi3/8K";
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4174606A326
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 12:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4174606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=viTi3/8K
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c08539c827so3353951e87.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 04:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795522396; x=1796127196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
        b=viTi3/8KeIE8uhX56JlXlP6/VB/uifLp1YNde/hFxWBVL09rfHt1AgzNSQ1xTLYKYW
         TxNBy5Mj7sV0GRKJ160Si2rkUSAgJn33iwqUin2swB01y6Ut9G2oo/NtD6GwmuBWsdGK
         pBscQJ//hVMyPypXQMgFo5oJH1vUFdJ5blh4dTSbHXAdAibs/3F+XbUA3jS5gh2JSVOJ
         LN2T2nENIFcXoTm0K25ZjYzgf6wvRTivXcZG6y1mBdXRA/xDPzAu9oc8mACnMdnRVp8I
         5SJUX/xIX1KhwdTHpI3kikeVNii6iesD7pV4JscgeRxDpEqmN+UfwGtYVMRPotk3OsIE
         2nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522396; x=1796127196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
        b=S6uPziWh+zBz9LQ0NwoaySuf8IF7kwWsyHacJPE3e2zxWhrWwueJmp3Q8SHmnN/lg3
         b1gw6Gc5CsSMMypU4W5cQ60nuUo16gBpyyAk6/lSNuYpEm0WGtFQEGHlrS+PIonDexYb
         pvgj2EN6nHAoZlDiQIF+mssb33Tnx5FD/eSWMjpt6D2ldYTs8Mv9uPccPm4N2Kd5S/86
         STCBgXnSG3gshxuTKVHafztegA3pKDIL6StXmpTn9Lp2jfjyLKnK61THmDawwT6Z9ho5
         Zd6wduzxUJOa9+hkNFEkG6QcCLRBYIosWVa5hzkFurwxrdo9ir9jisrw4bEJqNIzqj3a
         ELOg==
X-Forwarded-Encrypted: i=1; AL+hErEok/Xl4xUncSyuEGR1IpmpSXa++ZUfgLDZCIUj1QN+nUDMeCkG7ufRkHlHbrxpqDC0v0FZ3pf8UPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L+H8vZ0M2uR/CPXfgmJMo1+JUBObd3bpISt3vrjBhuxanFYXn
	mo/E+heEoR9kG95UphcaFpML1HWSAyG53TG4A58tPmWQf6qfpc96F8HiJZ4JkTlGqeU=
X-Gm-Gg: AZFdTZdR6nOI3sbyk9NBuaIrtfBPeysSi9JEhHmp+saJX8xJnoMc377F0DbsWsHY22e
	2OZqwSmGUofTfuNVVRBFX+4FEbIDlxvBRqUod1CAcawXFMcxwvqshYIbnwcJ6gVkt9xL0o8t7/5
	/sTt5KK4+dM7hqm9HkH4UZvA09QjctCBMLWVurTPHf07/gI3q4I0lRde866SrPqcQR60pn0dYRz
	HJPxrDZFhbSWEibwc8usTezH2+5/evaWFjvZqmAaNxr0h5Ygo/95AaStJGTUzjMkIEAXbxVkJQ9
	JFfc7woyuFrD7mDcVena5an3z7hOKEJsvKjzOTtdRDdDIBLmPT1tMzz9J0vKFcAuIhEqwpbeWN5
	87dcYlkE1g2VSjIKEGzFKygJpbPqp/uLPUsCvyfkwK8z/7xwwGjsElGI7ci4ZdFhxUjn02ImnMb
	gW3gJLL9W+Apr4v2BJKtI2rZTq9xy0lgyT7z3u88OkDQOxXMzyAeA98G/8XoGauHFk2RhstWDVr
	enXG0eN1Kd55QXcDryA9Sqo7la52cWZC8p5Gch4GFdJtJZ2iO6OOJm7cSU1i3iRefyK6c0PliaI
	8DDpqVG0TACqoYFIVXYpp9pQT+b+ljXBeCbBXg==
X-Received: by 2002:a05:6512:23a9:b0:5c1:6065:40d with SMTP id 2adb3069b0e04-5c1bc867b6dmr3406850e87.38.1795522395833;
        Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01c018sm3681005e87.44.2026.11.24.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Date: Tue, 24 Nov 2026 13:13:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, zohar@linux.ibm.com, 
	aneesh.kumar@kernel.org, dave.jiang@intel.com, nik.borisov@suse.com, 
	sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <awV_P5443pO4yJa5@FV6GYCPJ69>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
 <20261123151128.GD179082@ziepe.ca>
 <awRYr7yB8IWj7S3G@kernel.org>
 <awRan8ZELzpTwduV@kernel.org>
 <20261123154042.GI179082@ziepe.ca>
 <awRe-A_KeE_kXyPq@kernel.org>
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
In-Reply-To: <awRe-A_KeE_kXyPq@kernel.org>

Mon, Nov 23, 2026 at 04:42:48PM +0100, jarkko@kernel.org wrote:
>On Mon, Nov 23, 2026 at 11:40:42AM -0400, Jason Gunthorpe wrote:
>> On Mon, Nov 23, 2026 at 05:24:15PM +0200, Jarkko Sakkinen wrote:
>> > > > > As per the function, perhaps tpm2_calc_event_log_size() should be
>> > > > > relocated to lib and have non-TPM name like firmware_event_log_size()
>> > > > > or something.
>> > > > 
>> > > > Probably under drivers/attestation since that is where all the TCG
>> > > > formatted logs should end up. It should be 'tcg_event_log_size()' or
>> > > > something. Maybe a tiny module for it like we would have done in lib/
>> > > 
>> > > +1 for the name, as it is obviously more accurate prefix.
>> > 
>> > Location, I don't know. I was thinking something like "lib/tcg.c" with
>> > routines that are plain calculations based on TCG/TPM data.
>> 
>> I think we should not have new users outside attestation subsystem,
>> but the legacy onces will still exist obviously..
>> 
>> IDK either, but this is my guess..
>
>No strong opinions on this; just unpurging my thoughts.

Okay, will put have this in a helper lib.


>
>> 
>> > And perhaps for tpm_buf (both stack/heap allocatable), if Trenchboot
>> > ever moves forward.
>> 
>> DRTM users will route through attestation subsystem to do their
>> extends so the tpm_buf user would be the TPM driver inside
>> attestation. We definitely need this for ROT agility.
>> 
>> We should be able to build the attestation TPM driver without any
>> trenchboot stuff to motivate it.
>
>OK, this was my guess but did not know it by fact.
>
>> 
>> Jason
>
>
>Br, Jarkko
