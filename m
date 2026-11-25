Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629548;
	b=dDZgpMtakUxT1BPyMPjwPn+Mn63dKf1vnH5GDDhCtf/HBtmsD5rPTij3LdBWyR01kyb1
	 9EWTkpYLXujk5LQ5K0cxo91SY2afJtLxEkQF+j0i0oRcBya704JDAFDYPnsdHEdAlZCJ0
	 QPxF0CpLgkXgdQVwjo7IoUdgQxlT6b1HQF//NpuVBKSu1ohgU4X+gwWsIzPJwI1H0wbwY
	 L4yPgXGWY8sjwwuRHdr9YqGB4kEKZVGcZ6HV1vuTISgS0FtQwDtxJ4XJ8g0B6oAHxhRvo
	 HdQ6f6vh2fLrudmfFVYFQLKFLo0Ahpyvn5TCzWWYMSOIjkGjpBAS3XNv5agCCUo5hzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=V3ql+trEST5GBe5icgHLs8egrkIrOnsTHov8GZtBedQ=;
	b=ynXd2uMuSan1dFzN5kLUsdQOfTr126U2Th+rLUeJTC+jnT3MMtLP6+LWkcGvNz5ftBf8
	 r7P++oQFsFnZkBLg9AEAUgg7Zai+a80AOG+8bbPFBiQTyOkV8ziuT0hJDuWf6NCxCiNI8
	 6JgqzYc6hnG68jMzESDKu49gvf3f45Jjpgl6ybB40ujSaIcfD+sqLpdfiR/Oe1zl9zGD1
	 BwXrY29e/FA1g86n03r4nckeOaaf1UekDHZLCE+zvFLUqyBwcpKPjTK8fkbv99Di9rc/U
	 fJPHUtvcbJGn+h5b5BK7QBb6WWc0JRVP86mJTVm92U2RaF1Ij6B154lFLtbeeSGIh4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PQcmyNBS;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49814606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 17:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49814606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PQcmyNBS
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2533819a12.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 09:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629547; x=1796234347; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3ql+trEST5GBe5icgHLs8egrkIrOnsTHov8GZtBedQ=;
        b=PQcmyNBS/RdM7Fi/IWNrrL7h9/qKovVbWbutC7iI2Bxdi3rstTjE5qf0IsBaO+LY4e
         AGw1iDAftKxj1P+224s+jC+i30zsWM7Fn5U1H2OrqH+I5sfkrfSVmfYvZN0S5Wxl/wL9
         BEWUPzKzzO7+J/yyrCqbnORpQcuMunOydZwtjERqxqiUXJGbSMFSKZzDi55pUM1DpsL4
         ExKQja2ZYhPUFqErJvZBsAWI6GQH9doWHXJ/ZtjYyhK+nuhRIcCKAgajswmljURUOOsS
         bJQPoz3Xf/WAgIxnML/c5vtyiszQg27LczhjTy45fC8nIs0egXzqo43tBcxMgV9FVPXk
         pNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629547; x=1796234347;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3ql+trEST5GBe5icgHLs8egrkIrOnsTHov8GZtBedQ=;
        b=M2zbSs6/UqZ5e/UWMqlnH0YFAtCwDuGnbWhQVUXcAQ9Weo/mgB/kOflgCxeqpHNr9l
         iYG7uHuXK8fovGioUpmNb+V2ikawSmF2CobWB9xSfO27I5nUYji7YeU32qqlT6hb4Nmm
         09kuX5Om9QEIoEU3iNSAdbfc4K2OuTgpM/Y4vSJeZXwxzyB2FClFba2SKWK5Uk9yiyKd
         MgWQzfKHZvFFdYVTrmIzx4uIFwM0fgVkeAjvrUn0iEiZlwq6xtBKlcg54BNAWiz25wUa
         /LvXl0V3L6n4ditn3gKPMg0+fOT/ajaeD1bUF/CqNa9G1O+kWrVicy8L1VQyLmIlnYPT
         URhA==
X-Forwarded-Encrypted: i=1; AL+hErE9ociOb5ba7GbOW2/Ida3YBvGAawR4RDjYzTXCduXeUCznYwGkzN5J3CshJ4wjvNkzqIP9gZ6lBzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iJulaDV7e9rQHD0RH+H42VPW/66IKM9/EhKLt5S+J95tob1Fu
	wEebu3VeD5WAh2kIt9RdOJxu5QlSaA6MxUH8mdIGR4zUx7IiCVPSdoxqVdpyEseSuw==
X-Gm-Gg: AZFdTZeP0qTkghyvNTbDjgIYQn1Eyat1VYgM+nSdTGHG3UCEMYvqGPe9Ba9WOBe26uI
	0IdtwdjkcXwm0AM2fZ5CY/qm3enRmlUN1qqUNDPSOk/aQpkexihBqAYDfP0+pVGm8fTBkOm4rFG
	JnxyUNCCR0qoHAkdqNjuIxllSLhfD4gADxkc3T4D88dWt4GwKY0vHlSeuLtcoeS86sLzqrfv19M
	pKZ+leHhwnvC46pryZNQu7A/bSVqYXTtCe4kv+F36o7c4//xNOG3mcS9kj1nu8lTMpORh8JcNhd
	uPOVOJHF4cIlPhmfPxxTGuXV/21uTu7NY0yk1WVDkBwQ5PSqlpI4LTDXP+rn3+zTXH7kzu40jEB
	q7IqivQDDJzELtIU8WrU9oDdw1nz17yPwZx0UsiwAJsI0Bla1OqgwYSkRy7xQzu2vHTRAb4CEd9
	UILoumYoRRCO6ydOaF08u0hW8g2FAB+KwexaM6LNxbVEyxflLJ9K3SX2/7qPWVpdwrSaZugGTRu
	+GgeCsQCbdS/ep//eKk847k2pJyDMk3eIIE2ZecnN8A9rkicaoV9SizZLA2UuEQ9gXDw038OrRa
	KtGS31DnzKRerqNEZfvdvOGA4dkyMY8hJ3AFZDai/kKkedXz5Gie0ljPYF9XPuYo
X-Received: by 2002:a17:90a:e7d0:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b41c9cfc12mr15413655a91.32.1795629546987;
        Wed, 25 Nov 2026 09:59:06 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm29085960a91.2.2026.11.25.09.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:59:06 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 09:59:05 -0800
Message-Id: <DN4HJTFG5WHY.1BIGOM7LNESZA@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files
 after Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
 <DMZMRTXS7OSC.M79XF39ZVEWE@google.com>
 <20261125003759.GD3545683.vipinsh@google.com>
In-Reply-To: <20261125003759.GD3545683.vipinsh@google.com>

On Tue Nov 24, 2026 at 10:55 PM PST, Vipin Sharma wrote:
> On Thu, Nov 19, 2026 at 05:01:19PM -0800, David Matlack wrote:
>> This is a lot of complexity for one commit, and it's hard to review. I'd
>> like to start with the simplest approach and build from there: implement
>> can_finish() and have it return false until the device is fully
>> retrieved, i.e. retrieved and taken over by VFIO_DEVICE_BIND_IOMMUFD.
>> Then finish() only needs to free the incoming state and call
>> pci_liveupdate_finish().
>
> Closing session FD is not retriable. If it returns an error then
> userspace won't be able to retry. So, only option will remain to reboot
> the host.
>
> VFIO doesn't need to impose this restriction. We discussed in LPC to not
> block finish() as this call can only be tried one time in LU if
> session is leaked.

Right, if userspace closes the session before taking over all of its
devices, the session is leaked and the only way to recover is to reboot.
I'm ok with that in the first series. It only happens if userspace
misbehaves, and the device is left running with its memory still
preserved, so nothing gets corrupted.

I'm not opposed to improving finish() so that it handles devices that
weren't taken over and closing the session always succeeds. But that can
go in a follow-up series. It doesn't have to be in the first series, and
including it makes the first series larger, harder to review, and harder
to merge.

>> It also has a nice side effect: LUO calls can_finish() on every file in
>> a session before finishing any of them, so a memfd in the same session
>> that the device DMAs into can't be finished before the device has been
>> taken over.
>
> If userspace has two session, memfd in one and vfio in another, we will
> still have risk, where memfd is retrieved correctly and may be
> closed/released due to a process crash but VFIO device still acessing mem=
ory
> by continuing its DMA and potentially corrupting memory.

True, but resetting the device in finish() doesn't protect against that
either. The device is only reset when its own session is finished, which
can be after the memfd in the other session has been freed.

With iommufd (i.e. not noiommu), memfds mapped into a VFIO device must
be preserved in the same session, and iommufd enforces that
dependency [1]. noiommu is inherently unsafe in many ways, so I don't
think we need to worry about this one case there.

> I am still inclined to let finish proceed without blocking via
> can_finish(). I can try splitting patches.

Please go with can_finish() in this series, and send the finish()
improvements as a separate series on top. Splitting them into separate
patches within this series still leaves this series larger and harder to
review.

[1] https://lore.kernel.org/all/20261025021930.674647-16-skhawaja@google.co=
m/
