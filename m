Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881C21E097
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127361; cv=none; b=Kgwh+NMgmQZ2YoZ+FrUItIL8ZwZ3KQJDhh+rfCAua4hvfUIuLMaC6UlEQqtNt7u3aNUPAfERR0PK9NaODIAp3ky5WRVxxSpr0Sa5I1lzftn30bmanRYZn5WhCyh8JHXShygIiFoXu9T9s1NsP7wKn1BwL7aIdpTn7yx3TBm11u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127361; c=relaxed/simple;
	bh=qw95CvdMmCrTiI2QSJae3SJp8u12cU/mjgFB23QBOoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4XLHLLQUxyt6Xvc1aSvehsXQl13HdBNveUo+kUaijxhNs0PCgLQdgHtlLtkP308xzxerZhCWY6g0dgGGRFVUG+JCjm7qZr18lYjq4S6CYx/5sWo5foWWrITr0AoMVXpcqQoNWuZMfV4pWnKzzZYFxosWyJvb7S1EbzPMFzs7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQ2p+2be; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQ2p+2be"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1758462b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127360; x=1763732160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scABYrWfLMryk0p1vRaa9SSZUmq5nZBEo0AWWVBIqSc=;
        b=DQ2p+2be9AWQGD60U6Q17k9HcuEkVUYxHEDoAB4LADRrYiKP/C33MOCV09Jpfpt29Q
         TfjeIPJeTSbKWDN+3QMOTwLj/FIUTIlNu86IFN9CWzjXAEFoH5w4go8A5roOOza/GiPr
         64NZOFhVFKEjkkoJ6Z/RZiukpZS3dQfi2qzbbWfgpgIu+Qj//7x16c9+/aRQ6UsBjrPs
         FD+ubYsibSzbP5IFywqne5XnFxPmCaJuZWB0q+ACfbkLgMW3me/2PnwlPe2x6E+mOhfD
         bvmYlW1SF3WitdHVb/adqjbTMJg6+yNKCmQx+flFFKulaDH8bnFOT/SsuHbYbABlV7cy
         zKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127360; x=1763732160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scABYrWfLMryk0p1vRaa9SSZUmq5nZBEo0AWWVBIqSc=;
        b=pFBPmWnDK5nDY9MrAuBOwOMG219WCy52EJt08a/cowTeDkoWomfHJ8VrhT4qUm1Bl1
         chD9RSLllMAs3dunAQYTl0J83XLH0xIKqc1YM6GVBUAlv/we+w2xDk7J8q1uoPU3X6QP
         Twl4++qRn0obPwIAV+0EI3JK9keSpZRAba00QJzc93KIePYmzpz/JG//uoLDhSNskCab
         Amo98oKWn931XAQ3lsAznlMm9NW+z1qGmgzWKNIlwDbNlJdb+yX5lpKLSM9j+8/NkDct
         DTiblXKX2aNWB91uaofJehcKY/WboXANuh5/Idx70o0e9n1POlFXVP/puhJTDwTCShp0
         6V7w==
X-Forwarded-Encrypted: i=1; AJvYcCUg4YD/gVY1L2zbjIl1obTAlvbfPsNiDPZyvMInd6pyfTtMA+XuESEkO47K+zV13Myg0TfNpJVDAB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb02pu43qHLhgViFndJbOSn9+9NjXF/Gq+eCUU+2BRl7Pw8QSM
	CdUu2Rw88tAo02XeFU/GGN8U/ZIAql47a6osF2kQBixaUq8F6zpHrC0K
X-Gm-Gg: ASbGncswFA/sEP7O03CeDRoDApU1cBllk41AQAiSbwchh0wC1THo+baKqJHSyAUjSkC
	A6sGs5dpQ4UNc7OsaNVubpd+M8CEctipbt7ECWm7+Xz4rawZ2dCyqU/MaPSnHlK2VKKxgtXq++L
	pbhm11XDnkbtmy6I8FcOx4cXDTdzdgxxjLDjLpUIdqxCJQQhpeaFEtfKaUMnEPB3InJ620A5all
	zhY0DddCHDsftRzezVPDaPDzy4TTeEI4iHtwPZNOjJN/pk+rRUnJBwJVPWrQUbmnXcvL7gwVZlX
	BVtN0u+3VnNPxLxjdYsPvUe4XHNV0lLbtgZXewllJ8ZYcpXyUO242KELYa+fLpSl76vAs4oPs9M
	tQBAm6nm9z8mB2hWsIz07ObQG1CK3U0aNfwKvlw6j4N3p0iJWUwO2P5gj3+mVLn+lRRDiBPMap4
	6DLPeXjfJTE7AH4i0kXg==
X-Google-Smtp-Source: AGHT+IHwhy1vTerg5Gbcyy0Rh5fn/eKlAsIHslT76ScI3eW0anR3tnZ2sM336zTG90LT4R0w1+j48g==
X-Received: by 2002:a05:6a00:2408:b0:781:4f0b:9c58 with SMTP id d2e1a72fcca58-7ba3c080cf8mr3820686b3a.15.1763127359646;
        Fri, 14 Nov 2025 05:35:59 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cda04sm5245361b3a.19.2025.11.14.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:35:58 -0800 (PST)
Message-ID: <99c99fda-a3ab-4575-89fa-8d2e6a3ba4ab@gmail.com>
Date: Fri, 14 Nov 2025 20:35:52 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
 andersson@kernel.org, mathieu.poirier@linaro.org, dan.j.williams@intel.com,
 cedric.xing@intel.com, pasha.tatashin@soleen.com, kevin.tian@intel.com,
 skhawaja@google.com, yesanishhere@gmail.com, taimoorzaeem@gmail.com,
 linux@treblig.org, arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 rdunlap@infradead.org, imx@lists.linux.dev
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com> <aRcEoX9saonpQuvf@archie.me>
 <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 18:33, Daniel Baluta wrote:
> On Fri, Nov 14, 2025 at 12:29 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
>>>     This document describes the rpmsg bus and how to write rpmsg drivers.
>>> -  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
>>> -  (also a resident of Documentation/).
>>> +  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
>>> +  (also a resident of Documentation/driver-api).
>>
>> I think "also a resident of ..." can be dropped, since it's redundant (it's
>> already covered in remoteproc.rst cross-reference which transforms into
>> the link when you build the docs).
> 
> My point here is just to move the patches to a better location without
> any crucial modification.
> I can send a follow up patch if this is fine with everyone.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
