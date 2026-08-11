Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C312441612
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450816; cv=none; b=WONunS/q/DQH3a8GDnkibZ9HDX119yorPRyCYudvifv8L+dxN/3+t2RYyEP5amhV6I3cIQWLqanN3is5fzHASgpCn/sOVjMrvvOHD63xJCUahWAePqkw9fltZUHNZ3rg/lSVpPicYr7LiQdRh0Ty7qAkpujww4Wg+lvjps+VVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450816; c=relaxed/simple;
	bh=bZhfQ75/tBx76bRwf/yqfxbrZJKpDXW17ur7HV4Joh0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VhZ0QNessj3q6b18QTSXY8BrFHM+EHN1p2J8EzOHbA2LxBg+2BgjSSleoL5x9UnH+CZZc9Rr1vJkEcBVD9UFMdZbeJHsk4K5ccDfav52+Nymr6NFGwKGK3elJ4igBJq3wGH4EUm+6rGX7E74EaHTk0oyx2ODQJ8OOvx4+XwwDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zk9oSKyd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zk9oSKyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786450814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWX499O3iR5H1HkaG3ftvTfcj6oM13J2855Qi6h6PhE=;
	b=Zk9oSKydjALtk9i15bKxJxJIy4uB+j0UBRtz5Grlxj3doYL/rTO1VpyByXIA6X713d0iqu
	wwYGjiFZU3FoU1JTMGAf2a5X6EVsonZfkncPlVyzk0Zm2oC+ynIsBCSn7FgyHR7lyIZxAx
	PVahEbxJqlCaPN1X4gcs4yYIfuvTTmQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-SKRFYKPRMfm9AfZj5zxrqw-1; Tue,
 11 Aug 2026 08:20:04 -0400
X-MC-Unique: SKRFYKPRMfm9AfZj5zxrqw-1
X-Mimecast-MFC-AGG-ID: SKRFYKPRMfm9AfZj5zxrqw_1786450803
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C26751956052;
	Tue, 11 Aug 2026 12:20:02 +0000 (UTC)
Received: from [10.43.2.199] (unknown [10.43.2.199])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 57C50180049F;
	Tue, 11 Aug 2026 12:19:59 +0000 (UTC)
Message-ID: <b2173b95-a110-4301-870f-b54145028e6f@redhat.com>
Date: Tue, 11 Aug 2026 14:19:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/3] dpll: zl3073x: scale poll interval
 proportionally to timeout
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Min Li <min.li@microchip.com>, Paolo Abeni <pabeni@redhat.com>,
 Petr Oros <poros@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260809182340.1081610-1-ivecera@redhat.com>
 <20260809182340.1081610-2-ivecera@redhat.com>
Content-Language: en-US
In-Reply-To: <20260809182340.1081610-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Sashiko findings with comments:

 > Since zl3073x_poll_zero_u8() is the single shared polling helper, 
does this
 > also change the poll granularity for all the pre-existing callers [...]
 > sleep_us becomes 500 us, 1000 us, 1000 us, 600 us and 1000 us 
respectively

Yes, the change affects all callers. Testing showed that the
existing callers typically completed in low hundreds of sleep cycles
with the fixed 10 us interval. With the scaled interval, the cycle
count dropped to single digits — a much better fit for the actual
hardware response times.

 > Does the flash path also get slower? [...]
 > over the tens of thousands of words in a firmware or utility image
 > could add a noticeable amount of time to a devlink flash.

No. Firmware flash operations were tested with no observable
regression. The overall flash time remained the same because the
reduced number of sleep cycles compensates for the longer individual
sleep intervals.

 > Would clamping the derived interval [...] reach the stated goal [...]
 > without changing the existing 25-50 ms call sites?

Given the test results above, clamping is not necessary.

 > Reading this, one would conclude the existing 25-50 ms call sites 
keep their
 > old behaviour [...]  Could the changelog mention the effect on the 
existing
 > [...] polls?

Fair point. Will update the changelog to mention that all callers are
affected.

 > Is "approximately 50 iterations" accurate?

Will reword to avoid the specific iteration count claim.

Thanks,
Ivan

