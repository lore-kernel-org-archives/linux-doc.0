Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC030AACB
	for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567326; cv=none; b=GkUWynLF7zyYMdhQ4XcqzfMiToUIh9WGd8En3p7jPJ4pmX+sJwhkak1VZRHHZutmQf0uXBq4HxxW4+9vjufcrRo/iQOwmAraOKzZmVVTBFICse3t/bR+uxACRZCKBEeBPmco81rLVmmZoM4dmni5frbq1AETq7aCEIHnv/1Jo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567326; c=relaxed/simple;
	bh=d3xY+Tt5F2lAixFNz0erCGqfYwIxB2/c8x9QCfBSFMk=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=AATtmkQXdKim1she8RfmjuetS2VW8cjZCO4NFxdMkR2qUoVGpRpFv+x4Dq9JaLiQQgSbj8SaSjFOQGAum4ut+oG0GUBjy6+2S5L12fKEhQhtt12jN4GeQ/OX9EphsCdKs6q6R1D7SJ/pvImC2Pi9eR2wt/Iy21mohzHSRAwv/sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JmmYAWCd; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JmmYAWCd"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-6574475208eso1181936eaf.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 11:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765567323; x=1766172123; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3xY+Tt5F2lAixFNz0erCGqfYwIxB2/c8x9QCfBSFMk=;
        b=JmmYAWCdFQD6/8IWEfycH1cp3NlAxj6pn4RMlvFzYLY+ifb+sgZpxAaXHaD36odD2J
         QahRxKnOdovz0UUzEezQO1nJZOUBXpaFUM+Ts1sL86RoOpnvjcUJJABUXB9l+F9un/ao
         TB/PoJw2zL0H9tZLNpLoUE/Q8fLic5Mu3FrWxGtpjZKa4sdwMHECCsXsb9ZT46lwJEuz
         5YxZLRcup96IBF5wt0UVghZs3zH5ewumbdC69rUCH6kynavZlvLbTN87bUr3859zYMZY
         yvmXz2ZV5uD9i1yDn08zAPuIG0X2s9JAD1OCOmfHNXEBtx2L6vYZx+eOVWJGZ7xF2kFv
         GjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567323; x=1766172123;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3xY+Tt5F2lAixFNz0erCGqfYwIxB2/c8x9QCfBSFMk=;
        b=GnYdAFmev7BXwJY4JphwPl+ES5jO4ueQdDn8dMQ55NYe0h/WvTcHIoAHR/VMML3sek
         hfIkuwovbuX3LgIwJRleI/cfA9LFuJ760zLp6yq8xxWPZsBJGO3yBwNdkbCgk5nXQMwr
         Wn6MVQ2nJR9UR0KZRO6qCMcpsk1A8T11VXtXFWpb1FFQ/0WnRhhZVxU1CBkrpzYZOrC7
         /jwEnsnYaxOZd8S+EgrJwQpmXHMeTa//i6t0HIAdeuDbEd1NAhjrtJB7RI4R0bbbw/nc
         xKwhKNpjuwU7f6nxp93MsRLpv4Dr5BeDKuj9sq4g9Enu9FX4BOLsfxIs6NnNpIDCrou0
         lSgw==
X-Forwarded-Encrypted: i=1; AJvYcCViWPazWkFj2DHIvYTrW7UlFCVJxLHaQWCGWs8PQ0kq2p5wfwRofzU3XsA+pDirLWmOlXsFsWkH+ak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/tZJq8r8/ZYNMwHYNy1d0FYp0fNwzQqLm1pz7FFKmut+W6SR
	1qM/xWSSXW6jAChKcBts7sB48RwC1dByVxVtY3fpCLFExc6pZ1AAYXAFulrETwoiDGwZUlzHpCl
	+iTeO4jkWOMwi0rT/HCNQCeOzXA==
X-Google-Smtp-Source: AGHT+IHUbVv4Jy2gEZEkXkuyNos7MiNpoCrDqCxYPzir5lZi9qw+P8UnFJM3AYzANnUq+aZp9M70/ycADG43mzjJoA==
X-Received: from ilbeb21.prod.google.com ([2002:a05:6e02:4615:b0:438:317f:a956])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:290e:b0:659:9a49:90d4 with SMTP id 006d021491bc7-65b4523a33dmr1491761eaf.83.1765567323163;
 Fri, 12 Dec 2025 11:22:03 -0800 (PST)
Date: Fri, 12 Dec 2025 19:22:02 +0000
In-Reply-To: <d3e946ec-787a-424a-9a7a-f04aeb490ba6@arm.com> (message from
 Suzuki K Poulose on Wed, 10 Dec 2025 10:54:10 +0000)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnt7bur4iat.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 01/24] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 09/12/2025 20:50, Colton Lewis wrote:
>> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> counters reserved for the guest.

>> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> because otherwise not all the appropriate macros are generated to add
>> it to arm64_cpu_capabilities_arm64_features.

>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks Suzuki!
