Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817334;
	b=1Y2FpaBmSRGNVVcnNtTR+tQ1Gz4VjM3xPc9pAQeqE4WMKy/3c3pyNUdr/e0S71pdwTj0
	 PtWff3OTL6CnTX/fvqRtp23dRR+A6YfJlSjoxZn5u84HaY9hhkD7SeeCmyjkolji20PXO
	 MgNp56HareGNtEH/67O9dnAonhFInKT6xJ3/k2bU3fd1ScWd+uyTeencStV0xRE1mE7Gh
	 yIel7jUmj0dl4C5g2t7MtMWyxoGkxUfjv/EIviz7CcVv+lBAU+oh0tHCrnkw0eJVMNoyF
	 eyaOgw8NWzbMCfWovedr1SXt43APqgq3qwTR6aUwAR5WSiL/3Xhmb0V0xuUK7b/eNoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817334;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=gfIacyhfnvssNjldJA8LhzYaZPtCvyfmo//br/NPqo0=;
	b=QL3NlhoxsmkmpCG16yhE1JBjpoGm9tfjCLGFwDjwrIJlK3HXtu7QOk+G3PIBClniHkEA
	 IcWp9r2/sddZRusqIWFJ9pQUUD8ZzRH9I+qZX2LHemeqaDxxR3lJxTtVVtLrAlsDTDF0K
	 i0AUMtdCGo1/8ao23O2WeaDd1RkuOiEMAC0Cj72DrxI4X5nkK30qkh5jSEpQT+yJ7hkYK
	 S7/HNHvvIOui2FvQt6BjAfmxQFFrB7jFLpudnIKZhHGXX9MYoFL1+pd/7h4pR7Uq2mm7S
	 DE6gIj4vY5Sru163phuvqDA4IOlVivCT+fPAcBNqszgfmo9pQUbJMG+ZFaOygYRaj7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fQZ84ft1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5A606A337
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE5A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fQZ84ft1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794817332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfIacyhfnvssNjldJA8LhzYaZPtCvyfmo//br/NPqo0=;
	b=fQZ84ft1LYqoWqfxV+VJnUzlMoH/x2ceAHB77s6q1s/wgcbFLm/SFxaJrpZaGhSwRpGTcl
	7WxQprHNN7F9S9tyB7gd6O2qvhyusnjGJsAjtcsjSH7eP/tWFb+1X/VcwBjS8H71YS8YQI
	+kF8MbgI9v9FolVEnehadCFlOMNzp9o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-YeG4u82aP8Of6FAvye7dWw-1; Mon,
 16 Nov 2026 03:22:09 -0500
X-MC-Unique: YeG4u82aP8Of6FAvye7dWw-1
X-Mimecast-MFC-AGG-ID: YeG4u82aP8Of6FAvye7dWw_1794817326
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B8B61180036E;
	Mon, 16 Nov 2026 08:22:05 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9625C1956088;
	Mon, 16 Nov 2026 08:21:58 +0000 (UTC)
Message-ID: <2770a801-e889-4181-84ef-d1846d6c9e15@redhat.com>
Date: Mon, 16 Nov 2026 09:21:57 +0100
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
Subject: Re: [PATCH net-next v2 4/9] dpll: convert dpll_lock to rwsem
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Petr Oros <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261111164021.273409-5-ivecera@redhat.com>
Content-Language: en-US
In-Reply-To: <20261111164021.273409-5-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Sashiko reviewed v2 only on its dashboard [1], with low severity
findings, so I am answering them here.

[1] 
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111164021.273409-1-ivecera%40redhat.com

 > This isn't a bug, but zl3073x_dpll_input_pin_ref_sync_set() in
 > drivers/dpll/zl3073x/dpll.c still uses the old global serialization to
 > justify dropping zldpll->lock:
[...]
 > Could this comment be updated in this patch, along with the dpll_lock
 > reference in zl3073x_dpll_changes_check()? The later patch "dpll:
 > zl3073x: update locking comments" rewrites both. The stale comment only
 > exists between this patch and that one.

Right, both comments are stale between this patch and patch 7, which
rewrites them. The code is correct at every commit, because all channels
of a chip share one domain. The new comments hold from patch 3 on, so if
a respin is needed, I will move patch 7 before this one.

 > Pin requests now run with dpll_lock held for read and pin->domain->lock.
 > Take a fwnode pin registered on a DPLL from a different domain. Can that
 > DPLL's device callbacks now run without its own domain lock?
[...]
 > Would it be better to put that check in before this conversion, or in
 > the same patch, so this gap never exists?

Right, between this patch and patch 6 nothing rejects such a
registration. As you note, no in-tree driver registers a pin of another
domain with .measured_freq_get, so no commit of the series can hit it
with in-tree drivers. If a respin is needed, I will move the check of
patch 6 before this patch and keep its tests in the KUnit patch.

Thanks,
Ivan

