Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09753BFE59
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821787; cv=none; b=KevZKzlKBX6hjJx0pdYpzEqR3etxJB1o+9FkPetvT1viqYclNspdVlbLyg60kE2PHof9Qz55j35JgfH7VovCyXJXuzHIf5652YtWKyHlVdJ6HBJghCDLacNkVK1tcmtMjaYsvZlrb6ZxlsQBYxx/vLot+ZbO60rlYo0oDHY2j3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821787; c=relaxed/simple;
	bh=XqMY26u2z+xwaIKr9ECgFka/1TWOtkcS8KQI6YYzcek=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=gzOnyKVIzDtQiT8dByJVTzuYDnJm946mxPaw3HxCRiJN+nR/iD1Wr2hyE1+PrZ/KHK5erYIa/PSJp2ww6gJZbUsQN/nVsjonqv5tdCxw1x5GdmiassoGqI2MOSwFDIUzE4PvQ3HBStAood2mggS82fSweVLTahURB6pBRTFm1WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHwT1tLn; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHwT1tLn"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7cb343d343fso101946307b3.2
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779821784; x=1780426584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaXK4ycTk/ak0Eg13tSj70uvX+GVGk/yxG0GEJXhDVk=;
        b=SHwT1tLnqyMQoW7tOZzKVFOVr5n4BWKqWm/pvI4UZjDc7JGX1nMq5Nu5DBmeL1yBiU
         t6japKJpK/LEDAmbm+KMh+JapmI30roY2gpCdEkNc+Fi9V2KRZus48u/oIQYAeXICgo3
         x5WHHZLJbK90Ca9JfjGy2ZsZ/5iD2yFSG+58ypwzUWXJbSF9YWdAh2MyigJUjiy92mmq
         rpYDRBdUYpdjA5T8iL9aDCVALydEurXdMnCiFFP8OfsBTYnyBL90P0tGyVnex5d0VDYI
         juGmb5+pyAMQIjIh4L22xdpbEWP/boLOozBqmwHGrldy+IEb+eYcHNe1N3mBvI8bw5k0
         ofoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821784; x=1780426584;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaXK4ycTk/ak0Eg13tSj70uvX+GVGk/yxG0GEJXhDVk=;
        b=G93S2YFAuUHv0Bbv2hMyfaY26WmalhkUUrjgM2V4AVUormCKnbhe/DDK4vxC4aMm79
         zxkqI9A0TeLy19vzhIdQo+4TJJY78oyZZsI4vRaSitXUpINxerXDKhBQ5HQWwYHOhL5m
         RKqEVbiBKCa7NMKDLAMxUErNJ0sK1mYA+OQpS8P/DjUOlC3jMjHsHAGw5Q6ZpbtBNpJm
         TbzQH74prRfNd30n1aOex5991uLqdwnrUH1Iod86U8eVx8+Ug3EjVnkDMDZ/FCeQdDGF
         8yVUzGX7jLYY+9IJKZtMZDkpa11AvTmdrJ6vLKMhqbxEk6M+XbqWwdn1UYQMazq18riI
         3T4Q==
X-Forwarded-Encrypted: i=1; AFNElJ91+58vdeJI/CGsPZH5hy4Qb70kKFIwoB57xcwgSpCaLqGX+grlMnh2VoIOy0+aKHywGmLKZAQHSFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy649Ug4Kda75/m19qfi6lwjL7WdZNqNXt2d1DkcEXzR0zx0zar
	o6DCR6Py3v9P3wuQV5QLv3OMqAI9s88RIjqgHSrYfw+vQb9OeIXbiaqL
X-Gm-Gg: Acq92OH66VXlzAhKGzB0zofs7X7FEZW+2jDFFVgXQZygCrZ0zx/tNzUK2IbDhklnxxt
	r4rzjAwz6JLzJz8X4QE4nllhS4VYM6jbtFec5dtKxmYeSZvDrADtaRP6EoIj77bW4Yp2j977uVI
	N8qzjOEH81ntC6ry+2RUdVurr/MCJTDUHX1VLgcDW/ORFRR4TdBSA7is5yoyNQ8Ju1nlE5CdbLi
	jL66KISD8KiRaEtsR5tkertimZWLZ92s4rAJF3J2ONXaQIrCunAf1TH+jLUbYF4mvfNSob6JToM
	GmXQTPUt6LfwMRDBUqrEHI9Ujo8zSiEAEGgp/OzQ8/VL65yBn/A010gOPyqGB7faWBF86VXryPO
	5OmyhBMsA8wzCcepNAUGe1kEi+rR/zYlKY0fN0dEXaqcFc1cBG+wyAKMchfdzII5zCFYmepok1R
	zpeuzr1b9uyQGbRDSZWARKATOfCRVwyIivM2Bwgpk7s7FUbatn5yQZ1soII/BLfBORWHnGaOF3f
	WGYbyM=
X-Received: by 2002:a05:690c:a94:b0:7d0:6155:480d with SMTP id 00721157ae682-7d333bd8497mr226499607b3.5.1779821783527;
        Tue, 26 May 2026 11:56:23 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c33c935sm64694427b3.36.2026.05.26.11.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:56:22 -0700 (PDT)
Date: Tue, 26 May 2026 14:56:22 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 corbet@lwn.net, 
 vladimir.oltean@nxp.com, 
 willemb@google.com, 
 sdf.kernel@gmail.com, 
 ecree.xilinx@gmail.com, 
 jesse.brandeburg@intel.com, 
 linux-doc@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.1975ceee9d4ce@gmail.com>
In-Reply-To: <20260526160151.2793354-9-kuba@kernel.org>
References: <20260526160151.2793354-1-kuba@kernel.org>
 <20260526160151.2793354-9-kuba@kernel.org>
Subject: Re: [PATCH net-next 08/10] docs: net: add Rx notes to the checksum
 guide
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> The Rx checksum processing gives people pause. The two main questions
> in my experience are:
>  - what to do with bad IPv4 checksum; and
>  - what to do with packets with bad checksum.
> 
> Folks often feel the urge to drop the latter, to "avoid overloading
> the host".
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks, this is is an important clarification.

> ---
>  Documentation/networking/checksum-offloads.rst | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/checksum-offloads.rst b/Documentation/networking/checksum-offloads.rst
> index 907aed9f3a3b..d838fe5c1606 100644
> --- a/Documentation/networking/checksum-offloads.rst
> +++ b/Documentation/networking/checksum-offloads.rst
> @@ -19,7 +19,6 @@ take advantage of checksum offload capabilities of various NICs.
>  
>  Things that should be documented here but aren't yet:
>  
> -* RX Checksum Offload
>  * CHECKSUM_UNNECESSARY conversion
>  
>  
> @@ -139,3 +138,19 @@ In Linux, RCO is implemented individually in each encapsulation protocol, and
>  most tunnel types have flags controlling its use. For instance, VXLAN has the
>  configuration flag VXLAN_F_REMCSUM_TX to indicate that RCO should be used when
>  transmitting.
> +
> +
> +RX Checksum Offload
> +===================
> +
> +RX checksum offload is controlled via NETIF_F_RXCSUM. When disabled the driver
> +must not set skb->ip_summed on ingress packets. As mentioned, IPv4 checksum
> +is not offloaded, the RXCSUM feature controls the offload of verification of
> +transport layer checksums.
> +
> +Note that packets with bad TCP/UDP checksums must still be passed
> +to the stack. skb->ip_summed of such packets can be set to ``CHECKSUM_COMPLETE``

when also setting skb->csum

> +or left at ``CHECKSUM_NONE``. Drivers **must not discard** packets with
> +bad TCP/UDP checksum and must not configure the device to drop them.
> +Checksum validation is relatively inexpensive and having bad packets reflected
> +in SNMP counters is crucial for network monitoring.
> -- 
> 2.54.0
> 


