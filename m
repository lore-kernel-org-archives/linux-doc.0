Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B4156962
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686699; cv=none; b=i05Nnqkzm4Rf/4hic7S2z6RLGFL9Emc+8aMOrcEjK1ez6ONEiop49Y7chM88BAJQtDdBz/MO/Bsi2kXMJfHXfaJhEQqSYY4Tc9HUv6WurXR2azB3yCuR9wY9bpFwfpHeD8bAdKyLfmxc4KhyRLLprjrHi11UGOmnAdCN6U4rXqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686699; c=relaxed/simple;
	bh=J309idn94l6LfM69hofwVk6z9S7VT1vK5PVzSR4ifFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRFuSjWZDSHBDof7pLuIAUdsQZCx6RE90HUERJupDpRSNmkFl1fWMN6aULZ+IFECoBNHbbbhdcyeIrb7xeELau3f5Qyx8sXd/MBpRqp2W0cnNUppMo/8wIxXlMFxpsrsKJEuE9EHCyjPs5s4J438Vk8A8MJvE9ydVAj7a7546Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IxKOdkJu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IxKOdkJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720686696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsavuo7VjN4IgYGRQOpxjo6n2SWYiH9JroTE1iXSFAY=;
	b=IxKOdkJuuRUvFke+nipPaPBht/9CuajOQiN0BoLQXmy1hlWpQaHDVNZXoNohzCeq6Q7Oi3
	DivqyyEUZME3313TD39bPHyfuQJhIbE8wPCRaIS7b6ULrWtd7edIjzcS8i377k+twBz/UK
	mPFfzVrUwMFuyUG0ImcbT4X+GrXO7rQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-ogJrQmExM1m_zsO5AQFMrg-1; Thu, 11 Jul 2024 04:31:34 -0400
X-MC-Unique: ogJrQmExM1m_zsO5AQFMrg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4256667ebf9so4522465e9.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 01:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686693; x=1721291493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsavuo7VjN4IgYGRQOpxjo6n2SWYiH9JroTE1iXSFAY=;
        b=kUqPMrvOPAEE0wV98eXndufEMC3HcKUDXWLGVSMHQ5SSrLXtOlO3p4/QIXCUs1oNOK
         KN+fjA7Ad3ssZIwamcRTQmSx1h42+TjgGfwaXtbq/1n/LVCXsuyrOv0/n7w2AfYaDhCp
         g/cbmdRGYCaxjuqNW7hGBLlBtpkQs/u/t2S8rT+snhOjsZPdYfR3xrKqF19V/JwnxSEV
         ELymiBOpNEVH2bDN3bdHkFRlgkKMwmlaKfNakyFNYO9xa6CunzQnTzbdxn+hEWGuXVfi
         Taj92uZF/n+CVE/aIOWdkMUI8aqTYSm4WDOfPsgCGwIDzfcI2oTBWwCA/cOCWn20D0kW
         +QMg==
X-Forwarded-Encrypted: i=1; AJvYcCVNWDzMqv79QunrUqeQSxfP7u2NNpuLF7xaU2HxJv3ko9NSA5952FN+ygtznajgyjP2yqDTLZIlBWAwm5RRiSkgl8L8scfztZKZ
X-Gm-Message-State: AOJu0Yxgk7dmeH7JBDjCJ7Snlspgb8xrfgxRWQxmA3M55653y7deWKqU
	Et5PChU/52NcRTQu9v480boCsoQAd73ZCZ5/PRscgIqEXtzRycn7Kev8Bt6zIcgpo34u87GZiSf
	xy8hrpsxzE9NuGUvL5acuq6fDvjviGns77Foz3mFgpjl/Rd69X7HTqYOncA==
X-Received: by 2002:a05:600c:41d1:b0:426:5d37:67f0 with SMTP id 5b1f17b1804b1-426707cbd7amr47937255e9.13.1720686693629;
        Thu, 11 Jul 2024 01:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEsGmNWWpKzLdjjvHa8Oly0TKggOk/fmTsEbwHHsuebuNMp1P87hEdumnvEl9dAnc+GlyWXw==
X-Received: by 2002:a05:600c:41d1:b0:426:5d37:67f0 with SMTP id 5b1f17b1804b1-426707cbd7amr47937135e9.13.1720686693017;
        Thu, 11 Jul 2024 01:31:33 -0700 (PDT)
Received: from ?IPV6:2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d? (p200300cfd74b1cd51c4c0c09d73bc07d.dip0.t-ipconnect.de. [2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa0613sm7165414f8f.88.2024.07.11.01.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:31:32 -0700 (PDT)
Message-ID: <8268c602-7852-4d5b-86de-54b0a38cf244@redhat.com>
Date: Thu, 11 Jul 2024 10:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
 Miklos Szeredi <mszeredi@redhat.com>, German Maglione
 <gmaglione@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vivek Goyal <vgoyal@redhat.com>
References: <20240709111918.31233-1-hreitz@redhat.com>
 <20240710172828.GB542210@dynamic-pd01.res.v6.highway.a1.net>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20240710172828.GB542210@dynamic-pd01.res.v6.highway.a1.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.07.24 19:28, Stefan Hajnoczi wrote:
> On Tue, Jul 09, 2024 at 01:19:16PM +0200, Hanna Czenczek wrote:
>> Hi,
>>
>> We want to be able to mount filesystems that just consist of one regular
>> file via virtio-fs, i.e. no root directory, just a file as the root
>> node.
>>
>> While that is possible via FUSE itself (through the 'rootmode' mount
>> option, which is automatically set by the fusermount help program to
>> match the mount point's inode mode), there is no virtio-fs option yet
>> that would allow changing the rootmode from S_IFDIR to S_IFREG.
>>
>> To do that, this series introduces a new 'file' mount option that does
>> precisely that.  Alternatively, we could provide the same 'rootmode'
>> option that FUSE has, but as laid out in patch 1's commit description,
>> that option is a bit cumbersome for virtio-fs (in a way that it is not
>> for FUSE), and its usefulness as a more general option is limited.
>>
>>
>> Hanna Czenczek (2):
>>    virtio-fs: Add 'file' mount option
>>    virtio-fs: Document 'file' mount option
>>
>>   fs/fuse/virtio_fs.c                    | 9 ++++++++-
>>   Documentation/filesystems/virtiofs.rst | 5 ++++-
>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> -- 
>> 2.45.1
>>
> Looks good to me. Maybe add the 'file' option to FUSE as well to keep
> them in sync (eventually rootmode could be exposed to virtiofs too, if
> necessary)?

I don’t think this option makes much sense for FUSE, like Josef has 
said; it would just duplicate a subset of 'rootmode', and because FUSE 
filesystems are rarely mounted by hand, I don’t think anyone would ever 
use it.

If it were important to keep them in sync, I’d rather have virtio-fs 
provide 'rootmode' instead.  Personally, I don’t think it’s that 
important, and I’d rather have a simple '-o file' instead of '-o 
rootmode=0100000' (hope I counted the 0s right) for a filesystem that is 
actually not rarely mounted by hand.

If we ever do find out that we want to support other root modes than 
S_IFREG and S_IFDIR, we will probably want 'rootmode' for virtio-fs, 
too, yes.  But I can’t see that right now.

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks!

Hanna

