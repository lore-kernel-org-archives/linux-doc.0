Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6F356759
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066435; cv=pass; b=KS/NUd7mXaTd82T8FF8GKmIAIYV/a/hSgcnqPWQUEPPVMabaBAx4exhMkZFCHbJWRxCXAi3qowLvnUYFeiVCVxMJdmf/ty3kjLiAyxzVbcz1qq8VoNoQdxW9xAN0jo1tCRppZaUm6T2XJpw+bvasIbKAFBefhzUs5OFZdUiAB74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066435; c=relaxed/simple;
	bh=vjU7rAU17Y+Ajkl7O8E6XTeIaV4BJn5MAyy2AaPQZhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sdll0PUSVduABoMbJdG9ySNB+yQkEUFN/AzmmQKYG6FWCHpfjkoDZ6H6QcTjSLzN30LTB8WEoSVQS2kyFBjZaH2ELlnD2ILozm5iIy3yDjRRnweJAKcyC4f/B361hQ7OJsGGyKOwHfr8bVniMArRZyKYxB2ERlh4e8ofYxX4Z2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXNeNNc0; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXNeNNc0"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2a818fc4so31689211cf.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 08:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787066431; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHw9DLY0JaID7Fxg8X+yXUHyg0PudT1i2bWt2MnH2HuQNev1n0vz09d92/Uh6pc1CC
         lWK2Ts8UG+r+MMmajhVTSf5ejPoWdisFmR6LvnR7vzU0KySvvf6VeBf257qBcHiOlfCd
         EQq/DQ/D/zooEnNkM0UhINdhTjAfjJ7t73P9dSwZiQVQ9nIVsYRI+K6pWSUJKVHejxUA
         fODNjaNx6SpZuLXiChdgURHIPm9C4YqyKK8vcAr/1rD/qkkkMHxN31vUJkY4jwL0/eWX
         SzFdXHD36xY8nkBGE5DMWITU1ibCZGfGwGbKh2HtaIcWp1KX0wle/Ktgbnrwy/yhKwok
         jrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qU8YMMf/nYNKPEmYXubnfHF/pa+Nrin9IzXXJguRCnY=;
        fh=bs2x9mlyo42itN80hlIvdfIkIkkQyEefyv7y6RN3zxs=;
        b=l42moiqd0Y5z7gEeIRBQUW85u7WMHZoyNgnidafExEW1rMILwURpoLwCNsxXAxsV+A
         EUFvlsS8cnZtHe6Apy455KWw7O5oZON06c7T2A7s/Rrx8nfEnxTauJmfzEe7AkEQY1Vs
         8Kpy1Q9tdrKwqRcabML2jD1Bawpt2ksHO+YR83mjZsavp1OoIELBrLB4q9cy4pqcpS50
         HlnV4rWUCqbc1TpcLKMtzcYR7xnBpCy8vCBSubQ1ULVW0cAktPrK5rouUSl64cMUaj+E
         vMLIz1gg1NmpbxxYOMVXVe7LZOeCejIPgVJbl5JvqO6wVZuSmiE+Pdn6J5YVEQ6dmFg+
         y9qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066431; x=1787671231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qU8YMMf/nYNKPEmYXubnfHF/pa+Nrin9IzXXJguRCnY=;
        b=BXNeNNc0iM/1TsFOTDco3wGWuZqUGIoHLQZqofVHEWRJiiUjW+MZk51+BnNWaEAc+H
         xmzoVhIAj9PhVqvuBLLSvFF5mcR8QFqMsyIE5NqBqOLc9TrvOACcoBJnF37f410f11SC
         m2v3pk7SuR3VRCSNsclth6HLcgnHv8ygS9J1K8na09y896NNhjlR+s/OwuNQquHQv1Od
         JZfta8pyKieZ+1rtC8Kb4Y+KHxFfMXwTPIYzcKb5aud+mIhvp4jNAS8uQXsI3N1m/9Vr
         Fs/Jx2ZNfUJA3vR27wNdsOVldsHE20NDHWOZD0jL1PGSz/J9F3ym9mdlSHkNyb56UCnH
         BxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066431; x=1787671231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU8YMMf/nYNKPEmYXubnfHF/pa+Nrin9IzXXJguRCnY=;
        b=mOVXPol4L9YbnNEXI8DQdveU/Ge15O9vPtlus6l7F/dY1twD6z6+O643RaJAYMswxb
         uE3WRSqvjxB2nAVQjnJe7QwSY4Fo5fLQW58AsAJoACFCt0ffhWQBL01aFVyyDqL/d6S6
         dyCGqeq/+jqLGYtWeLyS9dRUBDU6T8l9jn7iM/jKWZdCs8BwLDcc9L2adFNoVQ+UySxR
         BYrYl8dXkdWcWJmuiNGyqTn5NmTh44TCwJmV4ukFOpAw6kGm5w1njo0epsrUsmJ/IlfD
         PbfpBLL+TPm7Z8+reM23d4HX5+yUPaHm5JODtEmtOh94r4aU31jf6kDsOomvtoUZZA18
         bJBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7TlHmbeMDfKN3knMy+QBGv53AwKAQIR8HcQeLW3gCKDV1Mi3GyS8iDggg+JJp64MQx89eRuSEx4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0J1h8514cs9DmcmKFUL8q8m7hSVrS07Bn9jt1ZuuGpbpQHCz
	9k7DKC/IzW1sNivU0ekcQ5oao/ObF7JY/E8J4+kPaHDLDpGapAB6nZhkTUSLcYo9fcyomy+YqTP
	9Od1ElKYZ566CmgAAYmqVCqcPbYpk8cM=
X-Gm-Gg: AR+sD13KNVN0v8lHIZkmV1Vb8F2LPZ8SayqpFqNjT0at2NdQhCAhBN3tiyZcwz6zCGA
	JVBhLKjk7inWCpaHMOUBhTKOPxaWXq50qKtlExJxbqft/EErZXGoXnFVejvXKz07rYya0QzjJoK
	CQSemAPFyCwVTe7iAhYDFdEkH87KAR4UKtZiRgzEPx/ngkqe307Wy/3392mExxPJ/9eY64Z4e0Q
	+5Fk47bPpnkG2C9sJ3AKmA00Okb46AxyD9uwwMPn6iXLUI/+ZCepbn4WVFGyZaqXKfdtsco6AuK
	1stMorXqhB2b+ckeXZW2uyYcio452kZLZW7LoFoPHA==
X-Received: by 2002:a05:622a:2cc:b0:51c:94f:8ce with SMTP id
 d75a77b69052e-52d854ad1b2mr314761021cf.34.1787066431119; Tue, 18 Aug 2026
 08:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev> <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com> <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
In-Reply-To: <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 18 Aug 2026 08:20:17 -0700
X-Gm-Features: AcwNN1U7DN5Go1yIu40SK85tR1B_mrKqsG5brwcnRyJxEMMZy5vMLKSS7cQq1yE
Message-ID: <CAFqHKTkyVxAKUjjsuHi_+38hQw4n=crYPiPFcrQvdLw1e6qRcw@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: lkml@antheas.dev, W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com, 
	jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On August 18, 2026 7:42:40 AM PDT, Guenter Roeck <linux@roeck-us.net> wrote=
:
>On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
>> On Mon, 3 Aug 2026, Derek J. Clark wrote:
>>
>>> The ML patch set uses a guard within a switch case that violates cleanu=
p
>>> rules. Move the guard outside the switch so all return paths are covere=
d.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform=
/x86/msi-wmi-platform.c
>>> index dfb65ac8fbf6..33acd448f674 100644
>>> --- a/drivers/platform/x86/msi-wmi-platform.c
>>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>>> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *=
dev, enum hwmon_sensor_types ty
>>>     u8 buffer[32] =3D { };
>>>     int ret;
>>>   + guard(mutex)(&data->wmi_lock);
>>>     switch (type) {
>>>     case hwmon_pwm:
>>>             switch (attr) {
>>>             case hwmon_pwm_enable:
>>> -                   guard(mutex)(&data->wmi_lock);
>>
>> While I cannot see the code easily, one could also add braces to inside
>> the case to avoid this problem.
>>
>
>I don't see the code either, but wouldn't this be a use case for
>scoped_guard() ?
>
>Guenter
>
Hi Ilpo, Guenter,

Antheas has indicated he's already tracking adding {} to the guard in
his response to my cover letter. I agree with Guenter that
scoped_guard would be a reasonable adjustment to this change.

For context, here is the full switch case, derived from [PATCH v1
05/10] platform/x86: msi-wmi-platform: Add platform profile through
shift mode in the parent series:

+ switch (type) {
+ case hwmon_fan:
+ switch (attr) {
+ case hwmon_fan_input:
+ buffer[0] =3D MSI_PLATFORM_FAN_SUBFEATURE_FAN_SPEED;
+ ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buffer,
+     sizeof(buffer));
+ if (ret < 0)
+ return ret;
+
+ value =3D get_unaligned_be16(&buffer[channel * 2 + 1]);
+ if (!value)
+ *val =3D 0;
+ else
+ *val =3D 480000 / value;
+
+ return 0;
+ default:
+ return -EOPNOTSUPP;
+ }
+ case hwmon_pwm:
+ switch (attr) {
+ case hwmon_pwm_enable:
+ buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
+ ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_AP, buffer,
+     sizeof(buffer));
+ if (ret < 0)
+ return ret;
+
+ flags =3D buffer[MSI_PLATFORM_AP_FAN_FLAGS_OFFSET];
+ if (flags & MSI_PLATFORM_AP_ENABLE_FAN_TABLES)
+ *val =3D 1;
+ else
+ *val =3D 2;
+
+ return 0;
+ default:
+ return -EOPNOTSUPP;
+ }
+ default:
+ return -EOPNOTSUPP;
+ }
+}

Thanks,
Derek



>>>                             buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FA=
N_MODE;
>>>                     ret =3D msi_wmi_platform_query_unlocked(
>>>
>>
>
