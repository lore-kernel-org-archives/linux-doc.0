Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260642B757
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558895; cv=none; b=l08v+qjGyxifiCzS6TTn1n3bsQQIKpUeOhmFs68LxjGPGLsSlJS1EPX9NJXUWYzGxshTyvt5Wcneu8cySvzg45OhHs16DTDsuPOkz4L2U7rDiFPTDdaCBET37lJsMgBO3Q6QDTzzaVmtWfmdga3oUeHpH69Duf+fzKYVsAncCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558895; c=relaxed/simple;
	bh=0pR2x8//pyF9xL3q2vRTlnGdtD7xdzdl3nI0D0ABwdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbMJgYOVxAyuxZlaaNE7E+qTuVafyiSorDOhmnNQe0K3riLXzX4GevXn7lRA/KleYJ2nknpoKToicWtKXIv2HnRgZIdFINunxnDkd4bNC/tDpJXBq0cwY8GoEOaHzI/QQFd8h4RhE30IvKsPXEtze9dxX+82VP2xnsq3myug470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g+VllSkR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DRF5cv+5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g+VllSkR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DRF5cv+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777558892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qt78KjmTadM8i57CfK4+t3vDTX4phWDue2Oou3Nj7OY=;
	b=g+VllSkRxbt2AuDBEz70+dhm0EeGuqVp3nOV6+ELqnjvmitZGidY6kUUHF6tKNODfCy7ls
	y+vCGtsePkZ9MFTtaFJ3ThNMcF+t1AHcJAVxdMxayYFHj9mUJu4IunPvosmJY3ZkBTDVW+
	XGFyOh3uyP/Yqurb2SkuLftpD1Cl4yc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-kQ1VRpCaOYqMIculV3h43A-1; Thu, 30 Apr 2026 10:21:31 -0400
X-MC-Unique: kQ1VRpCaOYqMIculV3h43A-1
X-Mimecast-MFC-AGG-ID: kQ1VRpCaOYqMIculV3h43A_1777558890
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb82634cbeso185117185a.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777558890; x=1778163690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qt78KjmTadM8i57CfK4+t3vDTX4phWDue2Oou3Nj7OY=;
        b=DRF5cv+5kvlwwgsSj4Nt5X6LueA5m1Lj9tQj3zjbkpTpQyXuZXv8BWa1ga08FQjpVB
         9HpZaayP/PoimeqjRN4u789SchrJ2GG9OlyXtzHKeJbacEXRSCdbju8npHx0iJ5GeASb
         s96AB83lxIWLkFoGVyurbj4RygqtqMIheikoQE6A5biMUSiobOmLqpxcRlrgv0qBIREn
         qCBxx904P0lK4TSQKBVb4poedaOZkKmWoWAfDgbG2yV+99QwMi4VLgRXeH4r5Az2Ur3S
         wmsdmQu1P8El8vSkwkX71Jg0ee0LPTjlifSny8Jh6C/HONZHwMQyjr5aIslCe4Rfr5d+
         EPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558890; x=1778163690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qt78KjmTadM8i57CfK4+t3vDTX4phWDue2Oou3Nj7OY=;
        b=oURkTI20L6K+B+OxAL9jFRVRcs5gXKN6Z+MRI03+eck4VugctazxhZ4/yPy+KEp8mq
         7gq68YdxCCkyxqqH5C2EefxswVYjlqDLAEyHiTvbsI3wi/xQIX3UDet4Wbn0VhyMa9Cz
         it4sUA+j+SLucoF74i+ymenn0a/0icy3H6UIkDOS3UQramE9pQrGlpalM4ztbX7GvQmp
         BqSKFO8BPqQzsRFH8gEi6qF1R0XmCxtIbKvEgMAr6uezGuT00a6T1rfpSRSTQEkdZ7YV
         Zcf51mD+q7ce4wZQFywwJFopx8kHEnIg7PueuQm0r5JCd4XvWNOj54vgLRrVz6aAU31C
         kThA==
X-Forwarded-Encrypted: i=1; AFNElJ88V2tBL5dh8JsBTXW04VsOY5j8Oh55jeCc//6V1WnyoEqGTt/Nu15SjzKknHhIm2VPHXdBTc77GZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyodxzuBIoTRkTOBqGZtIAWNBcnWYcCVJ2cO+m1GHWKNy/oNVmU
	nq6FKLZkEMy7bPk6Do24MSgUvK0/lUQMxiH2t+QTRXV2dincxGW2Bhp+xBclSbRDDP5mylxVTVc
	evfnPu+N7+QzZs1Bvnm2B2TuISbGueSfjj1pyQBx+crT0k01CTdrQNF0zRbpW1w==
X-Gm-Gg: AeBDieuzmkdN03x+qZgy5Kwur+dObCUY7mRH0mOa5xsLPxV7C8R9qDrrEQ/lxA343PU
	QEJKydZDWmzriYp3WhzUlNcO08Zdm0VJ6W3sEjGbgtNTSEl8vcreE8YLojGa7eN7tkzWFL/k5cT
	s73/5CvaMBQrcyDhTxGyiiy6EZJodIrsShNaADxHgk0j60jDAKGrhLvIX8FlWdfJWDqfSN/PrI3
	7WgAGJYbsIA25Y11+6k9q27PQn0ZukOoFxlntlpJwqfQtJ5H6Wn4OMW+n2kwMtHnMRQPiX5/k1T
	5yFBLmoJW1ehvApJ66yeiBdPBSIhPJkGy5TVTv71dwS0w1ujpeAPngY9SKQTE0s3QulWJ02ap/w
	HEveMAOL6daO2rQwckGl6vdte0IOVYfTbNQlm46GZ+nEsSYRw8WrVFjxD50G6BmRm0w==
X-Received: by 2002:a05:620a:390e:b0:8cf:cfdf:733e with SMTP id af79cd13be357-8fa88f2eb8bmr472410885a.32.1777558890146;
        Thu, 30 Apr 2026 07:21:30 -0700 (PDT)
X-Received: by 2002:a05:620a:390e:b0:8cf:cfdf:733e with SMTP id af79cd13be357-8fa88f2eb8bmr472381385a.32.1777558887094;
        Thu, 30 Apr 2026 07:21:27 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.27])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fba126652bsm695285a.30.2026.04.30.07.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:21:26 -0700 (PDT)
Message-ID: <deb31b99-a9d3-4e24-b645-071b71dfa4a7@redhat.com>
Date: Thu, 30 Apr 2026 16:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] dpll: zl3073x: implement pin operational
 state reporting
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Michal Schmidt <mschmidt@redhat.com>,
 Pasi Vaananen <pvaanane@redhat.com>, Petr Oros <poros@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428154907.2820654-1-ivecera@redhat.com>
 <20260428154907.2820654-3-ivecera@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260428154907.2820654-3-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/26 5:49 PM, Ivan Vecera wrote:
> @@ -1828,7 +1862,7 @@ zl3073x_dpll_changes_check(struct zl3073x_dpll *zldpll)
>  	}

Sashiko says:

---
Will input pin operational state changes fail to generate netlink
notifications when the DPLL channel is in FREERUN or HOLDOVER modes?
---

but such modes can not generate any real notification as explicitly
documented in a previous comment.

/P

