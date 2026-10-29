Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281794;
	b=bgHc40Zq/Zu634QkYclnquUeYSfQhvjkHPhw4k4+jENBDL//ndqH59Fi2GPwQRdrPbus
	 o1D6CiQSDIr3ieWMvhMdauDoayZVG9TrXAJEBPrVmxHMZ3tcuI2jTqY2AG4tjz2vJ5V0b
	 MmqOfnuKkwBed2lPxhMoiY97e0cRnBeQt6T57NDZIAT8dApbIwv3gy9wp+kQpJPH/dHiV
	 0n2PgP1gTDJpOjbt4pHATjZ/CZbWoEEOv94hm8WbOY5gDeLEOtqbh4FAlhChFlD/VmyfP
	 v+ScKH4PwmPzDFV3tqEPOiyDi9Rh3PTXqiiuczaKtIXNKr06td6gq3bRxpSKWBQL+ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
	b=V9eA0Oz32Utoa5Yp7ynqjypusnv+lzzdjylTdzSMJwOKGbY1bFZN+8WPOG5/lelxscdR
	 PQc9UAbnXerwbqc0+maKmx4E9w+O7fEkXiTw5haymCdYXnpaJcP5OYFxSmYp78cTM59Ec
	 hMh0JPzWDoQi7O5DyoLTGzRYUmv+glOj0NjG+nQbfQB9l+VVHue/gdJ70iRH4ZBXXghTn
	 MnrmA7WKRl04fnz/wUTOReJjoE2ZGUVnMP3QnZmeq6PZQAuB1+zVAs20jm0xsED0bwNhn
	 01XIY39vDow00NsTSMvuHrFAYY/mdKGCnlNi0vXP7G5qPOp1yNClXEwg00gAg6udWCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CWV5z5FO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC5606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CWV5z5FO
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53512cd2f85so27124401cf.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793281788; cv=none;
        d=google.com; s=arc-20260327;
        b=iHawNUtYcOiuotvwM57POQIRf8HiX953Sdy398au3M8KfXbApg4pGAu6zOF/aKkvGG
         erVXQbip7KaOtwSBRCbNW4w1FX8T+QkThJ46erx+hICu/EVzPbEgOIK2X1VORCq1pVLv
         SLULtJ7bAdxLXMQUCiBUbvf0o3wiezEW4fVtGGQUkntD1GxyKUS6ZPQAhC/q0XfmXHmb
         N9BYRg3TCiTz5Ov6XLFaTHdzE8kUqNBcVU9wCEuBnxe72SQmEXnyLHkrFLXWfYCr4w25
         XcaFadSS0Ftu6uJXTibeNjTFY5Sy3qrCjW5t8UNu2WfEapkBU9avT1h9N63ISCtFOXpR
         RXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        fh=u6AeWYgcCCmCpuJoNUzxvIpvPeTd6OQvK2lg2PX6zlU=;
        b=A9ifd0AL5zpLjG1Lg1JCyc+rzs0wr+Jtz4ZI3OtNGNFakTltI62UOp4X1nbz5afFjX
         B+yJm6ToBs7e3SbW3/SfRe+smqUa6pmw/tcYpE2CH/qpUTxtw3DufNRBhaWh+ERWyRWr
         S9tea1SUxO/rLRh4e3CMhLbghEvoAthx/D5bIN7eZbLJknnghJB/oPr8C1otqV8CL5Nz
         JIlO3hgXo6K8UuEPClR4zFVwqMferYacOw8wXi9xOhmDaOg2WkvRxKqTivg+dtxILbCy
         NrUVTTMuMBdRznB9BW7DXs3b97+cf7SRzTGcLa9TUVn8yIhCu+YPlDVAJg9jJPb+tyzG
         OGfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281788; x=1793886588; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        b=CWV5z5FOFmpz4/rZ0iBri3mEORYKdK5sUx0gxqPpGl+YHGOu40V1Z38jQpOQUFOts/
         82omxjEaspaZos0w8KXHBORshZZby/eQ15qwX4XUUo66p7blyjSzhhfz6J61T8K8VFAp
         PYRwll0MS5PwVyzP9oBWRU8WWQfwwEZkwyXv2Q438LrNcnBfYfrmIIZRblAU8FxYFNi2
         eWf0wonUPZQrsS66KS0Ir3jpxQAVDQvZjtLYUgsfqO0un1Zn8EPDfO+qfsiqW7W03PbE
         ZGmqVlOk3J0X4W2qO+ho79HwxDtxeXBlee43H9SrG7LH6UlqmWkRzQxJBwqN4ry/WXzF
         KTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281788; x=1793886588;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        b=CG3gWhOaJ3swwT2+czc6G/vb64RWrSHMXX0OIDorLXJEyPpbKxQPRGWvSrQXSoTiCo
         cX6QfkeGysyV/UgRXExG6maTVqUJl20CnwPnWx1rm06lEzj1lTY9tMFuWSH3t433XPTh
         ygVUT5UmXmaJsCMucxPx3lxLC+vUxoovoMpD/moWWN2DV2fiPkXX/ZH81kJb70TetqM1
         ShSaWUfDwyP/UtQyAfHJiydLvqqtfpCrM8lZ+eRDxGYhta+b8vcQfAvT5s6koOqMD6pN
         sxC6zGl4EUjNohAWVRaFl2MPPiyXPTThvEnUmhZkPjy8HSV4IEBFhVpKweBqULpTWeYI
         8GcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8CVaaea1Janw0xjkK0ThEkMqhLrwj1aqYgZxy7ERMssFWmKtYeSRhV+tcmdvnb51dHV1wVjIOpyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1PBgi1aaYV6JK2x7NiESvSRiASgsTqMM5BLn0SRppzXiMtAQX
	SlGYKOGgwmRm+MkUp4xrAc45uVNvOThfoH15P5mmjfN0bzWye45gxsD82uKlcDLa9sqtdlMc81a
	Ddr4GNL3lyn7sR+4r2yLS+1BGWJcjXXJrzLWc6XZK
X-Gm-Gg: AYBFou3fMDiRDzHNwziB9uBQSfWWAp+hfl+tK4f+Ed6L8/7kJE6wMC23x2SZQnSU2Ly
	Hcve9t6hW6H+BCYV9NdSHH1jSXeMtMtqR5aBPxmuo7i332bBPRbaDHAfHRIf5KAAUkt41JHJ9gg
	FrMJ5vzjLkVikzLuEdH2vid1k2eKnbxHtG7pj9T+uceJRPvrluKspGhOdsQnbP8a12QgOX5tr4y
	U8juf7Y3uohMRJqyeqVLoc+J/JAMOL11GkYM4S5Hsy83mFWhHX0Yt9T16Hfz1eBKtuxf94itZOz
	CW6g93DllTEBIyLGkAXjVYwayxEYz+h1I1RYREai0W7L3USp7wJs8B8/RbyJ4ToYMe8372tKXFL
	e7PBcWk3xQeXD92V+oztiouqLbJQD2HJa4+tXdQkrUlWvRG3CAmuCb9iov4gYr3J2hQ==
X-Received: by 2002:a05:622a:394:b0:536:702c:f8e4 with SMTP id
 d75a77b69052e-53fcc9c38e1mr83446311cf.49.1793281786016; Thu, 29 Oct 2026
 06:49:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:49:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261023172347.88443-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com> <20261023172347.88443-1-griffoul@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:49:44 -0700
X-Gm-Features: AclHuK98-PJmC38q62LJKPyoT2Xn1t02jBqXVrJ0iSGV7iV-HBBvt2AVL4ugH5Y
Message-ID: <CAEvNRgEsGrhrRk2DcbrMNY3zWko_eXP3-FA1dGRSGYphQtBpXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for
 stage 2 from providers
To: Fred Griffoul <griffoul@gmail.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jianxiong Gao <jxgao@google.com>, Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Michael Roth <michael.roth@amd.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tarun Sahu <tarunsahu@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Tycho Andersen <tycho@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

>> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
>> +		       int *max_order);
>
> Should get_pfn() also return attributes of the frame? Only the provider
> knows them, and every mapping of the frame has to follow them. Two
> examples:
>

I agree with you on this, we need to let the provider tell guest_memfd
(and IOMMU) more about the PFN being returned.

> - Read only. A provider may lend a page that the guest can read but not
>   write. I know you dropped this from the sample to keep things simple,
>   but without it guest_memfd maps every frame writable, and there is no
>   other way to make a guest_memfd page read only.
>

I guess read-only would be the equivalent of !VM_WRITE in the VMA world,
yes I think that should be supported.

Other than read-only VFIO would need something like "cacheable" so KVM
knows to map MMIO as uncacheable.

> - Aliased. The frame is also reachable somewhere else, e.g. a ring
>   shared with a device. Such a frame must not become private; see my
>   reply to 34/50.
>

Are we defining "aliased" as something that will never change once
the provider considers the memory in-use by guest_memfd?

Actually, I guess the question applies to read-only-ness as well.

I hope we can say these attributes will never change once the memory is
considered in-use by guest_memfd. Otherwise, I think we'd need

+ Some equivalent for folio_lock() to at least hold these attributes
  constant until the mapping happens
+ Perhaps some other callback like .can_convert_private() for the
  provider to dynamically query.

I'd rather aliased be something along the lines of
"cannot_convert_private" (a concept closer to how guest_memfd should
handle the information).


Glad that we're converging, thank you for doing the rebase!

> A u32 of flags, with 0 for today's behaviour, would cover both and
> leave room for more later.
>
> Fred
