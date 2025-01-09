Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D35202C3A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736407904; cv=none; b=lkGbJeZ4UiJEtKxzIsTKQgb9+9tKC4sdSm/oavh8cMtXqlFLu35pgzDC9v/bfEJW6DCSP5tQ9FLrZhwmd4vuBgi/jc3M7FBbH7rvHN+gq2XqLPbO6wOPgqG5R2+gP8CaqXL6q9LGRWT3oVVdfhvxrc9C5mwJ3wv5mUvcDL8UJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736407904; c=relaxed/simple;
	bh=rBPdYEnZvtSaWGeIKaMzYx3ocXn/sfrS1kD4E5tn0hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn3jwwXKW3V3s4RLYyuXdR3eeUVO0v6UpS+DBMcpFr71K4G5/QttkETAzfVm+ptZM57E6yEl0I9rF463TNvUwR18kfbXaqfoxEid6o7Dqh55W4vBFx+nfDmp6m4pqi85dA5b6h/612zTDkVWt29XONdUmXAUi4kLSi2Jf23C5W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HNLUKGhm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HNLUKGhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736407900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pr4ssIrc4EtFfekk83GYUXsTrXGomg6Zpaa+C070Fnc=;
	b=HNLUKGhm6SCt3oyDMvXbdLFfbuFvA5CsBmvocje5pbNRQwNsTBMC38Xzr6dbQ7h32iy4qd
	GaiaAvO64x/1SmsaBkQ0t5QHN0rsK1huPTRj8snoXCplh2fNjsXFGXtQoOu1WbCj4vbFqU
	e/BA4euhYO8V71d1/8zWeE13BQZtQ4I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-ibNGsSeKPiqcshIhoa6Etg-1; Thu, 09 Jan 2025 02:31:39 -0500
X-MC-Unique: ibNGsSeKPiqcshIhoa6Etg-1
X-Mimecast-MFC-AGG-ID: ibNGsSeKPiqcshIhoa6Etg
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa6a831f93cso68011366b.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 23:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736407898; x=1737012698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pr4ssIrc4EtFfekk83GYUXsTrXGomg6Zpaa+C070Fnc=;
        b=j89cBX1nB6FZ+bxLb2hL1V7v/YBR7hW50Io+QA9Qj3bvd+qH5XB6dqH+07RShxj9wr
         RY9oM4mcTp82zB2FsgL2YbliAf3+5lwpjvjuA7TNHS3SMGRLlwHQ6mSjtDZIe0/Rulc/
         v4q4YvJnEHZVZoDcEuwKiNIINB0GxQavRNrSL2CwVVmNlNN8zopu/2pz4SsMazZ3elOb
         VmOW2U70Dy3MIptuom20fUUxTGbWLhqAcblcUwH/r7mrNHWSeBFy+nXcpr092hZXF8C4
         YNaezTD3y4tlxqMUgwlVEvVldzrl+i9WW8MEs1tSb7CJqs2C2XTBOMF2ufI1g+ZTTgJa
         g5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU97HAFnDgji6LAqobCSpvSp7xgVuZlLf8NeVaQP3It/SS4WtnEYO72Yime5u1+bM9JqyxbGNeYyA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBl8eQplm8gSmZmPhZalMphtTHaOGm/WA37VGsH81250MSirw
	+3BhXJsUkOSMGgh2bp2hQCAmGhE5SNSeHMQ/oigxrZYfoz2UsX0xkc0YjX4GgozCQZVV+jRc3OJ
	cbD00hSaHRVwzwBS2zfp2JpHimmJQ1lKuFLvv5TyIuJp60/gau3yxfl+PuA==
X-Gm-Gg: ASbGncue+j6g587I0ryI3D3siuX8tcrZ6hytkFkysTnfv7s90jwzIFu+S1fqEyE4Xqf
	GlQzQ7+65jglnP157lRYqu7RfBNkT07mQl3Qs7/4NvSRPbH8+uRjg4A22p8JHM3ZX+4x9w8ugkc
	TelmDZmZwc5XvaxyN0C9odClLdIQFOBTdZGqqsl8ltiX1uBasatBRj1XhAYQX1EFXoYU6I/xT76
	Ov2byYTHqdvLKDjw7fcGKzDdzMr5g3KQkcxBK4dYICDPVGnkMA=
X-Received: by 2002:a17:906:6a04:b0:aa6:800a:128c with SMTP id a640c23a62f3a-ab2ab6a8dc8mr488065166b.11.1736407897992;
        Wed, 08 Jan 2025 23:31:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4ZKe0mzkcp2svj7dRwqQX0ex75ZtTovLeEL0VhHSiIUTDBhHXztbYHy36NKkZRj6x0d75Jg==
X-Received: by 2002:a17:906:6a04:b0:aa6:800a:128c with SMTP id a640c23a62f3a-ab2ab6a8dc8mr488061666b.11.1736407897607;
        Wed, 08 Jan 2025 23:31:37 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90638acsm42482166b.20.2025.01.08.23.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:31:36 -0800 (PST)
Date: Thu, 9 Jan 2025 02:31:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	gur.stavi@huawei.com, devel@daynix.com
Subject: Re: [PATCH v2 2/3] tun: Pad virtio header with zero
Message-ID: <20250109023056-mutt-send-email-mst@kernel.org>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-2-388d7d5a287a@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-tun-v2-2-388d7d5a287a@daynix.com>

On Thu, Jan 09, 2025 at 03:58:44PM +0900, Akihiko Odaki wrote:
> tun used to simply advance iov_iter when it needs to pad virtio header,
> which leaves the garbage in the buffer as is. This is especially
> problematic when tun starts to allow enabling the hash reporting
> feature; even if the feature is enabled, the packet may lack a hash
> value and may contain a hole in the virtio header because the packet
> arrived before the feature gets enabled or does not contain the
> header fields to be hashed. If the hole is not filled with zero, it is
> impossible to tell if the packet lacks a hash value.
> 
> In theory, a user of tun can fill the buffer with zero before calling
> read() to avoid such a problem, but leaving the garbage in the buffer is
> awkward anyway so fill the buffer in tun.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

But if the user did it, you have just overwritten his value,
did you not?

> ---
>  drivers/net/tun_vnet.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
> index fe842df9e9ef..ffb2186facd3 100644
> --- a/drivers/net/tun_vnet.c
> +++ b/drivers/net/tun_vnet.c
> @@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
>  	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
>  		return -EFAULT;
>  
> -	iov_iter_advance(iter, sz - sizeof(*hdr));
> +	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
> +		return -EFAULT;
>  
>  	return 0;
>  }
> 
> -- 
> 2.47.1

