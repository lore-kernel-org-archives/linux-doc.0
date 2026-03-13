Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F02857F0
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394592; cv=none; b=nSKKfDX9/4WsM/4HlM5HvZCoJQFGOQMytTfV/+z3mbay7unGQ6XXFS1d3/tWS8oOJnVabcYaqC8rm4bq7yNnitru0XNbdlaCMwzA253Lq0pl6Mibr5e4Okxi6ujy3HXKZhzXiK7/hrlVNfVAc0H0D6F4PPG9fPQsNq3Mmh3Hi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394592; c=relaxed/simple;
	bh=MDPISncaQk/j+sg4lRSOUn1FD/PZXrRXpiRVuog5XwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHfMUfogTK992D3OOTQlErRF2Sf4+eQvqQ+3hAM13XW8G4iyU5dBhizRAYxcFNx+qJRA1B0TThIQlnVdYZpcUQyRq3WngEaFAi9hRg9sZGIPdCoh6RiXdzFqSYLOzpFksfb78SCLw36fmsPyrIGRRuYEsJJu1bt4Wutq4zdFVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=auYYBnmM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7pfSVYq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="auYYBnmM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7pfSVYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773394590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ik0jcpyuM4uQ3ciTkmit5WfEePrPHs1SgwiGTBY8tgs=;
	b=auYYBnmMDHbEQFWXP9Ljxge7cLKDyQdHEyJcRt1glYUCKpy/37xtu+EgjuKIfYM0vVbmga
	1hj5iGSS2Cg90y1HUGlRa5A/TRr1d/tbNEfc1Lbqw4mS5QAL9PnD/Jbl/BZw2La8Zt+Fc9
	1xFgzhkiYip98hDxiD1+bu8vyECBBBc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-ozN2ZE9sP-a5gyhlc9ivIA-1; Fri, 13 Mar 2026 05:36:29 -0400
X-MC-Unique: ozN2ZE9sP-a5gyhlc9ivIA-1
X-Mimecast-MFC-AGG-ID: ozN2ZE9sP-a5gyhlc9ivIA_1773394588
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439cbc5fd75so1258299f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773394588; x=1773999388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ik0jcpyuM4uQ3ciTkmit5WfEePrPHs1SgwiGTBY8tgs=;
        b=P7pfSVYqQrbvZZvHJjRrMUZ9b38FHrelUwCbMCFoCn1Gw9IddxgpjFY1gayevqj8rc
         4sYK6TtUHUJREqHSuw8zV/O9QPpBmdCKTgq2BAfI2RblHkZ5KQgFWP85kvgTKkV4wgUq
         1x6HH1MbX1g1sQjfyyJi6PxUwi8CroeTPo01/zMY8YxvDUrsCo4ayzuifrUIlfSuItzy
         4zWmnAYM1zpmA5LeuwGFGGvZCIfz8bbObQiuyCZ850T5brzxRXG5hFKywgjfIdocSBZF
         IuFDhg76jby9opPtotHWRl5bPFdbUxTlQnoeeVOwD6uQI7NMfSvojnc0kkM0P6uUj9Bf
         XTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394588; x=1773999388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ik0jcpyuM4uQ3ciTkmit5WfEePrPHs1SgwiGTBY8tgs=;
        b=m+jfJDa7cb3C/Qblhj8R6BuiAukaMg8aTHTStn6ZI5z+mXMTr1PjqlFCzOdBicGCfo
         9Z6JRyY5Fa3atq4uBUsS3L7qI6RQKEsEc5HBh6R2rkHzP1MfXnZ5+LXkULr4ZxkPzI7x
         kfmXuzIYmTjy5fZeils2ICd3fI5HhppY2KXunMD5EKr5WxOZAFLNUht/vK9paNRTxVSD
         TTDDiWzznQEkwvddbahc7pTbsBGIS7Rnu324U6PY3n3QBkLw9wJAPecu5r9MBqV+HVR9
         NUIarE/dNdTIMee7ZuofVS8pwmRJyKh0R0KFjx5Vt7D5Km6KlAYFZTHLXUG1ph7IQRHH
         PTMg==
X-Forwarded-Encrypted: i=1; AJvYcCXbjC03zqH2+5hoHb3pU7hnzljUOts8Wbs5E7e9OPUynHmP+WjkSXViBRPlYKSCvIWqsYXh5Um0O/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW6hCWvAAv+pX3SJecRCApGOfLHsLoimxpWUi3QfSjIJ4ZiNW9
	9u+61sgrFmXuDogMVA7hRSx/x9ufeTvO/gE4TYnarJzFfveIPAQgZURyqjQ7UQunYs3pYbSgpeL
	kM8wT/Ni8a8hmqueRdDaq0FWlDZHr24/YI/2pR67sOb5VRX9fFgySkNpWqjgEYg==
X-Gm-Gg: ATEYQzzUh/2dLFIagBgFHeIa9OP/26jROy7ofHF8qWlFnkYXITSEo8HOa+nSADZwfAD
	nq/4/RcRp/BAFRHw5qaCgFyg8InmJFW5WdYDLd4ZxlVlq1PGkFiet7TAC27kjLjGg8g3caq4vUh
	XDrPk4rTQ6IzJ2yYzKOeLzHDHWjcs4fRpwPW4VOv2QA6WdY8O+39vTbSNX7I0AmZPYDrv5DYxnm
	93xu/OxIOLL/qZxPZIylQNUATcxEaiuDpkQutDzwb4QFU0nTNvpOA6zlFnjn1Ppe7C3t7cUC+I9
	yPlFXdxKhhtbuHmhz+oy8VojokCYOVmxDzPOw0R7CnZ2ScWoUTj6QgF4cDjH2cbnHmp4EemCUGL
	tfg5K4A0+IXQlnXl6eZlBM7L781aikISHuG2Zhr9WJSneYqvX4EbBrPE=
X-Received: by 2002:a05:6000:2c06:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-43a04dceabbmr5256612f8f.59.1773394587626;
        Fri, 13 Mar 2026 02:36:27 -0700 (PDT)
X-Received: by 2002:a05:6000:2c06:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-43a04dceabbmr5256562f8f.59.1773394587136;
        Fri, 13 Mar 2026 02:36:27 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acbbsm16991060f8f.2.2026.03.13.02.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:36:26 -0700 (PDT)
Message-ID: <da079dc9-4698-4e87-b7b4-ba60ecebf4b5@redhat.com>
Date: Fri, 13 Mar 2026 10:36:25 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mltQQVRDSCB2NyBuZXQtbmV4dCAwMy8xMV0gbmV0?=
 =?UTF-8?Q?/nebula-matrix=3A_add_chip_related_definitions?=
To: Illusion Wang <Illusion.Wang@nebula-matrix.com>,
 Dimon <dimon.zhao@nebula-matrix.com>, Alvin <alvin.wang@nebula-matrix.com>,
 Sam <sam.chen@nebula-matrix.com>, netdev <netdev@vger.kernel.org>
Cc: andrew+netdev <andrew+netdev@lunn.ch>, corbet <corbet@lwn.net>,
 kuba <kuba@kernel.org>, linux-doc <linux-doc@vger.kernel.org>,
 lorenzo <lorenzo@kernel.org>, horms <horms@kernel.org>,
 "vadim.fedorenko" <vadim.fedorenko@linux.dev>,
 "lukas.bulwahn" <lukas.bulwahn@redhat.com>, edumazet <edumazet@google.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260310120959.22015-1-illusion.wang@nebula-matrix.com>
 <20260310120959.22015-4-illusion.wang@nebula-matrix.com>
 <f669062e-16f4-471a-9884-6441c478dd09@redhat.com>
 <388ff939-2eae-4cee-aac5-ca88dd37ef49.Illusion.Wang@nebula-matrix.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <388ff939-2eae-4cee-aac5-ca88dd37ef49.Illusion.Wang@nebula-matrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/13/26 9:05 AM, Illusion Wang wrote:
> I am so sorry, Last time I missed a 'not'
> 
> These data are used to configure P4-related registers. The driver’s functionality
> 
> depends heavily on these register settings. They will be declared as const.
> 
> But they can be not marked __initdata. Because it will be called by pci_driver.probe.
> 
> They also should not be moved into firmware files, as the software functionality
> 
> is tightly coupled with these configurations. If they were moved to firmware,
> 
> users could easily end up with mismatched versions of the firmware and the kernel
> 
> driver module, leading to functional inconsistencies or system malfunctions.

Please add the above explanation somewhere in the commit message or in a
code comment.

I appreciated you switched to plaintext for ML messages; please
additionally try to properly quote the relevant part of the message you
are replaying to: it will help following the conversation.

Thanks,

Paolo

