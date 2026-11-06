Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962290;
	b=Lm3RjE+sP4KyirV4IEbQTduMKGC0EVskygHN0WQeIRMNPZYl20ucIkmyzaHxbTDzLkVp
	 t3Rw7LAxSKJTV7JpHaE/bXP1mRYDeNdlrKbFFjtlGpnmhht9/jl2yrjbwuFA2mFVpzC3r
	 86GhpqomSa7gixRRJincJwQerzFTuMUrUC3k4sy5RGZJX0ZQ5r/Ti7be+FqciJA0Xq60S
	 hsun5FAPoFp2VtWW+Q8n1og3AfJgF+Yaj4jSmmTsk914qFHg6mt0uNaA/muQAYxt9Q8c7
	 iV6HC9qUOApab6qR8TreebMMQJ65yz04ZI9QC3cG+aj5SiAgdlbt6qPKf8bYojhHE/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962290;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=gOZFhnUAU/5uIvd6LUF8nwusQu4abl1UDmdzKSmbDxs=;
	b=xFKs4UIgr2aRzqqO0yiWNHXZqXicMzAoFmnpt3Pg2Voc/Rdw2VDNtUi/P1hnBCxx9hBq
	 lDKePoTzaH+GGZW7oD1FWU0rgDqcBRamFfQje+IrohiuRFt/TajjQTG5rZSBQQeIaacf/
	 Fh53d5Y6GhQTfDGIprKet7PLjloJ/tmtJXAG5pWiS9g7RUGut6N78uMji1u87egA+qrp6
	 Zz/z0+Za8YAe33CEIEoNFKKqrGTiLj4hPZvF+N6cFx2Dj4jj19lz8aNmktpbEB9clveWc
	 zd4aZ7PPs2zha0rN+n3Niqye04K05p3C/0wovmwaE9Br1ooFpP1YTMiG3coyNkNGmPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bN9nuu5K;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5B606A326
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C5B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bN9nuu5K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOZFhnUAU/5uIvd6LUF8nwusQu4abl1UDmdzKSmbDxs=;
	b=bN9nuu5K1kZFDYz6AtXA9j7rlIcelRmeMBmP3mnEKbidhwoClSBGUlVG8qrMD3qczgZQsN
	TAohYiVf9CSlCC61q7O+3IHZtTegIUafPUOFj9jvqGueAKJ6tSIdVs2unYEcracPHMldZA
	NKap9rlLKhgC+RnLYth1rOFmBYubVik=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-7Gi1EXdAMWmgh30Q9b0fqw-1; Fri,
 06 Nov 2026 05:51:26 -0500
X-MC-Unique: 7Gi1EXdAMWmgh30Q9b0fqw-1
X-Mimecast-MFC-AGG-ID: 7Gi1EXdAMWmgh30Q9b0fqw_1793962284
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 186A21955F1A;
	Fri,  6 Nov 2026 10:51:24 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0F3F1956087;
	Fri,  6 Nov 2026 10:51:19 +0000 (UTC)
Message-ID: <e5b06efd-ccb9-4e60-90cc-679435726a59@redhat.com>
Date: Fri, 6 Nov 2026 11:51:18 +0100
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
Subject: Re: [PATCH net-next v2 11/14] dpll: dpllsim: Add support to adjust
 phase
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261105151852.1844305-1-poros@redhat.com>
 <20261105151852.1844305-12-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-12-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/5/26 16:18, Petr Oros wrote:
> Add support to get and set the phase adjustment of input and output
> pins. The pins advertise a granularity of 100 ps and a symmetric range
> whose ends are the largest multiples of the granularity that fit a
> 32-bit signed value, so that the advertised ends themselves are
> settable, the core validates the requested value against both and the
> driver stores it. The adjustment is reset to zero every time the device
> goes live, so that repeated deploy cycles start from a known state. It
> becomes the baseline of the simulated phase offset measurements once
> those exist.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

