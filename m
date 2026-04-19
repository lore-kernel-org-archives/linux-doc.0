Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855D2E7F2C
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776637490; cv=none; b=dtajyVQpFHt2OUi3wNnOsG4PtlheImAsxOqFnDICAjhiuXyOqAaJ/kbPQNe8+EUlro6jdWHHgDQjzNI+M46oHReFrjFdckK7Dor9OgYuVuNOU+j6H5fHOYpTRd2r50rODSLodsg9mrwSFNG+xEnSMfqaI9tQJHqZw3h/samWFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776637490; c=relaxed/simple;
	bh=1r9FDFxtZWFXvFUP2I3cbR+qqs6c7Mcq/LA+asXQk/o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UxvMQ4FFglkLDoILzXJRoVnVTpPugs42v0wYhbmKKJKbfDXONys1NyeGaA0SyuYq8UBW3RyQK7SoqPIdrAWKl2zP79i0Yt0dcBK8hQYKs3UCCezTaLkr8g8tNQnM3j0A9JWrM9GYxr/BQ7u+4wEHmRocawO0jYqv9oMb5cbH/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOaoCUZf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOaoCUZf"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2224095eec.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776637488; x=1777242288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s5+BOCkksxieckItdNV9E7HptDSZAKtPJOnGq6abAng=;
        b=dOaoCUZftjHK1Sq+R3C+T/8fnnU3CFNJ3WOQQvBIN7FRkfzFxu5xXybqfnOfwk9rN4
         useyHvbK6w4dwfk217cZLfVCAAeh+2WSpPzz12ua1LbtJ34Zzd+D8+pj3ALC5QzSdD3s
         /SW8Rz5gwR7VRtEmIiIRhLwQzAGeWLpdjY50DzUEUBTvqaHK3T2qdxpek32a4aMbE79g
         +ke8wJbE+fBbLrgngkVIQSqgEkCNsEuJu3mMSaALI4+fx2BaVXfRuo763MyqzFRSWhD1
         GKmQmH/B0eBO9xJt/6d7dYolNccAqipt1nyhffACcTc9SPpjTekML+spSP+b7M78WHe2
         4SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776637488; x=1777242288;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5+BOCkksxieckItdNV9E7HptDSZAKtPJOnGq6abAng=;
        b=rRzlLb7nbRIDddKm80mCvnOvWqR+UT5zy21VcpRzjyk6L/SJ+OCyR5zTzvB0r0isqm
         gg3BOoxwAmob/jrVpqB5cME5yzxJlgqnLT7lePJpD7oHH1dWFviKhnhpTw7MEb5Rt0lR
         NTTriz+FO/HiJLnhNWhM53j/N8v2Nn8AAlcFVirWq/E36DsZCYdwXQOKqScrqFO+V2fe
         H5qSfUmeG9etqPqYGKLAcpVDL4YhzFmfsomA8Qb0m8iWzcIwBv/nMq96RRmhxggIuAG6
         3B5qsthpLCHtsAr7VC8biDHd5pYH7BqgVd7MvIQWFvUAq/isEmPZJMeTtYTVjDeY+3w2
         1bFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iIbGRVc3PR3wGrJG3lK8OGmJUZzOLb6lesA67+XbRBGcAyUGfQluGhtY/hVO6lvoOqevMyUhCEOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRrqqFhfmuWmdAmrDOHBiHS7uvQ77USUCIi/q0k6RDppkb3QqZ
	EQ7X5J4/llwYs8/yOOk3sPa1W/rxYCV2BdCNsx8Y0/MopXxCKGbK/gqP
X-Gm-Gg: AeBDies64eFrnxxTcJEx0kyOXrLQJ/pVBS4N63Gg10pxaucBdRtk/MKhwkfvuLlc+hZ
	3IqD8o4DVwiNXJjdk9xiySllspsA7CEw5BdMRMHoiSPPn6u3Pd7+PjpkgBcnjFFOCksPUc0BG8c
	jKCGr13AYN/Glz/Xt/9yNmx/v5TqVWjaJTAzsgVY/J34yBB9C/olAh1tCWTDwu9V+ekRKoAoQ1F
	w3xol+MqRGqInO5oGe5PlSlXQb56Sf0UOWsRVRbswifwLhoBm7x9OPVhEvUDrBU45CyeF0nk1O8
	8krlkBMEXOBVyEF+ZXcqxPvilAHBkeXxJpOwKlQpUitSpRU/t1JguVf6kG8Df9wytK25ABQACj9
	o8/d6XsfXWL9pm8IzShQNH5tsivGG8Ts9vQckSfzLOV8JYnp2kfNmLaLiQT+sD4mteV6xWUUwW3
	tYDdbyI8cnZ5GQO674hMEcnqZ+CJpI3vRY0CTyae+wLMlbhHNCgpS27GxYUvUHZWeSwHTJA0KuC
	qJwzONoXl1rC0ls0jNvVGlU5emiDc6t
X-Received: by 2002:a05:7301:168a:b0:2d1:815f:19c1 with SMTP id 5a478bee46e88-2e479c0427dmr4896278eec.15.1776637488176;
        Sun, 19 Apr 2026 15:24:48 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm11902032eec.3.2026.04.19.15.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 15:24:47 -0700 (PDT)
Date: Sun, 19 Apr 2026 15:24:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Ninad Naik <ninadnaik07@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org
CC: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_Documentation=3A_fix_spel?=
 =?US-ASCII?Q?ling_mistake_=22Minumum=22_-=3E_=22Minimum=22?=
User-Agent: Thunderbird for Android
In-Reply-To: <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
References: <20260419170835.347910-1-ninadnaik07@gmail.com> <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
Message-ID: <BAA4F3A7-E892-4904-95A6-64B177CDA7AD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 19, 2026 3:10:08 PM PDT, Mark Pearson <mpearson-lenovo@squebb=2Eca=
> wrote:
>
>
>On Sun, Apr 19, 2026, at 1:08 PM, Ninad Naik wrote:
>> There is a spelling mistake in Documentation/wmi/devices/lenovo-wmi-oth=
er=2Erst=2E
>> Fixing it=2E
>>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail=2Ecom>
>> ---
>>  Documentation/wmi/devices/lenovo-wmi-other=2Erst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/wmi/devices/lenovo-wmi-other=2Erst=20
>> b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> index 01d471156738=2E=2E1d0410500d3f 100644
>> --- a/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> +++ b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> @@ -144,5 +144,5 @@ data using the `bmfdec=20
>> <https://github=2Ecom/pali/bmfdec>`_ utility:
>>      [WmiDataId(1), read, Description("Mode=2E")] uint32 NumOfFans;
>>      [WmiDataId(2), read, Description("Fan ID=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanId[];
>>      [WmiDataId(3), read, Description("Maximum Fan Speed=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
>> -    [WmiDataId(4), read, Description("Minumum Fan Speed=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>> +    [WmiDataId(4), read, Description("Minimum Fan Speed=2E"),=20
>> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>>    };
>> --=20
>> 2=2E53=2E0
>Looks good=2E
>Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>

Hi gents,

The MOF spelling mistakes are well known=2E We've left them is as to ensur=
e match with what the hardware actually reports=2E

See: https://lore=2Ekernel=2Eorg/platform-driver-x86/cfd7977e-d612-4e08-a6=
8a-65fed8e164b6@gmx=2Ede

I suppose if we're going to continue getting these types or PR I should ad=
d a note to the documentation=2E I'll add that soon=2E

Thanks,
Derek

