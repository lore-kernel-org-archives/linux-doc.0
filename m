Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D71643B49C
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450868; cv=none; b=azpp+6lL2bNUW4ubv1n/jaWtWJKTeARsWfSbJ5Wl8exfo08bY8KeeDjOdYYilL4C6mnKHHw7rtalq+vEshwFo3+36Ro5q7Glb56Ksxb6MYbDx2asa6lDiHmq8Z3nJZTkx2Qc6e+P23IN4pD/+EJCqcvLmTRqaGzY13ReWNP+/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450868; c=relaxed/simple;
	bh=NyJzhCVHtEmlObtZuCwoJswYMgNfPASa24UJC44h6BY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=biHRoqAVyNGI5qrrBYzl7sX1MQU2QyrlKl9C9Ru3FyG5Px3tQK/29OlXJ4ztCWB0B8NYitLn9jN8axyTI9/HYTg8GbeFFYr+F5Why7GyN4Il3fyV/zbN4d10kZyiBjzTsZjFHtcYmzbD6Bp8LD3nmpgMF4HtuxBW0j4l1fRA0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DyhRp1Gw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DyhRp1Gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786450866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NyJzhCVHtEmlObtZuCwoJswYMgNfPASa24UJC44h6BY=;
	b=DyhRp1GwfG8J3idcEAi1GB+YqGsHlpHoMoFe4B8bP4KEuDbG5uDs0hilhN7gE8woRuiOG9
	qaJgjvHjz7jCVuarvzikeMfOBB3xOWEZzQWXw9OYMGwbnLHKg7ylPmYIGgsc6NDzydALAi
	iLMH1sCCuwl5UVXMIvC6/ITigRXOYWM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-ULHYwyw8PBains8FvAdHyw-1; Tue,
 11 Aug 2026 08:20:56 -0400
X-MC-Unique: ULHYwyw8PBains8FvAdHyw-1
X-Mimecast-MFC-AGG-ID: ULHYwyw8PBains8FvAdHyw_1786450855
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B3EC180049D;
	Tue, 11 Aug 2026 12:20:54 +0000 (UTC)
Received: from [10.43.2.199] (unknown [10.43.2.199])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD16B195DF91;
	Tue, 11 Aug 2026 12:20:50 +0000 (UTC)
Message-ID: <86c957ed-0083-4aaa-a5b5-d744d8c604af@redhat.com>
Date: Tue, 11 Aug 2026 14:20:49 +0200
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Sashiko findings with comments:

 > Will this introduce a latency regression for fast bulk hardware
 > operations? [...] zl3073x_flash_download() loops over data [...]
 > This multiplies the total firmware flashing time

Firmware flash operations were tested with no observable regression.
Testing showed that the existing callers typically completed in low
hundreds of sleep cycles with the fixed 10 us interval. With the
scaled interval, the cycle count dropped to single digits — the
reduced iteration count compensates for the longer per-iteration
sleep.

Thanks,
Ivan

