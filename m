Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5759C4457BD
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451174; cv=none; b=rcsQ/kg0mr5W6ACUXr6b3xXfD8elV1gR9EOVW3yiIt9XLDRcb/GLRRW5LfwOIyedotWh/DBMuumE47e+jdzjRyaX0aOseNYQJNwgcwxO9y6E0cEb7doHHAL1nQLAUcP9ej16WIlH5OKZy08gNsi/W4+2KIUVPhmTStgkqfvCi14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451174; c=relaxed/simple;
	bh=BYdEHONWqi/8SXoQTMBuYE9+HuCXANbCzYEYTuU+KZg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BrINDQoM6xSnIvAqSz/NhgKEJR0w2oErP8gEaul/xW2Vao7jDp6SG53gd1RDQvNMcNSaFtzj2xDlMETUxTPgoJe03MD5EFQJ8xNUn6bhFlxkt6fEc9/5HOzOvL8elKWTN1PQofYJk4uE/gScvH/rnfVjxbhhjDz5pZVp/c1hDgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCeG3BoQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCeG3BoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786451172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYdEHONWqi/8SXoQTMBuYE9+HuCXANbCzYEYTuU+KZg=;
	b=DCeG3BoQGBeZMpubZ2z+dtHTxPuP1S9lFgJTbn5UV4XzD2refYsWvYDhWhmujqW5nfYzqi
	X95IJUc+qOvQcbX6MOpFtdOXb47wBflOFPkYZE/cEffuHbx24ciMnaJao9G0cjxL/sbPo6
	PuaJDHG5oYdQfn/dqYOZ38rZZs4t/Gc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-dRD6R3-ANOCrfJvlaNO23Q-1; Tue,
 11 Aug 2026 08:26:09 -0400
X-MC-Unique: dRD6R3-ANOCrfJvlaNO23Q-1
X-Mimecast-MFC-AGG-ID: dRD6R3-ANOCrfJvlaNO23Q_1786451167
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46650195609D;
	Tue, 11 Aug 2026 12:26:07 +0000 (UTC)
Received: from [10.43.2.199] (unknown [10.43.2.199])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 006D3195DF91;
	Tue, 11 Aug 2026 12:26:03 +0000 (UTC)
Message-ID: <dc80c37d-6db1-49ed-8eb3-1e23eca0700f@redhat.com>
Date: Tue, 11 Aug 2026 14:26:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 3/3] dpll: zl3073x: add PTP clock support
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
 Chris du Quesnay <Chris.duQuesnay@microchip.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Min Li <min.li@microchip.com>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260809182340.1081610-1-ivecera@redhat.com>
 <20260809182340.1081610-4-ivecera@redhat.com>
Content-Language: en-US
In-Reply-To: <20260809182340.1081610-4-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Sashiko findings and my replies:

 > By returning rc directly here, does this bypass the sec_adjusted
 > check at the end of the function? [...]
 > Should this path handle the timeout failure similarly to the fallback
 > path?

If tod_ready_wait fails, we cannot be certain that WR_NEXT_1HZ was
actually applied. Returning the error and letting the caller handle
the retry is the safer choice, because masking the error would
silently report success when the adjustment may not have been applied
at all.

 > If a previous API call (like zl3073x_dpll_ptp_settime64) issued a
 > ToD write and returned without waiting for the 1 Hz edge, could a
 > subsequent sub-second adjustment clobber it? [...]
 > Does the driver need to wait for pending ToD writes before issuing
 > sub-second adjustments regardless of the delta size?

All PTP callbacks are serialized by zldpll->lock. A subsequent
sub-second adjtime goes through zl3073x_chan_tod_adjust() which calls
zl3073x_chan_tod_read() which starts with zl3073x_chan_tod_ready_wait()
— this waits for any pending WR_NEXT_1HZ to complete. Phase step and
TIE write operate on independent hardware blocks and do not conflict
with pending ToD writes.

 > Similarly, zl3073x_dpll_ptp_adjphase() issues a TIE write without
 > checking for pending ToD writes. Could this phase adjustment also be
 > overwritten?

TIE write adjusts the DPLL input-to-output phase through a separate
hardware block. It does not modify the ToD counter and is not affected
by a pending WR_NEXT_1HZ.

Thanks,
Ivan

