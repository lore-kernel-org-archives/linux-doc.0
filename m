Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECD91A23A9
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922212; cv=none; b=cidMMD/U97VemuKKJ7HMG6lxrB/R1DNW2YT3o3kq4Od6V5yU6Vayn5M9KdPypZU3Tm+V7vONk9QQ9/G0vYoGTQEFLxRXExVBfGY+xhh3LjlMdD7adbWC3E7NfsD7HrPO8X8CpQaRlNEQVINHf1d0oA7dM58xencsiQXR+/6JD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922212; c=relaxed/simple;
	bh=sOY2kFDW33/BRh+MEzer2ByrCTgaNH+zA1QI+ZZkVOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZEfrhzFjoqNPKekWBFM2uMdcmnP1zNz7znCl2SX0g7iKAnJSYhwSIfXL9wCYuC6GZpzNzmYEfBA2YMB2naqEpD6T9CEa5V1Rz85lBflN6OkdDLlSLp+upris4v5xS5EGyu1JxFF+PlM1tXF6NGwfoz56q36wLs71eujnzDodmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+XEKTyi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+XEKTyi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f3c119fe6so36607005ad.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 01:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738922210; x=1739527010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Exga45H2FnDutfFTiSCK0v56XI6N7GntTAl2l2gj+XQ=;
        b=N+XEKTyiHLSYNJQN+mM3Z6hLnp5/u0yHj2k2KpkRyXRZjjSGVEXVNhBNM1KLGDOdia
         H93yPL7iEGL01K0/RSPBC+02FDa6zO5gAAmFHWshx3sN34/Q6rTxHkRKgiSfEtf4sIH8
         0S0zCN3y2/3UtOOOXNrCY9QVIOlQOcAWz11/K+YLItC1+5c7V3MbpjVbx3f0V0SZESg5
         n4TYG7GD4E2eXTMQYDZauuwufSljevN2OhSJ6quC+cLt18e8Er5U50VcAapgQiKDqYEW
         8ozMI7xSB6pFMOYRj6zV2vCsnPwrHimeB4ZqQnfsJq8y7tZA8Le0/KqkuaCR0m1c/5lE
         uJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738922210; x=1739527010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Exga45H2FnDutfFTiSCK0v56XI6N7GntTAl2l2gj+XQ=;
        b=MqUy3m8trSJOG/rDuen1CrWB2e8pL43Wheu4irXfIXC+F/aA7bFMA8dhm+It5Rp2eU
         SVMAIegJ7yHzyyIM0SL2iHpg36CEssqYBfx3plit6O/uafcfXHq/Arp/5CE/zD90+ON7
         nYDFpP4a6KTTf7e6cQGLUO4JmaOJmWUf1CxGyVL/Pqj00jG68UmchSA2oZeJlorg0Nzs
         BZQWBJLPcJ29AauzUEJV0+jJxsSy845r6C0vFnHkh2U3gq+etZu+60sv5s7rSb52kD44
         GtCTO4MNpQDHZfpxkKeicg4Faz6nuU2pmFqAyOGdF0CSalHoMgNajIELY6crrSVn2Jd6
         9yew==
X-Forwarded-Encrypted: i=1; AJvYcCUCVei6lV2qNmLxSx3CNjPPnzW9DApZAR4QR86CPDhs27IG++HmICT0LTsvihPwiC/IZyvXxp1ZjKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUpQ1Xob1Rh8sYTb1pAHATphcoxdlFE+vZYGf5sYj70yT4rqB/
	h8WLyhWuZOqU5wE9De0dOr4qbRHXW7AbYCe9JBQvn8GdbasGiy2i
X-Gm-Gg: ASbGncvEKUANgXRekXWMwA4davN4wMnByDwHpmqsf3dMhbvI6CFWs1UbjtGbsR4MMmE
	80OZrPNtVYE5jozbSCQgzR40NODv0qJ5QoIZ0XYbc2mE90rSAiXOK1xzaXLzqIzPW9DcGQnBYER
	Z37FIF8exX/2066Cy1NOE/mc/GKuanddmgR5muYBvioPls9TZl9g7rAjxu7/41h0SxaMnRx3wDt
	o9ZIhhpaMcoTujd1rYyYQXeXALGL9pRS7IK7nXezbLXBiLpBTkwZrekmBVK+hDK2OVG+VPVuivF
	CU4oOPsKUWelIUy2GrbwdPBtY7Pwd2HFSH3++6bRgdwC3oq93IWAcDgeDfE5Qw==
X-Google-Smtp-Source: AGHT+IHuRMKxyySQlrv/16WSvroYm0bB5FIbZZ9b1PvE9k3/JDlZ7espZzBlnx1bnAUKD68RKppibA==
X-Received: by 2002:a05:6a00:4097:b0:725:ef4d:c1bd with SMTP id d2e1a72fcca58-7305d4f0d6amr4318326b3a.19.1738922209801;
        Fri, 07 Feb 2025 01:56:49 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c16222sm2682171b3a.135.2025.02.07.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:56:49 -0800 (PST)
Message-ID: <70309126-c915-496b-8be2-97ca3d1d369c@gmail.com>
Date: Fri, 7 Feb 2025 18:56:45 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/ja_JP: Convert SubmitChecklist into reST with
 belated updates
To: Tsugikazu Shibata <shibata@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250128102805.112691-1-akiyks@gmail.com>
 <CAO+cJp3JUJfumofwy3i5oE9Bp3DvsL6ULt5_EEvQmaSBt3Fekw@mail.gmail.com>
 <de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com>
 <CAO+cJp1+ZtQgy4JoV4jvyPBf8HDUPtnHE6OGkS0Wc7j=rV4smg@mail.gmail.com>
 <b07a56c1-8b4a-4f35-b94b-095305c1f458@gmail.com>
 <CAO+cJp3M-+UDtxLBpn9R1yRwS=iKVW=3r9HymR9No9PmoDUcYA@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAO+cJp3M-+UDtxLBpn9R1yRwS=iKVW=3r9HymR9No9PmoDUcYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[-CC: Randy]

Tsugikazu Shibata wrote:
> On Sun, Feb 2, 2025 at 8:27 PM Akira Yokosawa <akiyks@gmail.com> wrote:
[...]
>> Thank you for elaborating.
>>
>> So, you read authoritative tone/nuance in my translation.
>>
>> Let me see ...
>>
>> You suggested a change from:
>>
>> +1) 利用している機能について、その機能が定義・宣言されているファイルを
>> +   ``#include`` したか。
>>
>> to
>>
>> +1) 利用している機能について、その機能が定義・宣言されているファイルを
>> +   ``#include`` すること。
>>
>> Actually, I don't see much difference in the nuance/tone between them.
> 
> First one is a stronger question than the second one, I feel.
> So, the long list of stronger questions is becoming a pressure to the
> developers.
>

I think we need to agree to disagree on this.  Given the context of a
checklist, I still don't see much difference.

Anyway, it is not worth bike-shedding on this.

>> 「〜すること」 is sometimes used to indicate authoritative ordering.
>>
>> For example, "You should test both of cases A and B." can be translated into
>>
>>     A と B の両方をテストすること。
>>
>> , and this can be translated back into:
>>
>>     I ask you to test both of cases A and B.
>>
>> , depending on contexts.
>>
>> Instead, if you just say without 「こと」:
>>
>>     A と B の両方をテストする。
>>
>> in a list of what to do, chances of such an interpretation can be
>> reduced.
>>
>> Do you prefer this approach?
> 
> Yeah, This looks better than my opinion.

Nice!

> 
>> Following diff (on top of patch 1/2) is my attempt to address your
>> concern for the first three items in the checklist:
>>
>> Here, I changed each sentence to have "patch or change in the patch" as
>> its implicit subject or "主語", and describe its preferred state.
>>
>>  コードのレビュー
>>  ================
>>
>> -1) 利用している機能について、その機能が定義・宣言されているファイルを
>> -   ``#include`` したか。
>> -   他のヘッダーファイル経由での取り込みに依存しないこと。
>> +1) 利用する機能について、その機能を定義・宣言しているファイルを
>> +   ``#include`` している。
>> +   他のヘッダーファイル経由での取り込みに依存しない。
>>
>>  2) Documentation/process/coding-style.rst に詳述されている一般的なスタイル
>> -   についてチェックしたか。
>> +   についてチェック済み。
>>
>> -3) すべてのメモリバリアー (例, ``barrier()``, ``rmb()``, ``wmb()``) に、
>> -   その作用と目的、及び必要理由についてソースコード内にコメントしたか。
>> +3) メモリバリアー (例, ``barrier()``, ``rmb()``, ``wmb()``) について、
>> +   その作用と目的、及び必要理由について説明するコメントが、ソースコード内
>> +   にすべて付いている。
>>
>> Do they sound better/acceptable to you?
> 
> This looks good to me!
> 
[...]
>>
>> So how about the following?
>>
>>   4) 最低限、slab と ページ・アロケーションの失敗に関する誤り注入
>>      (訳註: fault injection) によるチェック済み。
>>
>> This still diverges slightly from its English counterpart of:
>>
>>   4) Has been checked with injection of at least slab and page-allocation
>>      failures.
> 
> Again, Looks good now.

Thanks.

I'm going to prepare a v2 patch of this translation, hopefully within
a week or so.

Regards, Akira

