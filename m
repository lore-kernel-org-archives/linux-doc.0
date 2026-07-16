Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39A26C3B0
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205039; cv=none; b=Vl8yu1ZidvlCbY0VaPRCyBlV+tB76WWwgCy6hpLSBdbhpJdIlkkK0Y4VBs3Bm5xjpDQKQKlIkFDTZQkiNw11NnauCxImYvtoEajt3CeMSqMX3/n6nkWhlhH6HGHPlWZzU3H/7m3DidCs0Azkyd/Wty6Hv7nPJsxqh5b+VwdZ85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205039; c=relaxed/simple;
	bh=vZKofYItbREt71IXPoiMeqt/ZYeLu/MfFEggLh4DNBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLyiRhvz3jHsT3WCpP00Ptx+m/JuclFr96rFb2Kj0gRpcTrsC0GaIDku6ka+24fsVtFAEPboQmUOLtkoPWHMzSgu2QABbhZ7w8jGL+71HDHHBQLnk8eJwilYV2fuTDmWE4VQrNgt5ur3JJi/F1g5upha344OpKg51MQ9niLPeyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk6soxv5; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk6soxv5"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c96a1a43f5bso327699a12.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205038; x=1784809838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmvRkk+7hLp/TwLQ/myCqZjT/o4rdVb5i1bmgc1547s=;
        b=jk6soxv5B4EXeFcI5C9JgA0PkLtCl++FRUNHkdWNSG/fOy9AF2IzBzqf9wWQL9qPel
         vlV7jb7LX1mlRvRr1hGx3CzI/Qbb+XEkWviko66gXCYKv+RgJLW3/s25oF9Pocz4PKFM
         V2oGTc6eRLmlP4s1idqkN1GWklCd4hRMXhp/7O5I22NlkkCSoGvlEUWtsrzMv82BDHwh
         WAYQ2SVsQ/zqSq28ubQ3f8d/FcUFt2WpbESrVwn7QAUDJEQLIOtvsfrZ8ILrTIbjZ95/
         xMEM6WqBoty7I6hm3qW+UnxpyVO0pbCBmg2CilaSsiVuXYxFawJ/RDFeI+hns8neTkPD
         zzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205038; x=1784809838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmvRkk+7hLp/TwLQ/myCqZjT/o4rdVb5i1bmgc1547s=;
        b=q0xAsuIcxSLIvOPOzghdKN0e9hgsrcD6jQq9XzRlv2MSyMPjw0On5Orqphvt+Jnq7D
         RbHA0mgjtpuyuCSWui+6idw6SxIpAto8l0ovdqNMCp+R4enabKjlkoOyVQPTLEZB/fY5
         lTHCa+blzcKWBMp+dW10tn0LXi3Zve+ycEIqiQ19uauutsTJH8F225ePAnWc1poek7CU
         YGoFEUB9XLU9WTvqTWF62gBrNwUtPdT3EJOmap4soHND1SsMTNanbl8c8K4X2Xssamhw
         Hdz5YNJ9B+hJ9aZZeFkYf+M0jP9KZM82jd+KiomxmWA5XjHgtCCfx5UBEBJYx3BHOTV0
         WHng==
X-Forwarded-Encrypted: i=1; AHgh+RrIHt6/VVwRrpfrlq9IiodexnDONDm4EkkHBGcmf5a65/19Yg15sVjDdBllawppya8AQCYz4ef6RM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQbzMAITZwTbQ5FXXIwv4boKpag0b/onMqOtZrbPrsxaYBsY9G
	wGrBq5oxJcDZWOSlnJD96ABmvbo7jlmi8ZjpFT1eqEpvD0MH90Xa+CaP
X-Gm-Gg: AfdE7cl99emX/FnPqpf6UqBWNPOD7JCZMHSwP0y68+JVfIlG0bAYCND+lkAgKdaq3jy
	cr/A6wgN58RA1niLjg5YaZaLizoXRkVgfuzNUk8Xl61pI+cpUYhj4MxEPcwWH2QgLqgzdzVH32l
	KTXFZr299EAA/+vdtHcl+K7NL8uZN5A6G4qwgyZ59+V5ZmkutHiKW7OJtsDnKw9U0W/SHkyL+c6
	HIAMbUKEelDGbvmrq/kV7VHgD+CoXNKupWqk+782/66ZmPmsfLZ2I2nZ57IYQZtmjFQIXND7Qy+
	odqx74g8NCH8XN0sKM9V1I5d/Dj1c/cec1I+ovf+/XOO7yxUdFXM/rtnE6peQkwmo3dYffUsuiZ
	3ycOa2eqOn+bAAdrjLrwW0HFJDIeHSgD4eKYMxmPsfYKEO2ReJIgo/xDgP6YQ5pjy92r/Hza909
	9+OnYtfw==
X-Received: by 2002:a05:6a00:a0a:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84beb0767c5mr2200864b3a.7.1784205037593;
        Thu, 16 Jul 2026 05:30:37 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f81a5absm4902337b3a.54.2026.07.16.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:30:37 -0700 (PDT)
Date: Thu, 16 Jul 2026 05:30:31 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Vladimir Vdovin <deliran@verdict.gg>, 
	Jakub Sitnicki <jakub@cloudflare.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 8/8] selftests: net: add test for XDP_PASS
 skb checksum invalidation
Message-ID: <aljNR2sf8qJVKFgb@devvm7509.cco0.facebook.com>
References: <20260715-bpf-xdp-meta-rxcksum-v5-0-623d5c0d0ab7@kernel.org>
 <20260715-bpf-xdp-meta-rxcksum-v5-8-623d5c0d0ab7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-bpf-xdp-meta-rxcksum-v5-8-623d5c0d0ab7@kernel.org>

On 07/15, Lorenzo Bianconi wrote:
> Add a test that verifies skb->ip_summed is set to CHECKSUM_NONE
> when a device running in XDP mode creates an skb from a xdp_buff
> if the attached ebpf program returns an XDP_PASS.
> The test attaches an XDP program returning XDP_PASS, and a TC
> ingress program that runs the bpf_skb_rx_checksum() kfunc to
> inspect the resulting skb. After XDP_PASS the driver must invalidate
> any previously computed hardware RX checksum since XDP may have
> modified the packet data.
> The BPF program counts packets per checksum type in a map, and the
> test runner verifies that after sending traffic the CHECKSUM_NONE
> counter is non-zero while CHECKSUM_UNNECESSARY and CHECKSUM_COMPLETE
> counters are zero.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/networking/xdp-rx-metadata.rst       |  5 ++
>  .../selftests/drivers/net/hw/xdp_metadata.py       | 55 +++++++++++++++-
>  .../selftests/net/lib/skb_metadata_csum.bpf.c      | 73 ++++++++++++++++++++++
>  3 files changed, 132 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/xdp-rx-metadata.rst b/Documentation/networking/xdp-rx-metadata.rst
> index 93918b3769a3..7434ac98242a 100644
> --- a/Documentation/networking/xdp-rx-metadata.rst
> +++ b/Documentation/networking/xdp-rx-metadata.rst
> @@ -90,6 +90,11 @@ conversion, and the XDP metadata is not used by the kernel when building
>  ``skbs``. However, TC-BPF programs can access the XDP metadata area using
>  the ``data_meta`` pointer.

[..]

> +If a driver is running in XDP mode, any existing hardware RX checksum
> +(``CHECKSUM_UNNECESSARY`` or ``CHECKSUM_COMPLETE``) must be invalidated
> +by setting ``skb->ip_summed`` to ``CHECKSUM_NONE`` before passing the
> +skb to the kernel, since XDP may have modified the packet data.
> +
>  In the future, we'd like to support a case where an XDP program
>  can override some of the metadata used for building ``skbs``.

Sorry for keeping nitpicking on this, but I'm still not convinced that
it is what we currently do. From my previous reply:

> > Looking at a few drivers:
> > - bnxt (bnxt_rx_pkt) does UNNECESSARY - ok
> > - mlx5 (mlx5e_handle_csum) does UNNECESSARY and skips COMPLETE if there is
> >   bpf prog attached
> > - fbnic (fbnic_rx_csum) - can do COMPLETE even with xdp attached?
> > - gve (gve_rx) - can do COMPLETE even with xdp attached?

(although for gve I might be wrong, there is also gve_rx_skb_csum that only
does UNNECESSARY).

I'd wait for Jakub to chime in, but it feels like we should just document
what we currently do as a recommended approach: for the drivers
that support COMPLETE, do not report it when the bpf program is attached.
Both NONE and UNNECESSARY are ok.

Also, did you run this test on real HW? NIPA now has HW tests, maybe it
makes sense to route this series via net-next to get the real coverage?
