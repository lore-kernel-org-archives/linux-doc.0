Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099E472783
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060992; cv=none; b=dM4we3GJPiWd3TbNhzx1meuMXrl9lwOuQmuEowMDu7Cn08Gc9paWpjXAjkyONbgWn0ckP2nIfpoJfeS0csnw6rsAEd/pXw0YJAyUitXkQjN4LEiZctigMtWWWbp/FWvYs8fVk7eLOYMEGaYyzVvcIvNuymcNKuOyAw8tPnOC90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060992; c=relaxed/simple;
	bh=rF2Gpipf/QbXqAiccQMe4YVjy/JRYxwqoF1uwpKVApM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ej63xzraxjdwRLakYNGYC7mQ+psJo46NwUk0EppmKLgtsJxkTYkB+qCn2qB1cfxgpWJODti4X74EYMxdz0OI89mTKLk8Duq8+rf5Mf5GOw8fm7iBtPgbbsaIbRpBuqY1hgiboSIdX8kMEReXRMIiE7Lxn5QSUbsgOdl9uW4bfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B/uPAE+N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uKG3iR/0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/uPAE+N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uKG3iR/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775060989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crQDVEMNgZuDWbtP3Vrsa6F4kWYqeOFCExx6F21ipec=;
	b=B/uPAE+NA7//+E+ADZ9Ox1bGxC8W16femejHQPNSN6yJzancVsOLRfKjDjHEgoPTlOCCyO
	+/EkOwwLVSubTtp9wxRmfOp03CKF6z65+DHd4L/8QFWLz5Z+ROsDPydHdO9+1ZwOXNRAk1
	Ny0W04IRY1fh62bebnuQu16vLK95P4M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-rw2Bd3oaMXO6H0yIs4_scA-1; Wed, 01 Apr 2026 12:29:47 -0400
X-MC-Unique: rw2Bd3oaMXO6H0yIs4_scA-1
X-Mimecast-MFC-AGG-ID: rw2Bd3oaMXO6H0yIs4_scA_1775060987
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48889eae7bfso2024585e9.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775060986; x=1775665786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=crQDVEMNgZuDWbtP3Vrsa6F4kWYqeOFCExx6F21ipec=;
        b=uKG3iR/0naPvOat6MkwrV6vo6eWxAboYqZIvy8rBIpPP4j1bE8nlX077KEmIPr5bei
         N3cPpRW1bEGChpip/vvEmtPSuqQh1UMquotlHZNGJwdnok721cNfvtU5Fm12QkRf5KXW
         KXwkSKUwVgBmFTnHRVTSSff69YUhwUmSp+yZZWKGQPasEZ3pnLFV7y07VRZaVePvB2vT
         rOvtyJ1pw0GQWz0+kD2xLP77yPKOD5A0AYX4+ZNBbeFOaFI0yKy8aTmIIimuibbFxdjX
         zNSO1nW8JNGc7MbqpkR+opPwB1ba1eYTaZ9IKbTHppJ9hLP6JXA/OfG7zpZpDFYao/6R
         wnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060986; x=1775665786;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crQDVEMNgZuDWbtP3Vrsa6F4kWYqeOFCExx6F21ipec=;
        b=Adz/NXbYnYTeZVstaLiHkZR2eKgvPwF8AcG/HvWvLNv0B6Gspff6A5/QUiIqWqRHGi
         P05sPX9nhTtNrSeKre0wewFnQ9duZrPkICkIOPtYheQqxXgLcmxAlrybdDAilRnWk2Km
         ZAW8dT1P6VswHZw833gNXGlRBjYdmvdW+YccRDiJ3dRkV3GPwUrAAGBSEYThNU8WaCzI
         8du1Q0dQ+etcAl/tMq2maPHrmj/QHGcXa9AVmfvxo2dSBbfYtRPGT/29xo7wsiZS3S9t
         ibnDc6XEsUOZ7OGaYGLrp1aCKuSGiofQ96DM+yrvgZEOZVpfB0WzdD10qxfBkVka/soF
         yxSA==
X-Forwarded-Encrypted: i=1; AJvYcCWaT8rvFewOj00xWhvq/29aITFndjscTGtNcy52JNS50kGOo3W1WULlZ6ocFSmMh+cygIusWNBOOtw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw635PgzlfMC+bWPCNcP3rMcftqHlVlDPEDH/O6TiZ3FkdPDN0X
	JbeekBK9s6llbD9qP7KYft0gsBKFaZPD5O/SP98Ze9SZUYnTgrzD9SzipdW72Bz6I5+tb/+dT6n
	ko7Lahid8rMy+SQ1QIDhCXoYtcisAyEQ8rwRfw3dAk3SDTrwIGfH56v6Y+5a0WA==
X-Gm-Gg: ATEYQzzPmW+C+RU9wIiQ+mo/DSwxDpL4yXuUVb1dt+xkUhocrSKN0hwsX3zTJs5Jc/b
	oJa25N695qDk0vdeXAA2q7t/ShoX1ehumL+gJ7Amp5X0FyAeW4RDaKKARTSrIwlzZCdfE0KZi69
	qdxvCJ2yDDkyCwkN7D6rLhfKw00b2sg66fph9+3GiFY4ojGHjqFYW9AfrdaJRgzarUh6K1Lqnj2
	FlI5il3ah5iQrPNgwgQi2jcpvG8XN4i/tlIJ55uRcrMNW9a9tXJN9eaU8rzpHsDct6e7lhzuQxW
	wi/iegifD90oeK4RAEihC3FG05jamJfB0MQkTk2x2/GPiQnkQI/BEauysY8UExNULa6hfkbtCBw
	H9ftxUSaD2BlJnUmKz+uq5qS+1p58Fv+z3w==
X-Received: by 2002:a05:600c:524f:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-4888355df93mr73321725e9.3.1775060986403;
        Wed, 01 Apr 2026 09:29:46 -0700 (PDT)
X-Received: by 2002:a05:600c:524f:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-4888355df93mr73320895e9.3.1775060985641;
        Wed, 01 Apr 2026 09:29:45 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:11b1:10c1:fc96:ef02:f3ea:14e2:3716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93c014sm147639555e9.10.2026.04.01.09.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:29:44 -0700 (PDT)
Date: Wed, 01 Apr 2026 18:29:42 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org
CC: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Michal Schmidt <mschmidt@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Petr Oros <poros@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v3_2/3=5D_dpll=3A_a?=
 =?US-ASCII?Q?dd_frequency_monitoring_callback_ops?=
User-Agent: Thunderbird for Android
In-Reply-To: <ccb93d19-19a9-4dd9-8ac7-e0d41dbb884d@linux.dev>
References: <20260401091237.1071995-1-ivecera@redhat.com> <20260401091237.1071995-3-ivecera@redhat.com> <ccb93d19-19a9-4dd9-8ac7-e0d41dbb884d@linux.dev>
Message-ID: <CE3CDF40-CA7B-43A5-9DBD-A04FA37F4E57@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Vadim,

1=2E dubna 2026 16:47:21 SEL=C4=8C, Vadim Fedorenko <vadim=2Efedorenko@lin=
ux=2Edev> napsal:
>On 01/04/2026 10:12, Ivan Vecera wrote:
>> Add new callback operations for a dpll device:
>> - freq_monitor_get(=2E=2E) - to obtain current state of frequency monit=
or
>>    feature from dpll device,
>> - freq_monitor_set(=2E=2E) - to allow feature configuration=2E
>>=20
>> Add new callback operation for a dpll pin:
>> - measured_freq_get(=2E=2E) - to obtain the measured frequency in mHz=
=2E
>>=20
>> Obtain the feature state value using the get callback and provide it to
>> the user if the device driver implements callbacks=2E The measured_freq=
_get
>> pin callback is only invoked when the frequency monitor is enabled=2E
>> The freq_monitor_get device callback is required when measured_freq_get
>> is provided by the driver=2E
>>=20
>> Execute the set callback upon user requests=2E
>>=20
>> Reviewed-by: Vadim Fedorenko <vadim=2Efedorenko@linux=2Edev>
>> Signed-off-by: Ivan Vecera <ivecera@redhat=2Ecom>
>> ---
>> Changes v2 -> v3:
>> - Made freq_monitor_get required when measured_freq_get is present (Jak=
ub)
>>=20
>> Changes v1 -> v2:
>> - Renamed actual-frequency to measured-frequency (Vadim)
>> ---
>>   drivers/dpll/dpll_netlink=2Ec | 92 ++++++++++++++++++++++++++++++++++=
+++
>>   include/linux/dpll=2Eh        | 10 ++++
>>   2 files changed, 102 insertions(+)
>>=20
>> diff --git a/drivers/dpll/dpll_netlink=2Ec b/drivers/dpll/dpll_netlink=
=2Ec
>> index 83cbd64abf5a4=2E=2E576d0cd074bd4 100644
>> --- a/drivers/dpll/dpll_netlink=2Ec
>> +++ b/drivers/dpll/dpll_netlink=2Ec
>> @@ -175,6 +175,26 @@ dpll_msg_add_phase_offset_monitor(struct sk_buff *=
msg, struct dpll_device *dpll,
>>   	return 0;
>>   }
>>   +static int
>> +dpll_msg_add_freq_monitor(struct sk_buff *msg, struct dpll_device *dpl=
l,
>> +			  struct netlink_ext_ack *extack)
>> +{
>> +	const struct dpll_device_ops *ops =3D dpll_device_ops(dpll);
>> +	enum dpll_feature_state state;
>> +	int ret;
>> +
>> +	if (ops->freq_monitor_set && ops->freq_monitor_get) {
>> +		ret =3D ops->freq_monitor_get(dpll, dpll_priv(dpll),
>> +					    &state, extack);
>> +		if (ret)
>> +			return ret;
>> +		if (nla_put_u32(msg, DPLL_A_FREQUENCY_MONITOR, state))
>> +			return -EMSGSIZE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int
>>   dpll_msg_add_phase_offset_avg_factor(struct sk_buff *msg,
>>   				     struct dpll_device *dpll,
>> @@ -400,6 +420,40 @@ static int dpll_msg_add_ffo(struct sk_buff *msg, s=
truct dpll_pin *pin,
>>   			    ffo);
>>   }
>>   +static int dpll_msg_add_measured_freq(struct sk_buff *msg, struct dp=
ll_pin *pin,
>> +				      struct dpll_pin_ref *ref,
>> +				      struct netlink_ext_ack *extack)
>> +{
>> +	const struct dpll_device_ops *dev_ops =3D dpll_device_ops(ref->dpll);
>> +	const struct dpll_pin_ops *ops =3D dpll_pin_ops(ref);
>> +	struct dpll_device *dpll =3D ref->dpll;
>> +	enum dpll_feature_state state;
>> +	u64 measured_freq;
>> +	int ret;
>> +
>> +	if (!ops->measured_freq_get)
>> +		return 0;
>> +	if (WARN_ON(!dev_ops->freq_monitor_get))
>> +		return -EINVAL;
>
>I think pin registration function has to be adjusted to not allow
>measured_freq_get() callback if device doesn't have freq_monitor_get()
>callback (or both freq_monitor_{s,g}et)=2E Then this defensive part can
>be completely removed=2E

Ok, make sense=2E=2E=2E Will move such check to pin registration function=
=2E=2E=2E

Q: with WARN_ON or without?

Thanks=20
Ivan

