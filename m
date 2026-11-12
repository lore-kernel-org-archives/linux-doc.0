Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491200;
	b=KboWTRXNHigyjUfbWZ+W69Xhg8fnFVTBk3TPVRAcVH7sxJYBdG3FZYdYlsz3UN2yOGbW
	 /zdgAiF1x9Xh5bivoaVeywJqStLUc7d6tA7FzptP4HN0r63PJ5esHvRQOGexrg0kTTdpk
	 2wy3IBGW+jXNDQfkPl00ij5ytn1/WL4ZQfxAPrsGV/TCUTgN7mmPYxHiBx9wjRDwWOa2B
	 ETpL8idV0jnHNcl3IeAfJn0kpaTRznsuv7PwKprzaCPnuv6kFA8J5j/yNR/k/sui7dzAG
	 hyE+XQRo9N8u5I4HGt/D/4HRCKSY2FiWjAE39XGn9v3i8xlQpLCNTvLzhWDFJkG4bXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2yGUa3yvv9BwAmjth7xVSNIdT1WjubKlsaL334MWC0w=;
	b=zq7UT5NiibhMYBKKSanj0Aw64t+EFywJxuvMJACKvjtdh43zU2aRRYYs/51E3B4QWVDx
	 9w99NVHOMnVASIRqptojvvuj0tiOEIVlFgJXWEd5VfMuYFVKmP3BXXgSfvXIdgvzPNMrY
	 6hFSrW3ANsjBB87BS1o6iJkkS9tpakeqJdxX4MrPQWRJgHLzBpKSGZUO3XpsFrFTxsLRY
	 4+t1fvzEAr/FWF1U/o7CP23rxdIzOXJ90Z7EQuwLp3k8oWvRIU72YQGPTyBLjBVvf3hM6
	 WjWRZcL2eT3zG3yYNipBML2L8uJ/RI3ThWyfiEPsjIo9/5W7bcjJ5dwo3XSSdN4yqJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=M35LRWQM;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE70606A336
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 13:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE70606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=M35LRWQM
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50604721c8so399389266b.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1794491198; x=1795095998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yGUa3yvv9BwAmjth7xVSNIdT1WjubKlsaL334MWC0w=;
        b=M35LRWQMrNcnZaf9izfF5L/wkiTPEnRJx/eRvDaNfpJBY1/h8gufbYUi3BPcZnP1Lw
         HRdkM95xUNpJBGKuIaU6Bhhfne8TOE7e4ILfhaKOQdjLQgzvHBNNlxB7m5VVYJsSNS3Z
         GrpcAFxsgeIjvwJfpExEXIXU8qqqnkZbfq9uBetitGS/hAtMNNwD4wZ9idVIt8CMFKSr
         j2AYz6dKzOt9EkKi+QtL+R5jvl01hexjRgP2+JthKkfiYX8o+k6HLgCiuSss/UieWTfj
         F6rIg8nsIuhxJ5GxWoQz/LCKdn5i2YmFMoTyN8bU45Rhy/Kv3Nlm0pZnzHWbPWQfaERT
         bchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491198; x=1795095998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yGUa3yvv9BwAmjth7xVSNIdT1WjubKlsaL334MWC0w=;
        b=yEcE5QC0Zmi61Y9DcM5qP/Q+lSS3gMe7ng7igG7tpHLqI0ybqVaLDVjusNLf9mOL/b
         7ayYJY1gw5a+izgPaMfNqVEfoG27mKs8i59xzmYCyzAgA9/rfY2p3qlQ1xedvur0LjRT
         Xce6yBu2LThqJUvKT7vcR1yrXlyR3M1RifuhukHECKod0aX4Q1dCMs9q/aBUXMo5/+tz
         WEXsN48ICtcbAbKo65ecd50Pg1uMFTB50Hkamqwty4plD+btOW8VOFdSpfWv/CDP5CQI
         VFTO2zX2piMaWVLHPAUpU68ZYZaxQgoxJFLCjIoBk8lv5XvEiGf50AFbR+BNhmIzarNh
         +2Tg==
X-Forwarded-Encrypted: i=1; AL+hErFdX5TcCswn0Wox6Cb4ap0qmk/idAKoSTNXrKz7qdWlbH/+OHcvj8TsoDMHuamGFaWoCqZqmn/JiTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z83HbnvUOCOtKWwV7b9I/RVTcpSndQtc9PCCVtbCllTaBGfAuwz
	8FBzsvWNQ5YJrn97Hq/8W2M41zzao8KKzcWTAAhFv4UB1wJVfcnDZXJ2F+BFP3iIppU=
X-Gm-Gg: AYBFou2a4XJ6SRWlfUewynFaz26bhU5ksCLIq7v9xTZJyYp+qDyQJrmxHikMHOdINt6
	4YmoxQow770lomhwqY9dTpISS4gR4DZ44mFLTrE5KBYKmuEMNSvVBiBBbudimWSUuIMgzJ88auD
	AObUvFN5l0RWyc5rogN4JMlNhPeSLNWnaK4Nk5SncClRAMjbJidwp9WKYwyhCoNoeTrAvA1piTi
	8YBY4L+DMTROFTUV0LY3vpwgKq7zWhs8ZN9bNoOuTEYnhoTVwRVN/bO3WjErjy8kSe+zInOK/k6
	je0nepKIc2Wpv5AeRzZGoY1n2xHJoN2mfapn/Oj72K18R18yOGwKajdWCUbPmmjYDFE7i963fMW
	vZVMKv2Pgtx8AjK6qv4h+9ZWpciwx6d9dG19FjkSHZ5OSh904aQtbfOypONJ0uR9FZVfUA+/AZS
	CLeVIJVqKheEISbN3sn1fdEPEORZ8l5ldNdUZyMaWoy/fJYTi7Ivlzz4Pm73bTAHahKQIaPeauu
	VLk4R5AdS9ih2uc8yG/1kwe4zmj4jDlBW+BwrMXyw3oibJkCyiuZ70WUKD8fwLus+HVJkGSqRO2
	Aa5E24vR66JWV0ctbqUmv4a8ojTY8q4ko3+y3y5WwGG3IA==
X-Received: by 2002:a17:906:f587:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c5066ae249bmr493311766b.21.1794491198313;
        Thu, 12 Nov 2026 05:46:38 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm349754666b.48.2026.11.12.05.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:46:37 -0800 (PST)
Message-ID: <fc21d057-be4a-4cea-ab92-0951c4eb7de2@ursulin.net>
Date: Thu, 12 Nov 2026 13:46:37 +0000
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
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Gyeyoung Baek <gye976@gmail.com>, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
 <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
 <au31m2jC9SmQ6iZh@rock-5b-plus>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <au31m2jC9SmQ6iZh@rock-5b-plus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06/11/2026 15:44, Sidong Yang wrote:
> On Thu, Nov 05, 2026 at 11:04:29AM +0000, Tvrtko Ursulin wrote:
>> It would just be adding u64 drm_sched_entity_get_runtime(entity).
>> Nothing else would need to be exported and the implementation simply
>> locks entity->stats and returns the runtime. As long as the caller knows
>> they haven't destroyed the entity it is safe since entity holds a
>> reference to the stats object.
> 
> Thanks for the suggestion. If Philipp and Danilo are fine with it, may I
> add drm_sched_entity_get_runtime() and switch rocket to it in v5?

I am neither Philipp nor Danilo but I would say go for it.

Regards,

Tvrtko

