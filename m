Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283391;
	b=ZOx79EuaOq+cx4te+MIshE8Jv2/MHSTklObzyb8Bnh34sgjDuBv39rWi3eRyObrt6I3M
	 GGt0QJ/MF1wYjNAfGmkxzby3G+pDOqXnG84JHZjezpxPagO0yrrJqBjNrV4JUxeujrNDy
	 r7A2Q801JMqweIrthIkFN3sOJ8OADsHc5kBypgrwgAymKLEZ50q/CN0mQUhFdB0hqtYc6
	 9k62HbP45fkiuLDPHNANAgEy3UJxoPswZ8uvJ+ieq67xtJ8NJxPCicPb1JWzSerxDvH53
	 Rw+r9FYJFdOIgUG3RB8RRqPyfvTt1dZzZnyvM8fzw7uXjtshfnUiIgRoR+Zu5XlAWWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
	b=QQzT6V1GsaLv6vnMdl+Q6Ee2keiOcyih0D98VOoa4xEh53YiD6SMERc521N9oTpO5w8H
	 P3AxyCJbk7z3qgs4WprA1f6SMR3cCB2vMSaicHrHjZpzhaFiws2nJ+W5/dClTDhImyJ2g
	 No3CtDZG3gX3qau811Iv9d3sugCD4OuXrMLzt4zLRoVeG24phGGVi21ZumXASnyt4WHMY
	 4JwzccxeweI6CaOnAPzfQ+SDgBgniVEcws8cjoS7QFyVEa/iFrFIbdev/Dt2M6YkEh/wp
	 Re1P5EBOwpjT72SPzQFTRJTTjVxIRs/Cju2CHzQzkQBbO0SCPc50w2fr/C0FdmmnmXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K3GWWvW6;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A3D606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 14:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K3GWWvW6
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-536c8f958d7so18363351cf.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793283390; x=1793888190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
        b=K3GWWvW6rB7cRoFkVogJ2KSZo/0Y/1HCDIRdHzAIwLoLDsyMicRGMjOseGev/J/xTf
         7GktCCuPItsgUn+ypTk60UX0aWoLaz29rDEd+7ry0VKQZgmxJu4rxk9u/82PZO0lHBoj
         a0rS4Qcv1UTo0qCGsLn097FMzPIIosJ6Sq/dM+Cpe88Ee5HToav+cCJFoWYUIenfBqwj
         BfXtQt8E5/J+XaBz+AzHqXbj9Vz+xQWJJQPIA+hvJei/SyQf96CW2nSLK1ee/Y9r1bUI
         sgaZ8c4K2r7GTls+1UpYG7HJCNHiY8m5qhHnc/SvL5F1gGTyDMBNiM4S9pBh3H/k7bQZ
         gG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283390; x=1793888190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
        b=chNujtbtD84MhiAxn4vFBQKOiDvCrk9tw5Ad6yqA7gIBYBlNbft/uf97m2voLHGTaw
         ySjDmaJbr4gxvxjjuQpel5hjSZ2GiVvfwj9XK0pCmQKSRtd7XoW+kaJC0NCmIVX3qXED
         pF1VHTWyHTGNEFv0QSK0DqA36IBtRJZejW9T3t7IUaqNzfOK8IObQQNgN0mdOxt4Ug8u
         dLVKMbe/wRb2CJ0mgu9jyBsP2LI5m+lbB5Nua5lKQ0s3VIm+By8hDkGdw8ZW3JHMwQn/
         86+dg4jEBZp9/k1k4I7HWoKyzqN7oW1t7XdE/w3ICJci93V0VNjvQ6YnvLqi0T21oP1P
         7aDg==
X-Forwarded-Encrypted: i=1; AKwUvBzuovK2JtGrweaVw+76K9w4w8Mh1Zcd4WRqHEtkwB16TyBY8g7uWhioKLzkMbdgW4KUS/FpX7Fc8i4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8qoRwFl/Brv0Xnp1QieAVwnPMz0pIugjzOPraYROPacTJnwb4
	COBMpgYQKHQPODux7GQhVzbvYqXtuIGCr4wHc8GullGgjM82x+wKHJgYPR4aHvjzxLA=
X-Gm-Gg: AYBFou237Og44GNaiunK/t3yt0cQbJRNRXgsRWrNyjulLF2BjZkGlRtRoOAU6DD1ThZ
	J/y/eHaYX4f898nictA9XW2raggLTpSqNx9+3LnErHjESvnW00mCdvXpd7rdLFXaypPT3ToFSfF
	0q7dVupCqBlFRIQIvdYhW38x/191YH8LUb1ecoJm1laypie32z9Lmkymjqqz7xmGoou+HkctS7s
	aB1EjJmc6pLQdsKpeT4qEBb7zf0N0LdGrV1H5leUQPR0x9NDvFWr6Yc5PBlYotFjtkmV63KSVmO
	3E6CLAm23yzTPzG1ZhLUxVz6PF9riTurOa9e/Ng8E6ekfputbkPZNn993NbvVOn7iQkTopqeI62
	jIAukIxzqklZBYf8roMZdJYnxTxupZJXB1G+DIyFQaoy4kpAdBN9a1muPVXykCjB/dWM7SbKScX
	PSPVjXdHqczElLxrst+FwfYkQIPDqCWXYWOmjVvc5V0IUwxZy2R7YvD6sq6bNF22PRr1lXFC8Um
	ct6MbktXtSHRFIoW6q5anlo4t1tG8WkE1FKaU5hqAFKrUy1sB/hvfDQSGhLw62pP9X4f8vuF5N+
	TE8or5xGaDtGqgJKB32/3nhKRtfPCfciLQak93INFZNklAuyr8cCFsarGJmdip/EDEI9q/llTWN
	lZrSEVNxOpUw=
X-Received: by 2002:a05:622a:5c14:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-53fcb20dda0mr85167991cf.20.1793283389957;
        Thu, 29 Oct 2026 07:16:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c7f6ef1b7sm45505406d6.7.2026.10.29.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:16:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMQvb-0000000FihF-2QML;
	Thu, 29 Oct 2026 11:16:27 -0300
Date: Thu, 29 Oct 2026 11:16:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261029141627.GP1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>
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
In-Reply-To: <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>

On Thu, Oct 29, 2026 at 09:37:20AM +0200, Nikolay Borisov wrote:
> 
> 
> On 15.10.26 г. 17:50 ч., Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> > 
> > Linux has several attestation interfaces tied to individual technologies.
> > That makes evidence retrieval, measurement registers, device state and
> > kernel consumers provider-specific.
> > 
> > This series introduces a common attestation subsystem. Its goal is to
> > support platform, TEE and device providers through one model, including
> > TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices.
> > This first series implements the common subsystem and a TDX provider.
> > Existing native TDX tsm_mr and tsm_report interfaces remain independent.
> 
> Wasn't config-tsm supposed to be this common attestation subsystem? Was this
> discussed when the initial config-tsm was proposed? Why is this coming now?

Maybe but it was far too narrowly scoped to do that. config-tsm
doesn't even include MRs, they were awkwardly pushed off into another
different spot. It just doesn't seem to meet the need, and it can't
sanely fit SPDM.

> > Attestation devices use CTLV, a schema-driven character-device TLV UAPI.
> > Compared with sysfs or configfs, CTLV executes one validated request
> > atomically instead of assembling a transaction through several files.
> > Compared with netlink, an opened device fd directly identifies authority
> > and lifetime, can be delegated normally, and owns its event queue. CTLV
> > also provides:
> 
> Assuming we want to go through the route of CTLV, do we really want an
> attestation-specific  interface, or most of this functionality can
> simply be

CTLV is not attestation specific..

> implemented as a specific genetlink protocol, utilising all the existing
> hardening that has gone into netlink's infrastructure to marshal messages
> from userspace to kernel space?

Been there, seems like a hard no:

https://lore.kernel.org/all/20260721182046.16219426@kernel.org/

And then later this:

https://lore.kernel.org/all/20260921131911.532d81f4@kernel.org/

Plus netlink being based around sockets and net namespaces is a very
poor fit for something that has nothing to do with net namespaces and
really wants a DAC security model.

> >   83 files changed, 18084 insertions(+), 28 deletions(-)
> 
> That's an awful lot of code to just move certain binary blobs around
> (Judging by what config-tsm is doing ATM).

Yeah, netlink is alot of code.

ctlv is trying to solve a bigger more general problem than just
config-tsm.

Attestation is simply the first user as it has some complicated data
structure that suits it well.

Jason
