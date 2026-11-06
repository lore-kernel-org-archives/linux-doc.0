Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962237;
	b=yaYPVrutnWxddgjijzuT6tf8jH56DUzcGRPLP8W6FS0lTop3DZliHE8DI/VgPMatKaKp
	 CFkopUgAE6+S7CHRfpJF84Wq0/hwvZ9BmON75aXUxUqyvATPZhsRWZ1pV6pCAAEtLNed2
	 ZsYsth7b/VMlLPoUwv9LnOvdQbZAFjb/sqEAB/mak+IJh+cSV613kjtweBk3CiaMfjWIA
	 PYuhDecr/Tsts2SowVaZnIWAYFEK+z2TYRcdSbFLLio1CfTgfiZgbefuuZgzOB/Ug6sRw
	 Wq8CaeUdn6HnwBvVWNN4B12IygEDKVfOJIK64MZddZ1y5jcyiO+nbt/WRPJr/gVa8zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962237;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=VaTuCkSJKJEAY9i/vs3DHvelrwbFZGh+V9o299AVh+0=;
	b=nkaEu7ssZvw24LHmI6qEIKPHr8i9mq5LtAWDarNm7pFB+19ezFcOU6q5prxvBf5+0kLr
	 ZwdEwzcHTE0b5qrojhRqzP77+2y3aN+E5zbCFXom65SylEU/xaqTYtp0Tg+DSkw8Q46ji
	 CIpMICmNr4F6kjNt5rBF1vg4xQP08i7XtSlXNYx5qXodfxMFUqOFyOI9kkMAfH/m0KjHu
	 e2j2+sKKZxHncC9xUOPZLtnqELq0xbNrVWEt7iCUoQ9ikMIlnlC5Z71P/8M+fIbPzAFbm
	 o+664Jbuf8ih1LseSq5o1AYig/qZWWK3sogPlgzWo6G3qRw9PULrcU6CSSx0FlYyR7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnFuxcNH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126C606A331
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F126C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnFuxcNH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaTuCkSJKJEAY9i/vs3DHvelrwbFZGh+V9o299AVh+0=;
	b=YnFuxcNHNFTRb+RZRZ/JqRBfRFfl9LF54q//xqqIJJ7ADcRgCKOBtIJkTGYCgq62dYhtBA
	sf8jYLBqYl3OhUTJ09mhb16goB0cPf/CRHumibprA5poMMFy4HyZlleCjS7pBPEt41Ck4F
	AVBRiTqOWnEJZcvwYZemBvG1hOPIwdo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-JvABvuXbN5igis4jHvFBdA-1; Fri,
 06 Nov 2026 05:50:32 -0500
X-MC-Unique: JvABvuXbN5igis4jHvFBdA-1
X-Mimecast-MFC-AGG-ID: JvABvuXbN5igis4jHvFBdA_1793962230
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FC211800848;
	Fri,  6 Nov 2026 10:50:30 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56A281956047;
	Fri,  6 Nov 2026 10:50:26 +0000 (UTC)
Message-ID: <bcad7df2-4515-451e-85ec-aee53e391f27@redhat.com>
Date: Fri, 6 Nov 2026 11:50:25 +0100
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
Subject: Re: [PATCH net-next v2 09/14] dpll: dpllsim: Add support to set
 frequency on pins
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
 <20261105151852.1844305-10-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-10-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/5/26 16:18, Petr Oros wrote:
> Add support to set the frequency of input and output pins. The DPLL
> core validates the requested value against the supported frequency
> list the pin advertises, so the frequency_set callback only has to
> store it. The same per type tables that validate the configured
> frequency at live time serve as the supported list. The configfs
> attribute is rejected with EBUSY while the device is live, so only the
> netlink setter changes the frequency of a registered pin and the two
> cannot race.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

