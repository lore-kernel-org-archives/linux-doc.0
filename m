Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331943;
	b=GB2SlKHqE/0lcCEOTEc0l3JHZrml4RJaxiG1HtvptoKIhkAUT7T96WsNsa/lFQ8+5hgb
	 2vb26yLxxUbRV3qU3lbx/aJV5TO7eXjY4MuWrYXfQhanHunkuaxSQsJaCW7b7U1+eT7Iu
	 Ka+pi1qldemLGqpWsO1p8zUxswHXou4HIdkFBlyK1L7y2puNyfa0c6fWPuu36sT85Ayj0
	 8NtJeo5jSIV3zNqwXYnZ2rMrnNLcTPbHVaIoImb1kVzzzikVy1l5Q321yacUWlEPX3x7F
	 bNyzv0826m+0EnYSm6UiMJZmHlv3jQspePWksqe1mmYHzb7K3RuTnCCkTXNiXZj/18w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331943;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=O/wNfj9zcVudY5TorfEHZYOP0zrjBm5k7fCeb1ImJL0=;
	b=5SbYYsJqsbiEbew332DrlLwZH30CrFyHl8SXC9JbUCiO9ki8XdIVGtpQZDPc8BizEdIg
	 faePkFCgWDVN+a+n/DJ5G3OVQpV5lNynHqhOyimz7BdEeA3nHjocFglh8j72Aydagi54o
	 aZcOMmG2ETyBgiUG0txDtBobn1n7nDnXvhiQGunfn0tN/sfR+R+UPjvbHyM1NGYNaYXwb
	 M+j7L24OwylEGORT4VyGFw+v4HMO21yJOlxLNT4w9r0Ksjq7B2PfzEpe6/W816dAKx/Vv
	 v6eN2+G03I2+HCm0VRb5EmfHmhA+/SEr9f2C8x/x4jARDXM1e71G4EJe/FP9TJ7NraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UMzGgKBv;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590E606A321
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C590E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UMzGgKBv
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O/wNfj9zcVudY5TorfEHZYOP0zrjBm5k7fCeb1ImJL0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794331939; v=1; x=1794936739;
 b=UMzGgKBvNBX4bk+Xtr0kW8FFD+qatUIshJY3LtKCWFPWXKE9wh8PE+DfZoW/Ktm9gG9oRIiS
 61T6mhG2xbaFEnzw41uGcwWIEuOsr8rslXYi6NVdBcP3P6pWHCnfR3GNNFMqV1fZedr2TbdepwO
 WDJ3nPchbY3f5jlqyxmZgHWg=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca7ef77f2088ae7e;
	Tue, 10 Nov 2026 17:32:19 +0000
X-Mizu-Trace-ID: ca7ef77f2088ae7e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12794e87.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 09:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGDDQAHZo9v+ypHKaxIQ+i0QXUGeljAiqcC0HqcsFu1BhoxTzFRE21wRCpLNEYRNAAOj0gmy+Pqx0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YhHDZZS6gt8av8mqmW0mTpCWIpg8xZNDPl1e2Wnu02Rr94SeO
	pCpH94VB7UnoMskT+Ef83DCxQRjQIiIctcpAdkWG10jPpbSxOOjgQZq76YeM5xbvDYYGxj0/z4h
	CZIzlMMLRTSLk1cEnxTZH2aHxdoaXneiWE2aWujgg
X-Received: by 2002:a05:6512:1052:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c157db2ba2mr166549e87.9.1794331937194; Tue, 10 Nov 2026
 09:32:17 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-3-fuad.tabba@linux.dev> <avMoubwqgXbpflwM@gremlin>
 <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com> <avM9i8xWNZ2fU8_2@gremlin>
In-Reply-To: <avM9i8xWNZ2fU8_2@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 17:31:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw-t85cJcZChnuEcTboe9FbLmvFXi+vn3os5N49R-z33Q@mail.gmail.com>
X-Gm-Features: AclHuK9X3Qq0RyJZlRjr_WD8VHNxqnjWuSAxxr9VQ80XC2fWGGeURk5VvSDZtkI
Message-ID: <CA+EHjTw-t85cJcZChnuEcTboe9FbLmvFXi+vn3os5N49R-z33Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 15:57:37 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> > Yes, the acquire pairs with the smp_wmb() in kvm_dirty_ring_push()
> > ahead of the flag store, and the release with the smp_load_acquire()
> > in kvm_dirty_gfn_harvested(). dirty_log_test does the same.
>
> I know it's test code, but general kernel practice is to add a comment saying
> what memory barriers pair with so it's easier to track, could you add those for
> these?

Sure.

/fuad
