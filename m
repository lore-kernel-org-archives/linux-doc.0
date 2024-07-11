Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32C1662E2
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708046; cv=none; b=qlF7EGLbErt+01NfH2oQELkGLA2P3HrTnqqITyN7d6sED6qikxnhFEgxmCOcANYKjLw6zQixgDK2fdL0R/8vP50p/fZKHlQQC/BS1fRUe8stXjWD6XXC8LoyCHXzAoEuOFm+vP1zamTAL/oCPwKkbiGW9VbxtvcvCk6cToxaqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708046; c=relaxed/simple;
	bh=XMcLDNucyi6nSPUmygOtXlWNTj77p1UId/vpj/H+HtA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=o/5x1kdjSZloD9R+RnkBXBtl8ZJsBIfhYf5DDS3WjHDojHe7cZfnJBKf8wkEJeHWXDp4liulr4XGrx+s8uMA4r89yvUt9nSfpCcmi8kAB89NzjnHK83czUzP+EEHiAJ/I2llAR5tJX7kyAS/dd5N/7eoXe2Rq3bRxKpmSnqq6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffG+wbs4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffG+wbs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720708044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmruj8JQx1mckIvgayGotRB4kpYx01J5hU6lzx2ILak=;
	b=ffG+wbs4+j2VgjvPAATUN8X+x9orubALybe8StQ1TqhiPHIe1bJX0hTVvPOQkmJX5JlKxJ
	hAwkBTLAhrDgtP2faW/IvLQwems5YbPlgAaIjvd6YwyoXjX1hLBl/IlCmnvNsn0ITa1gCk
	RU+mSLepXbC6/y1UyEjQI/ORaMfQrp4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-QRxHuVV8NpaZt_7--h_QkA-1; Thu, 11 Jul 2024 10:27:22 -0400
X-MC-Unique: QRxHuVV8NpaZt_7--h_QkA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42490ae735dso8353975e9.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 07:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708041; x=1721312841;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmruj8JQx1mckIvgayGotRB4kpYx01J5hU6lzx2ILak=;
        b=kin/ypkaIp+dL9uzwHtRqgm/h7eBLYsGVioozSTaaKoVutvRzfg8SV0wkuy1uoDJj6
         U33q2+Q4ADiGd0EXMFIx770eQA2MOk57yV+QA/R0z9EVREbgAVlMWP7kdLBsEvdis07G
         yEU2RLzJXe1rPDv8JorYr9vRsRD48NCJ9vkJz+b0CPTrz7tNucoTHnX1wR5+/gVZQ5qp
         2q/Bo6TOBtKmlSLDHz++gCORLNzHL+yNTusRAFpaImLUW40ET79sjCghgyi+MQqT6u95
         csXzgQKycZh0hCO7shlXr0bHC13MFpKrScaVX/EuFNfiRcEblMFydMGx97E5ZUKY4Es/
         gi5w==
X-Forwarded-Encrypted: i=1; AJvYcCWaRFPaAHAnFt8RsbZ/+EEWxkoVYoS0FQmSQKzNdNV+OLW2Jq+Vy/Yd4D9DbWcuwCtizlLo8CYObxmt65DRDqEqqd8U4HMXToYQ
X-Gm-Message-State: AOJu0YygVjR/gi+fWE6ePN7FBJMYFHJ+7YtmviVprABHVd2+/XYayehE
	R5KNrfAHH3B4QOm4PHEyZrng3Li2s2vJL3UBLitQaUFFnCr5YEGwIXsDTK9PoFgYuHaXBlSClNI
	GadE5hlm+SBA31YytZJ4UDSZpFfScIitmO6APx/Y3YZN3/xXYKnpiDzlN6g==
X-Received: by 2002:a05:600c:2109:b0:426:58cb:8ca4 with SMTP id 5b1f17b1804b1-426708f1d36mr69105085e9.37.1720708041269;
        Thu, 11 Jul 2024 07:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnWMP7EKz4R63Sf6vdBXXcYvsJMKmcS8ZNh8guNp/zMBSdKX64ea5/eGfU35uCKVEDl19oUw==
X-Received: by 2002:a05:600c:2109:b0:426:58cb:8ca4 with SMTP id 5b1f17b1804b1-426708f1d36mr69104815e9.37.1720708040684;
        Thu, 11 Jul 2024 07:27:20 -0700 (PDT)
Received: from ?IPV6:2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d? (p200300cfd74b1cd51c4c0c09d73bc07d.dip0.t-ipconnect.de. [2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f737a63sm117471955e9.36.2024.07.11.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 07:27:19 -0700 (PDT)
Message-ID: <151cc130-3584-4b07-96e0-765b7efa43fe@redhat.com>
Date: Thu, 11 Jul 2024 16:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
From: Hanna Czenczek <hreitz@redhat.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
 Miklos Szeredi <mszeredi@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
References: <20240709111918.31233-1-hreitz@redhat.com>
 <20240709175652.GB1040492@perftesting>
 <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>
 <20240710184222.GA1167307@perftesting>
 <453a5eb6-204f-403a-b41d-faefdbcb8f50@redhat.com>
Content-Language: en-US
In-Reply-To: <453a5eb6-204f-403a-b41d-faefdbcb8f50@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.07.24 10:21, Hanna Czenczek wrote:
> On 10.07.24 20:42, Josef Bacik wrote:

[...]

>> So then the question is, why does it matter what virtiofsd is 
>> exposing?  I guess
>> that's the better question.  The guest shouldn't have to care if it's a
>> directory or a file right?  The mountpoint is going to be a 
>> directory, whatever
>> is backing it shouldn't matter.  Could you describe the exact thing 
>> you're
>> trying to accomplish?  Thanks,
>
> The mount point needs to be of the same mode as the root node of the 
> mounted filesystem, or it’ll be inaccessible after mounting[1].  In 
> this case, I want to export a regular file as the root node, so the 
> root node must be a regular file, too:

Sorry, I meant “[…], so the mount point must be a regular file, too”.

Hanna

