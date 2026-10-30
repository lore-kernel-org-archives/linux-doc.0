Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372580;
	b=fO9tQGUPgRJOXNSIUq/7uB+RsGUEnao48V2Bz0bISV5awdwYcgyMjpZOBgRjoFnyFGFk
	 u5lUMfsLS2KB75l1ka83RUmnKoqe90pLuGWP/uCnHhY5UBy0e0TZ1P2XgDlNsu5P0BJ/B
	 6b3HuyfJLi+50pJOw7Y1dfDI3JSLNWRr3TFuI1Q9fk0unEFGrDXD4RK4ULyFVV7JsjKp9
	 3ichD4Mbcb6nFeWFAiwtRtMRfomOAvuusfpbplbCE5kBH2UnXd6DGTlRC8nLA5VAHFW04
	 3AkajumWsXuiyGvueXOy4sl4EbofiYHQdYgazn6PlzN630IX8PB89436A/coJnwHpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
	b=CuOsFfSmXSvpi/clPfBF7RC5eTyKhKe/SNkTKnUiQLPMqzrnYVHM/AkafI77Z1cLz0s5
	 xL5vYhCLtXWbmVJXYNf15wbjqPUfUT+ycylrnaseUYuVFB268QpFNCS9U8jcWD+ggI363
	 bJMATaVSRqwjf3Lza/4JqRI0mJU6kMlhFC3+1FLkRN/l3lsNdShQkxXQtJdgSDBc4CQ7p
	 +mfTo0y9u3Gn7ACUYfsYDoKAWK/Zz/uHyoqygUjBHrd+UEAN9oxlevONWamPPhnauGser
	 PrAVxAyDBFTIFVoAgYXqutqWO8EoQC12+fGpoI3ukdv76zSq5nK/BN2L6Yl4nuWAxQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wwfcN5xh;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE5606A31E
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 15:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FE5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wwfcN5xh
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so7620865e9.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793372577; x=1793977377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
        b=wwfcN5xhJxmJIEs/AzLSOKGoZTkD6+8NGP2qYbyNFhJ3ZePhPC12lXgsmIHSzpBzcO
         71d0fBrr1/B0EVWRwTU4JSXXvJ/Wr1eHyWOr6vbvgmdkDIWvglRqf4i9q++G0XE3NJ8i
         S2xNR+q8cf0+NqHemf9xQpAofRPyggoeqvaCmnZTKQtViK6XnkkmWIqV5NXQQ7TxzVF2
         ZZ0TVZcs3kkfzqhYZ3v4MGg348nCq3l3bT/bwopwha2MLL2cYn1f5N9xcPZtRK96BFm0
         9J6dNo27JRTdybTsDSGt55KhTK18zZR2Ab+2mEsVjSiKfFzKHINGh8jYyPI2Ol1FvCLG
         s7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372577; x=1793977377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
        b=zX2bE7keZtyOF+N/m7RckkFQxd396BJeyn3Tg9wL032ZD9baNTkNB0f1Ou9wnukn0g
         NR8H4DnFfB01Qg6Vw5bjIasOoI7+bBJqHVTjZMzj4wM1si/IVY8e4epaQmObaptw4I1X
         FxZPrQoTAON90pxm/e/gXrd2sE7dI4H5kSrp+cCVYH4m46rlY4x03+tucB9rbv0dutGn
         llULIy83h14339bULVE+YcHU7Xf86LG7DrUbSV/yG+Tt5E/95sYDjyap5itn9y3gY3Qw
         fxYTPwpCTaHzepZH/yxjc7oEmIFo6PAA/qRASafXpKeiwjSZP/RMOE5Sdo1uMHdHtqds
         Al4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzw5B5e2+mbCgFvKH8ZUHTnWUVsPykmuAGhwO9gmYduNqQUmel0FnNMx40/sqV3B9w/Oxp7ovbEToQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmpaZRWdVztFjFHW2+whrB/HEMLW9uVA4bfvnx6309A6q7SUjf
	nW7N7roccicRWe8T1mKXA1FMGN8vVlc/OhYcDmxG0DdXlkPjEb2UiqZWHismeeOQY3Q=
X-Gm-Gg: AYBFou1JVsuzfWEizOVj8yIw5hocJ2Rf1wlIrxoXHsL/NGBr0rTC3Aylbpqza1fZdCS
	74KDG5kjQTgOWRLJkopT9gaCABmcIqB7wwf9kgEhm9GeSZD05kiUpnqnQrXfV7IHxFH4q/tNZff
	6NV4qyQB8cY+awQcIJ8a1+xLquapGGTkyKZSSxL5DvkadFY0rXYQNaii3ORIlyvlQsVVCQV756z
	XPA5ZqhjxeM59iUw69R8GPk0yvf0u5esUNdL8jzS9dU550fkTA5y4K+kztOrOkdFGRTfe8B9UFn
	s0JFxP3P3q+O0I4JrOm2vWAwVRauVIvwm/qRu3tLVsKc3y2Op0FcO624/Pe6kgDFdzrb992mDrW
	tS7rETuWDMJRseN5cST2rLbuZcPzx5xck517oRAjMn6SeWArXJy4BokOEbq1+JlRdcw8ZoYahko
	fXeqkbyxoTDTMB+WUNjgTZuVdXitv47lER0owmQeF/ISONyzeLKebTQWKxwSTxoT3kzTc+mSAI7
	LJPQLCNJM/8LE5KXrweEhEogqWB+WXDzNoFJwik4gyH/R6V2BPt8ZylnD0yXpmBkR7IdDxHnxIH
	CeMN0FUKmdjSU5/klFweeKoWq6QBSybsar/ESMBH
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr55863395e9.31.1793372577101;
        Fri, 30 Oct 2026 08:02:57 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm3623785f8f.36.2026.10.30.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:02:56 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:02:52 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auSxhgC30bubNJpI@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]


>> +++ b/Documentation/ctlv/abi/ctlv-attestation.yaml
>> @@ -0,0 +1,184 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv-attestation family, written by
>> +# "make -C tools/ctlv abi-update".
>> +#
>> +# The checker compares this family's declarations and inherited stub fills
>> +# against this file. Updating it is how a UAPI change gets reviewed; an update
>> +# that removes or renumbers anything, narrows a bound, or makes a placement
>> +# required is an ABI break, whatever this file says afterwards.
>
>Have the generator emit a line showing the original yaml file this was
>generated from?

Okay.

[..]
