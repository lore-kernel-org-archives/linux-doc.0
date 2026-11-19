Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092258;
	b=SBjXzK6PYFqJ32BjQa0uHsXOxweptMce34m0jUuSl39XFUin1JjiccaQpj5ZehiI9+6g
	 NWCRW+Vz0/ChyjKTdmckdUjaOD4cxE2KU1gtAFNcAAM0rTk2LejkMqTHKp/zkiGY5EWgd
	 B/W0w0Ep8qKEmWLlALWHNA8biqgMtS0TFLutcbWFnZf3eiK57zzoQ7OKFWIaGfUMFcE9H
	 j+o9hi7HhXmrhXK6BUhkfXukitdVMy5LZpwAaPp8SI0bt4p/nUsgej/JWtVpq0Y0gxGTS
	 GGKFEtr2sk00gzJ01NHufAKttx0qfSRr9eJMQvfCvz/DxqGfKh+MFUAHQ87NED25yIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092258;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=odGKjtuO2fcSEp2Bw94sYra7hu3Cvd+3dwpUXKWdflc=;
	b=hNSbuL6acMELh+vXShggFHCXbm5DA23IU9KEw3cEftKKf5O/ktuGF1Wfaoevd7nP+vex
	 YMDfSKzMpyTpFgHB1zcsEBK7XD1jAnLfO6szMK8tQMEAg7LGLHoK9STyb656doDi+PHG2
	 SF2xxJBJTu+acn4KxdIwtszH6c6enf9tnBCcL9st36DnOsYrzCWpK+LieEYF/n8ohY6dP
	 gm2CJuPDKVS7YgrvwwqKIfHHn71gpYJl7OGdg7i7JwzvafOZuH2mAGXVoB1XiaJZfa/8c
	 yIR5+eh3JYXlwNTDiYfo4jvfqmWbNWq2CAMCLtVgHGSko/CuWha649Q1PYzRuoK+uew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=csPlpUoG;
	arc=none smtp.remote-ip=91.218.175.170
Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF860A2639
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADF860A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=csPlpUoG
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=odGKjtuO2fcSEp2Bw94sYra7hu3Cvd+3dwpUXKWdflc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795092255; v=1; x=1795697055;
 b=csPlpUoGn3OMuKMRffkO422j18jyv2KjsrAKbyNhrUnO5TNOc2/ylUlzRqL89WItcZp1KY86
 gF84eHs7SilytFwUSllTmm/IuLGgxnP2omI6cbfs4Xr/iUP65msDPxmYzEAyUjkzCDWFxjpGl8i
 3LUQ44t2Rpt1E4nKSQYNRqIQ=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49027ade88d0b6e6;
	Thu, 19 Nov 2026 12:44:15 +0000
X-Mizu-Trace-ID: 49027ade88d0b6e6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso5408e87.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:44:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHWYLbLkE3S9ijaFeT3TBSakBYox+eQe90vRUau7yhkNAxSCTyioKyHdWtui22izxQtg1awTPdP94s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uaaOSA4cqPa21yjpvaDAePRRMeiO+PY42rUYjiPjbkgAM5gff
	PW9/5nyVH1+vWdpw6ByLrS+AXMkIE+1HjecRVvyvjtWOHlXB2oHAiBGkYBJB7oFtuHY5uUJ3mrD
	f40tKyw13Fb4roOgjsAYknCNf2IW0yRx+Ncy2EBeL
X-Received: by 2002:a05:6512:4011:b0:5c1:4d61:20ff with SMTP id
 2adb3069b0e04-5c1b6774040mr72185e87.10.1795092249237; Thu, 19 Nov 2026
 04:44:09 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin> <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
 <av5CBjbeidUUWiLq@seanjc-mac.roam.internal> <av7bYb1geEGzaj8e@gremlin>
In-Reply-To: <av7bYb1geEGzaj8e@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:43:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwzdsMKw2MFB9kpV=Xtm4JFpTbWRn0BOSwSB+x=RJhVMA@mail.gmail.com>
X-Gm-Features: AclHuK9ExBlvjAlpEcQpW7OIX1pR4w0klOAvsUXwgDHyVbn5Bw8uFWJCaQ8SOYE
Message-ID: <CA+EHjTwzdsMKw2MFB9kpV=Xtm4JFpTbWRn0BOSwSB+x=RJhVMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Thu, 19 Nov 2026 11:18:48 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> > > (note that it skips CSR, SBI also with a changed exit_reason).
> >
> > Ack.
>
> Probably worth referencing in commit msg I guess?

Will add one in v3.

Cheers,
/fuad
