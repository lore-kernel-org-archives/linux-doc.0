Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF7364059
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036147; cv=none; b=XC3EIeU5oaH3rg0+jz5hzcA7dMdLVr5NZT1OZC338FbTfBIMMR+Vwf1Xyj36A0evo7CzooCk5S1q1ovb0ME7ykz8/IW702TAOWB+bkEPWZQSad9XTFMlOwUanlxJBkwAOjckRID0jRiio2gIz+Y+x73Kz6876/7dEpVY3JYcX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036147; c=relaxed/simple;
	bh=6hRNj5U5LHXK7bTyvRwzyPiI+ao/2UL0HBM81PAHajM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBLHZa03OWwtbfhDQq8bBBMh4PKGZA36Yaf7gwL83JjbZgVPxmRgBB5HpJZRG+3eOJh3r0T9K3xSkSLR1tVE+TDhnc07GXS7wQnT09zEmB6xckDFjx3Lm7/g9ck7RO2i5jofwAr2hjN7Y6qgdIOd7qv8YqknKEFPEeZELstbpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=G2pLPsTG; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="G2pLPsTG"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6aae36ea5c4so1612677eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786036143; x=1786640943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLsWRBhfzXCtfwMjhcYY+QYQpCsTl2+rExgA5K9laCM=;
        b=G2pLPsTGzHib99otyS6YPI1EDVKK5lDemxjg5hBoOWGH+SdHBVPfuWb3dcUXLXhfuz
         sRC9FBQFErtV2DWJEfxWVtDXSp++nb7ZY+rPViF4BxMkZwgxKRLf2J/BsQzyoSHKw4qt
         /LLCOB6DXjSsFlQKwC3U4Zty0vUjTEyU7JYVO5OCUDBBAi9u6H/1uE4+O5qkVNpCOc+y
         7uqYpQe6hx1eYf2yC7wxN1hg/WKrXdGxMK9E25MYHUKGNyckCxQoNZXX9bx7tqvQ8L3V
         Rpz49Dg+mHU55iHudysgYqHZAJs40Si4BRrm4PIpXpK7PZvMtnDqJhHVwO2lkfTblKGq
         m43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036143; x=1786640943;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLsWRBhfzXCtfwMjhcYY+QYQpCsTl2+rExgA5K9laCM=;
        b=o0bPEdToTf5Y4F4gP19XhwpE/RFDAYn7I/aStUhWzhzZj569rLe0M7UrEb25pNvSzO
         I98MKiii2Nma7y3qyTZ/pryaAeS+XDaLHTNFXGjVHTeihDaUkCvfFFKHxcDVq6jOqz8r
         aCk/7DM4woObwiDWqT8KEbqASUJSh3SMmiLo+Kkupf1ZQ1telKOWng4PN236aIC/lCPm
         DwLzoG3/zqbiJReo5jBDdPpHNtOu4w56pUV3A3cw2NC6P1xjnBXC159Ls1c6XFWt/9t2
         maIM73BXGgLbwVFXpqmVl/bWKj2q+awBidbhYGnAX0j8p1MUeIAbs7ICx5wzxq6AmIL3
         0IFw==
X-Forwarded-Encrypted: i=1; AHgh+RrbsP+FnijDsHkaT0lOlEtFA1igU0TP7O1pXBQyvRQlRMLZtTSKjORNOqgXtYMtq5qpgwCW1af3HOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOzzOh0sXUcvEobjiphuNQXRp4uAbyulY85IbnTRcV6uVONol
	tiSoc3l6jSFWH81qbfd5+MxN7OeBB25Z1nckKFNxgoHeMdeMTMR4YWM87d86Ws4Ipmw=
X-Gm-Gg: AR+sD11yvhkBaH//NXtVNcuU8PkGR19t+q/Z8tmRUCMIPiqgmVIa6Rkd0DCyGFW3KW6
	ttgdiGxl8ZO+9iNdMRjNlz90T/ocoWtnbOAKA78K7Li+dvqyfHBzh/mrVLwsV4u/Q1+pulN2rgD
	z6pnoF915mtRzOpRUvq+CrVGH0jLRXhDp5GZNYG/3F5vKFsGvURKo64sQn/NNPai2xUUT2uOvbX
	WslUqWQM1p1VXX9VJ67aAojEP1YW5fCb2kzwblybb+oI6FoKIzCNtkLIEH2YGsHki2fcVAqZ/ZA
	pLjC5qRiGA9sAPN+gu/w7pkWu1j1LSpAckgCTkvwDNTj13cpT17KxZxU/IDh7svMiirtE+h/1vy
	ObrOmMjJpxXuBhBV9iENjR9x397TUpUt2f2HKlrWUcTcJvDajBX3Gwc/wHJ4PZ46T40Sib1yQ5g
	dKjK27Mbc3X1OG/w0tQpmrShId0bQ1NZDWFxz/jYwR249aYDva97Hmnr4RZIp9tStpHkfNidw4b
	TtRaeIJZJQIggL5Kt66bv98SpA=
X-Received: by 2002:a05:6820:1519:b0:6aa:edca:e171 with SMTP id 006d021491bc7-6ae96ec790cmr7787359eaf.19.1786036143494;
        Thu, 06 Aug 2026 10:09:03 -0700 (PDT)
Received: from [192.168.86.29] ([47.232.46.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93d9aec6sm6272448eaf.8.2026.08.06.10.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 10:09:02 -0700 (PDT)
Message-ID: <d889d09d-951e-4414-95bb-625bcab7af9b@oss.tenstorrent.com>
Date: Thu, 6 Aug 2026 12:09:00 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: hwprobe: export the availability of vector to
 user
To: Florian Weimer <fweimer@redhat.com>
Cc: Andy Chiu <tchiu@tenstorrent.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, kito.cheng@sifive.com,
 dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Nutty Liu <nutty.liu@hotmail.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, Xu Lu
 <luxu.kernel@bytedance.com>, Aleksa Paunovic
 <aleksa.paunovic@htecgroup.com>, Jingwei Wang <wangjingwei@iscas.ac.cn>,
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-api@vger.kernel.org, Jeffrey Law <jeffrey.law@oss.qualcomm.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
 <20260723222109.2229089-2-tchiu@tenstorrent.com>
 <87bjbwk0q5.fsf@oldenburg.str.redhat.com>
 <cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com>
 <lhuik5n4v57.fsf@oldenburg.str.redhat.com>
From: Peter Bergner <bergner@oss.tenstorrent.com>
Content-Language: en-US
In-Reply-To: <lhuik5n4v57.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 1:31 AM, Florian Weimer wrote:
> 
> And if RISCV_HWPROBE_KEY_IMA_EXT_0 comes back at -1, we'd turn on V
> unconditionally?

No.  The unknown key (RISCV_HWPROBE_KEY_IMA_EXT_0 in this case) field would
be reset to -1, but the value field (which is what we test for the presence
of V and other extensions in the resolver) is set to 0, so we would not enable
any ifuncs in that case.

In the "new" case we're discussing, we'll pass RISCV_HWPROBE_KEY_EXT_ENABLED
and RISCV_HWPROBE_KEY_IMA_EXT_0 to hwprobe.  For kernels that don't know about
either key, both key fields will be reset to -1 and their value fields set to 0.
No bugs in this case.

For kernels that know about RISCV_HWPROBE_KEY_IMA_EXT_0, but not the new key
RISCV_HWPROBE_KEY_EXT_ENABLED, the key field holding RISCV_HWPROBE_KEY_EXT_ENABLED
will be reset to -1 and its value field set to 0, while the value field
associated with RISCV_HWPROBE_KEY_IMA_EXT_0 will be set to the "extension is
present" value.  This still suffers from the (already existing) we'll enable V
ifuncs issue you mentioned if prctl was used to disable V, but as you say,
it will be fixed with a kernel upgrade.

For "new" kernels that know about both keys, the value field associated with
RISCV_HWPROBE_KEY_IMA_EXT_0 key will be set to the "extension is enabled" value.

Peter


