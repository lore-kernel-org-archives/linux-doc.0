Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259445;
	b=cdv/aObWb9Ngj0Ii/XdNQmR94CiyH+QMnd0vNIIncjmAq66Up9qNN0e6VbjEp4W3pMO1
	 pHQ2WdbyNbbcl0Kv0kP/Dw4rzrvkKSV2r/BVE1iq0BeoXi90w92XQh4rUDeWHJWdfiXwO
	 jmvUk1iSOc2ffiyyMG2sFUnUOkHndA9Cj7x3K+W7L8uxmj5uvQqO4VQi+U0urH8AnYbaf
	 FvxlxPDWyaT57xatujD3Qa5D88ZseJUVilTG14WiS6XFhjOjKZ1TLR726dxw0Ne/8tRwH
	 h++q8ifyh09CPX0xa8+tGO1WkApzTW8CatWFSLeKrTiX9MnMyZKzlWxvxj7ayIYqHbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fzUObAd1gPdMT5m6XcBC5Jns8W/Y+lrWpL82WiQ785A=;
	b=CW4BOmFF4K7GpdF83A6qZu2satzZ7n5o32bCiw8GLMYKyUQNz0ayID/XuzYdNYzLxV7v
	 qL6jLDe+bMzgxAZRdhrxsWj29Y63yAzv97d20hPcngrZEYmi8hyEy9rcyZJlxkE9zNNSV
	 sISPiVJuAQGMj4ZISQXBNvw1EiciuBHU+kh+JZWEj1Iz5QucRIBg4mch1bL43WcR4CegL
	 8pxW3k8q1nin/38wUKFo7QKIpYJkjM/pa/Ul5BLyn31y0fXBZNfSxLkIRaS8Eat4UyDYb
	 yXIxMmht8iImrnOOo9PNYCvZOwEJRNYhHuABqSnfISC18/Y/SmpG6wUhgt0ERdIdFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="TJhrKm/D";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C52606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C52606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TJhrKm/D
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so11524875e9.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793259443; x=1793864243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fzUObAd1gPdMT5m6XcBC5Jns8W/Y+lrWpL82WiQ785A=;
        b=TJhrKm/Damb4bsRQwz1SifntKVJJkxhYDgN962GmLP/xy2kCtvUcONSf1d3+6RBcEe
         lmZNHUhzIB4jgy/hPyIeBvELGo3Zaym0jDYgFFEmFENYa5YnAvR97dRnBaFfypF3m5FI
         hwNukOS8ezJt9tUz+YtT0U46mKX057MGXy+J3BDUZ17jmN+lesBATi2ZrRG4L1hWpZ5l
         +ocxI6217Nx2ssWp2SRx1dhZS+Cmciv8QJIM3AlT1PG410DBDeuLf3jIh4eHwjhr48G5
         +FJRUPMSFEvAhPEyLc22DsORQuXV3TIyt++gg0hf8helkMnlmvaYzG2wDBe3hWMnjDrI
         iEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259443; x=1793864243;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fzUObAd1gPdMT5m6XcBC5Jns8W/Y+lrWpL82WiQ785A=;
        b=FoRBA7RGe+4GzDaqMPpxUUznxoDhzC9i9PhjdfawCdXVW1oZSZXzOWZYRHTEQhKNQc
         Fqr1Hzfj4W4mRc7HSIcdDNLCHQYY+yduTGklbXmhXG/6OBFnSAhUtX75YVrikVZQWr6t
         A/mVMezCj/rkqy3emyofxjto5dA6ZRHwLE8JML2z5Nl7L1EqL1yBay7lQitCiWFW9ERa
         OSzVJw9L8Ca1D8h3lwDWAN0ZNYhdxYrqKF/X4BT700mwXxH9hg1dlKvyYfbidNZHuRpb
         u36y/WmgV/fAHObpIMkw/IVdYyZN3wHtt6Ftap1/6oSZF+b3zhPNXt6pogbi8L8iQY00
         fqtg==
X-Forwarded-Encrypted: i=1; AKwUvBylWLLf/2pZa5hL8l6uZ+tyhPEG8o6HOjYKxUlQqitRWimUrhKXAP9dl4P/dQKXyY2dDem8L9RBOqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTHdg0FH97vDAnbaZEd0wQIc3+Km3nrP0o9zkXV4t1zjaJmspB
	ZAqWoi5AYcpepQlS3r/rwNANJibQitrU8BO4gcoAwLozSRuR0ZvIj07y21VkImdxDtw=
X-Gm-Gg: AYBFou2d5NIu9ASjAOaGWv01LWpT3HG5MvVGnwja8hYC9+ve6agUL/4xHyH5jXx+XT6
	4l5h5SUwFsn3vWh+GLD84q9q6BtvvkaD3+RiUKj6n8nddhMZQTKTdP8Wj10T2oBJhM/OotlMmi9
	MFneqP4g6Y/PTVPUby/HVeMV7b/P3CCNQFsWxcMwRDB/Y7oDC2nDvXbf94U711WCh2aW4yeb0bY
	V5GBjf8NXhmo1/MI5CXXGXZU+B4v8eGbxFYxvpmeKShZHY7hN6CHLLtReBaI3lorTyP8IOQjhnQ
	t2IE9RAWuLq4ZQUI1t9Hl4JvR4FTpnVHxsGuvH0P/qA2JEo4GJhqIhpETAFH0p5YCOxvXhoGNfb
	5GjNVZaOxVs3WDHSuJqaSYSVZ3gIGgX/Cla+fcTpq57/p7XL7yf6r89CviT3mpFNRh60SYwIjMX
	5REbSO9ANQQERnewHBjvlSeb0IOv7nSgXNO93R86xHf4Ni69ser56qmQgh7G0Xqcux+hGXXqb2v
	OsRpn+emTR/fyb9RpAVN/lfol5ZzilKr/01yJeS6X10ky+mvmfiIi0EqrKkaE8hdgQSGnUgQoCc
	GaMw3Ffcbe6MI4qNxnPld2quoA/wmsrUsMgvIQkFPVYs8BBx67n8ZmFz4owmtp8eHwhE+xzz4BM
	=
X-Received: by 2002:a05:600c:4f94:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a967202997mr107918525e9.26.1793259442995;
        Thu, 29 Oct 2026 00:37:22 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm68388545e9.3.2026.10.29.00.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:37:22 -0700 (PDT)
Message-ID: <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>
Date: Thu, 29 Oct 2026 09:37:20 +0200
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
To: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, jgg@ziepe.ca,
 david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
 rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
 drdeeglaze@gmail.com, James.Bottomley@HansenPartnership.com, aik@amd.com,
 jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
 jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
 suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
 elena.reshetova@intel.com, dave.hansen@linux.intel.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
References: <20261015145053.3664509-1-jiri@resnulli.us>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261015145053.3664509-1-jiri@resnulli.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.10.26 г. 17:50 ч., Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> Linux has several attestation interfaces tied to individual technologies.
> That makes evidence retrieval, measurement registers, device state and
> kernel consumers provider-specific.
> 
> This series introduces a common attestation subsystem. Its goal is to
> support platform, TEE and device providers through one model, including
> TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices.
> This first series implements the common subsystem and a TDX provider.
> Existing native TDX tsm_mr and tsm_report interfaces remain independent.

Wasn't config-tsm supposed to be this common attestation subsystem? Was 
this discussed when the initial config-tsm was proposed? Why is this 
coming now?

> 
> Attestation devices use CTLV, a schema-driven character-device TLV UAPI.
> Compared with sysfs or configfs, CTLV executes one validated request
> atomically instead of assembling a transaction through several files.
> Compared with netlink, an opened device fd directly identifies authority
> and lifetime, can be delegated normally, and owns its event queue. CTLV
> also provides:

Assuming we want to go through the route of CTLV, do we really want an 
attestation-specific  interface, or most of this functionality can 
simply be implemented as a specific genetlink protocol, utilising all 
the existing hardening that has gone into netlink's infrastructure to 
marshal messages from userspace to kernel space?

> 
>    - generated kernel metadata, UAPI constants and documentation;
>    - strict type, bounds, nesting and required-field validation;
>    - runtime operation and schema introspection;
>    - family inheritance and extension points;
>    - fragmented queries with generation checks;
>    - per-fd event subscription, overflow reporting and removal notification;
>    - large input and output blobs.
> 
> The attestation family exposes capabilities, evidence, measurement-register
> topology and operations, an append-only MR journal and journal
> notifications. This first ABI contains the paths exercised by TDX. Extended
> evidence classes, dynamic registers, record payloads, verdict recording and
> device-security transitions follow with providers that need them and are out
> of scope of this initial patchset. The broader direction is illustrated here:
> 
> https://github.com/jpirko/linux_mlxsw/commits/wip_attestation_all_1
> 
> That branch also contains additional providers (test and sim),
> attestation core extensions, libctlv and ctlvctl. With the tools
> and kernel specifications, an attestation device can be used as follows:
> 
>    # Discover CTLV devices and their family chains.
>    ctlvctl --spec-dir Documentation/ctlv/specs list
> 
>    # Inspect the root-family lineage and attestation capabilities.
>    ctlvctl --spec-dir Documentation/ctlv/specs query ctlv0 families-dump
>    ctlvctl --spec-dir Documentation/ctlv/specs query ctlv0 device-get
> 
>    # List the measurement registers of the attestation device.
>    ctlvctl --spec-dir Documentation/ctlv/specs query ctlv0 mr-dump
> 
>    # Read RTMR0 (MR 1).
>    ctlvctl --spec-dir Documentation/ctlv/specs \
>            query ctlv0 mr-read mr.id=1
> 
>    # Extend RTMR0 with 48 zero bytes (SHA-384).
>    digest=$(printf '%096d' 0)
>    ctlvctl --spec-dir Documentation/ctlv/specs \
>            exec ctlv0 mr-extend --json \
>            '{"id":1,"value":[{"hash-algo":5,"data":"hex:'"$digest"'"}]}'
> 
>    # Retrieve the RTMR0 journal.
>    ctlvctl --spec-dir Documentation/ctlv/specs \
>            query ctlv0 mr-log-get --json '{"selection":[{"id":1}]}'
> 
> The 20 patches are organized as follows:
> 
>    1-13    add CTLV, its generator and documentation
>    14-17   add the base attestation family and implementation
>    18-20   expose the native TDX service and add the TDX family
> 
> Note to reviewers: Please focus on the overall design, UAPI and internal
> attestation-provider API. The internal CTLV and attestation implementations
> remain rough around the edges.
> 

<snip>

>   83 files changed, 18084 insertions(+), 28 deletions(-)

That's an awful lot of code to just move certain binary blobs around 
(Judging by what config-tsm is doing ATM).

<snip>
